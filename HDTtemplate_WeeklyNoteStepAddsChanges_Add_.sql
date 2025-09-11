/* ********************************************************************************************************************************************
Excel formats
Add 	-- ="(" & F2 & ", '" & TRIM(B2) & "', " & C2 & ", " & D2 & "),"
Add     -- ="(" & H2 & ", '" & TRIM(B2) & "', " & C2 & ", " & D2 & "),"
Add with active flag -- 6673	="(" & H2 & ", '" & TRIM(B2) & "', " & C2 & ", " & D2 & ", " & E2 & "),"
	 	
Change	-- 
*********************************************************************************************************************************************** */

--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------

/*
20250905
[ID:0198828]  Tracking notes  9/5/2025 6:27 PM  Created by  Eric Metzger
Create 1 new Note Step
Modifiy verbiage on two Note Steps

1 new note step added. 
Peer review pending.
*/

   
--------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------
-- inserttttttttt

Insert into celink.TBLLOANMESSAGES
--(IdsLoanMessages, CHRLOANMESSAGES, NOTESTEP, DEPARTMENT) -- ACTIVE ... no need, set as default -1
(IdsLoanMessages, CHRLOANMESSAGES, NOTESTEP, DEPARTMENT, ACTIVE) 

with P (NoteID, TheNote, NoteStep, Dept, Active) as 
(values

--(6670, 'FAR Borrower Assist Assignment Efforts', 6814, 50, -1),
--(6671, 'Declined to provide additional contact information', 6815, 50, -1)
--(6672, 'RPA-1523', 15058, 35, -1)

(6673, 'Loss Draft: Client prepayment follow up completed.', 6816, 32, -1)

)
select * from P order by NoteID
;

/* select
 NOTEID THENOTE                                            NOTESTEP DEPT ACTIVE
 ------ -------------------------------------------------- -------- ---- ------
   6673 Loss Draft: Client prepayment follow up completed.     6816   32     -1
*/

-- --------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ---------- ------
-- result
select	IdsLoanMessages,NOTESTEP, * from celink.TBLLOANMESSAGES where IdsLoanMessages >= 5738 order by IdsLoanMessages desc with ur; 
/*
 IDSLOANMESSAGES NOTESTEP IDSLOANMESSAGES CHRLOANMESSAGES                                                                                      NOTESTEP DEPARTMENT ACTIVE
 --------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ---------- ------
            6673     6816            6673 Loss Draft: Client prepayment follow up completed.                                                       6816         32     -1
            6672    15058            6672 RPA-1523                                                                                                15058         35     -1
            6671     6815            6671 Declined to provide additional contact information                                                       6815         50     -1
            6670     6814            6670 FAR Borrower Assist Assignment Efforts                                                                   6814         50     -1
 */

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
----check exsist notes 
select	IdsLoanMessages,NOTESTEP, * from celink.TBLLOANMESSAGES order by IdsLoanMessages desc with ur; 
-- IDSLOANMESSAGES NOTESTEP IDSLOANMESSAGES CHRLOANMESSAGES                                                                                      NOTESTEP DEPARTMENT ACTIVE
-- --------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ---------- ------
--            6672    15058            6672 RPA-1523                                                                                                15058         35     -1
--            6671     6815            6671 Declined to provide additional contact information                                                       6815         50     -1
--            6670     6814            6670 FAR Borrower Assist Assignment Efforts                                                                   6814         50     -1
--            6669     6813            6669 Appraisal Variance QC                                                                                    6813          3     -1
--            6668     6812            6668 Certified                                                                                                6812         33     -1

-- --            
select max(IdsLoanMessages) as v_maxIDS, max(IdsLoanMessages)+1 as v_New_maxIDS  from celink.TBLLOANMESSAGES with ur; 	
-- V_MAXIDS V_NEW_MAXIDS
-- -------- ------------
--     6672         6673

--end

-- --------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ---------- ------
-- --------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ---------- ------
-- refs: 

with P (NoteID, TheNote, NoteStep, Dept, Active) as 
(values
(6404, 'Appraisal Variance Reviewed', 6340, 3, -1)
,
(6405, 'Appraisal Quote Letter Provided', 6341, 1, -1)
)

select 
P.*,
T.* 
from P 
inner join celink.TBLLOANMESSAGES T
on P.NOTESTEP = T.NoteStep
order by NoteID
;
          
select	NOTESTEP, IdsLoanMessages,* from celink.TBLLOANMESSAGES order by notestep desc with ur;        
-- IDSLOANMESSAGES NOTESTEP IDSLOANMESSAGES CHRLOANMESSAGES                                                                                      NOTESTEP DEPARTMENT ACTIVE
-- --------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ---------- ------
--            6629     6793            6629 FC Appraisal Fee                                                                                         6793          3     -1
--            6628     6792            6628 LOSS DRAFT: FAR loss draft review required                                                               6792         32     -1
--            6627     6791            6627 LOSS DRAFT: FAR loss draft decision made                                                                 6791         32     -1


select max(notestep) as v_maxNOTE, max(notestep)+1 as v_New_maxNOTE from celink.TBLLOANMESSAGES where notestep < 10000 with ur;
-- V_MAXIDS V_NEW_MAXIDS
-- -------- ------------
--     6629         6630


--select * from celink.TBLLOANMESSAGES where notestep in () with ur;

select * 
	from CELINK.TBLDEPARTMENT 
	--where DEPARTMENTID in (61,48,17) --(0,56,57,55,51,17,3)
	order by DEPARTMENTID 
with ur;
	-- DEPARTMENTID DEPARTMENT NAME    DIVISIONID SUPERVISOR NAME DEPARTMENTABBR
	-- ------------ ------------------ ---------- --------------- --------------
	--           17 Deed In Lieu                0 none            NULL
	--           48 Request Processing          0 none            NULL
	--           61 T&I Admin - HHF             0 Default Name    NULL -- not in FNCLTEST

	
	-- DEPARTMENTID DEPARTMENT NAME      DIVISIONID SUPERVISOR NAME DEPARTMENTABBR
	-- ------------ -------------------- ---------- --------------- --------------
	--            3 Foreclosure                   1 stacie.garcia   FCL
	--           17 Deed In Lieu                  0 none            NULL
	--           50 Spoc                          0 none            NULL
	--           51 Tax                           0 none            NULL
	--           55 T&I Admin - LESA              0 Default Name    NULL
	--           56 T&I Admin- Insurance          0 Default Name    NULL
	--           57 T&I Admin- Tax                0 Default Name    NULL



------------------------------------------------------------------------------------------------------
--ref/sample
--(4123, 'Borrower Right Party Contact', 4711, 50),

--with tmp_I as (select max(IdsLoanMessages)+1 as v_maxIDS from celink.TBLLOANMESSAGES),
--	 tmp_N as (select max(notestep)+1 as v_maxNOTE from celink.TBLLOANMESSAGES)
--select
--	v_maxIDS,
--	'Rcvd notice of delinq taxes from HUD Assignment/ Sent 10 day letter to borrower/ LERETA will complete redemption after',
--	length ('Rcvd notice delq taxes from HUD Assignment/Sent 10 day ltr to borr/LERETA will compl redmptn after') as LenNote,	
--	v_maxNOTE,	
--	50
--	from tmp_I, tmp_N
--;

--with tmpTest (IdsLMsg, LMSG, NSTP, DPT)
select *
from 
(
values
(4453, 'HUD Assignment: Unassignable: Default Balance', 4821, 28),
(4454, 'HUD Assignment: Unassignable: Client Denied Assignment', 4822, 28),
(4455, 'DIL: SPOC call request complete', 4823, 17),
(4456, 'DIL: Title curative requested', 4824, 17),
(4457, 'DIL: Title curative request complete', 4825, 17)
) uy(IdsLMsg, LMSG, NSTP, DPT)
order by UY.IdsLMsg
;


select 
	a.IdsLMsg, a.LMSG, a.NSTP, a.DPT
	from tmpTest a , celink.TBLLOANMESSAGES ;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
/* ref similar ticket
--HDT 21820
select 
	*	
	from celink.TBLLOANMESSAGES 
	where NoteStep in 
	(4626,
	4627, 4628,4629,4630,4631,4632,4633,4634,4635,4636,4637,4638
	)
	order by notestep  
--	order by IDSLOANMESSAGES 
with ur;

select * from celink.tblloannotes where notestep in (4626,4627) order by IDSLOANNOTES desc with ur;
  
  
 --HDT 22863
select 
	*	
	from celink.TBLLOANMESSAGES 
	where IDSLOANMESSAGES in 
	(3997,3998,3999,4000,4001,4002,4003,4004,4005,4006)
--	order by notestep  
	order by IDSLOANMESSAGES 
with ur;

--requested
--3997	LOSS DRAFT: Commuicatioin
--3998	LOSS DRAFT: Correspondence rcvd
--3999	LOSS DRAFT: Endorsed
--4000	LOSS DRAFT: HUD Assignment - Communication
--4001	LOSS DRAFT: HUD Assignment - Follow up ltr mailed
--4002	LOSS DRAFT: Inspection to be reviewed
--4003	LOSS DRAFT: Monitored
--4004	LOSS DRAFT: Paid off - Disbursement requested
--4005	LOSS DRAFT: Prepayment requested
--4006	LOSS DRAFT: Progress Report Rcvd

--production  after change
-- IDSLOANMESSAGES CHRLOANMESSAGES                                   NOTESTEP DEPARTMENT ACTIVE
-- --------------- ------------------------------------------------- -------- ---------- ------
--            3997 Loss Draft: Commuicatioin                             4585         32     -1
--            3998 Loss Draft: Correspondence rcvd                       4586         32     -1
--            3999 Loss Draft: Endorsed                                  4587         32     -1
--            4000 Loss Draft: HUD Assignment - Communication            4588         32     -1
--            4001 Loss Draft: HUD Assignment - Follow up ltr mailed     4589         32     -1
--            4002 Loss Draft: Inspection to be reviewed                 4590         32     -1
--            4003 Loss Draft: Monitored                                 4591         32     -1
--            4004 Loss Draft: Paid off - Disbursement requested         4592         32     -1
--            4005 Loss Draft: Prepayment requested                      4593         32     -1
--            4006 Loss Draft: Progress Report Rcvd                      4594         32     -1


select * from celink.tblloannotes where notestep = 4585 order by IDSLOANNOTES desc with ur; --0 row
select * from celink.tblloannotes where notestep = 4586 order by IDSLOANNOTES desc with ur; --0 row

select * from celink.tblloannotes 
	where notestep in (4585,4586,4587,4588,4589,4590,4591,4592,4593,4594) 
	order by IDSLOANNOTES desc 
with ur;
*/