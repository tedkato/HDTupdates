
/*
20230911
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTUpdtNotes_ 0002714.csv

[ID:0002822]  SSN - Co-borrower  9/11/2023 10:44 AM  David Giesen  
Loan Number  1349064
Please see attached Data Change Request form to update the Social Security Number for the updated co-borrower.

Celink Loan Number	Data field to be corrected	 Incorrect Value 	 Correct Value 
1349064	Co-borrower Social Security Number	045-20-3832	043-18-1651

(1, 0002822, 'David Giesen', 1349064, '045203832', '043181651')

Co-borrower SSN updated for one loan.  Pending verification.
*/

/* 
dash  ... ="(" & E2 & ", 101927, 'Jennifer Dees', " & A2 & ", '" & SUBSTITUTE(C2, "-", "") & "', '" & SUBSTITUTE(D2, "-", "") &"'),"
space ... ="(" & E2 & ", 101927, 'Jennifer Dees', " & A2 & ", '" & SUBSTITUTE(C2, " ", "") & "', '" & SUBSTITUTE(D2, " ", "") &"'),"

HDTatE .. ="(" & F2 & ", " & E2 & ", 'Jennifer Dees', " & A2 & ", '" & SUBSTITUTE(C2, "-", "") & "', '" & SUBSTITUTE(D2, "-", "") &"'),"

--sampples
(1, 6577, 'David Giesen', 1382809, '460707462', '583143840'),
(1, 121912, 'David Giesen', 1339168, 'xxxxx7009', '526622610')
(1, 114989, 'David Giesen', 1322304, 'NULL', '548961731'),
(1, 108866, 'Jennifer Dees', 3282721, 'NULL', '527322654'),
(1, 108265, 'Jordann Greene', 3284088, '<Blank>', '466882004'),
(1, 105372, 'Jennifer Dees', 3275205, 'NULL', '552683269'),
(1, 103671, 'Jennifer Dees', 3271537, '111684520', '569684520'),
(1, 103360, 'Jordann Greene', 3268809, '111425054', '109425054'),
(1, 103344, 'Jordann Greene', 3268810, '111549344', '445549344'),
(1, 102954, 'Jordann Greene', 3266825, '528601993', '528601991'),
*/

-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
HDTs

/*
20250514
[ID:0189853] SSN 5/14/2025 10:49 AM  Aurelia Shorter
3169861
The SSN for both of the borrowers appears to have been switch with one another. 
Please see the attached SS with correct SSN for the borrowers. Thank you.

--
The SSN that ends in 6531 is the coborrower’s SSN and the one that ends in 6458 is meant to be the borrower’s SSN.

Celink Loan Number	Data field to be corrected	 Incorrect Value 	 Correct Value 
3169861	CoBorr SSN	xxx-xx-6458	563-42-6531
3169861	Borr SSN	xxx-xx-6531	471-52-6458

="(" & E2 & ", 0189853, 'Aurelia Shorter', " & A2 & ", '" & SUBSTITUTE(C2, "-", "") & "', '" & SUBSTITUTE(D2, "-", "") &"'),"

(1, 0189853, 'Aurelia Shorter', 3169861, 'xxxxx6458', '563426531'),

1 loan updated.  Peer review pending.
*/

-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
-- ------ ------ -------------- ------- --------- --------- --------- ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------- ----------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ------ ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------


---------------------------------------------------------------------------------------------------------------------------------------------
-- tblCoBorrower
---------------------------------------------------------------------------------------------------------------------------------------------
select 	
P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.Baad, P.Good,
T.CHRSSN,
T.*
from 
(values

--(1, 123934, 'David Giesen', 1174586, 'xxxxx6602', 'xxxxx6602')
--(1, 131149, 'David Giesen', 1235889, 'xxxxx5357', '344445351')
--(1, 0002822, 'David Giesen', 1349064, '045203832', '043181651')
--(1, 6577, 'David Giesen', 1382809, '460707462', '583143840')
--(1, 0150395, 'Aurelia Shorter', 3243210, 'xxxxxxxxx', '545130002')
--(1, 174648, 'David Giesen', 3346643, 'NULL', '384505471')
--(1, 188037, 'David Giesen', 3348032, 'NULL', '088640404')
--(1, 0189167, 'Norlan Treminio', 3362249, 'xxx-xx-xxxx', '555555555')

(1, 0189853, 'Aurelia Shorter', 3169861, 'xxxxx6458', '563426531')


) P (SeqNum, HDTNum, Requester, Loan, Baad, Good)
inner join celink.tblCoBorrower T
On P.Loan = T.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
for read only with ur;
-- SEQNUM HDTNUM REQUESTER       LOAN    BAAD      GOOD      CHRSSN    IDSCOBORROWERID INTSUBSERVICERLOANNUMBER CHRFIRSTNAME CHRLASTNAME CHRADDRESS      CHRCITY CHRSTATE CHRZIPCODE CHRCOUNTRY CHRSSN    CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE DTMBIRTHDATE          DTMDEATHDATE INTAGE CHRGENDER CHRRACE CHRETHNICITY CHREMAILADDRESS CHRFAX     PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE CHRMIDDLENAME
-- ------ ------ --------------- ------- --------- --------- --------- --------------- ------------------------ ------------ ----------- --------------- ------- -------- ---------- ---------- --------- ------------ ------------ -------------- --------------------- ------------ ------ --------- ------- ------------ --------------- ---------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- -------- -------------
--      1 189853 Aurelia Shorter 3169861 xxxxx6458 563426531 471526458          276157                3169861.0 Helene       Adams       1642 Ashbury Ln Hayward CA       94545      NULL       471526458 5107822921                               1937-06-05 12:00:00.0 NULL             83 M         2       2                                        2197353       3197353     6197353     7197353       8197353 2197353        NULL NULL                NULL     NULL

---------------------------------------------------------------------------------------------------------------------------------------------
-- note ... C:\Users\ted.kato\Documents\HDTUpdtNotes_123934.csv
---------------------------------------------------------------------------------------------------------------------------------------------
select	
--	SeqNum, HDTNum, Requester, loan, Baad, Good, 
--	T.CHRSSN, T.INTSUBSERVICERLOANNUMBER
--	'--Note->', 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
--  'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Borrower SSN updated from xxx-xx-' || right(T.CHRSSN, 4) || ' to xxx-xx-' || Right(P.Good,4) || '.'
--  'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Borrower SSN,  Co-Borrower SSN updated.'
--	'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Borrower SSN updated from xxx-xx-' || right(T.CHRSSN, 4) || ' to xxx-xx-' || Right(P.Good,4) || '.'
    'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Co-Borrower(ID' || T.IDSCOBORROWERID || ') SSN updated from xxx-xx-' || right(T.CHRSSN, 4) || ' to xxx-xx-' || Right(P.Good,4) || '.'
--  'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Co-Borrower(ID' || T.IDSCOBORROWERID || ') SSN updated.'
--  'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'Co-Borrower(ID' || T.IDSCOBORROWERID || ') SSN updated from <Blank> to xxx-xx-' || Right(P.Good,4) || '.'
from 
(values
--(1, 0189167, 'Norlan Treminio', 3362249, 'NULL', '555555555')
--(1, 0189483, 'Norlan Treminio', 3362249, 'xxx-xx-5555', '771764476')
(1, 0189853, 'Aurelia Shorter', 3169861, 'xxxxx6458', '563426531')

) P (SeqNum, HDTNum, Requester, Loan, Baad, Good)
inner join celink.tblCoBorrower T 
	on P.Loan = T.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
for read only with ur
;
-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) 6
-- ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------------------------------
--      1     3169861 N                                                                Per HDT 189853 (Aurelia Shorter) Co-Borrower(ID276157) SSN updated from xxx-xx-6458 to xxx-xx-6531.

------------------------------------------------------------------------------------------------------------------------------------------------
-- command creation 
-- sample upd -- update celink.tblCoBorrower set CHRSSN = '073409723'  where INTSUBSERVICERLOANNUMBER  = 3255407  and IDSCOBORROWERID = 312183 ;
-- MUST CHECK IDSCOBORROWERID before exe as it might have multiple !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
P.SeqNum, P.HDTNum, P.Requester, P.Loan, T.IDSCOBORROWERID, P.Good, P.Baad,
T.CHRSSN,
'UPDATE celink.tblCoBorrower SET CHRSSN = ''' || P.Good || ''' where INTSUBSERVICERLOANNUMBER = ' || P.Loan || ' and IDSCOBORROWERID = ' || T.IDSCOBORROWERID || ';' as "TheCommand"
from 
(values

(1, 0189853, 'Aurelia Shorter', 3169861, 'xxxxx6458', '563426531')

) P (SeqNum, HDTNum, Requester, Loan, Baad, Good) 
inner join celink.tblCoBorrower T
On P.Loan = T.INTSUBSERVICERLOANNUMBER
ORDER BY P.SeqNum
with ur;

-- SEQNUM HDTNUM REQUESTER       LOAN    IDSCOBORROWERID GOOD      BAAD      CHRSSN    TheCommand
-- ------ ------ --------------- ------- --------------- --------- --------- --------- ---------------------------------------------------------------------------------------------------------------------------
--      1 189853 Aurelia Shorter 3169861          276157 563426531 xxxxx6458 471526458 

--UPDATE celink.tblCoBorrower SET CHRSSN = '563426531' where INTSUBSERVICERLOANNUMBER = 3169861 and IDSCOBORROWERID = 276157;


-- ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------
-- ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------
-- Note
-- ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)
select 
--	SeqNum,	
Loan as "Loan Number",
--'Per HDT 189167 (Norlan Treminio) Co-Borrower(ID353407) SSN updated from <Blank> to xxx-xx-5555.'
'Per HDT 189483 (Norlan Treminio) Co-Borrower(ID353407) SSN updated from xxx-xx-5555 to xxx-xx-4476.'
,
CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
'tkato', 
0,
0
from 
(VALUES
(1, 0189483, 'Norlan Treminio', 3362249, 'xxx-xx-5555', '771764476')
) UY (SeqNum, HDTNum, Requester, Loan, Baad, Good)
order by UY.SeqNum
;

-- Loan Number 2                                                                                               3                          4     5 6
-- ----------- ----------------------------------------------------------------------------------------------- -------------------------- ----- - -
--     3362249 Per HDT 189167 (Norlan Treminio) Co-Borrower(ID353407) SSN updated from <Blank> to xxx-xx-5555. 2025-05-06 15:00:18.497924 tkato 0 0
-- Loan Number 2                                                                                                   3          4     5 6
-- ----------- --------------------------------------------------------------------------------------------------- ---------- ----- - -
--     3362249 Per HDT 189483 (Norlan Treminio) Co-Borrower(ID353407) SSN updated from xxx-xx-5555 to xxx-xx-4476. 2025-05-08 tkato 0 0

-- Loan Number 2                                                                                                   3                        4     5 6
-- ----------- --------------------------------------------------------------------------------------------------- ------------------------ ----- - -
--     3362249 Per HDT 189483 (Norlan Treminio) Co-Borrower(ID353407) SSN updated from xxx-xx-5555 to xxx-xx-4476. 2025-05-08 15:26:13.1733 tkato 0 0

-----------------------------------------------------------------------------------------------------------
-- Notes
select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from celink.tblloannotes a  
	where a.INTSUBSERVICERLOANNUMBER in (1382809) --and IDSLOANNOTES = 169263310
	order by a.IDSLOANNOTES desc 
for read only with UR;

-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           CHRUSERID          BLNPRIORITY
-- -------------------------- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------ -----------
-- 2023-09-15 17:42:37.125573    169263310                1382809.0 Per HDT 6577 (David Giesen) Co-Borrower(ID199788) SSN updated from xxx-xx-7462 to xxx-xx-3840.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         tkato                        0
-- 2023-09-15 17:34:29.13583     169263224                1382809.0 Per HDT 6577 (David Giesen) Borrower SSN updated from xxx-xx-3840 to xxx-xx-7462.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      tkato                        0


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- single update
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

select 
	CHRSSN, * 
	from celink.tblCoBorrower
	 where INTSUBSERVICERLOANNUMBER  = 3255407  and IDSCOBORROWERID = 312183
for read only with ur;
-- CHRSSN    IDSCOBORROWERID INTSUBSERVICERLOANNUMBER CHRFIRSTNAME CHRLASTNAME CHRADDRESS          CHRCITY     CHRSTATE CHRZIPCODE CHRCOUNTRY CHRSSN    CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE DTMBIRTHDATE          DTMDEATHDATE INTAGE CHRGENDER CHRRACE CHRETHNICITY CHREMAILADDRESS      CHRFAX     PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE CHRMIDDLENAME
-- --------- --------------- ------------------------ ------------ ----------- ------------------- ----------- -------- ---------- ---------- --------- ------------ ------------ -------------- --------------------- ------------ ------ --------- ------- ------------ -------------------- ---------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- -------- -------------
-- 073400000          312183                3255407.0 Georgette    Ferrentino  2646 Blue Ridge Cir Spring Hill FL       34606      NULL       073400000 8285517910                8285517910     1947-06-24 00:00:00.0 NULL             75 F         1       0            Peter10940@gmail.com             2233350       3233350     6233350     7233350       8233350 2233350        NULL NULL                NULL     
-- CHRSSN    IDSCOBORROWERID INTSUBSERVICERLOANNUMBER CHRFIRSTNAME CHRLASTNAME CHRADDRESS          CHRCITY     CHRSTATE CHRZIPCODE CHRCOUNTRY CHRSSN    CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE DTMBIRTHDATE          DTMDEATHDATE INTAGE CHRGENDER CHRRACE CHRETHNICITY CHREMAILADDRESS      CHRFAX     PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE CHRMIDDLENAME
-- --------- --------------- ------------------------ ------------ ----------- ------------------- ----------- -------- ---------- ---------- --------- ------------ ------------ -------------- --------------------- ------------ ------ --------- ------- ------------ -------------------- ---------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- -------- -------------
-- 073400000          312183                3255407.0 Georgette    Ferrentino  2646 Blue Ridge Cir Spring Hill FL       34606      NULL       073400000 8285517910                8285517910     1947-06-24 00:00:00.0 NULL             75 F         1       0            Peter10940@gmail.com             2233350       3233350     6233350     7233350       8233350 2233350        NULL NULL                NULL     

-- after
-- CHRSSN    IDSCOBORROWERID INTSUBSERVICERLOANNUMBER CHRFIRSTNAME CHRLASTNAME CHRADDRESS          CHRCITY     CHRSTATE CHRZIPCODE CHRCOUNTRY CHRSSN    CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE DTMBIRTHDATE          DTMDEATHDATE INTAGE CHRGENDER CHRRACE CHRETHNICITY CHREMAILADDRESS      CHRFAX     PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE CHRMIDDLENAME
-- --------- --------------- ------------------------ ------------ ----------- ------------------- ----------- -------- ---------- ---------- --------- ------------ ------------ -------------- --------------------- ------------ ------ --------- ------- ------------ -------------------- ---------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- -------- -------------
-- 073409723          312183                3255407.0 Georgette    Ferrentino  2646 Blue Ridge Cir Spring Hill FL       34606      NULL       073409723 8285517910                8285517910     1947-06-24 00:00:00.0 NULL             75 F         1       0            Peter10940@gmail.com             2233350       3233350     6233350     7233350       8233350 2233350        NULL NULL                NULL     

------------------------------------

--/* **
--updateeeee 

--update celink.tblCoBorrower set CHRSSN = '073409723'  where INTSUBSERVICERLOANNUMBER  = 3255407  and IDSCOBORROWERID = 312183 ;

--** */

----** --Notes ... use bulk upload
-- done with Borr script

--*/
