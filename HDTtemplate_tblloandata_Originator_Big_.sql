
/*
20250825
[ID:0197644] Original Appraised Value Change 8/21/2025 6:27 PM Created by Jennifer Dees
--tk
Hi Jennifer,
I see the originator names are same under both "incorrect" and "correct" value columns from loan number 3371089 to the end of rows (108 laons).  I will update other loans' originator ( 41 loans)
--JD
Thank you, Ted.  They probably just sent the whole list that they reviewed.  Sorry, and thank you.
--*--
Hi Jennifer, Openning the backend database, I noticed the originator was "Mutual of Omaha Mortgage Inc." for all loans except loan 3372222 "ACCESS HOME LENDING LLC", which already has the desired name.
I went ahead and changed it as requested.  Please see attached for validation.
Peer review pending.  148 loans out of 149.  Loan 3372222 already set with desired originator.       
*/

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
delete DATAUPDT.HDToriginatorname_import;

---- DATAUPDT Table for  
--create table DATAUPDT.HDToriginatorname_import   
--	(
--	SeqNum integer,
--	Loan integer,
--	GoodName varchar (100) default NULL
--	)
--	COMPRESS YES ADAPTIVE
--	IN DATAUPDT_TS16;
--GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDToriginatorname_import  TO group db2_ast;
---- drop table DATAUPDT.HDToriginatorname_import;
select * from DATAUPDT.HDToriginatorname_import;

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- load !!
insert into DATAUPDT.HDToriginatorname_import 
with P(SeqNum, Loan, GoodName) as
(values

--> submitted 149 loans
(1, 3373127, 'American Financial Mortgage'),
(2, 3373313, 'American Financial Mortgage'),
(3, 3371139, 'United Pacific Realty'),
(4, 3372796, 'United Pacific Realty'),
(5, 3372870, 'United Pacific Realty'),
(6, 3371269, 'United Pacific Realty'),
(7, 3372218, 'United Pacific Realty'),
(8, 3373209, 'United Pacific Realty'),
(9, 3373116, 'Accelerated Funding'),
(10, 3371484, 'Equitable Mortgage & Realty'),
(11, 3371948, 'Equitable Mortgage & Realty'),
(12, 3372695, 'American Pacific Mortgage'),
(13, 3372905, 'American Pacific Mortgage'),
(14, 3373000, 'PrimeLending'),
(15, 3372818, 'PrimeLending'),
(16, 3371154, 'Wilmington Savings Fund'),
(17, 3372225, 'Wilmington Savings Fund'),
(18, 3373592, 'California Reverse Mortgage'),
(19, 3371095, 'Mountain State Financial Grp'),
(20, 3373299, 'The Equitable Mortgage Corp'),
(21, 3373011, 'Professional Mortgage Group'),
(22, 3370692, 'Province Mortgage Assoc'),
(23, 3373305, 'Carefree Retirement Funding'),
(24, 3371061, 'Community Mortgage Solutions'),
(25, 3370687, 'Barrett Financial Group'),
(26, 3372821, 'Barrett Financial Group'),
(27, 3372571, 'Barrett Financial Group'),
(28, 3371499, 'Barrett Financial Group'),
(29, 3372563, 'Barrett Financial Group'),
(30, 3373497, 'Barrett Financial Group'),
(31, 3371490, 'Barrett Financial Group'),
(32, 3373096, 'Barrett Financial Group'),
(33, 3373224, 'Cornerstone First Mortgage'),
(34, 3372797, 'First American Home Loans'),
(35, 3373090, 'First American Home Loans'),
(36, 3372997, 'First American Home Loans'),
(37, 3372463, 'First American Home Loans'),
(38, 3373474, 'First American Home Loans'),
(39, 3373600, 'GOLDEN YEARS MORTGAGE'),
(40, 3372907, 'Success Mortgage Partners'),
(41, 3372906, 'Success Mortgage Partners'),
(42, 3371089, 'Approved Mortgage Banker, Inc.'),
(43, 3370696, 'Aslan Home Lending Corporation'),
(44, 3371062, 'Layton Financial Services Corp'),
(45, 3373118, 'Layton Financial Services Corp'),
(46, 3372466, 'Pacific National Lending, Inc.'),
(47, 3371946, 'Atlantic Avenue Mortgage, LLC'),
(48, 3372700, 'Atlas Mortgage Solutions Inc.'),
(49, 3371711, 'Community First National Bank'),
(50, 3371710, 'Community First National Bank'),
(51, 3371507, 'Community First National Bank'),
(52, 3372283, 'Community First National Bank'),
(53, 3371662, 'Edge Home Finance Corporation'),
(54, 3373001, 'Edge Home Finance Corporation'),
(55, 3373483, 'Meredith Village Savings Bank'),
(56, 3373104, 'Premier Reverse Mortgage, LLC'),
(57, 3371826, 'ALAMEDA MORTGAGE CORPORATION'),
(58, 3372696, 'Cambria Financial Group, LLC'),
(59, 3372698, 'Cambria Financial Group, LLC'),
(60, 3372578, 'Cambria Financial Group, LLC'),
(61, 3370934, 'Cambria Financial Group, LLC'),
(62, 3372564, 'Destiny Mortgage Group, Inc.'),
(63, 3372686, 'Maine Mortgage Solutions LLC'),
(64, 3371082, 'Total Mortgage Services, LLC'),
(65, 3373496, 'Total Mortgage Services, LLC'),
(66, 3371963, 'Trebor Reverse Mortgage, LLC'),
(67, 3370922, 'Hallmark Home Mortgage, LLC'),
(68, 3371055, 'Amerifund Home Loans, Inc.'),
(69, 3371827, 'Amerifund Home Loans, Inc.'),
(70, 3370688, 'Attler Capital Group, Inc.'),
(71, 3371276, 'PS Financial Services, LLC'),
(72, 3370654, 'PS Financial Services, LLC'),
(73, 3372462, 'PS Financial Services, LLC'),
(74, 3371157, 'Coast2Coast Mortgage, LLC'),
(75, 3371669, 'pacific lending group,inc'),
(76, 3371944, 'Senior Funding Associates'),
(77, 3371862, 'C2 Financial Corporation'),
(78, 3371965, 'C2 Financial Corporation'),
(79, 3371959, 'C2 Financial Corporation'),
(80, 3370924, 'C2 Financial Corporation'),
(81, 3372465, 'C2 Financial Corporation'),
(82, 3372803, 'C2 Financial Corporation'),
(83, 3372692, 'C2 Financial Corporation'),
(84, 3371478, 'C2 Financial Corporation'),
(85, 3372562, 'C2 Financial Corporation'),
(86, 3371054, 'C2 Financial Corporation'),
(87, 3372826, 'CherryHills Mortgage LLC'),
(88, 3371498, 'PENINSULA MORTGAGE, INC.'),
(89, 3372222, 'ACCESS HOME LENDING LLC'),
(90, 3373498, 'Catalina Ventures, Inc.'),
(91, 3373124, 'Moria Development, Inc.'),
(92, 3371064, 'Ryan Mortgage Co., Inc.'),
(93, 3372570, 'Vince Thomas & Co., LLC'),
(94, 3372565, 'White House Realty Inc.'),
(95, 3373211, 'Xpert Home Lending Inc.'),
(96, 3371667, 'JK Home Investment Inc'),
(97, 3371290, 'Movement Mortgage, LLC'),
(98, 3372280, 'Movement Mortgage, LLC'),
(99, 3373003, 'Movement Mortgage, LLC'),
(100, 3373004, 'Movement Mortgage, LLC'),
(101, 3373005, 'Movement Mortgage, LLC'),
(102, 3371385, 'Movement Mortgage, LLC'),
(103, 3373226, 'Movement Mortgage, LLC'),
(104, 3372284, 'Movement Mortgage, LLC'),
(105, 3371096, 'Movement Mortgage, LLC'),
(106, 3372279, 'Movement Mortgage, LLC'),
(107, 3372281, 'Movement Mortgage, LLC'),
(108, 3372471, 'Movement Mortgage, LLC'),
(109, 3373006, 'Movement Mortgage, LLC'),
(110, 3373494, 'Movement Mortgage, LLC'),
(111, 3373495, 'Movement Mortgage, LLC'),
(112, 3373475, 'Princeton Mortgage Inc'),
(113, 3373309, 'Victorian Finance, LLC'),
(114, 3373493, 'Guaranteed Rate, Inc.'),
(115, 3372697, 'Intercap Lending Inc.'),
(116, 3371292, 'Intercap Lending Inc.'),
(117, 3372908, 'Intercap Lending Inc.'),
(118, 3372690, 'My Easy Mortgage, LLC'),
(119, 3370927, 'OAK CREEK INVESTMENTS'),
(120, 3372678, 'Kelly Mortgage, Inc.'),
(121, 3371846, 'SUMMIT FUNDING, INC.'),
(122, 3373591, 'The Mortgage Company'),
(123, 3371943, 'Tremont Credit Union'),
(124, 3371076, 'Tremont Credit Union'),
(125, 3370744, 'Best Mortgage, Inc.'),
(126, 3373221, 'Dale Ernest Tillman'),
(127, 3373310, 'DEL FINANCIAL, INC.'),
(128, 3373596, 'First American Bank'),
(129, 3373123, 'First American Bank'),
(130, 3371945, 'O C Home Loans Inc.'),
(131, 3371668, 'O C Home Loans Inc.'),
(132, 3370754, 'Peak Financial, LLC'),
(133, 3371947, 'Peak Financial, LLC'),
(134, 3373119, 'Peak Financial, LLC'),
(135, 3373002, 'Dara Mortgage Inc.'),
(136, 3371663, 'NEXA Mortgage, LLC'),
(137, 3372689, 'NEXA Mortgage, LLC'),
(138, 3372219, 'Shea Mortgage Inc.'),
(139, 3370936, 'Shea Mortgage Inc.'),
(140, 3371274, 'Mortgage.Shop LLC'),
(141, 3373487, 'Mortgage.Shop LLC'),
(142, 3372819, 'Mortgage.Shop LLC'),
(143, 3372282, 'MortgageOne, Inc.'),
(144, 3372814, 'DDA Mortgage Inc'),
(145, 3371665, 'MPS MORTGAGE LLC'),
(146, 3372811, 'BW Mortgage LLC'),
(147, 3371648, 'Griggs, Timothy'),
(148, 3371492, 'Lower, LLC'),
(149, 3371270, 'Zyng, Inc.')
--> submitted 149 loans
)
Select SeqNum, Loan, trim(GoodName) from P order by SeqNum;

				-- ------------------------ ------------------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
				-- validation
				SELECT 
					P.SeqNum, P.Loan, P.GoodName "RequestedName",length(trim(P.Goodname)) "Length_Requested",
					P2.GoodName "ModifiedName",
					LD.INTSUBSERVICERLOANNUMBER, 
					LD.LOANORIGINATOR ,
					Length(trim(LD.LOANORIGINATOR)) "Length"
					--,
					--case when P.GoodName <> coalesce(cast(LD.LOANORIGINATOR as varchar(100)), '<blank>') then -1 else 0 end as ChangeNeeded
					--, LD.*
				FROM DATAUPDT.HDToriginatorname_import P
				left outer join celink.TBLLOANDATA LD
				on p.loan = LD.INTSUBSERVICERLOANNUMBER
				left outer join DATAUPDT.HDToriginatorname P2 
				on p2.loan = LD.INTSUBSERVICERLOANNUMBER

				order by SeqNum
				for read only with ur;

				--C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT197644_Validation.csv
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


SELECT 
	length(LD.GoodName),
	LD.*
FROM DATAUPDT.HDToriginatorname_import LD
--where locate('''',  LD.GoodName)<> 0
--where locate(',',  LD.GoodName)<> 0 --216
where length(LD.GoodName) > 30 --none
order by LD.SeqNum
for read only with ur;
/*
 1  SEQNUM LOAN    GOODNAME
 -- ------ ------- ---------------------------------
 -- none
*/  

-- ------------------------ ------------------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
DELETE from DATAUPDT.HDToriginatorname;
/* DATAUPDT table
create table DATAUPDT.HDToriginatorname   
	(
	SeqNum integer,
	Loan integer,
	BaadName varchar (100) default NULL,
	GoodName varchar (100) default NULL,
	ChangeNeeded 	integer default 0,
	NewNotes        varchar (200) default NULL-- this column might not be used
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDToriginatorname  TO group db2_ast;
-- drop table DATAUPDT.HDToriginatorname;
 select * from DATAUPDT.HDToriginatorname;
*/

-- ------------------------ ------------------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
SELECT 
	P.*,
	LD.INTSUBSERVICERLOANNUMBER, 
	LD.LOANORIGINATOR "BaadName",
	case when P.GoodName <> coalesce(cast(LD.LOANORIGINATOR as varchar(100)), '<blank>') then -1 else 0 end as ChangeNeeded
	--, LD.*
FROM DATAUPDT.HDToriginatorname_import P
left outer join celink.TBLLOANDATA LD
on p.loan = LD.INTSUBSERVICERLOANNUMBER
order by SeqNum
for read only with ur;

SELECT 
	P.*,
	LD.INTSUBSERVICERLOANNUMBER, 
	LD.LOANORIGINATOR "BaadName",
	case when P.GoodName <> coalesce(cast(LD.LOANORIGINATOR as varchar(100)), '<blank>') then -1 else 0 end as ChangeNeeded
	--, LD.*
FROM DATAUPDT.HDToriginatorname_import P
left outer join celink.TBLLOANDATA LD
on p.loan = LD.INTSUBSERVICERLOANNUMBER
order by SeqNum
for read only with ur;

SELECT 
	P.*,
	LD.INTSUBSERVICERLOANNUMBER, 
	LD.LOANORIGINATOR "BaadName",
	case when P.GoodName <> coalesce(cast(LD.LOANORIGINATOR as varchar(100)), '<blank>') then -1 else 0 end as ChangeNeeded
	--, LD.*
FROM DATAUPDT.HDToriginatorname_import P
left outer join celink.TBLLOANDATA LD
on p.loan = LD.INTSUBSERVICERLOANNUMBER
where P.GoodName <> coalesce(cast(LD.LOANORIGINATOR as varchar(100)), '<blank>')
order by SeqNum
for read only with ur; 

/*
--148 need to change
--1 not needed
 SEQNUM LOAN    GOODNAME                              INTSUBSERVICERLOANNUMBER BaadName                       CHANGENEEDED
 ------ ------- ------------------------------------- ------------------------ ------------------------------ ------------
     89 3372222 ACCESS HOME LENDING LLC                       3372222.0 ACCESS HOME LENDING LLC                   0
*/


--where INTSUBSERVICERLOANNUMBER = 3359637
--where locate('''',  LD.LOANORIGINATOR)<> 0
--where locate(',',  LD.LOANORIGINATOR)<> 0
--where length(LD.LOANORIGINATOR) > 30

INSERT INTO DATAUPDT.HDToriginatorname
(	SeqNum, -- integer,
	Loan, -- integer,
	BaadName, -- varchar (100) default NULL,
	GoodName, -- varchar (100) default NULL,
	ChangeNeeded, -- 	integer default 0,
	NewNotes --        varchar (200) default NULL-- this column might not be used
)
SELECT 
	P.SeqNum, P.Loan, LD.LOANORIGINATOR "BaadName", P.GoodName,	
--	LD.INTSUBSERVICERLOANNUMBER,
	case when P.GoodName <> coalesce(cast(LD.LOANORIGINATOR as varchar(100)), '<blank>') then -1 else 0 end as ChangeNeeded,
	NULL
FROM DATAUPDT.HDToriginatorname_import P
left outer join celink.TBLLOANDATA LD
on p.loan = LD.INTSUBSERVICERLOANNUMBER 
order by p.seqnum
--for read only with ur
;

		select * from DATAUPDT.HDToriginatorname order by SeqNum; --149
		select loan, count(*) from DATAUPDT.HDToriginatorname group by loan having count(*) > 1 ; --no dupe

		select 
			X.seqnum, X.loan, P.MyCt, X.BaadName, X.GoodName 
		from DATAUPDT.HDToriginatorname X
		inner join 
		(select loan, count(*) MyCt from DATAUPDT.HDToriginatorname group by loan) P
		on X.loan = P.Loan
		where P.MyCt > 1
		and X.ChangeNeeded = -1
		order by X.SeqNum
		;
		-- SEQNUM LOAN MYCT BAADNAME GOODNAME
		-- ------ ---- ---- -------- --------
		--no dupe

		select 
			X.seqnum, X.loan, P.MyCt, X.BaadName, X.GoodName 
		from DATAUPDT.HDToriginatorname X
		inner join 
		(select loan, count(*) MyCt from DATAUPDT.HDToriginatorname group by loan) P
		on X.loan = P.Loan
		where X.ChangeNeeded = -1
		order by X.SeqNum
		;		
		-- SEQNUM LOAN    MYCT BAADNAME                       GOODNAME
		-- ------ ------- ---- ------------------------------ -------------------------------------
		-- 148
		
select 
P.*, 
length(P.GOODNAME),
--		trim(left(P.GOODNAME,30)) "New", 
--		length(trim(left(P.GOODNAME,30))) "Len_New",
		LD.LOANORIGINATOR,
		LD.INTSUBSERVICERLOANNUMBER 
from DATAUPDT.HDToriginatorname P
left outer join celink.TBLLOANDATA LD
on p.loan = LD.INTSUBSERVICERLOANNUMBER 
--where P.ChangeNeeded = -1
--and   length(P.GOODNAME) <= 30		
order by SeqNum;
/*
--148 where -1, length <=30
 SEQNUM LOAN    BAADNAME                       GOODNAME                       CHANGENEEDED NEWNOTES 7  LOANORIGINATOR                 INTSUBSERVICERLOANNUMBER
 ------ ------- ------------------------------ ------------------------------ ------------ -------- -- ------------------------------ ------------------------
      1 3373127 Mutual of Omaha Mortgage Inc.  American Financial Mortgage              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3373127.0
      2 3373313 Mutual of Omaha Mortgage Inc.  American Financial Mortgage              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3373313.0
      3 3371139 Mutual of Omaha Mortgage Inc   United Pacific Realty                    -1 NULL     21 Mutual of Omaha Mortgage Inc                  3371139.0
      4 3372796 Mutual of Omaha Mortgage Inc   United Pacific Realty                    -1 NULL     21 Mutual of Omaha Mortgage Inc                  3372796.0
      5 3372870 Mutual of Omaha Mortgage Inc   United Pacific Realty                    -1 NULL     21 Mutual of Omaha Mortgage Inc                  3372870.0
      6 3371269 Mutual of Omaha Mortgage Inc   United Pacific Realty                    -1 NULL     21 Mutual of Omaha Mortgage Inc                  3371269.0
      7 3372218 Mutual of Omaha Mortgage Inc   United Pacific Realty                    -1 NULL     21 Mutual of Omaha Mortgage Inc                  3372218.0
      8 3373209 Mutual of Omaha Mortgage Inc   United Pacific Realty                    -1 NULL     21 Mutual of Omaha Mortgage Inc                  3373209.0
      9 3373116 Mutual of Omaha Mortgage Inc.  Accelerated Funding                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3373116.0
     10 3371484 Mutual of Omaha Mortgage Inc.  Equitable Mortgage & Realty              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3371484.0
     11 3371948 Mutual of Omaha Mortgage Inc.  Equitable Mortgage & Realty              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3371948.0
     12 3372695 Mutual of Omaha Mortgage Inc.  American Pacific Mortgage                -1 NULL     25 Mutual of Omaha Mortgage Inc.                 3372695.0
     13 3372905 Mutual of Omaha Mortgage Inc.  American Pacific Mortgage                -1 NULL     25 Mutual of Omaha Mortgage Inc.                 3372905.0
     14 3373000 Mutual of Omaha Mortgage Inc.  PrimeLending                             -1 NULL     12 Mutual of Omaha Mortgage Inc.                 3373000.0
     15 3372818 Mutual of Omaha Mortgage Inc.  PrimeLending                             -1 NULL     12 Mutual of Omaha Mortgage Inc.                 3372818.0
     16 3371154 Mutual of Omaha Mortgage Inc.  Wilmington Savings Fund                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3371154.0
     17 3372225 Mutual of Omaha Mortgage Inc.  Wilmington Savings Fund                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3372225.0
     18 3373592 Mutual of Omaha Mortgage Inc.  California Reverse Mortgage              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3373592.0
     19 3371095 Mutual of Omaha Mortgage Inc.  Mountain State Financial Grp             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3371095.0
     20 3373299 Mutual of Omaha Mortgage Inc.  The Equitable Mortgage Corp              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3373299.0
     21 3373011 Mutual of Omaha Mortgage Inc.  Professional Mortgage Group              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3373011.0
     22 3370692 Mutual of Omaha Mortgage Inc.  Province Mortgage Assoc                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3370692.0
     23 3373305 Mutual of Omaha Mortgage Inc.  Carefree Retirement Funding              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3373305.0
     24 3371061 Mutual of Omaha Mortgage Inc.  Community Mortgage Solutions             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3371061.0
     25 3370687 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3370687.0
     26 3372821 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3372821.0
     27 3372571 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3372571.0
     28 3371499 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3371499.0
     29 3372563 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3372563.0
     30 3373497 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3373497.0
     31 3371490 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3371490.0
     32 3373096 Mutual of Omaha Mortgage Inc.  Barrett Financial Group                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3373096.0
     33 3373224 Mutual of Omaha Mortgage Inc.  Cornerstone First Mortgage               -1 NULL     26 Mutual of Omaha Mortgage Inc.                 3373224.0
     34 3372797 Mutual of Omaha Mortgage Inc   First American Home Loans                -1 NULL     25 Mutual of Omaha Mortgage Inc                  3372797.0
     35 3373090 Mutual of Omaha Mortgage Inc   First American Home Loans                -1 NULL     25 Mutual of Omaha Mortgage Inc                  3373090.0
     36 3372997 Mutual of Omaha Mortgage Inc   First American Home Loans                -1 NULL     25 Mutual of Omaha Mortgage Inc                  3372997.0
     37 3372463 Mutual of Omaha Mortgage Inc   First American Home Loans                -1 NULL     25 Mutual of Omaha Mortgage Inc                  3372463.0
     38 3373474 Mutual of Omaha Mortgage Inc   First American Home Loans                -1 NULL     25 Mutual of Omaha Mortgage Inc                  3373474.0
     39 3373600 Mutual of Omaha Mortgage Inc.  GOLDEN YEARS MORTGAGE                    -1 NULL     21 Mutual of Omaha Mortgage Inc.                 3373600.0
     40 3372907 Mutual of Omaha Mortgage Inc.  Success Mortgage Partners                -1 NULL     25 Mutual of Omaha Mortgage Inc.                 3372907.0
     41 3372906 Mutual of Omaha Mortgage Inc.  Success Mortgage Partners                -1 NULL     25 Mutual of Omaha Mortgage Inc.                 3372906.0
     42 3371089 Mutual of Omaha Mortgage Inc.  Approved Mortgage Banker, Inc.           -1 NULL     30 Mutual of Omaha Mortgage Inc.                 3371089.0
     43 3370696 Mutual of Omaha Mortgage Inc.  Aslan Home Lending Corporation           -1 NULL     30 Mutual of Omaha Mortgage Inc.                 3370696.0
     44 3371062 Mutual of Omaha Mortgage Inc.  Layton Financial Services Corp           -1 NULL     30 Mutual of Omaha Mortgage Inc.                 3371062.0
     45 3373118 Mutual of Omaha Mortgage Inc.  Layton Financial Services Corp           -1 NULL     30 Mutual of Omaha Mortgage Inc.                 3373118.0
     46 3372466 Mutual of Omaha Mortgage Inc.  Pacific National Lending, Inc.           -1 NULL     30 Mutual of Omaha Mortgage Inc.                 3372466.0
     47 3371946 Mutual of Omaha Mortgage Inc.  Atlantic Avenue Mortgage, LLC            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3371946.0
     48 3372700 Mutual of Omaha Mortgage Inc.  Atlas Mortgage Solutions Inc.            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3372700.0
     49 3371711 Mutual of Omaha Mortgage Inc.  Community First National Bank            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3371711.0
     50 3371710 Mutual of Omaha Mortgage Inc.  Community First National Bank            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3371710.0
     51 3371507 Mutual of Omaha Mortgage Inc.  Community First National Bank            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3371507.0
     52 3372283 Mutual of Omaha Mortgage Inc.  Community First National Bank            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3372283.0
     53 3371662 Mutual of Omaha Mortgage Inc.  Edge Home Finance Corporation            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3371662.0
     54 3373001 Mutual of Omaha Mortgage Inc.  Edge Home Finance Corporation            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3373001.0
     55 3373483 Mutual of Omaha Mortgage Inc.  Meredith Village Savings Bank            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3373483.0
     56 3373104 Mutual of Omaha Mortgage Inc.  Premier Reverse Mortgage, LLC            -1 NULL     29 Mutual of Omaha Mortgage Inc.                 3373104.0
     57 3371826 Mutual of Omaha Mortgage Inc   ALAMEDA MORTGAGE CORPORATION             -1 NULL     28 Mutual of Omaha Mortgage Inc                  3371826.0
     58 3372696 Mutual of Omaha Mortgage Inc.  Cambria Financial Group, LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3372696.0
     59 3372698 Mutual of Omaha Mortgage Inc.  Cambria Financial Group, LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3372698.0
     60 3372578 Mutual of Omaha Mortgage Inc.  Cambria Financial Group, LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3372578.0
     61 3370934 Mutual of Omaha Mortgage Inc.  Cambria Financial Group, LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3370934.0
     62 3372564 Mutual of Omaha Mortgage Inc.  Destiny Mortgage Group, Inc.             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3372564.0
     63 3372686 Mutual of Omaha Mortgage Inc.  Maine Mortgage Solutions LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3372686.0
     64 3371082 Mutual of Omaha Mortgage Inc.  Total Mortgage Services, LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3371082.0
     65 3373496 Mutual of Omaha Mortgage Inc.  Total Mortgage Services, LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3373496.0
     66 3371963 Mutual of Omaha Mortgage Inc.  Trebor Reverse Mortgage, LLC             -1 NULL     28 Mutual of Omaha Mortgage Inc.                 3371963.0
     67 3370922 Mutual of Omaha Mortgage Inc.  Hallmark Home Mortgage, LLC              -1 NULL     27 Mutual of Omaha Mortgage Inc.                 3370922.0
     68 3371055 Mutual of Omaha Mortgage Inc.  Amerifund Home Loans, Inc.               -1 NULL     26 Mutual of Omaha Mortgage Inc.                 3371055.0
     69 3371827 Mutual of Omaha Mortgage Inc.  Amerifund Home Loans, Inc.               -1 NULL     26 Mutual of Omaha Mortgage Inc.                 3371827.0
     70 3370688 Mutual of Omaha Mortgage Inc.  Attler Capital Group, Inc.               -1 NULL     26 Mutual of Omaha Mortgage Inc.                 3370688.0
     71 3371276 Mutual of Omaha Mortgage Inc.  PS Financial Services, LLC               -1 NULL     26 Mutual of Omaha Mortgage Inc.                 3371276.0
     72 3370654 Mutual of Omaha Mortgage Inc   PS Financial Services, LLC               -1 NULL     26 Mutual of Omaha Mortgage Inc                  3370654.0
     73 3372462 Mutual of Omaha Mortgage Inc   PS Financial Services, LLC               -1 NULL     26 Mutual of Omaha Mortgage Inc                  3372462.0
     74 3371157 Mutual of Omaha Mortgage Inc.  Coast2Coast Mortgage, LLC                -1 NULL     25 Mutual of Omaha Mortgage Inc.                 3371157.0
     75 3371669 Mutual of Omaha Mortgage Inc.  pacific lending group,inc                -1 NULL     25 Mutual of Omaha Mortgage Inc.                 3371669.0
     76 3371944 Mutual of Omaha Mortgage Inc.  Senior Funding Associates                -1 NULL     25 Mutual of Omaha Mortgage Inc.                 3371944.0
     77 3371862 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3371862.0
     78 3371965 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3371965.0
     79 3371959 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3371959.0
     80 3370924 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3370924.0
     81 3372465 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3372465.0
     82 3372803 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3372803.0
     83 3372692 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3372692.0
     84 3371478 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3371478.0
     85 3372562 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3372562.0
     86 3371054 Mutual of Omaha Mortgage Inc.  C2 Financial Corporation                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3371054.0
     87 3372826 Mutual of Omaha Mortgage Inc.  CherryHills Mortgage LLC                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3372826.0
     88 3371498 Mutual of Omaha Mortgage Inc.  PENINSULA MORTGAGE, INC.                 -1 NULL     24 Mutual of Omaha Mortgage Inc.                 3371498.0
     89 3372222 ACCESS HOME LENDING LLC        ACCESS HOME LENDING LLC                   0 NULL     23 ACCESS HOME LENDING LLC                       3372222.0
     90 3373498 Mutual of Omaha Mortgage Inc.  Catalina Ventures, Inc.                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3373498.0
     91 3373124 Mutual of Omaha Mortgage Inc.  Moria Development, Inc.                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3373124.0
     92 3371064 Mutual of Omaha Mortgage Inc.  Ryan Mortgage Co., Inc.                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3371064.0
     93 3372570 Mutual of Omaha Mortgage Inc.  Vince Thomas & Co., LLC                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3372570.0
     94 3372565 Mutual of Omaha Mortgage Inc.  White House Realty Inc.                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3372565.0
     95 3373211 Mutual of Omaha Mortgage Inc.  Xpert Home Lending Inc.                  -1 NULL     23 Mutual of Omaha Mortgage Inc.                 3373211.0
     96 3371667 Mutual of Omaha Mortgage Inc.  JK Home Investment Inc                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3371667.0
     97 3371290 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3371290.0
     98 3372280 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3372280.0
     99 3373003 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373003.0
    100 3373004 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373004.0
    101 3373005 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373005.0
    102 3371385 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3371385.0
    103 3373226 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373226.0
    104 3372284 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3372284.0
    105 3371096 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3371096.0
    106 3372279 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3372279.0
    107 3372281 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3372281.0
    108 3372471 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3372471.0
    109 3373006 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373006.0
    110 3373494 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373494.0
    111 3373495 Mutual of Omaha Mortgage Inc.  Movement Mortgage, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373495.0
    112 3373475 Mutual of Omaha Mortgage Inc.  Princeton Mortgage Inc                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373475.0
    113 3373309 Mutual of Omaha Mortgage Inc.  Victorian Finance, LLC                   -1 NULL     22 Mutual of Omaha Mortgage Inc.                 3373309.0
    114 3373493 Mutual of Omaha Mortgage Inc.  Guaranteed Rate, Inc.                    -1 NULL     21 Mutual of Omaha Mortgage Inc.                 3373493.0
    115 3372697 Mutual of Omaha Mortgage Inc.  Intercap Lending Inc.                    -1 NULL     21 Mutual of Omaha Mortgage Inc.                 3372697.0
    116 3371292 Mutual of Omaha Mortgage Inc.  Intercap Lending Inc.                    -1 NULL     21 Mutual of Omaha Mortgage Inc.                 3371292.0
    117 3372908 Mutual of Omaha Mortgage Inc.  Intercap Lending Inc.                    -1 NULL     21 Mutual of Omaha Mortgage Inc.                 3372908.0
    118 3372690 Mutual of Omaha Mortgage Inc.  My Easy Mortgage, LLC                    -1 NULL     21 Mutual of Omaha Mortgage Inc.                 3372690.0
    119 3370927 Mutual of Omaha Mortgage Inc.  OAK CREEK INVESTMENTS                    -1 NULL     21 Mutual of Omaha Mortgage Inc.                 3370927.0
    120 3372678 Mutual of Omaha Mortgage Inc   Kelly Mortgage, Inc.                     -1 NULL     20 Mutual of Omaha Mortgage Inc                  3372678.0
    121 3371846 Mutual of Omaha Mortgage Inc.  SUMMIT FUNDING, INC.                     -1 NULL     20 Mutual of Omaha Mortgage Inc.                 3371846.0
    122 3373591 Mutual of Omaha Mortgage Inc.  The Mortgage Company                     -1 NULL     20 Mutual of Omaha Mortgage Inc.                 3373591.0
    123 3371943 Mutual of Omaha Mortgage Inc.  Tremont Credit Union                     -1 NULL     20 Mutual of Omaha Mortgage Inc.                 3371943.0
    124 3371076 Mutual of Omaha Mortgage Inc.  Tremont Credit Union                     -1 NULL     20 Mutual of Omaha Mortgage Inc.                 3371076.0
    125 3370744 Mutual of Omaha Mortgage Inc.  Best Mortgage, Inc.                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3370744.0
    126 3373221 Mutual of Omaha Mortgage Inc.  Dale Ernest Tillman                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3373221.0
    127 3373310 Mutual of Omaha Mortgage Inc.  DEL FINANCIAL, INC.                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3373310.0
    128 3373596 Mutual of Omaha Mortgage Inc.  First American Bank                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3373596.0
    129 3373123 Mutual of Omaha Mortgage Inc.  First American Bank                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3373123.0
    130 3371945 Mutual of Omaha Mortgage Inc.  O C Home Loans Inc.                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3371945.0
    131 3371668 Mutual of Omaha Mortgage Inc.  O C Home Loans Inc.                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3371668.0
    132 3370754 Mutual of Omaha Mortgage Inc.  Peak Financial, LLC                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3370754.0
    133 3371947 Mutual of Omaha Mortgage Inc.  Peak Financial, LLC                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3371947.0
    134 3373119 Mutual of Omaha Mortgage Inc.  Peak Financial, LLC                      -1 NULL     19 Mutual of Omaha Mortgage Inc.                 3373119.0
    135 3373002 Mutual of Omaha Mortgage Inc.  Dara Mortgage Inc.                       -1 NULL     18 Mutual of Omaha Mortgage Inc.                 3373002.0
    136 3371663 Mutual of Omaha Mortgage Inc.  NEXA Mortgage, LLC                       -1 NULL     18 Mutual of Omaha Mortgage Inc.                 3371663.0
    137 3372689 Mutual of Omaha Mortgage Inc.  NEXA Mortgage, LLC                       -1 NULL     18 Mutual of Omaha Mortgage Inc.                 3372689.0
    138 3372219 Mutual of Omaha Mortgage Inc   Shea Mortgage Inc.                       -1 NULL     18 Mutual of Omaha Mortgage Inc                  3372219.0
    139 3370936 Mutual of Omaha Mortgage Inc   Shea Mortgage Inc.                       -1 NULL     18 Mutual of Omaha Mortgage Inc                  3370936.0
    140 3371274 Mutual of Omaha Mortgage Inc.  Mortgage.Shop LLC                        -1 NULL     17 Mutual of Omaha Mortgage Inc.                 3371274.0
    141 3373487 Mutual of Omaha Mortgage Inc.  Mortgage.Shop LLC                        -1 NULL     17 Mutual of Omaha Mortgage Inc.                 3373487.0
    142 3372819 Mutual of Omaha Mortgage Inc.  Mortgage.Shop LLC                        -1 NULL     17 Mutual of Omaha Mortgage Inc.                 3372819.0
    143 3372282 Mutual of Omaha Mortgage Inc.  MortgageOne, Inc.                        -1 NULL     17 Mutual of Omaha Mortgage Inc.                 3372282.0
    144 3372814 Mutual of Omaha Mortgage Inc.  DDA Mortgage Inc                         -1 NULL     16 Mutual of Omaha Mortgage Inc.                 3372814.0
    145 3371665 Mutual of Omaha Mortgage Inc.  MPS MORTGAGE LLC                         -1 NULL     16 Mutual of Omaha Mortgage Inc.                 3371665.0
    146 3372811 Mutual of Omaha Mortgage Inc.  BW Mortgage LLC                          -1 NULL     15 Mutual of Omaha Mortgage Inc.                 3372811.0
    147 3371648 Mutual of Omaha Mortgage Inc   Griggs, Timothy                          -1 NULL     15 Mutual of Omaha Mortgage Inc                  3371648.0
    148 3371492 Mutual of Omaha Mortgage Inc.  Lower, LLC                               -1 NULL     10 Mutual of Omaha Mortgage Inc.                 3371492.0
    149 3371270 Mutual of Omaha Mortgage Inc.  Zyng, Inc.                               -1 NULL     10 Mutual of Omaha Mortgage Inc.                 3371270.0

*/

/*
--dup among -1
 SEQNUM LOAN    BAADNAME                       GOODNAME                     CHANGENEEDED
 ------ ------- ------------------------------ ---------------------------- ------------

--left join
 SEQNUM LOAN    GOODNAME
 ------ ------- ---------------------------

    
-- -1 ... 148 loans
 SEQNUM LOAN    BAADNAME                       GOODNAME                              CHANGENEEDED NEWNOTES
 ------ ------- ------------------------------ ------------------------------------- ------------ --------

-- 0 ... 1 loans
 SEQNUM LOAN    BAADNAME                       GOODNAME                       CHANGENEEDED NEWNOTES
 ------ ------- ------------------------------ ------------------------------ ------------ --------

see HDT197644_Validation2.csv
*/

------ ------- ------------------------------ -- ------------------------------ -- ------------------------------- ------------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ ------------------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ ------------------------------ ------------------------------ -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
------ ------- ------------------------------ -- ------------------------------ -- ------------------------------- ------------------------ ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ ------------------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ------------ --------------- ---------------------------------------------------------------------------------------------------- -------- ------ ------------------------------ ------------------------------ -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--/*
-- Mergeeeeeeeeeeeeeeeeeeeeee
MERGE INTO celink.TBLLOANDATA Y
USING
(
	select 
		SEQNUM, LOAN, BAADNAME, 
		GOODNAME, --length(GOODNAME) Len_GoodName,
		--trim(left(GOODNAME,30)) NewGoodName, 
		--LD.LOANORIGINATOR, length(LD.LOANORIGINATOR) Len_CurrName,
		CHANGENEEDED
	from DATAUPDT.HDToriginatorname P 
	inner join 	celink.TBLLOANDATA LD
	on p.loan = LD.INTSUBSERVICERLOANNUMBER 
where ChangeNeeded = -1 
and   length(P.GOODNAME) <= 30		
order by SeqNum --

) X (SEQNUM, LOAN, BAADNAME, GOODNAME, CHANGENEEDED) 
ON X.Loan = Y.INTSUBSERVICERLOANNUMBER 
WHEN MATCHED THEN UPDATE 
SET Y.LOANORIGINATOR = X.GOODNAME
;

-- 148
-- SEQNUM LOAN    BAADNAME                       GOODNAME                              NEWGOODNAME                    LOANORIGINATOR                 7  CHANGENEEDED
-- ------ ------- ------------------------------ ------------------------------------- ------------------------------ ------------------------------ -- ------------

/* *
MERGE INTO celink.TBLLOANDATA Y
USING
(
	-- below update 316 loans
	select 
		SEQNUM, LOAN, BAADNAME, 
		GOODNAME, 
		trim(left(GOODNAME,30)) NewGoodName, --LD.LOANORIGINATOR,
		CHANGENEEDED
	from DATAUPDT.HDToriginatorname P 
	inner join 	celink.TBLLOANDATA LD
	on p.loan = LD.INTSUBSERVICERLOANNUMBER 
	where ChangeNeeded = -1 
	and seqnum = 39
	order by SeqNum --

) X (SEQNUM, LOAN, BAADNAME, GOODNAME, NewGoodName, CHANGENEEDED) 
ON X.Loan = Y.INTSUBSERVICERLOANNUMBER 
WHEN MATCHED THEN UPDATE 
SET Y.LOANORIGINATOR = 'Innovative Mortgage Services' --X.NewGoodName
;

update celink.TBLLOANDATA set LOANORIGINATOR = 'PrimeLending, A PlainsCapital' where INTSUBSERVICERLOANNUMBER= 3363648;
update celink.TBLLOANDATA set LOANORIGINATOR = 'PrimeLending, A PlainsCapital' where INTSUBSERVICERLOANNUMBER= 3363533;
update celink.TBLLOANDATA set LOANORIGINATOR = 'Success Mortgage Partners, Inc' where INTSUBSERVICERLOANNUMBER= 3364642;

I have fixed below loans.
3363638 removed a trailing comma that left when trancated to 30 char.
3363648 removed a trailing space that left when trancated to 30 char.
3363533 removed a trailing space that left when trancated to 30 char.
3364642 removed a trailing space that left when trancated to 30 char.

I do not find anything else needs to be corrected.  Please advise.  Thank you!
*/
--take 2
-- SEQNUM LOAN    BAADNAME                       GOODNAME                              NEWGOODNAME                    LOANORIGINATOR                 CHANGENEEDED
-- ------ ------- ------------------------------ ------------------------------------- ------------------------------ ------------------------------ ------------
--     39 3363638 Innovative Mortgage Services,  Innovative Mortgage Services, Inc.    Innovative Mortgage Services,  Innovative Mortgage Services,            -1
--     65 3363648 PrimeLending, A PlainsCapital  PrimeLending, A PlainsCapital Company PrimeLending, A PlainsCapital  PrimeLending, A PlainsCapital            -1
--     66 3363533 PrimeLending, A PlainsCapital  PrimeLending, A PlainsCapital Company PrimeLending, A PlainsCapital  PrimeLending, A PlainsCapital            -1
--     70 3364642 Success Mortgage Partners, Inc Success Mortgage Partners, Inc.       Success Mortgage Partners, Inc Success Mortgage Partners, Inc           -1

-- SEQNUM LOAN    BAADNAME                       GOODNAME                           NEWGOODNAME                   LOANORIGINATOR                 CHANGENEEDED
-- ------ ------- ------------------------------ ---------------------------------- ----------------------------- ------------------------------ ------------
--     39 3363638 Innovative Mortgage Services,  Innovative Mortgage Services, Inc. Innovative Mortgage Services, Innovative Mortgage Services,            -1


-- SEQNUM LOAN    BAADNAME                       GOODNAME                              NEWGOODNAME                    CHANGENEEDED
-- ------ ------- ------------------------------ ------------------------------------- ------------------------------ ------------
--      1 3363663 Advisors Mortgage Group LLC    Advisors Mortgage Group               Advisors Mortgage Group                  -1
--      3 3363631 Mutual of Omaha Mortgage Inc.  All Island Mtg & Funding Corp         All Island Mtg & Funding Corp            -1
--     12 3363396 Atlantic Avenue Mortgage       Atlantic Avenue Mortgage, LLC         Atlantic Avenue Mortgage, LLC            -1
--     13 3364175 Atlantic Avenue Mortgage       Atlantic Avenue Mortgage, LLC         Atlantic Avenue Mortgage, LLC            -1
--     14 3364554 Atlantic Avenue Mortgage       Atlantic Avenue Mortgage, LLC         Atlantic Avenue Mortgage, LLC            -1
--     16 3363244 Barrett Financial Group L.L.C  Barrett Financial Group               Barrett Financial Group                  -1
--     17 3363634 Barrett Financial Group L.L.C  Barrett Financial Group               Barrett Financial Group                  -1
--     19 3364338 Bay Equity Home Loans          Bay Equity LLC                        Bay Equity LLC                           -1
--     27 3364951 Mutual of Omaha Mortgage Inc.  Churchill Mortgage Corporation        Churchill Mortgage Corporation           -1
--     30 3364020 CrossCountry Mortgage LLC      CrossCountry Mortgage, LLC            CrossCountry Mortgage, LLC               -1
--     31 3364312 Mutual of Omaha Mortgage Inc.  DEL FINANCIAL, INC.                   DEL FINANCIAL, INC.                      -1
--     32 3363520 Mutual of Omaha Mortgage Inc.  Franklin Loan Corporation             Franklin Loan Corporation                -1
--     33 3364531 Mutual of Omaha Mortgage Inc.  Golden State Mortgage, Inc.           Golden State Mortgage, Inc.              -1
--     34 3363233 GoPrime Mortgage Inc.          GoPrime Mortgage, Inc.                GoPrime Mortgage, Inc.                   -1
--     35 3364557 Guaranteed Rate Affinity LLC.  Guaranteed Rate Affinity, LLC         Guaranteed Rate Affinity, LLC            -1
--     36 3363237 Guaranteed Rate Affinity LLC.  Guaranteed Rate Affinity, LLC         Guaranteed Rate Affinity, LLC            -1
--     37 3363650 Guaranteed Rate Affinity LLC.  Guaranteed Rate Affinity, LLC         Guaranteed Rate Affinity, LLC            -1
--     38 3363744 Mutual of Omaha Mortgage Inc.  Home Loan Express, LLC                Home Loan Express, LLC                   -1
--     39 3363638 Innovative Mortgage Services   Innovative Mortgage Services, Inc.    Innovative Mortgage Services,            -1
--     42 3363843 Mutual of Omaha Mortgage Inc.  Journey Mortgage Advisors, Inc        Journey Mortgage Advisors, Inc           -1
--     43 3363551 Lower LLC                      Lower, LLC                            Lower, LLC                               -1
--     46 3364672 MiLend Inc.                    MiLend, Inc.                          MiLend, Inc.                             -1
--     48 3363245 Mortgage.Shop LLC d/b/a Revers Mortgage.Shop LLC                     Mortgage.Shop LLC                        -1
--     49 3363662 MortgageOne Inc.               MortgageOne, Inc.                     MortgageOne, Inc.                        -1
--     50 3364183 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     51 3363402 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     52 3363767 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     53 3364340 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     54 3363412 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     55 3364184 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     56 3363768 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     57 3363403 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     58 3363314 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     59 3363552 Movement Mortgage LLC          Movement Mortgage, LLC                Movement Mortgage, LLC                   -1
--     60 3364625 NEXA Mortgage LLC              NEXA Mortgage, LLC                    NEXA Mortgage, LLC                       -1
--     61 3364149 NEXA Mortgage LLC              NEXA Mortgage, LLC                    NEXA Mortgage, LLC                       -1
--     62 3363762 PeakView Mortgage Inc.         PeakView Mortgage, Inc.               PeakView Mortgage, Inc.                  -1
--     63 3363522 Mutual of Omaha Mortgage Inc.  Premier Reverse Mortgage, LLC         Premier Reverse Mortgage, LLC            -1
--     64 3363226 Mutual of Omaha Mortgage Inc.  Premier Reverse Mortgage, LLC         Premier Reverse Mortgage, LLC            -1
--     65 3363648 PrimeLending A PlainsCapital   PrimeLending, A PlainsCapital Company PrimeLending, A PlainsCapital            -1
--     66 3363533 PrimeLending A PlainsCapital   PrimeLending, A PlainsCapital Company PrimeLending, A PlainsCapital            -1
--     67 3363529 PS Financial Services LLC      PS Financial Services, LLC            PS Financial Services, LLC               -1
--     68 3364144 RELIANCE MORTGAGE COMPANY      RELIANCE MORTGAGE COMPANY LLC         RELIANCE MORTGAGE COMPANY LLC            -1
--     69 3363241 Ruoff Mortgage Company Inc.    Ruoff Mortgage Company, Inc.          Ruoff Mortgage Company, Inc.             -1
--     70 3364642 Success Mortgage Partners Inc  Success Mortgage Partners, Inc.       Success Mortgage Partners, Inc           -1
--     71 3363242 SUMMIT FUNDING INC.            SUMMIT FUNDING, INC.                  SUMMIT FUNDING, INC.                     -1
--     72 3364605 SUMMIT FUNDING INC.            SUMMIT FUNDING, INC.                  SUMMIT FUNDING, INC.                     -1
--     73 3363860 Sun American Mortgage Co       SUN AMERICAN MORTGAGE COMPANY         SUN AMERICAN MORTGAGE COMPANY            -1
--     74 3364532 Mutual of Omaha Mortgage Inc.  Synergy One Lending, Inc.             Synergy One Lending, Inc.                -1
--     75 3363745 Mutual of Omaha Mortgage Inc.  Synergy One Lending, Inc.             Synergy One Lending, Inc.                -1
--     77 3364953 Mutual of Omaha Mortgage Inc.  United Pacific Realty                 United Pacific Realty                    -1
--     78 3363844 Mutual of Omaha Mortgage Inc.  United Pacific Realty                 United Pacific Realty                    -1
--     79 3364624 Utah Community Federal Credit  Utah Com Fed Credit Union             Utah Com Fed Credit Union                -1

--*/

		-------------------------------------------------------------
		select 
			P.*, 
			LD.LOANORIGINATOR,
			LD.INTSUBSERVICERLOANNUMBER,
			case when P.GoodName <> coalesce(cast(LD.LOANORIGINATOR as varchar(100)), '<blank>') then -1 else 0 end as "ChangeNeeded_After"
		from DATAUPDT.HDToriginatorname P
		left outer join celink.TBLLOANDATA LD
		on p.loan = LD.INTSUBSERVICERLOANNUMBER 
		order by SeqNum;

--C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT197644_validation2.csv


-------------------------------------------------------------------------------------------------------
select 
--SeqNum,	
'(' || 
Loan || ', ' ||
--'''Per HDT 188580 Original Lender updated from [' || trim(P.Baadname) || '] to [' || trim(P.Goodname) ||'].'
'''Per HDT 197644 Original Lender updated from [' || trim(P.Baadname) || '] to [' || trim(GOODNAME) ||'].'
|| '''' || ', ' 
|| 'CURRENT_TIMESTAMP, '
|| '''tkato'', 0, 0), '
as "Note Insert Value"
from DATAUPDT.HDToriginatorname P
where changeneeded = -1
and   length(P.GOODNAME) <= 30	
and p.BAADNAME is not null
order by SeqNum
;

/*

 Note Insert Value
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------
 (3373127, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Financial Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373313, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Financial Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371139, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372796, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372870, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371269, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372218, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373209, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373116, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Accelerated Funding].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371484, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Equitable Mortgage & Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371948, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Equitable Mortgage & Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372695, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Pacific Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372905, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Pacific Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373000, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PrimeLending].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372818, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PrimeLending].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371154, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Wilmington Savings Fund].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372225, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Wilmington Savings Fund].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373592, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [California Reverse Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371095, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mountain State Financial Grp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373299, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [The Equitable Mortgage Corp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373011, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Professional Mortgage Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370692, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Province Mortgage Assoc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373305, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Carefree Retirement Funding].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371061, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community Mortgage Solutions].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370687, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372821, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372571, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371499, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372563, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373497, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371490, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373096, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373224, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cornerstone First Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372797, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373090, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372997, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372463, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373474, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373600, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [GOLDEN YEARS MORTGAGE].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372907, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Success Mortgage Partners].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372906, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Success Mortgage Partners].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371089, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Approved Mortgage Banker, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370696, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Aslan Home Lending Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371062, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Layton Financial Services Corp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373118, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Layton Financial Services Corp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372466, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Pacific National Lending, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371946, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Atlantic Avenue Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372700, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Atlas Mortgage Solutions Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371711, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371710, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371507, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372283, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371662, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Edge Home Finance Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373001, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Edge Home Finance Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373483, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Meredith Village Savings Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373104, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Premier Reverse Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371826, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [ALAMEDA MORTGAGE CORPORATION].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372696, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372698, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372578, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370934, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372564, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Destiny Mortgage Group, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372686, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Maine Mortgage Solutions LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371082, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Total Mortgage Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373496, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Total Mortgage Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371963, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Trebor Reverse Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370922, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Hallmark Home Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371055, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Amerifund Home Loans, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371827, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Amerifund Home Loans, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370688, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Attler Capital Group, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371276, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PS Financial Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370654, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [PS Financial Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372462, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [PS Financial Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371157, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Coast2Coast Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371669, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [pacific lending group,inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371944, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Senior Funding Associates].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371862, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371965, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371959, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370924, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372465, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372803, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372692, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371478, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372562, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371054, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372826, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [CherryHills Mortgage LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371498, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PENINSULA MORTGAGE, INC.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373498, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Catalina Ventures, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373124, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Moria Development, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371064, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Ryan Mortgage Co., Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372570, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Vince Thomas & Co., LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372565, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [White House Realty Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373211, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Xpert Home Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371667, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [JK Home Investment Inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371290, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372280, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373003, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373004, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373005, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371385, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373226, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372284, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371096, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372279, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372281, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372471, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373006, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373494, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373495, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373475, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Princeton Mortgage Inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373309, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Victorian Finance, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373493, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Guaranteed Rate, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372697, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371292, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372908, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372690, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [My Easy Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370927, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [OAK CREEK INVESTMENTS].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372678, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Kelly Mortgage, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371846, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [SUMMIT FUNDING, INC.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373591, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [The Mortgage Company].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371943, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Tremont Credit Union].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371076, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Tremont Credit Union].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370744, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Best Mortgage, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373221, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Dale Ernest Tillman].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373310, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [DEL FINANCIAL, INC.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373596, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [First American Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373123, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [First American Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371945, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [O C Home Loans Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371668, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [O C Home Loans Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370754, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371947, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373119, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373002, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Dara Mortgage Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371663, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [NEXA Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372689, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [NEXA Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372219, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Shea Mortgage Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370936, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Shea Mortgage Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371274, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373487, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372819, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372282, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [MortgageOne, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372814, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [DDA Mortgage Inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371665, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [MPS MORTGAGE LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372811, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [BW Mortgage LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371648, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Griggs, Timothy].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371492, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Lower, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371270, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Zyng, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0)

*/

-------------------------------------------------------------------------------------------------------------------------------------
---- Notes update
------** --Notes ... parameter ,,, plug in valeus fro -- Note Insert Value Creastion
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, StepNum) as
(values

-- Note Insert Value
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------
 (3373127, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Financial Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373313, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Financial Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371139, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372796, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372870, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371269, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372218, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373209, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373116, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Accelerated Funding].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371484, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Equitable Mortgage & Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371948, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Equitable Mortgage & Realty].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372695, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Pacific Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372905, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Pacific Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373000, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PrimeLending].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372818, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PrimeLending].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371154, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Wilmington Savings Fund].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372225, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Wilmington Savings Fund].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373592, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [California Reverse Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371095, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mountain State Financial Grp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373299, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [The Equitable Mortgage Corp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373011, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Professional Mortgage Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370692, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Province Mortgage Assoc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373305, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Carefree Retirement Funding].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371061, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community Mortgage Solutions].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370687, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372821, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372571, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371499, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372563, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373497, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371490, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373096, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373224, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cornerstone First Mortgage].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372797, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373090, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372997, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372463, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373474, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373600, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [GOLDEN YEARS MORTGAGE].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372907, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Success Mortgage Partners].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372906, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Success Mortgage Partners].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371089, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Approved Mortgage Banker, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370696, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Aslan Home Lending Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371062, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Layton Financial Services Corp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373118, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Layton Financial Services Corp].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372466, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Pacific National Lending, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371946, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Atlantic Avenue Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372700, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Atlas Mortgage Solutions Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371711, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371710, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371507, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372283, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371662, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Edge Home Finance Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373001, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Edge Home Finance Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373483, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Meredith Village Savings Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373104, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Premier Reverse Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371826, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [ALAMEDA MORTGAGE CORPORATION].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372696, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372698, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372578, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370934, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372564, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Destiny Mortgage Group, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372686, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Maine Mortgage Solutions LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371082, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Total Mortgage Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373496, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Total Mortgage Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371963, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Trebor Reverse Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370922, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Hallmark Home Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371055, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Amerifund Home Loans, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371827, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Amerifund Home Loans, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370688, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Attler Capital Group, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371276, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PS Financial Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370654, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [PS Financial Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372462, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [PS Financial Services, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371157, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Coast2Coast Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371669, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [pacific lending group,inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371944, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Senior Funding Associates].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371862, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371965, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371959, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370924, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372465, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372803, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372692, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371478, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372562, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371054, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372826, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [CherryHills Mortgage LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371498, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PENINSULA MORTGAGE, INC.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373498, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Catalina Ventures, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373124, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Moria Development, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371064, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Ryan Mortgage Co., Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372570, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Vince Thomas & Co., LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372565, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [White House Realty Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373211, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Xpert Home Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371667, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [JK Home Investment Inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371290, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372280, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373003, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373004, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373005, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371385, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373226, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372284, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371096, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372279, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372281, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372471, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373006, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373494, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373495, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373475, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Princeton Mortgage Inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373309, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Victorian Finance, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373493, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Guaranteed Rate, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372697, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371292, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372908, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372690, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [My Easy Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370927, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [OAK CREEK INVESTMENTS].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372678, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Kelly Mortgage, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371846, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [SUMMIT FUNDING, INC.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373591, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [The Mortgage Company].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371943, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Tremont Credit Union].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371076, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Tremont Credit Union].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370744, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Best Mortgage, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373221, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Dale Ernest Tillman].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373310, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [DEL FINANCIAL, INC.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373596, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [First American Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373123, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [First American Bank].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371945, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [O C Home Loans Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371668, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [O C Home Loans Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370754, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371947, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373119, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373002, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Dara Mortgage Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371663, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [NEXA Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372689, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [NEXA Mortgage, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372219, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Shea Mortgage Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3370936, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Shea Mortgage Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371274, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3373487, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372819, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372282, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [MortgageOne, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372814, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [DDA Mortgage Inc].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371665, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [MPS MORTGAGE LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3372811, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [BW Mortgage LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371648, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Griggs, Timothy].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371492, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Lower, LLC].', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3371270, 'Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Zyng, Inc.].', CURRENT_TIMESTAMP, 'tkato', 0, 0)


)
select * from P
;

/*

 LOAN    NOTE                                                                                                             TIMES                      WHO   PRIO STEPNUM
 ------- ---------------------------------------------------------------------------------------------------------------- -------------------------- ----- ---- -------
 3373127 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Financial Mortgage].    2025-08-25 12:26:19.276856 tkato    0       0
 3373313 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Financial Mortgage].    2025-08-25 12:26:19.276856 tkato    0       0
 3371139 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].           2025-08-25 12:26:19.276856 tkato    0       0
 3372796 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].           2025-08-25 12:26:19.276856 tkato    0       0
 3372870 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].           2025-08-25 12:26:19.276856 tkato    0       0
 3371269 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].           2025-08-25 12:26:19.276856 tkato    0       0
 3372218 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].           2025-08-25 12:26:19.276856 tkato    0       0
 3373209 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [United Pacific Realty].           2025-08-25 12:26:19.276856 tkato    0       0
 3373116 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Accelerated Funding].            2025-08-25 12:26:19.276856 tkato    0       0
 3371484 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Equitable Mortgage & Realty].    2025-08-25 12:26:19.276856 tkato    0       0
 3371948 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Equitable Mortgage & Realty].    2025-08-25 12:26:19.276856 tkato    0       0
 3372695 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Pacific Mortgage].      2025-08-25 12:26:19.276856 tkato    0       0
 3372905 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [American Pacific Mortgage].      2025-08-25 12:26:19.276856 tkato    0       0
 3373000 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PrimeLending].                   2025-08-25 12:26:19.276856 tkato    0       0
 3372818 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PrimeLending].                   2025-08-25 12:26:19.276856 tkato    0       0
 3371154 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Wilmington Savings Fund].        2025-08-25 12:26:19.276856 tkato    0       0
 3372225 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Wilmington Savings Fund].        2025-08-25 12:26:19.276856 tkato    0       0
 3373592 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [California Reverse Mortgage].    2025-08-25 12:26:19.276856 tkato    0       0
 3371095 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mountain State Financial Grp].   2025-08-25 12:26:19.276856 tkato    0       0
 3373299 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [The Equitable Mortgage Corp].    2025-08-25 12:26:19.276856 tkato    0       0
 3373011 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Professional Mortgage Group].    2025-08-25 12:26:19.276856 tkato    0       0
 3370692 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Province Mortgage Assoc].        2025-08-25 12:26:19.276856 tkato    0       0
 3373305 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Carefree Retirement Funding].    2025-08-25 12:26:19.276856 tkato    0       0
 3371061 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community Mortgage Solutions].   2025-08-25 12:26:19.276856 tkato    0       0
 3370687 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3372821 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3372571 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3371499 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3372563 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3373497 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3371490 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3373096 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Barrett Financial Group].        2025-08-25 12:26:19.276856 tkato    0       0
 3373224 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cornerstone First Mortgage].     2025-08-25 12:26:19.276856 tkato    0       0
 3372797 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].       2025-08-25 12:26:19.276856 tkato    0       0
 3373090 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].       2025-08-25 12:26:19.276856 tkato    0       0
 3372997 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].       2025-08-25 12:26:19.276856 tkato    0       0
 3372463 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].       2025-08-25 12:26:19.276856 tkato    0       0
 3373474 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [First American Home Loans].       2025-08-25 12:26:19.276856 tkato    0       0
 3373600 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [GOLDEN YEARS MORTGAGE].          2025-08-25 12:26:19.276856 tkato    0       0
 3372907 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Success Mortgage Partners].      2025-08-25 12:26:19.276856 tkato    0       0
 3372906 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Success Mortgage Partners].      2025-08-25 12:26:19.276856 tkato    0       0
 3371089 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Approved Mortgage Banker, Inc.]. 2025-08-25 12:26:19.276856 tkato    0       0
 3370696 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Aslan Home Lending Corporation]. 2025-08-25 12:26:19.276856 tkato    0       0
 3371062 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Layton Financial Services Corp]. 2025-08-25 12:26:19.276856 tkato    0       0
 3373118 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Layton Financial Services Corp]. 2025-08-25 12:26:19.276856 tkato    0       0
 3372466 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Pacific National Lending, Inc.]. 2025-08-25 12:26:19.276856 tkato    0       0
 3371946 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Atlantic Avenue Mortgage, LLC].  2025-08-25 12:26:19.276856 tkato    0       0
 3372700 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Atlas Mortgage Solutions Inc.].  2025-08-25 12:26:19.276856 tkato    0       0
 3371711 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].  2025-08-25 12:26:19.276856 tkato    0       0
 3371710 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].  2025-08-25 12:26:19.276856 tkato    0       0
 3371507 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].  2025-08-25 12:26:19.276856 tkato    0       0
 3372283 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Community First National Bank].  2025-08-25 12:26:19.276856 tkato    0       0
 3371662 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Edge Home Finance Corporation].  2025-08-25 12:26:19.276856 tkato    0       0
 3373001 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Edge Home Finance Corporation].  2025-08-25 12:26:19.276856 tkato    0       0
 3373483 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Meredith Village Savings Bank].  2025-08-25 12:26:19.276856 tkato    0       0
 3373104 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Premier Reverse Mortgage, LLC].  2025-08-25 12:26:19.276856 tkato    0       0
 3371826 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [ALAMEDA MORTGAGE CORPORATION].    2025-08-25 12:26:19.276856 tkato    0       0
 3372696 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3372698 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3372578 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3370934 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Cambria Financial Group, LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3372564 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Destiny Mortgage Group, Inc.].   2025-08-25 12:26:19.276856 tkato    0       0
 3372686 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Maine Mortgage Solutions LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3371082 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Total Mortgage Services, LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3373496 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Total Mortgage Services, LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3371963 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Trebor Reverse Mortgage, LLC].   2025-08-25 12:26:19.276856 tkato    0       0
 3370922 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Hallmark Home Mortgage, LLC].    2025-08-25 12:26:19.276856 tkato    0       0
 3371055 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Amerifund Home Loans, Inc.].     2025-08-25 12:26:19.276856 tkato    0       0
 3371827 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Amerifund Home Loans, Inc.].     2025-08-25 12:26:19.276856 tkato    0       0
 3370688 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Attler Capital Group, Inc.].     2025-08-25 12:26:19.276856 tkato    0       0
 3371276 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PS Financial Services, LLC].     2025-08-25 12:26:19.276856 tkato    0       0
 3370654 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [PS Financial Services, LLC].      2025-08-25 12:26:19.276856 tkato    0       0
 3372462 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [PS Financial Services, LLC].      2025-08-25 12:26:19.276856 tkato    0       0
 3371157 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Coast2Coast Mortgage, LLC].      2025-08-25 12:26:19.276856 tkato    0       0
 3371669 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [pacific lending group,inc].      2025-08-25 12:26:19.276856 tkato    0       0
 3371944 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Senior Funding Associates].      2025-08-25 12:26:19.276856 tkato    0       0
 3371862 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3371965 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3371959 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3370924 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3372465 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3372803 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3372692 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3371478 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3372562 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3371054 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [C2 Financial Corporation].       2025-08-25 12:26:19.276856 tkato    0       0
 3372826 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [CherryHills Mortgage LLC].       2025-08-25 12:26:19.276856 tkato    0       0
 3371498 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [PENINSULA MORTGAGE, INC.].       2025-08-25 12:26:19.276856 tkato    0       0
 3373498 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Catalina Ventures, Inc.].        2025-08-25 12:26:19.276856 tkato    0       0
 3373124 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Moria Development, Inc.].        2025-08-25 12:26:19.276856 tkato    0       0
 3371064 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Ryan Mortgage Co., Inc.].        2025-08-25 12:26:19.276856 tkato    0       0
 3372570 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Vince Thomas & Co., LLC].        2025-08-25 12:26:19.276856 tkato    0       0
 3372565 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [White House Realty Inc.].        2025-08-25 12:26:19.276856 tkato    0       0
 3373211 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Xpert Home Lending Inc.].        2025-08-25 12:26:19.276856 tkato    0       0
 3371667 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [JK Home Investment Inc].         2025-08-25 12:26:19.276856 tkato    0       0
 3371290 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3372280 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373003 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373004 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373005 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3371385 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373226 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3372284 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3371096 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3372279 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3372281 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3372471 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373006 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373494 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373495 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Movement Mortgage, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373475 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Princeton Mortgage Inc].         2025-08-25 12:26:19.276856 tkato    0       0
 3373309 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Victorian Finance, LLC].         2025-08-25 12:26:19.276856 tkato    0       0
 3373493 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Guaranteed Rate, Inc.].          2025-08-25 12:26:19.276856 tkato    0       0
 3372697 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].          2025-08-25 12:26:19.276856 tkato    0       0
 3371292 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].          2025-08-25 12:26:19.276856 tkato    0       0
 3372908 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Intercap Lending Inc.].          2025-08-25 12:26:19.276856 tkato    0       0
 3372690 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [My Easy Mortgage, LLC].          2025-08-25 12:26:19.276856 tkato    0       0
 3370927 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [OAK CREEK INVESTMENTS].          2025-08-25 12:26:19.276856 tkato    0       0
 3372678 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Kelly Mortgage, Inc.].            2025-08-25 12:26:19.276856 tkato    0       0
 3371846 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [SUMMIT FUNDING, INC.].           2025-08-25 12:26:19.276856 tkato    0       0
 3373591 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [The Mortgage Company].           2025-08-25 12:26:19.276856 tkato    0       0
 3371943 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Tremont Credit Union].           2025-08-25 12:26:19.276856 tkato    0       0
 3371076 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Tremont Credit Union].           2025-08-25 12:26:19.276856 tkato    0       0
 3370744 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Best Mortgage, Inc.].            2025-08-25 12:26:19.276856 tkato    0       0
 3373221 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Dale Ernest Tillman].            2025-08-25 12:26:19.276856 tkato    0       0
 3373310 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [DEL FINANCIAL, INC.].            2025-08-25 12:26:19.276856 tkato    0       0
 3373596 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [First American Bank].            2025-08-25 12:26:19.276856 tkato    0       0
 3373123 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [First American Bank].            2025-08-25 12:26:19.276856 tkato    0       0
 3371945 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [O C Home Loans Inc.].            2025-08-25 12:26:19.276856 tkato    0       0
 3371668 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [O C Home Loans Inc.].            2025-08-25 12:26:19.276856 tkato    0       0
 3370754 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].            2025-08-25 12:26:19.276856 tkato    0       0
 3371947 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].            2025-08-25 12:26:19.276856 tkato    0       0
 3373119 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Peak Financial, LLC].            2025-08-25 12:26:19.276856 tkato    0       0
 3373002 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Dara Mortgage Inc.].             2025-08-25 12:26:19.276856 tkato    0       0
 3371663 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [NEXA Mortgage, LLC].             2025-08-25 12:26:19.276856 tkato    0       0
 3372689 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [NEXA Mortgage, LLC].             2025-08-25 12:26:19.276856 tkato    0       0
 3372219 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Shea Mortgage Inc.].              2025-08-25 12:26:19.276856 tkato    0       0
 3370936 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Shea Mortgage Inc.].              2025-08-25 12:26:19.276856 tkato    0       0
 3371274 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].              2025-08-25 12:26:19.276856 tkato    0       0
 3373487 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].              2025-08-25 12:26:19.276856 tkato    0       0
 3372819 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Mortgage.Shop LLC].              2025-08-25 12:26:19.276856 tkato    0       0
 3372282 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [MortgageOne, Inc.].              2025-08-25 12:26:19.276856 tkato    0       0
 3372814 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [DDA Mortgage Inc].               2025-08-25 12:26:19.276856 tkato    0       0
 3371665 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [MPS MORTGAGE LLC].               2025-08-25 12:26:19.276856 tkato    0       0
 3372811 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [BW Mortgage LLC].                2025-08-25 12:26:19.276856 tkato    0       0
 3371648 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc] to [Griggs, Timothy].                 2025-08-25 12:26:19.276856 tkato    0       0
 3371492 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Lower, LLC].                     2025-08-25 12:26:19.276856 tkato    0       0
 3371270 Per HDT 197644 Original Lender updated from [Mutual of Omaha Mortgage Inc.] to [Zyng, Inc.].                     2025-08-25 12:26:19.276856 tkato    0       0
*/

-- end