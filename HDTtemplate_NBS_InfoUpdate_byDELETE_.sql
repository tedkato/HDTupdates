------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
-- HDTs

/*
20250716
194784	Ted Kato	NBS Data removal	Jessica Ball	Low	7/16/2025 16:20
3368649 Please remove the NBS data
(1,  194784, 'Jessica Ball', 3368649)
1 loan updated.  Peer review pending.
*/

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

select 
	BOPROTECTEDNBS, * 
	from CELINK.TBLNONBORROWINGSPOUSES 
	where NBSLOANNUMBER in (1080700)
	--WHERE BOPROTECTEDNBS <> 'N' and BOPROTECTEDNBS <> 'Y'
order by NBSLOANNUMBER desc
with ur;

-- BOPROTECTEDNBS NBSLOANNUMBER BOFIRSTNAME BOLASTNAME BOSSN BOBIRTHDATE           BOPRIMARYPHONE BOPROTECTEDNBS BODIVORCEDATE COFIRSTNAME COLASTNAME COSSN COBIRTHDATE COPRIMARYPHONE COPROTECTEDNBS CODIVORCEDATE BOGENDER COGENDER BODATEOFDEATH CODATEOFDEATH BODATEMOVEOUT CODATEMOVEOUT BODIVORCEDECREEDATE CODIVORCEDECREEDATE BOLEGALRIGHTREMAININPROPRCVD COLEGALRIGHTREMAININPROPRCVD BOLEGALRIGHTTIMEEXTREQ COLEGALRIGHTTIMEEXTREQ BODEFFERALPERIODAPPROVEDDATE CODEFFERALPERIODAPPROVEDDATE BODEFFERALPERIODDENIEDDATE CODEFFERALPERIODDENIEDDATE BOREINSTATEMENTDATE1 COREINSTATEMENTDATE1 BOREINSTATEMENTDATE2 COREINSTATEMENTDATE2 BOINELIGIBLENBSCERTRECEIVEDDATE COINELIGIBLENBSCERTRECEIVEDDATE BONBSELIGIBILITYREVOKEDDATE CONBSELIGIBILITYREVOKEDDATE BOMKTBLTITLERCVDDEADLINE COMKTBLTITLERCVDDEADLINE BOTOLLINGAGRMNTRCVDDATE COTOLLINGAGRMNTRCVDDATE BODEATHNOTIFICATION CODEATHNOTIFICATION BOWRITTENREQRCVDFROMNBS COWRITTENREQRCVDFROMNBS BODRIVERLICENSE CODRIVERLICENSE BOCURRENTUTILITYBILL COCURRENTUTILITYBILL BOCURRENTBANKSTMT COCURRENTBANKSTMT BOOTHERPROOFOCCUPANCY COOTHERPROOFOCCUPANCY BOOTHERPROOFOCCUPANCYDT COOTHERPROOFOCCUPANCYDT BOMARRIAGECERT COMARRIAGECERT BOCOUNSELINGCERT COCOUNSELINGCERT BOLEGALOPINION COLEGALOPINION BOOTHERPROOFMARRIAGE COOTHERPROOFMARRIAGE BOOTHERPROOFMARRIAGEDT COOTHERPROOFMARRIAGEDT BODEATHCERTRCVD CODEATHCERTRCVD BOPROOFMKTBLETITLERCVD COPROOFMKTBLETITLERCVD BOTOLLINGAGRMNTRCVD COTOLLINGAGRMNTRCVD BOMOEELECTIONDEADLINE COMOEELECTIONDEADLINE BOMOEELECTIONMADTOHUD COMOEELECTIONMADTOHUD BOMOEASSESSMENTDEADLINE COMOEASSESSMENTDEADLINE BOMOEASSESSMENTAPPVLDT COMOEASSESSMENTAPPVLDT BOMOEASSESSMENTDENIALDT COMOEASSESSMENTDENIALDT BOASSIGNMNTTOHUDDEADLINE COASSIGNMNTTOHUDDEADLINE BOMOEAPPRVLLETTERSENTDT COMOEAPPRVLLETTERSENTDT BOMOEDENIALLETTERSENTDT COMOEDENIALLETTERSENTDT BOANNUALNBSCERTMAILEDDATE COANNUALNBSCERTMAILEDDATE BOANNUALNBSCERTRECEIVEDDATE COANNUALNBSCERTRECEIVEDDATE BOPOSTDEATHNBSCERTMAILEDDATE COPOSTDEATHNBSCERTMAILEDDATE BOPOSTDEATHNBSCERTRECEIVEDDATE COPOSTDEATHNBSCERTRECEIVEDDATE BOINELIGIBLENBSCERTMAILEDDATE COINELIGIBLENBSCERTMAILEDDATE PERSONIDBO PERSONIDCOBO HOMEPHONEIDBO HOMEPHONEIDCOBO BOLANGCODE COLANGCODE
-- -------------- ------------- ----------- ---------- ----- --------------------- -------------- -------------- ------------- ----------- ---------- ----- ----------- -------------- -------------- ------------- -------- -------- ------------- ------------- ------------- ------------- ------------------- ------------------- ---------------------------- ---------------------------- ---------------------- ---------------------- ---------------------------- ---------------------------- -------------------------- -------------------------- -------------------- -------------------- -------------------- -------------------- ------------------------------- ------------------------------- --------------------------- --------------------------- ------------------------ ------------------------ ----------------------- ----------------------- ------------------- ------------------- ----------------------- ----------------------- --------------- --------------- -------------------- -------------------- ----------------- ----------------- --------------------- --------------------- ----------------------- ----------------------- -------------- -------------- ---------------- ---------------- -------------- -------------- -------------------- -------------------- ---------------------- ---------------------- --------------- --------------- ---------------------- ---------------------- ------------------- ------------------- --------------------- --------------------- --------------------- --------------------- ----------------------- ----------------------- ---------------------- ---------------------- ----------------------- ----------------------- ------------------------ ------------------------ ----------------------- ----------------------- ----------------------- ----------------------- ------------------------- ------------------------- --------------------------- --------------------------- ---------------------------- ---------------------------- ------------------------------ ------------------------------ ----------------------------- ----------------------------- ---------- ------------ ------------- --------------- ---------- ----------

select 
	TT.NBSLOANNUMBER,
	P.SeqNum, P.Loan, --P.Baad,
	TT.* 
from 
(VALUES

(1,  194784, 'Jessica Ball', 3368649)

) P (SeqNum, HDT, Requester, Loan) --, Baad, Good)	
inner join 	CELINK.TBLNONBORROWINGSPOUSES TT
ON P.Loan = TT.NBSLOANNUMBER 
order by P.SeqNum
with ur;

-- NBSLOANNUMBER SEQNUM LOAN    NBSLOANNUMBER BOFIRSTNAME BOLASTNAME BOSSN     BOBIRTHDATE           BOPRIMARYPHONE BOPROTECTEDNBS BODIVORCEDATE COFIRSTNAME COLASTNAME COSSN COBIRTHDATE COPRIMARYPHONE COPROTECTEDNBS CODIVORCEDATE BOGENDER COGENDER BODATEOFDEATH CODATEOFDEATH BODATEMOVEOUT CODATEMOVEOUT BODIVORCEDECREEDATE CODIVORCEDECREEDATE BOLEGALRIGHTREMAININPROPRCVD COLEGALRIGHTREMAININPROPRCVD BOLEGALRIGHTTIMEEXTREQ COLEGALRIGHTTIMEEXTREQ BODEFFERALPERIODAPPROVEDDATE CODEFFERALPERIODAPPROVEDDATE BODEFFERALPERIODDENIEDDATE CODEFFERALPERIODDENIEDDATE BOREINSTATEMENTDATE1 COREINSTATEMENTDATE1 BOREINSTATEMENTDATE2 COREINSTATEMENTDATE2 BOINELIGIBLENBSCERTRECEIVEDDATE COINELIGIBLENBSCERTRECEIVEDDATE BONBSELIGIBILITYREVOKEDDATE CONBSELIGIBILITYREVOKEDDATE BOMKTBLTITLERCVDDEADLINE COMKTBLTITLERCVDDEADLINE BOTOLLINGAGRMNTRCVDDATE COTOLLINGAGRMNTRCVDDATE BODEATHNOTIFICATION CODEATHNOTIFICATION BOWRITTENREQRCVDFROMNBS COWRITTENREQRCVDFROMNBS BODRIVERLICENSE CODRIVERLICENSE BOCURRENTUTILITYBILL COCURRENTUTILITYBILL BOCURRENTBANKSTMT COCURRENTBANKSTMT BOOTHERPROOFOCCUPANCY COOTHERPROOFOCCUPANCY BOOTHERPROOFOCCUPANCYDT COOTHERPROOFOCCUPANCYDT BOMARRIAGECERT COMARRIAGECERT BOCOUNSELINGCERT COCOUNSELINGCERT BOLEGALOPINION COLEGALOPINION BOOTHERPROOFMARRIAGE COOTHERPROOFMARRIAGE BOOTHERPROOFMARRIAGEDT COOTHERPROOFMARRIAGEDT BODEATHCERTRCVD CODEATHCERTRCVD BOPROOFMKTBLETITLERCVD COPROOFMKTBLETITLERCVD BOTOLLINGAGRMNTRCVD COTOLLINGAGRMNTRCVD BOMOEELECTIONDEADLINE COMOEELECTIONDEADLINE BOMOEELECTIONMADTOHUD COMOEELECTIONMADTOHUD BOMOEASSESSMENTDEADLINE COMOEASSESSMENTDEADLINE BOMOEASSESSMENTAPPVLDT COMOEASSESSMENTAPPVLDT BOMOEASSESSMENTDENIALDT COMOEASSESSMENTDENIALDT BOASSIGNMNTTOHUDDEADLINE COASSIGNMNTTOHUDDEADLINE BOMOEAPPRVLLETTERSENTDT COMOEAPPRVLLETTERSENTDT BOMOEDENIALLETTERSENTDT COMOEDENIALLETTERSENTDT BOANNUALNBSCERTMAILEDDATE COANNUALNBSCERTMAILEDDATE BOANNUALNBSCERTRECEIVEDDATE COANNUALNBSCERTRECEIVEDDATE BOPOSTDEATHNBSCERTMAILEDDATE COPOSTDEATHNBSCERTMAILEDDATE BOPOSTDEATHNBSCERTRECEIVEDDATE COPOSTDEATHNBSCERTRECEIVEDDATE BOINELIGIBLENBSCERTMAILEDDATE COINELIGIBLENBSCERTMAILEDDATE PERSONIDBO PERSONIDCOBO HOMEPHONEIDBO HOMEPHONEIDCOBO BOLANGCODE COLANGCODE
-- ------------- ------ ------- ------------- ----------- ---------- --------- --------------------- -------------- -------------- ------------- ----------- ---------- ----- ----------- -------------- -------------- ------------- -------- -------- ------------- ------------- ------------- ------------- ------------------- ------------------- ---------------------------- ---------------------------- ---------------------- ---------------------- ---------------------------- ---------------------------- -------------------------- -------------------------- -------------------- -------------------- -------------------- -------------------- ------------------------------- ------------------------------- --------------------------- --------------------------- ------------------------ ------------------------ ----------------------- ----------------------- ------------------- ------------------- ----------------------- ----------------------- --------------- --------------- -------------------- -------------------- ----------------- ----------------- --------------------- --------------------- ----------------------- ----------------------- -------------- -------------- ---------------- ---------------- -------------- -------------- -------------------- -------------------- ---------------------- ---------------------- --------------- --------------- ---------------------- ---------------------- ------------------- ------------------- --------------------- --------------------- --------------------- --------------------- ----------------------- ----------------------- ---------------------- ---------------------- ----------------------- ----------------------- ------------------------ ------------------------ ----------------------- ----------------------- ----------------------- ----------------------- ------------------------- ------------------------- --------------------------- --------------------------- ---------------------------- ---------------------------- ------------------------------ ------------------------------ ----------------------------- ----------------------------- ---------- ------------ ------------- --------------- ---------- ----------
--     3368649.0      1 3368649     3368649.0 Michelle    Tom        680928431 1981-12-27 00:00:00.0 7024810571     N              NULL          NULL        NULL       NULL  NULL        NULL           NULL           NULL          F        NULL     NULL          NULL          NULL          NULL          NULL                NULL                NULL                         NULL                         NULL                   NULL                   NULL                         NULL                         NULL                       NULL                       NULL                 NULL                 NULL                 NULL                 NULL                            NULL                            NULL                        NULL                        NULL                     NULL                     NULL                    NULL                    NULL                NULL                NULL                    NULL                    NULL            NULL            NULL                 NULL                 NULL              NULL              NULL                  NULL                  NULL                    NULL                    NULL           NULL           NULL             NULL             NULL           NULL           NULL                 NULL                 NULL                   NULL                   NULL            NULL            NULL                   NULL                   NULL                NULL                NULL                  NULL                  NULL                  NULL                  NULL                    NULL                    NULL                   NULL                   NULL                    NULL                    NULL                     NULL                     NULL                    NULL                    NULL                    NULL                    NULL                      NULL                      NULL                        NULL                        NULL                         NULL                         NULL                           NULL                           NULL                          NULL                             3025334      4025334       9025334        10025334 NULL       NULL
--after
-- NBSLOANNUMBER SEQNUM LOAN NBSLOANNUMBER BOFIRSTNAME BOLASTNAME BOSSN BOBIRTHDATE BOPRIMARYPHONE BOPROTECTEDNBS BODIVORCEDATE COFIRSTNAME COLASTNAME COSSN COBIRTHDATE COPRIMARYPHONE COPROTECTEDNBS CODIVORCEDATE BOGENDER COGENDER BODATEOFDEATH CODATEOFDEATH BODATEMOVEOUT CODATEMOVEOUT BODIVORCEDECREEDATE CODIVORCEDECREEDATE BOLEGALRIGHTREMAININPROPRCVD COLEGALRIGHTREMAININPROPRCVD BOLEGALRIGHTTIMEEXTREQ COLEGALRIGHTTIMEEXTREQ BODEFFERALPERIODAPPROVEDDATE CODEFFERALPERIODAPPROVEDDATE BODEFFERALPERIODDENIEDDATE CODEFFERALPERIODDENIEDDATE BOREINSTATEMENTDATE1 COREINSTATEMENTDATE1 BOREINSTATEMENTDATE2 COREINSTATEMENTDATE2 BOINELIGIBLENBSCERTRECEIVEDDATE COINELIGIBLENBSCERTRECEIVEDDATE BONBSELIGIBILITYREVOKEDDATE CONBSELIGIBILITYREVOKEDDATE BOMKTBLTITLERCVDDEADLINE COMKTBLTITLERCVDDEADLINE BOTOLLINGAGRMNTRCVDDATE COTOLLINGAGRMNTRCVDDATE BODEATHNOTIFICATION CODEATHNOTIFICATION BOWRITTENREQRCVDFROMNBS COWRITTENREQRCVDFROMNBS BODRIVERLICENSE CODRIVERLICENSE BOCURRENTUTILITYBILL COCURRENTUTILITYBILL BOCURRENTBANKSTMT COCURRENTBANKSTMT BOOTHERPROOFOCCUPANCY COOTHERPROOFOCCUPANCY BOOTHERPROOFOCCUPANCYDT COOTHERPROOFOCCUPANCYDT BOMARRIAGECERT COMARRIAGECERT BOCOUNSELINGCERT COCOUNSELINGCERT BOLEGALOPINION COLEGALOPINION BOOTHERPROOFMARRIAGE COOTHERPROOFMARRIAGE BOOTHERPROOFMARRIAGEDT COOTHERPROOFMARRIAGEDT BODEATHCERTRCVD CODEATHCERTRCVD BOPROOFMKTBLETITLERCVD COPROOFMKTBLETITLERCVD BOTOLLINGAGRMNTRCVD COTOLLINGAGRMNTRCVD BOMOEELECTIONDEADLINE COMOEELECTIONDEADLINE BOMOEELECTIONMADTOHUD COMOEELECTIONMADTOHUD BOMOEASSESSMENTDEADLINE COMOEASSESSMENTDEADLINE BOMOEASSESSMENTAPPVLDT COMOEASSESSMENTAPPVLDT BOMOEASSESSMENTDENIALDT COMOEASSESSMENTDENIALDT BOASSIGNMNTTOHUDDEADLINE COASSIGNMNTTOHUDDEADLINE BOMOEAPPRVLLETTERSENTDT COMOEAPPRVLLETTERSENTDT BOMOEDENIALLETTERSENTDT COMOEDENIALLETTERSENTDT BOANNUALNBSCERTMAILEDDATE COANNUALNBSCERTMAILEDDATE BOANNUALNBSCERTRECEIVEDDATE COANNUALNBSCERTRECEIVEDDATE BOPOSTDEATHNBSCERTMAILEDDATE COPOSTDEATHNBSCERTMAILEDDATE BOPOSTDEATHNBSCERTRECEIVEDDATE COPOSTDEATHNBSCERTRECEIVEDDATE BOINELIGIBLENBSCERTMAILEDDATE COINELIGIBLENBSCERTMAILEDDATE PERSONIDBO PERSONIDCOBO HOMEPHONEIDBO HOMEPHONEIDCOBO BOLANGCODE COLANGCODE
-- ------------- ------ ---- ------------- ----------- ---------- ----- ----------- -------------- -------------- ------------- ----------- ---------- ----- ----------- -------------- -------------- ------------- -------- -------- ------------- ------------- ------------- ------------- ------------------- ------------------- ---------------------------- ---------------------------- ---------------------- ---------------------- ---------------------------- ---------------------------- -------------------------- -------------------------- -------------------- -------------------- -------------------- -------------------- ------------------------------- ------------------------------- --------------------------- --------------------------- ------------------------ ------------------------ ----------------------- ----------------------- ------------------- ------------------- ----------------------- ----------------------- --------------- --------------- -------------------- -------------------- ----------------- ----------------- --------------------- --------------------- ----------------------- ----------------------- -------------- -------------- ---------------- ---------------- -------------- -------------- -------------------- -------------------- ---------------------- ---------------------- --------------- --------------- ---------------------- ---------------------- ------------------- ------------------- --------------------- --------------------- --------------------- --------------------- ----------------------- ----------------------- ---------------------- ---------------------- ----------------------- ----------------------- ------------------------ ------------------------ ----------------------- ----------------------- ----------------------- ----------------------- ------------------------- ------------------------- --------------------------- --------------------------- ---------------------------- ---------------------------- ------------------------------ ------------------------------ ----------------------------- ----------------------------- ---------- ------------ ------------- --------------- ---------- ----------

-----------------------------------------------------
------** --Notes test 
select 
	P.SeqNum, P.Loan "Loan Number",  'N' "Priority (Y/N)", '' "Note Step Number", '' "Step Date Completed (YYYY-MM-DD)", 
	'Per HDT ' || P.HDT || ' (' || P.Requester  || ') NBS Info removed.' "Loan Note"
from 
(VALUES
(1,  194784, 'Jessica Ball', 3368649)
) P (SeqNum, HDT, Requester, Loan)	
order by SeqNum
;
-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------
--      1     3368649 N                                                                Per HDT 194784 (Jessica Ball) NBS Info removed.


				/* Deleeeeeeeeeeeeeeeete **********************************************************************************************
				
				-- -- delete CELINK.TBLNONBORROWINGSPOUSES where NBSLOANNUMBER=3368649;
				
				*/


-- ------- -------------------------------------------------- -------------------------- ----- - -
-- note
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
select 
	P.Loan,  
	'Per HDT ' || P.HDT || ' (' || P.Requester  || ') NBS Info removed.',
	CURRENT_TIMESTAMP, 'tkato', 0, 0
from 
(VALUES

(1,  194784, 'Jessica Ball', 3368649)

) P (SeqNum, HDT, Requester, Loan)	
order by SeqNum
;
-- LOAN    2                                               3                         4     5 6
-- ------- ----------------------------------------------- ------------------------- ----- - -
-- 3368649 Per HDT 194784 (Jessica Ball) NBS Info removed. 2025-07-17 10:11:07.71368 tkato 0 0


-- end

-- ------- ----------------------------------------------- ------------------------- ----- - --- ------- ----------------------------------------------- ------------------------- ----- - -
-- Refs:
/* *********************************
--BULKyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy

DELETE CELINK.TBLNONBORROWINGSPOUSES 
where NBSLOANNUMBER in  
(
	select 
		TT.NBSLOANNUMBER
	from 
	(VALUES

(1,  191902, 'Jessica Ball', 1178404),
(2,  191902, 'Jessica Ball', 1180215),
(3,  191902, 'Jessica Ball', 1178230),
(4,  191902, 'Jessica Ball', 1367036),
(5,  191902, 'Jessica Ball', 3236300),
(6,  191902, 'Jessica Ball', 3255992),
(7,  191902, 'Jessica Ball', 1219606)	
	) P (SeqNum, HDT, Requester, Loan) --, Baad, Good)	
	
	inner join 	CELINK.TBLNONBORROWINGSPOUSES TT
	ON P.Loan = TT.NBSLOANNUMBER 
	order by P.SeqNum
)
;

-- NBSLOANNUMBER
-- -------------
--     1178404.0
--     1180215.0
--     1178230.0
--     1367036.0
--     3236300.0
--     3255992.0
--     1219606.0

*************************************** */


---- ------- -------------------------------------------------- -------------------------- ----- - -
---- note
--Insert into celink.tblLoanNotes 
--	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
--
--select 
--	P.Loan,  
--	'Per HDT ' || P.HDT || ' (' || P.Requester  || ') NBS Info removed.',
--	CURRENT_TIMESTAMP, 'tkato', 0, 0
--from 
--(VALUES
--
--(1,  190046, 'Jessica Ball', 3152137),
--
--
--) P (SeqNum, HDT, Requester, Loan)	
--order by SeqNum
--;

-- LOAN    2                                                 3                       4     5 6
-- ------- ------------------------------------------------- ----------------------- ----- - -
-- 3275052 Per HDT 164170 (Melissa Romero) NBS Info removed. 2024-05-31 10:08:01.821 tkato 0 0

select 
	INTSUBSERVICERLOANNUMBER, IDSLOANNOTES, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP
from celink.tblLoanNotes 
where INTSUBSERVICERLOANNUMBER = 3275052
order by DTMNOTEDATE desc
for read only
with ur;

-- INTSUBSERVICERLOANNUMBER IDSLOANNOTES CHRLOANNOTES                                                                                                                                                                                                                                                          DTMNOTEDATE                CHRUSERID      BLNPRIORITY NOTESTEP
-- ------------------------ ------------ --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------- -------------- ----------- --------
--                3275052.0    182184947 Per HDT 164170 (Melissa Romero) NBS Info removed.                                                                                                                                                                                                                     2024-05-31 10:08:33.830522 tkato                    0        0

	