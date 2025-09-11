--*-- multiple ticket
/*
20241030
Approved	176001	176001	Ted Kato	Borrower SSN	David Giesen	Low	10/30/2024 9:20
3326387 Please update borrower SSN from 432-70-5139 to 430-90-3139 and see attached Data Change Request form.
Data Change Request - 3326387.xlsx
="(" & E2 & ", 176001, 'David Giesen', " & A2 & ", '" & SUBSTITUTE(C2, "-", "") & "', '" & SUBSTITUTE(D2, "-", "") &"'),"
(1, 176001, 'David Giesen', 3326387, '432705139', '430903139'),
*/ 

/* 
Borrower SSN updated for 1 loan.  Pending verification.
dash  ... ="(" & E2 & ", 101927, 'Jennifer Dees', " & A2 & ", '" & SUBSTITUTE(C2, "-", "") & "', '" & SUBSTITUTE(D2, "-", "") &"'),"
space ... ="(" & E2 & ", 101927, 'Jennifer Dees', " & A2 & ", '" & SUBSTITUTE(C2, " ", "") & "', '" & SUBSTITUTE(D2, " ", "") &"'),"
HDTatE .. ="(" & F2 & ", " & E2 & ", 'Jordann Greene', " & A2 & ", '" & SUBSTITUTE(C2, "-", "") & "', '" & SUBSTITUTE(D2, "-", "") &"'),"
*/

-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
HDTs

/*
20250530
[ID:0191042]  Borrower SSN  5/30/2025 12:20 PM  Jordann Greene
3365265 Please update the borrowers SSN to 251115014.
Celink#	Data field to be corrected	Incorrect Value	Correct Value
3365265	SSN	554176694	251115014
dash  ... ="(" & E2 & ", 0191042, 'Jordann Greene', " & A2 & ", '" & SUBSTITUTE(C2, "-", "") & "', '" & SUBSTITUTE(D2, "-", "") &"'),"
1 loan. Borr SSN updated.  Peer review pending.
*/

-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------

-------------------------------------------------------------------------------------------------------
-- backup
-------------------------------------------------------------------------------------------------------
select 	
P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.Baad, P.Good,
T.CHRSSN,
T.*
from 
(values

--(1, 0180645, 'David Giesen', 3287970, '313369272', '018289535')
--(1, 0181133, 'David Giesen', 3354228, 'xxx-xx-8402', '065467769')
--(1, 0189167, 'Norlan Treminio', 3362249, 'xxx-xx-xxxx', '555555555')
--(1, 0189853, 'Aurelia Shorter', 3169861, 'xxxxx6531', '471526458')

(1, 0191042, 'Jordann Greene', 3365265, '554176694', '251115014')

) P (SeqNum, HDTNum, Requester, Loan, Baad, Good)
inner join celink.tblBorrower T
On P.Loan = T.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
for read only with ur;

-- SEQNUM HDTNUM REQUESTER      LOAN    BAAD      GOOD      CHRSSN    IDSBORROWERID INTSUBSERVICERLOANNUMBER CHRSSN    INTPIN CHRFIRSTNAME CHRMIDDLENAME CHRLASTNAME CHRMAILADDRESS CHRMAILCITY CHRMAILSTATE CHRMAILZIPCODE CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS       CURINCOME   DTMBIRTHDATE          INTAGE CHRGENDER CHRMARITALSTATUS CHRRACE CHRETHNICITY DTMDEATHDATE BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER BTNSTATEMENTSTOP CHRFAX NONBORROWINGSPOUSE DTCOMPLAINTDATE DTLITIGATIONDATE DTCEASEANDDESIST CONVENIENCECHECKINDICATOR PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE
-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
--      1 191042 Jordann Greene 3365265 554176694 251115014 554176694        842342                3365265.0 554176694   NULL Walter       W.            Spires JR   3 Umbria Ct    Aiken       SC           298038574      9124144539                9124144539     wallyspires@gmail.com 1821.000000 1957-09-23 12:00:00.0     68 M         M                1       2            NULL                           -1 2025-04-28 12:00:00.0                              4                            5                           6                0 NULL   N                  NULL            NULL             NULL                                     0   674656        674656      674656     2674656       4674656  674656        NULL NULL                NULL
--after
-- SEQNUM HDTNUM REQUESTER      LOAN    BAAD      GOOD      CHRSSN    IDSBORROWERID INTSUBSERVICERLOANNUMBER CHRSSN    INTPIN CHRFIRSTNAME CHRMIDDLENAME CHRLASTNAME CHRMAILADDRESS CHRMAILCITY CHRMAILSTATE CHRMAILZIPCODE CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS       CURINCOME   DTMBIRTHDATE          INTAGE CHRGENDER CHRMARITALSTATUS CHRRACE CHRETHNICITY DTMDEATHDATE BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER BTNSTATEMENTSTOP CHRFAX NONBORROWINGSPOUSE DTCOMPLAINTDATE DTLITIGATIONDATE DTCEASEANDDESIST CONVENIENCECHECKINDICATOR PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE
-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
--      1 191042 Jordann Greene 3365265 554176694 251115014 251115014        842342                3365265.0 251115014   NULL Walter       W.            Spires JR   3 Umbria Ct    Aiken       SC           298038574      9124144539                9124144539     wallyspires@gmail.com 1821.000000 1957-09-23 12:00:00.0     68 M         M                1       2            NULL                           -1 2025-04-28 12:00:00.0                              4                            5                           6                0 NULL   N                  NULL            NULL             NULL                                     0   674656        674656      674656     2674656       4674656  674656        NULL NULL                NULL

-------------------------------------------------------------------------------------------------------
-- notes
-------------------------------------------------------------------------------------------------------
select	
--	SeqNum, HDTNum, Requester, loan, Baad, Good, 
--	T.CHRSSN, T.INTSUBSERVICERLOANNUMBER
--	'--Note->', 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
    'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Borrower SSN updated from xxx-xx-' || right(T.CHRSSN, 4) || ' to xxx-xx-' || Right(P.Good,4) || '.'
--    'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Borrower SSN updated.'
from 
(values

(1, 0191042, 'Jordann Greene', 3365265, '554176694', '251115014')

) P (SeqNum, HDTNum, Requester, Loan, Baad, Good)
inner join celink.tblBorrower T 
	on P.Loan = T.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
for read only with ur
;
-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) 6
-- ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------
--      1     3365265 N                                                                Per HDT 191042 (Jordann Greene) Borrower SSN updated from xxx-xx-6694 to xxx-xx-5014.

-----------------------------------------------------------------------------------------------
-- Merge
-----------------------------------------------------------------------------------------------
MERGE into celink.tblBorrower TT
USING
(
	select 	
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.Baad, P.Good, T.CHRSSN
	from 
	(values

(1, 0191042, 'Jordann Greene', 3365265, '554176694', '251115014')

	) P (SeqNum, HDTNum, Requester, Loan, Baad, Good)
	inner join celink.tblBorrower T
	On P.Loan = T.INTSUBSERVICERLOANNUMBER
	order by P.SeqNum
) UY
On  UY.Loan = TT.INTSUBSERVICERLOANNUMBER

WHEN MATCHED THEN UPDATE 
SET 
TT.CHRSSN = UY.Good
;
-- the select 
-- SEQNUM HDTNUM REQUESTER       LOAN    BAAD      GOOD      CHRSSN
-- ------ ------ --------------- ------- --------- --------- ---------

-- ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------
-- note
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

select	
	--	SeqNum,	
	Loan as "Loan Number",
--   'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Borrower SSN updated from xxx-xx-' || right(Baad, 4) || ' to xxx-xx-' || Right(P.Good,4) || '.',
   'Per HDT ' || P.HDTNum || ' Borrower SSN updated from xxx-xx-' || right(Baad, 4) || ' to xxx-xx-' || Right(P.Good,4) || '.',
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0, 
	0
from 
(values
(1, 0191042, 'Jordann Greene', 3365265, '554176694', '251115014')

) P (SeqNum, HDTNum, Requester, Loan, Baad, Good)
inner join celink.tblBorrower T 
	on P.Loan = T.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
;

-- Loan Number 2                                                                    3                          4     5 6
-- ----------- -------------------------------------------------------------------- -------------------------- ----- - -
--     3365265 Per HDT 191042 Borrower SSN updated from xxx-xx-6694 to xxx-xx-5014. 2025-05-30 12:40:21.531596 tkato 0 0

-- ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------
-- ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------
----** --Notes ... parameter
--Insert into celink.tblLoanNotes 
--	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)
--
--with p (Loan, Note, TimeS, who, prio, StepID) as
--(values
--(3169861, 'Per HDT 189853 (Aurelia Shorter) Borrower SSN updated from xxx-xx-6531 to xxx-xx-6458. Co-Borrower(ID276157) SSN updated from xxx-xx-6458 to xxx-xx-6531.',CURRENT_TIMESTAMP, 'tkato', 0, 0)
--) 
--select * from P
--;

-- LOAN    NOTE                                                                                                                                                      TIMES                      WHO   PRIO STEPID
-- ------- --------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------- ----- ---- ------
-- 3169861 Per HDT 189853 (Aurelia Shorter) Borrower SSN updated from xxx-xx-6531 to xxx-xx-6458. Co-Borrower(ID276157) SSN updated from xxx-xx-6458 to xxx-xx-6531. 2025-05-14 11:42:36.815315 tkato    0      0


-----------------------------------------------------------------------------------------------------------
-- Notes ... check single
select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from celink.tblloannotes a  
	where a.INTSUBSERVICERLOANNUMBER in (3339511) 
	order by a.IDSLOANNOTES desc 
for read only with UR;

-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                                                                                           CHRUSERID         BLNPRIORITY
-- -------------------------- ------------ ------------------------ -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ----------------- -----------
-- 2024-10-30 14:01:03.93092     190522423                3339511.0 Per HDT 166330 Borrower SSN updated from xxx-xx-3382 to xxx-xx-6099.                                                                                                                                                                   tkato                       0
-- 2024-07-07 23:45:26.0         190273762                3339511.0 H3V2912073957038 - Attempt Type: Website; Attempt Result: Policy not available on website; HAZARD- 12833 W 7TH DRIVE - Renewal request submitted on Liberty website updated.                                                           PLP_IIMNotes                0
-- 2024-07-05 12:33:06.0         190273761                3339511.0 H3V2912073957038 - Attempt Type: Website; Attempt Result: Policy not available on website; Hazard: H3V2912073957038: Submitted a web req to Liberty Mutual for the rnw dec page 2024-2025.                                             PLP_IIMNotes                0


-----------------------------------------------------------------------------------------------
-- end
-----------------------------------------------------------------------------------------------

