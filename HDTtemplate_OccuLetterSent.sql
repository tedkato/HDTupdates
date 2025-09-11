/*
20200511

INCIDENT #58453

Leady Leon
Specialist IV
3151880 Thomas Graham
Created: May 06, 2020 at 2:08 PM by Leady Leon
RESOLUTION
No Action Required
May 10, 2020 at 6:39 PM, by Cyndie.King@celink.com
Hello,

Please remove date in field “Date 2nd Occupancy Letter Sent”.
Data is incorrect.


--*************************************************************************************
From: Cyndie King 
Sent: Sunday, May 10, 2020 7:39 PM
To: Ted Kato <Ted.Kato@celink.com>
Cc: Vicky Cermak <Vicky.Cermak@celink.com>
Subject: Occupancy letters 

Ted, there is a current issue with some of the Occupancy letters that were sent out and we’re getting tickets for them – ticket 58453 is an example of this.
If you see tickets requesting that the date for the Second Occupancy letter sent date be deleted, a couple of things need to be checked prior to forwarding theticket or removing the date.
Check to see that the Funding Date of the loan is sometime in April, 2020. If this is the case then respond with

"This loan is one of several under review for an inappropriate 2nd occupancy letter sent. 
It will be handled with the others. Should you come across any others, 
please know that loans that boarded in April, 2020 and also funded in April, 
2020 have been identified to have this issue. 
No further tickets are necessary or desired.
Closing the ticket."

ONLY iff the loan in question did NOT fund in April, 2020 then please remove the date and note the loan as appropriate.

Thank you,
Cyndie King, IT Production Support Supervisor
Celink 
--*************************************************************************************


Cyndie.King@celink.com
May 10, 2020 at 7:39 PM
This loan is one of several under review for an inappropriate 2nd occupancy letter sent. It will be handled with the others. Should you come across any others, please know that loans that boarded in April, 2020 and also funded in April, 2020 have been identified to have this issue. No further tickets are necessary or desired.

Closing this ticket.

*/

/*
20210111 ... Cydie resolved ... it looks like when the existing 2nd is older than the new 1st, 2nd should be removed.

C:\Users\Ted.Kato\Documents\HDTUpdtNotes_76137.csv

INCIDENT #76137
Meghan DeHoyos
Specialist
Request to Update Occupancy Tab
Created: Jan 11, 2021 at 4:29 PM by Meghan DeHoyos
Good afternoon,

I have attached the form to request an update to a field in the Occupancy tab. Can you please review and have completed?

Data Change Request ...xlsx

Celink Loan Number	Data field to be corrected	 Incorrect Value 	 Correct Value 
3037676	Date 1st Occupancy Letter Sent	2/1/2019	1/11/2021
3039314	Date 1st Occupancy Letter Sent	4/1/2019	1/11/2021
3072354	Date 1st Occupancy Letter Sent	10/1/2018	1/8/2021
3045058	Date 1st Occupancy Letter Sent	3/15/2018	1/11/2021

*/

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

/*
20250904

198634	Ted Kato	Occupancy letter date	Ankita Paul		Low	9/4/2025 1:36
1198772 , 1195851

Celink Loan Number	Data field to be corrected	 Incorrect Value 	 Correct Value 
1198772	Date 1st Occupancy Letter Sent	9/3/2024	9/4/2025
1195851	Date 1st Occupancy Letter Sent	9/5/2024	9/4/2025

2 loans updated.  Peer review pending.
*Occupancy cycle also updated for loan 1195851.
 
(1198772, 'Per HDT 198634 1st Occupancy Letter sent date updated from 9/3/2024 to 9/4/2025.', CURRENT_TIMESTAMP,'tkato',0),
(1195851, 'Per HDT 198634 1st Occupancy Letter sent date updated from 9/5/2024 to 9/4/2025.  Occupancy cycle changed from 5 6 7 to 9 10 11.', CURRENT_TIMESTAMP,'tkato',0)
 
*/

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------

select 
	T.NBSLOANNUMBER,  
	T.BOANNUALNBSCERTRECEIVEDDATE,
	T.BOFIRSTNAME
,   T.BOLASTNAME
,   T.BOBIRTHDATE
,   T.BOPROTECTEDNBS
,	T.COPROTECTEDNBS
,   T.BOGENDER      
, 	T.BOSSN
,	T.BOPRIMARYPHONE
,	T.COGENDER               
,	T.BODATEOFDEATH  
,	T.BONBSELIGIBILITYREVOKEDDATE
,	'-->--', T.*

from  CELINK.TBLNONBORROWINGSPOUSES T
where  T.NBSLOANNUMBER in (1198772, 1195851)
with ur;

-- NBSLOANNUMBER BOANNUALNBSCERTRECEIVEDDATE BOFIRSTNAME BOLASTNAME      BOBIRTHDATE           BOPROTECTEDNBS COPROTECTEDNBS BOGENDER BOSSN BOPRIMARYPHONE COGENDER BODATEOFDEATH BONBSELIGIBILITYREVOKEDDATE 14    NBSLOANNUMBER BOFIRSTNAME BOLASTNAME      BOSSN BOBIRTHDATE           BOPRIMARYPHONE BOPROTECTEDNBS BODIVORCEDATE COFIRSTNAME COLASTNAME COSSN COBIRTHDATE COPRIMARYPHONE COPROTECTEDNBS CODIVORCEDATE BOGENDER COGENDER BODATEOFDEATH CODATEOFDEATH BODATEMOVEOUT CODATEMOVEOUT BODIVORCEDECREEDATE CODIVORCEDECREEDATE BOLEGALRIGHTREMAININPROPRCVD COLEGALRIGHTREMAININPROPRCVD BOLEGALRIGHTTIMEEXTREQ COLEGALRIGHTTIMEEXTREQ BODEFFERALPERIODAPPROVEDDATE CODEFFERALPERIODAPPROVEDDATE BODEFFERALPERIODDENIEDDATE CODEFFERALPERIODDENIEDDATE BOREINSTATEMENTDATE1 COREINSTATEMENTDATE1 BOREINSTATEMENTDATE2 COREINSTATEMENTDATE2 BOINELIGIBLENBSCERTRECEIVEDDATE COINELIGIBLENBSCERTRECEIVEDDATE BONBSELIGIBILITYREVOKEDDATE CONBSELIGIBILITYREVOKEDDATE BOMKTBLTITLERCVDDEADLINE COMKTBLTITLERCVDDEADLINE BOTOLLINGAGRMNTRCVDDATE COTOLLINGAGRMNTRCVDDATE BODEATHNOTIFICATION CODEATHNOTIFICATION BOWRITTENREQRCVDFROMNBS COWRITTENREQRCVDFROMNBS BODRIVERLICENSE CODRIVERLICENSE BOCURRENTUTILITYBILL COCURRENTUTILITYBILL BOCURRENTBANKSTMT COCURRENTBANKSTMT BOOTHERPROOFOCCUPANCY COOTHERPROOFOCCUPANCY BOOTHERPROOFOCCUPANCYDT COOTHERPROOFOCCUPANCYDT BOMARRIAGECERT COMARRIAGECERT BOCOUNSELINGCERT COCOUNSELINGCERT BOLEGALOPINION COLEGALOPINION BOOTHERPROOFMARRIAGE COOTHERPROOFMARRIAGE BOOTHERPROOFMARRIAGEDT COOTHERPROOFMARRIAGEDT BODEATHCERTRCVD CODEATHCERTRCVD BOPROOFMKTBLETITLERCVD COPROOFMKTBLETITLERCVD BOTOLLINGAGRMNTRCVD COTOLLINGAGRMNTRCVD BOMOEELECTIONDEADLINE COMOEELECTIONDEADLINE BOMOEELECTIONMADTOHUD COMOEELECTIONMADTOHUD BOMOEASSESSMENTDEADLINE COMOEASSESSMENTDEADLINE BOMOEASSESSMENTAPPVLDT COMOEASSESSMENTAPPVLDT BOMOEASSESSMENTDENIALDT COMOEASSESSMENTDENIALDT BOASSIGNMNTTOHUDDEADLINE COASSIGNMNTTOHUDDEADLINE BOMOEAPPRVLLETTERSENTDT COMOEAPPRVLLETTERSENTDT BOMOEDENIALLETTERSENTDT COMOEDENIALLETTERSENTDT BOANNUALNBSCERTMAILEDDATE COANNUALNBSCERTMAILEDDATE BOANNUALNBSCERTRECEIVEDDATE COANNUALNBSCERTRECEIVEDDATE BOPOSTDEATHNBSCERTMAILEDDATE COPOSTDEATHNBSCERTMAILEDDATE BOPOSTDEATHNBSCERTRECEIVEDDATE COPOSTDEATHNBSCERTRECEIVEDDATE BOINELIGIBLENBSCERTMAILEDDATE COINELIGIBLENBSCERTMAILEDDATE PERSONIDBO PERSONIDCOBO HOMEPHONEIDBO HOMEPHONEIDCOBO BOLANGCODE COLANGCODE
-- ------------- --------------------------- ----------- --------------- --------------------- -------------- -------------- -------- ----- -------------- -------- ------------- --------------------------- ----- ------------- ----------- --------------- ----- --------------------- -------------- -------------- ------------- ----------- ---------- ----- ----------- -------------- -------------- ------------- -------- -------- ------------- ------------- ------------- ------------- ------------------- ------------------- ---------------------------- ---------------------------- ---------------------- ---------------------- ---------------------------- ---------------------------- -------------------------- -------------------------- -------------------- -------------------- -------------------- -------------------- ------------------------------- ------------------------------- --------------------------- --------------------------- ------------------------ ------------------------ ----------------------- ----------------------- ------------------- ------------------- ----------------------- ----------------------- --------------- --------------- -------------------- -------------------- ----------------- ----------------- --------------------- --------------------- ----------------------- ----------------------- -------------- -------------- ---------------- ---------------- -------------- -------------- -------------------- -------------------- ---------------------- ---------------------- --------------- --------------- ---------------------- ---------------------- ------------------- ------------------- --------------------- --------------------- --------------------- --------------------- ----------------------- ----------------------- ---------------------- ---------------------- ----------------------- ----------------------- ------------------------ ------------------------ ----------------------- ----------------------- ----------------------- ----------------------- ------------------------- ------------------------- --------------------------- --------------------------- ---------------------------- ---------------------------- ------------------------------ ------------------------------ ----------------------------- ----------------------------- ---------- ------------ ------------- --------------- ---------- ----------
--     1195851.0 NULL                        LISA        CURLEE SPILLMAN 1963-08-29 00:00:00.0 N              N              F              9999999999     NULL     NULL          NULL                        -->--     1195851.0 LISA        CURLEE SPILLMAN       1963-08-29 00:00:00.0 9999999999     N              NULL          NULL        NULL             NULL        NULL           N              NULL          F        NULL     NULL          NULL          NULL          NULL          NULL                NULL                NULL                         NULL                         NULL                   NULL                   NULL                         NULL                         NULL                       NULL                       NULL                 NULL                 NULL                 NULL                 NULL                            NULL                            NULL                        NULL                        NULL                     NULL                     NULL                    NULL                    NULL                NULL                NULL                    NULL                    NULL            NULL            NULL                 NULL                 NULL              NULL              NULL                  NULL                  NULL                    NULL                    NULL           NULL           NULL             NULL             NULL           NULL           NULL                 NULL                 NULL                   NULL                   NULL            NULL            NULL                   NULL                   NULL                NULL                NULL                  NULL                  NULL                  NULL                  NULL                    NULL                    NULL                   NULL                   NULL                    NULL                    NULL                     NULL                     NULL                    NULL                    NULL                    NULL                    NULL                      NULL                      NULL                        NULL                        NULL                         NULL                         NULL                           NULL                           NULL                          NULL                             3018450      4018450       9018450        10018450            
--     1198772.0 NULL                        Maria       Diaz            1944-06-22 00:00:00.0 N              N              F              3058214333     NULL     NULL          NULL                        -->--     1198772.0 Maria       Diaz                  1944-06-22 00:00:00.0 3058214333     N              NULL          NULL        NULL             NULL        NULL           N              NULL          F        NULL     NULL          NULL          NULL          NULL          NULL                NULL                NULL                         NULL                         NULL                   NULL                   NULL                         NULL                         NULL                       NULL                       NULL                 NULL                 NULL                 NULL                 NULL                            NULL                            NULL                        NULL                        NULL                     NULL                     NULL                    NULL                    NULL                NULL                NULL                    NULL                    NULL            NULL            NULL                 NULL                 NULL              NULL              NULL                  NULL                  NULL                    NULL                    NULL           NULL           NULL             NULL             NULL           NULL           NULL                 NULL                 NULL                   NULL                   NULL            NULL            NULL                   NULL                   NULL                NULL                NULL                  NULL                  NULL                  NULL                  NULL                    NULL                    NULL                   NULL                   NULL                    NULL                    NULL                     NULL                     NULL                    NULL                    NULL                    NULL                    NULL                      NULL                      NULL                        NULL                        NULL                         NULL                         NULL                           NULL                           NULL                          NULL                             3017575      4017575       9017575        10017575            

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
--Funding Date / Rate_At_Closing / Initial Disbursement Limit / IRC ... Closing date is in transaction 
--Check to see that the Funding Date of the loan is sometime in April, 2020. If this is the case then respond with ...
select 
	TT.INTSUBSERVICERLOANNUMBER,
	TT.INITIALDISBURSEMENTLIMIT, --Initial Disbursement Limi
	TT.DTMFUNDINGDATE, --Funding Date
--	TT.DATEFIRSTIRC, --IRC
--	TT.BEGININTRATE, -- Rate_At_Closing
	*
	from CELINK.TBLLOANDATA TT
	where TT.INTSUBSERVICERLOANNUMBER in (1198772, 1195851)
for read only with ur;
-- INTSUBSERVICERLOANNUMBER INITIALDISBURSEMENTLIMIT DTMFUNDINGDATE        INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME                 PREVIOUSSPCCONTACTNAME         SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- ------------------------ ------------------------ --------------------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------- ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ ------------------------------ ------------------------------ -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- ----- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--                1195851.0                 0.000000 2011-05-13 00:00:00.0                1195851.0          4800             4800 HECM        Fixed           2015-03-01                 2011-05-13 00:00:00.0 2011-05-09 00:00:00.0         375000.000000                           0.0 Line of Credit NULL          N             N         2011-05-01             -1                     0.000000 2015-03-01                          1 1                 0.0125 N                        0.0                  0.0 N                 0                0 0.000000        0.000000                                                                                                            -1      0 DAD                                                           2024-03-18     2023-10-10                                 0 en-us                  0.0           2 THE FIRST NATIONAL BANK LAYTON                 0.000000 2010-12-02                 0        0.0      0.0                0.0                 0       0.0506                   0.0                      0.0          0.0 0.050600 0.050600                0.0         2.875000 2012-02-06       NULL       NULL       NULL NULL       NULL                   NULL                  NULL NULL         NULL
--                1198772.0                 0.000000 2012-10-01 00:00:00.0                1198772.0          4800             4800 HECM        Fixed           2015-03-01                 2012-10-01 00:00:00.0 2012-09-24 00:00:00.0         204000.000000                           0.0 Line of Credit NULL          N             N         2012-09-01             -1                     0.000000 2015-03-01                          1 1                 0.0125 N                        0.0                  0.0 N                 0                0 0.000000        0.000000                                                                                                            -1      0                                                               2017-04-28     NULL                                       0 en-us                  0.0           1 MCM HOLDINGS INC                               0.000000 2012-08-13                 0        0.0      0.0                0.0                 0       0.0506                   0.0                      0.0          0.0 0.050600 0.050600                0.0         2.750000 2012-12-13       NULL       NULL       NULL NULL       NULL                   NULL                  NULL NULL         NULL

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Occupancy cycle in tblBorrower  ... 
--1198772	Date 1st Occupancy Letter Sent	9/3/2024	9/4/2025
--1195851	Date 1st Occupancy Letter Sent	9/5/2024	9/4/2025
 
select 
	TT.INTSUBSERVICERLOANNUMBER, 
	TT.INTOCCUPCERTDATEFIRSTLETTER, TT.INTOCCUPCERTDATESECONDLETTER, TT.INTOCCUPCERTDATETHIRDLETTER,
	TT.*
from CELINK.TBLBORROWER TT
where TT.INTSUBSERVICERLOANNUMBER in (1198772, 1195851)
order by INTSUBSERVICERLOANNUMBER
for read only with ur;

-- INTSUBSERVICERLOANNUMBER INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER IDSBORROWERID INTSUBSERVICERLOANNUMBER CHRSSN    INTPIN CHRFIRSTNAME CHRMIDDLENAME CHRLASTNAME CHRMAILADDRESS     CHRMAILCITY CHRMAILSTATE CHRMAILZIPCODE CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS      CURINCOME DTMBIRTHDATE          INTAGE CHRGENDER CHRMARITALSTATUS CHRRACE CHRETHNICITY DTMDEATHDATE          BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER BTNSTATEMENTSTOP CHRFAX     NONBORROWINGSPOUSE DTCOMPLAINTDATE DTLITIGATIONDATE DTCEASEANDDESIST CONVENIENCECHECKINDICATOR PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE
-- ------------------------ --------------------------- ---------------------------- --------------------------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- ------------------ ----------- ------------ -------------- ------------ ------------ -------------- -------------------- --------- --------------------- ------ --------- ---------------- ------- ------------ --------------------- -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ---------- ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
--                1195851.0                           5                            6                           7        279445                1195851.0 514340671   NULL JOE                        SPILLMAN    213 Tampico Street Irving      TX           750628109      2146946369   2145301890   9999999999     fjspillman@gmail.com  0.000000 1937-04-10 12:00:00.0     74 M         M                0       1            2024-03-08 12:00:00.0                    0 NULL                                               5                            6                           7                0            N                  NULL            NULL             NULL                                     0   120752        120752      120752     2120752       4120752  120752           0 NULL                
--                1198772.0                           9                           10                          11        282366                1198772.0 156460196   NULL FRANCISCO                  DIAZ        109 W. 43RD STREET HIALEAH     FL           33012          3058214333                                                     0.000000 1931-07-13 12:00:00.0     81 M         M                0       1            2018-04-12 12:00:00.0                    0 NULL                                               9                           10                          11                0 NULL       N                  NULL            NULL             NULL                                     0   123706        123706      123706     2123706       4123706  123706        NULL NULL                NULL

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- single check Occu letter sent date
--1198772	Date 1st Occupancy Letter Sent	9/3/2024	9/4/2025
--1195851	Date 1st Occupancy Letter Sent	9/5/2024	9/4/2025

SELECT 
	OCCLOANNUMBER,  
	date('9/4/2025') "Good1st", OCC1STOCCLETTERSENTDATE, 
--	date('7/1/2025') "Good2nd", OCC2NDOCCLETTERSENTDATE,
	*
FROM CELINK.TBLOCCUPANCY
where OCCLOANNUMBER in  (1198772)
for read only with ur;

-- OCCLOANNUMBER Good1st    OCC1STOCCLETTERSENTDATE OCCLOANNUMBER OCC1STOCCLETTERSENTDATE OCC2NDOCCLETTERSENTDATE OCC1STFOLLOWUPPHONECALLDATE OCCSKIPTRACECOMPLETEDATE OCC2NDFOLLOWUPPHONECALLDATE OCCPROPINSPORDEREDDATE OCCINSPFOLLOWUPDATE OCCRESOLVEDDATE OCCREASONFORRESOLVE OCCLASTKNOWNOCCDATE OCC12MONTHFOLLOWUPDATE OCCTEXASOCCLOAN OCCNOTES OCCVERBALOCCCOMPLETEDDATE
-- ------------- ---------- ----------------------- ------------- ----------------------- ----------------------- --------------------------- ------------------------ --------------------------- ---------------------- ------------------- --------------- ------------------- ------------------- ---------------------- --------------- -------- -------------------------
--     1198772.0 2025-09-04 2024-09-03                  1198772.0 2024-09-03              NULL                    NULL                        NULL                     NULL                        NULL                   NULL                NULL                              0 2012-09-24          NULL                                 0          NULL
-- OCCLOANNUMBER Good1st    OCC1STOCCLETTERSENTDATE OCCLOANNUMBER OCC1STOCCLETTERSENTDATE OCC2NDOCCLETTERSENTDATE OCC1STFOLLOWUPPHONECALLDATE OCCSKIPTRACECOMPLETEDATE OCC2NDFOLLOWUPPHONECALLDATE OCCPROPINSPORDEREDDATE OCCINSPFOLLOWUPDATE OCCRESOLVEDDATE OCCREASONFORRESOLVE OCCLASTKNOWNOCCDATE OCC12MONTHFOLLOWUPDATE OCCTEXASOCCLOAN OCCNOTES OCCVERBALOCCCOMPLETEDDATE
-- ------------- ---------- ----------------------- ------------- ----------------------- ----------------------- --------------------------- ------------------------ --------------------------- ---------------------- ------------------- --------------- ------------------- ------------------- ---------------------- --------------- -------- -------------------------
--     1198772.0 2025-09-04 2025-09-04                  1198772.0 2025-09-04              NULL                    NULL                        NULL                     NULL                        NULL                   NULL                NULL                              0 2012-09-24          NULL                                 0          NULL

--
--		UPDATE celink.TBLOCCUPANCY set OCC1STOCCLETTERSENTDATE = date('9/4/2025') where  OCCLOANNUMBER = 1198772;
--


SELECT 
	OCCLOANNUMBER,  
	date('9/4/2025') "Good1st", OCC1STOCCLETTERSENTDATE, 
--	date('7/1/2025') "Good2nd", OCC2NDOCCLETTERSENTDATE,
	*
FROM CELINK.TBLOCCUPANCY
where OCCLOANNUMBER in  (1195851)
for read only with ur;

-- OCCLOANNUMBER Good1st    OCC1STOCCLETTERSENTDATE OCCLOANNUMBER OCC1STOCCLETTERSENTDATE OCC2NDOCCLETTERSENTDATE OCC1STFOLLOWUPPHONECALLDATE OCCSKIPTRACECOMPLETEDATE OCC2NDFOLLOWUPPHONECALLDATE OCCPROPINSPORDEREDDATE OCCINSPFOLLOWUPDATE OCCRESOLVEDDATE OCCREASONFORRESOLVE OCCLASTKNOWNOCCDATE OCC12MONTHFOLLOWUPDATE OCCTEXASOCCLOAN OCCNOTES                                          OCCVERBALOCCCOMPLETEDDATE
-- ------------- ---------- ----------------------- ------------- ----------------------- ----------------------- --------------------------- ------------------------ --------------------------- ---------------------- ------------------- --------------- ------------------- ------------------- ---------------------- --------------- ------------------------------------------------- -------------------------
--     1195851.0 2025-09-04 2024-09-05                  1195851.0 2024-09-05              NULL                    NULL                        NULL                     NULL                        2023-07-03             2023-07-13          NULL                              0 2023-07-18          2024-07-18                          -1 Occupancy has been verified for current occ cycle NULL
-- OCCLOANNUMBER Good1st    OCC1STOCCLETTERSENTDATE OCCLOANNUMBER OCC1STOCCLETTERSENTDATE OCC2NDOCCLETTERSENTDATE OCC1STFOLLOWUPPHONECALLDATE OCCSKIPTRACECOMPLETEDATE OCC2NDFOLLOWUPPHONECALLDATE OCCPROPINSPORDEREDDATE OCCINSPFOLLOWUPDATE OCCRESOLVEDDATE OCCREASONFORRESOLVE OCCLASTKNOWNOCCDATE OCC12MONTHFOLLOWUPDATE OCCTEXASOCCLOAN OCCNOTES                                          OCCVERBALOCCCOMPLETEDDATE
-- ------------- ---------- ----------------------- ------------- ----------------------- ----------------------- --------------------------- ------------------------ --------------------------- ---------------------- ------------------- --------------- ------------------- ------------------- ---------------------- --------------- ------------------------------------------------- -------------------------
--     1195851.0 2025-09-04 2025-09-04                  1195851.0 2025-09-04              NULL                    NULL                        NULL                     NULL                        2023-07-03             2023-07-13          NULL                              0 2023-07-18          2024-07-18                          -1 Occupancy has been verified for current occ cycle NULL

--
--		UPDATE celink.TBLOCCUPANCY set OCC1STOCCLETTERSENTDATE = date('9/4/2025') where  OCCLOANNUMBER = 1195851;
--

----------------------------------------
-- cycle
-- INTSUBSERVICERLOANNUMBER INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER IDSBORROWERID INTSUBSERVICERLOANNUMBER CHRSSN    INTPIN CHRFIRSTNAME CHRMIDDLENAME CHRLASTNAME CHRMAILADDRESS     CHRMAILCITY CHRMAILSTATE CHRMAILZIPCODE CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS      CURINCOME DTMBIRTHDATE          INTAGE CHRGENDER CHRMARITALSTATUS CHRRACE CHRETHNICITY DTMDEATHDATE          BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER BTNSTATEMENTSTOP CHRFAX     NONBORROWINGSPOUSE DTCOMPLAINTDATE DTLITIGATIONDATE DTCEASEANDDESIST CONVENIENCECHECKINDICATOR PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE
-- ------------------------ --------------------------- ---------------------------- --------------------------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- ------------------ ----------- ------------ -------------- ------------ ------------ -------------- -------------------- --------- --------------------- ------ --------- ---------------- ------- ------------ --------------------- -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ---------- ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
--                1195851.0                           5                            6                           7        279445                1195851.0 514340671   NULL JOE                        SPILLMAN    213 Tampico Street Irving      TX           750628109      2146946369   2145301890   9999999999     fjspillman@gmail.com  0.000000 1937-04-10 12:00:00.0     74 M         M                0       1            2024-03-08 12:00:00.0                    0 NULL                                               5                            6                           7                0            N                  NULL            NULL             NULL                                     0   120752        120752      120752     2120752       4120752  120752           0 NULL                

--
--		update CELINK.TBLBORROWER set INTOCCUPCERTDATEFIRSTLETTER = 9, INTOCCUPCERTDATESECONDLETTER = 10, INTOCCUPCERTDATETHIRDLETTER = 11 where INTSUBSERVICERLOANNUMBER = 1195851;
--


SELECT 
	OCCLOANNUMBER,  
--	date('5/5/2025') "Good1st", OCC1STOCCLETTERSENTDATE,
	date('7/1/2025') "Good2nd", OCC2NDOCCLETTERSENTDATE,
	*
FROM CELINK.TBLOCCUPANCY
where OCCLOANNUMBER in (3111106)
for read only with ur;

-- OCCLOANNUMBER Good2nd    OCC2NDOCCLETTERSENTDATE OCCLOANNUMBER OCC1STOCCLETTERSENTDATE OCC2NDOCCLETTERSENTDATE OCC1STFOLLOWUPPHONECALLDATE OCCSKIPTRACECOMPLETEDATE OCC2NDFOLLOWUPPHONECALLDATE OCCPROPINSPORDEREDDATE OCCINSPFOLLOWUPDATE OCCRESOLVEDDATE OCCREASONFORRESOLVE OCCLASTKNOWNOCCDATE OCC12MONTHFOLLOWUPDATE OCCTEXASOCCLOAN OCCNOTES                                                                                                                                                                                                                                       OCCVERBALOCCCOMPLETEDDATE
-- ------------- ---------- ----------------------- ------------- ----------------------- ----------------------- --------------------------- ------------------------ --------------------------- ---------------------- ------------------- --------------- ------------------- ------------------- ---------------------- --------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------
--     3111106.0 2025-07-01 2025-07-01                  3111106.0 2024-07-02              2025-07-01              NULL                        NULL                     NULL                        2022-09-02             NULL                2019-08-05                        0 NULL                NULL                                 0 INCOMING LETTER PROCESSINGOCL Status : Occ Doc ValidHas OCL received on loan: YesIs the Property address matching: YesIs the Borrower signature is matching: YesIs the Borrower date of sign is valid: YesNotes Updated - IF OCL is invalid: N NULL




----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------


-- ------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter
--1198772	Date 1st Occupancy Letter Sent	9/3/2024	9/4/2025
--1195851	Date 1st Occupancy Letter Sent	9/5/2024	9/4/2025

--cycle
-- INTSUBSERVICERLOANNUMBER INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER IDSBORROWERID INTSUBSERVICERLOANNUMBER CHRSSN    INTPIN CHRFIRSTNAME CHRMIDDLENAME CHRLASTNAME CHRMAILADDRESS     CHRMAILCITY CHRMAILSTATE CHRMAILZIPCODE CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS      CURINCOME DTMBIRTHDATE          INTAGE CHRGENDER CHRMARITALSTATUS CHRRACE CHRETHNICITY DTMDEATHDATE          BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER BTNSTATEMENTSTOP CHRFAX     NONBORROWINGSPOUSE DTCOMPLAINTDATE DTLITIGATIONDATE DTCEASEANDDESIST CONVENIENCECHECKINDICATOR PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE
-- ------------------------ --------------------------- ---------------------------- --------------------------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- ------------------ ----------- ------------ -------------- ------------ ------------ -------------- -------------------- --------- --------------------- ------ --------- ---------------- ------- ------------ --------------------- -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ---------- ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
--                1195851.0                           5                            6                           7        279445                1195851.0 514340671   NULL JOE                        SPILLMAN    213 Tampico Street Irving      TX           750628109      2146946369   2145301890   9999999999     fjspillman@gmail.com  0.000000 1937-04-10 12:00:00.0     74 M         M                0       1            2024-03-08 12:00:00.0                    0 NULL                                               5                            6                           7                0            N                  NULL            NULL             NULL                                     0   120752        120752      120752     2120752       4120752  120752           0 NULL                
--                1198772.0                           9                           10                          11        282366                1198772.0 156460196   NULL FRANCISCO                  DIAZ        109 W. 43RD STREET HIALEAH     FL           33012          3058214333                                                     0.000000 1931-07-13 12:00:00.0     81 M         M                0       1            2018-04-12 12:00:00.0                    0 NULL                                               9                           10                          11                0 NULL       N                  NULL            NULL             NULL                                     0   123706        123706      123706     2123706       4123706  123706        NULL NULL                NULL

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY)

with Param (Loan, Note, TimeS, who, prio) as
(Values

(1198772, 'Per HDT 198634 1st Occupancy Letter sent date updated from 9/3/2024 to 9/4/2025.', CURRENT_TIMESTAMP,'tkato',0),
(1195851, 'Per HDT 198634 1st Occupancy Letter sent date updated from 9/5/2024 to 9/4/2025.  Occupancy cycle changed from 5 6 7 to 9 10 11.', CURRENT_TIMESTAMP,'tkato',0)

) 
select * from Param P
;

-- LOAN    NOTE                                                                                                                             TIMES                      WHO   PRIO
-- ------- -------------------------------------------------------------------------------------------------------------------------------- -------------------------- ----- ----
-- 1198772 Per HDT 198634 1st Occupancy Letter sent date updated from 9/3/2024 to 9/4/2025.  No change in occupancy cycle.                  2025-09-04 11:00:29.221101 tkato    0
-- 1195851 Per HDT 198634 1st Occupancy Letter sent date updated from 9/5/2024 to 9/4/2025.  Occupancy cycle changed from 5 6 7 to 9 10 11. 2025-09-04 11:00:29.221101 tkato    0


------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
------** -- single Notes sample ... use bulk upload
with Param ("SeqNum", "Loan Number", "Priority (Y/N)", "Note Step Number", "Step Date Completed (YYYY-MM-DD)", "Loan Note") as
(Values
(1, 3056210, 'N', '', '', 'Per HDT 118568 2nd Occupancy Letter sent date updated from <blank> to 1/10/2023.')
) 
select * from Param P order by P."SeqNum"
;
-- 
-- SeqNum Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------------------------------------------------------------------------------------------------
--      1     1196234 N                                                                Per HDT 126895 1st Occupancy Letter sent date updated from 6/1/2022 to 5/2/2023.
--      2     3109585 N                                                                Per HDT 126895 1st Occupancy Letter sent date updated from 3/2/2022 to 5/2/2023, 2nd Occupancy Letter sent date from 6/1/2022 to <blank>.

------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

--end
