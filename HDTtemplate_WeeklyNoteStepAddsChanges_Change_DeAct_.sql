
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  
/*
Excel formats 
Attachments (right-click to download)

Add 	--="(" & F2 & ", '" & TRIM(B2) & "', " & C2 & ", " & D2 & "),"
Change	--="(" &F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & C2 & ", NULL," & D2 or E2 & "),"    ... Dept does NOT exists in the spread sheet ... case of deactivation
		--="(" &F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & C2 & ", NULL," & D2 & "),"          ... Active Flag under D
		--="(" &F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & C2 & ", NULL," & D2 & "),"          ... Active Flag under E
Change	--="(" & F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & C2 & ", " & D2 & ", " & E2 & "),"  ... Dept does exists in the spread sheet D for Dept, C NoteStep
Change	--="(" & F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & D2 & ", " & C2 & ", " & E2 & "),"  ... Dept does exists in the spread sheet C for Dept, D NoteStep

1	3	="(" & F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & C2 & ", " & D2 & ", " & E2 & ")," ... Dept does exists in the spread sheet D for Dept, C NoteStep
1	3	="(" & F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & D2 & ", " & C2 & ", " & E2 & ")," ... Dept does exists in the spread sheet C for Dept, D NoteStep

1	4	="(" & F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & D2 & ", " & C2 & ", " & E2 & "),"... Dept does exists in the spread sheet c for Dept, D NoteStep
1	4	="(" & F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & C2 & ", " & D2 & ", " & E2 & "),"... Dept does exists in the spread sheet D for Dept, C NoteStep

1	4	="(" & F2 & ", " & G2 & ", " & A2 & ", '" & TRIM(B2) & "', " & C2 & ", NULL," & D2 & "),"

         UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP , srcDEPARTMENT , srcACTIVE)

1 : Change department
2 : Reactivate & Reword
3 : Reword
4 : Active flag   
5 : Dept and Message

Prairie & Rapids should be kept in sync on all fields.

--
--sample
UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES,                  srcNOTESTEP , srcDEPARTMENT , srcACTIVE)
(1, 4, 6106, 'LESA: Sent HDT to change TNI Set Aside radio dial to NONE due to loan status', 6389, NULL,-1),
(1, 1, 6251, 'Property Charge Letter Notification sent - Insurance', 6533, 56, -1),
(1, 3, 5959, 'Property currently has multiple insurance policies as follows:', 6243, 56, -1),

(1, 3, 6309, 'Hazard Claim: No response from borrower after 30 days', 6591, 32, -1),
(2, 3, 733, 'Call Reason: IRS 1098/1099', 860, 16, -1),
(3, 3, 735, 'Call Reason: Foreclosure', 862, 16, -1),
(4, 3, 738, 'Call Reason: Monthly Statement', 865, 16, -1),
(5, 3, 743, 'Call Reason: Prepayment', 870, 16, -1),

(1, 3, 784, 'HUD Doc Issue - 1st Security Instrument MISSING', 912, NULL,-1),
(2, 3, 791, 'HUD Doc Issue - 1st Security Instrument INCORRECT', 919, NULL,-1),
(3, 3, 798, 'HUD Doc Issue - 1st Security Instrument RESOLVED', 926, NULL,-1),
(4, 2, 2183, 'MERS: Intiated TOS in MERS', 2565, NULL,-1),
(5, 2, 2184, 'MERS: Intiated TOB in MERS', 2566, NULL,-1),

** this is to change and de-activate as these can be the same logic controlled by the change control id in temp table
*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


/*
20250905
[ID:0198828]  Tracking notes  9/5/2025 6:27 PM  Created by  Eric Metzger
Create 1 new Note Step
Modifiy verbiage on two Note Steps
1 new note step added. 2 existing notes changed.   Peer review pending.
*/


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
-- Start of process
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
-- Temp Table ...DATAUPDT 
/* already there
create table DATAUPDT.HDTWeeklyNotes 
	(
SeqNum integer,
ChangeGroup integer
, 
srcIDSLOANMESSAGES integer, 
srcCHRLOANMESSAGES VARCHAR(100), 
srcNOTESTEP integer, 
srcDEPARTMENT smallint,
srcACTIVE integer
,
curIDSLOANMESSAGES integer, 
curCHRLOANMESSAGES VARCHAR(100), 
curNOTESTEP integer, 
curDEPARTMENT smallint,
curACTIVE integer
	)
COMPRESS YES ADAPTIVE
IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTWeeklyNotes  TO group db2_ast;

	select * from DATAUPDT.HDTWeeklyNotes order by SeqNum;
--	select count(*) from DATAUPDT.HDTWeeklyNotes;
*/


--------------------------------------------------------------------------------------------------------------------
DELETE from DATAUPDT.HDTWeeklyNotes;
	
--------------------------------------------------------------------------------------------------------------------
--Source -- SeqNum, ChangeGroup, IDSLOANMESSAGES, CHRLOANMESSAGES, NOTESTEP , DEPARTMENT , ACTIVE
--ChangeGroup
--1 : Change department
--2 : Reactivate & Reword
--3 : Reword
--4 : Active flag   
--5 : Dept and Message
	
insert into DATAUPDT.HDTWeeklyNotes 
	(SeqNum, ChangeGroup
	, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP , srcDEPARTMENT , srcACTIVE
	, curIDSLOANMESSAGES, curCHRLOANMESSAGES, curNOTESTEP , curDEPARTMENT , curACTIVE
	)
	
select 
	UY.SeqNum, UY.ChangeGroup, 

	UY.srcIDSLOANMESSAGES, 
	UY.srcCHRLOANMESSAGES,
	UY.srcNOTESTEP,
	UY.srcDEPARTMENT, 
	UY.srcACTIVE
	,
	TT.IDSLOANMESSAGES,  		
	TT.CHRLOANMESSAGES,  		
	TT.NOTESTEP,  
	TT.DEPARTMENT, 	
	TT.ACTIVE
	
from
(
values

(1, 3, 3780, 'LOSS DRAFT: Received notification of either a new claim or reopened claim', 4356, 32, -1),
(2, 3, 6627, 'LOSS DRAFT: FAR total loss rebuild approved', 6791, 32, -1)

)
UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP , srcDEPARTMENT , srcACTIVE)

inner join  celink.TBLLOANMESSAGES TT
on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
--and UY.srcNOTESTEP = TT.NOTESTEP
	
ORDER BY UY.SeqNum
with ur;
		
		select 
			SeqNum, ChangeGroup, 
			srcIDSLOANMESSAGES, curIDSLOANMESSAGES,  
			srcCHRLOANMESSAGES,	curCHRLOANMESSAGES,  
			srcNOTESTEP,	    curNOTESTEP,  
			srcDEPARTMENT, 	    curDEPARTMENT, 
			srcACTIVE,	        curACTIVE
		 from DATAUPDT.HDTWeeklyNotes UY order by UY.seqnum;

--varify
-- ------ ----------- ------------------ ------------------ ****--------------------------------------------------------------------- *****----------------------------------------- ----------- ----------- ------------- ------------- --------- ---------
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES CURIDSLOANMESSAGES SRCCHRLOANMESSAGES                                                        CURCHRLOANMESSAGES                             SRCNOTESTEP CURNOTESTEP SRCDEPARTMENT CURDEPARTMENT SRCACTIVE CURACTIVE
-- ------ ----------- ------------------ ------------------ ------------------------------------------------------------------------- ---------------------------------------------- ----------- ----------- ------------- ------------- --------- ---------
--      1           3               3780               3780 LOSS DRAFT: Received notification of either a new claim or reopened claim LOSS DRAFT: Received notification of new claim        4356        4356            32            32        -1        -1
--      2           3               6627               6627 LOSS DRAFT: FAR total loss rebuild approved                               LOSS DRAFT: FAR loss draft decision made              6791        6791            32            32        -1        -1


----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- pre execution validation
--4 : Active flag   
select 
	UY.SeqNum, UY.ChangeGroup, UY.srcIDSLOANMESSAGES, UY.srcNOTESTEP, TT.NOTESTEP, UY.srcACTIVE, TT.ACTIVE 

	from DATAUPDT.HDTWeeklyNotes UY 

	inner join celink.TBLLOANMESSAGES TT
		on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
		and UY.srcNOTESTEP = TT.NOTESTEP

	where UY.ChangeGroup = 4
	order by UY.SeqNum
with ur;
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCNOTESTEP NOTESTEP SRCACTIVE ACTIVE
-- ------ ----------- ------------------ ----------- -------- --------- ------
--      1           4               6609        6774     6774         0     -1
-- after
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCNOTESTEP NOTESTEP SRCACTIVE ACTIVE
-- ------ ----------- ------------------ ----------- -------- --------- ------
--      1           4               6609        6774     6774         0      0

-------------------------------------------------------
--1 : Change department
select
	UY.SeqNum, UY.ChangeGroup, UY.srcIDSLOANMESSAGES, UY.srcNOTESTEP , UY.srcDEPARTMENT, TT.DEPARTMENT 
	from DATAUPDT.HDTWeeklyNotes UY 
inner join celink.TBLLOANMESSAGES TT
on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
and UY.srcNOTESTEP = TT.NOTESTEP
where ChangeGroup = 1
order by UY.SeqNum
with ur;
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCNOTESTEP SRCDEPARTMENT DEPARTMENT
-- ------ ----------- ------------------ ----------- ------------- ----------

-----------------------------------------------------
--3 : Reword
select --
	UY.SeqNum, UY.ChangeGroup, UY.srcIDSLOANMESSAGES, UY.srcCHRLOANMESSAGES, TT.CHRLOANMESSAGES, UY.srcNOTESTEP, TT.NOTESTEP
	, TT.IDSLOANMESSAGES 
from DATAUPDT.HDTWeeklyNotes UY
inner join celink.TBLLOANMESSAGES TT
on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
and UY.srcNOTESTEP = TT.NOTESTEP
where ChangeGroup = 3 
rder by UY.SeqNum
with ur;

-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCCHRLOANMESSAGES                                                        CHRLOANMESSAGES                                SRCNOTESTEP NOTESTEP IDSLOANMESSAGES
-- ------ ----------- ------------------ ------------------------------------------------------------------------- ---------------------------------------------- ----------- -------- ---------------
--      1           3               3780 LOSS DRAFT: Received notification of either a new claim or reopened claim LOSS DRAFT: Received notification of new claim        4356     4356            3780
--      2           3               6627 LOSS DRAFT: FAR total loss rebuild approved                               LOSS DRAFT: FAR loss draft decision made              6791     6791            6627

--after
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCCHRLOANMESSAGES                                                        CHRLOANMESSAGES                                                           SRCNOTESTEP NOTESTEP IDSLOANMESSAGES
-- ------ ----------- ------------------ ------------------------------------------------------------------------- ------------------------------------------------------------------------- ----------- -------- ---------------
--      1           3               3780 LOSS DRAFT: Received notification of either a new claim or reopened claim LOSS DRAFT: Received notification of either a new claim or reopened claim        4356     4356            3780
--      2           3               6627 LOSS DRAFT: FAR total loss rebuild approved                               LOSS DRAFT: FAR total loss rebuild approved                                      6791     6791            6627

-----------------------------------------------------
--5 : Dept and Message
select --8
	UY.SeqNum, UY.ChangeGroup, UY.srcIDSLOANMESSAGES, 
	UY.srcCHRLOANMESSAGES,TT.CHRLOANMESSAGES, 
	UY.srcNOTESTEP , 
	UY.srcDEPARTMENT, TT.DEPARTMENT 

from DATAUPDT.HDTWeeklyNotes  UY
inner join celink.TBLLOANMESSAGES TT
on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
and UY.srcNOTESTEP = TT.NOTESTEP
where ChangeGroup = 5
order by UY.SeqNum
with ur;
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCCHRLOANMESSAGES                                   CHRLOANMESSAGES                        SRCNOTESTEP SRCDEPARTMENT DEPARTMENT
-- ------ ----------- ------------------ ---------------------------------------------------- -------------------------------------- ----------- ------------- ----------

--
--select 
--	TT.IDSLOANMESSAGES,
--	TT.NOTESTEP,
--	TT.DEPARTMENT, 
--	TT.CHRLOANMESSAGES,
--	TT.Active 
--
--	from celink.TBLLOANMESSAGES TT
--	where TT.IDSLOANMESSAGES = 4702
--	and   TT.NOTESTEP = 5059
--for read only with ur;
--

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
--updateeeeeeee
--------------------------------------------------------------------------------------------------------------------
--where UY.ChangeGroup = 1 --	1: Change department from Miscellaneous to HUD Assignment
MERGE INTO celink.TBLLOANMESSAGES TT
	using
	(
		select 
		SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcNOTESTEP , srcDEPARTMENT 
		from DATAUPDT.HDTWeeklyNotes 
		where ChangeGroup = 1
	) 
	UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcNOTESTEP , srcDEPARTMENT)
	on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
	and UY.srcNOTESTEP = TT.NOTESTEP
WHEN MATCHED THEN UPDATE 
	Set
	TT.DEPARTMENT = UY.srcDEPARTMENT
;

-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCNOTESTEP SRCDEPARTMENT
-- ------ ----------- ------------------ ----------- -------------
--      1           1               6251        6533            56


--------------------------------------------------------------------------------------------------------------------
----where UY.ChangeGroup = 2--	2: Reactivate & Reword
--MERGE INTO celink.TBLLOANMESSAGES TT
--	using
--	(
--		select
--		SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP , srcACTIVE
--	 	from DATAUPDT.HDTWeeklyNotes 
--	 	where ChangeGroup = 2
--	) 
--	UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP , srcACTIVE)
--	on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
--	and UY.srcNOTESTEP = TT.NOTESTEP
--WHEN MATCHED THEN UPDATE 
--	Set
--	TT.CHRLOANMESSAGES = UY.srcCHRLOANMESSAGES,
--	TT.ACTIVE = UY.srcACTIVE
--;


--------------------------------------------------------------------------------------------------------------------
--where UY.ChangeGroup = 3--	3: Reword
MERGE INTO celink.TBLLOANMESSAGES TT
	using
	(
		select
		SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP
	 	from DATAUPDT.HDTWeeklyNotes 
	 	where ChangeGroup = 3 
	) 
	UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP)
	on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
	and UY.srcNOTESTEP = TT.NOTESTEP
WHEN MATCHED THEN UPDATE 
	Set
	TT.CHRLOANMESSAGES = UY.srcCHRLOANMESSAGES
;

-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCCHRLOANMESSAGES SRCNOTESTEP
-- ------ ----------- ------------------ ------------------ -----------
--      1           3               4951 Title Issue Status        5301

--------------------------------------------------------------------------------------------------------------------
--where UY.ChangeGroup = 4--	4: Activate flag
MERGE INTO celink.TBLLOANMESSAGES TT
	using
	(
		select
		SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcNOTESTEP, srcACTIVE
	 	from DATAUPDT.HDTWeeklyNotes 
	 	where ChangeGroup = 4
	 	order by SeqNum
	) 
	UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcNOTESTEP, srcACTIVE)
	on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
	and UY.srcNOTESTEP = TT.NOTESTEP
WHEN MATCHED THEN UPDATE 
	Set
	TT.ACTIVE = UY.srcACTIVE
;
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCNOTESTEP SRCACTIVE
-- ------ ----------- ------------------ ----------- ---------
--      1           4               6609        6774         0

--------------------------------------------------------------------------------------------------------------------
----where UY.ChangeGroup = 5--	4: Re-word and Dept
MERGE INTO celink.TBLLOANMESSAGES TT
	using
	(
		select
		SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP , srcDEPARTMENT 
	 	from DATAUPDT.HDTWeeklyNotes 
	 	where ChangeGroup = 5
	) 
	UY (SeqNum, ChangeGroup, srcIDSLOANMESSAGES, srcCHRLOANMESSAGES, srcNOTESTEP , srcDEPARTMENT)
	on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
	and UY.srcNOTESTEP = TT.NOTESTEP
WHEN MATCHED THEN UPDATE 
	Set
	TT.CHRLOANMESSAGES = UY.srcCHRLOANMESSAGES,
	TT.DEPARTMENT = UY.srcDEPARTMENT
;

	-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES SRCCHRLOANMESSAGES           SRCNOTESTEP SRCDEPARTMENT
	-- ------ ----------- ------------------ ---------------------------- ----------- -------------
	--      1           5               4847 Bailee Letter Completed             5199            21
	--      2           5               4848 Bailee Letter Sent to Client        5200            21


--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
-- End of process
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------



--refs:
--------------------------------------------------------------------------------------------------------------------
--backup
--ChangeGroup
--	1: Change department 
--	2: Reactivate & Reword
--	3: Reword
--	4: Deactivate
--  5: Re-word & Dept

select 
	UY.SeqNum, UY.ChangeGroup,
	UY.srcIDSLOANMESSAGES,	UY.curIDSLOANMESSAGES,  TT.IDSLOANMESSAGES,  
	UY.srcCHRLOANMESSAGES,	UY.curCHRLOANMESSAGES,  TT.CHRLOANMESSAGES,  
	UY.srcNOTESTEP,			UY.curNOTESTEP,  		TT.NOTESTEP,  
	UY.srcDEPARTMENT, 		UY.curDEPARTMENT, 		TT.DEPARTMENT, 
	UY.srcACTIVE,			UY.curACTIVE,			TT.ACTIVE

	from DATAUPDT.HDTWeeklyNotes UY

	inner join  celink.TBLLOANMESSAGES TT
	on  UY.srcIDSLOANMESSAGES = TT.IDSLOANMESSAGES
	and UY.srcNOTESTEP = TT.NOTESTEP
	
--	where UY.ChangeGroup = 1 --	1: Change department from Miscellaneous to HUD Assignment
--	where UY.ChangeGroup = 2--	2: Reactivate & Reword
--	where UY.ChangeGroup = 3--	3: Reword
--	where UY.ChangeGroup = 4--	4: Activate flag
--	where UY.ChangeGroup = 5--	5: Re-word & Dept
	
	ORDER BY UY.SeqNum
with ur;

-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES CURIDSLOANMESSAGES IDSLOANMESSAGES SRCCHRLOANMESSAGES                   CURCHRLOANMESSAGES                   CHRLOANMESSAGES                      SRCNOTESTEP CURNOTESTEP NOTESTEP SRCDEPARTMENT CURDEPARTMENT DEPARTMENT SRCACTIVE CURACTIVE ACTIVE
-- ------ ----------- ------------------ ------------------ --------------- ------------------------------------ ------------------------------------ ------------------------------------ ----------- ----------- -------- ------------- ------------- ---------- --------- --------- ------
--      1           5               4847               4847            4847 Bailee Letter Completed              LR: Bailee Letter Completed          Bailee Letter Completed                     5199        5199     5199            21             2         21        -1        -1     -1
--      2           5               4848               4848            4848 Bailee Letter Sent to Client         LR: Bailee Letter Sent to Client     Bailee Letter Sent to Client                5200        5200     5200            21             2         21        -1        -1     -1
--      3           1               4853               4853            4853 Bailee Letter Sent to Attorney       Bailee Letter Sent to Attorney       Bailee Letter Sent to Attorney              5205        5205     5205            21             2         21        -1        -1     -1
--      4           1               4854               4854            4854 Bailee Letter Received from Attorney Bailee Letter Received from Attorney Bailee Letter Received from Attorney        5206        5206     5206            21             2         21        -1        -1     -1
--      5           3               2786               2786            2786 Foreclosure: Checklist Assigned      Foreclosure: RDD Checklist Assigned  Foreclosure: Checklist Assigned             3272        3272     3272             3             3          3        -1        -1     -1
--      6           4               6178               6178            6178 LR: MAIL RECD /                      LR: MAIL RECD /                      LR: MAIL RECD /                             6460        6460     6460          NULL             2          2         0        -1      0


--
select * 
	from CELINK.TBLDEPARTMENT 
	where DEPARTMENTID in (28,35)
	order by DEPARTMENTID 
with ur;
-- DEPARTMENTID DEPARTMENT NAME DIVISIONID SUPERVISOR NAME DEPARTMENTABBR
-- ------------ --------------- ---------- --------------- --------------
--           28 HUD Assignment           0 none            NULL
--           35 Miscellaneous            0 none            NULL




select	IdsLoanMessages,NOTESTEP, * from celink.TBLLOANMESSAGES where IDSLOANMESSAGES = 4454 order by IdsLoanMessages desc with ur; 
select	IdsLoanMessages,NOTESTEP, * from celink.TBLLOANMESSAGES where NOTESTEP = 4822 order by IdsLoanMessages desc with ur; 




--
new ... RPA review - bor needs make lump sum payment and monthly payments or RPA will break Lump Sum IAO
old ... RPA review - bor needs to commit to lump sum payment to be eligible for an RPA apprvl - lump sum nee
	
	
	
	
-- SEQNUM CHANGEGROUP SRCIDSLOANMESSAGES CURIDSLOANMESSAGES SRCCHRLOANMESSAGES                                               CURCHRLOANMESSAGES                                               SRCNOTESTEP CURNOTESTEP SRCDEPARTMENT CURDEPARTMENT SRCACTIVE CURACTIVE
-- ------ ----------- ------------------ ------------------ ---------------------------------------------------------------- ---------------------------------------------------------------- ----------- ----------- ------------- ------------- --------- ---------
--      1           3                991                991 LOSS DRAFT: Completed and cleared - remaining funds released     Insurance Claim: Completed and cleared - funds sent to borrowr          1143        1143            32            32        -1        -1
--      2           3               1105               1105 LOSS DRAFT: Check Received - Returned to Bor for endorsement     Insurance Claim: Check Received - Sent back for endorsement             1264        1264            32            32        -1        -1
--      3           3               1106               1106 LOSS DRAFT: Check Received - Deposit in LD account               Insurance Claim: Check Received - Sent for deposit                      1265        1265            32            32        -1        -1
--      4           3               1108               1108 LOSS DRAFT: Check Received - Endorsed and Released               Insurance Claim: Check Received - Sign off                              1267        1267            32            32        -1        -1
--      5           3               1525               1525 LOSS DRAFT: Form 176 submitted to Fannie Mae                     Insurance Claim: Form 176 submitted to Fannie Mae                       1825        1825            32            32        -1        -1
--      6           3               1526               1526 LOSS DRAFT: Form 176 response rec from Fannie Mae                Insurance Claim: Form 176 response rec from Fannie Mae                  1826        1826            32            32        -1        -1
--      7           4                988                988 Insurance Claim: Communication                                   Insurance Claim: Communication                                          1140        1140          NULL            32         0        -1
--      8           4                989                989 Insurance Claim: Reactivate/Disbursements Authorized             Insurance Claim: Reactivate/Disbursements Authorized                    1141        1141          NULL            32         0        -1
--      9           4                990                990 Insurance Claim: 60 day letter sent to borrower                  Insurance Claim: 60 day letter sent to borrower                         1142        1142          NULL            32         0        -1
--     10           4                992                992 Insurance Claim: Insurance Loss                                  Insurance Claim: Insurance Loss                                         1144        1144          NULL            32         0        -1
--     11           4                993                993 Insurance Claim: Introductory letter mailed to borrower          Insurance Claim: Introductory letter mailed to borrower                 1145        1145          NULL            32         0        -1
--     12           4                994                994 Insurance Claim: Notice of completion received                   Insurance Claim: Notice of completion received                          1146        1146          NULL            32         0        -1
--     13           4                995                995 Insurance Claim: Progress Update                                 Insurance Claim: Progress Update                                        1147        1147          NULL            32         0        -1
--     14           4                996                996 Insurance Claim: Reactivation Authorized                         Insurance Claim: Reactivation Authorized                                1148        1148          NULL            32         0        -1
--     15           4               1094               1094 Insurance Claim: Sign-Off sent to Homeowner                      Insurance Claim: Sign-Off sent to Homeowner                             1253        1253          NULL            32         0        -1
--     16           4               1095               1095 Insurance Claim: Sign-Off sent to Karen for Endorsement          Insurance Claim: Sign-Off sent to Karen for Endorsement                 1254        1254          NULL            32         0        -1
--     17           4               1096               1096 Insurance Claim: Unendorsed check sent to H/O for Endorsement    Insurance Claim: Unendorsed check sent to H/O for Endorsement           1255        1255          NULL            32         0        -1
--     18           4               1097               1097 Insurance Claim: First Draw sent to Homeowner                    Insurance Claim: First Draw sent to Homeowner                           1256        1256          NULL            32         0        -1
--     19           4               1098               1098 Insurance Claim: Second Draw sent to Homeowner                   Insurance Claim: Second Draw sent to Homeowner                          1257        1257          NULL            32         0        -1
--     20           4               1099               1099 Insurance Claim: Additional Draw sent to Homeowner               Insurance Claim: Additional Draw sent to Homeowner                      1258        1258          NULL            32         0        -1
--     21           4               1100               1100 Insurance Claim: Final Draw sent to Homeowner                    Insurance Claim: Final Draw sent to Homeowner                           1259        1259          NULL            32         0        -1
--     22           4               1101               1101 Insurance Claim: draw rec approved and scanned                   Insurance Claim: draw rec approved and scanned                          1260        1260          NULL            32         0        -1
--     23           4               1102               1102 Insurance Claim Claim received/opened                            Insurance Claim Claim received/opened                                   1261        1261          NULL            32         0        -1
--     24           4               1103               1103 Insurance Claim: General                                         Insurance Claim: General                                                1262        1262          NULL            32         0        -1
--     25           4               1104               1104 Insurance Claim: Draw Requested                                  Insurance Claim: Draw Requested                                         1263        1263          NULL            32         0        -1
--     26           4               1109               1109 Insurance Claim: Document Received - Inspection results          Insurance Claim: Document Received - Inspection results                 1268        1268          NULL            32         0        -1
--     27           4               1110               1110 Insurance Claim: Document Received - Correspondence              Insurance Claim: Document Received - Correspondence                     1269        1269          NULL            32         0        -1
--     28           4               1111               1111 Insurance Claim: Document Received - Work Contract               Insurance Claim: Document Received - Work Contract                      1270        1270          NULL            32         0        -1
--     29           4               1112               1112 Insurance Claim: Document Received - ACO                         Insurance Claim: Document Received - ACO                                1271        1271          NULL            32         0        -1
--     30           4               1113               1113 Insurance Claim: Document Received - ICA                         Insurance Claim: Document Received - ICA                                1272        1272          NULL            32         0        -1
--     31           4               1114               1114 Insurance Claim: Document Received - ROL                         Insurance Claim: Document Received - ROL                                1273        1273          NULL            32         0        -1
--     32           4               1115               1115 Insurance Claim: Document Received - W9                          Insurance Claim: Document Received - W9                                 1274        1274          NULL            32         0        -1
--     33           4               1116               1116 Insurance Claim: Follow-up - Borrower phone call & status letter Insurance Claim: Follow-up - Borrower phone call & status letter        1275        1275          NULL            32         0        -1
--     34           4               1117               1117 Insurance Claim: Follow-up - Insurance Co. phone call            Insurance Claim: Follow-up - Insurance Co. phone call                   1276        1276          NULL            32         0        -1
--     35           4               1118               1118 Insurance Claim: Follow-up - Borrower status letter              Insurance Claim: Follow-up - Borrower status letter                     1277        1277          NULL            32         0        -1
--     36           4               1119               1119 Insurance Claim: Follow-up - Contractor phone call               Insurance Claim: Follow-up - Contractor phone call                      1278        1278          NULL            32         0        -1
--     37           4               1120               1120 Insurance Claim: Follow-up - Borrower phone call                 Insurance Claim: Follow-up - Borrower phone call                        1279        1279          NULL            32         0        -1
--     38           4               1139               1139 Insurance Claim: Total Loss Claim Opened                         Insurance Claim: Total Loss Claim Opened                                1303        1303          NULL            32         0        -1
--     39           4               1140               1140 Insurance Claim: Total Loss Claim Closed                         Insurance Claim: Total Loss Claim Closed                                1304        1304          NULL            32         0        -1
--     40           4               1181               1181 Insurance Claim: Interest Check Received Mailing to Borrower     Insurance Claim: Interest Check Received Mailing to Borrower            1349        1349          NULL            32         0        -1
--     41           4               1238               1238 Insurance Claim:Closed due to lack of response                   Insurance Claim:Closed due to lack of response                          1409        1409          NULL            32         0        -1
--     42           4               1239               1239 Insurance Claim: Final Notice sent on inactive claim             Insurance Claim: Final Notice sent on inactive claim                    1410        1410          NULL            32         0        -1
--     43           4               1312               1312 Insurance Claim: Interest Report Received                        Insurance Claim: Interest Report Received                               1556        1556          NULL            32         0        -1
--     44           4               1393               1393 Insurance Claim: Stalled Progress Letter sent                    Insurance Claim: Stalled Progress Letter sent                           1650        1650          NULL            32         0        -1
--     45           4               1394               1394 Insurance Claim: Claim Completed                                 Insurance Claim: Claim Completed                                        1651        1651          NULL            32         0        -1
--     46           4               1395               1395 Insurance Claim: Claim Closed/Funds Applied to Loan              Insurance Claim: Claim Closed/Funds Applied to Loan                     1652        1652          NULL            32         0        -1
--     47           4               1396               1396 Insurance Claim: Claim Closed/Funds Sent to Investor             Insurance Claim: Claim Closed/Funds Sent to Investor                    1653        1653          NULL            32         0        -1
--     48           4               1397               1397 Insurance Claim: Insurance Estimate Received                     Insurance Claim: Insurance Estimate Received                            1654        1654          NULL            32         0        -1
--     49           4               1527               1527 Insurance Claim: Fax/email received                              Insurance Claim: Fax/email received                                     1827        1827          NULL            32         0        -1
--     50           4               1528               1528 Insurance Claim: Fax/email sent                                  Insurance Claim: Fax/email sent                                         1828        1828          NULL            32         0        -1
--     51           4               1529               1529 Insurance Claim: Inbound Call                                    Insurance Claim: Inbound Call                                           1829        1829          NULL            32         0        -1
--     52           4               1530               1530 Insurance Claim: Outbound Call                                   Insurance Claim: Outbound Call                                          1830        1830          NULL            32         0        -1
--     53           4               1704               1704 Insurance Claim: Req Claim Funds be Sent to Investor             Insurance Claim: Req Claim Funds be Sent to Investor                    2016        2016          NULL            32         0        -1
--     54           4               1837               1837 Insurance Claim: Inspection Ordered                              Insurance Claim: Inspection Ordered                                     2199        2199          NULL            32         0        -1
--     55           4               2346               2346 Insurance Claim: Claim Closed/Repairs Incomplete                 Insurance Claim: Claim Closed/Repairs Incomplete                        2763        2763          NULL            32         0        -1
--     56           4               3721               3721 HUD 90-day Optional Extension Expired                            HUD 90-day Optional Extension Expired                                   4297        4297          NULL            32         0        -1
--     57           4               3769               3769 LOSS DRAFT: Check Received                                       LOSS DRAFT: Check Received                                              4345        4345          NULL            32         0        -1
--     58           4               3770               3770 LOSS DRAFT: Contract Received                                    LOSS DRAFT: Contract Received                                           4346        4346          NULL            32         0        -1
--     59           4               3775               3775 LOSS DRAFT: Inspection Ordered                                   LOSS DRAFT: Inspection Ordered                                          4351        4351          NULL            32         0        -1
--     60           4               3776               3776 LOSS DRAFT: Inspection Received - Complete                       LOSS DRAFT: Inspection Received - Complete                              4352        4352          NULL            32         0        -1
--     61           4               3781               3781 LOSS DRAFT: SOD Received                                         LOSS DRAFT: SOD Received                                                4357        4357          NULL            32         0        -1
--     62           4               3997               3997 LOSS DRAFT: Communication                                        LOSS DRAFT: Communication                                               4585        4585          NULL            32         0        -1
--     63           4               3999               3999 LOSS DRAFT: Endorsed                                             LOSS DRAFT: Endorsed                                                    4587        4587          NULL            32         0        -1
--     64           4               4002               4002 LOSS DRAFT: Inspection to be reviewed                            LOSS DRAFT: Inspection to be reviewed                                   4590        4590          NULL            32         0        -1
--     65           4               4003               4003 LOSS DRAFT: Monitored                                            LOSS DRAFT: Monitored                                                   4591        4591          NULL            32         0        -1
--     66           4               4008               4008 LOSS DRAFT: Substitution of Collateral                           LOSS DRAFT: Substitution of Collateral                                  4596        4596          NULL            32         0        -1
--     67           4               4009               4009 LOSS DRAFT: Supervisor call                                      LOSS DRAFT: Supervisor call                                             4597        4597          NULL            32         0        -1
--     68           4               4013               4013 LOSS DRAFT: Not Monitored                                        LOSS DRAFT: Not Monitored                                               4601        4601          NULL            32         0        -1
--     69           4               4020               4020 LOSS DRAFT: Blue Prints Rcvd                                     LOSS DRAFT: Blue Prints Rcvd                                            4608        4608          NULL            32         0        -1
--     70           4               4025               4025 LOSS DRAFT: Ho Cert Rcvd                                         LOSS DRAFT: Ho Cert Rcvd                                                4613        4613          NULL            32         0        -1
--     71           4               4077               4077 HUD Optional 90-Day Extension Approved by Client                 HUD Optional 90-Day Extension Approved by Client                        4665        4665          NULL            32         0        -1
	