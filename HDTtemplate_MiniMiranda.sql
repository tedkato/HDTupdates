/* 
20221121

INCIDENT #115087   Nov 18, 2022 at 8:47 PM  Norlan Calero
Other
Please turn on the Mini Miranda flag on these 3 loans. 

Loan Number
3276873
3268643
3268116

--CK
Cyndie King
Nov 18, 2022 at 7:21 PM
Ted,
This is tblStatusTracking.MINIMIRANDA Go ahead and set these to -1 (and any that follow as requested)
--*--
Mini Miranda flag set to true for 3 loans.  Pending verification.
*/

-----------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------
--HDTs

/*
20250805
196226	Ted Kato	MINI Miranda flag	Isaac Joseph		Low	8/5/2025 15:36
Please turn on Mini-Miranda Flag for the subject loan # 3363743
="(" & B2 & ", 195466, 'Isaac Joseph', " & C2 & ", -1),"
(1, 196226, 'Isaac Joseph', 3363743, -1)
1 loan updated.  Peer review pending.
*/

-- ----------- --------------------------------------------- -------------------------- ----- - -
-- ----------- --------------------------------------------- -------------------------- ----- - -

--------------------------------------------------------------------
-- validation
SELECT 
SeqNum, HdtNum, Requester, Loan, Good, T.MINIMIRANDA "Current"
from 
(VALUES

(1, 196226, 'Isaac Joseph', 3363743, -1)

) P (SeqNum, HdtNum, Requester, Loan, Good)
inner join celink.TBLSTATUSTRACKING T
on  P.Loan = T.statusloan
order by P.SeqNum
;
/*
 SEQNUM HDTNUM REQUESTER    LOAN    GOOD Current
 ------ ------ ------------ ------- ---- -------
      1 196226 Isaac Joseph 3363743   -1       0

 SEQNUM HDTNUM REQUESTER    LOAN    GOOD Current
 ------ ------ ------------ ------- ---- -------
      1 196226 Isaac Joseph 3363743   -1      -1
*/

--------------------------------------------------------------------
-- note ... direct insert
--Insert into celink.tblLoanNotes 
--	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)
Select 
--	SeqNum,	
	Loan as "Loan Number",
--	'N'  as "Priority (Y/N)", 
--	''   as "Note Step Number",
--	''   as "Step Date Completed (YYYY-MM-DD)", 
--	'Per HDT ' || HDTNum || ' (' || Requester || ') Mini Miranda flag set to ' ||
	'Per HDT ' || HDTNum || ' Mini Miranda flag set to ' ||
	case P.Good 
	when -1  then 'True' 
	when 0  then 'False' 
	else 'False'
	end 
	|| 	'.' 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
From 
(VALUES

(1, 196226, 'Isaac Joseph', 3363743, -1)

) P (SeqNum, HdtNum, Requester, Loan, Good)

inner join celink.TBLSTATUSTRACKING X
on P.Loan = X.statusloan
--and P.Good <> X.MINIMIRANDA --... need to post notes ... 
Order by SeqNum
;
-- Loan Number 2                                             3                          4     5 6
-- ----------- --------------------------------------------- -------------------------- ----- - -
--     3363743 Per HDT 196226 Mini Miranda flag set to True. 2025-08-05 16:34:22.869663 tkato 0 0

--------------------------------------------------------------------
--------------------------------------------------------------------
MERGE into celink.TBLSTATUSTRACKING TT
USING
(
	SELECT 
	SeqNum, HdtNum, Requester, Loan, Good, T.MINIMIRANDA "Current"
	from 
	(VALUES

(1, 196226, 'Isaac Joseph', 3363743, -1)

	) P (SeqNum, HdtNum, Requester, Loan, Good)
	inner join celink.TBLSTATUSTRACKING T
	on  P.Loan = T.statusloan
	and P.Good <> T.MINIMIRANDA  
	order by P.SeqNum
	
)UY
ON UY.Loan = TT.statusloan
WHEN MATCHED THEN UPDATE 
Set
TT.MINIMIRANDA = UY.Good
;

/*
select
 SEQNUM HDTNUM REQUESTER       LOAN    GOOD Current
 ------ ------ --------------- ------- ---- -------
*/

--------------------------------------------------------------------
-- note ... direct insert
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)
Select 
--	SeqNum,	
	Loan as "Loan Number",
--	'N'  as "Priority (Y/N)", 
--	''   as "Note Step Number",
--	''   as "Step Date Completed (YYYY-MM-DD)", 
--	'Per HDT ' || HDTNum || ' (' || Requester || ') Mini Miranda flag set to ' ||
	'Per HDT ' || HDTNum || ' Mini Miranda flag set to ' ||
	case P.Good 
	when -1  then 'True' 
	when 0  then 'False' 
	else 'False'
	end 
	|| 	'.' 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
From 
(VALUES
(1, 196226, 'Isaac Joseph', 3363743, -1)
) P (SeqNum, HdtNum, Requester, Loan, Good)
inner join celink.TBLSTATUSTRACKING X
on P.Loan = X.statusloan
--and P.Good <> X.MINIMIRANDA --... need to post notes ... 
Order by SeqNum
;
 
/*
 Loan Number 2                                             3                          4     5 6
 ----------- --------------------------------------------- -------------------------- ----- - -
     3363743 Per HDT 196226 Mini Miranda flag set to True. 2025-08-05 16:39:19.236979 tkato 0 0
 
*/

------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP  --,*
	From
	(VALUES

(1, 196226, 'Isaac Joseph', 3363743, -1)

) P (SeqNum, HdtNum, Requester, Loan, Good)
	
	inner join celink.tblloannotes a
	on  p.loan = a.INTSUBSERVICERLOANNUMBER
	and a.CHRLOANNOTES like 'Per HDT%' || P.HDTNum || '%'
	order by p.SeqNum  
with ur;

-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                  CHRUSERID BLNPRIORITY NOTESTEP
-- -------------------------- ------------ ------------------------ --------------------------------------------- --------- ----------- --------
-- 2025-08-05 16:39:47.179236    211452308                3363743.0 Per HDT 196226 Mini Miranda flag set to True. tkato               0        0


-- end

---------------------------------------------------------------------------
---------------------------------------------------------------------------

