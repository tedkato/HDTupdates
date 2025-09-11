/* ****************************************************************************************************************************
* from Cyndie's note below, the Original Appraisal Value needs to  
Update following ... 
1. tblPropertyDescription.CurrentAppraisalValue
2. tblLoanData.CURPROPAPPRAISEDVALUE
3. Post 105 to tblTransactions with zero interest/mip, with requested value at CURPROPAPPRAISEDVALUE.
******************************************************************************************************************************** */


/*
-- ref 109825
Cyndie King
Sep 07, 2022 at 1:37 PM
Edited Sep 7 1:39 PM

Ted, these are done by posting a zero amount - zero interest/mip 105 to tblTransactions that updates the CURPROPAPPRAISEDVALUE field only,

tblPropertyDescription.CurrentAppraisalValue and tblPropertyDescription.CURRENTAPPRAISALDATE

tblLoanData.CURPROPAPPRAISEDVALUE only

--*-- my comment
Property Appraisal Date updated (tblPropertyDescription.CURRENTAPPRAISALDATE)
Original Appraisal Amount updated (tblPropertyDescription.CurrentAppraisalValue, tblLoanData.CURPROPAPPRAISEDVALUE, and 105 adjustment posted)  
Pending verification.

*/

/*
20220909
C:\Users\ted.kato\RS\Incident\ZZ HDTveri\aDoc\HDTValidation_x_.csv
C:\Users\ted.kato\Documents\HDTUpdtNotes_109718.csv
HDT109718_OriginalAppraisalValue.sql
INCIDENT #109718
Jennifer Dees
Director, Client Relations
Multiple changes in request
Created: Sep 02, 2022 at 7:25 PM by Jennifer Dees
Property Appraisals
60 various loans
RMF Z35392 Celin...xlsx
1199393	Original Appraisal Amount	195,000.00	200,000.00
*/

/*
source data ... ="(" & E2 & ", 174896, 'Jordann Greene', " & A2 & ", " & C2 & ", " & D2 & ", '" & B2 & "'),"
--request sample 
Celink#	Data field to be corrected	Incorrect Value	Correct Value
3363894	Appraisal	2,300,000	2,650,000.00 
3361571	Appraisal	380,000.00	425,000.00 
*/


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
20250910
[ID:0199112]  Appraisal Value Change  9/10/2025 11:53 AM  Jordann Greene
3358168, 3371814 3372073 3372778 3372772 3372773 3372774
Please update the appraised values as specified on the attached. 
I've already updated the auth contacts so you can disregard those. 
Thank you! 
="(" & E2 & ", 0199112, 'Jordann Greene', " & A2 & ", " & C2 & ", " & D2 & ", '" & B2 & "'),"
*/

----------------------------------------------------------------------------------------------------------
-- property
----------------------------------------------------------------------------------------------------------
-- check
select 
	TP.INTSUBSERVICERLOANNUMBER, TP.CURRENTAPPRAISALVALUE, --TP.DTMAPPRAISALDATE, TP.CURRENTAPPRAISALDATE, 
	TP.*
from celink.tblPropertyDescription TP 
where TP.INTSUBSERVICERLOANNUMBER in (3324644, 3332388, 3330263) 
for read only with ur;
-- INTSUBSERVICERLOANNUMBER CURRENTAPPRAISALVALUE IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS            CHRPROPCITY  CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE     DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- ------------------------ --------------------- ----------------- ------------------------ ------------------------- ------------ ------------ -------------- --------------- ---------------- ------------------ ------------------ --------------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--

----------------------------------------------------------------------------------------------------------
-- check bulk tblPropertyDescription
select
	P.SEQNUM, P.LOAN, P.Baad, P.Good, 
	TP.CURRENTAPPRAISALVALUE, TP.INTSUBSERVICERLOANNUMBER,  --TP.DTMAPPRAISALDATE, TP.CURRENTAPPRAISALDATE, 
	TP.*
from 
(Values

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

) P (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol)

inner join celink.tblPropertyDescription TP 
on P.Loan = TP.INTSUBSERVICERLOANNUMBER 
order by P.SeqNum
for read only with ur
;

-- SEQNUM LOAN    BAAD      GOOD    CURRENTAPPRAISALVALUE INTSUBSERVICERLOANNUMBER IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS            CHRPROPCITY   CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- ------ ------- --------- ------- --------------------- ------------------------ ----------------- ------------------------ ------------------------- ------------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--      1 3358168 1264800.0 1290000             1290000.0                3358168.0            832603                3358168.0 2159 W 78th Pl            Los Angeles   CA           900472605      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2024-12-12       NULL               NULL                        0                     0                         0              0             1290000.0 NULL                                  0 NULL                              0 NULL                                 0 06037                              NULL       4667562
--      2 3371814 6566000.0 6700000             6566000.0                3371814.0            846287                3371814.0 211 CENTRAL PARK W APT 9F NEW YORK      NY           10024          SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-05-11       NULL               NULL                        0                     0                         0              0             6566000.0 NULL                                  0 NULL                              0 NULL                                 0 36061                              NULL       4681204
--      3 3372073 1397340.0 1575000             1397340.0                3372073.0            846546                3372073.0 1350 Equestrian Ave       Thousand Oaks CA           913605106      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-06-08       NULL               NULL                        0                     0                         0              0             1397340.0 NULL                                  0 NULL                              0 NULL                                 0 06111                              NULL       4681463
--      4 3372778 1572660.0 1800000             1572660.0                3372778.0            847251                3372778.0 6031 S Sherbourne DRIVE   LOS ANGELES   CA           90056          SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-06-27       NULL               NULL                        0                     0                         0              0             1572660.0 NULL                                  0 NULL                              0 NULL                                 0 06037                              NULL       4682168
--      5 3372772  345289.8  393000              345289.8                3372772.0            847245                3372772.0 27949 Tyler Ln Unit 351   Santa Clarita CA           913874312      CDO                            0 NULL               NULL               NULL              NULL                  NULL                       2025-03-14       NULL               NULL                        0                     0                         0              0              345289.8 NULL                                  0 NULL                              0 NULL                                 0 06037                              NULL       4682162
--      6 3372773 1594022.0 1730000             1594022.0                3372773.0            847246                3372773.0 351 Sprucewood Dr         Encinitas     CA           920244132      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-06-01       NULL               NULL                        0                     0                         0              0             1594022.0 NULL                                  0 NULL                              0 NULL                                 0 06073                              NULL       4682163
--      7 3372774 1382100.0 1500000             1382100.0                3372774.0            847247                3372774.0 19233 Lyons Valley Rd     Jamul         CA           919353804      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-07-16       NULL               NULL                        0                     0                         0              0             1382100.0 NULL                                  0 NULL                              0 NULL                                 0 06073                              NULL       4682164
--after
-- SEQNUM LOAN    BAAD      GOOD    CURRENTAPPRAISALVALUE INTSUBSERVICERLOANNUMBER IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS            CHRPROPCITY   CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- ------ ------- --------- ------- --------------------- ------------------------ ----------------- ------------------------ ------------------------- ------------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--      1 3358168 1264800.0 1290000             1290000.0                3358168.0            832603                3358168.0 2159 W 78th Pl            Los Angeles   CA           900472605      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2024-12-12       NULL               NULL                        0                     0                         0              0             1290000.0 NULL                                  0 NULL                              0 NULL                                 0 06037                              NULL       4667562
--      2 3371814 6566000.0 6700000             6700000.0                3371814.0            846287                3371814.0 211 CENTRAL PARK W APT 9F NEW YORK      NY           10024          SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-05-11       NULL               NULL                        0                     0                         0              0             6700000.0 NULL                                  0 NULL                              0 NULL                                 0 36061                              NULL       4681204
--      3 3372073 1397340.0 1575000             1575000.0                3372073.0            846546                3372073.0 1350 Equestrian Ave       Thousand Oaks CA           913605106      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-06-08       NULL               NULL                        0                     0                         0              0             1575000.0 NULL                                  0 NULL                              0 NULL                                 0 06111                              NULL       4681463
--      4 3372778 1572660.0 1800000             1800000.0                3372778.0            847251                3372778.0 6031 S Sherbourne DRIVE   LOS ANGELES   CA           90056          SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-06-27       NULL               NULL                        0                     0                         0              0             1800000.0 NULL                                  0 NULL                              0 NULL                                 0 06037                              NULL       4682168
--      5 3372772  345289.8  393000              393000.0                3372772.0            847245                3372772.0 27949 Tyler Ln Unit 351   Santa Clarita CA           913874312      CDO                            0 NULL               NULL               NULL              NULL                  NULL                       2025-03-14       NULL               NULL                        0                     0                         0              0              393000.0 NULL                                  0 NULL                              0 NULL                                 0 06037                              NULL       4682162
--      6 3372773 1594022.0 1730000             1730000.0                3372773.0            847246                3372773.0 351 Sprucewood Dr         Encinitas     CA           920244132      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-06-01       NULL               NULL                        0                     0                         0              0             1730000.0 NULL                                  0 NULL                              0 NULL                                 0 06073                              NULL       4682163
--      7 3372774 1382100.0 1500000             1500000.0                3372774.0            847247                3372774.0 19233 Lyons Valley Rd     Jamul         CA           919353804      SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2025-07-16       NULL               NULL                        0                     0                         0              0             1500000.0 NULL                                  0 NULL                              0 NULL                                 0 06073                              NULL       4682164

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- note
-------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------
-- note ... 20230425 write privilege re-instated

--Insert into celink.tblLoanNotes 
--	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
-- 
with P (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(values

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

)
select 
	SeqNum,	
	Loan as "Loan Number",
   'Per HDT '|| P.HDTNum || ' ' || P.UpdtCol || ' updated from ' || P.Baad || ' to ' || P.Good ||'.'
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from P
inner join celink.tblPropertyDescription TP 
on P.Loan = TP.INTSUBSERVICERLOANNUMBER 
order by P.SeqNum
;

-- SEQNUM Loan Number 3                                                                 4                          5     6 7
-- ------ ----------- ----------------------------------------------------------------- -------------------------- ----- - -
--      1     3358168 Per HDT 199112 Appraisal Value updated from 1264800.0 to 1290000. 2025-09-10 12:23:27.496419 tkato 0 0
--      2     3371814 Per HDT 199112 Appraisal Value updated from 6566000.0 to 6700000. 2025-09-10 12:23:27.496419 tkato 0 0
--      3     3372073 Per HDT 199112 Appraisal Value updated from 1397340.0 to 1575000. 2025-09-10 12:23:27.496419 tkato 0 0
--      4     3372778 Per HDT 199112 Appraisal Value updated from 1572660.0 to 1800000. 2025-09-10 12:23:27.496419 tkato 0 0
--      5     3372772 Per HDT 199112 Appraisal Value updated from 345289.8 to 393000.   2025-09-10 12:23:27.496419 tkato 0 0
--      6     3372773 Per HDT 199112 Appraisal Value updated from 1594022.0 to 1730000. 2025-09-10 12:23:27.496419 tkato 0 0
--      7     3372774 Per HDT 199112 Appraisal Value updated from 1382100.0 to 1500000. 2025-09-10 12:23:27.496419 tkato 0 0

----------------------------------------------------------------------------------------------------
-- mergee update tblPropertyDescription
----------------------------------------------------------------------------------------------------
MERGE into celink.tblPropertyDescription T
USING
(
	select
		P.SEQNUM, P.LOAN, P.Baad, P.Good, 
		TP.CURRENTAPPRAISALVALUE, TP.INTSUBSERVICERLOANNUMBER --, TP.DTMAPPRAISALDATE, TP.CURRENTAPPRAISALDATE, TP.*
	from 
	(Values

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

	) P (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol)
	inner join celink.tblPropertyDescription TP 
	on P.Loan = TP.INTSUBSERVICERLOANNUMBER 
	order by P.SeqNum

)UY
on UY.LOAN = T.INTSUBSERVICERLOANNUMBER
WHEN MATCHED THEN  UPDATE
SET
T.CURRENTAPPRAISALVALUE = UY.Good
;
		
-- select fetch
-- SEQNUM LOAN    BAAD      GOOD    CURRENTAPPRAISALVALUE INTSUBSERVICERLOANNUMBER
-- ------ ------- --------- ------- --------------------- ------------------------
--      1 3358168 1264800.0 1290000             1290000.0                3358168.0
--      2 3371814 6566000.0 6700000             6566000.0                3371814.0
--      3 3372073 1397340.0 1575000             1397340.0                3372073.0
--      4 3372778 1572660.0 1800000             1572660.0                3372778.0
--      5 3372772  345289.8  393000              345289.8                3372772.0
--      6 3372773 1594022.0 1730000             1594022.0                3372773.0
--      7 3372774 1382100.0 1500000             1382100.0                3372774.0


----------------------------------------------------------------------------------------------------------
-- tblLoanData
----------------------------------------------------------------------------------------------------------
--select CURPROPAPPRAISEDVALUE, * from celink.tblLoanData where INTSUBSERVICERLOANNUMBER = 3302255 for read only with ur;
-- CURPROPAPPRAISEDVALUE INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP    BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- --------------------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ----------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--

-- check bulk
select
	P.SEQNUM, P.LOAN, P.Baad, P.Good, 
	TL.CURPROPAPPRAISEDVALUE, TL.INTSUBSERVICERLOANNUMBER,  TL.*
from 
(Values

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

) P (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol)

inner join celink.tblLoanData TL 
on P.Loan = TL.INTSUBSERVICERLOANNUMBER 
order by P.SeqNum
for read only with ur
;

-- SEQNUM LOAN    BAAD      GOOD    CURPROPAPPRAISEDVALUE INTSUBSERVICERLOANNUMBER INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE  CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER       CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- ------ ------- --------- ------- --------------------- ------------------------ ------------------------ ------------- ---------------- ------------ --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- ---------- ------------------ ------------- --------- ------------ ------------ -------------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--      1 3358168 1264800.0 1290000        1290000.000000                3358168.0                3358168.0          6600        234790013 Equity Power Fixed           2025-02-12                 2025-02-10 00:00:00.0 2025-02-05 00:00:00.0        1290000.000000                           0.0 Lump Sum   100395288803973082 N             N         2025-02-10             -1 Marc Contract             0.000000 2025-02-12                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 mcontract@4rmc.com                                                                                         -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            677932.800000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0939                   0.0                646554.01      17274.8 0.093900 0.093900                0.0             NULL NULL            0.000000   0.000000          0            2025-02-12              0.0              0.000000 2025-02-12   
--      2 3371814 6566000.0 6700000        6566000.000000                3371814.0                3371814.0          6600             6600 Equity Power Fixed           2025-07-30                 2025-07-28 00:00:00.0 2025-07-23 00:00:00.0        6566000.000000                           0.0 Lump Sum   100395200050078689 N             N         2025-10-01             -1 Patricia Ann Romanzi      0.000000 2025-07-30                          1 0                    0.0 Y                       50.0                  0.0 N                 0                0 0.000000        0.000000 promanzi@pareast.com                                                                                       -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Nationwide Equities Corporatio            169687.720000 NULL                       0        0.0      0.0                0.0                 0       0.0899                   0.0                169687.72     47914.68 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-07-30              0.0              0.000000 2025-07-30   
--      3 3372073 1397340.0 1575000        1397340.000000                3372073.0                3372073.0          6600             6600 Equity Power Fixed           2025-07-31                 2025-07-30 00:00:00.0 2025-07-25 00:00:00.0        1397340.000000                           0.0 Lump Sum   100395288805118744 N             N         2025-07-30             -1 Jason Stultz              0.000000 2025-07-31                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 jasons@caliverbeach.com                                                                                    -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            790195.770000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                717911.85     24095.86 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-07-31              0.0              0.000000 2025-07-31   
--      4 3372778 1572660.0 1800000        1572660.000000                3372778.0                3372778.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-04 00:00:00.0 2025-07-30 00:00:00.0        1572660.000000                           0.0 Lump Sum   100395200050078713 N             N         2025-10-01             -1 Anna Rose Binko           0.000000 2025-08-07                          1 0                    0.0 Y                       30.0                  0.0 N                 0                0 0.000000        0.000000 abinko@nwecorp.com                                                                                         -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Nationwide Equities Corporatio            621478.900000 NULL                       0        0.0      0.0                0.0                 0       0.0899                   0.0                 621478.9     40939.44 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      5 3372772  345289.8  393000         345289.800000                3372772.0                3372772.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-06 00:00:00.0 2025-08-01 00:00:00.0         345289.800000                           0.0 Lump Sum   100395288804133835 N             N         2025-08-06             -1 Jason C Harper            0.000000 2025-08-07                          1 0                    0.0 Y                       30.0                  0.0 N                 0                0 0.000000        0.000000 jcharper@nexamortgage.com                                                                                  -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            142673.750000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0899                   0.0                 62147.78      9783.95 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      6 3372773 1594022.0 1730000        1594022.000000                3372773.0                3372773.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-05 00:00:00.0 2025-07-31 00:00:00.0        1594022.000000                           0.0 Lump Sum   100395288804798439 N             N         2025-08-05             -1 Jason Stultz              0.000000 2025-08-07                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 jasons@caliverbeach.com                                                                                    -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            794779.370000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                164696.92     29516.71 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      7 3372774 1382100.0 1500000        1382100.000000                3372774.0                3372774.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-05 00:00:00.0 2025-07-31 00:00:00.0        1382100.000000                           0.0 Lump Sum   100395288805438969 N             N         2025-08-05             -1 Matthew Davis             0.000000 2025-08-07                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 matt@caliverbeach.com                                                                                      -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            752138.820000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                482131.22      39081.0 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   

--after
-- SEQNUM LOAN    BAAD      GOOD    CURPROPAPPRAISEDVALUE INTSUBSERVICERLOANNUMBER INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE  CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER       CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- ------ ------- --------- ------- --------------------- ------------------------ ------------------------ ------------- ---------------- ------------ --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- ---------- ------------------ ------------- --------- ------------ ------------ -------------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--      1 3358168 1264800.0 1290000        1290000.000000                3358168.0                3358168.0          6600        234790013 Equity Power Fixed           2025-02-12                 2025-02-10 00:00:00.0 2025-02-05 00:00:00.0        1290000.000000                           0.0 Lump Sum   100395288803973082 N             N         2025-02-10             -1 Marc Contract             0.000000 2025-02-12                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 mcontract@4rmc.com                                                                                         -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            677932.800000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0939                   0.0                646554.01      17274.8 0.093900 0.093900                0.0             NULL NULL            0.000000   0.000000          0            2025-02-12              0.0              0.000000 2025-02-12   
--      2 3371814 6566000.0 6700000        6700000.000000                3371814.0                3371814.0          6600             6600 Equity Power Fixed           2025-07-30                 2025-07-28 00:00:00.0 2025-07-23 00:00:00.0        6700000.000000                           0.0 Lump Sum   100395200050078689 N             N         2025-10-01             -1 Patricia Ann Romanzi      0.000000 2025-07-30                          1 0                    0.0 Y                       50.0                  0.0 N                 0                0 0.000000        0.000000 promanzi@pareast.com                                                                                       -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Nationwide Equities Corporatio            169687.720000 NULL                       0        0.0      0.0                0.0                 0       0.0899                   0.0                169687.72     47914.68 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-07-30              0.0              0.000000 2025-07-30   
--      3 3372073 1397340.0 1575000        1575000.000000                3372073.0                3372073.0          6600             6600 Equity Power Fixed           2025-07-31                 2025-07-30 00:00:00.0 2025-07-25 00:00:00.0        1575000.000000                           0.0 Lump Sum   100395288805118744 N             N         2025-07-30             -1 Jason Stultz              0.000000 2025-07-31                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 jasons@caliverbeach.com                                                                                    -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            790195.770000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                717911.85     24095.86 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-07-31              0.0              0.000000 2025-07-31   
--      4 3372778 1572660.0 1800000        1800000.000000                3372778.0                3372778.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-04 00:00:00.0 2025-07-30 00:00:00.0        1800000.000000                           0.0 Lump Sum   100395200050078713 N             N         2025-10-01             -1 Anna Rose Binko           0.000000 2025-08-07                          1 0                    0.0 Y                       30.0                  0.0 N                 0                0 0.000000        0.000000 abinko@nwecorp.com                                                                                         -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Nationwide Equities Corporatio            621478.900000 NULL                       0        0.0      0.0                0.0                 0       0.0899                   0.0                 621478.9     40939.44 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      5 3372772  345289.8  393000         393000.000000                3372772.0                3372772.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-06 00:00:00.0 2025-08-01 00:00:00.0         393000.000000                           0.0 Lump Sum   100395288804133835 N             N         2025-08-06             -1 Jason C Harper            0.000000 2025-08-07                          1 0                    0.0 Y                       30.0                  0.0 N                 0                0 0.000000        0.000000 jcharper@nexamortgage.com                                                                                  -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            142673.750000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0899                   0.0                 62147.78      9783.95 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      6 3372773 1594022.0 1730000        1730000.000000                3372773.0                3372773.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-05 00:00:00.0 2025-07-31 00:00:00.0        1730000.000000                           0.0 Lump Sum   100395288804798439 N             N         2025-08-05             -1 Jason Stultz              0.000000 2025-08-07                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 jasons@caliverbeach.com                                                                                    -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            794779.370000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                164696.92     29516.71 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      7 3372774 1382100.0 1500000        1500000.000000                3372774.0                3372774.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-05 00:00:00.0 2025-07-31 00:00:00.0        1500000.000000                           0.0 Lump Sum   100395288805438969 N             N         2025-08-05             -1 Matthew Davis             0.000000 2025-08-07                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 matt@caliverbeach.com                                                                                      -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            752138.820000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                482131.22      39081.0 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   


----------------------------------------------------------------------------------------------------
-- mergee update
----------------------------------------------------------------------------------------------------
MERGE into celink.tblLoanData T
USING
(
	select
		P.SEQNUM, P.LOAN, P.Baad, P.Good, 
		TL.CURPROPAPPRAISEDVALUE, TL.INTSUBSERVICERLOANNUMBER,  TL.*
	from 
	(Values

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

	) P (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol)
	
	inner join celink.tblLoanData TL 
	on P.Loan = TL.INTSUBSERVICERLOANNUMBER 
	order by P.SeqNum
)UY
on UY.LOAN = T.INTSUBSERVICERLOANNUMBER
WHEN MATCHED THEN  UPDATE
SET
T.CURPROPAPPRAISEDVALUE = UY.Good
;

-- select fetch
-- SEQNUM LOAN    BAAD      GOOD    CURPROPAPPRAISEDVALUE INTSUBSERVICERLOANNUMBER INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE  CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER       CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- ------ ------- --------- ------- --------------------- ------------------------ ------------------------ ------------- ---------------- ------------ --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- ---------- ------------------ ------------- --------- ------------ ------------ -------------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--      1 3358168 1264800.0 1290000        1290000.000000                3358168.0                3358168.0          6600        234790013 Equity Power Fixed           2025-02-12                 2025-02-10 00:00:00.0 2025-02-05 00:00:00.0        1290000.000000                           0.0 Lump Sum   100395288803973082 N             N         2025-02-10             -1 Marc Contract             0.000000 2025-02-12                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 mcontract@4rmc.com                                                                                         -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            677932.800000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0939                   0.0                646554.01      17274.8 0.093900 0.093900                0.0             NULL NULL            0.000000   0.000000          0            2025-02-12              0.0              0.000000 2025-02-12   
--      2 3371814 6566000.0 6700000        6566000.000000                3371814.0                3371814.0          6600             6600 Equity Power Fixed           2025-07-30                 2025-07-28 00:00:00.0 2025-07-23 00:00:00.0        6566000.000000                           0.0 Lump Sum   100395200050078689 N             N         2025-10-01             -1 Patricia Ann Romanzi      0.000000 2025-07-30                          1 0                    0.0 Y                       50.0                  0.0 N                 0                0 0.000000        0.000000 promanzi@pareast.com                                                                                       -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Nationwide Equities Corporatio            169687.720000 NULL                       0        0.0      0.0                0.0                 0       0.0899                   0.0                169687.72     47914.68 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-07-30              0.0              0.000000 2025-07-30   
--      3 3372073 1397340.0 1575000        1397340.000000                3372073.0                3372073.0          6600             6600 Equity Power Fixed           2025-07-31                 2025-07-30 00:00:00.0 2025-07-25 00:00:00.0        1397340.000000                           0.0 Lump Sum   100395288805118744 N             N         2025-07-30             -1 Jason Stultz              0.000000 2025-07-31                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 jasons@caliverbeach.com                                                                                    -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            790195.770000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                717911.85     24095.86 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-07-31              0.0              0.000000 2025-07-31   
--      4 3372778 1572660.0 1800000        1572660.000000                3372778.0                3372778.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-04 00:00:00.0 2025-07-30 00:00:00.0        1572660.000000                           0.0 Lump Sum   100395200050078713 N             N         2025-10-01             -1 Anna Rose Binko           0.000000 2025-08-07                          1 0                    0.0 Y                       30.0                  0.0 N                 0                0 0.000000        0.000000 abinko@nwecorp.com                                                                                         -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Nationwide Equities Corporatio            621478.900000 NULL                       0        0.0      0.0                0.0                 0       0.0899                   0.0                 621478.9     40939.44 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      5 3372772  345289.8  393000         345289.800000                3372772.0                3372772.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-06 00:00:00.0 2025-08-01 00:00:00.0         345289.800000                           0.0 Lump Sum   100395288804133835 N             N         2025-08-06             -1 Jason C Harper            0.000000 2025-08-07                          1 0                    0.0 Y                       30.0                  0.0 N                 0                0 0.000000        0.000000 jcharper@nexamortgage.com                                                                                  -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            142673.750000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0899                   0.0                 62147.78      9783.95 0.089900 0.089900                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      6 3372773 1594022.0 1730000        1594022.000000                3372773.0                3372773.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-05 00:00:00.0 2025-07-31 00:00:00.0        1594022.000000                           0.0 Lump Sum   100395288804798439 N             N         2025-08-05             -1 Jason Stultz              0.000000 2025-08-07                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 jasons@caliverbeach.com                                                                                    -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            794779.370000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                164696.92     29516.71 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   
--      7 3372774 1382100.0 1500000        1382100.000000                3372774.0                3372774.0          6600             6600 Equity Power Fixed           2025-08-07                 2025-08-05 00:00:00.0 2025-07-31 00:00:00.0        1382100.000000                           0.0 Lump Sum   100395288805438969 N             N         2025-08-05             -1 Matthew Davis             0.000000 2025-08-07                          2 0                    0.0 Y                        0.0                  0.0 N                 0                0 0.000000        0.000000 matt@caliverbeach.com                                                                                      -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           0 Nationwide Equities Corporatio            752138.820000 1950-12-31                 0        0.0      0.0                0.0                 0       0.0898                   0.0                482131.22      39081.0 0.089800 0.089800                0.0             NULL NULL            0.000000   0.000000          0            2025-08-07              0.0              0.000000 2025-08-07   

----------------------------------------------------------------------------------------------------------------------
-- note ... 20230425 write privilege re-instated

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
 
with P (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(values

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

)
select 
--	SeqNum,	
	Loan as "Loan Number",
   'Per HDT '|| P.HDTNum || ' ' || P.UpdtCol || ' updated from ' || P.Baad || ' to ' || P.Good ||'.'
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from P
inner join celink.tblPropertyDescription TP 
on P.Loan = TP.INTSUBSERVICERLOANNUMBER 
order by P.SeqNum
;

/*
--pre exec
 Loan Number 2                                                                 3                          4     5 6
 ----------- ----------------------------------------------------------------- -------------------------- ----- - -
     3358168 Per HDT 199112 Appraisal Value updated from 1264800.0 to 1290000. 2025-09-10 12:29:55.445357 tkato 0 0
     3371814 Per HDT 199112 Appraisal Value updated from 6566000.0 to 6700000. 2025-09-10 12:29:55.445357 tkato 0 0
     3372073 Per HDT 199112 Appraisal Value updated from 1397340.0 to 1575000. 2025-09-10 12:29:55.445357 tkato 0 0
     3372778 Per HDT 199112 Appraisal Value updated from 1572660.0 to 1800000. 2025-09-10 12:29:55.445357 tkato 0 0
     3372772 Per HDT 199112 Appraisal Value updated from 345289.8 to 393000.   2025-09-10 12:29:55.445357 tkato 0 0
     3372773 Per HDT 199112 Appraisal Value updated from 1594022.0 to 1730000. 2025-09-10 12:29:55.445357 tkato 0 0
     3372774 Per HDT 199112 Appraisal Value updated from 1382100.0 to 1500000. 2025-09-10 12:29:55.445357 tkato 0 0

*/

-----------------------------------------------------------------------------------------------------------
-- Notes validation

with P (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(values

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

)
select 
	P.SeqNum,
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
from P
inner join celink.tblloannotes a
on  P.Loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per HDT%' || P.HDTNUM || '%'
order by P.SeqNum 
;
-- SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                      CHRUSERID BLNPRIORITY
-- ------ -------------------------- ------------ ------------------------ ----------------------------------------------------------------- --------- -----------
--      1 2025-09-10 12:30:27.677121    213726388                3358168.0 Per HDT 199112 Appraisal Value updated from 1264800.0 to 1290000. tkato               0
--      2 2025-09-10 12:30:27.677121    213726389                3371814.0 Per HDT 199112 Appraisal Value updated from 6566000.0 to 6700000. tkato               0
--      3 2025-09-10 12:30:27.677121    213726390                3372073.0 Per HDT 199112 Appraisal Value updated from 1397340.0 to 1575000. tkato               0
--      4 2025-09-10 12:30:27.677121    213726391                3372778.0 Per HDT 199112 Appraisal Value updated from 1572660.0 to 1800000. tkato               0
--      5 2025-09-10 12:30:27.677121    213726392                3372772.0 Per HDT 199112 Appraisal Value updated from 345289.8 to 393000.   tkato               0
--      6 2025-09-10 12:30:27.677121    213726393                3372773.0 Per HDT 199112 Appraisal Value updated from 1594022.0 to 1730000. tkato               0
--      7 2025-09-10 12:30:27.677121    213726394                3372774.0 Per HDT 199112 Appraisal Value updated from 1382100.0 to 1500000. tkato               0


select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from celink.tblloannotes a  
	where a.INTSUBSERVICERLOANNUMBER in (3346672) 
	and   a.CHRLOANNOTES like 'Per HDT 199112%'
	order by a.IDSLOANNOTES desc 
for read only with UR;
/*
DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                  CHRUSERID BLNPRIORITY
-------------------------- ------------ ------------------------ ------------------------------------------------------------- --------- -----------
--
*/




----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ref ... single update

----------------------------------------------------
------** -- single Notes 
with Param ("SeqNum", "Loan Number", "Priority (Y/N)", "Note Step Number", "Step Date Completed (YYYY-MM-DD)", "Loan Note") as
(Values
(1, 3288814, 'N', '', '', 'Per HDT 112067 Original Appraisal Amount from 422,083.00	 to 525,000.00.')
) 
select * from Param P order by P."SeqNum"
;

-- SeqNum Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- ------------------------------------------------------------------------
--      1     3288814 N                                                                Per HDT 112067 Original Appraisal Amount from 422,083.00	 to 525,000.00.

-- SeqNum Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- ------------------------------------------------------------------------
--      1     3288814 N                                                                Per HDT 112067 Original Appraisal Amount from 422,083.00	 to 525,000.00.


-------------------------------------------------------------------------------------------------------
-- Original Appraisal Amount
--Celink#	Data field to be corrected	Incorrect Value		Correct Value
--3288814	Appraised Value	 			$422,083.00			$525,000.00 

-------------------------------------
-- property
-------------------------------------
select 
	TP.INTSUBSERVICERLOANNUMBER ,
	--TP.DTMAPPRAISALDATE, TP.CURRENTAPPRAISALDATE, 
	TP.CURRENTAPPRAISALVALUE,
	TP.*
from celink.tblPropertyDescription TP 
where TP.INTSUBSERVICERLOANNUMBER in (3288814) 
for read only with ur;
-- INTSUBSERVICERLOANNUMBER CURRENTAPPRAISALVALUE IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS     CHRPROPCITY CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- ------------------------ --------------------- ----------------- ------------------------ ------------------ ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--                3288814.0              422083.0            762945                3288814.0 9701  CHERT STREET DENTON      TX           76207          SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2022-08-02       NULL               NULL                        0                     0                         0              0              422083.0 NULL                                  0 NULL                              0 NULL                                 0                                    NULL       4598226



			/* UPDATEeeeeeee *******************************************************************************************************
			-- executed 20221007 5:48PM
			-- UPDATE celink.tblPropertyDescription set CurrentAppraisalValue = 525000.00  where INTSUBSERVICERLOANNUMBER = 3288814;
			
			********************************************************************************************************************* */


-- after
-- INTSUBSERVICERLOANNUMBER CURRENTAPPRAISALVALUE IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS     CHRPROPCITY CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- ------------------------ --------------------- ----------------- ------------------------ ------------------ ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--                3288814.0              525000.0            762945                3288814.0 9701  CHERT STREET DENTON      TX           76207          SFD                            1 NULL               NULL               NULL              NULL                  NULL                       2022-08-02       NULL               NULL                        0                     0                         0              0              525000.0 NULL                                  0 NULL                              0 NULL                                 0                                    NULL       4598226



-------------------------------------
-- tblLoanData
-------------------------------------
select CURPROPAPPRAISEDVALUE, * from celink.tblLoanData where 	INTSUBSERVICERLOANNUMBER = 3288814 for read only with ur;
-- CURPROPAPPRAISEDVALUE INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- --------------------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--         422083.000000                3288814.0          4600             4600 HECM        ARM 861         2022-09-09                 2022-09-07 00:00:00.0 2022-09-01 00:00:00.0         422083.000000                           0.0 Line of Credit 100030209079149422 N             N         2022-11-01              0                     0.000000 2022-09-09                          2 1                  0.005 N                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                            -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 CCMC                                      199223.180000 2022-08-01                 0       0.05      0.0                1.0                 1       0.0538              16707.07                      0.0          0.0 0.103800 0.053800                0.0             NULL NULL            0.000000   0.000000          0            2022-09-09              0.0              0.000000 2022-09-09   



			/* UPDATEeeeeeee *******************************************************************************************************
			-- executed 20221007 5:48PM

			--UPDATE celink.tblLoanData set CURPROPAPPRAISEDVALUE = 525000.00 where INTSUBSERVICERLOANNUMBER = 3288814;

			********************************************************************************************************************* */

			
-- after
-- CURPROPAPPRAISEDVALUE INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- --------------------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--         525000.000000                3288814.0          4600             4600 HECM        ARM 861         2022-09-09                 2022-09-07 00:00:00.0 2022-09-01 00:00:00.0         525000.000000                           0.0 Line of Credit 100030209079149422 N             N         2022-11-01              0                     0.000000 2022-09-09                          2 1                  0.005 N                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                            -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 CCMC                                      199223.180000 2022-08-01                 0       0.05      0.0                1.0                 1       0.0538              16707.07                      0.0          0.0 0.103800 0.053800                0.0             NULL NULL            0.000000   0.000000          0            2022-09-09              0.0              0.000000 2022-09-09   
			