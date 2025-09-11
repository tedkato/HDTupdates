
/* 20220511

[11:48 AM] Cyndie King
There have been several tickets where you're setting the TISA to zero and making those funds available in the LOC and for the most part they're fine. 
However, when setting the TISA to zero on Modified Term and Modified Tenure loans only the NetPL increases, not the LOC Reserve nor the NetLOC. 
Term and Tenure loans have no TISA nor do they have an LOC Reserve/NetLOC. Only Line of Credit loans have NetPL, LOC Reserve, and NetLOC increase.

--
[11:56 AM] Cyndie King
Use this: When 'Line of Credit' then A.CURNETLOC + A.CURTAXINSURSETASIDE else A.CURNETLOC end.
[11:56 AM] Cyndie King
Only Line of Credit loans have the NetLOC increase.

*/

/*
[5:51 PM] Cyndie King
There are several fields where the value is BLANK instead of carrying down the value from the previous row. 
CURNETPL, CURTAXINSURSETASIDE, NETLOC. Please correct your script. I have corrected the loans.
CURNETPL, CURTAXINSURSETASIDE, NETLOC
*/

/*
20210224 ... HDTTISA_to_Zero_Template.sql

-- Cyndies instruction ...
This is the SQL for setting the TISA to zero. The tickets will geenrally be titled UPB or LOC Change (Balances). 
Also, the tickets generally contain the texts "LESA Shortfalls" and something like " Please move the available TISA/LESA funds to the LOC for the attached loans due to an expected shortfall." 
or they may contain something siimpler like "Please set TISA balance to zero." or " Remove TISA" 

Examples are tickets 78845 & 43182 , 74919

This will fail if there are duplicate loan numbers in the list. This is rare but does, on occasion, happen. 
If it does, simply remove the duplicate entry - you can't set the value to zero twice 

Table DATAUPDT.FORCETISATOZERO has been created and consists of two columns: Loan and TicketNumber. 
Empty this table prior to populating.

Generate the note prior to setting the value. 
Loan note verbiage: 
Per HDT DATAUPDT.FORCETISATOZERO.TICKETNUMBER TISA balance has been forced to zero from $$$  Where $$$ is gleaned from the most recent transaction on the loan
--

-- HDT 78845
Loan Number	Set Aside
1285012	8308.09
1353776	2114.5
1285109	1964.01
1355674	2962.35
1244567	314.68
1285498	12.71
1244884	1195.14
1400426	3768.46
3122843	425.58
1353846	2002.53
1287653	4772.49
1288140	1694.07
1292131	3911.56
1400494	12859.42
1354227	10047.43
*/


/* ****************************************************************************************************
="(" & B1 & ", 0146219, 'Celeste Cantwell', " & A1 & ", 0.00, -99.99),"  
="(" & B2 & ", 107085, 'Randi Werner', " & A2 & ", 0.00, -99.99),"  

(1, 135420, 'Celeste Cantwell', 1226302, 0.00, -99.99), -- when -99.99, current value is not presented in spread sheet ... ignore or replace after run My Value
(2, 135420, 'Celeste Cantwell', 1262269, 0.00, -99.99),

-- comments
1 transaction posted, Set Asides radio button updated to none for the loan. Peer review pending.
8 transactions posted, Set Asides radio button updated to none for the loans. Peer review pending.

Done. On Hold pending verification.
If the data is satisfactory, please do not respond and the ticket will be closed after a week or so.

5 transactions posted.   Peer review pending.
1 transaction posted.  Peer review pending.
TISA has no balance for Loan 1244819
******************************************************************************************************* */

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------
-- HDTs

/*
20250909
199014	Ted Kato	TISA Deplete & Radio	Celeste Cantwell		Low	9/9/2025 11:40
1	="(" & B1 & ", 199014, 'Celeste Cantwell', " & A1 & ", 0.00, -99.99),"  
8 transactions posted, radio button updated.  Peer review pending.
*/


---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT,
	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
	DTMTRANSACTIONCREATIONDATE, IDSUSERID,
	CURTAXINSURSETASIDE  
	--, * 
	from celink.TBLTRANSACTIONS 
	where INTSUBSERVICERLOANNUMBER = 1244819
	order by IDSTRANSACTIONCOUNT desc 
for read only with ur;
-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID        CURTAXINSURSETASIDE
-- ------------------------ ---------- ------------------- ------------------ ------------- -------------------- ---------------- -------------------------- ---------------- -------------------
--                1249180.0   46152436                  91                101             0 Active               2021-03-31       2021-03-31                 BATCH                    1703.250000
--                1249180.0   45570825                  90                101             0 Active               2021-02-28       2021-02-26                 BATCH                    1696.230000
--                1249180.0   45523745                  89                105             0 Active               2021-02-26       2021-02-26                 cking                    1689.590000

select 
	 * 
	from celink.TBLTRANSACTIONS 
	where INTSUBSERVICERLOANNUMBER = 1244819
	order by IDSTRANSACTIONCOUNT desc 
for read only with ur;

------------------------------------------------------------------------------------------------------------------------------------
/* -- DATAUpdt table 1 ... Cyndie already created 
CREATE TABLE DATAUPDT.FORCETISATOZERO
(
LOAN DECIMAL(18 , 0), 
TICKETNUMBER DECIMAL(18 , 0)
)
	ORGANIZE BY ROW
	DATA CAPTURE NONE 
	IN DATAUPDT_TS16
	COMPRESS NO;
*/
	
	 select * from DATAUPDT.FORCETISATOZERO;

------------------------------------------------------------------------------------------------------------------------------------
/* -- DATAUpdt table 2 ... contains ... SeqNum, Requester, Gien TISA, Curr value 
-- ="(" & C2 & ", 78845, 'Jazmin Anderson', " & A2 & ", 0.00, " & B2 & "),"
create table DATAUPDT.HDTTISATOZERO   
	(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan integer,
	NewTISA  decimal(16,6),  -- always 0.00
	BadTISA  decimal(16,6),  -- often time provided in the spread sheet, also often time NOT (just use -99.99)
	CurTISA  decimal(16,6),  -- tbltransactions.CURTAXINSURSETASIDE
	PayType  varchar(50),
	
	ChangeRequired integer   -- might not be used
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTTISATOZERO  TO group db2_ast;
	
	-- drop table DATAUPDT.HDTTISATOZERO;
	 select * from DATAUPDT.HDTTISATOZERO;
	 
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table 2 ... my table
DELETE from DATAUPDT.HDTTISATOZERO;
	
-- source	
insert into DATAUPDT.HDTTISATOZERO
	(
	SeqNum ,
	HDTNum , 
	Requester ,
	Loan ,
	NewTISA  ,  -- always 0.00
	BadTISA  ,  -- often time provided in the spread sheet 
	CurTISA ,   -- tbltransactions.CURTAXINSURSETASIDE
	PayType
	, ChangeRequired
	)	
with param (SeqNum, HDTNum, Requester, loan, NewTISA, BadTISA) as
	(values  -- -- when -99.99, current value is not presented in spread sheet ... ignore or replace after run My Value

(1, 199014, 'Celeste Cantwell', 1383710, 0.00, -99.99),
(2, 199014, 'Celeste Cantwell', 3226303, 0.00, -99.99),
(3, 199014, 'Celeste Cantwell', 3230213, 0.00, -99.99),
(4, 199014, 'Celeste Cantwell', 3289446, 0.00, -99.99),
(5, 199014, 'Celeste Cantwell', 3289314, 0.00, -99.99),
(6, 199014, 'Celeste Cantwell', 3290979, 0.00, -99.99),
(7, 199014, 'Celeste Cantwell', 1318862, 0.00, -99.99),
(8, 199014, 'Celeste Cantwell', 3171514, 0.00, -99.99)

	)	
select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan,     -- TT.INTSUBSERVICERLOANNUMBER, 

	-- retreat current TISA at the last transaction for Note use
	P.NewTISA, P.BadTISA, TT.CURTAXINSURSETASIDE as "CurTISA", -- BadTISA and CurTISA must be the same
	TT.CHRPAYTYPE as "PayType" 

	/* **************************************************************************************************** My Ref
	, 'Ref->' as " - " --- not populated in DATAUpdt table'   
    , TT.IDSTRANSID as "LastTransID"
	, TT.IDSTRANSACTIONCOUNT as "LastTansCT" 
	, TT.IDSTRANSACTIONCOUNT + 1 as "NextTransCT"
	
	, 105 	AS "NewRowCode"  
	, 'tkato' AS "NewUserID" 
	, Current_Date AS "NewCreationDate"  
	, Current_Date AS "NewEffectiveDate"  
	, 0 AS "NewTransAmount"  
	, 0 AS "NewTransInterest"  
	, 0 AS "NewTransMIP"  
	, 0 AS "TransServiceFee"  
	, TT.CURNETPL + TT.CURTAXINSURSETASIDE as "NewNetPL(CurNetPL+CurTisaP)"
	, TT.CURNETPL as "CurNetPL" , TT.CURTAXINSURSETASIDE as "CurTisaP"

	, CASE TT.CHRPAYTYPE 
	WHEN 'Lump Sum' then TT.CURNETLOC   
	WHEN 'Term'     THEN TT.CURNETLOC 
	WHEN 'Tenure'   THEN TT.CURNETLOC 
	else TT.CURNETLOC + TT.CURTAXINSURSETASIDE 
	END as "NewNetLOC(CurNetLOC or CurNetLOC+CurTisaL)" -- ,	0 as "NewTISA", 
	,TT.CURNETLOC as "CurNetLOC",  TT.CURTAXINSURSETASIDE as "CurTisaL"
	********************************************************************************************************** */

	-- my test below when a ticket is resolved and the last trans is already shows the inserted 105 
	-- , T2.IDSTRANSACTIONCOUNT as "LastLastTansCT"
	-- , T2.CURTAXINSURSETASIDE as "TISAbeforeCyndie"
	,
	case when TT.CURTAXINSURSETASIDE = 0.00 then 0 else -1 end as "CHANGEREQUIRED"  --,,, 20220118 this value may be required in the future.

from  Param P
inner join celink.tbltransactions TT
	on  P.loan = TT.INTSUBSERVICERLOANNUMBER
inner join CELINK.CHOOSELASTRECORD XX
	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 

-- my test below when a ticket is resolved and the last trans is already shows the inserted 105 
--inner join celink.tbltransactions T2
--	on  P.loan = T2.INTSUBSERVICERLOANNUMBER
--	and T2.IDSTRANSACTIONCOUNT = 
--	( 
--	SELECT 
--	--	max(IDSTRANSACTIONCOUNT)  
--		max(IDSTRANSACTIONCOUNT) -1 -- for tesing  
--	from celink.tbltransactions where INTSUBSERVICERLOANNUMBER = P.loan
--	)  
order by P.SeqNum
with ur;	  

-- My Ref - PAYTYPE ---------------------------------
select '--' as "--", * from DATAUPDT.HDTTISATOZERO order by SeqNum;
 -- SEQNUM HDTNUM REQUESTER        LOAN    NEWTISA  BADTISA    CURTISA     PAYTYPE        CHANGEREQUIRED
 -- ------ ------ ---------------- ------- -------- ---------- ----------- -------------- --------------
 --      1 199014 Celeste Cantwell 1383710 0.000000 -99.990000 3961.700000 Line of Credit             -1
 --      2 199014 Celeste Cantwell 3226303 0.000000 -99.990000 3549.290000 Line of Credit             -1
 --      3 199014 Celeste Cantwell 3230213 0.000000 -99.990000 1660.890000 Line of Credit             -1
 --      4 199014 Celeste Cantwell 3289446 0.000000 -99.990000 1873.990000 Line of Credit             -1
 --      5 199014 Celeste Cantwell 3289314 0.000000 -99.990000  896.520000 Line of Credit             -1
 --      6 199014 Celeste Cantwell 3290979 0.000000 -99.990000 5999.060000 Line of Credit             -1
 --      7 199014 Celeste Cantwell 1318862 0.000000 -99.990000 4365.770000 Term                       -1
 --      8 199014 Celeste Cantwell 3171514 0.000000 -99.990000 1341.180000 Line of Credit             -1

-- Dup
select Loan, count(Loan) from DATAUPDT.HDTTISATOZERO group by Loan having count(Loan) > 1; 
-- LOAN 2
-- ---- -
	
-- count
select HDTNUM "HDT #", count(*) "Loan Count"  from DATAUPDT.HDTTISATOZERO group by HDTNUM; 
-- HDT #  Loan Count
-- ------ ----------
-- 199014          8

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Note using values retreated in DATAUPDT.HDTTISATOZERO;
--New note ,,, 20230801 == 'Per HDT # Set Aside Balance updated to $0 from $	6370'
Select 
	'--' as "--",
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	'6370'   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
--   'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') ' || 'TISA balance has been forced to zero from ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' where ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' is gleaned from the most recent transaction on the loan.' as "Loan Note" 
--   'Per HDT ' || UY.HDTNum || ' TISA balance has been forced to zero from ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' where ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' is gleaned from the most recent transaction on the loan.' as "Loan Note" 
   'Per HDT ' || UY.HDTNum || ' Set Aside Balance updated to $0 from $' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || '.  $' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' is gleaned from the most recent transaction on the loan.' as "Loan Note" 
	from DATAUPDT.HDTTISATOZERO UY  
	where UY.ChangeRequired = -1 -- exclude current tisa already 0
Order by SeqNum 
; 
 -- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
 -- ------ ----------- -------------- ---------------- -------------------------------- --------------------------------------------------------------------------------------------------------------------------------
 --      1     1383710 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $3961.70.  $3961.70 is gleaned from the most recent transaction on the loan.
 --      2     3226303 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $3549.29.  $3549.29 is gleaned from the most recent transaction on the loan.
 --      3     3230213 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $1660.89.  $1660.89 is gleaned from the most recent transaction on the loan.
 --      4     3289446 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $1873.99.  $1873.99 is gleaned from the most recent transaction on the loan.
 --      5     3289314 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $896.52.  $896.52 is gleaned from the most recent transaction on the loan.
 --      6     3290979 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $5999.06.  $5999.06 is gleaned from the most recent transaction on the loan.
 --      7     1318862 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $4365.77.  $4365.77 is gleaned from the most recent transaction on the loan.
 --      8     3171514 N              6370                                              Per HDT 199014 Set Aside Balance updated to $0 from $1341.18.  $1341.18 is gleaned from the most recent transaction on the loan.

				-------------------------------------------------------------------------------------------------------------------------------------
				-------------------------------------------------------------------------------------------------------------------------------------
				/* ***** Cyndie created, but I do not have permission
				-- Clear DATAUPDT table 1
				DELETE from DATAUPDT.FORCETISATOZERO;
					
				-- insert source data (in table 1)  into DATAUPDT table 
				insert into DATAUPDT.FORCETISATOZERO
				(
					Loan,
					TICKETNUMBER
				)	
					
				select 
					P.Loan,
					P.HDTNum
				from  DATAUPDT.HDTTISATOZERO P
				order by P.SeqNum
				with ur;	  
				
					 select * from DATAUPDT.FORCETISATOZERO;
				***** */
				-------------------------------------------------------------------------------------------------------------------------------------
				-------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Validation before update ... compare count against above  ... use below with SeqNum

-- select for new values
select 
SeqNum,					--CHRPAYTYPE   
RowCount,  
RowCode,  
UserID, 
CreationDate,  
EffectiveDate,  
TransAmount,  
TransInterest,  
TransMIP,  
TransServiceFee,  
NetPL, 

NetLOC, 

TISA ,

PayType, 

LoanNum 
from
(
SELECT 
D.SeqNum,			--A.CHRPAYTYPE, 

-- new values
A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
105 AS RowCode,  
'tkato' AS UserID, 
Current_Date AS CreationDate,  
Current_Date AS EffectiveDate,  
0 AS TransAmount,  
0 AS TransInterest,  
0 AS TransMIP,  
0 AS TransServiceFee,  
-- ?? A.CURTRANSACTIONSERVICEFEE as TransServiceFee, 

A.CURNETPL + A.CURTAXINSURSETASIDE as NetPL, 

/* 20220511 -- commented to fix */ 
--CASE A.CHRPAYTYPE 
--WHEN 'Lump Sum' then A.CURNETLOC   
--WHEN 'Term'     THEN A.CURNETLOC 
--WHEN 'Tenure'   THEN A.CURNETLOC 
--else A.CURNETLOC + A.CURTAXINSURSETASIDE 
--END as NetLOC, 
/* 20220511 -- commented to fix ... corrected as below */ 

CASE A.CHRPAYTYPE 
WHEN 'Line of Credit' then A.CURNETLOC + A.CURTAXINSURSETASIDE 
else A.CURNETLOC   
END as NetLOC, 

0 as TISA,

A.CHRPAYTYPE as PayType, 

A.INTSUBSERVICERLOANNUMBER  as LoanNum
/*
,  
-- values from the last trans
A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, A.IDSSTATUSCODE, A.INTSUBSERVICERLOANNUMBER,  
A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE, A.CURSCHEDULEDPAYMENTUPB,  A.CURSCHEDULEDPAYMENTINTEREST, 
A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, A.CURUNSCHEDULEDPAYMENTUPB, A.CURUNSCHEDULEDPAYMENTINTEREST,  
A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  A.CURTOTALUPB, A.CURORIGINALPL, A.CURCURRENTPL, 
A.CURORIGINALNETPL, A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, A.CURORIGTAXINSURSETASIDE, 
A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  A.BLNLOANSUSPENDED, A.CHRLOANSTATUSREMARKS, 
A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO 
*/

--FROM  CELINK.TBLTRANSACTIONS A
--
--inner join CELINK.CHOOSELASTRECORD C
--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
--
--inner join DATAUPDT.FORCETISATOZERO D
--	on 	A.INTSUBSERVICERLOANNUMBER = D.LOAN

-- ROW ORDER 	 select * from DATAUPDT.HDTTISATOZERO order by SeqNum;
FROM  DATAUPDT.HDTTISATOZERO D

INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
	
-- if CURTISA = 0, excludes	
where D.ChangeRequired = -1 -- exclude current tisa already 0
)

union

-- select for last values
select 
SeqNum,					--CHRPAYTYPE,
RowCount,  
RowCode,  
UserID, 
CreationDate,  
EffectiveDate,  
TransAmount,  
TransInterest,  
TransMIP,  
TransServiceFee,  
NetPL, 

NetLOC, 

TISA,

PayType, 

LoanNum  
from
(
SELECT 
D.SeqNum,				--A.CHRPAYTYPE,
A.IDSTRANSACTIONCOUNT as RowCount,  
A.IDSTRANSACTIONCODE as RowCode,  
A.IDSUSERID as UserID,  
A.DTMTRANSACTIONCREATIONDATE as CreationDate,  
A.DTMEFFECTIVEDATE as EffectiveDate,  
A.CURTRANSACTIONAMT as TransAmount,  
A.CURTRANSACTIONINTEREST as TransInterest,  
A.CURTRANSACTIONMIP as TransMIP,  
A.CURTRANSACTIONSERVICEFEE as TransServiceFee,  
A.CURNETPL as NetPL,  
A.CURNETLOC as NetLOC,  
A.CURTAXINSURSETASIDE as TISA
,
A.CHRPAYTYPE as PayType
, 
A.INTSUBSERVICERLOANNUMBER as LoanNum
/*
,   
A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, A.IDSSTATUSCODE, A.INTSUBSERVICERLOANNUMBER,  
A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE, A.CURSCHEDULEDPAYMENTUPB,  A.CURSCHEDULEDPAYMENTINTEREST, 
A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, A.CURUNSCHEDULEDPAYMENTUPB, A.CURUNSCHEDULEDPAYMENTINTEREST,  
A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  A.CURTOTALUPB, A.CURORIGINALPL, A.CURCURRENTPL, 
A.CURORIGINALNETPL, A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, A.CURORIGTAXINSURSETASIDE, 
A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  A.BLNLOANSUSPENDED, A.CHRLOANSTATUSREMARKS, 
A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO
*/

--FROM  CELINK.TBLTRANSACTIONS A
--
--inner join CELINK.CHOOSELASTRECORD C
--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
--
--inner join DATAUPDT.FORCETISATOZERO D
--	on 	A.INTSUBSERVICERLOANNUMBER = D.LOAN

-- ROW ORDER 	 select * from DATAUPDT.HDTTISATOZERO order by SeqNum;
FROM  DATAUPDT.HDTTISATOZERO D

INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT	

where D.ChangeRequired = -1 -- exclude current tisa already 0
)		
order by SeqNum, RowCount Desc 

for read only with ur
;	

/*
 SEQNUM ROWCOUNT ROWCODE USERID CREATIONDATE EFFECTIVEDATE TRANSAMOUNT TRANSINTEREST TRANSMIP   TRANSSERVICEFEE NETPL         NETLOC        TISA        PAYTYPE        LOANNUM
 ------ -------- ------- ------ ------------ ------------- ----------- ------------- ---------- --------------- ------------- ------------- ----------- -------------- ---------
      1      143     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   4462.420000   4462.420000    0.000000 Line of Credit 1383710.0
      1      142     101 BATCH  2025-08-29   2025-08-31     812.480000    691.360000 121.120000           29.07    500.720000    500.720000 3961.700000 Line of Credit 1383710.0

      2       99     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   3746.900000   3746.900000    0.000000 Line of Credit 3226303.0
      2       98     101 BATCH  2025-08-29   2025-08-31    8729.650000   8709.650000   0.000000             0.0    197.610000    197.610000 3549.290000 Line of Credit 3226303.0

      3      137     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0 436718.360000 436718.360000    0.000000 Line of Credit 3230213.0
      3      136      44 Batch  2025-09-05   2025-09-05    2000.000000      9.590000   0.680000            0.41 435057.470000 435057.470000 1660.890000 Line of Credit 3230213.0

      4       91     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   1860.160000   1860.160000    0.000000 Line of Credit 3289446.0
      4       90     103 BATCH  2025-08-29   2025-09-01       0.000000      0.000000   0.000000             0.0    -13.830000    -13.830000 1873.990000 Line of Credit 3289446.0

      5       97     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0 277433.930000 277433.930000    0.000000 Line of Credit 3289314.0
      5       96     103 BATCH  2025-08-29   2025-09-01       0.000000      0.000000   0.000000             0.0 276537.410000 276537.410000  896.520000 Line of Credit 3289314.0

      6      100     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   6045.100000   6045.100000    0.000000 Line of Credit 3290979.0
      6       99     103 BATCH  2025-08-29   2025-09-01       0.000000      0.000000   0.000000             0.0     46.040000     46.040000 5999.060000 Line of Credit 3290979.0

      7      237     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0  55494.150000      0.000000    0.000000 Term           1318862.0
      7      236     102 BATCH  2025-08-29   2025-09-02    2344.090000     13.510000   2.250000            0.54  51128.380000      0.000000 4365.770000 Term           1318862.0

      8       84     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   1345.290000   1345.290000    0.000000 Line of Credit 3171514.0
      8       83     101 BATCH  2025-08-29   2025-08-31    1533.640000   1434.890000  98.750000           59.25      4.110000      4.110000 1341.180000 Line of Credit 3171514.0

-------------------------------------------------------------------------------------------------------------------------------------
-- check again right before insertion with below select part

-------------------------------------------------------------------------------------------------------------------------------------
-- after
 SEQNUM ROWCOUNT ROWCODE USERID CREATIONDATE EFFECTIVEDATE TRANSAMOUNT TRANSINTEREST TRANSMIP   TRANSSERVICEFEE NETPL         NETLOC        TISA        LOANNUM
 ------ -------- ------- ------ ------------ ------------- ----------- ------------- ---------- --------------- ------------- ------------- ----------- ---------
      1      143     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   4462.420000   4462.420000    0.000000 1383710.0
      1      142     101 BATCH  2025-08-29   2025-08-31     812.480000    691.360000 121.120000           29.07    500.720000    500.720000 3961.700000 1383710.0

      2       99     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   3746.900000   3746.900000    0.000000 3226303.0
      2       98     101 BATCH  2025-08-29   2025-08-31    8729.650000   8709.650000   0.000000             0.0    197.610000    197.610000 3549.290000 3226303.0

      3      137     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0 436718.360000 436718.360000    0.000000 3230213.0
      3      136      44 Batch  2025-09-05   2025-09-05    2000.000000      9.590000   0.680000            0.41 435057.470000 435057.470000 1660.890000 3230213.0

      4       91     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   1860.160000   1860.160000    0.000000 3289446.0
      4       90     103 BATCH  2025-08-29   2025-09-01       0.000000      0.000000   0.000000             0.0    -13.830000    -13.830000 1873.990000 3289446.0

      5       97     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0 277433.930000 277433.930000    0.000000 3289314.0
      5       96     103 BATCH  2025-08-29   2025-09-01       0.000000      0.000000   0.000000             0.0 276537.410000 276537.410000  896.520000 3289314.0

      6      100     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   6045.100000   6045.100000    0.000000 3290979.0
      6       99     103 BATCH  2025-08-29   2025-09-01       0.000000      0.000000   0.000000             0.0     46.040000     46.040000 5999.060000 3290979.0

      7      237     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0  55494.150000      0.000000    0.000000 1318862.0
      7      236     102 BATCH  2025-08-29   2025-09-02    2344.090000     13.510000   2.250000            0.54  51128.380000      0.000000 4365.770000 1318862.0

      8       84     105 tkato  2025-09-09   2025-09-09       0.000000      0.000000   0.000000             0.0   1345.290000   1345.290000    0.000000 3171514.0
      8       83     101 BATCH  2025-08-29   2025-08-31    1533.640000   1434.890000  98.750000           59.25      4.110000      4.110000 1341.180000 3171514.0

----------------------------------------------
----------------------------------------------
--A.CURNETPL + A.CURTAXINSURSETASIDE as NetPL, 
--
--CASE A.CHRPAYTYPE 
--WHEN 'Line of Credit' then A.CURNETLOC + A.CURTAXINSURSETASIDE 
--else A.CURNETLOC   
--END as NetLOC, 

-- below no longer correct 20220511 !!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG!!NG
--CASE A.CHRPAYTYPE 
--WHEN 'Lump Sum' then A.CURNETLOC   
--WHEN 'Term'     THEN A.CURNETLOC 
--WHEN 'Tenure'   THEN A.CURNETLOC 
--else A.CURNETLOC + A.CURTAXINSURSETASIDE 
--END as NetLOC, 
*/

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- insert 105
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO CELINK.TBLTRANSACTIONS 
( 
IDSTRANSACTIONCOUNT,  
IDSTRANSACTIONCODE,  
IDSUSERID,  
DTMTRANSACTIONCREATIONDATE,  
DTMEFFECTIVEDATE,  
CURTRANSACTIONAMT,  
CURTRANSACTIONINTEREST,  
CURTRANSACTIONMIP,  
CURTRANSACTIONSERVICEFEE,  
CURNETPL,  
CURNETLOC,  
CURTAXINSURSETASIDE,  

IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, IDSSTATUSCODE, INTSUBSERVICERLOANNUMBER,  
INTFMALOANNUMBER, INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE, CURSCHEDULEDPAYMENTUPB,  CURSCHEDULEDPAYMENTINTEREST, 
CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, CURUNSCHEDULEDPAYMENTUPB, CURUNSCHEDULEDPAYMENTINTEREST, 
CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED, CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
CURREPAYMENTMIP, CURORIGTOTALUBP,  CURTOTALUPB, CURORIGINALPL, CURCURRENTPL, 
CURORIGINALNETPL, CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, CURORIGTAXINSURSETASIDE, 
CURORIGLOCRESERVE,  CURLOCRESERVE, CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD, CHRPLANCHANGEREASON, 
INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
INTINDEX, INTMARGIN, BLNINTERESTROUND,  BLNLOANSUSPENDED, CHRLOANSTATUSREMARKS, 
CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 
) 

SELECT 
-- -- -- D.SeqNum,  -- for validation before update
A.IDSTRANSACTIONCOUNT + 1 AS NewRowCount,  
105 AS RowCode,  
'tkato' AS UserID, 
Current_Date AS CreationDate,  
Current_Date AS EffectiveDate,  
0.00 AS TransAmount,  
0.00 AS TransInterest,  
0.00 AS TransMIP,  
0.00 AS TransServiceFee,  
A.CURNETPL + A.CURTAXINSURSETASIDE as NetPL, 

/* 20220511 -- commented to fix */ 
--CASE A.CHRPAYTYPE 
--WHEN 'Lump Sum' then A.CURNETLOC   
--WHEN 'Term'     THEN A.CURNETLOC 
--WHEN 'Tenure'   THEN A.CURNETLOC 
--else A.CURNETLOC + A.CURTAXINSURSETASIDE 
--END as NetLOC, 
/* 20220511 -- commented to fix ... corrected as below */ 
CASE A.CHRPAYTYPE 
WHEN 'Line of Credit' then A.CURNETLOC + A.CURTAXINSURSETASIDE 
else A.CURNETLOC   
END as NetLOC, 

0.00 as TISA,  

A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, A.IDSSTATUSCODE, A.INTSUBSERVICERLOANNUMBER,  
A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE, A.CURSCHEDULEDPAYMENTUPB,  A.CURSCHEDULEDPAYMENTINTEREST, 
A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, A.CURUNSCHEDULEDPAYMENTUPB, A.CURUNSCHEDULEDPAYMENTINTEREST,  
A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  A.CURTOTALUPB, A.CURORIGINALPL, A.CURCURRENTPL, 
A.CURORIGINALNETPL, A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, A.CURORIGTAXINSURSETASIDE, 
A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  A.BLNLOANSUSPENDED, A.CHRLOANSTATUSREMARKS, 
A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO 

--FROM	CELINK.TBLTRANSACTIONS A, 
--		CELINK.CHOOSELASTRECORD C, 
--		DATAUPDT.FORCETISATOZERO D 
--WHERE 	A.INTSUBSERVICERLOANNUMBER = D.LOAN  
--AND		A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--AND A.IDSTRANSACTIONCOUNT = C.MAXCOUNT

--FROM  CELINK.TBLTRANSACTIONS A
--
--inner join CELINK.CHOOSELASTRECORD C
--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
--
--inner join DATAUPDT.FORCETISATOZERO D
--	on 	A.INTSUBSERVICERLOANNUMBER = D.LOAN

-- ROW ORDER 	 select * from DATAUPDT.HDTTISATOZERO order by SeqNum;
FROM  DATAUPDT.HDTTISATOZERO D

INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

where D.ChangeRequired = -1 -- exclude current tisa already 0

order by D.SeqNum
;	  

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

		----------------------------------------------------------
		-- validation ... compaire the last trans and new inserted ... USING THE SECOND PART OF UNION 
		select 
		SeqNum,					--CHRPAYTYPE,
		RowCount,  
		RowCode,  
		UserID, 
		CreationDate,  
		EffectiveDate,  
		TransAmount,  
		TransInterest,  
		TransMIP,  
		TransServiceFee,  
		NetPL, 
		
		NetLOC, 
		
		TISA,
		LoanNum  
		from
		(
		SELECT 
		D.SeqNum,				--A.CHRPAYTYPE,
		A.IDSTRANSACTIONCOUNT as RowCount,  
		A.IDSTRANSACTIONCODE as RowCode,  
		A.IDSUSERID as UserID,  
		A.DTMTRANSACTIONCREATIONDATE as CreationDate,  
		A.DTMEFFECTIVEDATE as EffectiveDate,  
		A.CURTRANSACTIONAMT as TransAmount,  
		A.CURTRANSACTIONINTEREST as TransInterest,  
		A.CURTRANSACTIONMIP as TransMIP,  
		A.CURTRANSACTIONSERVICEFEE as TransServiceFee,  
		A.CURNETPL as NetPL,  
		A.CURNETLOC as NetLOC,  
		A.CURTAXINSURSETASIDE as TISA
		,
		A.INTSUBSERVICERLOANNUMBER as LoanNum
		,   
		A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, A.IDSSTATUSCODE, A.INTSUBSERVICERLOANNUMBER,  
		A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
		A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE, A.CURSCHEDULEDPAYMENTUPB,  A.CURSCHEDULEDPAYMENTINTEREST, 
		A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, A.CURUNSCHEDULEDPAYMENTUPB, A.CURUNSCHEDULEDPAYMENTINTEREST,  
		A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
		A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  A.CURTOTALUPB, A.CURORIGINALPL, A.CURCURRENTPL, 
		A.CURORIGINALNETPL, A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
		A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, A.CURORIGTAXINSURSETASIDE, 
		A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
		A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
		A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
		A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  A.BLNLOANSUSPENDED, A.CHRLOANSTATUSREMARKS, 
		A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO
		
		FROM  DATAUPDT.HDTTISATOZERO D
		
		INNER JOIN CELINK.TBLTRANSACTIONS A
			on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
		
		inner join CELINK.CHOOSELASTRECORD C
			on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
			AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 1	
		
		where D.ChangeRequired = -1 -- exclude current tisa already 0
		)		
		order by SeqNum, RowCount Desc 
		
		for read only with ur
		;	

		-- SEQNUM ROWCOUNT ROWCODE USERID     CREATIONDATE EFFECTIVEDATE TRANSAMOUNT TRANSINTEREST TRANSMIP   TRANSSERVICEFEE NETPL         NETLOC        TISA         LOANNUM
		-- ------ -------- ------- ---------- ------------ ------------- ----------- ------------- ---------- --------------- ------------- ------------- ------------ ---------
		-- paste result above

/*
----------------------------------------------------------
-- validation ... compaire the last trans and new inserted ... this query NOT used any more - 20211101
select 
	D.SeqNum,
	A.INTSUBSERVICERLOANNUMBER, A.*		

--FROM  CELINK.TBLTRANSACTIONS A
--
--inner join CELINK.CHOOSELASTRECORD C
--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 1  -- fecth the last one and newly inserted
--
--inner join DATAUPDT.FORCETISATOZERO D
--	on 	A.INTSUBSERVICERLOANNUMBER = D.LOAN
--order by A.INTSUBSERVICERLOANNUMBER, A.IDSTRANSACTIONCOUNT desc	

FROM  DATAUPDT.HDTTISATOZERO D

INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 1  -- fecth the last one and newly inserted

order by D.SeqNum, IDSTRANSACTIONCOUNT desc
for read only with ur
;
*/


-----------------------------------------------------------------------------------------------------------------------
-- Note using values retreated in DATAUPDT.HDTTISATOZERO;
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
Select 
--	SeqNum,	
	Loan as "Loan Number",
--	'N'  as "Priority (Y/N)", 
--	''   as "Note Step Number",
--	''   as "Step Date Completed (YYYY-MM-DD)", 
--   'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') ' || 'TISA balance has been forced to zero from ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' where ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' is gleaned from the most recent transaction on the loan.' as "Loan Note" 
--   'Per HDT ' || UY.HDTNum || ' TISA balance has been forced to zero from ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' where ' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' is gleaned from the most recent transaction on the loan.' as "Loan Note" 
--   'Per HDT ' || UY.HDTNum || ' Set Aside Balance updated to $0 from $' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || '.  $' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' is gleaned from the most recent transaction on the loan.' as "Loan Note" 
   'Per HDT ' || UY.HDTNum || ' Set Aside Balance updated to $0 from $' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || '.  $' || trim(VARCHAR_FORMAT(UY.CurTISA, '99999999999990.00'))  || ' is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None.' as "Loan Note" 
	, CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	6370
	from DATAUPDT.HDTTISATOZERO UY  
	where UY.ChangeRequired = -1 -- exclude current tisa already 0
Order by SeqNum 
; 

/*
 Loan Number Loan Note                                                                                                                                                              3                          4     5 6
 ----------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------- ----- - ----
*/

------------------
-- Notes validation
		select 
		--	count(*) as "MyCount"
			UY.SeqNum,
			a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY,  NOTESTEP --,*
			from DATAUPDT.HDTTISATOZERO UY  
			inner join 	celink.tblloannotes a
			on UY.Loan = a.INTSUBSERVICERLOANNUMBER
			and CHRLOANNOTES like 'Per HDT%' || HDTNum ||'%'
			--order by UY.IDSLOANNOTES desc 
			order by UY.SeqNum
		with ur;

/*
 SEQNUM DTMNOTEDATE               IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                           CHRUSERID BLNPRIORITY NOTESTEP
 ------ ------------------------- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- ----------- --------
      1 2025-09-09 13:08:50.20079    213680015                1383710.0 Per HDT 199014 Set Aside Balance updated to $0 from $3961.70.  $3961.70 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
      2 2025-09-09 13:08:50.20079    213680016                3226303.0 Per HDT 199014 Set Aside Balance updated to $0 from $3549.29.  $3549.29 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
      3 2025-09-09 13:08:50.20079    213680017                3230213.0 Per HDT 199014 Set Aside Balance updated to $0 from $1660.89.  $1660.89 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
      4 2025-09-09 13:08:50.20079    213680018                3289446.0 Per HDT 199014 Set Aside Balance updated to $0 from $1873.99.  $1873.99 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
      5 2025-09-09 13:08:50.20079    213680019                3289314.0 Per HDT 199014 Set Aside Balance updated to $0 from $896.52.  $896.52 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None.   tkato               0     6370
      6 2025-09-09 13:08:50.20079    213680020                3290979.0 Per HDT 199014 Set Aside Balance updated to $0 from $5999.06.  $5999.06 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
      7 2025-09-09 13:08:50.20079    213680021                1318862.0 Per HDT 199014 Set Aside Balance updated to $0 from $4365.77.  $4365.77 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
      8 2025-09-09 13:08:50.20079    213680022                3171514.0 Per HDT 199014 Set Aside Balance updated to $0 from $1341.18.  $1341.18 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370

1 transaction posted, radio button updated.  Peer review pending.
8 transactions posted, radio button updated.  Peer review pending.

1 transaction posted.  Peer review pending.
12 transactions posted.  Peer review pending.

1 transaction for loan 1341492 posted.  Peer review pending.

*/

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- eof / end of proc
--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
