/* **********************************************
20220202 ... Template 

C:\Users\ted.kato\Documents\PRBUpdtNotes_275.csv

PROBLEM #275
Vicky Cermak
Vice President, Business Systems Analysis
BP Updates 02.02.2022
Created: Feb 02, 2022 at 6:26 PM by Vicky Cermak
Updates of PersonID attached for update.

BP Support 02.02.202...xlsx

-- comments
The request has been completed.

************************************************ */

/*
-- comment
Account deleted.  Please contact borrower and have him/her re-create account. 
 
SeqNum, Loan, PersonID
xx ="(" & C2 & ", " & A2 & ", " & B2 &"),"
HDT Num   ="(" & C2 & ", " & A2 & ", " & B2 & ", " & D2 & ")," 
PRB Num   ="(" & C2 & ", " & A2 & ", " & B2 & ", " & D2 & ", " & E2 & ")," 
PRB Num   ="(" & F2 & ", " & A2 & ", " & B2 & ", " & C2 & ", 342),"  ... this is for spread sheet i create 

          ="(" & G2 & ", " & B2 & ", " & C2 & ", " & D2 & ", " & E2 & ")," ... new My Val format, Thomas include HDT's

Backup for deleted person ID's attached
************************************************ */

/* **********************************************
Account deleted.  Please contact borrower and have him/her re-create account.

Please see attached to validate deleted accounts in DB2

="(" & C2 & ", " & A2 & ", " & B2 & ", " & D2 & ", " & E2 & ")," 
="(" & F2 & ", " & A2 & ", " & B2 & ", " & C2 & ", 370),"  ... this is for spread sheet i create 

="(" & F2 & ", " & B2 & ", " & C2 & ", " & D2 & ", " & E2 & ")," ... new My Val format, Thomas include HDT's

--20230818 Anju format
="("&G2&", "&B2&", "&C2&", "&D2&", "&E2& ", '" & F2 & "'),"
="("&G2&", "&B2&", "&C2&", "&D2&", "&E2& "),"


C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\RS\Incident\BP\BPnotes

*/

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

/*
20250904

[IN-0198782]  BP Support - Assign Ticket to Ted  9/5/2025 12:08 PM  Tawnya McCrackin

="("&G2 &", "&D2&", "&B2&", " & C2 & ", "& E2 & ", '" & left(F2,44) & "'),"

Account deletion completed.  Please contact borrower and have him/her re-create account.
Below is the list of ticket and loan numbers resolved with the parent ticket.

 SEQNUM HDT    Loan#   PersonID Parent HDT
 ------ ------ ------- -------- ----------
      1 198779 3222343   531756     198782  -- removed from the list and not deleted, please refer to the ticket.
      2 198783 3147396   456812     198782
      3 198805 3372098   681488     198782
      4 198812 3349272   658668     198782
*/

---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------

/*
remove "PR-"
="("&G2&", "&B2&", "&C2&", "&D2&", "& right(E2,7) & ", '" & F2 & "'),"

="("&G2&", "&B2&", "&C2&", "&D2&", "&E2& ", '" & F2 & "'),"

select 	X.LOANNUMBER, X.PERSONID, X.* from entity.borrowerloannumber_j X where X.PERSONID   in ( ) ;
select 	X.LOANNUMBER, X.PERSONID, X.* from entity.borrowerloannumber_j X where X.loannumber = 3065217 ;
select 	X.LOANNUMBER, X.PERSONID, X.* from entity.borrowerloannumber_j X where X.loannumber in ( ) ;
select T.personid, T.SUBID, T.ENTRY_TIMESTAMP, T.* from entity.personcognitosub_j T where T.personid in ( ) ;
select T.PERSONID, T.IDENTITYPOOLID, T.ENTRY_TIMESTAMP from entity.PERSONAWSPOOLID_J T where T.personid in ( ) ;

select T.personid, T.SUBID, T.ENTRY_TIMESTAMP, T.* from entity.personcognitosub_j T where T.personid in (245615 ) ;

*/


/*	
--	DROP TABLE DATAUPDT.UpdtBP;
	
	create table DATAUPDT.UpdtBPX
	(  
		SeqNum   integer,
		Loan     integer,
		PID      integer,
		HDT      integer,
		PRB		 integer 	
		Rem      varchar (300)	
	) COMPRESS YES ADAPTIVE IN DATAUPDT_TS16;
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.UpdtBPX  TO group db2_ast;
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.UpdtBPX  TO user cking;
    select * from DATAUPDT.UpdtBPX;

*/

----------------------------
DELETE from DATAUPDT.UpdtBP;

----------------------------
Insert into DATAUPDT.UpdtBP
	(
	SeqNum,
	HDT,
	Loan,
	PID,
	PRB
	)		
with param (SeqNum, HDT, Loan, PiD, PRB, MyNote) as
	(values

--(1, 198779, 3222343, 531756, 198782, 'Borrower Portal Support Incident - 3222343 -'),
(2, 198783, 3147396, 456812, 198782, 'Borrower Portal Support Incident - 3147396 -'),
(3, 198805, 3372098, 681488, 198782, 'Borrower Portal Support Incident - 3372098 -'),
(4, 198812, 3349272, 658668, 198782, 'Borrower Portal Support Incident - 3349272 -')

)
select 
	P.SeqNum,P.HDT, P.Loan, P.PiD,  P.PRB
from Param P
order by P.SeqNum
;

	----------------------------------------------
	select * from DATAUPDT.UpdtBP order by PRB, SeqNum;
-- SEQNUM LOAN    PID    HDT    PRB
-- ------ ------- ------ ------ ------
--      2 3147396 456812 198783 198782
--      3 3372098 681488 198805 198782
--      4 3349272 658668 198812 198782

/*
	select 
	P.*, A.PERSONID "A-PersonID", B.PERSONID "B-PersonID"
	from DATAUPDT.UpdtBP P
	inner join 
	(
	select INTSUBSERVICERLOANNUMBER, PERSONID, CHREMAILADDRESS, CHRHOMEPHONE, CHRMOBILEPHONE,CHRSSN, CHRFIRSTNAME, CHRLASTNAME,DTMDEATHDATE 
	from celink.tblborrower 
	) A
	on p.loan = A.INTSUBSERVICERLOANNUMBER

	left outer join
	(
	select INTSUBSERVICERLOANNUMBER, PERSONID, CHREMAILADDRESS, CHRHOMEPHONE, CHRMOBILEPHONE,CHRSSN, CHRFIRSTNAME, CHRLASTNAME, DTMDEATHDATE 
	from celink.tblCoborrower    
	) B
	on p.loan = B.INTSUBSERVICERLOANNUMBER
	
	order by SeqNum;

-- SEQNUM LOAN    PID    HDT    PRB    A-PersonID B-PersonID
-- ------ ------- ------ ------ ------ ---------- ----------
--      1 3261293 570706 197058 197091     570706    2235839
--      2 1186204 109892 196346 197091     109892    2039967
--      3 3249103 558516 197128 197091     558516       NULL
*/

/* populate personID
--MERGE INTO DATAUPDT.UpdtBP TT
--USING
--(
--
--	select 
--	P.*, A.PERSONID "A_PersonID", B.PERSONID "B_PersonID"
--	from DATAUPDT.UpdtBP P
--	inner join 
--	(
--	select INTSUBSERVICERLOANNUMBER, PERSONID, CHREMAILADDRESS, CHRHOMEPHONE, CHRMOBILEPHONE,CHRSSN, CHRFIRSTNAME, CHRLASTNAME,DTMDEATHDATE 
--	from celink.tblborrower 
--	) A
--	on p.loan = A.INTSUBSERVICERLOANNUMBER
--
--	left outer join
--	(
--	select INTSUBSERVICERLOANNUMBER, PERSONID, CHREMAILADDRESS, CHRHOMEPHONE, CHRMOBILEPHONE,CHRSSN, CHRFIRSTNAME, CHRLASTNAME, DTMDEATHDATE 
--	from celink.tblCoborrower    
--	) B
--	on p.loan = B.INTSUBSERVICERLOANNUMBER
--	
--	order by SeqNum
--	
--) UY(SEQNUM, LOAN,    PID,  HDT,    PRB,    A_PersonID, B_PersonID)
--on UY.SEQNUM = TT.SeqNum and UY.LOAN = TT.Loan
--WHEN MATCHED THEN UPDATE 
--Set TT.PID = UY.A_PersonID
--; 
--
--
--select * from DATAUPDT.UpdtBP order by PRB, SeqNum;
--
-- SEQNUM LOAN    PID    HDT    PRB
-- ------ ------- ------ ------ ------
--      1 3298093 607505 197040 197033
--      2 1264651 198329 196959 197033
--      3 3222345 531758 196953 197033
--      4 3320351 629759 196868 197033
--      5 1177698  24549 196848 197033
--      6 3340741 650140 196813 197033
--      7 3343133 652531 196708 197033
--      8 3352283 661678 196564 197033
--      9 1358164 295244 196514 197033
--     10 3365246 674637 196461 197033
--     11 3205180 514594 196431 197033
--     12 3325234 634640 196417 197033
--     13 3268885 578297 196398 197033
--     14 3260213 569626 196387 197033
--     15 3247287 556700 196341 197033
--     16 3280277 589689 196306 197033
--     17 3319246 628654 195057 197033
*/	

/*
https://us-east-1.console.aws.amazon.com/ses/home?region=us-east-1#/suppression-list/shoreline_stuarts%40msn.com
*/

---------------------------------------------------------------------------------------------------------------------------------------------
-- Store backup
---------------------------------------------------------------------------------------------------------------------------------------------
	/*	
	DROP TABLE DATAUPDT.HDTBP_DeletedPersonID;

	create table DATAUPDT.HDTBP_DeletedPersonID 
	(  
		PRB		 integer,
		SeqNum   integer,
		Loan     integer,  -- given loan number
		PID      integer,
		HDT      integer,
		LoanNum  integer,  -- loan number associated with Given PersonID

		PERSONID integer, 
		SUBID 	 varchar(55 OCTETS), 
		BORROWERTYPE integer, 
		ENTRY_TIMESTAMP varchar(100),
		MyNote  varchar(100),
		Done	timestamp
	) COMPRESS YES ADAPTIVE IN DATAUPDT_TS16;
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTBP_DeletedPersonID  TO group db2_ast;
    select * from DATAUPDT.HDTBP_DeletedPersonID;
 */

----------------------------
-- do not delete DELETE from DATAUPDT.HDTBP_DeletedPersonID;

-- Backup
INSERT INTO DATAUPDT.HDTBP_DeletedPersonID
select 
	P.PRB, P.SEQNUM, 
	P.Loan as "Loan# Submitted", 
	P.PID as "PersonID", 
	P.HDT,
	X.LOANNUMBER as "Loan# Associated w/PersonID", 
	X.PERSONID, T.SUBID, x.BORROWERTYPE, T.ENTRY_TIMESTAMP, 
	case 
	when COALESCE(cast(T.SUBID as varchar(100)), '') = ''
	then 'no account data found in DB2 table' 
	else '' 
	end as "*Note",
	CURRENT_TIMESTAMP (0) as "Done"
from DATAUPDT.UpdtBP P
inner join entity.borrowerloannumber_j X
	on P.PID =  X.PERSONID
left outer join entity.personcognitosub_j T
	on X.personid = T.personid 
order by P.SeqNum
with ur;

	------------------------------------------------------------------------------------------------------------
    select * from DATAUPDT.HDTBP_DeletedPersonID where PRB <> 20230908 order by PRB desc, SeqNum;
 --   select * from DATAUPDT.HDTBP_DeletedPersonID where date(DONE) = date('6/21/2024') order by done desc;
    
/*
-- PRB    SEQNUM LOAN     PID     HDT     LOANNUM PERSONID SUBID                                BORROWERTYPE ENTRY_TIMESTAMP            MYNOTE                             DONE
-- ------ ------ -------- ------- ------- ------- -------- ------------------------------------ ------------ -------------------------- ---------------------------------- ---------------------
-- 198782      1  3222343  531756  198779 3222343   531756 2697da80-a3b2-4562-bfff-07d4e20719d9            1 2022-04-12-11.42.29.778504                                    2025-09-05 18:04:36.0
-- 198782      2  3147396  456812  198783 3147396   456812 b50dbf7b-2fd8-4f2f-934d-530f1ce0de4e            1 2023-05-23-14.25.40.557818                                    2025-09-05 18:04:36.0
-- 198782      3  3372098  681488  198805 3372098   681488 e1738337-0e11-48d4-8648-d9dd2e5ac368            1 2024-12-09-16.20.50.578090                                    2025-09-05 18:04:36.0
-- 198782      4  3349272  658668  198812 3349272   658668 5c54cc8e-c833-4059-af77-f8612b813026            1 2024-11-09-07.46.08.514112                                    2025-09-05 18:04:36.0

*/

/*
	-- Report
	-- C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\RS\Incident\BP\BPnotes\PRB_BPUpdt_ 0135183.csv
	select 
	--		*
	--	PRB		 ,
		P.SeqNum   ,
		P.Loan     as "Loan# Submitted",  -- given loan number
		P.LoanNum   as "Loan# Associated w/PersonID",  -- loan number associated with Given PersonID
		P.PERSONID , 
		P.SUBID 	 , 
		P.BORROWERTYPE , 
		P.ENTRY_TIMESTAMP ,
		MySrc.Remarks as "*Remarks",
		MyNote as "*Note",  
		P.HDT,
		P.Done	
	from DATAUPDT.HDTBP_DeletedPersonID P

-- added 20230830 -- to show memo given in SS
inner join 
(values

(1, 1317045, 255225, 146939, 146958, 'Borrower wants to update email address.'),
(2, 3210679, 520093, 146948, 146958, 'Borrower wants to reset account.'),
(3, 3295759, 605171, 146934, 146958, 'Borrower wants to delete account.'),
(4, 3206905, 516319, 146950, 146958, 'Borrower wants to reset account.')

) MySrc(SeqNum, Loan, PiD, HDT, PRB, Remarks)
on  P.LoanNum = MySrc.Loan
and P.PERSONID = MySrc.PiD
and P.HDT = MySrc.HDT

--	where P.PRB = (select max(PRB) from DATAUPDT.HDTBP_DeletedPersonID where PRB <> 20230908)
	
	order by P.PRB, P.SeqNum
	;

*/

----------------------------------------------------------------------------------------------------
-- Report
-- C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\RS\Incident\BP\BPnotes\PRB_BPUpdt_ 0134790.csv
select 
--		*
--	PRB		 ,
	SeqNum   ,
	case when Loan <> LoanNum then '!!BaadLoan!!' else '**GoodLoan**' end as "LoanCheck",
	Loan     as "Loan# Submitted",  -- given loan number
	LoanNum  as "Loan# wPersonID",  -- loan number associated with Given PersonID
	PERSONID , 
	SUBID 	 , 
	BORROWERTYPE , 
	ENTRY_TIMESTAMP ,
	MyNote as "*Note",
	HDT,
	Done	
from DATAUPDT.HDTBP_DeletedPersonID P
where P.PRB = (select max(PRB) from DATAUPDT.HDTBP_DeletedPersonID where PRB <> 20230908)
and date(P.Done) = current_date
order by PRB, SeqNum
;

/*

 SEQNUM LoanCheck    Loan# Submitted Loan# wPersonID PERSONID SUBID                                BORROWERTYPE ENTRY_TIMESTAMP            *Note HDT    DONE
 ------ ------------ --------------- --------------- -------- ------------------------------------ ------------ -------------------------- ----- ------ ---------------------
      1 **GoodLoan**         3222343         3222343   531756 2697da80-a3b2-4562-bfff-07d4e20719d9            1 2022-04-12-11.42.29.778504       198779 2025-09-05 18:04:36.0
      2 **GoodLoan**         3147396         3147396   456812 b50dbf7b-2fd8-4f2f-934d-530f1ce0de4e            1 2023-05-23-14.25.40.557818       198783 2025-09-05 18:04:36.0
      3 **GoodLoan**         3372098         3372098   681488 e1738337-0e11-48d4-8648-d9dd2e5ac368            1 2024-12-09-16.20.50.578090       198805 2025-09-05 18:04:36.0
      4 **GoodLoan**         3349272         3349272   658668 5c54cc8e-c833-4059-af77-f8612b813026            1 2024-11-09-07.46.08.514112       198812 2025-09-05 18:04:36.0

*/

----------------------------------------------------------------------------------------------------
select 
Seqnum,
HDT,
LOAN "Loan#",
PID "PersonID",
PRB "Parent HDT"
from DATAUPDT.UpdtBP order by PRB, SeqNum;

/*
 SEQNUM HDT    Loan#   PersonID Parent HDT
 ------ ------ ------- -------- ----------
      1 198779 3222343   531756     198782  -- removed from the list, please refer to the ticket.
      2 198783 3147396   456812     198782
      3 198805 3372098   681488     198782
      4 198812 3349272   658668     198782
*/

/*
------------------------------------------------------------------------------------------------------------
-- loan number check ,,, personcognitosub_j  ,,, ??? not so effective ???
------------------------------------------------------------------------------------------------------------
select 
	P.PRB, P.SEQNUM, P.HDT,
	P.Loan, 
	X.LOANNUMBER, 
	P.PID, 
	X.PERSONID, T.SUBID, T.ENTRY_TIMESTAMP, x.BORROWERTYPE
from DATAUPDT.UpdtBP P
inner join entity.borrowerloannumber_j X
	on P.Loan = X.loannumber
--	and P.PID =  X.PERSONID
left outer join entity.personcognitosub_j T
	on X.personid = T.personid 
order by P.SeqNum
for read only with ur;

--select 
--	P.SEQNUM, P.HDT,
--	P.Loan, 
--	X.LOANNUMBER, 
--	P.PID, 
--	X.PERSONID, T.SUBID, T.ENTRY_TIMESTAMP, x.BORROWERTYPE
--from DATAUPDT.UpdtBP P
--inner join entity.borrowerloannumber_j X
--	on P.PID =  X.PERSONID	-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! person ID
--left outer join entity.personcognitosub_j T
--	on X.personid = T.personid 
--order by P.SeqNum
--for read only with ur;

-- see the back up file [C:\Users\ted.kato\Documents\PRB_BPUpdt_XXX.csv]

-- PRB SEQNUM HDT    LOAN    LOANNUMBER PID    PERSONID SUBID                                ENTRY_TIMESTAMP            BORROWERTYPE
-- --- ------ ------ ------- ---------- ------ -------- ------------------------------------ -------------------------- ------------
-- 423      1 135921 3101287    3101287 251860   251860 7b3f97a5-93bc-49ab-8d81-96e697d1abe1 2022-07-06 21:24:34.231556            1
-- 423      2 135945 3307793    3307793 343192   617205 NULL                                 NULL                                  1
--
*/
--------------------------------------------------------------------------------------------------------------
---- loan number check ,,, PERSONAWSPOOLID_J
--------------------------------------------------------------------------------------------------------------
--select 
--	P.SEQNUM, P.HDT, P.Loan, X.LOANNUMBER, P.PID, X.PERSONID, T.IDENTITYPOOLID, T.ENTRY_TIMESTAMP, X.*
--from DATAUPDT.UpdtBP P
--inner join entity.borrowerloannumber_j X
--	on P.PID = X.PERSONID
--left outer join entity.PERSONAWSPOOLID_J T
--	on X.personid = T.personid 
--order by P.SeqNum
--for read only with ur;
--

/* -- use below union version
------------------------------------------------------------------------------------------------------------
-- PersonID check ,,, personcognitosub_j 
------------------------------------------------------------------------------------------------------------
-- Simple version
select 
	P.SEQNUM, P.Loan as "Loan#", P.PID as "PersonID", T.PERSONID, T.SUBID, T.ENTRY_TIMESTAMP, P.HDT
	, 
	case 
	when COALESCE(cast(T.SUBID as varchar(100)), '') = ''
	then 'no account data found in DB2 table' 
	else '' 
	end as "*Note"	
from DATAUPDT.UpdtBP P
left outer join entity.personcognitosub_j T
on P.PiD = T.personid 
order by P.SeqNum
for read only with ur;

------------------------------------------------------------------------------------------------------------
-- PersonID check ,,, PERSONAWSPOOLID_J
------------------------------------------------------------------------------------------------------------
select 
	P.SEQNUM, P.Loan, P.PID, T.PERSONID, T.IDENTITYPOOLID, T.ENTRY_TIMESTAMP, P.HDT
from DATAUPDT.UpdtBP P
left outer join entity.PERSONAWSPOOLID_J T
on P.PiD = T.personid 
order by P.SeqNum
for read only with ur;

*/

------------------------------------------------------------------------------------------------------------
-- Check by UNION 
------------------------------------------------------------------------------------------------------------
--PersonID check ,,, personcognitosub_j 
------------------------------------------------------------------------------------------------------------
select 
	'CcognitoSub' "DB2Table",
	P.SEQNUM, P.Loan as "Loan#", P.PID as "PersonID", 
	T.PERSONID, T.SUBID "ID", T.ENTRY_TIMESTAMP, P.HDT, P.PRB
	, 
	case 
	when COALESCE(cast(T.SUBID as varchar(100)), '') = ''
	then 'no account data found in DB2 personcognitosub_j table' 
	else '' 
	end as "*Note"	
from DATAUPDT.UpdtBP P
left outer join entity.personcognitosub_j T
on P.PiD = T.personid 
--order by P.SeqNum
--for read only with ur;
------------------------------------------------------------------------------------------------------------
UNION -- PersonID check ,,, PERSONAWSPOOLID_J
------------------------------------------------------------------------------------------------------------
select 
	'PoolID' "DB2Table",
	P.SEQNUM, P.Loan as "Loan#", P.PID as "PersonID", 
	T.PERSONID,	T.IDENTITYPOOLID "ID", T.ENTRY_TIMESTAMP, P.HDT, P.PRB
	, 
	case 
	when COALESCE(cast(T.IDENTITYPOOLID as varchar(100)), '') = ''
	then 'no account data found in DB2 PERSONAWSPOOLID_J table' 
	else '' 
	end as "*Note"	
from DATAUPDT.UpdtBP P
left outer join entity.PERSONAWSPOOLID_J T
on P.PiD = T.personid 

order by PRB, SeqNum, "DB2Table"
for read only with ur;

/*
 DB2Table    SEQNUM Loan#   PersonID PERSONID ID                                             ENTRY_TIMESTAMP            HDT    PRB    *Note
 ----------- ------ ------- -------- -------- ---------------------------------------------- -------------------------- ------ ------ ----------------------------------------------------
 CcognitoSub      2 3147396   456812   456812 b50dbf7b-2fd8-4f2f-934d-530f1ce0de4e           2023-05-23 14:25:40.557818 198783 198782 
 PoolID           2 3147396   456812     NULL NULL                                           NULL                       198783 198782 no account data found in DB2 PERSONAWSPOOLID_J table
 CcognitoSub      3 3372098   681488   681488 e1738337-0e11-48d4-8648-d9dd2e5ac368           2024-12-09 16:20:50.57809  198805 198782 
 PoolID           3 3372098   681488   681488 us-east-1:5bb6e1b5-9354-cc20-2e85-a81b4e4eca7f 2024-12-09 16:24:13.721045 198805 198782 
 CcognitoSub      4 3349272   658668   658668 5c54cc8e-c833-4059-af77-f8612b813026           2024-11-09 07:46:08.514112 198812 198782 
 PoolID           4 3349272   658668   658668 us-east-1:5bb6e1b5-9361-c72e-151c-92710c8a5dcc 2024-11-09 07:46:29.964985 198812 198782 

*/

----------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
--  DELETEEEEEEEEEEEE 
------------------------------------------------------------------------------------------------------------

MERGE into entity.personcognitosub_j X1
USING --DATAUPDT.UpdtBP UY
(
	select 
	P.SEQNUM, P.HDT, P.Loan, P.PID, T.PERSONID, T.SUBID, T.ENTRY_TIMESTAMP
	from DATAUPDT.UpdtBP P
	inner join entity.personcognitosub_j T
	on P.PiD = T.personid 
	order by P.SeqNum
) UY
ON    X1.PersonID = UY.Pid
WHEN  MATCHED THEN DELETE
;

--------------------------------------------------------
MERGE into entity.PERSONAWSPOOLID_J X2
USING --DATAUPDT.UpdtBP UY
(
	select 
	P.SEQNUM, P.HDT, P.Loan, P.PID, T.PERSONID, T.IDENTITYPOOLID, T.ENTRY_TIMESTAMP
	from DATAUPDT.UpdtBP P
	inner join entity.PERSONAWSPOOLID_J T
	on P.PiD = T.personid 
	order by P.SeqNum
) UY
ON    X2.PersonID = UY.Pid
WHEN  MATCHED THEN DELETE
;



------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
--check shark
------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
--check against DATAUPDT.HDTBP_DeletedPersonID
with P (SeqNum, Loan, Bor, Stats) as
(VALUES
(1, 3216026, 'Maruhasi, Michael', 'DL'),
(2, 1323588, 'Canfield, Benjamin & Juanita', 'DL'),
(3, 3283283, 'Gibson, Harold', 'A'),
(4, 3267748, 'Grabotin, Alyce & Oswald', 'A'),
(5, 3274667, 'Fossie, Marvin', 'DL'),
(6, 3316329, 'Briones, Alfred', 'DL'),
(7, 3316423, 'Latchford, Dolores', 'DL'),
(8, 3266425, 'Parker, Karen', 'A'),
(9, 3306383, 'Aimers Patrick', 'A'),
(10, 3306383, 'Linda & Patrick', 'A'),
(11, 3273922, 'Walker, Gail', 'A'),
(12, 3318172, 'Lawrence, Debra', 'A'),
(13, 3278835, 'Burton, Connie', 'A'),
(14, 3282257, 'Crews, Malinda', 'A'),
(15, 3336440, 'Bolick, Sharon', 'A')

)
select 
P.*,
T.HDT, T.Loan, T.PiD, T.Done,
CURRENT_TIMESTAMP (0) as "RunDate" 
from P 
left outer join DATAUPDT.HDTBP_DeletedPersonID T
on P.Loan = T.loan
--and P.stats = 'A'
and date(T.Done) >= date('4/1/2025') 
order by P.SeqNum;

/* 
 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-18 18:39:43.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-18 18:39:43.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-18 18:39:43.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-18 18:39:43.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-18 18:39:43.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-18 18:39:43.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-18 18:39:43.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-18 00:22:01.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-18 00:22:01.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-18 00:22:01.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-18 00:22:01.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-18 00:22:01.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-18 00:22:01.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-18 00:22:01.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-16 18:44:09.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-16 18:44:09.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-16 18:44:09.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-16 18:44:09.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-16 18:44:09.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-16 18:44:09.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-16 18:44:09.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-15 17:39:38.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-15 17:39:38.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-15 17:39:38.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-15 17:39:38.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-15 17:39:38.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-15 17:39:38.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-15 17:39:38.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-14 18:37:40.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-14 18:37:40.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-14 18:37:40.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-14 18:37:40.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-14 18:37:40.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-14 18:37:40.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-14 18:37:40.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-11 21:09:12.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-11 21:09:12.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-11 21:09:12.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-11 21:09:12.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-11 21:09:12.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-11 21:09:12.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-11 21:09:12.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-10 17:58:04.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-10 17:58:04.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-10 17:58:04.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-10 17:58:04.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-10 17:58:04.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-10 17:58:04.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-10 17:58:04.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-09 18:34:45.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-09 18:34:45.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-09 18:34:45.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-09 18:34:45.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-09 18:34:45.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-09 18:34:45.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-09 18:34:45.0


3339409
 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-08 17:13:43.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-08 17:13:43.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-08 17:13:43.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-08 17:13:43.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-08 17:13:43.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-08 17:13:43.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-08 17:13:43.0


 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-03 16:18:21.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-03 16:18:21.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-03 16:18:21.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-03 16:18:21.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-03 16:18:21.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-03 16:18:21.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-03 16:18:21.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-02 19:14:24.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-02 19:14:24.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-02 19:14:24.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-02 19:14:24.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-02 19:14:24.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-02 19:14:24.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-02 19:14:24.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-07-01 17:53:50.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-07-01 17:53:50.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-07-01 17:53:50.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-07-01 17:53:50.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-07-01 17:53:50.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-07-01 17:53:50.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-07-01 17:53:50.0

3349081
3322131
 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-06-30 16:06:46.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-06-30 16:06:46.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-06-30 16:06:46.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-06-30 16:06:46.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-06-30 16:06:46.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-06-30 16:06:46.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-06-30 16:06:46.0


 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-06-26 18:03:56.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-06-26 18:03:56.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-06-26 18:03:56.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-06-26 18:03:56.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-06-26 18:03:56.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-06-26 18:03:56.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-06-26 18:03:56.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-06-25 17:46:26.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-06-25 17:46:26.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-06-25 17:46:26.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-06-25 17:46:26.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-06-25 17:46:26.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-06-25 17:46:26.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-06-25 17:46:26.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-06-24 15:57:08.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-06-24 15:57:08.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-06-24 15:57:08.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-06-24 15:57:08.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-06-24 15:57:08.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-06-24 15:57:08.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-06-24 15:57:08.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-06-23 17:56:25.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-06-23 17:56:25.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-06-23 17:56:25.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-06-23 17:56:25.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-06-23 17:56:25.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-06-23 17:56:25.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-06-23 17:56:25.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  DONE RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL NULL 2025-06-20 15:56:34.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL NULL 2025-06-20 15:56:34.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL NULL 2025-06-20 15:56:34.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL NULL 2025-06-20 15:56:34.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL NULL 2025-06-20 15:56:34.0
      8 3266425 Parker, Karen                A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
     13 3278835 Burton, Connie               A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL NULL 2025-06-20 15:56:34.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL NULL 2025-06-20 15:56:34.0

*/
------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
--check shark
------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
with P (SeqNum, Loan, Bor, Stats) as
(VALUES
(1, 3216026, 'Maruhasi, Michael', 'DL'),
(2, 1323588, 'Canfield, Benjamin & Juanita', 'DL'),
(3, 3283283, 'Gibson, Harold', 'A'),
(4, 3267748, 'Grabotin, Alyce & Oswald', 'A'),
(5, 3274667, 'Fossie, Marvin', 'DL'),
(6, 3316329, 'Briones, Alfred', 'DL'),
(7, 3316423, 'Latchford, Dolores', 'DL'),
(8, 3266425, 'Parker, Karen', 'A'),
(9, 3306383, 'Aimers Patrick', 'A'),
(10, 3306383, 'Linda & Patrick', 'A'),
(11, 3273922, 'Walker, Gail', 'A'),
(12, 3318172, 'Lawrence, Debra', 'A'),
(13, 3278835, 'Burton, Connie', 'A'),
(14, 3282257, 'Crews, Malinda', 'A'),
(15, 3336440, 'Bolick, Sharon', 'A')

)
select 
P.SeqNum, P.Loan, P.Bor, P.Stats,
T.HDT, T.Loan, T.PiD,
CURRENT_TIMESTAMP (0) as "RunDate" 
from P 
left outer join DATAUPDT.UpdtBP T
on P.Loan = T.loan
--and P.stats = 'A'
order by P.SeqNum;

/*
 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL 2025-04-22 17:33:03.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL 2025-04-22 17:33:03.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL 2025-04-22 17:33:03.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL 2025-04-22 17:33:03.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL 2025-04-22 17:33:03.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL 2025-04-22 17:33:03.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL 2025-04-22 17:33:03.0
      8 3266425 Parker, Karen                A     NULL NULL NULL 2025-04-22 17:33:03.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL 2025-04-22 17:33:03.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL 2025-04-22 17:33:03.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL 2025-04-22 17:33:03.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL 2025-04-22 17:33:03.0
     13 3278835 Burton, Connie               A     NULL NULL NULL 2025-04-22 17:33:03.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL 2025-04-22 17:33:03.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL 2025-04-22 17:33:03.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL 2025-04-18 18:16:12.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL 2025-04-18 18:16:12.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL 2025-04-18 18:16:12.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL 2025-04-18 18:16:12.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL 2025-04-18 18:16:12.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL 2025-04-18 18:16:12.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL 2025-04-18 18:16:12.0
      8 3266425 Parker, Karen                A     NULL NULL NULL 2025-04-18 18:16:12.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL 2025-04-18 18:16:12.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL 2025-04-18 18:16:12.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL 2025-04-18 18:16:12.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL 2025-04-18 18:16:12.0
     13 3278835 Burton, Connie               A     NULL NULL NULL 2025-04-18 18:16:12.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL 2025-04-18 18:16:12.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL 2025-04-18 18:16:12.0

 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL 2025-04-17 19:23:59.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL 2025-04-17 19:23:59.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL 2025-04-17 19:23:59.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL 2025-04-17 19:23:59.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL 2025-04-17 19:23:59.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL 2025-04-17 19:23:59.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL 2025-04-17 19:23:59.0
      8 3266425 Parker, Karen                A     NULL NULL NULL 2025-04-17 19:23:59.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL 2025-04-17 19:23:59.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL 2025-04-17 19:23:59.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL 2025-04-17 19:23:59.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL 2025-04-17 19:23:59.0
     13 3278835 Burton, Connie               A     NULL NULL NULL 2025-04-17 19:23:59.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL 2025-04-17 19:23:59.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL 2025-04-17 19:23:59.0


 SEQNUM LOAN    BOR                          STATS HDT  LOAN PID  RunDate
 ------ ------- ---------------------------- ----- ---- ---- ---- ---------------------
      1 3216026 Maruhasi, Michael            DL    NULL NULL NULL 2025-04-16 17:57:31.0
      2 1323588 Canfield, Benjamin & Juanita DL    NULL NULL NULL 2025-04-16 17:57:31.0
      3 3283283 Gibson, Harold               A     NULL NULL NULL 2025-04-16 17:57:31.0
      4 3267748 Grabotin, Alyce & Oswald     A     NULL NULL NULL 2025-04-16 17:57:31.0
      5 3274667 Fossie, Marvin               DL    NULL NULL NULL 2025-04-16 17:57:31.0
      6 3316329 Briones, Alfred              DL    NULL NULL NULL 2025-04-16 17:57:31.0
      7 3316423 Latchford, Dolores           DL    NULL NULL NULL 2025-04-16 17:57:31.0
      8 3266425 Parker, Karen                A     NULL NULL NULL 2025-04-16 17:57:31.0
      9 3306383 Aimers Patrick               A     NULL NULL NULL 2025-04-16 17:57:31.0
     10 3306383 Linda & Patrick              A     NULL NULL NULL 2025-04-16 17:57:31.0
     11 3273922 Walker, Gail                 A     NULL NULL NULL 2025-04-16 17:57:31.0
     12 3318172 Lawrence, Debra              A     NULL NULL NULL 2025-04-16 17:57:31.0
     13 3278835 Burton, Connie               A     NULL NULL NULL 2025-04-16 17:57:31.0
     14 3282257 Crews, Malinda               A     NULL NULL NULL 2025-04-16 17:57:31.0
     15 3336440 Bolick, Sharon               A     NULL NULL NULL 2025-04-16 17:57:31.0

*/
------------------------------------------------------------------------------------------------------------
-- Check by UNION 
------------------------------------------------------------------------------------------------------------
--PersonID check ,,, personcognitosub_j 
------------------------------------------------------------------------------------------------------------
select 
	P.SEQNUM, P.Loan as "Loan#", P.PID as "PersonID", 
	T.PERSONID, T.SUBID "ID", T.ENTRY_TIMESTAMP, P.HDT, P.PRB
	, 
	case 
	when COALESCE(cast(T.SUBID as varchar(100)), '') = ''
	then 'no account data found in DB2 personcognitosub_j table' 
	else '' 
	end as "*Note"	
from DATAUPDT.UpdtBP P
left outer join entity.personcognitosub_j T
on P.PiD = T.personid 
--order by P.SeqNum
--for read only with ur;
------------------------------------------------------------------------------------------------------------
UNION -- PersonID check ,,, PERSONAWSPOOLID_J
------------------------------------------------------------------------------------------------------------
select 
	P.SEQNUM, P.Loan as "Loan#", P.PID as "PersonID", 
	T.PERSONID,	T.IDENTITYPOOLID "ID", T.ENTRY_TIMESTAMP, P.HDT, P.PRB
	, 
	case 
	when COALESCE(cast(T.IDENTITYPOOLID as varchar(100)), '') = ''
	then 'no account data found in DB2 PERSONAWSPOOLID_J table' 
	else '' 
	end as "*Note"	
from DATAUPDT.UpdtBP P
left outer join entity.PERSONAWSPOOLID_J T
on P.PiD = T.personid 

order by PRB, SeqNum
for read only with ur;
--
-- SEQNUM Loan#   PersonID PERSONID ID   ENTRY_TIMESTAMP HDT    PRB    *Note
-- ------ ------- -------- -------- ---- --------------- ------ ------ -----------------------------------------------------
--      1 3261277   570690     NULL NULL NULL            176572 176606 no account data found in DB2 PERSONAWSPOOLID_J table
--      1 3261277   570690     NULL NULL NULL            176572 176606 no account data found in DB2 personcognitosub_j table
--      2 1260035   193484     NULL NULL NULL            176590 176606 no account data found in DB2 PERSONAWSPOOLID_J table
--      2 1260035   193484     NULL NULL NULL            176590 176606 no account data found in DB2 personcognitosub_j table
--      3 3333421   642822     NULL NULL NULL            176593 176606 no account data found in DB2 PERSONAWSPOOLID_J table
--      3 3333421   642822     NULL NULL NULL            176593 176606 no account data found in DB2 personcognitosub_j table
--      4 3337238   646638     NULL NULL NULL            176601 176606 no account data found in DB2 PERSONAWSPOOLID_J table
--      4 3337238   646638     NULL NULL NULL            176601 176606 no account data found in DB2 personcognitosub_j table
--      5 3326034   635440     NULL NULL NULL            176604 176606 no account data found in DB2 PERSONAWSPOOLID_J table
--      5 3326034   635440     NULL NULL NULL            176604 176606 no account data found in DB2 personcognitosub_j table
--      6 3196850   506264     NULL NULL NULL            176605 176606 no account data found in DB2 PERSONAWSPOOLID_J table
--      6 3196850   506264     NULL NULL NULL            176605 176606 no account data found in DB2 personcognitosub_j table
--      7 3248161   557574     NULL NULL NULL            176579 176606 no account data found in DB2 PERSONAWSPOOLID_J table
--      7 3248161   557574     NULL NULL NULL            176579 176606 no account data found in DB2 personcognitosub_j table

--------------------------------------------------------
-- eof
--------------------------------------------------------

/* place onthe top
-- Store backup
--	DROP TABLE DATAUPDT.HDTBP_DeletedPersonID;

	create table DATAUPDT.HDTBP_DeletedPersonID 
	(  
		PRB		 integer,
		SeqNum   integer,
		Loan     integer,  -- given loan number
		PID      integer,
		HDT      integer,
		LoanNum  integer,  -- loan number associated with Given PersonID

		PERSONID integer, 
		SUBID 	 varchar(55 OCTETS), 
		BORROWERTYPE integer, 
		ENTRY_TIMESTAMP varchar(100),
		MyNote  varchar(100),
		Done	timestamp
	) COMPRESS YES ADAPTIVE IN DATAUPDT_TS16;
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTBP_DeletedPersonID  TO group db2_ast;
    select * from DATAUPDT.HDTBP_DeletedPersonID;

----------------------------
DELETE from DATAUPDT.HDTBP_DeletedPersonID;


-- Backup
INSERT INTO DATAUPDT.HDTBP_DeletedPersonID
select 
	P.PRB, P.SEQNUM, 
	P.Loan as "Loan# Submitted", 
	P.PID as "PersonID", 
	P.HDT,
	X.LOANNUMBER as "Loan# Associated w/PersonID", 
	X.PERSONID, T.SUBID, x.BORROWERTYPE, T.ENTRY_TIMESTAMP, 
	case 
	when COALESCE(cast(T.SUBID as varchar(100)), '') = ''
	then 'no account data found in DB2 table' 
	else '' 
	end as "*Note",
	CURRENT_TIMESTAMP (0) as "Done"
from DATAUPDT.UpdtBP P
inner join entity.borrowerloannumber_j X
	on P.PID =  X.PERSONID
left outer join entity.personcognitosub_j T
	on X.personid = T.personid 
order by P.SeqNum
with ur;

select 
--		*
	PRB		 ,
	SeqNum   ,
	Loan     as "Loan# Submitted",  -- given loan number
	LoanNum   as "Loan# Associated w/PersonID",  -- loan number associated with Given PersonID
	PERSONID , 
	SUBID 	 , 
	BORROWERTYPE , 
	ENTRY_TIMESTAMP ,
	MyNote  
	,
	Done	
from DATAUPDT.HDTBP_DeletedPersonID P
order by PRB, SeqNum
;

********************************************************************************************** */



--------------------------------------------------------
-- extra check on loan whose borr has multiple loan numbers
--------------------------------------------------------
select 
	P.SEQNUM, P.HDT,
	P.Loan, P.PID, 
	X.LOANNUMBER,  X.PERSONID , T.SUBID, T.ENTRY_TIMESTAMP, x.BORROWERTYPE
	,
	X1.LoanNumber as "X1_LOANNUMBER", X1.PERSONID as "X1_PERSONID", T1.SUBID as "T1_SUBID", T1.ENTRY_TIMESTAMP as "T1_ENTRY_TIMESTAMP", x1.BORROWERTYPE as "x1_BORROWERTYPE"

from DATAUPDT.UpdtBP P

inner join entity.borrowerloannumber_j X
	on P.Loan = X.loannumber
--	and P.PID =  X.PERSONID

inner join entity.borrowerloannumber_j X1
	on P.PID =  X1.PERSONID

left outer join entity.personcognitosub_j T
	on X.personid = T.personid 

left outer join entity.personcognitosub_j T1
	on X1.personid = T1.personid 

order by P.SeqNum
for read only with ur;


/*
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
-- Mahesh way
---------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- update --
------------
--    3 1306958    1306958  245137  2090573 c50ecd4f-e5c5-4307-a419-b3ac687dc20e 2022-02-09 17:03:45.633664            2
--
delete from entity.personcognitosub_j where personid in 
(select personid from entity.borrowerloannumber_j where loannumber in (3120480));

delete from entity.PERSONAWSPOOLID_J where personid in 
(select personid from entity.borrowerloannumber_j where loannumber in (3120480));
*/

---------------------------------------------------------------------------------------------------------------

with param (SeqNum, Loan) as
(values

(1, 1306958)

)
select 
--	P.SeqNum, P.Loan,
--	X.loannumber, X.personid as "X_personID",  T.personid as "T_PersonID" , '-->', 
	P.SEQNUM, X.LOANNUMBER, X.PERSONID, T.SUBID, T.ENTRY_TIMESTAMP
	
from Param P

inner join entity.borrowerloannumber_j X
	on P.Loan = X.loannumber

inner join entity.personcognitosub_j T
	on X.personid = T.personid 
order by P.SeqNum
for read only with ur;

-- SEQNUM LOANNUMBER PERSONID SUBID                                ENTRY_TIMESTAMP
-- ------ ---------- -------- ------------------------------------ --------------------------
--      1    1306958  2090573 c50ecd4f-e5c5-4307-a419-b3ac687dc20e 2022-02-09 17:03:45.633664

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

with param (SeqNum, Loan) as
(values

(1, 1306958)
)
select 
--	P.SeqNum, P.Loan,
--	X.loannumber, X.personid as "X_personID",  T.personid as "T_PersonID" , '-->', 
	P.SEQNUM, X.LOANNUMBER, X.PERSONID, T.IDENTITYPOOLID, T.ENTRY_TIMESTAMP

from Param P

inner join entity.borrowerloannumber_j X
	on P.Loan = X.loannumber

inner join entity.PERSONAWSPOOLID_J T
	on X.personid = T.personid 
order by P.SeqNum
for read only with ur;

-- SEQNUM LOANNUMBER PERSONID IDENTITYPOOLID                                 ENTRY_TIMESTAMP
-- ------ ---------- -------- ---------------------------------------------- --------------------------
--      1    1306958  2090573 us-east-1:001c6c84-37ae-485c-ab3c-6886ea1b951d 2022-02-09 17:05:09.812582

-----------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Mahesh way with PersonID
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------

with param (SeqNum, PiD) as
(values
(100, 259159)
)
select 
	P.SEQNUM, T.PERSONID, T.SUBID, T.ENTRY_TIMESTAMP
	
from Param P
inner join entity.personcognitosub_j T
on P.PiD = T.personid 
order by P.SeqNum
for read only with ur;

--delete from entity.PERSONAWSPOOLID_J where personid in (436261,447187,421443,261832)
with param (SeqNum, PiD) as
(values
(100, 259159)
)
select 
--	P.SeqNum, P.Loan,
--	X.loannumber, X.personid as "X_personID",  T.personid as "T_PersonID" , '-->', 
	P.SEQNUM, T.PERSONID, T.IDENTITYPOOLID, T.ENTRY_TIMESTAMP
	
from Param P
inner join entity.PERSONAWSPOOLID_J T
on P.PiD = T.personid 
order by P.SeqNum
for read only with ur;

