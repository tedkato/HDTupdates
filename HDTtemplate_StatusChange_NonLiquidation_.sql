
/*
20211104 
V.4 ... To handle loans that already in the requested status ... case occured with #93071 -> #93094 on 20211103
	... This also is to cover below "my note 1"   
	... This version will use "ChangeRequired" flag determine

--
Cyndie King
Nov 03, 2021 at 9:29 PM
Payments were already suspended on loan 1004095 so there was no need to post another suspend payments transaction. 
If a loan is already in the status requested, ignore it for the update but notify the user that this is already in place so no additional updates will have been made.
I spot checked the others and they look fine.

--
Ted Kato
Nov 03, 2021 at 5:55 PM
@Cyndie King
Cyndie,  I have completed the status change for the 19 loans.  Could you please verify?
*Ticket #93071 includes 1 loan (#1004095) which already had the same status as requested.  
My script does not post the status change transaction but it does post a suspend disbursement transaction.  
Please advise if it is the correct way to resolve it.  Thank you!

*/

/* ??????????????????????????????????????????????????????????????????????????????????????????????????????
my note 1
If the current type is the same as requested New Status, DO NOT POST STATUS CHANGE TRANS but DO POST SUSPENDED TRANS

my note 2
		When a Called Due Trans exists in the trans history and corresponding CAFI already populated,
		updaing date in tblStatusTracking is not effective.   
		
		Hi Cyndie, I have just placed todays status change under your queue.
		I tested my script for this set of loans against JAVATest and the posting to tblTransactions is, I beleive, good.  But I want to calrify a few thing for tblStatusTracking updates below...
		
		#1.	Should the date be updated when the current type (Default, Called Due, Foreclosure, Liquid) is already the same as the requested status?
		#2.	Should the date be updated when the status code group is the same for the current type and requested status?  

		
		Sample loans for above items are below 
		#	Loan	New Status	New Eff. Date 	Current Type	Current Called Due Date
		1	1398422	5702	10/28/2021	5702	11/6/2018
		2	1141914	5702	10/28/2021	57	8/4/2021

		Under JAVATest environment, I am not able to validate how CAFI dates are reflected by changes in tblStatusTracking, 
		but I am thinking CAFI dates will not get updated if a transaction exists in the history with the same status code group as it is seen for loan 1141914.
		
-- Cyndie
From: Cyndie King <Cyndie.King@celink.com> 
Sent: Friday, October 29, 2021 9:29 AM
To: Ted Kato <Ted.Kato@celink.com>
Cc: Vicky Cermak <Vicky.Cermak@celink.com>
Subject: RE: JAVATest validation - Status Change Non-Liquidation

The status change request form gives is all the information we need. The current status, the requested status, and the effective date. 
We use the information provided to update the tables. 
Don’t check on the current date in status tracking since they’ve given us an effective date AND because it is known that non-liquid status changes can be back-dated. 
If the user wants the status change to keep the same date, they’ll put that date in the form. 

The CAFI is an animal all its own and doesn’t seem to have much bearing on status tracking 
so please, just update the proper type with the code and date provided as requested

-- Cyndie after validation
[5:51 PM] Cyndie King
There are several fields where the value is BLANK instead of carrying down the value from the previous row. CURNETPL, CURTAXINSURSETASIDE, NETLOC. Please correct your script. I have corrected the loans.
CURNETPL, CURTAXINSURSETASIDE, CURNETLOC.
		
-- My note for the missing 3 columns 
I used TISA to Zero script where these 3 columns are placed in the update columns part in the script because they should be updated.
When I transfered the script to here, I missed these 3 columns in the lower section of columns.  The lower section part in this script is for columns which do not need to be updated .  ounch!!
 		
?????????????????????????????????????????????????????????????????????????????????????????????????????? */

/*
20111025 ... non-liquidation status change template III

-- Cyndie' note
Create a permanent working table with the fields:
	Loan decimal(18,0),
	CurrentStatusCode integer, 
	ErrorMessage char(60) see note below, 
	NewStatusCode integer, 
	EffectiveDate date, 
	Ticket integer, 
	Requester char(30)

	Note: 
	The data change form provided for status changes includes the error message returned when the user attempted to make this change themselves, 
	however, this bit of verbiage quite often includes commas which will make it difficult to import the file into a db2 table from a csv file 
	so you may wish to exclude it from this process as well as the Requester since neither the error message verbiage provided nor the Requester is used 
	for anything in the update.

--There are three parts to the update: (italics from this point refer to the field in the working table)
1) 	Posting the transaction
This is similar to posting the 105s for the Non-cash claim payments.

For each loan in the list you will carry down the data values from the most recent transaction and change only these data points:

IDSTRANSACTIONCOUNT        = IDSTRANSACTIONCOUNT + 1 (just like the 105s)
IDSTRANSACTIONCODE         = NewStatusCode from the list
DTMTRANSACTIONCREATIONDATE = actual posting date (just like the 105s)
IDSUSERID                  = Your UserID
CURTRANSACTIONAMT          = 0
CURTRANSACTIONINTEREST     = 0
CURTRANSACTIONMIP          = 0
DTMEFFECTIVEDATE           = EffectiveDate from the list (Non-liquidating status changes can be backdated)
CHRLOANSTATUSREMARKS       = Select CHRACTIONCODEDESCRIPT From tblActionCodesAll Where idsstatuscode = NewStatusCode;
BLNLOANSUSPENDED           = -1 ... (If restoring the loan to active (status 0 [zero] then this value should be set to zero)
CURTRANSACTIONSERVICEFEE   = 0

--
2)	Updating tblStatusTracking
tblStatusTracking needs to be updated. 
To determine which field needs to be updated use ...
	Select CodeGroup from tblActionCodesAll Where idsstatuscode = NewStatusCode

The result of the sql above determines which fields get updated in status tracking

Result of SQL	Field to Update		Update Value	-	2nd field to Update		2nd Update Value
Default			DefaultType			NewStatusCode	-	DefaultDate				EffectiveDate
CalledDue		CalledDueType		NewStatusCode	-	CalledDueDate			EffectiveDate
Foreclosure		ForeclosureType		NewStatusCode	-	ForeclosureDate			EffectiveDate

--
3) Post the note
Post the note with the simple verbiage “Per HDT Ticket the loan has been forced to status NewStatusCode.

--*-- additional note
From: Cyndie King <Cyndie.King@celink.com> 
Sent: Tuesday, October 26, 2021 10:17 AM
To: Ted Kato <Ted.Kato@celink.com>
Cc: Vicky Cermak <Vicky.Cermak@celink.com>
Subject: RE: JAVATest validation - Status Change Non-Liquidation

Close, very close, but not quite.
The first loan on the list was a liquidation (Liquidations are status codes in the 70 series), you will not be doing these yet. Please continue to send all liquidations to me.
The transaction code is to be the status code not a 105.

And I forgot one step, which I’ve added to the attached sheet. When we put a loan into some non-active status we need to post a Suspend Payment transaction – even if the payments are already suspended. We’re going to combine this step with the status change transaction. 
I’ve added one field to the update specs, the blnLoanSuspended flag in the new transaction needs to be set to -1 (very often this value is already set). If restoring the loan to active status (status 0) the blnLoanSuspended flag needs to be set to zero.

Please post these again and advise.

*/

/*
Template V4 ... based on below ticket ... 
20211104

INCIDENT #93094
Ted Kato
Status Change Requests Non-Liquidation - Multiple tickets 20211103
Created: Nov 03, 2021 at 11:48 AM by Ted Kato
Please update the status for the list of loans attached

StatusChangeTicketNonLiquid_93094.xlsx ... 19 loans

="("&H2&", "&F2& ", '" & G2 & "', " &A2&", "&B2&", "&D2&", '"&TEXT(E2,"YYYY-MM-DD")&"'),"

The loan status updated for below 3 loans.  Could you please verify?
*/

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
/*
20240124
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT 0149946.csv
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTBackup_0152700.csv

[ID:0154288]
Status Change-Non Liquidation-Multiple tickets 20240124
1/24/2024 1:55 PM
Ted Kato

3 tickets combined.
154288	Requester	Row Count
153856	Felicia Cargill	1
154117	Christopher Castaneda	3
154265	Christopher Castaneda	1
5

="("&I2&", "&F2& ", '" & G2 & "', " &A2&", "&B2&", "&D2&", '"&TEXT(E2,"YYYY-MM-DD")&"'),"
Loan status updated for below.  Pending verification.
 HDT #  Requester             Loan Count
 ------ --------------------- ----------
 153856 Felicia Cargill                1
 154117 Christopher Castaneda          3
 154265 Christopher Castaneda          1
*/

/*
Format single ticket ... ="("&I2&", 0160658, 'Dinesh Gadhave', " &A2&", "&B2&", "&D2&", '"&TEXT(E2,"YYYY-MM-DD")&"'),"
="("&I2&", "&F2& ", '" & G2 & "', " &A2&", "&B2&", "&D2&", '"&TEXT(E2,"YYYY-MM-DD")&"'),"
-- My Value Format ...  ="("&I2&", "&F2& ", '" & G2 & "', " &A2&", "&B2&", "&D2&", '"&TEXT(E2,"YYYY-MM-DD")&"'),"
*/

-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------
--HDTs


-------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
---- check status code of against requested code  
--WITH Param (SeqNum ,HDTNum ,Requester ,Loan ,BadStatus ,NewStatus ,EffDate) as
--(VALUES 
--(1, 93695, 'Christopher Castaneda', 1201458, 13, 61, '2021-11-16'),
--(2, 93695, 'Christopher Castaneda', 1378401, 57, 51, '2021-11-16')
--
--)
--SELECT 
--	P.SeqNum, P.HDTNum, P.Requester,
--	P.Loan,
--	X.INTSUBSERVICERLOANNUMBER, 
--	P.BadStatus, P.NewStatus, X.IDSSTATUSCODE, 
--	X.* 
--from Param P
--inner join CELINK.LOANCURRENTSTATUS X --see DDL_View_LOANCurrentStatus 
--	on P.loan = X.INTSUBSERVICERLOANNUMBER
--order by p.SeqNum
--for read only with ur;
--
---- SEQNUM HDTNUM REQUESTER             LOAN    INTSUBSERVICERLOANNUMBER BADSTATUS NEWSTATUS IDSSTATUSCODE INTSUBSERVICERLOANNUMBER IDSSTATUSCODE BLNLOANSUSPENDED
---- ------ ------ --------------------- ------- ------------------------ --------- --------- ------------- ------------------------ ------------- ----------------
----      1  93600 Nadya Laws            3127143                3127143.0        13      5701            13                3127143.0            13               -1
----      2  93600 Nadya Laws            3133556                3133556.0        13      5701            13                3133556.0            13               -1
----      3  93626 Christopher Castaneda 3128271                3128271.0        57        53          5701                3128271.0          5701                0
----      4  93626 Christopher Castaneda 1312574                1312574.0        13        61            13                1312574.0            13               -1
----      5  93626 Christopher Castaneda 1136110                1136110.0        57        61            57                1136110.0            57               -1
----      6  93626 Christopher Castaneda 1136478                1136478.0        57        62            57                1136478.0            57               -1
--
--------------------------------------------------------------------------------
---- check status code of the most recent transaction against requested code  
--WITH Param (SeqNum ,HDTNum ,Requester ,Loan ,BadStatus ,NewStatus ,EffDate) as
--(VALUES 
--
--(1, 93695, 'Christopher Castaneda', 1201458, 13, 61, '2021-11-16'),
--(2, 93695, 'Christopher Castaneda', 1378401, 57, 51, '2021-11-16')
--
--)
--select 
--	P.SeqNum, P.HDTNum, P.Requester,
--	P.Loan,   		TT.INTSUBSERVICERLOANNUMBER, 
--
--					TT.IDSSTATUSCODE as "CurStatus", 
--	P.BadStatus, P.NewStatus,
--	C1.CHRACTIONCODEDESCRIPT  as "BadStatusDesc" , 	C2.CHRACTIONCODEDESCRIPT  as "NewStatusDesc" ,
--	C2.CodeGroup              as "NewStatusGrp",
--	
--	P.EffDate
--	,
--	case when P.NewStatus = TT.IDSSTATUSCODE then 0 else -1 end as ChangeRequired
--
----	/* new values
----	, 105 	 AS "NewTransCode"  
----	, 'tkato' AS "NewUserID" 
----
----	, Current_Date AS "NewCrtDate"  
----	, P.EffDate    AS "NewEffDate"  
----	, 0 AS "NewTransAmt"  
----	, 0 AS "NewTransInt"  
----	, 0 AS "NewTransMIP"  
----	, 0 AS "NewTransSvc" 
----	*/
--	
----	/* **************************************************************************************************** My Ref
----	, 'Ref->' as " - "    
----    , TT.IDSTRANSID              as "CurTransID"
----	, TT.IDSTRANSACTIONCOUNT     as "CurTansCT" 
----	, TT.IDSTRANSACTIONCOUNT + 1 as "NewTransCT"
----	********************************************************************************************************** */
--from  Param P
--inner join celink.tbltransactions TT
--	on  P.loan = TT.INTSUBSERVICERLOANNUMBER
--inner join celink.tblActionCodesAll C1
--	ON    P.BadStatus = C1.IDSSTATUSCODE	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.BadStatus as "BadStatusDesc" ,
--inner join celink.tblActionCodesAll C2 
--	ON    P.NewStatus = C2.IDSSTATUSCODE 	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.NewStatus as "NewStatusDesc" ,
--inner join CELINK.CHOOSELASTRECORD XX
--	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
--	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 
--order by P.SeqNum
--with ur;
--

-- SEQNUM HDTNUM REQUESTER      LOAN    INTSUBSERVICERLOANNUMBER BADSTATUS NEWSTATUS IDSSTATUSCODE INTSUBSERVICERLOANNUMBER IDSSTATUSCODE BLNLOANSUSPENDED
-- ------ ------ -------------- ------- ------------------------ --------- --------- ------------- ------------------------ ------------- ----------------
--      1  94500 Karen Williams 1131643                1131643.0        57      5702            57                1131643.0            57               -1
--      1  94479 Karen Williams 3028660                3028660.0        13      5702            13                3028660.0            13               -1


		------------------------------------------------------------------------------
		------------------------------------------------------------------------------
		-- check CURRENT status code in CELINK.LOANCURRENTSTATUS against requested code  
		------------------------------------------------------------------------------
		SELECT 
			P.SeqNum, P.HDTNum, P.Requester,
			P.Loan,
			X.INTSUBSERVICERLOANNUMBER, 
			P.NewStatus, P.BadStatus,  X.IDSSTATUSCODE, 
			X.* 
		from DATAUPDT.HDTStatusChangeNonLiq P
		inner join CELINK.LOANCURRENTSTATUS X --see DDL_View_LOANCurrentStatus 
			on P.loan = X.INTSUBSERVICERLOANNUMBER
		order by p.SeqNum
		for read only with ur;

	------------------------------------------------------------------------------
		------------------------------------------------------------------------------
		-- check status code of the most recent transaction against requested code  
		------------------------------------------------------------------------------
		select 
			P.SeqNum, P.HDTNum, P.Requester,
			P.Loan,   		TT.INTSUBSERVICERLOANNUMBER, 
		
							TT.IDSSTATUSCODE as "CurStatus", 
			P.BadStatus, P.NewStatus,
			C1.CHRACTIONCODEDESCRIPT  as "BadStatusDesc" , 	C2.CHRACTIONCODEDESCRIPT  as "NewStatusDesc" ,
			C2.CodeGroup              as "NewStatusGrp",
			
			P.EffDate
			,
			case when P.NewStatus = TT.IDSSTATUSCODE then 0 else -1 end as ChangeRequired
		
			/* new values
			, 105 	 AS "NewTransCode"  
			, 'tkato' AS "NewUserID" 
		
			, Current_Date AS "NewCrtDate"  
			, P.EffDate    AS "NewEffDate"  
			, 0 AS "NewTransAmt"  
			, 0 AS "NewTransInt"  
			, 0 AS "NewTransMIP"  
			, 0 AS "NewTransSvc" 
			*/
			
			/* **************************************************************************************************** My Ref
			, 'Ref->' as " - "    
		    , TT.IDSTRANSID              as "CurTransID"
			, TT.IDSTRANSACTIONCOUNT     as "CurTansCT" 
			, TT.IDSTRANSACTIONCOUNT + 1 as "NewTransCT"
			********************************************************************************************************** */
		from  DATAUPDT.HDTStatusChangeNonLiq P
		inner join celink.tbltransactions TT
			on  P.loan = TT.INTSUBSERVICERLOANNUMBER
		inner join celink.tblActionCodesAll C1
			ON    P.BadStatus = C1.IDSSTATUSCODE	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.BadStatus as "BadStatusDesc" ,
		inner join celink.tblActionCodesAll C2 
			ON    P.NewStatus = C2.IDSSTATUSCODE 	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.NewStatus as "NewStatusDesc" ,
		inner join CELINK.CHOOSELASTRECORD XX
			on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
			AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 
		order by P.SeqNum
		with ur;
-- Check 1

-- Check 2
-- SEQNUM HDTNUM REQUESTER           LOAN    INTSUBSERVICERLOANNUMBER CurStatus BADSTATUS NEWSTATUS BadStatusDesc                       NewStatusDesc                  NewStatusGrp         EFFDATE    CHANGEREQUIRED
-- ------ ------ ------------------- ------- ------------------------ --------- --------- --------- ----------------------------------- ------------------------------ -------------------- ---------- --------------
--      1 124772 Madhu Dixit         3021589                3021589.0      5702      5702        13 Called Due: T&I w/At Risk Extension Refer for FCL: Tax & Insurance Foreclosure          2023-04-04             -1
--      2 124822 Christina Rodriguez 1181505                1181505.0        60        60        57 Default: Non-Completed Repairs      Called Due: Tax & Insurance    Called Due           2023-03-08             -1

-- ------ ------ ------------------- ------- ------------------------ --------- --------- --------- ----------------------------------- ------------------------------ -------------------- ---------- --------------
-- begin .....
-- ------ ------ ------------------- ------- ------------------------ --------- --------- --------- ----------------------------------- ------------------------------ -------------------- ---------- --------------

-- /* -- DATAUpdt table  ... contains ...  
--create table DATAUPDT.HDTStatusChangeNonLiq   
--	(
--	SeqNum integer,
--	HDTNum integer, 
--	Requester varchar(30) ,
--	Loan  decimal(18,0),
--	BadStatus integer, 
--	NewStatus integer, 
--	NewStatusDesc varchar (50), 
--	NewStatusGrp  varchar (50),
--	EffDate   Date,
--	ChangeRequired integer default NULL  -- use it 20211104
--	)
--	COMPRESS YES ADAPTIVE
--	IN DATAUPDT_TS16;
--GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTStatusChangeNonLiq  TO group db2_ast;
--	
--	-- drop table DATAUPDT.HDTStatusChangeNonLiq;
--	 select * from DATAUPDT.HDTStatusChangeNonLiq;
--	 
----*/

-- ------ ------ ------------------- ------- ------------------------ --------- --------- --------- ----------------------------------- ------------------------------ -------------------- ---------- --------------
-- Clear DATAUPDT table ... my table
DELETE from DATAUPDT.HDTStatusChangeNonLiq;
	
-- source	
insert into DATAUPDT.HDTStatusChangeNonLiq
(
	SeqNum ,
	HDTNum , 
	Requester ,
	Loan  ,
	BadStatus , 
	NewStatus , 
	NewStatusDesc , 
	NewStatusGrp  ,
	EffDate ,
	ChangeRequired  	
)
WITH Param (SeqNum ,HDTNum ,Requester ,Loan ,BadStatus ,NewStatus ,EffDate) as
(VALUES 

(1, 192320, 'Penny Neel-Henn', 1367383, 57, 5701, '2025-06-13'),
(2, 192320, 'Penny Neel-Henn', 1170945, 13, 5701, '2025-06-13'),
(3, 192320, 'Penny Neel-Henn', 1311919, 57, 5701, '2025-06-13'),
(4, 192320, 'Penny Neel-Henn', 1184220, 57, 5701, '2025-06-13'),
(5, 192320, 'Penny Neel-Henn', 3127334, 13, 5701, '2025-06-13'),
(6, 192360, 'Christopher Castaneda', 3115477, 13, 61, '2025-06-13')

)
select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan,   		--TT.INTSUBSERVICERLOANNUMBER, 

					--TT.IDSSTATUSCODE as "CurStatus", 
	P.BadStatus, 	--C1.CHRACTIONCODEDESCRIPT  as "BadStatusDesc" ,
	P.NewStatus, 	
	C2.CHRACTIONCODEDESCRIPT  as "NewStatusDesc" ,
	C2.CodeGroup              as "NewStatusGrp",
	
	P.EffDate
	,
	case when P.NewStatus = TT.IDSSTATUSCODE then 0 else -1 end as ChangeRequired

	/* new values
	, 105 	 AS "NewTransCode"  
	, 'tkato' AS "NewUserID" 

	, Current_Date AS "NewCrtDate"  
	, P.EffDate    AS "NewEffDate"  
	, 0 AS "NewTransAmt"  
	, 0 AS "NewTransInt"  
	, 0 AS "NewTransMIP"  
	, 0 AS "NewTransSvc" 
	*/
	
	/* **************************************************************************************************** My Ref
	, 'Ref->' as " - "    
    , TT.IDSTRANSID              as "CurTransID"
	, TT.IDSTRANSACTIONCOUNT     as "CurTansCT" 
	, TT.IDSTRANSACTIONCOUNT + 1 as "NewTransCT"
	********************************************************************************************************** */
from  Param P
inner join celink.tbltransactions TT
	on  P.loan = TT.INTSUBSERVICERLOANNUMBER
inner join celink.tblActionCodesAll C1
	ON    P.BadStatus = C1.IDSSTATUSCODE	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.BadStatus as "BadStatusDesc" ,
inner join celink.tblActionCodesAll C2 
	ON    P.NewStatus = C2.IDSSTATUSCODE 	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.NewStatus as "NewStatusDesc" ,
inner join CELINK.CHOOSELASTRECORD XX
	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 
order by P.SeqNum
with ur;	  

-- My Ref - Status Desc PAYTYPE ---------------------------------
select * from DATAUPDT.HDTStatusChangeNonLiq order by SeqNum;

			------------------------------------------------------------------------------
			-- check status code of the most recent transaction against requested code  
			------------------------------------------------------------------------------
			select 
				P.SeqNum, P.HDTNum, P.Requester,
				P.Loan,   		TT.INTSUBSERVICERLOANNUMBER, 
			
								TT.IDSSTATUSCODE as "CurStatus", 
				P.BadStatus, P.NewStatus,
				C1.CHRACTIONCODEDESCRIPT  as "BadStatusDesc" , 	C2.CHRACTIONCODEDESCRIPT  as "NewStatusDesc" ,
				C2.CodeGroup              as "NewStatusGrp",
				
				P.EffDate
				,
				case when P.NewStatus = TT.IDSSTATUSCODE then 0 else -1 end as ChangeRequired
			from  DATAUPDT.HDTStatusChangeNonLiq P
			inner join celink.tbltransactions TT
				on  P.loan = TT.INTSUBSERVICERLOANNUMBER
			inner join celink.tblActionCodesAll C1
				ON    P.BadStatus = C1.IDSSTATUSCODE	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.BadStatus as "BadStatusDesc" ,
			inner join celink.tblActionCodesAll C2 
				ON    P.NewStatus = C2.IDSSTATUSCODE 	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.NewStatus as "NewStatusDesc" ,
			inner join CELINK.CHOOSELASTRECORD XX
				on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
				AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 
			order by P.SeqNum
			with ur;

-- check 1
-- SEQNUM HDTNUM REQUESTER             LOAN    BADSTATUS NEWSTATUS NEWSTATUSDESC                         NEWSTATUSGRP         EFFDATE    CHANGEREQUIRED
-- ------ ------ --------------------- ------- --------- --------- ------------------------------------- -------------------- ---------- --------------

-- check 2
-- SEQNUM HDTNUM REQUESTER             LOAN    INTSUBSERVICERLOANNUMBER CurStatus BADSTATUS NEWSTATUS BadStatusDesc                  NewStatusDesc                    NewStatusGrp         EFFDATE    CHANGEREQUIRED
-- ------ ------ --------------------- ------- ------------------------ --------- --------- --------- ------------------------------ -------------------------------- -------------------- ---------- --------------
--      1 192320 Penny Neel-Henn       1367383                1367383.0        57        57      5701 Called Due: Tax & Insurance    Called Due: T&I w/Repayment Plan Called Due           2025-06-13             -1
--      2 192320 Penny Neel-Henn       1170945                1170945.0        13        13      5701 Refer for FCL: Tax & Insurance Called Due: T&I w/Repayment Plan Called Due           2025-06-13             -1
--      3 192320 Penny Neel-Henn       1311919                1311919.0        57        57      5701 Called Due: Tax & Insurance    Called Due: T&I w/Repayment Plan Called Due           2025-06-13             -1
--      4 192320 Penny Neel-Henn       1184220                1184220.0        57        57      5701 Called Due: Tax & Insurance    Called Due: T&I w/Repayment Plan Called Due           2025-06-13             -1
--      5 192320 Penny Neel-Henn       3127334                3127334.0        13        13      5701 Refer for FCL: Tax & Insurance Called Due: T&I w/Repayment Plan Called Due           2025-06-13             -1
--      6 192360 Christopher Castaneda 3115477                3115477.0        13        13        61 Refer for FCL: Tax & Insurance Default: Taxes                   Default              2025-06-13             -1

--------------------------------------------------------------------------------------------
-- Dup check
select Loan, count(*) from DATAUPDT.HDTStatusChangeNonLiq group by Loan having count(*) >1 ;
-- LOAN 2
-- ---- -
-- 

-- ------ --------------------- ----------
-- HDT#/Loan count   
select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count"  from DATAUPDT.HDTStatusChangeNonLiq group by HDTNUM, Requester; 
-- HDT #  Requester             Loan Count
-- ------ --------------------- ----------
-- 192320 Penny Neel-Henn                5
-- 192360 Christopher Castaneda          1


------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
-- Post the note with the simple verbiage “Per HDT Ticket the loan has been forced to status NewStatusCode.
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	'0'   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
-- 'Per HDT ' || UY.HDTNum || ' The loan has been forced to status ' || UY.NewStatus  || '.' as "Loan Note" 
'Per HDT ' || UY.HDTNum || ' The loan has been forced to status ' || UY.NewStatus  || '.(' || VARCHAR_FORMAT(CURRENT_TIMESTAMP (0),'YYYY-MM-DD HH24:MI:SS', 'en_US') || ')' as "Loan Note"

	from DATAUPDT.HDTStatusChangeNonLiq UY
	where UY.ChangeRequired = -1 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4 ... not to generate note !!!!! 
Order by SeqNum 
; 

-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- ----------------------------------------------------------------------------
--      1     1367383 N              0                                                 Per HDT 192320 The loan has been forced to status 5701.(2025-06-13 17:07:13)
--      2     1170945 N              0                                                 Per HDT 192320 The loan has been forced to status 5701.(2025-06-13 17:07:13)
--      3     1311919 N              0                                                 Per HDT 192320 The loan has been forced to status 5701.(2025-06-13 17:07:13)
--      4     1184220 N              0                                                 Per HDT 192320 The loan has been forced to status 5701.(2025-06-13 17:07:13)
--      5     3127334 N              0                                                 Per HDT 192320 The loan has been forced to status 5701.(2025-06-13 17:07:13)
--      6     3115477 N              0                                                 Per HDT 192360 The loan has been forced to status 61.(2025-06-13 17:07:13)

-------------------------------------------------------------------------------------------------------------------------------------
-- Validation before ... rows to be inserted 
------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
	D.SeqNum,
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
	D.NewStatus as RowCode,  
	'tkato' AS UserID, 
	
	D.NewStatus as StatusCode,  
	D.NewStatusDesc as StatusRemarks,
	
	Current_Date AS CreationDate,  
	D.EffDate AS EffectiveDate,  
	
	0.00 AS TransAmount,  
	0.00 AS TransInterest,  
	0.00 AS TransMIP,  
	0.00 AS TransServiceFee,  
	
	-- ... -1 as LoanSuspended,
	case D.NewStatusGrp
		when 'Default' then -1
		when 'Liquid'  then -1
		when 'Called Due' then -1
		when 'Foreclosure' then -1
		else 0
	end as LoanSuspended, 
	A.INTSUBSERVICERLOANNUMBER  as LoanNum
FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
	
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

where D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4

order by D.SeqNum
for read only with ur;
 	
-- SEQNUM ROWCOUNT ROWCODE USERID STATUSCODE STATUSREMARKS                  CREATIONDATE EFFECTIVEDATE TRANSAMOUNT TRANSINTEREST TRANSMIP TRANSSERVICEFEE LOANSUSPENDED LOANNUM
-- ------ -------- ------- ------ ---------- ------------------------------ ------------ ------------- ----------- ------------- -------- --------------- ------------- ---------

-- ------ -------- ------- ------ ---------- ------------------------------ ------------ ------------- ----------- ------------- -------- --------------- ------------- ---------
-- ------ -------- ------- ------ ---------- ------------------------------ ------------ ------------- ----------- ------------- -------- --------------- ------------- ---------
-- Post #1 ... Validation before Post #1 update ... compare count against above  ... use below with SeqNum
-- ------ -------- ------- ------ ---------- ------------------------------ ------------ ------------- ----------- ------------- -------- --------------- ------------- ---------
-- ------ -------- ------- ------ ---------- ------------------------------ ------------ ------------- ----------- ------------- -------- --------------- ------------- ---------

-- select for new values
SELECT 
	SeqNum,
	RowCount,  
	RowCode,  
	UserID,
	
	StatusCode,
	StatusRemarks,
	 
	CreationDate,  
	EffectiveDate,  
	
	TransAmount,  
	TransInterest,  
	TransMIP,  
	TransServiceFee,  
	
	LoanSuspended,
	
	LoanNum
from
(
SELECT 
	D.SeqNum,
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
	D.NewStatus as RowCode,  
	'tkato' AS UserID, 
	
	D.NewStatus as StatusCode,  
	D.NewStatusDesc as StatusRemarks,
	
	Current_Date AS CreationDate,  
	D.EffDate AS EffectiveDate,  
	
	0.00 AS TransAmount,  
	0.00 AS TransInterest,  
	0.00 AS TransMIP,  
	0.00 AS TransServiceFee,  
	
	-- below case does not work for a change from 15 to 0, use hard coded -1 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	-- ... -1 as LoanSuspended,
	case D.NewStatusGrp
		when 'Default' then -1
		when 'Liquid'  then -1
		when 'Called Due' then -1
		when 'Foreclosure' then -1
		else 0
	end as LoanSuspended, 
	A.INTSUBSERVICERLOANNUMBER  as LoanNum
FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

where D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
   	
)
----------------------------------------------------
UNION  ---------- !!!!! UNION !!!!! ----------------
----------------------------------------------------
-- below to fetch the most recent trans
select 
	SeqNum,
	RowCount,  
	RowCode,  
	UserID,
	
	StatusCode,
	StatusRemarks,
	 
	CreationDate,  
	EffectiveDate,  
	
	TransAmount,  
	TransInterest,  
	TransMIP,  
	TransServiceFee,  
	
	LoanSuspended,
	
	LoanNum
from
(
SELECT 
	D.SeqNum,
	A.IDSTRANSACTIONCOUNT as RowCount,
	A.IDSTRANSACTIONCODE as RowCode,
	A.IDSUSERID as UserID,
	
	A.IDSSTATUSCODE as StatusCode,
	A.CHRLOANSTATUSREMARKS as StatusRemarks, 
	
	A.DTMTRANSACTIONCREATIONDATE as CreationDate,
	A.DTMEFFECTIVEDATE as EffectiveDate,
	
	A.CURTRANSACTIONAMT as TransAmount,
	A.CURTRANSACTIONINTEREST as TransInterest,
	A.CURTRANSACTIONMIP as TransMIP,
	A.CURTRANSACTIONSERVICEFEE as TransServiceFee,
	
	A.BLNLOANSUSPENDED as LoanSuspended, 
	
	A.INTSUBSERVICERLOANNUMBER as LoanNum
FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

where D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4

)		
order by SeqNum, RowCount Desc 
;

-- ------ -------- ------- ---------- ---------- ------------------------------------- ------------ ------------- ----------- ------------- ---------- --------------- ------------- ---------
-- SEQNUM ROWCOUNT ROWCODE USERID STATUSCODE STATUSREMARKS                    CREATIONDATE EFFECTIVEDATE TRANSAMOUNT  TRANSINTEREST TRANSMIP  TRANSSERVICEFEE LOANSUSPENDED LOANNUM
-- ------ -------- ------- ------ ---------- -------------------------------- ------------ ------------- ------------ ------------- --------- --------------- ------------- ---------
--      1      247    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1367383.0
--      1      246      92 Batch          57 Called Due: Tax & Insurance      2025-06-09   2025-06-09       30.000000      0.100000  0.010000             0.0            -1 1367383.0

--      2      488    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1170945.0
--      2      487      92 Batch          13 Refer for FCL: Tax & Insurance   2025-06-09   2025-06-09       30.000000      0.120000  0.020000            0.01            -1 1170945.0

--      3      312    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1311919.0
--      3      311      92 Batch          57 Called Due: Tax & Insurance      2025-06-09   2025-06-09       30.000000      0.140000  0.020000            0.01            -1 1311919.0

--      4      322    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1184220.0
--      4      321      91 Batch          57 Called Due: Tax & Insurance      2025-06-12   2025-06-12     1942.170000      4.850000  1.200000            0.29            -1 1184220.0

--      5      203    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 3127334.0
--      5      202      81 BATCH          13 Refer for FCL: Tax & Insurance   2025-06-04   2025-06-03     -254.380000     -1.400000 -0.240000             0.0            -1 3127334.0

--      6      148      61 tkato          61 Default: Taxes                   2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 3115477.0
--      6      147      81 BATCH          13 Refer for FCL: Tax & Insurance   2025-06-11   2025-06-10    -4000.000000    -16.150000 -2.740000             0.0            -1 3115477.0

-- ------ -------- ------- ------ ---------- ----------------------------------------- ------------ ------------- ----------- ------------- ---------- --------------- ------------- ---------
-- ------ -------- ------- ------ ---------- ----------------------------------------- ------------ ------------- ----------- ------------- ---------- --------------- ------------- ---------
-- check again right before insertion with below select part
-- ------ -------- ------- ------ ---------- ----------------------------------------- ------------ ------------- ----------- ------------- ---------- --------------- ------------- ---------

-- ------ -------- ------- ------ ---------- ----------------------------------------- ------------ ------------- ----------- ------------- ---------- --------------- ------------- ---------
-- after
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ------------------------------ -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- --------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSUSERID IDSSTATUSCODE CHRLOANSTATUSREMARKS             DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE BLNLOANSUSPENDED INTSUBSERVICERLOANNUMBER CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO
-- ------ ------------------------ ------------------- ------------------ --------- ------------- -------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
--      1                1367383.0                 247               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1367383.0              5616.220000 207266.700000 HB1RBIT20           4800             4800              0.0 000950651319     HECM        Line of Credit ARM 857         2008-04-23     2008-04-18     2018-06-01               201650.480000                84654.820000                  0.000000            6288.660000                  0.000000                    368.840000                    0.100000                 2.370000                    0.010000        -5486.090000            18.220000        1.700000    97699.750000 103840.000000 201886.890000     97699.750000  -9993.840000     160000.000000         160000.000000               6140.250000           4614.030000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -4377.620000  -9993.840000      35.000000           7210.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0363            0.0597              0.0554   0.0397      0.02                0 1022.430000      NULL NULL        NULL
--      1                1367383.0                 246                 92 Batch                57 Called Due: Tax & Insurance      2025-06-09                 2025-06-09               30.000000               0.100000          0.010000                      0.0               -1                1367383.0              5616.220000 207266.700000 HB1RBIT20           4800             4800              0.0 000950651319     HECM        Line of Credit ARM 857         2008-04-23     2008-04-18     2018-06-01               201650.480000                84654.820000                  0.000000            6288.660000                  0.000000                    368.840000                    0.100000                 2.370000                    0.010000        -5486.090000            18.220000        1.700000    97699.750000 103840.000000 201886.890000     97699.750000  -9993.840000     160000.000000         160000.000000               6140.250000           4614.030000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -4377.620000  -9993.840000      35.000000           7210.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0363            0.0597              0.0554   0.0397      0.02                0 1022.430000      NULL NULL        NULL

--      2                1170945.0                 488               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1170945.0            120268.400000 206778.350000 RMFRMFHCM1          6800             6800              0.0 004315876961     HECM        Line of Credit ARM 858         2014-06-18     2014-06-13     2021-12-01                86509.950000                32750.580000                  0.000000            1559.620000                  0.000000                  34402.760000                    0.970000              1605.030000                    0.170000       -19509.320000            66.570000       13.370000    46061.130000  93210.000000 177035.550000     47148.870000 -29742.800000     195000.000000         195000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      47148.870000  90525.600000 -29742.800000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02904           0.07186              0.0544  0.04436    0.0275                0  159.850000      NULL NULL        NULL
--      2                1170945.0                 487                 92 Batch                13 Refer for FCL: Tax & Insurance   2025-06-09                 2025-06-09               30.000000               0.120000          0.020000                     0.01               -1                1170945.0            120268.400000 206778.350000 RMFRMFHCM1          6800             6800              0.0 004315876961     HECM        Line of Credit ARM 858         2014-06-18     2014-06-13     2021-12-01                86509.950000                32750.580000                  0.000000            1559.620000                  0.000000                  34402.760000                    0.970000              1605.030000                    0.170000       -19509.320000            66.570000       13.370000    46061.130000  93210.000000 177035.550000     47148.870000 -29742.800000     195000.000000         195000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      47148.870000  90525.600000 -29742.800000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02904           0.07186              0.0544  0.04436    0.0275                0  159.850000      NULL NULL        NULL

--      3                1311919.0                 312               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1311919.0             41353.920000 484867.170000 RMFRMFHCM1          6800             6800              0.0 001977970325     HECM        Line of Credit ARM 860         2017-07-31     2017-07-24     2021-12-01               443513.250000               118737.160000                  0.000000            1303.370000                  0.000000                   3006.800000                   -4.650000                 0.000000                   -0.700000       -59147.060000           193.600000       36.210000   272700.000000 272700.000000 447244.460000         0.000000 -37622.710000     450000.000000         450000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000   3731.210000 -37622.710000       0.000000              0.000000                 0.000000                 0.000000      311.830000          0.000000          0.000000                                 0                 0         0.04365            0.0838             0.04925  0.05755   0.02625                0 1214.170000      NULL NULL        NULL
--      3                1311919.0                 311                 92 Batch                57 Called Due: Tax & Insurance      2025-06-09                 2025-06-09               30.000000               0.140000          0.020000                     0.01               -1                1311919.0             41353.920000 484867.170000 RMFRMFHCM1          6800             6800              0.0 001977970325     HECM        Line of Credit ARM 860         2017-07-31     2017-07-24     2021-12-01               443513.250000               118737.160000                  0.000000            1303.370000                  0.000000                   3006.800000                   -4.650000                 0.000000                   -0.700000       -59147.060000           193.600000       36.210000   272700.000000 272700.000000 447244.460000         0.000000 -37622.710000     450000.000000         450000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000   3731.210000 -37622.710000       0.000000              0.000000                 0.000000                 0.000000      311.830000          0.000000          0.000000                                 0                 0         0.04365            0.0838             0.04925  0.05755   0.02625                0 1214.170000      NULL NULL        NULL

--      4                1184220.0                 322               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1184220.0             19828.910000 152429.790000 HB1RBIT21           4800             4800              0.0 001058464266     HECM        Lump Sum       Fixed           2014-11-25     2014-11-20     2999-01-01               132600.880000                51466.750000                  0.000000            6203.800000                  0.000000                   3281.460000                    3.850000                 0.000000                    0.950000       -10071.000000            93.030000       22.950000    68420.000000  68420.000000 132600.770000         0.000000 -15736.780000     110000.000000         110000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000 -15736.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0506            0.0506              0.0506   0.0506       0.0                0  343.000000      NULL NULL        NULL
--      4                1184220.0                 321                 91 Batch                57 Called Due: Tax & Insurance      2025-06-12                 2025-06-12             1942.170000               4.850000          1.200000                     0.29               -1                1184220.0             19828.910000 152429.790000 HB1RBIT21           4800             4800              0.0 001058464266     HECM        Lump Sum       Fixed           2014-11-25     2014-11-20     2999-01-01               132600.880000                51466.750000                  0.000000            6203.800000                  0.000000                   3281.460000                    3.850000                 0.000000                    0.950000       -10071.000000            93.030000       22.950000    68420.000000  68420.000000 132600.770000         0.000000 -15736.780000     110000.000000         110000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000 -15736.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0506            0.0506              0.0506   0.0506       0.0                0  343.000000      NULL NULL        NULL

--      5                3127334.0                 203               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                3127334.0             14089.350000  72316.780000 FAHB24HB18     266130007        266130007              0.0 005121632354     HECM        Line of Credit ARM 860         2015-02-03     2015-01-27     2019-10-07                58227.430000                18876.900000                  0.000000               0.000000                  0.000000                   2154.490000                   -1.400000                 0.000000                   -0.240000        -5814.350000            23.530000        4.630000    16978.370000  25254.000000  45473.300000         0.000000 -26843.480000      46000.000000          46000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -12754.130000 -26843.480000       0.000000              0.000000                 0.000000                 0.000000      168.410000          0.000000          0.000000                                 0                 0         0.03122           0.07454              0.0444  0.04954     0.025                0 2148.530000      NULL NULL        NULL
--      5                3127334.0                 202                 81 BATCH                13 Refer for FCL: Tax & Insurance   2025-06-04                 2025-06-03             -254.380000              -1.400000         -0.240000                      0.0               -1                3127334.0             14089.350000  72316.780000 FAHB24HB18     266130007        266130007              0.0 005121632354     HECM        Line of Credit ARM 860         2015-02-03     2015-01-27     2019-10-07                58227.430000                18876.900000                  0.000000               0.000000                  0.000000                   2154.490000                   -1.400000                 0.000000                   -0.240000        -5814.350000            23.530000        4.630000    16978.370000  25254.000000  45473.300000         0.000000 -26843.480000      46000.000000          46000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -12754.130000 -26843.480000       0.000000              0.000000                 0.000000                 0.000000      168.410000          0.000000          0.000000                                 0                 0         0.03122           0.07454              0.0444  0.04954     0.025                0 2148.530000      NULL NULL        NULL

--      6                3115477.0                 148                 61 tkato                61 Default: Taxes                   2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                3115477.0              3219.360000 283859.980000 FAHB24HB19     266130007        266130007              0.0 005711275474     HECM        Line of Credit ARM 860         2014-11-10     2014-11-05     2019-10-07               280640.620000                94719.040000                  0.000000           10127.600000                  0.000000                    579.640000                  -16.150000                 0.000000                   -2.740000       -15690.010000            30.660000        7.180000    72325.500000 154530.000000 279181.530000         0.000000  -4678.450000     255000.000000         255000.000000                  0.000000              0.000000           20392.500000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -1459.090000  -4678.450000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03054           0.07368              0.0506  0.04868     0.025                0 4515.550000      NULL NULL        NULL
--      6                3115477.0                 147                 81 BATCH                13 Refer for FCL: Tax & Insurance   2025-06-11                 2025-06-10            -4000.000000             -16.150000         -2.740000                      0.0               -1                3115477.0              3219.360000 283859.980000 FAHB24HB19     266130007        266130007              0.0 005711275474     HECM        Line of Credit ARM 860         2014-11-10     2014-11-05     2019-10-07               280640.620000                94719.040000                  0.000000           10127.600000                  0.000000                    579.640000                  -16.150000                 0.000000                   -2.740000       -15690.010000            30.660000        7.180000    72325.500000 154530.000000 279181.530000         0.000000  -4678.450000     255000.000000         255000.000000                  0.000000              0.000000           20392.500000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -1459.090000  -4678.450000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03054           0.07368              0.0506  0.04868     0.025                0 4515.550000      NULL NULL        NULL

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- Post #1 ... insert statsu change transaction 
------------------------------------------------------------------------------------------------------------------------------------------
--UPDate DATAUPDT.HDTStatusChangeNonLiq set ChangeRequired = 0 where seqnum = 1; -- this is to remove duplicate 

INSERT INTO CELINK.TBLTRANSACTIONS 
(
	-- -- -- D.SeqNum,
	IDSTRANSACTIONCOUNT,  -- as RowCount,
	IDSTRANSACTIONCODE,   -- as RowCode,
	IDSUSERID,            -- as UserID,
	
	IDSSTATUSCODE,        -- as StatusCode,
	CHRLOANSTATUSREMARKS, -- as StatusRemarks, 
	
	DTMTRANSACTIONCREATIONDATE, -- as CreationDate,
	DTMEFFECTIVEDATE,           -- as EffectiveDate,
	
	CURTRANSACTIONAMT,        -- as TransAmount,
	CURTRANSACTIONINTEREST,   -- as TransInterest,
	CURTRANSACTIONMIP,        -- as TransMIP,
	CURTRANSACTIONSERVICEFEE, -- as TransServiceFee,
	
	BLNLOANSUSPENDED,         -- as LoanSuspended, 
	
	INTSUBSERVICERLOANNUMBER, -- as LoanNum
	
	--
	CURUNSCHEDULEDPAYMENTUPB,  
	CURTOTALUPB,  
	
	IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, 
	-- -- --A.IDSSTATUSCODE, 
	-- -- --A.INTSUBSERVICERLOANNUMBER,  
	INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
	DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE,
	CURSCHEDULEDPAYMENTUPB,  
	CURSCHEDULEDPAYMENTINTEREST, 
	CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
	-- -- -- CURUNSCHEDULEDPAYMENTUPB, 
	CURUNSCHEDULEDPAYMENTINTEREST,  
	CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
	CURREPAYMENTMIP, CURORIGTOTALUBP,  
	-- -- --CURTOTALUPB, 
	CURORIGINALPL, CURCURRENTPL, 
	CURORIGINALNETPL	,	--	40	

	CURNETPL	,	--	41 *****	

	CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
	CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  
	CURFIRSTYRPROPCHARGESETASIDE, 
	CURORIGTAXINSURSETASIDE, 

	CURTAXINSURSETASIDE	,	--	51 *****

	CURORIGLOCRESERVE,  
	CURLOCRESERVE, 
	CURNETLOC	,	--	54 *****	
	
	CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  

	CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
	INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
	INTINDEX, INTMARGIN, BLNINTERESTROUND,  
	-- -- --BLNLOANSUSPENDED, 
	-- -- --CHRLOANSTATUSREMARKS, 
	CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 

)

SELECT 
-- -- -- D.SeqNum, -- this is to check right before insert to see what will be inserted
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
	D.NewStatus as RowCode,  
	'tkato' AS UserID, 
	
	D.NewStatus as StatusCode,  
	D.NewStatusDesc as StatusRemarks,
	
	Current_Date AS CreationDate,  
	D.EffDate AS EffectiveDate,  
	
	0.00 AS TransAmount,  
	0.00 AS TransInterest,  
	0.00 AS TransMIP,  
	0.00 AS TransServiceFee,  
	
-1 as LoanSuspended, --20220309 to handle to change from 15(Bankruptcy) to 0(Active) ... as referenceing ticket #94152
--	case D.NewStatusGrp
--		when 'Default' then -1
--		when 'Liquid'  then -1
--		when 'Called Due' then -1
--		when 'Foreclosure' then -1
--		when 'Bankruptcy' then -1
--		else 0
--	end as LoanSuspended, 
	
	
	A.INTSUBSERVICERLOANNUMBER  as LoanNum,
	
	--  
	A.CURUNSCHEDULEDPAYMENTUPB,  
	A.CURTOTALUPB,  
	
	A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, 
	-- -- --A.IDSSTATUSCODE, 
	-- -- --A.INTSUBSERVICERLOANNUMBER,  
	A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
	A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE,
	A.CURSCHEDULEDPAYMENTUPB,  
	A.CURSCHEDULEDPAYMENTINTEREST, 
	A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, 
	-- -- -- A.CURUNSCHEDULEDPAYMENTUPB, 
	A.CURUNSCHEDULEDPAYMENTINTEREST,  
	A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
	A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  

	-- -- -- A.CURTOTALUPB, 
	A.CURORIGINALPL, A.CURCURRENTPL, 
	A.CURORIGINALNETPL, 

	A.CURNETPL	,	--	41 *****	
	
	A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
	
	A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, 
	A.CURORIGTAXINSURSETASIDE, 
	
	A.CURTAXINSURSETASIDE	,	--	51 *****
	
	A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, 
	A.CURNETLOC	,	--	54 *****	
	
	A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
	A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
	A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
	A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  
	-- -- --A.BLNLOANSUSPENDED, 
	-- -- --A.CHRLOANSTATUSREMARKS, 
	A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO 

FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
	
where D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4

order by D.SeqNum
;

		------------------------------------------------------
		-- validation AFTER status change post 
		select 
			D.SeqNum,
			A.INTSUBSERVICERLOANNUMBER, 
		
		IDSTRANSACTIONCOUNT,  -- as RowCount,
		IDSTRANSACTIONCODE,   -- as RowCode,
		IDSUSERID,            -- as UserID,
		
		IDSSTATUSCODE,        -- as StatusCode,
		CHRLOANSTATUSREMARKS, -- as StatusRemarks, 
		
		DTMTRANSACTIONCREATIONDATE, -- as CreationDate,
		DTMEFFECTIVEDATE,           -- as EffectiveDate,
		
		CURTRANSACTIONAMT,        -- as TransAmount,
		CURTRANSACTIONINTEREST,   -- as TransInterest,
		CURTRANSACTIONMIP,        -- as TransMIP,
		CURTRANSACTIONSERVICEFEE, -- as TransServiceFee,
		
		BLNLOANSUSPENDED,         -- as LoanSuspended, 
		
		INTSUBSERVICERLOANNUMBER, -- as LoanNum
		
		--
		CURUNSCHEDULEDPAYMENTUPB,  
		CURTOTALUPB,  
		
		IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, 
		--A.IDSSTATUSCODE, 
		--A.INTSUBSERVICERLOANNUMBER,  
		INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
		DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE,
		CURSCHEDULEDPAYMENTUPB,  
		CURSCHEDULEDPAYMENTINTEREST, 
		CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
		-- -- --CURUNSCHEDULEDPAYMENTUPB, 
		CURUNSCHEDULEDPAYMENTINTEREST,  
		CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
		CURREPAYMENTMIP, CURORIGTOTALUBP,  

		-- -- --CURTOTALUPB, 
		CURORIGINALPL, CURCURRENTPL, 
		CURORIGINALNETPL, 

		CURNETPL	,	--	41 *****	
		
		CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
		CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, 
		CURORIGTAXINSURSETASIDE, 

		CURTAXINSURSETASIDE	,	--	51 *****

		CURORIGLOCRESERVE,  CURLOCRESERVE, 
		CURNETLOC	,	--	54 *****	
	
		CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
	
		CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
		INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
		INTINDEX, INTMARGIN, BLNINTERESTROUND,  
		--BLNLOANSUSPENDED, 
		--CHRLOANSTATUSREMARKS, 
		CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 

		FROM  DATAUPDT.HDTStatusChangeNonLiq D
		
		INNER JOIN CELINK.TBLTRANSACTIONS A
			on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
		
		inner join CELINK.CHOOSELASTRECORD C
			on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
			AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 1  -- fecth the last one and newly inserted
		
		order by D.SeqNum, IDSTRANSACTIONCOUNT desc
		for read only with ur
		;

		-- copy result, paste them above

-- (check the stars)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ********                                                                                                                                                                                                                            *******************                                 *********                                 
-- SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSUSERID IDSSTATUSCODE CHRLOANSTATUSREMARKS                      DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE BLNLOANSUSPENDED INTSUBSERVICERLOANNUMBER CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------



-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- Post #2 ... insert suspended transaction -- Validation before posting suspended transaction
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
--UPDate DATAUPDT.HDTStatusChangeNonLiq set ChangeRequired = 0 where seqnum = 1;

-- select for new values
SELECT 
	SeqNum,
	RowCount,  
	RowCode,  
	UserID,
	
	StatusCode,
	StatusRemarks,
	 
	CreationDate,  
	EffectiveDate,  
	
	TransAmount,  
	TransInterest,  
	TransMIP,  
	TransServiceFee,  
	
	LoanSuspended,
	
	LoanNum
from
(
SELECT 
	D.SeqNum,
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
	
	--1 as RowCode,  
	--1 as RowCode_Suspended,  --20220623 ... commented, use below case, RowCode must be 2 (02-Resume-Disbursements) for the new status of 0(Active)   
	case D.NewStatusGrp
		when 'Default' then 1
		when 'Liquid'  then 1
		when 'Called Due' then 1
		when 'Foreclosure' then 1
		when 'Bankruptcy' then 1
		else 2
	end as RowCode, 
	
	'tkato' AS UserID, 
	
	D.NewStatus as StatusCode,  
	D.NewStatusDesc as StatusRemarks,
	
	Current_Date AS CreationDate,  
	D.EffDate AS EffectiveDate,  
	
	0.00 AS TransAmount,  
	0.00 AS TransInterest,  
	0.00 AS TransMIP,  
	0.00 AS TransServiceFee,  
	
	/*
	-1 as LoanSuspended,
	--case D.NewStatusGrp
	--	when 'Default' then -1
	--	when 'Liquid'  then -1
	--	when 'Called Due' then -1
	--	else 0
	--end as LoanSuspended, 
	*/
	-- -1 as LoanSuspended,  --20220623 ... commented, use below case 
	case D.NewStatusGrp
		when 'Default' then -1
		when 'Liquid'  then -1
		when 'Called Due' then -1
		when 'Foreclosure' then -1
		when 'Bankruptcy' then -1
		else 0
	end as LoanSuspended, 
	
			
	A.INTSUBSERVICERLOANNUMBER  as LoanNum

FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
-- where D.NewStatusGrp in ('Default', 'Called Due', 'Foreclosure', 'Bankruptcy') ... commented out to handle change from 15 to 0 !!!!!!!!!!!!!!!!!!!!!!!!!!
AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
	
)
----------------------------------------------------
UNION  ---------- !!!!! UNION !!!!! ----------------
----------------------------------------------------
-- below to fetch the most recent trans
select 
	SeqNum,
	RowCount,  
	RowCode,  
	UserID,
	
	StatusCode,
	StatusRemarks,
	 
	CreationDate,  
	EffectiveDate,  
	
	TransAmount,  
	TransInterest,  
	TransMIP,  
	TransServiceFee,  
	
	LoanSuspended,
	
	LoanNum
from
(
SELECT 
	D.SeqNum,
	A.IDSTRANSACTIONCOUNT as RowCount,
	A.IDSTRANSACTIONCODE as RowCode,
	A.IDSUSERID as UserID,
	
	A.IDSSTATUSCODE as StatusCode,
	A.CHRLOANSTATUSREMARKS as StatusRemarks, 
	
	A.DTMTRANSACTIONCREATIONDATE as CreationDate,
	A.DTMEFFECTIVEDATE as EffectiveDate,
	
	A.CURTRANSACTIONAMT as TransAmount,
	A.CURTRANSACTIONINTEREST as TransInterest,
	A.CURTRANSACTIONMIP as TransMIP,
	A.CURTRANSACTIONSERVICEFEE as TransServiceFee,
	
	A.BLNLOANSUSPENDED as LoanSuspended, 
	
	A.INTSUBSERVICERLOANNUMBER as LoanNum
FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 1 -- to compare the new suspended post and most recent 2 ... the last is my status change post, 2nd is the existed.

WHERE D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
)		
order by SeqNum, RowCount Desc 
;

-- ------ -------- ------- ---------- ---------- ------------------------------------- ------------ ------------- ----------- ------------- ---------- --------------- ------------- ---------
-- SEQNUM ROWCOUNT ROWCODE USERID STATUSCODE STATUSREMARKS                    CREATIONDATE EFFECTIVEDATE TRANSAMOUNT  TRANSINTEREST TRANSMIP  TRANSSERVICEFEE LOANSUSPENDED LOANNUM
-- ------ -------- ------- ------ ---------- -------------------------------- ------------ ------------- ------------ ------------- --------- --------------- ------------- ---------
--      1      248       1 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1367383.0
--      1      247    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1367383.0
--      1      246      92 Batch          57 Called Due: Tax & Insurance      2025-06-09   2025-06-09       30.000000      0.100000  0.010000             0.0            -1 1367383.0

--      2      489       1 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1170945.0
--      2      488    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1170945.0
--      2      487      92 Batch          13 Refer for FCL: Tax & Insurance   2025-06-09   2025-06-09       30.000000      0.120000  0.020000            0.01            -1 1170945.0

--      3      313       1 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1311919.0
--      3      312    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1311919.0
--      3      311      92 Batch          57 Called Due: Tax & Insurance      2025-06-09   2025-06-09       30.000000      0.140000  0.020000            0.01            -1 1311919.0

--      4      323       1 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1184220.0
--      4      322    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 1184220.0
--      4      321      91 Batch          57 Called Due: Tax & Insurance      2025-06-12   2025-06-12     1942.170000      4.850000  1.200000            0.29            -1 1184220.0

--      5      204       1 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 3127334.0
--      5      203    5701 tkato        5701 Called Due: T&I w/Repayment Plan 2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 3127334.0
--      5      202      81 BATCH          13 Refer for FCL: Tax & Insurance   2025-06-04   2025-06-03     -254.380000     -1.400000 -0.240000             0.0            -1 3127334.0

--      6      149       1 tkato          61 Default: Taxes                   2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 3115477.0
--      6      148      61 tkato          61 Default: Taxes                   2025-06-13   2025-06-13        0.000000      0.000000  0.000000             0.0            -1 3115477.0
--      6      147      81 BATCH          13 Refer for FCL: Tax & Insurance   2025-06-11   2025-06-10    -4000.000000    -16.150000 -2.740000             0.0            -1 3115477.0

-- ------ -------- ----------------- ------ ---------- ------------------------------------- ------------ ------------- ----------- ------------- -------- --------------- ------------- --------- ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- check the new insertion again before insert
-- ------ -------- ----------------- ------ ---------- ------------------------------------- ------------ ------------- ----------- ------------- -------- --------------- ------------- --------- ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- ROWCOUNT ROWCODE_SUSPENDED USERID STATUSCODE STATUSREMARKS      CREATIONDATE EFFECTIVEDATE TRANSAMOUNT TRANSINTEREST TRANSMIP TRANSSERVICEFEE LOANSUSPENDED LOANNUM   CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO
-- -------- ----------------- ------ ---------- ------------------ ------------ ------------- ----------- ------------- -------- --------------- ------------- --------- ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
--      298                 2 tkato           0 Active             2024-01-24   2024-01-16           0.00          0.00     0.00            0.00             0 1204237.0             44157.010000  90174.140000 HB1RBIT21           4800             4800              0.0 004944208155     HECM        Line of Credit ARM 860         2015-03-10     2015-03-04     2999-01-01                46017.130000                 6929.620000                  0.000000             463.690000                  0.000000                   2091.740000                    0.180000               444.480000                    0.040000       -29088.830000            55.380000       16.990000    28028.800000  50298.000000  82677.680000     20119.200000  -7496.460000      83000.000000          83000.000000                  0.000000              0.000000            2150.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      22269.200000  36660.550000  -7496.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0343           0.06081               0.049  0.03331    0.0275                0    0.000000      NULL NULL        NULL
--      210                 1 tkato          62 Default: Insurance 2024-01-24   2024-01-23           0.00          0.00     0.00            0.00            -1 1337079.0              6731.310000 165373.930000 HB1RBIT20           4800             4800              0.0 000950831351     HECM        Line of Credit ARM 857         2008-09-15     2008-09-10     2017-12-01               158642.620000                53095.560000                  0.000000            6453.650000                  0.000000                    178.670000                    5.980000                 0.000000                    0.440000        -2576.060000             4.620000        0.730000    90492.780000  96324.000000 159943.160000     90492.780000  -9390.380000     138000.000000         138000.000000               5831.220000           3959.610000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -2659.070000  -9390.380000      35.000000           6475.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0383            0.0701              0.0544   0.0526    0.0175                0  588.060000      NULL NULL        NULL
--      224                 1 tkato          62 Default: Insurance 2024-01-24   2024-01-23           0.00          0.00     0.00            0.00            -1 1381899.0             11687.010000 307219.060000 RMF_FNMA_9     249240001        234790013    6.000646639E9 000950993617     HECM        Line of Credit ARM 857         2009-04-06     2009-03-31     2018-09-01               295532.050000               122560.650000                  0.000000            5776.510000                  0.000000                   1816.620000                   -7.710000                 0.000000                   -0.480000        -9842.610000            31.400000        2.570000   152149.670000 158155.000000 297844.500000    152149.670000 -13907.300000     235000.000000         235000.000000               6005.330000           4532.740000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -2220.290000 -13907.300000      35.000000           6195.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0334            0.0801              0.0549   0.0526    0.0275                0 2757.010000      NULL NULL        NULL
--      251                 1 tkato          62 Default: Insurance 2024-01-24   2024-01-23           0.00          0.00     0.00            0.00            -1 1169301.0              7751.870000 111562.470000 RMFRMFHCM1          6800             6800              0.0 005440743727     HECM        Lump Sum       Fixed           2014-05-29     2014-05-23     2999-01-01               103810.600000                37723.560000                  0.000000            5378.620000                 -5.100000                    489.240000                    0.740000                52.670000                    0.190000        -6592.670000            13.790000        3.400000    56784.000000  56784.000000 103826.810000         0.000000  -7141.710000     104000.000000         104000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  -7141.710000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0506            0.0506              0.0506   0.0506       0.0                0    0.000000      NULL NULL        NULL
--      129                 1 tkato          62 Default: Insurance 2024-01-24   2024-01-24           0.00          0.00     0.00            0.00            -1 1364673.0              8969.400000 201020.490000 BG2046              6800             6800              0.0 005111980564     HECM        Line of Credit ARM 860         2018-05-08     2018-05-03     2021-12-01               192051.090000                38515.920000                  0.000000            9841.800000                 -2.630000                    386.690000                    0.860000                 0.000000                    0.160000        -3392.320000            10.160000        2.400000   129609.510000 143220.000000 196220.680000         0.000000  -4799.810000     210000.000000         210000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            13610.490000            0.000000          0.000000   4169.590000  -4799.810000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0503           0.06531              0.0527  0.04281    0.0225                0 1357.460000      NULL NULL        NULL

-- ------ -------- ----------------- ------ ---------- ------------------------------------- ------------ ------------- ----------- ------------- -------- --------------- ------------- --------- ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- check the new insertion again again after insert
-- ------ -------- ----------------- ------ ---------- ------------------------------------- ------------ ------------- ----------- ------------- -------- --------------- ------------- --------- ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSUSERID IDSSTATUSCODE CHRLOANSTATUSREMARKS             DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE BLNLOANSUSPENDED INTSUBSERVICERLOANNUMBER CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO
-- ------ ------------------------ ------------------- ------------------ --------- ------------- -------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
--      1                1367383.0                 248                  1 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1367383.0              5616.220000 207266.700000 HB1RBIT20           4800             4800              0.0 000950651319     HECM        Line of Credit ARM 857         2008-04-23     2008-04-18     2018-06-01               201650.480000                84654.820000                  0.000000            6288.660000                  0.000000                    368.840000                    0.100000                 2.370000                    0.010000        -5486.090000            18.220000        1.700000    97699.750000 207266.700000 103840.000000 201886.890000     97699.750000  -9993.840000     160000.000000         160000.000000               6140.250000           4614.030000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -4377.620000  -9993.840000      35.000000           7210.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0363            0.0597              0.0554   0.0397      0.02                0 1022.430000      NULL NULL        NULL
--      1                1367383.0                 247               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1367383.0              5616.220000 207266.700000 HB1RBIT20           4800             4800              0.0 000950651319     HECM        Line of Credit ARM 857         2008-04-23     2008-04-18     2018-06-01               201650.480000                84654.820000                  0.000000            6288.660000                  0.000000                    368.840000                    0.100000                 2.370000                    0.010000        -5486.090000            18.220000        1.700000    97699.750000 207266.700000 103840.000000 201886.890000     97699.750000  -9993.840000     160000.000000         160000.000000               6140.250000           4614.030000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -4377.620000  -9993.840000      35.000000           7210.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0363            0.0597              0.0554   0.0397      0.02                0 1022.430000      NULL NULL        NULL
--      1                1367383.0                 246                 92 Batch                57 Called Due: Tax & Insurance      2025-06-09                 2025-06-09               30.000000               0.100000          0.010000                      0.0               -1                1367383.0              5616.220000 207266.700000 HB1RBIT20           4800             4800              0.0 000950651319     HECM        Line of Credit ARM 857         2008-04-23     2008-04-18     2018-06-01               201650.480000                84654.820000                  0.000000            6288.660000                  0.000000                    368.840000                    0.100000                 2.370000                    0.010000        -5486.090000            18.220000        1.700000    97699.750000 207266.700000 103840.000000 201886.890000     97699.750000  -9993.840000     160000.000000         160000.000000               6140.250000           4614.030000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -4377.620000  -9993.840000      35.000000           7210.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0363            0.0597              0.0554   0.0397      0.02                0 1022.430000      NULL NULL        NULL
--      2                1170945.0                 489                  1 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1170945.0            120268.400000 206778.350000 RMFRMFHCM1          6800             6800              0.0 004315876961     HECM        Line of Credit ARM 858         2014-06-18     2014-06-13     2021-12-01                86509.950000                32750.580000                  0.000000            1559.620000                  0.000000                  34402.760000                    0.970000              1605.030000                    0.170000       -19509.320000            66.570000       13.370000    46061.130000 206778.350000  93210.000000 177035.550000     47148.870000 -29742.800000     195000.000000         195000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      47148.870000  90525.600000 -29742.800000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02904           0.07186              0.0544  0.04436    0.0275                0  159.850000      NULL NULL        NULL
--      2                1170945.0                 488               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1170945.0            120268.400000 206778.350000 RMFRMFHCM1          6800             6800              0.0 004315876961     HECM        Line of Credit ARM 858         2014-06-18     2014-06-13     2021-12-01                86509.950000                32750.580000                  0.000000            1559.620000                  0.000000                  34402.760000                    0.970000              1605.030000                    0.170000       -19509.320000            66.570000       13.370000    46061.130000 206778.350000  93210.000000 177035.550000     47148.870000 -29742.800000     195000.000000         195000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      47148.870000  90525.600000 -29742.800000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02904           0.07186              0.0544  0.04436    0.0275                0  159.850000      NULL NULL        NULL
--      2                1170945.0                 487                 92 Batch                13 Refer for FCL: Tax & Insurance   2025-06-09                 2025-06-09               30.000000               0.120000          0.020000                     0.01               -1                1170945.0            120268.400000 206778.350000 RMFRMFHCM1          6800             6800              0.0 004315876961     HECM        Line of Credit ARM 858         2014-06-18     2014-06-13     2021-12-01                86509.950000                32750.580000                  0.000000            1559.620000                  0.000000                  34402.760000                    0.970000              1605.030000                    0.170000       -19509.320000            66.570000       13.370000    46061.130000 206778.350000  93210.000000 177035.550000     47148.870000 -29742.800000     195000.000000         195000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      47148.870000  90525.600000 -29742.800000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02904           0.07186              0.0544  0.04436    0.0275                0  159.850000      NULL NULL        NULL
--      3                1311919.0                 313                  1 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1311919.0             41353.920000 484867.170000 RMFRMFHCM1          6800             6800              0.0 001977970325     HECM        Line of Credit ARM 860         2017-07-31     2017-07-24     2021-12-01               443513.250000               118737.160000                  0.000000            1303.370000                  0.000000                   3006.800000                   -4.650000                 0.000000                   -0.700000       -59147.060000           193.600000       36.210000   272700.000000 484867.170000 272700.000000 447244.460000         0.000000 -37622.710000     450000.000000         450000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000   3731.210000 -37622.710000       0.000000              0.000000                 0.000000                 0.000000      311.830000          0.000000          0.000000                                 0                 0         0.04365            0.0838             0.04925  0.05755   0.02625                0 1214.170000      NULL NULL        NULL
--      3                1311919.0                 312               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1311919.0             41353.920000 484867.170000 RMFRMFHCM1          6800             6800              0.0 001977970325     HECM        Line of Credit ARM 860         2017-07-31     2017-07-24     2021-12-01               443513.250000               118737.160000                  0.000000            1303.370000                  0.000000                   3006.800000                   -4.650000                 0.000000                   -0.700000       -59147.060000           193.600000       36.210000   272700.000000 484867.170000 272700.000000 447244.460000         0.000000 -37622.710000     450000.000000         450000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000   3731.210000 -37622.710000       0.000000              0.000000                 0.000000                 0.000000      311.830000          0.000000          0.000000                                 0                 0         0.04365            0.0838             0.04925  0.05755   0.02625                0 1214.170000      NULL NULL        NULL
--      3                1311919.0                 311                 92 Batch                57 Called Due: Tax & Insurance      2025-06-09                 2025-06-09               30.000000               0.140000          0.020000                     0.01               -1                1311919.0             41353.920000 484867.170000 RMFRMFHCM1          6800             6800              0.0 001977970325     HECM        Line of Credit ARM 860         2017-07-31     2017-07-24     2021-12-01               443513.250000               118737.160000                  0.000000            1303.370000                  0.000000                   3006.800000                   -4.650000                 0.000000                   -0.700000       -59147.060000           193.600000       36.210000   272700.000000 484867.170000 272700.000000 447244.460000         0.000000 -37622.710000     450000.000000         450000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000   3731.210000 -37622.710000       0.000000              0.000000                 0.000000                 0.000000      311.830000          0.000000          0.000000                                 0                 0         0.04365            0.0838             0.04925  0.05755   0.02625                0 1214.170000      NULL NULL        NULL
--      4                1184220.0                 323                  1 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1184220.0             19828.910000 152429.790000 HB1RBIT21           4800             4800              0.0 001058464266     HECM        Lump Sum       Fixed           2014-11-25     2014-11-20     2999-01-01               132600.880000                51466.750000                  0.000000            6203.800000                  0.000000                   3281.460000                    3.850000                 0.000000                    0.950000       -10071.000000            93.030000       22.950000    68420.000000 152429.790000  68420.000000 132600.770000         0.000000 -15736.780000     110000.000000         110000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000 -15736.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0506            0.0506              0.0506   0.0506       0.0                0  343.000000      NULL NULL        NULL
--      4                1184220.0                 322               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                1184220.0             19828.910000 152429.790000 HB1RBIT21           4800             4800              0.0 001058464266     HECM        Lump Sum       Fixed           2014-11-25     2014-11-20     2999-01-01               132600.880000                51466.750000                  0.000000            6203.800000                  0.000000                   3281.460000                    3.850000                 0.000000                    0.950000       -10071.000000            93.030000       22.950000    68420.000000 152429.790000  68420.000000 132600.770000         0.000000 -15736.780000     110000.000000         110000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000 -15736.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0506            0.0506              0.0506   0.0506       0.0                0  343.000000      NULL NULL        NULL
--      4                1184220.0                 321                 91 Batch                57 Called Due: Tax & Insurance      2025-06-12                 2025-06-12             1942.170000               4.850000          1.200000                     0.29               -1                1184220.0             19828.910000 152429.790000 HB1RBIT21           4800             4800              0.0 001058464266     HECM        Lump Sum       Fixed           2014-11-25     2014-11-20     2999-01-01               132600.880000                51466.750000                  0.000000            6203.800000                  0.000000                   3281.460000                    3.850000                 0.000000                    0.950000       -10071.000000            93.030000       22.950000    68420.000000 152429.790000  68420.000000 132600.770000         0.000000 -15736.780000     110000.000000         110000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000 -15736.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0506            0.0506              0.0506   0.0506       0.0                0  343.000000      NULL NULL        NULL
--      5                3127334.0                 204                  1 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                3127334.0             14089.350000  72316.780000 FAHB24HB18     266130007        266130007              0.0 005121632354     HECM        Line of Credit ARM 860         2015-02-03     2015-01-27     2019-10-07                58227.430000                18876.900000                  0.000000               0.000000                  0.000000                   2154.490000                   -1.400000                 0.000000                   -0.240000        -5814.350000            23.530000        4.630000    16978.370000  72316.780000  25254.000000  45473.300000         0.000000 -26843.480000      46000.000000          46000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -12754.130000 -26843.480000       0.000000              0.000000                 0.000000                 0.000000      168.410000          0.000000          0.000000                                 0                 0         0.03122           0.07454              0.0444  0.04954     0.025                0 2148.530000      NULL NULL        NULL
--      5                3127334.0                 203               5701 tkato              5701 Called Due: T&I w/Repayment Plan 2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                3127334.0             14089.350000  72316.780000 FAHB24HB18     266130007        266130007              0.0 005121632354     HECM        Line of Credit ARM 860         2015-02-03     2015-01-27     2019-10-07                58227.430000                18876.900000                  0.000000               0.000000                  0.000000                   2154.490000                   -1.400000                 0.000000                   -0.240000        -5814.350000            23.530000        4.630000    16978.370000  72316.780000  25254.000000  45473.300000         0.000000 -26843.480000      46000.000000          46000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -12754.130000 -26843.480000       0.000000              0.000000                 0.000000                 0.000000      168.410000          0.000000          0.000000                                 0                 0         0.03122           0.07454              0.0444  0.04954     0.025                0 2148.530000      NULL NULL        NULL
--      5                3127334.0                 202                 81 BATCH                13 Refer for FCL: Tax & Insurance   2025-06-04                 2025-06-03             -254.380000              -1.400000         -0.240000                      0.0               -1                3127334.0             14089.350000  72316.780000 FAHB24HB18     266130007        266130007              0.0 005121632354     HECM        Line of Credit ARM 860         2015-02-03     2015-01-27     2019-10-07                58227.430000                18876.900000                  0.000000               0.000000                  0.000000                   2154.490000                   -1.400000                 0.000000                   -0.240000        -5814.350000            23.530000        4.630000    16978.370000  72316.780000  25254.000000  45473.300000         0.000000 -26843.480000      46000.000000          46000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -12754.130000 -26843.480000       0.000000              0.000000                 0.000000                 0.000000      168.410000          0.000000          0.000000                                 0                 0         0.03122           0.07454              0.0444  0.04954     0.025                0 2148.530000      NULL NULL        NULL
--      6                3115477.0                 149                  1 tkato                61 Default: Taxes                   2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                3115477.0              3219.360000 283859.980000 FAHB24HB19     266130007        266130007              0.0 005711275474     HECM        Line of Credit ARM 860         2014-11-10     2014-11-05     2019-10-07               280640.620000                94719.040000                  0.000000           10127.600000                  0.000000                    579.640000                  -16.150000                 0.000000                   -2.740000       -15690.010000            30.660000        7.180000    72325.500000 283859.980000 154530.000000 279181.530000         0.000000  -4678.450000     255000.000000         255000.000000                  0.000000              0.000000           20392.500000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -1459.090000  -4678.450000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03054           0.07368              0.0506  0.04868     0.025                0 4515.550000      NULL NULL        NULL
--      6                3115477.0                 148                 61 tkato                61 Default: Taxes                   2025-06-13                 2025-06-13                0.000000               0.000000          0.000000                      0.0               -1                3115477.0              3219.360000 283859.980000 FAHB24HB19     266130007        266130007              0.0 005711275474     HECM        Line of Credit ARM 860         2014-11-10     2014-11-05     2019-10-07               280640.620000                94719.040000                  0.000000           10127.600000                  0.000000                    579.640000                  -16.150000                 0.000000                   -2.740000       -15690.010000            30.660000        7.180000    72325.500000 283859.980000 154530.000000 279181.530000         0.000000  -4678.450000     255000.000000         255000.000000                  0.000000              0.000000           20392.500000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -1459.090000  -4678.450000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03054           0.07368              0.0506  0.04868     0.025                0 4515.550000      NULL NULL        NULL
--      6                3115477.0                 147                 81 BATCH                13 Refer for FCL: Tax & Insurance   2025-06-11                 2025-06-10            -4000.000000             -16.150000         -2.740000                      0.0               -1                3115477.0              3219.360000 283859.980000 FAHB24HB19     266130007        266130007              0.0 005711275474     HECM        Line of Credit ARM 860         2014-11-10     2014-11-05     2019-10-07               280640.620000                94719.040000                  0.000000           10127.600000                  0.000000                    579.640000                  -16.150000                 0.000000                   -2.740000       -15690.010000            30.660000        7.180000    72325.500000 283859.980000 154530.000000 279181.530000         0.000000  -4678.450000     255000.000000         255000.000000                  0.000000              0.000000           20392.500000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -1459.090000  -4678.450000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03054           0.07368              0.0506  0.04868     0.025                0 4515.550000      NULL NULL        NULL

-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- Post #2 ... post a suspended transaction into DATAUPDT table
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
INSERT INTO CELINK.TBLTRANSACTIONS 
(
-- -- D.SeqNum,
IDSTRANSACTIONCOUNT,  -- as RowCount,
IDSTRANSACTIONCODE,   -- as RowCode,
IDSUSERID,            -- as UserID,

IDSSTATUSCODE,        -- as StatusCode,
CHRLOANSTATUSREMARKS, -- as StatusRemarks, 

DTMTRANSACTIONCREATIONDATE, -- as CreationDate,
DTMEFFECTIVEDATE,           -- as EffectiveDate,

CURTRANSACTIONAMT,        -- as TransAmount,
CURTRANSACTIONINTEREST,   -- as TransInterest,
CURTRANSACTIONMIP,        -- as TransMIP,
CURTRANSACTIONSERVICEFEE, -- as TransServiceFee,

BLNLOANSUSPENDED,         -- as LoanSuspended, 

INTSUBSERVICERLOANNUMBER, -- as LoanNum

--
CURUNSCHEDULEDPAYMENTUPB,  
CURTOTALUPB,  

IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, 
--A.IDSSTATUSCODE, 
--A.INTSUBSERVICERLOANNUMBER,  
INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE,
CURSCHEDULEDPAYMENTUPB,  
CURSCHEDULEDPAYMENTINTEREST, 
CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
-- -- --CURUNSCHEDULEDPAYMENTUPB, 
CURUNSCHEDULEDPAYMENTINTEREST,  
CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
CURREPAYMENTMIP, CURORIGTOTALUBP,  

-- -- --CURTOTALUPB, 
CURORIGINALPL, CURCURRENTPL, 
CURORIGINALNETPL, 

CURNETPL	,	--	41 *****	

CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, 
CURORIGTAXINSURSETASIDE, 

CURTAXINSURSETASIDE	,	--	51 *****

CURORIGLOCRESERVE,  CURLOCRESERVE, 

CURNETLOC	,	--	54 *****	

CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
INTINDEX, INTMARGIN, BLNINTERESTROUND,  
--BLNLOANSUSPENDED, 
--CHRLOANSTATUSREMARKS, 
CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 
)

SELECT 
-- -- -- D.SeqNum,
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
	
	
	-- 1 as RowCode_Suspended,  
	-- 1 as RowCode_Suspended,  --20220623 ... commented, use below case, RowCode must be 2 (02-Resume-Disbursements) for the new status of 0(Active)   
	case D.NewStatusGrp
		when 'Default' then 1
		when 'Liquid'  then 1
		when 'Called Due' then 1
		when 'Foreclosure' then 1
		when 'Bankruptcy' then 1
		else 2
	end as RowCode_Suspended, 
		
	'tkato' AS UserID, 
	
	D.NewStatus as StatusCode,  
	D.NewStatusDesc as StatusRemarks,
	
	Current_Date AS CreationDate,  
	D.EffDate AS EffectiveDate,  
	
	0.00 AS TransAmount,  
	0.00 AS TransInterest,  
	0.00 AS TransMIP,  
	0.00 AS TransServiceFee,  
	
	/*
	-1 as LoanSuspended,
	--case D.NewStatusGrp
	--	when 'Default' then -1
	--	when 'Liquid'  then -1
	--	when 'Called Due' then -1
	--	else 0
	--end as LoanSuspended, 
	*/
	-- -1 as LoanSuspended,  --20220623 ... commented, use below case 
	case D.NewStatusGrp
		when 'Default' then -1
		when 'Liquid'  then -1
		when 'Called Due' then -1
		when 'Foreclosure' then -1
		when 'Bankruptcy' then -1
		else 0
	end as LoanSuspended, 
		
	A.INTSUBSERVICERLOANNUMBER  as LoanNum,
	
	--  
	A.CURUNSCHEDULEDPAYMENTUPB,  
	A.CURTOTALUPB,  
	
	A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, 
	--A.IDSSTATUSCODE, 
	--A.INTSUBSERVICERLOANNUMBER,  
	A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
	A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE,
	A.CURSCHEDULEDPAYMENTUPB,  
	A.CURSCHEDULEDPAYMENTINTEREST, 
	A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, 
	-- -- --A.CURUNSCHEDULEDPAYMENTUPB, 
	A.CURUNSCHEDULEDPAYMENTINTEREST,  
	A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
	A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  

	-- -- --A.CURTOTALUPB, 
	A.CURORIGINALPL, A.CURCURRENTPL, 
	A.CURORIGINALNETPL, 

	A.CURNETPL	,	--	41 *****	
	
	A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
	A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, 
	A.CURORIGTAXINSURSETASIDE, 

	A.CURTAXINSURSETASIDE	,	--	51 *****
	
	A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, 
	A.CURNETLOC	,	--	54 *****	
	
	A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
	A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
	A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
	A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  
	--A.BLNLOANSUSPENDED, 
	--A.CHRLOANSTATUSREMARKS, 
	A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO 
FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

-- where D.NewStatusGrp in ('Default', 'Called Due', 'Foreclosure')  ... commented out to handle change from 15 to 0 !!!!!!!!!!!!!!!!!!!!!!!!!!
AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4

order by D.SeqNum
;

		--------------------------------------------------------------------------------------------------------------------------------------------------------
		-- Final validation after 2nd post for Suspension transaction
		select 
			D.SeqNum,
			A.INTSUBSERVICERLOANNUMBER, 
		
		IDSTRANSACTIONCOUNT,  -- as RowCount,
		IDSTRANSACTIONCODE,   -- as RowCode,
		IDSUSERID,            -- as UserID,
		
		IDSSTATUSCODE,        -- as StatusCode,
		CHRLOANSTATUSREMARKS, -- as StatusRemarks, 
		
		DTMTRANSACTIONCREATIONDATE, -- as CreationDate,
		DTMEFFECTIVEDATE,           -- as EffectiveDate,
		
		CURTRANSACTIONAMT,        -- as TransAmount,
		CURTRANSACTIONINTEREST,   -- as TransInterest,
		CURTRANSACTIONMIP,        -- as TransMIP,
		CURTRANSACTIONSERVICEFEE, -- as TransServiceFee,
		
		BLNLOANSUSPENDED,         -- as LoanSuspended, 
		
		INTSUBSERVICERLOANNUMBER, -- as LoanNum
		
		--
		CURUNSCHEDULEDPAYMENTUPB,  
	
		CURTOTALUPB,  
		
		IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, 
		--A.IDSSTATUSCODE, 
		--A.INTSUBSERVICERLOANNUMBER,  
		INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
		DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE,
		CURSCHEDULEDPAYMENTUPB,  
		CURSCHEDULEDPAYMENTINTEREST, 
		CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
		-- -- -- CURUNSCHEDULEDPAYMENTUPB, 
		CURUNSCHEDULEDPAYMENTINTEREST,  
		CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
		CURREPAYMENTMIP, CURORIGTOTALUBP,  CURTOTALUPB, CURORIGINALPL, CURCURRENTPL, 
		CURORIGINALNETPL, 
		
		CURNETPL, -- 41 ***** 
		
		CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
		CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, 
		CURORIGTAXINSURSETASIDE, 
		
		CURTAXINSURSETASIDE, -- 51 *****

		CURORIGLOCRESERVE,  CURLOCRESERVE, 
		
		CURNETLOC, -- 54 *****
		
		CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
		CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
		INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
		INTINDEX, INTMARGIN, BLNINTERESTROUND,  
		--BLNLOANSUSPENDED, 
		--CHRLOANSTATUSREMARKS, 
		CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 
		
		FROM  DATAUPDT.HDTStatusChangeNonLiq D
		
		INNER JOIN CELINK.TBLTRANSACTIONS A
			on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
		
		inner join CELINK.CHOOSELASTRECORD C
			on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
			AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 2  -- fecth the last 2 and newly inserted
		
		order by D.SeqNum, IDSTRANSACTIONCOUNT desc
		for read only with ur
		;

--CURNETPL, CURTAXINSURSETASIDE, CURNETLOC 
-- (check the stars)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ********                                                                                                                                                                                                                            *******************                                 *********                                 
-- SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSUSERID IDSSTATUSCODE CHRLOANSTATUSREMARKS                      DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE BLNLOANSUSPENDED INTSUBSERVICERLOANNUMBER CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- see above
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSUSERID IDSSTATUSCODE CHRLOANSTATUSREMARKS                      DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE BLNLOANSUSPENDED INTSUBSERVICERLOANNUMBER CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO
-- ------ ------------------------ ------------------- ------------------ --------- ------------- ----------------------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ----------- --------- ------- --------
-- (check the stars)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ********                                                                                                                                                                                                                            *******************                                 *********                                 


-- *****************************************************************************************************************************************************
-- *****************************************************************************************************************************************************
-- *****************************************************************************************************************************************************
/* *****************************************************************************************************************************************************
2)	Updating tblStatusTracking
tblStatusTracking needs to be updated. 
To determine which field needs to be updated use ...
	Select CodeGroup from tblActionCodesAll Where idsstatuscode = NewStatusCode

The result of the sql above determines which fields get updated in status tracking

Result of SQL	Field to Update		Update Value	-	2nd field to Update		2nd Update Value
Default			DefaultType			NewStatusCode	-	DefaultDate				EffectiveDate
CalledDue		CalledDueType		NewStatusCode	-	CalledDueDate			EffectiveDate
Foreclosure		ForeclosureType		NewStatusCode	-	ForeclosureDate			EffectiveDate


--*-- 
my note
If the current type is the same as requested New Status, DO NOT UPDATE

-- * -- Cyndie
From: Cyndie King <Cyndie.King@celink.com> 
Sent: Friday, October 29, 2021 9:29 AM
To: Ted Kato <Ted.Kato@celink.com>
Cc: Vicky Cermak <Vicky.Cermak@celink.com>
Subject: RE: JAVATest validation - Status Change Non-Liquidation

The status change request form gives is all the information we need. The current status, the requested status, and the effective date. 
We use the information provided to update the tables. 
Don’t check on the current date in status tracking since they’ve given us an effective date AND because it is known that non-liquid status changes can be back-dated. 
If the user wants the status change to keep the same date, they’ll put that date in the form. 

The CAFI is an animal all its own and doesn’t seem to have much bearing on status tracking 
so please, just update the proper type with the code and date provided as requested
***************************************************************************************************************************************************** */


select statusLOAN, DEFAULTTYPE, DEFAULTDATE,CALLEDDUETYPE, CALLEDDUEDATE,LIQUIDATIONDATE, LIQUIDATIONTYPE,* 
from celink.TBLSTATUSTRACKING 
where statusLOAN in (1141914)
for read only with ur;
-- STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE LIQUIDATIONDATE LIQUIDATIONTYPE STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
--  1141914.0          61 2021-07-12           5702 2021-10-28    NULL                       NULL  1141914.0          61 2021-07-12           5702 2021-10-28                 13 2021-09-27      NULL                           NULL NULL                           0                0                0                    3951.040000 NULL                   NULL                   NULL                                    0.000000                       0 NULL                            0.000000                      0.0                  0.0 2021-08-04               0 NULL


----------------------------------------------------------------
-- VALIDATION before
Select 
	C3.CodeGroup ,
	D.NewStatusGrp,
	D.SeqNum ,
	D.HDTNum , 
	D.Requester ,
	D.Loan  ,
	D.BadStatus, --D.CurStatus , 
	D.NewStatus , 
	D.NewStatusDesc , 
	D.EffDate   	
	
FROM  DATAUPDT.HDTStatusChangeNonLiq D
INNER JOIN celink.tblActionCodesAll C3
ON    D.NewStatus = C3.idsstatuscode

WHERE D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4

order by D.SeqNum
for read only with ur
;

--------------------------
-- VALIDATION before ... against tblstatustracking
Select 
	D.NewStatusGrp,
	D.SeqNum ,
	D.HDTNum , 
	D.Requester ,
	D.Loan  ,  TT.StatusLoan,
	D.BadStatus, --D.CurStatus , 
	D.NewStatusDesc , 
	D.NewStatus,  
	D.EffDate,    
	TT.FORECLOSURETYPE, TT.FORECLOSUREDATE,
	TT.DEFAULTTYPE, 
	TT.DEFAULTDATE,
	TT.CALLEDDUETYPE, TT.CALLEDDUEDATE 
FROM  DATAUPDT.HDTStatusChangeNonLiq D
inner join celink.tblStatusTracking TT
on    D.Loan = TT.StatusLoan
where   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
order by D.SeqNum
for read only with ur
;

--------------------------
--------------------------
--Foreclosure
Select 
	D.NewStatusGrp,
	D.SeqNum ,
	D.HDTNum , 
	D.Requester ,
	D.Loan  ,  TT.StatusLoan,
	D.BadStatus, --D.CurStatus , 
	D.NewStatusDesc , 
	D.NewStatus,  TT.FORECLOSURETYPE, 
	D.EffDate,    TT.FORECLOSUREDATE
FROM  DATAUPDT.HDTStatusChangeNonLiq D
inner join celink.tblStatusTracking TT
on    D.Loan = TT.StatusLoan
-- and  D.NewStatus <> TT.FORECLOSURETYPE -- no need to check
where D.NewStatusGrp = 'Foreclosure'
AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
order by D.SeqNum
for read only with ur
;

--------------------------
--DEFAULTTYPE, DEFAULTDATE, and DEFAULTBALANCE
Select 
	D.NewStatusGrp,
	D.SeqNum ,
	D.HDTNum , 
	D.Requester ,
	D.Loan  ,  TT.StatusLoan,
	D.BadStatus, --D.CurStatus , 
	D.NewStatusDesc , 
	D.NewStatus,  TT.DEFAULTTYPE, 
	D.EffDate,    TT.DEFAULTDATE
	, TT.DEFAULTBALANCE
	, '-->rest'
	, TT.*
FROM  DATAUPDT.HDTStatusChangeNonLiq D
inner join celink.tblStatusTracking TT
on    D.Loan = TT.StatusLoan
--and  D.NewStatus <> TT.DEFAULTTYPE
where D.NewStatusGrp = 'Default'
AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
order by D.SeqNum
for read only with ur
;
-- NEWSTATUSGRP         SEQNUM HDTNUM REQUESTER             LOAN    STATUSLOAN BADSTATUS NEWSTATUSDESC  NEWSTATUS DEFAULTTYPE EFFDATE    DEFAULTDATE DEFAULTBALANCE 14      STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- -------------------- ------ ------ --------------------- ------- ---------- --------- -------------- --------- ----------- ---------- ----------- -------------- ------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------

--------------------------
--CALLEDDUETYPE, CALLEDDUEDATE,
Select 
	D.NewStatusGrp,
	D.SeqNum ,
	D.HDTNum , 
	D.Requester ,
	D.Loan  ,  TT.StatusLoan,
	D.BadStatus, --D.CurStatus , 
	D.NewStatusDesc , 
	D.NewStatus,  TT.CALLEDDUETYPE as "Cur_CALLEDDUETYPE", 
	D.EffDate,    TT.CALLEDDUEDATE as "Cur_CALLEDDUEDATE"
FROM  DATAUPDT.HDTStatusChangeNonLiq D
inner join celink.tblStatusTracking TT
on    D.Loan = TT.StatusLoan
--and   D.NewStatus <> TT.CALLEDDUETYPE
where D.NewStatusGrp = 'Called Due'
AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
order by D.SeqNum
for read only with ur
;
-- NEWSTATUSGRP         SEQNUM HDTNUM REQUESTER       LOAN    STATUSLOAN BADSTATUS NEWSTATUSDESC                    NEWSTATUS Cur_CALLEDDUETYPE EFFDATE    Cur_CALLEDDUEDATE
-- -------------------- ------ ------ --------------- ------- ---------- --------- -------------------------------- --------- ----------------- ---------- -----------------

----------------------------------
--LIQUIDATIONDATE, LIQUIDATIONTYPE, 
Select 
	D.NewStatusGrp,
	D.SeqNum ,
	D.HDTNum , 
	D.Requester ,
	D.Loan  ,  TT.StatusLoan,
	D.BadStatus, --D.CurStatus , 
	D.NewStatusDesc , 
	D.NewStatus,  TT.LIQUIDATIONTYPE, 
	D.EffDate,    TT.LIQUIDATIONDATE
FROM  DATAUPDT.HDTStatusChangeNonLiq D
inner join celink.tblStatusTracking TT
on    D.Loan = TT.StatusLoan
and  D.NewStatus <> TT.LIQUIDATIONTYPE
where D.NewStatusGrp = 'Liquid'
AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
order by D.SeqNum
for read only with ur
;


--/* Updating tblStatusTracking *******************************************************************************
MERGE INTO celink.tblStatusTracking TT
USING
(
	Select 
		D.NewStatusGrp,
		D.SeqNum ,
		D.HDTNum , 
		D.Requester ,
		D.Loan  ,  TT.StatusLoan,
		D.NewStatus,  TT.FORECLOSURETYPE, 
		D.EffDate,    TT.FORECLOSUREDATE
	FROM  DATAUPDT.HDTStatusChangeNonLiq D
	inner join celink.tblStatusTracking TT
	on    D.Loan = TT.StatusLoan
	--and  D.NewStatus <> TT.FORECLOSURETYPE  -- no need to check
	where D.NewStatusGrp = 'Foreclosure'
	AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
	order by D.SeqNum
) UY
ON  UY.Loan   = TT.StatusLoan
WHEN MATCHED THEN UPDATE 
Set
	TT.FORECLOSURETYPE = UY.NewStatus , 
	TT.FORECLOSUREDATE = UY.EffDate
;
			--------------------------
			--------------------------
			--Foreclosure
			Select 
				D.NewStatusGrp,
				D.SeqNum ,
				D.HDTNum , 
				D.Requester ,
				D.Loan  ,  TT.StatusLoan,
				D.BadStatus, --D.CurStatus , 
				D.NewStatusDesc , 
				D.NewStatus,  TT.FORECLOSURETYPE, 
				D.EffDate,    TT.FORECLOSUREDATE
			FROM  DATAUPDT.HDTStatusChangeNonLiq D
			inner join celink.tblStatusTracking TT
			on    D.Loan = TT.StatusLoan
			-- and  D.NewStatus <> TT.FORECLOSURETYPE -- no need to check
			where D.NewStatusGrp = 'Foreclosure'
			AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
			order by D.SeqNum
			for read only with ur
			;

----------------------------------------
MERGE INTO celink.tblStatusTracking TT
USING
(
	Select 
		D.NewStatusGrp,
		D.SeqNum ,
		D.HDTNum , 
		D.Requester ,
		D.Loan  ,  TT.StatusLoan,
		D.NewStatus,  TT.DEFAULTTYPE, 
		D.EffDate,    TT.DEFAULTDATE
	FROM  DATAUPDT.HDTStatusChangeNonLiq D
	inner join celink.tblStatusTracking TT
	on    D.Loan = TT.StatusLoan
	-- and  D.NewStatus <> TT.DEFAULTTYPE -- no need to check
	where D.NewStatusGrp = 'Default'
	AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
	order by D.SeqNum
) UY
ON  UY.Loan   = TT.StatusLoan
WHEN MATCHED THEN UPDATE 
Set
	TT.DEFAULTTYPE = UY.NewStatus , 
	TT.DEFAULTDATE = UY.EffDate
;
			--------------------------
			--------------------------
			--DEFAULTTYPE, DEFAULTDATE, and DEFAULTBALANCE
			Select 
				D.NewStatusGrp,
				D.SeqNum ,
				D.HDTNum , 
				D.Requester ,
				D.Loan  ,  TT.StatusLoan,
				D.BadStatus, --D.CurStatus , 
				D.NewStatusDesc , 
				D.NewStatus,  TT.DEFAULTTYPE, 
				D.EffDate,    TT.DEFAULTDATE
				, TT.DEFAULTBALANCE
				, '-->rest'
				, TT.*
			FROM  DATAUPDT.HDTStatusChangeNonLiq D
			inner join celink.tblStatusTracking TT
			on    D.Loan = TT.StatusLoan
			--and  D.NewStatus <> TT.DEFAULTTYPE
			where D.NewStatusGrp = 'Default'
			AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
			order by D.SeqNum
			for read only with ur
			;

-- NEWSTATUSGRP         SEQNUM HDTNUM REQUESTER             LOAN    STATUSLOAN BADSTATUS NEWSTATUSDESC  NEWSTATUS DEFAULTTYPE EFFDATE    DEFAULTDATE DEFAULTBALANCE 14      STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- -------------------- ------ ------ --------------------- ------- ---------- --------- -------------- --------- ----------- ---------- ----------- -------------- ------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
-- Default                   6 192360 Christopher Castaneda 3115477  3115477.0        13 Default: Taxes        61          61 2025-06-13 2025-06-13     1884.020000 -->rest  3115477.0          61 2025-06-13             57 2024-10-31                 13 2025-04-15      NULL                              0 NULL                           0                0                0                    1884.020000 NULL                   NULL                   NULL                                    0.000000                       0 NULL                           53.350000                      0.0                  0.0 2024-03-22               0 NULL

----------------------------------------
MERGE INTO celink.tblStatusTracking TT
USING
(
	Select 
		D.NewStatusGrp,
		D.SeqNum ,
		D.HDTNum , 
		D.Requester ,
		D.Loan  ,  TT.StatusLoan,
		D.NewStatus,  TT.CALLEDDUETYPE, 
		D.EffDate,    TT.CALLEDDUEDATE
	FROM  DATAUPDT.HDTStatusChangeNonLiq D
	inner join celink.tblStatusTracking TT
		on    D.Loan = TT.StatusLoan
	--	and   D.NewStatus <> TT.CALLEDDUETYPE -- no need to check
	where D.NewStatusGrp = 'Called Due'
	AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
	order by D.SeqNum
) UY
ON  UY.Loan   = TT.StatusLoan
WHEN MATCHED THEN UPDATE 
Set
TT.CALLEDDUETYPE = UY.NewStatus , 
TT.CALLEDDUEDATE = UY.EffDate
;

			--------------------------
			--------------------------
			--CALLEDDUETYPE, CALLEDDUEDATE,
			Select 
				D.NewStatusGrp,
				D.SeqNum ,
				D.HDTNum , 
				D.Requester ,
				D.Loan  ,  TT.StatusLoan,
				D.BadStatus, --D.CurStatus , 
				D.NewStatusDesc , 
				D.NewStatus,  TT.CALLEDDUETYPE as "Cur_CALLEDDUETYPE", 
				D.EffDate,    TT.CALLEDDUEDATE as "Cur_CALLEDDUEDATE"
			FROM  DATAUPDT.HDTStatusChangeNonLiq D
			inner join celink.tblStatusTracking TT
			on    D.Loan = TT.StatusLoan
			--and   D.NewStatus <> TT.CALLEDDUETYPE
			where D.NewStatusGrp = 'Called Due'
			AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4
			order by D.SeqNum
			for read only with ur
			;

-- NEWSTATUSGRP         SEQNUM HDTNUM REQUESTER       LOAN    STATUSLOAN BADSTATUS NEWSTATUSDESC                    NEWSTATUS Cur_CALLEDDUETYPE EFFDATE    Cur_CALLEDDUEDATE
-- -------------------- ------ ------ --------------- ------- ---------- --------- -------------------------------- --------- ----------------- ---------- -----------------
-- Called Due                1 192320 Penny Neel-Henn 1367383  1367383.0        57 Called Due: T&I w/Repayment Plan      5701              5701 2025-06-13 2025-06-13
-- Called Due                2 192320 Penny Neel-Henn 1170945  1170945.0        13 Called Due: T&I w/Repayment Plan      5701              5701 2025-06-13 2025-06-13
-- Called Due                3 192320 Penny Neel-Henn 1311919  1311919.0        57 Called Due: T&I w/Repayment Plan      5701              5701 2025-06-13 2025-06-13
-- Called Due                4 192320 Penny Neel-Henn 1184220  1184220.0        57 Called Due: T&I w/Repayment Plan      5701              5701 2025-06-13 2025-06-13
-- Called Due                5 192320 Penny Neel-Henn 3127334  3127334.0        13 Called Due: T&I w/Repayment Plan      5701              5701 2025-06-13 2025-06-13
			
----------------------------------------
MERGE INTO celink.tblStatusTracking TT
USING
(
	Select 
		D.NewStatusGrp,
		D.SeqNum ,
		D.HDTNum , 
		D.Requester ,
		D.Loan  ,  TT.StatusLoan,
		D.NewStatus,  TT.LIQUIDATIONTYPE, 
		D.EffDate,    TT.LIQUIDATIONDATE
	FROM  DATAUPDT.HDTStatusChangeNonLiq D
	inner join celink.tblStatusTracking TT
	on    D.Loan = TT.StatusLoan
	and   D.NewStatus <> TT.LIQUIDATIONTYPE
	
	where D.NewStatusGrp = 'Liquid'
	AND   D.ChangeRequired = -1   -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4

	order by D.SeqNum
) UY
ON  UY.Loan   = TT.StatusLoan
WHEN MATCHED THEN UPDATE 
Set
	TT.LIQUIDATIONTYPE = UY.NewStatus , 
	TT.LIQUIDATIONDATE = UY.EffDate
;
-- ********************************************************************************************************* */



--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Post the note 20230425 --- reestablished 
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
'Per HDT ' || UY.HDTNum || ' The loan has been forced to status ' || UY.NewStatus  || '.' as "Loan Note" 
--'Per HDT ' || UY.HDTNum || ' The loan has been forced to status ' || UY.NewStatus  || '.(' || VARCHAR_FORMAT(CURRENT_TIMESTAMP (0),'YYYY-MM-DD HH24:MI:SS', 'en_US') || ')' as "Loan Note"
	, CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
	from DATAUPDT.HDTStatusChangeNonLiq UY
	where UY.ChangeRequired = -1 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4 ... not to generate note !!!!! 
Order by SeqNum 
; 

-- SEQNUM Loan Number Loan Note                                                                    4                         5     6
-- ------ ----------- ---------------------------------------------------------------------------- ------------------------- ----- -

------------------
-- Notes validation
		select 
		--	count(*) as "MyCount"
			UY.SeqNum,
			a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
			from DATAUPDT.HDTStatusChangeNonLiq UY  
			inner join 	celink.tblloannotes a
			on UY.Loan = a.INTSUBSERVICERLOANNUMBER
			and CHRLOANNOTES like 'Per HDT%' || HDTNum ||'%'
			--order by UY.IDSLOANNOTES desc 
			order by UY.SeqNum
		with ur;

-- SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                            CHRUSERID BLNPRIORITY NOTESTEP
-- ------ -------------------------- ------------ ------------------------ ------------------------------------------------------- --------- ----------- --------
--      1 2025-06-13 17:17:02.091152    202736866                1367383.0 Per HDT 192320 The loan has been forced to status 5701. tkato               0        0
--      2 2025-06-13 17:17:02.091152    202736867                1170945.0 Per HDT 192320 The loan has been forced to status 5701. tkato               0        0
--      3 2025-06-13 17:17:02.091152    202736868                1311919.0 Per HDT 192320 The loan has been forced to status 5701. tkato               0        0
--      4 2025-06-13 17:17:02.091152    202736869                1184220.0 Per HDT 192320 The loan has been forced to status 5701. tkato               0        0
--      5 2025-06-13 17:17:02.091152    202736870                3127334.0 Per HDT 192320 The loan has been forced to status 5701. tkato               0        0
--      6 2025-06-13 17:17:02.091152    202736871                3115477.0 Per HDT 192360 The loan has been forced to status 61.   tkato               0        0


--*--
--The loan status changed for below listed 14 loans.  Pending verification. 
--The loan status changed for below listed 1 loan.  Could you please verify? 
--*--



--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Post the note
-- Post the note with the simple verbiage “Per HDT Ticket the loan has been forced to status NewStatusCode.

Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
-- 'Per HDT ' || UY.HDTNum || ' The loan has been forced to status ' || UY.NewStatus  || '.' as "Loan Note" 
'Per HDT ' || UY.HDTNum || ' The loan has been forced to status ' || UY.NewStatus  || '.(' || VARCHAR_FORMAT(CURRENT_TIMESTAMP (0),'YYYY-MM-DD HH24:MI:SS', 'en_US') || ')' as "Loan Note"

	from DATAUPDT.HDTStatusChangeNonLiq UY
	where UY.ChangeRequired = -1 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! V4 ... not to generate note !!!!! 
Order by SeqNum 
; 

-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- --------------------------------------------------------------------------
--      1     1001596 N                                                                Per HDT 109485 The loan has been forced to status 61.(2022-08-31 16:38:02)
--      2     1363149 N                                                                Per HDT 109485 The loan has been forced to status 62.(2022-08-31 16:38:02)
--      3     1173660 N                                                                Per HDT 109485 The loan has been forced to status 53.(2022-08-31 16:38:02)
--      4     3127249 N                                                                Per HDT 109485 The loan has been forced to status 53.(2022-08-31 16:38:02)
--      5     1166944 N                                                                Per HDT 109485 The loan has been forced to status 53.(2022-08-31 16:38:02)
--      6     1401425 N                                                                Per HDT 109485 The loan has been forced to status 51.(2022-08-31 16:38:02)
--      7     3113108 N                                                                Per HDT 109485 The loan has been forced to status 62.(2022-08-31 16:38:02)
--      8     3117731 N                                                                Per HDT 109485 The loan has been forced to status 62.(2022-08-31 16:38:02)
--      9     3128395 N                                                                Per HDT 109485 The loan has been forced to status 51.(2022-08-31 16:38:02)

-- C:\Users\ted.kato\Documents\HDTUpdtNotes_109488.csv

--The loan status changed for below listed 9 loans.  Pending verification. 
--The loan status changed for below listed 1 loan.  Could you please verify? 
--The loan status changed for below listed 1 loan.  Pending verification.

-----------------------------------------------------------------------------------------------------------
-- Notes
select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from celink.tblloannotes a  
	where a.INTSUBSERVICERLOANNUMBER in (1379570) 
	order by a.IDSLOANNOTES desc 
for read only with UR;

--------------------------------------------------------------------------------------------------------------------------------- test time stamp 
select CURRENT_TIMESTAMP (0), VARCHAR_FORMAT(CURRENT_TIMESTAMP (0),'YYYY-MM-DD HH:MM:SS', 'en_US') from sysibm.sysdummy1;
-- 1                     2
-- --------------------- -------------------
-- 2022-03-11 17:32:49.0 2022-03-11 05:03:49

select CURRENT_TIMESTAMP (0), VARCHAR_FORMAT(CURRENT_TIMESTAMP (0),'YYYY-MM-DD HH24:MI:SS', 'en_US') from sysibm.sysdummy1;
-- 1                     2
-- --------------------- -------------------
-- 2022-03-11 17:32:50.0 2022-03-11 17:32:50

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- end of process
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------



/* 
*************************************************************************************************************************************************************

		------------------------------------------------
		-- tblTransactions ... to check single loan
--		with D (SeqNum, Loan) as
--		(Values
--		(1, 1117637) --,
--		--(2, 3128266),
--		--(3, 1081537)
--		)
		with D (SeqNum, HDTNum, Requester, Loan, BadStatus, NewStatus, EffDate) as
		(Values
--		(1, 92720, 'Michael McDaid', 1382932, 11, 13, '2021-10-28'),
--		(2, 92722, 'Michael McDaid', 1381190, 11, 13, '2021-10-28'),
--		(3, 92725, 'Michael McDaid', 1379075, 11, 13, '2021-10-28'),
--		(4, 92749, 'Karen Williams', 1141914, 13, 5702, '2021-10-28')
		
		(7, 92765, 'Karen Williams', 1331544, 13, 5702, '2021-10-28'),
		(8, 92767, 'Karen Williams', 1257276, 13, 5702, '2021-10-28')
		
		)
		select 
		D.SeqNum,
		D.BadStatus, D.NewStatus, 
		
		A.INTSUBSERVICERLOANNUMBER, 
		
		IDSTRANSACTIONCOUNT,  -- as RowCount,
		IDSTRANSACTIONCODE,   -- as RowCode,
		IDSUSERID,            -- as UserID,
		
		IDSSTATUSCODE,        -- as StatusCode,
		CHRLOANSTATUSREMARKS, -- as StatusRemarks, 
		
		DTMTRANSACTIONCREATIONDATE, -- as CreationDate,
		DTMEFFECTIVEDATE,           -- as EffectiveDate,
		
		CURTRANSACTIONAMT,        -- as TransAmount,
		CURTRANSACTIONINTEREST,   -- as TransInterest,
		CURTRANSACTIONMIP,        -- as TransMIP,
		CURTRANSACTIONSERVICEFEE, -- as TransServiceFee,
		
		BLNLOANSUSPENDED,         -- as LoanSuspended, 
		
		INTSUBSERVICERLOANNUMBER, -- as LoanNum
		
		--
		CURUNSCHEDULEDPAYMENTUPB,  
		CURTOTALUPB,  
		
		IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, 
		--A.IDSSTATUSCODE, 
		--A.INTSUBSERVICERLOANNUMBER,  
		INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
		DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE,
		CURSCHEDULEDPAYMENTUPB,  
		CURSCHEDULEDPAYMENTINTEREST, 
		CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
		-- -- -- CURUNSCHEDULEDPAYMENTUPB, 
		CURUNSCHEDULEDPAYMENTINTEREST,  
		CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
		CURREPAYMENTMIP, CURORIGTOTALUBP,  CURTOTALUPB, CURORIGINALPL, CURCURRENTPL, 
		CURORIGINALNETPL, CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
		CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, CURORIGTAXINSURSETASIDE, 
		CURORIGLOCRESERVE,  CURLOCRESERVE, CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
		CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
		INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
		INTINDEX, INTMARGIN, BLNINTERESTROUND,  
		--BLNLOANSUSPENDED, 
		--CHRLOANSTATUSREMARKS, 
		CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 
		
		FROM  D 
		
		INNER JOIN CELINK.TBLTRANSACTIONS A
			on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
		
		order by D.SeqNum, IDSTRANSACTIONCOUNT desc
		for read only with ur
		;
		

		-----------------------------------------------
		-- tblTransactions ... to check single loan, most recent 3 trans using the function ... very slow
		-- this is to check to see if the current status is NOT the same as requested new status
--		with D (SeqNum, Loan) as
--		(Values
--		(1, 1117637),
--		(2, 3128266),
--		(3, 1081537)
--		)
		with D (SeqNum, HDTNum, Requester, Loan, BadStatus, NewStatus, EffDate) as
		(Values
(1, 92720, 'Michael McDaid', 1382932, 11, 13, '2021-10-28'),
(2, 92722, 'Michael McDaid', 1381190, 11, 13, '2021-10-28'),
(3, 92725, 'Michael McDaid', 1379075, 11, 13, '2021-10-28'),
(4, 92749, 'Karen Williams', 1141914, 13, 5702, '2021-10-28'),
(5, 92753, 'Karen Williams', 1398422, 13, 5702, '2021-10-28'),
(6, 92755, 'Michael McDaid', 1378417, 11, 13, '2021-10-28')
,
(7, 92765, 'Karen Williams', 1331544, 13, 5702, '2021-10-28'),
(8, 92767, 'Karen Williams', 1257276, 13, 5702, '2021-10-28'),
		
		)
		select 
			D.SeqNum, 
			D.BadStatus, D.NewStatus, IDSSTATUSCODE as "CurStatus",

			A.INTSUBSERVICERLOANNUMBER, 
		
		IDSTRANSACTIONCOUNT,  -- as RowCount,
		IDSTRANSACTIONCODE,   -- as RowCode,
		IDSUSERID,            -- as UserID,
		
		IDSSTATUSCODE,        -- as StatusCode,
		CHRLOANSTATUSREMARKS, -- as StatusRemarks, 
		
		DTMTRANSACTIONCREATIONDATE, -- as CreationDate,
		DTMEFFECTIVEDATE,           -- as EffectiveDate,
		
		CURTRANSACTIONAMT,        -- as TransAmount,
		CURTRANSACTIONINTEREST,   -- as TransInterest,
		CURTRANSACTIONMIP,        -- as TransMIP,
		CURTRANSACTIONSERVICEFEE, -- as TransServiceFee,
		
		BLNLOANSUSPENDED,         -- as LoanSuspended, 
		
		INTSUBSERVICERLOANNUMBER, -- as LoanNum
		
		--
		CURUNSCHEDULEDPAYMENTUPB,  
		CURTOTALUPB,  
		
		IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, 
		--A.IDSSTATUSCODE, 
		--A.INTSUBSERVICERLOANNUMBER,  
		INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
		DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE,
		CURSCHEDULEDPAYMENTUPB,  
		CURSCHEDULEDPAYMENTINTEREST, 
		CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
		-- -- -- CURUNSCHEDULEDPAYMENTUPB, 
		CURUNSCHEDULEDPAYMENTINTEREST,  
		CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
		CURREPAYMENTMIP, CURORIGTOTALUBP,  CURTOTALUPB, CURORIGINALPL, CURCURRENTPL, 
		CURORIGINALNETPL, CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
		CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, CURORIGTAXINSURSETASIDE, 
		CURORIGLOCRESERVE,  CURLOCRESERVE, CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
		CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
		INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
		INTINDEX, INTMARGIN, BLNINTERESTROUND,  
		--BLNLOANSUSPENDED, 
		--CHRLOANSTATUSREMARKS, 
		CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 
		
		FROM  D 
		
		INNER JOIN CELINK.TBLTRANSACTIONS A
			on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
		
		inner join CELINK.CHOOSELASTRECORD C
			on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
			AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 2  -- fecth the last 2 and newly inserted
		
		order by D.SeqNum, IDSTRANSACTIONCOUNT desc
		for read only with ur
		;

--	 SEQNUM BADSTATUS NEWSTATUS CurStatus INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSUSERID  IDSSTATUSCODE CHRLOANSTATUSREMARKS           DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE BLNLOANSUSPENDED INTSUBSERVICERLOANNUMBER CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE  CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP INTVENDOR CHRMEMO INTPAYTO
--	 ------ --------- --------- --------- ------------------------ ------------------- ------------------ ---------- ------------- ------------------------------ -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- ---------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ----------------- -------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------- --------- ------- --------
--	      1        11        13        11                1382932.0                 195                103 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-10-01                0.000000               0.000000          0.000000                      0.0               -1                1382932.0             43750.900000 737060.510000 RMF_FNMA_9     316800009        316800009    6.000747477E9 003745519412     HECM        Line of Credit ARM 858         2009-12-18     2009-12-14     2018-09-01               693309.610000               223848.650000                  0.000000           24259.180000                  0.000000                   2142.790000                    0.000000               243.750000                    0.000000        -3590.720000             6.220000        0.560000   150546.040000 737060.510000 332710.000000 560083.000000    178441.580000     485000.000000         485000.000000               3722.380000            875.340000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -134101.950000      35.000000           4970.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03485           0.03336              0.0669   8.6E-4    0.0325                0  33.990000      NULL NULL        NULL
--	      1        11        13        11                1382932.0                 194                101 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-09-30             2379.410000            2037.120000        304.860000                      0.0               -1                1382932.0             43750.900000 737060.510000 RMF_FNMA_9     316800009        316800009    6.000747477E9 003745519412     HECM        Line of Credit ARM 858         2009-12-18     2009-12-14     2018-09-01               693309.610000               223848.650000                  0.000000           24259.180000                  0.000000                   2142.790000                    0.000000               243.750000                    0.000000        -3590.720000             6.220000        0.560000   150546.040000 737060.510000 332710.000000 560083.000000    178441.580000     485000.000000         485000.000000               3722.380000            875.340000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -134101.950000      35.000000           4970.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03485           0.03341              0.0669   9.1E-4    0.0325                0  33.990000      NULL NULL        NULL
--	      1        11        13        11                1382932.0                 193                 94 Batch                 11 Refer for FCL: Death           2021-09-24                 2021-09-24              100.000000               0.050000          0.010000                      0.0               -1                1382932.0             43618.460000 734681.100000 RMF_FNMA_9     316800009        316800009    6.000747477E9 003745519412     HECM        Line of Credit ARM 858         2009-12-18     2009-12-14     2018-09-01               691062.640000               221924.620000                  0.000000           23971.240000                  0.000000                   2027.590000                    2.110000               226.510000                    0.320000        -3590.720000             6.220000        0.560000   150546.040000 734681.100000 332710.000000 558295.990000    178441.580000     485000.000000         485000.000000               3722.380000            905.120000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -133671.770000      35.000000           4935.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03485           0.03341              0.0669   9.1E-4    0.0325                0  33.990000      NULL NULL        NULL

--	      2        11        13        11                1381190.0                 145                103 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-10-01                0.000000               0.000000          0.000000                      0.0               -1                1381190.0             22370.870000 223604.940000 RMF_FNMA_F     316800009        316800009    6.000510405E9 000950992788     HECM        Line of Credit ARM 857         2008-12-15     2008-12-10     2018-09-01               201234.070000                48438.150000                  0.000000            8027.040000                  0.000000                    672.150000                    0.000000               148.090000                    0.000000        -1777.070000             3.200000        0.380000    55142.330000 223604.940000 123000.000000 178637.010000     63198.470000     164000.000000         164000.000000               4659.200000           2811.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -25409.000000      30.000000           4620.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0244            0.0182              0.0513   7.0E-4    0.0175                0   0.000000      NULL NULL        NULL
--	      2        11        13        11                1381190.0                 144                101 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-09-30              455.570000             332.730000         91.410000                      0.0               -1                1381190.0             22370.870000 223604.940000 RMF_FNMA_F     316800009        316800009    6.000510405E9 000950992788     HECM        Line of Credit ARM 857         2008-12-15     2008-12-10     2018-09-01               201234.070000                48438.150000                  0.000000            8027.040000                  0.000000                    672.150000                    0.000000               148.090000                    0.000000        -1777.070000             3.200000        0.380000    55142.330000 223604.940000 123000.000000 178637.010000     63198.470000     164000.000000         164000.000000               4659.200000           2811.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -25409.000000      30.000000           4620.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0244            0.0182              0.0513   7.0E-4    0.0175                0   0.000000      NULL NULL        NULL
--	      2        11        13        11                1381190.0                 143                 91 Batch                 11 Refer for FCL: Death           2021-09-24                 2021-09-24             2480.500000               0.740000          0.200000                      0.0               -1                1381190.0             22333.540000 223149.370000 RMF_FNMA_F     316800009        316800009    6.000510405E9 000950992788     HECM        Line of Credit ARM 857         2008-12-15     2008-12-10     2018-09-01               200815.830000                48133.580000                  0.000000            7943.370000                  0.000000                    642.860000                    1.130000               140.050000                    0.300000        -1777.070000             3.200000        0.380000    55142.330000 223149.370000 123000.000000 178292.310000     63198.470000     164000.000000         164000.000000               4659.200000           2828.810000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -25352.330000      30.000000           4590.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0244            0.0182              0.0513   7.0E-4    0.0175                0   0.000000      NULL NULL        NULL

--	      3        11        13        11                1379075.0                 142                103 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-10-01                0.000000               0.000000          0.000000                      0.0               -1                1379075.0             14247.540000 209159.120000 RMF_FNMA_9     316800009        316800009    6.000370219E9 000950569768     HECM        Line of Credit ARM 857         2008-02-22     2008-02-18     2018-09-01               194911.580000                38068.340000                  0.000000            8947.820000                  0.000000                    241.660000                    0.000000                89.240000                    0.000000        -1789.200000             1.940000        0.270000   126025.180000 209159.120000 130140.000000 177051.150000    126025.180000     180000.000000         180000.000000               4114.820000           2689.680000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -20550.110000      25.000000           4100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0308            0.0107              0.0512   7.0E-4      0.01                0   0.000000      NULL NULL        NULL
--	      3        11        13        11                1379075.0                 141                101 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-09-30              297.470000             185.560000         86.710000                      0.0               -1                1379075.0             14247.540000 209159.120000 RMF_FNMA_9     316800009        316800009    6.000370219E9 000950569768     HECM        Line of Credit ARM 857         2008-02-22     2008-02-18     2018-09-01               194911.580000                38068.340000                  0.000000            8947.820000                  0.000000                    241.660000                    0.000000                89.240000                    0.000000        -1789.200000             1.940000        0.270000   126025.180000 209159.120000 130140.000000 177051.150000    126025.180000     180000.000000         180000.000000               4114.820000           2689.680000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -20550.110000      25.000000           4100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0308            0.0107              0.0512   7.0E-4      0.01                0   0.000000      NULL NULL        NULL
--	      3        11        13        11                1379075.0                 140                 91 Batch                 11 Refer for FCL: Death           2021-09-24                 2021-09-24              735.000000               0.130000          0.060000                      0.0               -1                1379075.0             14229.720000 208861.650000 RMF_FNMA_9     316800009        316800009    6.000370219E9 000950569768     HECM        Line of Credit ARM 857         2008-02-22     2008-02-18     2018-09-01               194631.930000                37894.790000                  0.000000            8866.720000                  0.000000                    229.510000                    0.140000                83.570000                    0.060000        -1789.200000             1.940000        0.270000   126025.180000 208861.650000 130140.000000 176819.810000    126025.180000     180000.000000         180000.000000               4114.820000           2702.140000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -20514.260000      25.000000           4075.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0308            0.0107              0.0512   7.0E-4      0.01                0   0.000000      NULL NULL        NULL

--	      4        13      5702        13                1141914.0                 222                103 BATCH                 13 Refer for FCL: Tax & Insurance 2021-09-30                 2021-10-01                0.000000               0.000000          0.000000                      0.0               -1                1141914.0            131851.560000 160289.880000 50                  6200             6200              0.0 000946828107     HECM        Line of Credit ARM 858         2013-10-25     2013-10-16     2999-01-01                28438.320000                 5831.820000                  0.000000            5590.330000                  0.000000                  21129.790000                    0.000000              8015.860000                    0.000000            0.000000             0.000000        0.000000    20236.170000 160289.880000 110929.000000 156266.620000     90692.830000     161000.000000         161000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000      90692.830000  127828.300000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02354           0.02266              0.0498   8.6E-4    0.0218                0   0.000000      NULL NULL        NULL
--	      4        13      5702        13                1141914.0                 221                101 BATCH                 13 Refer for FCL: Tax & Insurance 2021-09-30                 2021-09-30              467.700000             299.260000        164.720000                    39.53               -1                1141914.0            131851.560000 160289.880000 50                  6200             6200              0.0 000946828107     HECM        Line of Credit ARM 858         2013-10-25     2013-10-16     2999-01-01                28438.320000                 5831.820000                  0.000000            5590.330000                  0.000000                  21129.790000                    0.000000              8015.860000                    0.000000            0.000000             0.000000        0.000000    20236.170000 160289.880000 110929.000000 156266.620000     90692.830000     161000.000000         161000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000      90692.830000  127828.300000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02354           0.02271              0.0498   9.1E-4    0.0218                0   0.000000      NULL NULL        NULL
--	      4        13      5702        13                1141914.0                 220                 13 CCO.CKumar            13 Refer for FCL: Tax & Insurance 2021-09-27                 2021-09-27                0.000000               0.000000          0.000000                      0.0               -1                1141914.0            131467.060000 159822.180000 50                  6200             6200              0.0 000946828107     HECM        Line of Credit ARM 858         2013-10-25     2013-10-16     2999-01-01                28355.120000                 5778.160000                  0.000000            5560.790000                  0.000000                  20881.790000                    2.400000              7879.360000                    1.320000            0.000000             0.000000        0.000000    20236.170000 159822.180000 110929.000000 155809.450000     90692.830000     161000.000000         161000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000      90692.830000  127454.330000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02354           0.02271              0.0498   9.1E-4    0.0218                0   0.000000      NULL NULL        NULL

--	      5        13      5702        13                1398422.0                 120                103 BATCH                 13 Refer for FCL: Tax & Insurance 2021-09-30                 2021-10-01                0.000000               0.000000          0.000000                      0.0               -1                1398422.0             23894.670000 369986.340000 RMFFJ1218      316800009        316800009     6.00045422E9 002513549379     HECM        Line of Credit ARM 857         2008-09-15     2008-09-09     2019-02-01               346091.670000                85370.070000                  0.000000           15322.620000                  0.000000                    737.780000                    0.000000               155.460000                    0.000000            0.000000             0.000000        0.000000   149565.950000 369986.340000 215712.000000 327486.060000     61191.020000     288000.000000         288000.000000               4955.030000           2658.320000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -21263.930000      35.000000           5495.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0408            0.0207              0.0569   7.0E-4      0.02                0   0.000000      NULL NULL        NULL
--	      5        13      5702        13                1398422.0                 119                101 BATCH                 13 Refer for FCL: Tax & Insurance 2021-09-30                 2021-09-30              825.590000             636.770000        153.810000                      0.0               -1                1398422.0             23894.670000 369986.340000 RMFFJ1218      316800009        316800009     6.00045422E9 002513549379     HECM        Line of Credit ARM 857         2008-09-15     2008-09-09     2019-02-01               346091.670000                85370.070000                  0.000000           15322.620000                  0.000000                    737.780000                    0.000000               155.460000                    0.000000            0.000000             0.000000        0.000000   149565.950000 369986.340000 215712.000000 327486.060000     61191.020000     288000.000000         288000.000000               4955.030000           2658.320000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -21263.930000      35.000000           5495.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0408            0.0207              0.0569   7.0E-4      0.02                0   0.000000      NULL NULL        NULL
--	      5        13      5702        13                1398422.0                 118                 92 Batch                 13 Refer for FCL: Tax & Insurance 2021-09-20                 2021-09-20               20.000000               0.010000          0.000000                      0.0               -1                1398422.0             23843.630000 369160.750000 RMFFJ1218      316800009        316800009     6.00045422E9 002513549379     HECM        Line of Credit ARM 857         2008-09-15     2008-09-09     2019-02-01               345317.120000                84774.400000                  0.000000           15178.740000                  0.000000                    696.670000                    0.010000               145.530000                    0.000000            0.000000             0.000000        0.000000   149565.950000 369160.750000 215712.000000 326786.190000     61191.020000     288000.000000         288000.000000               4955.030000           2679.680000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -21210.610000      35.000000           5460.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0408            0.0207              0.0569   7.0E-4      0.02                0   0.000000      NULL NULL        NULL

--	      6        11        13        11                1378417.0                 131                103 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-10-01                0.000000               0.000000          0.000000                      0.0               -1                1378417.0             13739.580000 321838.900000 RMF_FNMA_9     316800009        316800009     6.00030373E9 000936158678     HECM        Line of Credit ARM 857         2007-08-28     2007-08-23     2018-09-01               308099.320000                63242.600000                  0.000000           16912.460000                  0.000000                    344.320000                    0.000000               102.210000                    0.000000         -642.750000             0.640000        0.090000    87175.050000 321838.900000 205900.000000 288374.350000    114132.230000     290000.000000         290000.000000               4592.720000           2865.050000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -22590.020000      30.000000           5100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0544            0.0107               0.057   7.0E-4      0.01                0   0.000000      NULL NULL        NULL
--	      6        11        13        11                1378417.0                 130                101 BATCH                 11 Refer for FCL: Death           2021-09-30                 2021-09-30              448.620000             284.990000        133.170000                      0.0               -1                1378417.0             13739.580000 321838.900000 RMF_FNMA_9     316800009        316800009     6.00030373E9 000936158678     HECM        Line of Credit ARM 857         2007-08-28     2007-08-23     2018-09-01               308099.320000                63242.600000                  0.000000           16912.460000                  0.000000                    344.320000                    0.000000               102.210000                    0.000000         -642.750000             0.640000        0.090000    87175.050000 321838.900000 205900.000000 288374.350000    114132.230000     290000.000000         290000.000000               4592.720000           2865.050000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -22590.020000      30.000000           5100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0544            0.0107               0.057   7.0E-4      0.01                0   0.000000      NULL NULL        NULL
--	      6        11        13        11                1378417.0                 129                 91 Batch                 11 Refer for FCL: Death           2021-09-24                 2021-09-24             1734.000000               0.300000          0.140000                      0.0               -1                1378417.0             13723.490000 321390.280000 RMF_FNMA_9     316800009        316800009     6.00030373E9 000936158678     HECM        Line of Credit ARM 857         2007-08-28     2007-08-23     2018-09-01               307666.790000                62968.260000                  0.000000           16784.270000                  0.000000                    333.360000                    0.310000                97.080000                    0.150000         -642.750000             0.640000        0.090000    87175.050000 321390.280000 205900.000000 287997.550000    114132.230000     290000.000000         290000.000000               4592.720000           2880.330000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -22549.570000      30.000000           5070.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0544            0.0107               0.057   7.0E-4      0.01                0   0.000000      NULL NULL        NULL




		------------------------------------------------
		-- Check CAFI ... If the current status is in the same status code group, date will not be updated. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		
--		/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--		When a Called Due Trans exists in the trans history and corresponding CAFI already populated,
--		updaing date in tblStatusTracking is not effective.   
--		
--		Hi Cyndie, I have just placed todays status change under your queue.
--		I tested my script for this set of loans against JAVATest and want to calrify a few thing for tblStatusTracking updates below...
--		
--		#1.	Should the date be updated when the current type (Default, Called Due, Foreclosure, Liquid) is already the same as the requested status?
--		#2.	Should the date be updated when the status code group is the same for the current type and requested status?  
--
--		
--		Sample loans for above items are below 
--		#	Loan	New Status	New Eff. Date 	Current Type	Current Called Due Date
--		1	1398422	5702	10/28/2021	5702	11/6/2018
--		2	1141914	5702	10/28/2021	57	8/4/2021
--
--		Under JAVATest environment, I am not able to validate how CAFI dates are reflected by changes in tblStatusTracking, 
--		but I am thinking CAFI dates will not get updated if a transaction exists in the history with the same status code group as it is seen for loan 1141914.
--		
--		*/

	
		(7, 92765, 'Karen Williams', 1331544, 13, 5702, '2021-10-28'),
		(8, 92767, 'Karen Williams', 1257276, 13, 5702, '2021-10-28')
		------------------------------------------------------
		-- Called Due
		-- CALCFLDS
		select 
			CALCFLDS.CFIDATE AS "CafiDate", CALCFLDS.* 
			from CELINK.TBLCALCFIELDS AS CALCFLDS 
			where CALCFLDS.CFIFIELDID in (103) -- 103 Called Due Date , 132 Default date
			and   CALCFLDS.CFILOANNUMBER = 1378160 --3061716 -- 1257276 -- 1331544
			order by CREATIONDATE
		FOR READ ONLY with ur;
		
		--StatusTracking
		select 
			CALLEDDUEDATE, CALLEDDUETYPE, *
			from celink.tblstatustracking
			where statusloan = 1378160 -- 3061716 -- 1257276 -- 1331544
		for read only with ur;

		-- history .... 
		SELECT 
			SYS_START, SYS_END, USER_ID_COL, CHANGE_REC,
			STATUSLOAN, CALLEDDUETYPE,  CALLEDDUEDATE
			FROM CELINK.TBLStatusTracking 
			for system_time from '2019-06-01-00.00.00.000000' to '9999-12-30-00.00.00.000000'
			where statusloan  = 1378160 -- 3061716  
			order by STATUSLOAN, SYS_END desc
		for read only with UR;
		
		--Transactions
		select 
			INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, DTMEFFECTIVEDATE, IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, * 
			from celink.TBLTRANSACTIONS 
			where intsubservicerloannumber = 1265526 -- 3061716 -- 1257276 -- 1331544
		--	and IDSTRANSID =  
			order by IDSTRANSACTIONCOUNT desc 
		for read only with ur;



		---------------------------------------------------------------------------------
		-- Default
		-- CALCFLDS
		select 
			CALCFLDS.CFIDATE AS "CafiDate", CALCFLDS.* 
			from CELINK.TBLCALCFIELDS AS CALCFLDS 
			where CALCFLDS.CFIFIELDID in (102) -- 103 Called Due Date , 132 Default date
			and   CALCFLDS.CFILOANNUMBER = 1141914
			
			order by CREATIONDATE
		FOR READ ONLY with ur;
		
		--StatusTracking
		select 
			DEFAULTDATE, DEFAULTTYPE, *
			from celink.tblstatustracking
			where statusloan = 1141914
			
		for read only with ur;
		
		--Transactions
-- NEWSTATUSGRP         SEQNUM HDTNUM REQUESTER             LOAN    STATUSLOAN BADSTATUS NEWSTATUSDESC                         NEWSTATUS DEFAULTTYPE EFFDATE    DEFAULTDATE DEFAULTBALANCE
-- -------------------- ------ ------ --------------------- ------- ---------- --------- ------------------------------------- --------- ----------- ---------- ----------- --------------
-- Default                   1  93851 Christopher Castaneda 1265526  1265526.0        57 Default: Insurance                           62          62 2021-11-18 2021-11-18      972.000000
-- Default                   2  93851 Christopher Castaneda 1362021  1362021.0        13 Default: Tax & Insurance w/repay plan        53          53 2021-11-18 2021-11-18     1999.000000
-- Default                   3  93851 Christopher Castaneda 1366601  1366601.0        13 Default: Insurance                           62          62 2021-11-18 2021-11-18     1427.860000
-- Default                   4  93851 Christopher Castaneda 1336751  1336751.0        13 Default: Insurance                           62          62 2021-11-18 2021-11-18     1948.430000
-- Default                   5  93851 Christopher Castaneda 1247865  1247865.0        13 Default: Taxes                               61          61 2021-11-18 2021-11-18     1581.810000
-- Default                   6  93851 Christopher Castaneda 1208433  1208433.0        13 Default: Taxes                               61          61 2021-11-18 2021-11-18     1299.040000
-- Default                   7  93851 Christopher Castaneda 1381899  1381899.0        13 Default: Insurance                           62          62 2021-11-18 2021-11-18     1999.000000

		select 
			INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, DTMEFFECTIVEDATE, IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, * 
			from celink.TBLTRANSACTIONS 
			where intsubservicerloannumber = 1265526
			and IDSTRANSACTIONCODE = 90 
		--	and IDSTRANSID =  
			order by IDSTRANSACTIONCOUNT desc 
		for read only with ur;
-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ---------------- ------------------ ------------- -------------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--                1265526.0   37363866                  70 2020-01-27                       90            61 Default: Taxes         37363866                  70                 90 AR6610             6200             6200            61                1265526.0              0.0 005219464867     HECM        Line of Credit ARM 860         Batch     2020-01-27                 2020-01-27       2016-09-20     2016-09-15     2999-01-01             758.760000          109130.020000                13226.370000                  0.000000            6930.270000                  0.000000               0.340000          0.100000              5858.670000                    462.040000                    0.340000                 5.490000                    0.100000        -1781.000000             7.910000        1.630000    91822.480000 114988.690000  95400.000000 113686.280000      3577.520000 -1302.410000     180000.000000         180000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       3577.520000   4556.260000 -1302.410000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03557           0.04029              0.0367  0.02029      0.02                0               -1 Default: Taxes         0.000000      NULL NULL        NULL                     0.02
--                1265526.0   30096748                  51 2019-06-04                       90            61 Default: Taxes         30096748                  51                 90 AR6610             6200             6200            61                1265526.0              0.0 005219464867     HECM        Line of Credit ARM 860         Batch     2019-06-04                 2019-06-04       2016-09-20     2016-09-15     2999-01-01            1024.270000          105550.460000                10428.000000                  0.000000            6762.170000                  0.000000               3.520000          0.910000              5598.290000                    320.000000                    3.520000                52.820000                    0.910000        -1081.000000             4.920000        0.730000    91822.480000 111148.750000  95400.000000 109957.290000      3577.520000 -1191.460000     180000.000000         180000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       3577.520000   4406.830000 -1191.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03557            0.0482              0.0367   0.0282      0.02                0               -1 Default: Taxes       961.000000      NULL NULL        NULL                     0.22
--                1265526.0   24166611                  25 2018-05-18                       90             0 Active                 24166611                  25                 90 AR6610             5300             5300             0                1265526.0              0.0 005219464867     HECM        Line of Credit ARM 860         Batch     2018-05-18                 2018-05-18       2016-09-20     2016-09-15     2999-01-01             264.430000           99298.010000                 5556.940000                  0.000000            6418.590000                  0.000000               0.350000          0.120000              4402.450000                    101.280000                    0.350000                34.160000                    0.120000            0.000000             0.000000        0.000000    91822.480000 103700.460000  95400.000000 103443.820000      3577.520000  -256.640000     180000.000000         180000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       3577.520000   4145.810000  -256.640000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.03557           0.03728              0.0367  0.01728      0.02                0                0 Active                 0.000000      NULL NULL        NULL                     0.03

**********************************************************************************************************************************************************************
*/		