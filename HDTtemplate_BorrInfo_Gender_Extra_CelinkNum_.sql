-- 20220524 checked
/*
This is to handle gender change with given Celink Loan number.
As shown below, Lisa send request with Celink Loan instead of GNMA number.

--
From: Lisa Stackpoole <Lisa.Stackpoole@celink.com> 
Sent: Friday, April 1, 2022 3:14 PM
To: Amy Morrill <Amy.Morrill@celink.com>; Cyndie King <Cyndie.King@celink.com>; Lindsay Ledger <Lindsay.Ledger@celink.com>; Mounika Gampa <Mounika.Gampa@celink.com>; Padmaja Geddada <Padmaja.Geddada@celink.com>; Prashanth Ramamoorthy <Prashanth.Ramamoorthy@celink.com>; Ted Kato <Ted.Kato@celink.com>; Zia Mohideen <Zia.Mohideen@celink.com>
Subject: TMAC GNMA Correction 3158584

Please update the attached in yellow – Parse payment and rerun GNMA EOM 

Also please update the following genders:

Servicer Loan ID	Borrower_Gender 	Co-Borrower_Gender_1 
1396212				M	
3136994				F	
1400029									M
*/

/* 20220401 ... MyVal format
A					B	C					D
Servicer Loan ID		Borrower_Gender		SeqNum
1396212				-	M					1
3136994				-	F					2
= "(" & D2 & ", 999999, 'EOM', " & A2 & ", 'Borrower', '" & B2 & "', '" & C2 &"'),"
(SeqNum, HDTNum, Requester, Loan, BorORCoB, BaadGen, GoodGen) 
*/


/*
[ID:0193250]
Borrower Gender

2 loans updated.  Below 3 loans already had the requested value in olace.  Peer review pending. 
*1128721, 3119711, 3179226

 SEQNUM HDTNUM REQUESTER LOAN    BORORCOB BAADGEN GOODGEN CURRGEN CHANGEREQUIRED
 ------ ------ --------- ------- -------- ------- ------- ------- --------------
      1 193250 Amy       1128721 Borrower -       F       F                    0
      2 193250 Amy       1174628 Borrower -       F       -                   -1
      3 193250 Amy       1263221 Borrower -       M       -                   -1
      4 193250 Amy       3119711 Borrower -       F       F                    0
      5 193250 Amy       3179226 Borrower -       M       M                    0
*/

-------------
------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/* -- DATAUPDT Table for  
create table DATAUPDT.HDTBor_CoBor_Gender   
	(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,

	Loan integer,
	BorORCoB  varchar(20),
	
	BaadGen   varchar(20) default NULL,
	GoodGen   varchar(20),
	CurrGen   varchar(20),
	
	ChangeRequired integer
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTBor_CoBor_Gender  TO group db2_ast;
	
-- drop table DATAUPDT.HDTBor_CoBor_Gender;
 select * from DATAUPDT.HDTBor_CoBor_Gender;
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTBor_CoBor_Gender;

-- insert
INSERT INTO DATAUPDT.HDTBor_CoBor_Gender
(
	SeqNum, HDTNum, Requester,
	Loan, 
	BorORCoB,

	BaadGen,
	GoodGen,
	CurrGen,
	
	ChangeRequired
)

with param (SeqNum, HDTNum, Requester, Loan, BorORCoB, BaadGen, GoodGen) as 
(values
(1, 0193250, 'Amy', 1128721,  'Borrower', '-', 'F'),
(2, 0193250, 'Amy', 1174628,  'Borrower', '-', 'F'),
(3, 0193250, 'Amy', 1263221,  'Borrower', '-', 'M'),
(4, 0193250, 'Amy', 3119711,  'Borrower', '-', 'F'),
(5, 0193250, 'Amy', 3179226,  'Borrower', '-', 'M')
)
select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan, -- -- X.INTSUBSERVICERLOANNUMBER,
 	P.BorORCoB,
 	P.BaadGen, P.GoodGen, X.CHRGENDER as "CurrGen",
	case when P.GoodGen = X.CHRGENDER then 0 else -1 end as "ChangeRequired" 
	--, X.* 
from Param P
inner join celink.tblBorrower X
	on P.Loan = X.INTSUBSERVICERLOANNUMBER
Order by P.SeqNum
with ur;

	select * from DATAUPDT.HDTBor_CoBor_Gender order by SeqNum;
	select * from DATAUPDT.HDTBor_CoBor_Gender where BorORCoB = 'Borrower' order by SeqNum;
	-- SEQNUM HDTNUM REQUESTER LOAN    BORORCOB BAADGEN GOODGEN CURRGEN CHANGEREQUIRED
	-- ------ ------ --------- ------- -------- ------- ------- ------- --------------
	--      1 193250 Amy       1128721 Borrower -       F       F                    0
	--      2 193250 Amy       1174628 Borrower -       F       -                   -1
	--      3 193250 Amy       1263221 Borrower -       M       -                   -1
	--      4 193250 Amy       3119711 Borrower -       F       F                    0
	--      5 193250 Amy       3179226 Borrower -       M       M                    0

---------------------------------------------------------------------------------------------------------------------
-- note with parameter ... keep the result for bulk note upload !!!!!!!!!!!!!!!!!!!!!!!!
select 
	P.SeqNum as "SeqNum", 
	P.Loan as "Loan Number",
	'N' as "Priority (Y/N)", 
	''  as "Note Step Number" , 
	''  as "Step Date Completed (YYYY-MM-DD)",
	'Per HDT ' || P.HDTNum || '(' || P.Requester || ') ' || P.BorORCoB || ' Gender updated from ' || coalesce(cast(P.CurrGen as varchar), '<Blank>') || ' to ' || P.GoodGen || '.'
from 
	DATAUPDT.HDTBor_CoBor_Gender P 
--inner join celink.tblBorrower X
--	on P.Loan = X.INTSUBSERVICERLOANNUMBER
where P.BorORCoB = 'Borrower'
and   ChangeRequired = -1
order by P.SeqNum
for read only with ur;

-- SeqNum Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) 6
-- ------ ----------- -------------- ---------------- -------------------------------- --------------------------------------------------------
--      2     1174628 N                                                                Per HDT 193250(Amy) Borrower Gender updated from - to F.
--      3     1263221 N                                                                Per HDT 193250(Amy) Borrower Gender updated from - to M.

----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, NoteStep) as
(values
(1174628, 'Per HDT 193250 Borrower Gender updated from - to F.', CURRENT_TIMESTAMP,	'tkato',0,0),
(1263221, 'Per HDT 193250 Borrower Gender updated from - to M.', CURRENT_TIMESTAMP,	'tkato',0,0)
) 
select * from P
;
-- LOAN    NOTE                                                TIMES                      WHO   PRIO NOTESTEP
-- ------- --------------------------------------------------- -------------------------- ----- ---- --------
-- 1174628 Per HDT 193250 Borrower Gender updated from - to F. 2025-06-25 11:00:08.339953 tkato    0        0
-- 1263221 Per HDT 193250 Borrower Gender updated from - to M. 2025-06-25 11:00:08.339953 tkato    0        0

---------------------------------------------------------------------------------------------------------------------
-- Validation before execution
-- -- -- UPDATE celink.tblBorrower set CHRGENDER = 'M' where INTSUBSERVICERLOANNUMBER = 1339839;
select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan, X.INTSUBSERVICERLOANNUMBER,
 	P.BorORCoB,
 	P.CurrGen, P.GoodGen, X.CHRGENDER,
	P.ChangeRequired 
	-- , X.*
from 
	DATAUPDT.HDTBor_CoBor_Gender P 
inner join celink.tblBorrower X
	on P.Loan = X.INTSUBSERVICERLOANNUMBER

where P.BorORCoB = 'Borrower'
and   P.ChangeRequired = -1
Order by P.SeqNum
for read only with ur
;
-- SEQNUM HDTNUM REQUESTER LOAN    INTSUBSERVICERLOANNUMBER BORORCOB CURRGEN GOODGEN CHRGENDER CHANGEREQUIRED
-- ------ ------ --------- ------- ------------------------ -------- ------- ------- --------- --------------
--      2 193250 Amy       1174628                1174628.0 Borrower -       F       -                     -1
--      3 193250 Amy       1263221                1263221.0 Borrower -       M       -                     -1

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
-- update where P.ChangeRequired = -1 and  P.BorORCoB = 'Co-Borrower'
MERGE INTO celink.tblBorrower TT
USING 
(
	select 
		P.SeqNum, P.HDTNum, P.Requester,
		P.Loan, X.INTSUBSERVICERLOANNUMBER,
	 	P.BorORCoB,
	 	P.CurrGen, P.GoodGen, X.CHRGENDER,
		P.ChangeRequired 
	from DATAUPDT.HDTBor_CoBor_Gender P 
	inner join celink.tblBorrower X
	on P.Loan = X.INTSUBSERVICERLOANNUMBER
	where P.ChangeRequired = -1 
	and   P.BorORCoB = 'Borrower'
	Order by P.SeqNum
) UY
ON UY.Loan = TT.INTSUBSERVICERLOANNUMBER 
WHEN MATCHED THEN UPDATE 
SET 
TT.CHRGENDER = UY.GoodGen
;

-- SEQNUM HDTNUM REQUESTER LOAN    INTSUBSERVICERLOANNUMBER BORORCOB CURRGEN GOODGEN CHRGENDER CHANGEREQUIRED
-- ------ ------ --------- ------- ------------------------ -------- ------- ------- --------- --------------
--      2 193250 Amy       1174628                1174628.0 Borrower -       F       -                     -1
--      3 193250 Amy       1263221                1263221.0 Borrower -       M       -                     -1


------------------------------------------------------------------------------------------------------------------
-- validation after execution
-- -- -- UPDATE celink.tblBorrower set CHRGENDER = 'M' where INTSUBSERVICERLOANNUMBER = 1339839;
select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan, X.INTSUBSERVICERLOANNUMBER,
 	P.BorORCoB,
 	P.CurrGen, P.GoodGen, X.CHRGENDER,
	P.ChangeRequired 
from 
	DATAUPDT.HDTBor_CoBor_Gender P 
inner join celink.tblBorrower X
	on P.Loan = X.INTSUBSERVICERLOANNUMBER

where P.BorORCoB = 'Borrower'
--and P.ChangeRequired = -1

Order by P.SeqNum
for read only with ur
;

--SEQNUM HDTNUM REQUESTER LOAN    INTSUBSERVICERLOANNUMBER BORORCOB CURRGEN GOODGEN CHRGENDER CHANGEREQUIRED
-- ------ ------ --------- ------- ------------------------ -------- ------- ------- --------- --------------
--      1 193250 Amy       1128721                1128721.0 Borrower F       F       F                      0
--      2 193250 Amy       1174628                1174628.0 Borrower -       F       F                     -1
--      3 193250 Amy       1263221                1263221.0 Borrower -       M       M                     -1
--      4 193250 Amy       3119711                3119711.0 Borrower F       F       F                      0
--      5 193250 Amy       3179226                3179226.0 Borrower M       M       M                      0
