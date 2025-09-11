/*
20230613
Template
HDT_Posting_Non_Cash_Transaction_Claims_Ecol_GlobalTemp_Template.SQL

*/

---------------------------------------------------------------------------------------------------------------------------------------------------------
/*
20210225 ... Template_HDT_Posting_Non_Cash_Transaction.SQL

-- Cyndies instruction ...
This is the SQL for posting non-cash transactions where the amounts come from Investor Reporting (generally from Amy Morrill). 
The tickets are titled Internal/External 105 Transactions for posting and will be set to critical priority. 
Examples are tickets 78695, 78416, 78211. ... 79137

This will fail if there are duplicate loan numbers in the list. This is rare but does, on occasion, happen. 
If it does, check the values for the duplicate loans if the values are the same then remove one and inform Amy that you found a duplicate and the duplicate has NOT been processed. 
If the values are different, remove both and ask Amy for guidance. 

Table DATAUPDT.NONCASHCLAIMPAYMENTS has been created and consists of seven columns: 
Loan, Amount, Inactive, Effectivedate, Requestedby, Autonote, and Ticket. 
Empty this table prior to populating.

These transactions are posted to Liquidated loans therefore no interest and/or MIP is calculated.
 
Loan note verbiage: Note - Use values from the dataupdt.noncashclaimpayments table to build the note. 
"Per HDT DATAUPDT.NONCASHCLAIMPAYMENTS.TICKET DATAUPDT.NONCASHCLAIMPAYMENTS.AUTONOTE in the amount of DATAUPDT.NONCASHCLAIMPAYMENTS.AMOUNT.  Requested by DATAUPDT.NONCASHCLAIMPAYMENTS.REQUESTEDBY."
*/

/* sample format for MySrc
="(" & Y2 & ", 130475, 'Danielle Beet', " &A2 &", " & TEXT(B2, "#0.00") &  ", '" & TRIM(C2) & "', '" & TEXT(D2,"YYYY-MM-DD") & "', '" & TRIM(E2) & "', '" & TRIM(F2) & "'),"
="(" & CO2 & ", 105355, 'Ann Plowman', " &A2 &", " & TEXT(B2, "#0.00") &  ", '" & TRIM(C2) & "', '" & TEXT(D2,"YYYY-MM-DD") & "', '" & TRIM(E2) & "', '" & TRIM(F2) & "'),"
="(" & CO2 & ", 105005, 'Amy Morrill', " &A2 &", " & TEXT(B2, "#0.00") &  ", '" & TRIM(C2) & "', '" & TEXT(D2,"YYYY-MM-DD") & "', '" & TRIM(E2) & "', '" & TRIM(F2) & "'),"

--*--
21 transactions posted.  Pending verification.
17 transactions posted. Peer review pending.
*/

---------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------
--HDTs

---------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------------------
/* -- DATAUpdt table 2 ... contains ... SeqNum, Requester, Gien TISA, Curr value 
create table DATAUPDT.HDTNonCashClaimsPayments   
	(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan      integer,
	
	NewAmount  decimal(16,6),  
	BadAmount  decimal(16,6),  -- not used 
	CurAmount  decimal(16,6),  -- -- tbltransactions.CURTRANSACTIONAMT

	INACTIVE      CHAR(1 OCTETS), 
	EFFECTIVEDATE DATE, 
	REQUESTEDBY   VARCHAR(100 OCTETS), 
	AUTONOTE      VARCHAR(150 OCTETS), 

	ChangeRequired integer   -- might not be used
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTNonCashClaimsPayments  TO group db2_ast;
	
-- drop table DATAUPDT.HDTNonCashClaimsPayments;
select * from DATAUPDT.HDTNonCashClaimsPayments;
	 
--*/	

--------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
-- Source data creation
-------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------
-- Clear DATAUPDT 2 tables
--select * from DATAUPDT.HDTTISATOZERO;
DELETE from DATAUPDT.HDTTISATOZERO;
--select * from DATAUPDT.HDTCalledDueReason_McDaid;
DELETE from DATAUPDT.HDTCalledDueReason_McDaid;

---------------------------------------------------------------------------------------------
-- create Global Temp
declare global TEMPORARY TABLE SESSION.TmpMyVal
(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan      integer,
	
	NewAmount  decimal(16,6),  
	--BadAmount  decimal(16,6),  -- not used 
	--CurAmount  decimal(16,6),  -- -- tbltransactions.CURTRANSACTIONAMT

	INACTIVE      CHAR(1 OCTETS), 
	EFFECTIVEDATE DATE, 
	REQUESTEDBY   VARCHAR(100 OCTETS), 
	AUTONOTE      VARCHAR(150 OCTETS)
	
	--, ChangeRequired integer   -- might not be used
)	
ON COMMIT PRESERVE ROWS;

insert into session.TmpMyVal
values
--<< source ... samples
(1, 130475, 'Danielle Beet', 1089519, -1372.03, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(2, 130475, 'Danielle Beet', 1212387, -14036.64, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(3, 130475, 'Danielle Beet', 1093629, -460000.00, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(4, 130475, 'Danielle Beet', 3127065, -4599.17, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(5, 130475, 'Danielle Beet', 1082811, -229000.00, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(6, 130475, 'Danielle Beet', 3128426, -74666.97, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(7, 130475, 'Danielle Beet', 3127774, -2958.24, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(8, 130475, 'Danielle Beet', 3129068, -122000.00, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(9, 130475, 'Danielle Beet', 1116739, -195000.00, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(10, 130475, 'Danielle Beet', 1157867, -444216.68, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(11, 130475, 'Danielle Beet', 3114207, -153000.00, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(12, 130475, 'Danielle Beet', 1192155, -243.33, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(13, 130475, 'Danielle Beet', 1205926, -11371.93, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(14, 130475, 'Danielle Beet', 3119067, -291444.00, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(15, 130475, 'Danielle Beet', 1273829, -13960.49, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(16, 130475, 'Danielle Beet', 1275780, -283838.08, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(17, 130475, 'Danielle Beet', 1276592, -437892.10, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
(18, 130475, 'Danielle Beet', 1286517, -127988.70, 'N', '2023-06-15', 'Client process request', 'Non-Cash Claim Payment Applied. Per client instruction post 105 for non-cash claim payment received by investor'),
--<< source  ... samples
;


	----------------------------------------------
	select * from SESSION.TmpMyVal order by seqnum;

----------------------------------------------------------
-- insert DATAUPDT.HDTTISATOZERO ... my table ... from temp

insert into DATAUPDT.HDTTISATOZERO
	(
	SeqNum ,
	HDTNum , 
	Requester ,
	Loan ,
	NewTISA  ,  	-- NewAmount
	CurTISA ,   	-- tbltransactions.CURTRANSACTIONAMT
	PayType			-- InActive
	)	
select 
	-- insert 6 item into HDTTISATOZERO
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan,   
	-- retreat current Amount at the last transaction for Note use
	P.NewAmount, TT.CURTRANSACTIONAMT as "CurAmount", -- "CurAmount" means Amount from the last transaction
	P.InActive
--	, -- below 3 will go to another DATAUpdt table below
--	P.EffectiveDate,
--	P.RequestedBy, 
--	P.AutoNote
from  SESSION.TmpMyVal P
inner join celink.tbltransactions TT
	on  P.loan = TT.INTSUBSERVICERLOANNUMBER
inner join CELINK.CHOOSELASTRECORD XX
	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 
-- my test below when a ticket is resolved and the last trans is already shows the inserted 105 
inner join celink.tbltransactions T2
	on  P.loan = T2.INTSUBSERVICERLOANNUMBER
	and T2.IDSTRANSACTIONCOUNT = 
	( 
	SELECT 
	--	max(IDSTRANSACTIONCOUNT)  
		max(IDSTRANSACTIONCOUNT) -1 -- for tesing  
	from celink.tbltransactions where INTSUBSERVICERLOANNUMBER = P.loan
	)  
order by P.SeqNum
with ur;	 

--------------------
-- insert validation
select * from DATAUPDT.HDTTISATOZERO order by SeqNum;
select 
	SEQNUM, HDTNUM, REQUESTER, LOAN,
	NEWTISA "NewAmount",
	BADTISA "BadAmount_NotUsed",
	CURTISA "CurAmount",
	PAYTYPE "INACTIVE"
from DATAUPDT.HDTTISATOZERO order by SeqNum;


-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- inser DATAUPDT.HDTDataUpdt_TnIdata_SA ... my table ... from temp
-- for 
--	EFFECTIVEDATE DATE, 
--	REQUESTEDBY   VARCHAR(100 OCTETS), 
--	AUTONOTE      VARCHAR(150 OCTETS)
----------------------------------------------------------
-- Data  
insert into DATAUPDT.HDTCalledDueReason_McDaid
	(
	SeqNum , HDTNum , Requester ,Loan , 
	CurCalledDueDate, 	-- EFFECTIVEDATE
	ReqTypeDesc, 		--REQUESTEDBY
	ReqDesc     		--AUTONOTE 
	)
select 
	-- insert 3 items into HDTCalledDueReason_McDaid
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan,   
	P.EffectiveDate,
	P.RequestedBy, 
	P.AutoNote
from  SESSION.TmpMyVal P
order by P.SeqNum
with ur;	 

-----------------------
-- insertion validation
select * from DATAUPDT.HDTCalledDueReason_McDaid order by SeqNum;
select 
	SeqNum , HDTNum , Requester ,Loan , 
	CurCalledDueDate "EFFECTIVEDATE",
	ReqTypeDesc "REQUESTEDBY",
	ReqDesc     "AUTONOTE"
from DATAUPDT.HDTCalledDueReason_McDaid order by SeqNum;

/*
-- Table 1 -- HDTTISATOZERO


-- Table 2 -- HDTCalledDueReason_McDaid

*/

-- ------ ------ ------------- ------- ------------- ---------------------- ---------------------------------------------------------------------------------------------------------------
-- 2 tables join

select 
	T1.SEQNUM, T1.HDTNUM, T1.REQUESTER, T1.LOAN,
	T2.SEQNUM, T2.HDTNUM, T2.REQUESTER, T2.LOAN,
	
	T1.NEWTISA "NewAmount",
	T1.CURTISA "CurAmount",
	T1.PAYTYPE "INACTIVE",
	
	T2.CurCalledDueDate "EFFECTIVEDATE",
	T2.ReqTypeDesc		"REQUESTEDBY",
	T2.ReqDesc			"AUTONOTE" 
from       DATAUPDT.HDTTISATOZERO T1
inner join DATAUPDT.HDTCalledDueReason_McDaid T2 
on  T1.SeqNum = T2.SeqNum
and T1.HDTNUM = T2.HDTNUM
and T1.REQUESTER = T2.REQUESTER
and T1.LOAN = T2.LOAN

order by T1.SeqNum;

/* result ,,, must be same as MySrc

*/

-----------------------------------------------------------------------------------------------------------------------
-- Done populating "MyVal" in the 2 DATAUPDT tables !!!!  Good Job so far to here !!!!  ----------------------------------------------
-----------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------
-- C:\Users\ted.kato\Documents\HDTUpdtNotes_109513.csv
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	'4710'   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
   'Per HDT ' || UY.HDTNum || ' ' || UY.AutoNote || ' in the amount of ' || trim(VARCHAR_FORMAT(UY.NewAmount, '99999999999990.00')) || '.  Requested by ' ||  UY.REQUESTEDBY || '.'as "Loan Note" 
from --DATAUPDT.HDTNonCashClaimsPayments UY
(
select 
	T1.SEQNUM, T1.HDTNUM, T1.REQUESTER, T1.LOAN,
	T1.NEWTISA "NewAmount",
	T1.CURTISA "CurAmount",
	T1.PAYTYPE "INACTIVE",
	
	T2.CurCalledDueDate "EFFECTIVEDATE",
	T2.ReqTypeDesc		"REQUESTEDBY",
	T2.ReqDesc			"AUTONOTE" 
from       DATAUPDT.HDTTISATOZERO T1
inner join DATAUPDT.HDTCalledDueReason_McDaid T2 
on  T1.SeqNum = T2.SeqNum
and T1.HDTNUM = T2.HDTNUM
and T1.REQUESTER = T2.REQUESTER
and T1.LOAN = T2.LOAN
order by T1.SeqNum
) UY (SEQNUM, HDTNUM, REQUESTER, LOAN, NewAmount, CurAmount, INACTIVE, EFFECTIVEDATE, REQUESTEDBY, AUTONOTE) 

Order by SeqNum 
; 

/* -- note test result


*/


--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Validation before insert

-- read data from the join into MyVal 
with MyVal as
(
	select 
		T1.SEQNUM, T1.HDTNUM, T1.REQUESTER, T1.LOAN,
		T1.NEWTISA NewAmount,
		T1.CURTISA CurAmount,
		T1.PAYTYPE INACTIVE,
		
		T2.CurCalledDueDate EFFECTIVEDATE,
		T2.ReqTypeDesc		REQUESTEDBY,
		T2.ReqDesc			AUTONOTE 
	from       DATAUPDT.HDTTISATOZERO T1
	inner join DATAUPDT.HDTCalledDueReason_McDaid T2 
	on  T1.SeqNum = T2.SeqNum
	and T1.HDTNUM = T2.HDTNUM
	and T1.REQUESTER = T2.REQUESTER
	and T1.LOAN = T2.LOAN
	order by T1.SeqNum
) --D (SEQNUM, HDTNUM, REQUESTER, LOAN, NewAmount, CurAmount, INACTIVE, EFFECTIVEDATE, REQUESTEDBY, AUTONOTE) 
 
-- select for new values
select 
SeqNum,
RowCount,  
RowCode,  
UserID, 
CreationDate,  
EffectiveDate,  
TransAmount,  
UspUPB,
TotUPB,

TransInterest,  
TransMIP,  
TransServiceFee,  
LoanNum
 
from
(
SELECT 
D.SeqNum,
-- new values
A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
105 AS RowCode,  
'tkato' AS UserID, 
Current_Date AS CreationDate,  
D.EffectiveDate AS EffectiveDate,  

D.NewAmount                               AS TransAmount,  
A.CURUNSCHEDULEDPAYMENTUPB + D.NewAmount  AS UspUPB,  
A.CURTOTALUPB              + D.NewAmount  AS TotUPB,  
0 AS TransInterest,  
0 AS TransMIP,  
0 AS TransServiceFee,  
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

FROM  --DATAUPDT.HDTNonCashClaimsPayments D
	MyVal D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
)

union

-- select for last values
select 
SeqNum,
RowCount,  
RowCode,  
UserID, 
CreationDate,  
EffectiveDate,  
TransAmount,  
UspUPB,
TotUPB,

TransInterest,  
TransMIP,  
TransServiceFee,  
LoanNum

from
(
SELECT 
D.SeqNum,
A.IDSTRANSACTIONCOUNT as RowCount,
A.IDSTRANSACTIONCODE as RowCode,
A.IDSUSERID as UserID,
A.DTMTRANSACTIONCREATIONDATE as CreationDate,
A.DTMEFFECTIVEDATE as EffectiveDate,
A.CURTRANSACTIONAMT as TransAmount,
A.CURUNSCHEDULEDPAYMENTUPB as UspUPB,
A.CURTOTALUPB as TotUPB,
A.CURTRANSACTIONINTEREST as TransInterest,
A.CURTRANSACTIONMIP as TransMIP,
A.CURTRANSACTIONSERVICEFEE as TransServiceFee,
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
FROM  --DATAUPDT.HDTNonCashClaimsPayments D
	MyVal D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT	
)		
order by SeqNum, RowCount Desc 
;

/*
-------------------------------------------------------------------------------------------------------------------------------------
-- Validation before
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
-- check again right before insertion using select part in the insertion query
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
-- check again again right after insertion using the 2nd part of query above
-------------------------------------------------------------------------------------------------------------------------------------

*/

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
--insert into transaction 
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
CURUNSCHEDULEDPAYMENTUPB, 
CURTOTALUPB, 

CURTRANSACTIONINTEREST,  
CURTRANSACTIONMIP,  
CURTRANSACTIONSERVICEFEE,  

IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, IDSSTATUSCODE, INTSUBSERVICERLOANNUMBER,  
INTFMALOANNUMBER, INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE, CURSCHEDULEDPAYMENTUPB,  CURSCHEDULEDPAYMENTINTEREST, 
CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED,  CURUNSCHEDULEDPAYMENTINTEREST,  CURUNSCHEDULEDPAYINTACCRUED, 
CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, CURREPAYMENTMIP, 
CURORIGTOTALUBP,  CURORIGINALPL, CURCURRENTPL, CURORIGINALNETPL, CURNETPL, 
CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  CURORIGREPAIRSSETASIDE, 
CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, CURORIGTAXINSURSETASIDE, CURTAXINSURSETASIDE, 
CURORIGLOCRESERVE,  CURLOCRESERVE, CURNETLOC , CURSERVICEFEES, CURACCRUEDSERVICEFEES, 
CURPLANCHANGESERVICEFEES,CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  
CHRPLANCHANGEREASON, INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, 
INTEXPECTAVGINTRATE, INTINDEX, INTMARGIN, BLNINTERESTROUND,  BLNLOANSUSPENDED, 
CHRLOANSTATUSREMARKS, CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 
) 

		-- read data from the join into MyVal 
		with MyVal as
		(
			select 
				T1.SEQNUM, T1.HDTNUM, T1.REQUESTER, T1.LOAN,
				T1.NEWTISA NewAmount,
				T1.CURTISA CurAmount,
				T1.PAYTYPE INACTIVE,
				
				T2.CurCalledDueDate EFFECTIVEDATE,
				T2.ReqTypeDesc		REQUESTEDBY,
				T2.ReqDesc			AUTONOTE 
			from       DATAUPDT.HDTTISATOZERO T1
			inner join DATAUPDT.HDTCalledDueReason_McDaid T2 
			on  T1.SeqNum = T2.SeqNum
			and T1.HDTNUM = T2.HDTNUM
			and T1.REQUESTER = T2.REQUESTER
			and T1.LOAN = T2.LOAN
			order by T1.SeqNum
		) --D (SEQNUM, HDTNUM, REQUESTER, LOAN, NewAmount, CurAmount, INACTIVE, EFFECTIVEDATE, REQUESTEDBY, AUTONOTE) 
		 	
SELECT -- -- --  D.seqnum,    --<<<<< COMMENT OUT to update !!!!!!
A.IDSTRANSACTIONCOUNT + 1 AS NewRowCount,  
105 AS RowCode,  
'tkato' AS UserID, 
Current_Date AS CreationDate,  
D.EffectiveDate AS EffectiveDate,  

D.NewAmount                               AS TransAmount,  
A.CURUNSCHEDULEDPAYMENTUPB + D.NewAmount  AS UspUPB,  
A.CURTOTALUPB              + D.NewAmount  AS TotUPB,  
0 AS TransInterest,  
0 AS TransMIP,  
0 AS TransServiceFee,  

A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, A.IDSSTATUSCODE, A.INTSUBSERVICERLOANNUMBER,  
A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE,  
A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE, A.CURSCHEDULEDPAYMENTUPB,  A.CURSCHEDULEDPAYMENTINTEREST, 
A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED,  A.CURUNSCHEDULEDPAYMENTINTEREST,  A.CURUNSCHEDULEDPAYINTACCRUED, 
A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, A.CURREPAYMENTMIP, 
A.CURORIGTOTALUBP,  A.CURORIGINALPL, A.CURCURRENTPL, A.CURORIGINALNETPL, A.CURNETPL, 
A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A. CURSERVICEFEESETASIDE,  A.CURORIGREPAIRSSETASIDE, 
A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, A.CURORIGTAXINSURSETASIDE, A.CURTAXINSURSETASIDE, 
A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, A.CURNETLOC , A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, 
A.CURPLANCHANGESERVICEFEES,  A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  
A.CHRPLANCHANGEREASON, A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, 
A.INTEXPECTAVGINTRATE, A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  A.BLNLOANSUSPENDED, 
A.CHRLOANSTATUSREMARKS, A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO 

--FROM CELINK.TBLTRANSACTIONS A, CELINK.CHOOSELASTRECORD C,  DATAUPDT.NONCASHCLAIMPAYMENTS D
--WHERE A.INTSUBSERVICERLOANNUMBER = D.NONCASHCLAIMPAYMENTS.LOAN 
--AND A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--AND A.IDSTRANSACTIONCOUNT = C.MAXCOUNT

--FROM DATAUPDT.HDTNonCashClaimsPayments D 
FROM MyVal D 

inner join CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER
	
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
order by D.seqnum	
with ur;
; 

		-----------------------------------------------------------------------------------------------------------------------
		-- validation after insert ... using 2nd part of union above

		-- read data from the join into MyVal 
		with MyVal as
		(
			select 
				T1.SEQNUM, T1.HDTNUM, T1.REQUESTER, T1.LOAN,
				T1.NEWTISA NewAmount,
				T1.CURTISA CurAmount,
				T1.PAYTYPE INACTIVE,
				
				T2.CurCalledDueDate EFFECTIVEDATE,
				T2.ReqTypeDesc		REQUESTEDBY,
				T2.ReqDesc			AUTONOTE 
			from       DATAUPDT.HDTTISATOZERO T1
			inner join DATAUPDT.HDTCalledDueReason_McDaid T2 
			on  T1.SeqNum = T2.SeqNum
			and T1.HDTNUM = T2.HDTNUM
			and T1.REQUESTER = T2.REQUESTER
			and T1.LOAN = T2.LOAN
			order by T1.SeqNum
		) --D (SEQNUM, HDTNUM, REQUESTER, LOAN, NewAmount, CurAmount, INACTIVE, EFFECTIVEDATE, REQUESTEDBY, AUTONOTE) 

select 
SeqNum,
RowCount,  
RowCode,  
UserID, 
CreationDate,  
EffectiveDate,  
TransAmount,  
UspUPB,
TotUPB,

TransInterest,  
TransMIP,  
TransServiceFee,  
LoanNum

from
(
SELECT 
D.SeqNum,
A.IDSTRANSACTIONCOUNT as RowCount,
A.IDSTRANSACTIONCODE as RowCode,
A.IDSUSERID as UserID,
A.DTMTRANSACTIONCREATIONDATE as CreationDate,
A.DTMEFFECTIVEDATE as EffectiveDate,
A.CURTRANSACTIONAMT as TransAmount,
A.CURUNSCHEDULEDPAYMENTUPB as UspUPB,
A.CURTOTALUPB as TotUPB,
A.CURTRANSACTIONINTEREST as TransInterest,
A.CURTRANSACTIONMIP as TransMIP,
A.CURTRANSACTIONSERVICEFEE as TransServiceFee,
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
--FROM  DATAUPDT.HDTNonCashClaimsPayments D
FROM  MyVal D
 
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT	
)		
order by SeqNum, RowCount Desc 
;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- end of insert
---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------
-- Note for direct post ,,, 20230427

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)

-- read data from the join into MyVal 
with MyVal as
(
	select 
		T1.SEQNUM, T1.HDTNUM, T1.REQUESTER, T1.LOAN,
		T1.NEWTISA NewAmount,
		T1.CURTISA CurAmount,
		T1.PAYTYPE INACTIVE,
		
		T2.CurCalledDueDate EFFECTIVEDATE,
		T2.ReqTypeDesc		REQUESTEDBY,
		T2.ReqDesc			AUTONOTE 
	from       DATAUPDT.HDTTISATOZERO T1
	inner join DATAUPDT.HDTCalledDueReason_McDaid T2 
	on  T1.SeqNum = T2.SeqNum
	and T1.HDTNUM = T2.HDTNUM
	and T1.REQUESTER = T2.REQUESTER
	and T1.LOAN = T2.LOAN
	order by T1.SeqNum
) --D (SEQNUM, HDTNUM, REQUESTER, LOAN, NewAmount, CurAmount, INACTIVE, EFFECTIVEDATE, REQUESTEDBY, AUTONOTE) 
Select 
--	SeqNum,	
	Loan as "Loan Number",
   'Per HDT ' || P.HDTNum || ' ' || P.AutoNote || ' in the amount of ' || trim(VARCHAR_FORMAT(P.NewAmount, '99999999999990.00')) || '.  Requested by ' ||  P.REQUESTEDBY || '.'as "Loan Note" 
	, CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	4710
from MyVal P  
Order by SeqNum 
; 

/* -- with... select

*/

-----------------------------------------------------------------------------------------------------------
-- Notes validation
-- read data from the join into MyVal 
with MyVal as
(
	select 
		T1.SEQNUM, T1.HDTNUM, T1.REQUESTER, T1.LOAN,
		T1.NEWTISA NewAmount,
		T1.CURTISA CurAmount,
		T1.PAYTYPE INACTIVE,
		
		T2.CurCalledDueDate EFFECTIVEDATE,
		T2.ReqTypeDesc		REQUESTEDBY,
		T2.ReqDesc			AUTONOTE 
	from       DATAUPDT.HDTTISATOZERO T1
	inner join DATAUPDT.HDTCalledDueReason_McDaid T2 
	on  T1.SeqNum = T2.SeqNum
	and T1.HDTNUM = T2.HDTNUM
	and T1.REQUESTER = T2.REQUESTER
	and T1.LOAN = T2.LOAN
	order by T1.SeqNum
) --D (SEQNUM, HDTNUM, REQUESTER, LOAN, NewAmount, CurAmount, INACTIVE, EFFECTIVEDATE, REQUESTEDBY, AUTONOTE)
select 
	seqnum, loan,
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NoteStep --,*
from MyVal p
inner join celink.tblloannotes a  
on  p.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'
order by p.seqnum --a.INTSUBSERVICERLOANNUMBER, a.IDSLOANNOTES desc 
for read only with UR;

/* -- note validation after insertion

*/

 ------ ------- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- -----------
 ------ ------- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- -----------
 ------ ------- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- -----------
-- Ref
 ------ ------- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- -----------
 ------ ------- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- -----------
 ------ ------- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- -----------

-- **** the history of the transaction ... 
SELECT 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT,
	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
	CURTRANSACTIONAMT,
CURUNSCHEDULEDPAYMENTUPB, 
CURTOTALUPB, 
CURTRANSACTIONINTEREST,  
CURTRANSACTIONMIP,  
CURTRANSACTIONSERVICEFEE, 
	
	SYS_START, SYS_END, USER_ID_COL, CHANGE_REC
	FROM CELINK.TBLTRANSACTIONS 
	for system_time from '2023-03-01-00.00.00.000000' to '9999-12-30-00.00.00.000000'
	where INTSUBSERVICERLOANNUMBER = 3115011 and IDSTRANSACTIONCOUNT = 122 -- and IDSTRANSID =  
	order by SYS_END desc
for read only with UR;

-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS     DTMEFFECTIVEDATE CURTRANSACTIONAMT CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE SYS_START                  SYS_END                    USER_ID_COL CHANGE_REC
-- ------------------------ ---------- ------------------- ------------------ ------------- ------------------------ ---------------- ----------------- ------------------------ ----------- ---------------------- ----------------- ------------------------ -------------------------- -------------------------- ----------- ----------
--                3115011.0   61012643                 122                105            70 Liquidated/Held for Sale 2023-05-26            -2084.760000            -63950.460000 -570.050000               0.000000          0.000000                      0.0 2023-05-30 09:15:33.848467 9999-12-30 00:00:00.0      NULL        NULL
--                3115011.0   61011521                 122                105            70 Liquidated/Held for Sale 2023-05-26            -2084.760000            -63950.460000 -570.050000               0.000000          0.000000                      0.0 2023-05-26 16:05:28.653409 2023-05-26 17:04:33.467069 CYNDIE.KING 
