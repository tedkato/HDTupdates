/* 
20221010

C:\Users\ted.kato\Documents\HDTUpdtNotes_112099.csv
HDT112099_tblPropertyDescription_DwellingType.sql

INCIDENT #112099
Michelle Rymerson
Manager, Insurance Monitoring
Other
Created: Oct 08, 2022 at 12:18 AM by Michelle Rymerson
We are moving to a new insurance platform and these loans need the property type updated to CDO2

HDT for CDO2 Propert...xlsx

* use DATAUPDT.HDTBOR_COBOR_Gender

--*--
Dwelling Type updated for 547 loans.  1 loan (1314300) appears twice in the list of 548 loans.  Pending verification.
*/

-- ------ ------ ------------- ------- -------- ------------------------ --------------- ------ ----------------- ------------------------ ----------------------- ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
-- ------ ------ ------------- ------- -------- ------------------------ --------------- ------ ----------------- ------------------------ ----------------------- ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--HDTs


/*
20250513
189724	Ted Kato	Dwelling Type	Jordann Greene	Low	5/13/2025 9:08
="(" & E2 & ", 189724, 'Jennifer Dees', " & A2 & ", '" & trim(D2) & "'),"

--*--
6 loans updated. Peer review pending.
*/

-- ------ ------ ------------- ------- -------- ------------------------ --------------- ------ ----------------- ------------------------ ----------------------- ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
-- ------ ------ ------------- ------- -------- ------------------------ --------------- ------ ----------------- ------------------------ ----------------------- ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
select 
	distinct TP.CHRDWELLINGTYPE
	from celink.tblPropertyDescription TP
	order by TP.CHRDWELLINGTYPE
for read only with ur;

-- CHRDWELLINGTYPE
-- ---------------
-- 
-- 2-4FAM
-- CDO
-- CDO2
-- COOP
-- MANU
-- OTH
-- PUD
-- PUD2
-- SFD


-- ------ ------ ------------- ------- -------- ------------------------ --------------- ------ ----------------- ------------------------ ----------------------- ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
with MySrc (SeqNum, HDTNum, Requester, Loan, NewDwell) as
(VALUES

(1, 189724, 'Jennifer Dees', 3358694, 'COOP'),
(2, 189724, 'Jennifer Dees', 3359364, 'COOP'),
(3, 189724, 'Jennifer Dees', 3360902, 'COOP'),
(4, 189724, 'Jennifer Dees', 3360905, 'COOP'),
(5, 189724, 'Jennifer Dees', 3360966, 'COOP'),
(6, 189724, 'Jennifer Dees', 3362024, 'COOP')

)
select 
	P.*,
	TP.INTSUBSERVICERLOANNUMBER ,
	TP.CHRDWELLINGTYPE,
	'--*-->', TP.*
from MySrc P
inner join celink.tblPropertyDescription TP
on P.Loan =  TP.INTSUBSERVICERLOANNUMBER
for read only with ur;

-- SEQNUM HDTNUM REQUESTER     LOAN    NEWDWELL INTSUBSERVICERLOANNUMBER CHRDWELLINGTYPE 8      IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS             CHRPROPCITY CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- ------ ------ ------------- ------- -------- ------------------------ --------------- ------ ----------------- ------------------------ -------------------------- ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--      1 189724 Jennifer Dees 3358694 COOP                    3358694.0 OTH             --*-->            833129                3358694.0 100 W 94TH STREET 24B      NEW YORK    NY           10025          OTH                            1 NULL               NULL               NULL              NULL                  NULL                       2024-12-07       NULL               NULL                        0                     0                         0              0              940000.0 NULL                                  0 NULL                              0 NULL                                 0 36061                              NULL       4668088
--      2 189724 Jennifer Dees 3359364 COOP                    3359364.0 OTH             --*-->            833799                3359364.0 130 W 17th Street Apt 7S   New York    NY           10011          OTH                            1 NULL               NULL               NULL              NULL                  NULL                       2025-01-27       NULL               NULL                        0                     0                         0              0             1197900.0 NULL                                  0 NULL                              0 NULL                                 0 36061                              NULL       4668757
--      3 189724 Jennifer Dees 3360902 COOP                    3360902.0 OTH             --*-->            835337                3360902.0 215 E 96th STREET Unit 30A NEW YORK    NY           10128          OTH                            1 NULL               NULL               NULL              NULL                  NULL                       2025-01-25       NULL               NULL                        0                     0                         0              0              954955.0 NULL                                  0 NULL                              0 NULL                                 0 36061                              NULL       4670295
--      4 189724 Jennifer Dees 3360905 COOP                    3360905.0 OTH             --*-->            835340                3360905.0 153 Berkeley Pl Apt 2      Brooklyn    NY           112173781      OTH                            1 NULL               NULL               NULL              NULL                  NULL                       2025-01-17       NULL               NULL                        0                     0                         0              0             1370000.0 NULL                                  0 NULL                              0 NULL                                 0 36047                              NULL       4670298
--      5 189724 Jennifer Dees 3360966 COOP                    3360966.0 OTH             --*-->            835407                3360966.0 111 E 85th STREET Apt 5G   NEW YORK    NY           10028          OTH                            1 NULL               NULL               NULL              NULL                  NULL                       2024-10-16       NULL               NULL                        0                     0                         0              0             1600000.0 NULL                                  0 NULL                              0 NULL                                 0 36061                              NULL       4670358
--      6 189724 Jennifer Dees 3362024 COOP                    3362024.0 OTH             --*-->            836465                3362024.0 32 CATHEDRAL AVENUE APT 3F HEMPSTEAD   NY           11550          OTH                            1 NULL               NULL               NULL              NULL                  NULL                       2025-02-18       NULL               NULL                        0                     0                         0              0              181000.0 NULL                                  0 NULL                              0 NULL                                 0 36059                              NULL       4671416

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------
-- table use ... DATAUPDT.HDTBOR_COBOR_Gender
select * from DATAUPDT.HDTBOR_COBOR_Gender;

-- SEQNUM, 
-- HDTNUM, 
-- REQUESTER, 
-- LOAN,    
-- BORORCOB, -- What To Update -- 'DwellType'
-- BAADGEN,  -- CurType 
-- GOODGEN,  -- NewType
-- CURRGEN,  -- CHRDWELLINGTYPE 
-- CHANGEREQUIRED
 
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

with MySrc (SeqNum, HDTNum, Requester, Loan, Good) as
(VALUES

(1, 189724, 'Jennifer Dees', 3358694, 'COOP'),
(2, 189724, 'Jennifer Dees', 3359364, 'COOP'),
(3, 189724, 'Jennifer Dees', 3360902, 'COOP'),
(4, 189724, 'Jennifer Dees', 3360905, 'COOP'),
(5, 189724, 'Jennifer Dees', 3360966, 'COOP'),
(6, 189724, 'Jennifer Dees', 3362024, 'COOP')

)
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, 
	'Dwelling Type' 	as "WhatToUpdate",
	T.CHRDWELLINGTYPE	as "Baad",
	P.Good				as "Good",
	T.CHRDWELLINGTYPE	as "*CHRDWELLINGTYPE*",
	case when P.Good = T.CHRDWELLINGTYPE then 0 else -1 end as "ChangeRequired" 

--	'--*-->', T.*
from MySrc P
inner join celink.tblPropertyDescription T
on P.Loan =  T.INTSUBSERVICERLOANNUMBER
with ur;

	select loan, count(*) from DATAUPDT.HDTBor_CoBor_Gender group by loan having count(*) > 1; -- 1314300
	select * from DATAUPDT.HDTBor_CoBor_Gender order by SeqNum;
	select * from DATAUPDT.HDTBor_CoBor_Gender where BorORCoB = 'Dwelling Type' and ChangeRequired  = -1 order by SeqNum;
	select * from DATAUPDT.HDTBor_CoBor_Gender where BorORCoB = 'Dwelling Type' and ChangeRequired  = 0 order by SeqNum;

	-- SEQNUM HDTNUM REQUESTER     LOAN    BORORCOB      BAADGEN GOODGEN CURRGEN CHANGEREQUIRED
	-- ------ ------ ------------- ------- ------------- ------- ------- ------- --------------
	--      1 189724 Jennifer Dees 3358694 Dwelling Type OTH     COOP    OTH                 -1
	--      2 189724 Jennifer Dees 3359364 Dwelling Type OTH     COOP    OTH                 -1
	--      3 189724 Jennifer Dees 3360902 Dwelling Type OTH     COOP    OTH                 -1
	--      4 189724 Jennifer Dees 3360905 Dwelling Type OTH     COOP    OTH                 -1
	--      5 189724 Jennifer Dees 3360966 Dwelling Type OTH     COOP    OTH                 -1
	--      6 189724 Jennifer Dees 3362024 Dwelling Type OTH     COOP    OTH                 -1


---------------------------------------------------------------------------------------------------------------------
-- note with parameter ... keep the resylt for bulk note upload !!!!!!!!!!!!!!!!!!!!!!!!
select 
	P.SeqNum as "SeqNum", 
	P.Loan as "Loan Number",
	'N' as "Priority (Y/N)", 
	''  as "Note Step Number" , 
	''  as "Step Date Completed (YYYY-MM-DD)",
	'Per HDT ' || P.HDTNum || '(' || P.Requester || ') ' || P.BorORCoB || ' updated from ' || coalesce(cast(P.CurrGen as varchar), '<Blank>') || ' to ' || P.GoodGen || '.'
from 
	DATAUPDT.HDTBor_CoBor_Gender P 
--inner join celink.tblBorrower X
--	on P.Loan = X.INTSUBSERVICERLOANNUMBER
where P.BorORCoB = 'Dwelling Type' 
and   ChangeRequired = -1
order by P.SeqNum
for read only with ur;

-- SeqNum Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) 6
-- ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------
--      1     3358694 N                                                                Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP.
--      2     3359364 N                                                                Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP.
--      3     3360902 N                                                                Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP.
--      4     3360905 N                                                                Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP.
--      5     3360966 N                                                                Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP.
--      6     3362024 N                                                                Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP.

---------------------------------------------------------------------------------------------------------------------
-- Validation before execution
--select 
--	P.SeqNum, P.HDTNum, P.Requester,
--	P.BORORCOB as "What", 
--	P.Loan, X.INTSUBSERVICERLOANNUMBER,
--	P.BAADGEN  as "BAADGEN as Baad", 
--	P.GOODGEN  as "GOODGEN as Good",
--	P.CURRGEN  as "CURRGEN as Curr", 	X.CHRDWELLINGTYPE, 
--	P.CHANGEREQUIRED
--from 
--	DATAUPDT.HDTBor_CoBor_Gender P 
--inner join celink.tblPropertyDescription X
--	on P.Loan =  X.INTSUBSERVICERLOANNUMBER
----where P.BorORCoB = 'Dwelling Type' 
----and   P.ChangeRequired = -1
--
--where X.INTSUBSERVICERLOANNUMBER in -- not in #112099
--(3238830
--,3276150
--,3284900
--,3285927
--)
--Order by P.SeqNum
--for read only with ur
--;

select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.BORORCOB as "What", 
	P.Loan, X.INTSUBSERVICERLOANNUMBER,
	P.BAADGEN  as "BAADGEN as Baad", 
	P.GOODGEN  as "GOODGEN as Good",
	P.CURRGEN  as "CURRGEN as Curr", 	X.CHRDWELLINGTYPE, 
	P.CHANGEREQUIRED
from 
	DATAUPDT.HDTBor_CoBor_Gender P 
inner join celink.tblPropertyDescription X
	on P.Loan =  X.INTSUBSERVICERLOANNUMBER
where P.BorORCoB = 'Dwelling Type' 
and   P.ChangeRequired = -1
Order by P.SeqNum
for read only with ur
;

/*
 SEQNUM HDTNUM REQUESTER     What          LOAN    INTSUBSERVICERLOANNUMBER BAADGEN as Baad GOODGEN as Good CURRGEN as Curr CHRDWELLINGTYPE CHANGEREQUIRED
 ------ ------ ------------- ------------- ------- ------------------------ --------------- --------------- --------------- --------------- --------------
      1 189724 Jennifer Dees Dwelling Type 3358694                3358694.0 OTH             COOP            OTH             OTH                         -1
      2 189724 Jennifer Dees Dwelling Type 3359364                3359364.0 OTH             COOP            OTH             OTH                         -1
      3 189724 Jennifer Dees Dwelling Type 3360902                3360902.0 OTH             COOP            OTH             OTH                         -1
      4 189724 Jennifer Dees Dwelling Type 3360905                3360905.0 OTH             COOP            OTH             OTH                         -1
      5 189724 Jennifer Dees Dwelling Type 3360966                3360966.0 OTH             COOP            OTH             OTH                         -1
      6 189724 Jennifer Dees Dwelling Type 3362024                3362024.0 OTH             COOP            OTH             OTH                         -1

-- after
 SEQNUM HDTNUM REQUESTER     What          LOAN    INTSUBSERVICERLOANNUMBER BAADGEN as Baad GOODGEN as Good CURRGEN as Curr CHRDWELLINGTYPE CHANGEREQUIRED
 ------ ------ ------------- ------------- ------- ------------------------ --------------- --------------- --------------- --------------- --------------
      1 189724 Jennifer Dees Dwelling Type 3358694                3358694.0 OTH             COOP            OTH             COOP                        -1
      2 189724 Jennifer Dees Dwelling Type 3359364                3359364.0 OTH             COOP            OTH             COOP                        -1
      3 189724 Jennifer Dees Dwelling Type 3360902                3360902.0 OTH             COOP            OTH             COOP                        -1
      4 189724 Jennifer Dees Dwelling Type 3360905                3360905.0 OTH             COOP            OTH             COOP                        -1
      5 189724 Jennifer Dees Dwelling Type 3360966                3360966.0 OTH             COOP            OTH             COOP                        -1
      6 189724 Jennifer Dees Dwelling Type 3362024                3362024.0 OTH             COOP            OTH             COOP                        -1

*/
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
-- updateee where P.ChangeRequired = -1 and  P.BorORCoB = 'Dwelling Type' 
MERGE INTO celink.tblPropertyDescription TT
USING 
(
	select 
		P.SeqNum, P.HDTNum, P.Requester,
		P.BORORCOB as What, 
		P.Loan, X.INTSUBSERVICERLOANNUMBER,
		P.BAADGEN  as BAADGENasBaad, 
		P.GOODGEN  as GOODGENasGood,
		P.CURRGEN  as CURRGENasCurr, 	X.CHRDWELLINGTYPE, 
		P.CHANGEREQUIRED
	from 
		DATAUPDT.HDTBor_CoBor_Gender P 
	inner join celink.tblPropertyDescription X
		on P.Loan = X.INTSUBSERVICERLOANNUMBER
	where P.ChangeRequired = -1 
	and   P.BorORCoB ='Dwelling Type' 
	Order by P.SeqNum

) UY
ON UY.Loan = TT.INTSUBSERVICERLOANNUMBER 
WHEN MATCHED THEN UPDATE 
SET 
TT.CHRDWELLINGTYPE = UY.GOODGENasGood
;

-- SEQNUM HDTNUM REQUESTER     WHAT          LOAN    INTSUBSERVICERLOANNUMBER BAADGENASBAAD GOODGENASGOOD CURRGENASCURR CHRDWELLINGTYPE CHANGEREQUIRED
-- ------ ------ ------------- ------------- ------- ------------------------ ------------- ------------- ------------- --------------- --------------
--      1 189724 Jennifer Dees Dwelling Type 3358694                3358694.0 OTH           COOP          OTH           OTH                         -1
--      2 189724 Jennifer Dees Dwelling Type 3359364                3359364.0 OTH           COOP          OTH           OTH                         -1
--      3 189724 Jennifer Dees Dwelling Type 3360902                3360902.0 OTH           COOP          OTH           OTH                         -1
--      4 189724 Jennifer Dees Dwelling Type 3360905                3360905.0 OTH           COOP          OTH           OTH                         -1
--      5 189724 Jennifer Dees Dwelling Type 3360966                3360966.0 OTH           COOP          OTH           OTH                         -1
--      6 189724 Jennifer Dees Dwelling Type 3362024                3362024.0 OTH           COOP          OTH           OTH                         -1

-------------------------------------------------------------------------------------------------------------------------------------
---- Notes update
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

select 
--	P.SeqNum as "SeqNum", 
	P.Loan as "Loan Number",
	'Per HDT ' || P.HDTNum || '(' || P.Requester || ') ' || P.BorORCoB || ' updated from ' || coalesce(cast(P.CurrGen as varchar), '<Blank>') || ' to ' || P.GoodGen || '.'
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from 
	DATAUPDT.HDTBor_CoBor_Gender P 
--inner join celink.tblBorrower X
--	on P.Loan = X.INTSUBSERVICERLOANNUMBER
where P.BorORCoB = 'Dwelling Type' 
and   ChangeRequired = -1
order by P.SeqNum
with ur;   

-- Loan Number 2                                                                     3                        4     5 6
-- ----------- --------------------------------------------------------------------- ------------------------ ----- - -
--     3358694 Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP. 2025-05-13 09:47:16.9808 tkato 0 0
--     3359364 Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP. 2025-05-13 09:47:16.9808 tkato 0 0
--     3360902 Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP. 2025-05-13 09:47:16.9808 tkato 0 0
--     3360905 Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP. 2025-05-13 09:47:16.9808 tkato 0 0
--     3360966 Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP. 2025-05-13 09:47:16.9808 tkato 0 0
--     3362024 Per HDT 189724(Jennifer Dees) Dwelling Type updated from OTH to COOP. 2025-05-13 09:47:16.9808 tkato 0 0



   