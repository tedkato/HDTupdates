/*
20190627 ... assigned  **** ???? should the resolution be to remove value from  TBLLOANDATA.MONTH13SCHEDPAYAMT only ???? ... YES!!!

	Cyndie.King@celink.com • 9 hours ago
	If a request comes in from Ryan LaRose (or his designate) and there is no file attached but he's provided a list of one or more loans, 
	please set the value in tblLoanData.MONTH13SCHEDPAYAMT to zero.
 
20190626 ... Finding ... **** there is no where in RS to show 13th month payment, verification can only be done with the backend data

INCIDENT # 37295
Ryan LaRose, Chief Operations Officer
Created: Jun 24, 2019 at 9:51 AM

Remove 13th Month Payments
1374699
1375254
1374705
1374077
1375267

--
INCIDENT # 37358

Ryan LaRose, Chief Operations Officer
Created: Jun 25, 2019 at 7:58 AM

FW: Report: rptMonth13PaymentAndHECM30DaysAnniversary
Please remove the 13th month payments.

Celink Loan Number	Loan Closing Date	Loan Funding Date	Loan Closing 1st Anniversary w/Holidays-Weekends	Boarding Trans. Pay Type	Last Tran Pay Type	Last Tran Monthly Payments	Month 13 Scheduled Payment Amount	Last Tran LOC Reserve	Last Tran Repair Setaside	Last Tran First Year Property Charge Setaside	Last Tran Net LOC	Default Balance	Current Loan Status Code Description	Effective Date of 90 or 91	Effective Date of Code 81
1375150	07/27/18	08/01/18	Jul 25, 2019	Modified Term	Modified Term	500		499.999985	80109.92	0	0	74052.67	0	Active		
1375151	07/27/18	08/01/18	Jul 25, 2019	Modified Term	Modified Term	1250	1250.000011	69663.47	0	0	69663.47	0	Active		
1375611	07/27/18	08/01/18	Jul 25, 2019	Modified Tenure	Modified Tenure	800		800.000008	4383.93	0	0	191.27	0	Active		

	Cyndie.King@celink.com • 9 hours ago
	When a request comes in to remove the 13th month payment and has the file rptMonth13PaymentAndHECM30DaysAnniversary attached, 
	please set the field tblLoanData.MONTH13SCHEDPAYAMT to zero for the loans listed in the file.
	This file contains several columns but only the loan number need be used for this process.

--
Cyndie said on Skype ...
Use this verbiate "Per HDT #### 13th month payment has been set to $###.00 to zero."
Insert the appropriate values for the ###s

Per HDT #### 13th month payment has been set to $###.00 to zero.
*/

/*
-- My Val format sample
-- ="(" & B2 & ", 122213, 'Ryan LaRose', " & A2 & "),"
(1, 126793, 'Ryan LaRose', 3267344),
(2, 126793, 'Ryan LaRose', 3267678),
(3, 126793, 'Ryan LaRose', 3267894),
(4, 126793, 'Ryan LaRose', 3268010),
(5, 126793, 'Ryan LaRose', 3268176),
(6, 126793, 'Ryan LaRose', 3268369),
(7, 126793, 'Ryan LaRose', 3268554),
(8, 126793, 'Ryan LaRose', 3268568),
(9, 126793, 'Ryan LaRose', 3268924),
(10, 126793, 'Ryan LaRose', 3269141),
(11, 126793, 'Ryan LaRose', 3269415),
(12, 126793, 'Ryan LaRose', 3270465),
(13, 126793, 'Ryan LaRose', 3270909),
(14, 126793, 'Ryan LaRose', 3270958),
(15, 126793, 'Ryan LaRose', 3271060),
(16, 126793, 'Ryan LaRose', 3271185),
(17, 126793, 'Ryan LaRose', 3272404),
(18, 126793, 'Ryan LaRose', 3272405),
(19, 126793, 'Ryan LaRose', 3272411),
(20, 126793, 'Ryan LaRose', 3272736),
(21, 126793, 'Ryan LaRose', 3273283),
(22, 126793, 'Ryan LaRose', 3273381),
(23, 126793, 'Ryan LaRose', 3274446),
(24, 126793, 'Ryan LaRose', 3274624),
(25, 126793, 'Ryan LaRose', 3274645),
(26, 126793, 'Ryan LaRose', 3274726),
(27, 126793, 'Ryan LaRose', 3275100),
(28, 126793, 'Ryan LaRose', 3275352),
(29, 126793, 'Ryan LaRose', 3275907)
*/

-- ------------------------ ------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
-- ------------------------ ------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
-- HDTS

/*
20250606
[SR-0191873]  Please remove the 13th month payment value for Report: rpt13thMnthPmtNotMatchingMnthlyPmts5Days
6/9/2025 10:51 AM
Matt Schaugaard
="(" & B2 & ", 0191873, 'Matt Schaugaard', " & A2 & "),"
*/

-- ------------------------ ------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
-- ------------------------ ------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------

----------------------
-- 13th month payment
select 
	INTSUBSERVICERLOANNUMBER, MONTH13SCHEDPAYAMT, * 
from CELINK.TBLLOANDATA 
where 	INTSUBSERVICERLOANNUMBER = 3358190
for read only with ur;

	-- INTSUBSERVICERLOANNUMBER MONTH13SCHEDPAYAMT INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP     BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
	-- ------------------------ ------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
	--                3358190.0                0.0                3358190.0     266130007        266130007 HECM        ARM 861         2025-02-13                 2025-01-31 00:00:00.0 2025-01-27 00:00:00.0         580000.000000                           0.0 Line of Credit 100248088803934962 N             N         2025-03-01              0                     0.000000 2025-02-13                          2 1                  0.005 Y                        0.0                0.003 N                -1                0 11600.000000        0.000000                                                                                                            -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 GMFS LLC                                  144072.000000 2024-12-26                 0       0.05   0.0425                1.0                 1       0.0625                   0.0                 37519.75          0.0 0.112500 0.020000                0.0             NULL NULL            0.000000   0.000000          0            2025-02-13              0.0              0.000000 2025-02-13   

		SELECT 
			INTSUBSERVICERLOANNUMBER, MONTH13SCHEDPAYAMT,
			SYS_START, SYS_END, USER_ID_COL, CHANGE_REC
			FROM CELINK.TBLLOANDATA 
			for system_time from '2019-06-01-00.00.00.000000' to '9999-12-30-00.00.00.000000'
			where INTSUBSERVICERLOANNUMBER = 
			order by SYS_END desc
		for read only with UR;
		-- validation	

------------------------------------------------------------------------------------------------------------------
/* -- Global Temp for requested loans
--declare global TEMPORARY TABLE SESSION.UY
--(
--	SeqNum integer,
--	HDTNum integer default 37295, 
--	Requester varchar(30) default 'Ryan LaRose',
--	Loan integer,
--
--	New13th decimal(16,6) default 0.00, 
--	Cur13th decimal(16,6) default 0.00 
----	, NewNotes              varchar (200) -- this column might be used
--)
--ON COMMIT PRESERVE ROWS;
*/


------------------------------------------------------------------------------------------------------------------
/* -- DATAUpdt table
--create table DATAUPDT.HDTDataUpdt_13thMonth ( 
--	SeqNum integer,
--	HDTNum integer,  
--	Requester varchar(30) default 'Ryan LaRose',
--	Loan integer,
--
--	New13th decimal(16,6) default 0.00, 
--	Cur13th decimal(16,6) default 0.00 
--
--	
--		) COMPRESS YES ADAPTIVE IN DATAUPDT_TS16;
--GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTDataUpdt_13thMonth  TO group db2_ast;
--
--	-- drop table DATAUPDT.HDTDataUpdt_13thMonth;
	 select * from DATAUPDT.HDTDataUpdt_13thMonth;
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTDataUpdt_13thMonth;

-------------------------------------------------------------------------------------------------------------------------------------
-- read source data into DATAUPDT table
insert into DATAUPDT.HDTDataUpdt_13thMonth
(SeqNum, HDTNum, Requester, Loan, Cur13th)

with Param
(SeqNum, HDTNum, Requester, Loan) as 
(values

--(1, 0162862, 'Matt Schaugaard', 3311471)
--(1, 0163737, 'Matt Schaugaard', 1347592)
--(1, 172655, 'Matt Schaugaard', 3320325)
--(1, 0177619, 'Jordann Greene', 3350552)
--(1, 0183182, 'Jennifer Dees', 3358190)
--(1, 183664, 'Jennifer Dees', 3356445)
--(1, 187260, 'Jordann Greene', 3358083),
--(2, 187260, 'Jordann Greene', 3358082)
--(1, 187409, 'Ryan LaRose', 3362848)
/* already zero,
--(2, 187369, 'Jennifer Dees', 3358190)
*/

(1, 0191873, 'Matt Schaugaard', 3339255)
)
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, 
	TT.MONTH13SCHEDPAYAMT as Cur13th
--	, TT.INTSUBSERVICERLOANNUMBER
from Param P
inner join celink.TBLLOANDATA TT
on  P.loan = TT.INTSUBSERVICERLOANNUMBER
with ur;
	
		select * from DATAUPDT.HDTDataUpdt_13thMonth order by seqnum;
		-- SEQNUM HDTNUM REQUESTER       LOAN    NEW13TH  CUR13TH
		-- ------ ------ --------------- ------- -------- ---------
		--      1 191873 Matt Schaugaard 3339255 0.000000 68.890000

------------------------------------------------------------------------------------------------------------------
-- Pre-exec Validation 
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan,
	P.New13th, P.Cur13th, TT.MONTH13SCHEDPAYAMT
	, TT.INTSUBSERVICERLOANNUMBER
	
from DATAUPDT.HDTDataUpdt_13thMonth P
inner join celink.TBLLOANDATA TT
on  P.loan = TT.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
with ur;

/*
 SEQNUM HDTNUM REQUESTER       LOAN    NEW13TH  CUR13TH   MONTH13SCHEDPAYAMT INTSUBSERVICERLOANNUMBER
 ------ ------ --------------- ------- -------- --------- ------------------ ------------------------
      1 191873 Matt Schaugaard 3339255 0.000000 68.890000              68.89                3339255.0
*/

-------------------------------------------------------------------- note original ... reinforced 20230430
Select 
	SeqNum,
	Loan
	,
--	'Per HDT ' || HDTNum || ' (' || Requester || ') 13th month payment changed from ' || Cur13th || ' to zero.'
--	'Per HDT ' || HDTNum || ' 13th month payment has been set to zero from ' || Cur13th || '.'
	'Per HDT ' || HDTNum || ' 13th month payment has been set to zero from ' || trim(varchar_format(Cur13th, '99999999999990.00')) || '.' 	as "Loan Note" 
	,
	CURRENT_TIMESTAMP,
	'ted.kato', 
	0
From DATAUPDT.HDTDataUpdt_13thMonth
Order by SeqNum
; 
/*
 SEQNUM LOAN    Loan Note                                                          4                          5        6
 ------ ------- ------------------------------------------------------------------ -------------------------- -------- -
      1 3339255 Per HDT 191873 13th month payment has been set to zero from 68.89. 2025-06-09 11:41:00.288039 ted.kato 0
*/

---------------------------------------------------------------------- note for bulk upload ... decommissioned for now 20230423
--Select 
--	SeqNum,	
--	Loan as "Loan Number",
--	'N'  as "Priority (Y/N)", 
--	''   as "Note Step Number",
--	''   as "Step Date Completed (YYYY-MM-DD)", 
--	'Per HDT ' || HDTNum || ' 13th month payment has been set to zero from ' || trim(varchar_format(Cur13th, '99999999999990.00')) || '.' 	as "Loan Note" 
--	From DATAUPDT.HDTDataUpdt_13thMonth
--Order by SeqNum
--; 
---- C:\Users\ted.kato\Documents\HDTUpdtNotes_124770.csv
--


------------------------------------------------------------------------------------------------------------------
-- update
MERGE INTO celink.TBLLOANDATA TT
	using DATAUPDT.HDTDataUpdt_13thMonth UY
	on    UY.loan = TT.INTSUBSERVICERLOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
	TT.MONTH13SCHEDPAYAMT = New13th
;	

------------------------------------------------------------------------------------------------------------------
-- Validation after 
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan,
	P.New13th, P.Cur13th, TT.MONTH13SCHEDPAYAMT
	, TT.INTSUBSERVICERLOANNUMBER
from DATAUPDT.HDTDataUpdt_13thMonth P
inner join celink.TBLLOANDATA TT
on  P.loan = TT.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
with ur;

/*
 SEQNUM HDTNUM REQUESTER       LOAN    NEW13TH  CUR13TH   MONTH13SCHEDPAYAMT INTSUBSERVICERLOANNUMBER
 ------ ------ --------------- ------- -------- --------- ------------------ ------------------------
      1 191873 Matt Schaugaard 3339255 0.000000 68.890000                0.0                3339255.0
*/

------------------------------------------------------------------------------------------------------------------
-- Note ,,, re-activated 20230501
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY)
Select 
--	SeqNum,
	Loan
	,

--	'Per HDT ' || HDTNum || ' (' || Requester || ') 13th month payment changed from ' || Cur13th || ' to zero.'
--	'Per HDT ' || HDTNum || ' 13th month payment has been set to zero from ' || Cur13th || '.'
	'Per HDT ' || HDTNum || ' 13th month payment has been set to zero from ' || trim(varchar_format(Cur13th, '99999999999990.00')) || '.' 	as "Loan Note" 
	,
	CURRENT_TIMESTAMP,
	'tkato', 
	0
From DATAUPDT.HDTDataUpdt_13thMonth
Order by SeqNum
; 

-- LOAN    Loan Note                                                            3                          4     5
-- ------- -------------------------------------------------------------------- -------------------------- ----- -
-- 3362848 Per HDT 187409 13th month payment has been set to zero from 9320.07. 2025-04-14 11:46:22.001705 tkato 0

------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
from DATAUPDT.HDTDataUpdt_13thMonth UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'
order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;

/*
 SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                       CHRUSERID BLNPRIORITY
 ------ -------------------------- ------------ ------------------------ ------------------------------------------------------------------ --------- -----------
      1 2025-06-09 11:43:07.634496    202445977                3339255.0 Per HDT 191873 13th month payment has been set to zero from 68.89. tkato               0
*/

-- end




------ -------------------------- ------------ ------------------------ ------------------------------------------------------------------ --------- -----------
-- refs:

/* 
-------------------------------------------------------------------- note for bulk upload ... better
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
	'Per HDT ' || HDTNum || ' 13th month payment has been set to zero from ' || trim(varchar_format(Cur13th, '99999999999990.00')) || '.' 	as "Loan Note" 
	From DATAUPDT.HDTDataUpdt_13thMonth
Order by SeqNum
; 


-------------------------------------------------------------------- note for bulk upload ... not so good at numbers editting
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
	'Per HDT ' || HDTNum || ' 13th month payment has been set to zero from ' || Cur13th || '.' 	as "Loan Note" 
	From DATAUPDT.HDTDataUpdt_13thMonth
Order by SeqNum
; 

--C:\Users\ted.kato\Documents\HDTUpdtNotes_115714.csv
*/

-- Validation Notes
--select 
--	a.DTMNOTEDATE,
--	a.IDSLOANNOTES,
--	a.INTSUBSERVICERLOANNUMBER,
--	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
--	from celink.tblloannotes a  
--	where a.CHRLOANNOTES like 'Per HDT 47828%'
--	order by a.IDSLOANNOTES desc 
--for read only with ur;

select 
	a.SeqNum, a.HDTNum, a.Requester, a.Loan,
	a.New13th, a.Cur13th
	,
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
--	from celink.tblloannotes a  where a.INTSUBSERVICERLOANNUMBER in (1394796) order by a.IDSLOANNOTES desc with ur;

	from 
			(
				select 
				M.SeqNum, M.HDTNum, M.Requester, M.Loan, M.New13th, M.Cur13th
				,
				N.DTMNOTEDATE,	N.IDSLOANNOTES,	N.INTSUBSERVICERLOANNUMBER,	N.CHRLOANNOTES, N.CHRUSERID, N.BLNPRIORITY --,*
				from DATAUPDT.HDTDataUpdt_13thMonth M
				inner join celink.tblloannotes N
				ON  M.Loan = N.INTSUBSERVICERLOANNUMBER
				--where M.Loan in () 
				order by M.SeqNum	
			) a
			inner join
			(
				select 
				max(IDSLOANNOTES) MyMax, --max(DTMNOTEDATE) MyMax, --,
				INTSUBSERVICERLOANNUMBER --, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY ,*
				from celink.tblloannotes a
				INNER join DATAUPDT.HDTDataUpdt_13thMonth UY 
				on a.INTSUBSERVICERLOANNUMBER = UY.Loan 
			--	where a.INTSUBSERVICERLOANNUMBER in	()
				group by a.INTSUBSERVICERLOANNUMBER
			--order by IDSLOANNOTES desc
			) x  
			on a.IDSLOANNOTES = x.MyMax --on a.DTMNOTEDATE = x.MyMax 
			and x.INTSUBSERVICERLOANNUMBER = a.INTSUBSERVICERLOANNUMBER
			--and a.INTSUBSERVICERLOANNUMBER in ()
			order by a.seqnum
with ur;



--select 
--	a.DTMNOTEDATE,
--	a.IDSLOANNOTES,
--	a.INTSUBSERVICERLOANNUMBER,
--	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
--	from celink.tblloannotes a  
--	where a.INTSUBSERVICERLOANNUMBER = 
--	order by a.IDSLOANNOTES desc 
--with ur;

	