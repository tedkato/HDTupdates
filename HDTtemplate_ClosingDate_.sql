/*
** This is to change tblLoanData and Note.

** should be the same format as MCA/Appraisal
(SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol)
xx ="(" & E2 & ", 164547, 'Jordann Greene', " & A2 & ", " & C2 & ", " & D2 & ", '" & B2 & "'),"

="(" & E2 & ", 0167325, 'Jennifer Dees', " & A2 & ", date('" & text(C2, "YYYY-MM-DD") & "'), date('" & text(D2, "YYYY-MM-DD") & "'), '" & B2 & "'),"

**
Notes,
tblLoanData,
tblTransactions

--*--
Closing date updated for 1 loan updating tblLoanData, posting 105 adjustment in tblTransactions. Peer review pending.

*/

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------


/*
20250829

[ID:0198294] closing date 8/29/2025 12:11 PM Jordann Greene 
3374081  Please update closing date to 8/19/25

="(" & E2 & ", 0198294, 'Jordann Greene', " & A2 & ", date('" & text(C2, "YYYY-MM-DD") & "'), date('" & text(D2, "YYYY-MM-DD") & "'), '" & B2 & "'),"

(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')
*/



/*
--Notes sample
 LOAN    2                                                         3                          4     5 6
 ------- --------------------------------------------------------- -------------------------- ----- - -
 3357640 Per HDT 185518 ClosingDate from 2025-01-30 to 2025-02-10. Occupancy cycle updated from 1-2-3 to 2-3-4. 2025-03-24 16:35:04.481822 tkato 0 0
*/


/* test the cycle
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Occupancy cycle in tblBorrower  ... the new date is the same month as old, so no change required here.
with P (SeqNum, HDTNum, Requester, Loan,  Baad, Good, UpdtCol) as
(values
(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')	
)
select 
	P.seqnum, P.loan,	P.Good,
	TT.INTSUBSERVICERLOANNUMBER, 
	TT.INTOCCUPCERTDATEFIRSTLETTER, TT.INTOCCUPCERTDATESECONDLETTER, TT.INTOCCUPCERTDATETHIRDLETTER,
	TT.*
from  P 
inner join CELINK.TBLBORROWER TT
on P.loan = TT.INTSUBSERVICERLOANNUMBER

order by P.seqnum
for read only with ur;

-- SEQNUM LOAN    GOOD       INTSUBSERVICERLOANNUMBER INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER IDSBORROWERID INTSUBSERVICERLOANNUMBER CHRSSN    INTPIN CHRFIRSTNAME CHRMIDDLENAME CHRLASTNAME CHRMAILADDRESS           CHRMAILCITY CHRMAILSTATE CHRMAILZIPCODE CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS      CURINCOME   DTMBIRTHDATE          INTAGE CHRGENDER CHRMARITALSTATUS CHRRACE CHRETHNICITY DTMDEATHDATE BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER BTNSTATEMENTSTOP CHRFAX NONBORROWINGSPOUSE DTCOMPLAINTDATE DTLITIGATIONDATE DTCEASEANDDESIST CONVENIENCECHECKINDICATOR PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE
-- ------ ------- ---------- ------------------------ --------------------------- ---------------------------- --------------------------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- ------------------------ ----------- ------------ -------------- ------------ ------------ -------------- -------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
--      1 3374081 2025-08-19                3374081.0                           8                            9                          10        851192                3374081.0 549878547   NULL Gurmit                     Paul        31505 Pacific Coast Hwy  Malibu      CA           902652642      3107215375                3107215375     gurmit_p@hotmail.com 4014.260000 1958-02-14 12:00:00.0     68 F         S                1       2            NULL                           -1 2025-08-18 12:00:00.0                              8                            9                          10                0 NULL   N                  NULL            NULL             NULL                                     0   683470        683470      683470     2683470       4683470  683470        NULL NULL                NULL

-- NO change required FOR THIS LOAN !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 

***** update sampleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
UPDATE CELINK.TBLBORROWER
set 
INTOCCUPCERTDATEFIRSTLETTER = 7,
INTOCCUPCERTDATESECONDLETTER= 8,
INTOCCUPCERTDATETHIRDLETTER = 9  where INTSUBSERVICERLOANNUMBER = 3370280
;
***** updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee 
*/


--------------------------------------------------------------------------------------------------------------------------------------------
-- closing date ... tblloandata
select 
--	TT.DATEFIRSTIRC,
--	TT.DTMFUNDINGDATE,  
	TT.DTMClosingDate
	, '-->--', TT.* 
from  celink.tblloandata TT
where  TT.INTSUBSERVICERLOANNUMBER = 3374081
for read only with ur;
-- DTMCLOSINGDATE        2     INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP    BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- --------------------- ----- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ----------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- tblTransactions -- single
select 
	TT.DTMCLOSINGDATE, 
	TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.dtmEFFECTIVEDATE,
	TT.IDSSTATUSCODE, TT.IDSUSERID
	,'-->--', TT.*
	
from  celink.tbltransactions TT
where TT.INTSUBSERVICERLOANNUMBER = 3374081
order by TT.IDSTRANSACTIONCOUNT desc
with ur;
-- DTMCLOSINGDATE INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE DTMEFFECTIVEDATE IDSSTATUSCODE IDSUSERID         8     IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID         DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- -------------- ------------------------ ------------------- ------------------ ---------------- ------------- ----------------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ----------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------

--------------------------------------------------------------------------------------------------------------------------------------------
-- closing date ... tblloandata -- bulk
with P (SeqNum, HDTNum, Requester, Loan,  Baad, Good, UpdtCol) as
(values
(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')	
)
select 
	P.SEQNUM, P.LOAN, P.Baad, P.Good, 
	TT.DTMClosingDate, TT.INTSUBSERVICERLOANNUMBER,  
	--	TT.DATEFIRSTIRC,
	--	TT.DTMFUNDINGDATE,  
	'-->--', TT.*
	
from  P 
inner join celink.tblloandata TT
on P.loan = TT.INTSUBSERVICERLOANNUMBER
order by P.seqnum
for read only with ur
;
-- ------ ------- ---------- ---------- ********************* ------------------------ ----- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ----------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
-- SEQNUM LOAN    BAAD       GOOD       DTMCLOSINGDATE        INTSUBSERVICERLOANNUMBER 7     INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- ------ ------- ---------- ---------- --------------------- ------------------------ ----- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- ---------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--      1 3374081 2025-08-18 2025-08-19 2025-08-18 00:00:00.0                3374081.0 -->--                3374081.0          4800             4800 Platinum    Fixed           2025-08-26                 2025-08-25 00:00:00.0 2025-08-18 00:00:00.0        5250000.000000 Fixed                     0.0 Lump Sum   101311888805118328 N             N         2025-08-25             -1 James Samuel        0.000000 2025-08-26                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 jsamuel@summitlr.com                                                                                       -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Longbridge Financial LLC                 1774500.000000 1950-12-31                 0        0.0      0.0                0.0                 0      0.08875                   0.0                834787.93     26568.17 0.088750 0.088750                0.0             NULL NULL            0.000000   0.000000          0            2025-08-26              0.0              0.000000 2025-08-26   

---------------------------------------------------------------------------------------------------------------------------------------
------ Notes test 
with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(VALUES
(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')	
)	
Select 
--	SeqNum ,
	Loan	
	,
   'Per HDT ' || UY.HDTNum || ' ' || UY.UpdtCol || ' from ' || UY.Baad || ' to ' || UY.Good || '.' 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from MyVal UY  
Order by SeqNum 
; 
-- LOAN    2                                                          3                          4     5 6
-- ------- ---------------------------------------------------------- -------------------------- ----- - -
-- 3374081 Per HDT 198294 Closing Date from 2025-08-18 to 2025-08-19. 2025-08-29 13:11:04.667716 tkato 0 0


----------------------------------------------------------------------------------------------------
-- mergee update
MERGE into celink.tblLoanData T
USING
(
	select 
		P.SEQNUM, P.LOAN, P.Baad, P.Good, 
		TT.DTMClosingDate, TT.INTSUBSERVICERLOANNUMBER
	from  
	(values
	(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')	
	) P (SeqNum, HDTNum, Requester, Loan,  Baad, Good, UpdtCol) 
	inner join celink.tblloandata TT
	on P.loan = TT.INTSUBSERVICERLOANNUMBER
	order by P.seqnum
)UY
on UY.LOAN = T.INTSUBSERVICERLOANNUMBER
WHEN MATCHED THEN  UPDATE
SET
T.DTMClosingDate = date(UY.Good)
;

/*
 SEQNUM LOAN    BAAD       GOOD       DTMCLOSINGDATE        INTSUBSERVICERLOANNUMBER
 ------ ------- ---------- ---------- --------------------- ------------------------
      1 3374081 2025-08-18 2025-08-19 2025-08-18 00:00:00.0                3374081.0
*/

		----------------------------------------------------------------------------------
		-- validation
		select 
			P.SEQNUM, P.LOAN, P.Baad, P.Good, 
			TT.DTMClosingDate, TT.INTSUBSERVICERLOANNUMBER
			-- ,  
			--	TT.DATEFIRSTIRC,
			--	TT.DTMFUNDINGDATE,  
			-- '-->--', TT.*
		from  
		(values
		(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')	
		) P (SeqNum, HDTNum, Requester, Loan,  Baad, Good, UpdtCol) 
		 
		inner join celink.tblloandata TT
		on P.loan = TT.INTSUBSERVICERLOANNUMBER
		order by P.seqnum
		for read only with ur
		;

		-- SEQNUM LOAN    BAAD       GOOD       DTMCLOSINGDATE        INTSUBSERVICERLOANNUMBER
		-- ------ ------- ---------- ---------- --------------------- ------------------------
		--      1 3374081 2025-08-18 2025-08-19 2025-08-19 00:00:00.0                3374081.0


---------------------------------------------------------------------------------------------------------------------------------------
------ Notes post 
Insert into celink.tblLoanNotes 
(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(VALUES

(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')	
				
)	
Select 
--	SeqNum ,
	Loan	
	,
   'Per HDT ' || UY.HDTNum || ' ' || UY.UpdtCol || ' from ' || UY.Baad || ' to ' || UY.Good || '.' 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from MyVal UY  
Order by SeqNum 
; 

/*
 LOAN    2                                                          3                          4     5 6
 ------- ---------------------------------------------------------- -------------------------- ----- - -
 3374081 Per HDT 198294 Closing Date from 2025-08-18 to 2025-08-19. 2025-08-29 13:13:12.915164 tkato 0 0
*/

------------------
-- Notes validation
with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(VALUES
(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')	
)	
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
from MyVal UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'

order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;

-- SEQNUM DTMNOTEDATE               IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                               CHRUSERID BLNPRIORITY NOTESTEP
-- ------ ------------------------- ------------ ------------------------ ---------------------------------------------------------- --------- ----------- --------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- tblTransactions -- -- bulk check --- do this with 105 script

--end
