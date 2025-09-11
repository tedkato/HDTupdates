
/*
20230906  ... table version

INCIDENT #undefined
This is a template to handle NBS protected flag request with table.

--
NBS@reversedepartment.com
Melissa Romero, NBS Administrator

Created: Nov 25, 2019 at 12:23 PM
FW: Celink loan # 3120867 Marshall Jones
Hello,
Please set the Protected NBS Flag set from FALSE to TRUE.

--
From: Cyndie King 
Sent: Monday, November 25, 2019 7:23 PM
To: Ted Kato <Ted.Kato@celink.com>
Cc: Vicky Cermak <Vicky.Cermak@celink.com>
Subject: NBS Flag

Ted,
NBS is Non Borrowing Spouse, and they will, in certain circumstances, have protections from foreclosure and other actions should the loan borrower pass away.
The field is 
	celink.TBLNONBORROWINGSPOUSES.BOPROTECTEDNBS. 

If the NBS Protected flag is to be set to true then the value should be set to "Y". 
If the NBS Protected flag is to be set to false then the value should be set to "N".

There is no other option, the value is to be either “Y” or “N”.
Please assume these types of  tickets from this point forward.

*/

---------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------


/*
20250904
198715	Ted Kato	NBS protected flag	Melissa Romero		Low	9/4/2025 14:13
1183874
Please add protected NBS check
="(" & E2 & ", 198715, 'Melissa Romero', " &A2 & ", 'N'),"
(1, 198715, 'Melissa Romero', 1183874, 'Y')
*/


/* samples ******************************************************************************************************************************************************

="(" & E2 & ", " & B2 & ", '" & C2 & "', " &A2 & ", '" & D2 &"'),"

="(" & E2 & ", 192632, 'Melissa Romero', " &A2 & ", 'N'),"

(1001, 163725, 'Sayra Lindell', 1410569, 'N'),
(2, 0010857, 'Sayra Lindell', 3281415, 'Y'),
(3, 0010857, 'Sayra Lindell', 1308154, 'Y'),
(4, 0010857, 'Sayra Lindell', 1320114, 'Y'),
(5, 0010857, 'Sayra Lindell', 1368422, 'Y'),

(1, 137020, 'Sayra Lindell', 3315120, 'Y')

(1, 128278, 'Melissa Romero', 3207219, 'Y')
(1, 127517, 'Melissa Romero', 1324515, 'Y')
(1, 126850, 'Sayra Lindell', 3188847, 'Y'),
(2, 126885, 'Melissa Romero', 3302911, 'Y')
(1, 125370, 'Brittnay Ahmed', 1189984, 'Y')

**************************************************************************************************************************************************************** */

--ref
--CELINK	TBLNONBORROWINGSPOUSES	BOPROTECTEDNBS	CHARACTER	1	-	nonborrowing spouses borrower protected nbs  :checkbox that indicates the NBS is protected
--CELINK	TBLNONBORROWINGSPOUSES	COPROTECTEDNBS	CHARACTER	1	-	nonborrowing spouses co-borrower protected nbs

--
select 
	BOPROTECTEDNBS, * 
	from CELINK.TBLNONBORROWINGSPOUSES 
	--where NBSLOANNUMBER = 1341618 --in (1321548, 1340104)
	WHERE BOPROTECTEDNBS <> 'N' and BOPROTECTEDNBS <> 'Y'
order by NBSLOANNUMBER desc
with ur;

select 
	BOPROTECTEDNBS, * 
	from CELINK.TBLNONBORROWINGSPOUSES 
	where NBSLOANNUMBER in (331751)
	--WHERE BOPROTECTEDNBS <> 'N' and BOPROTECTEDNBS <> 'Y'
order by NBSLOANNUMBER desc
with ur;

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- Start of process
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- Global Temp not used
/*declare global TEMPORARY TABLE SESSION.UY
(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan integer,

	NewBoProtectedNBS char(1), 
	CurBoProtectedNBS char(1)

--	, NewNotes              varchar (200) -- this column might be used
)
ON COMMIT PRESERVE ROWS;
*/

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------


/* -- DATAUpdt table
Create table DATAUPDT.HDTNBS
(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan integer,

	NewBoProtectedNBS char(1), 
	CurBoProtectedNBS char(1)

	, NewNotes              varchar (200) default NULL-- this column might be used

)
COMPRESS YES ADAPTIVE IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTNBS  TO group db2_ast;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTNBS  TO user cking;
-- --drop table DATAUPDT.HDTNBS;
select * from DATAUPDT.HDTNBS;

*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTNBS;

----------------------------------------------------------------------------------------------------------------------------------------------
-- Parameters
insert into DATAUPDT.HDTNBS  
(	
SeqNum, HDTNum, Requester, Loan, 
NewBoProtectedNBS, 
CurBoProtectedNBS
)

with Param 
(SeqNum, HDTNum, Requester,  Loan, NewBoProtectedNBS) as 
( Values

(1, 198715, 'Melissa Romero', 1183874, 'Y')
)
select
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, 
	P.NewBoProtectedNBS,
	TT.BoProtectedNBS --as CurBoProtectedNBS
from Param P 
inner join celink.TBLNONBORROWINGSPOUSES TT
ON P.Loan = TT.NBSLOANNUMBER
--inner join celink.tblloandata XX 
--ON P.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB
ORDER BY P.SeqNum
with ur;

-- SEQNUM HDTNUM REQUESTER      LOAN    NEWBOPROTECTEDNBS CURBOPROTECTEDNBS NEWNOTES
-- ------ ------ -------------- ------- ----------------- ----------------- --------

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- validation before update
select Loan, count(Loan) from DATAUPDT.HDTNBS group by Loan having count(Loan) > 1; 
select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count"  from DATAUPDT.HDTNBS group by HDTNUM, Requester; 

/*
 LOAN    2
 ------- -
 HDT #  Requester      Loan Count
 ------ -------------- ----------
 198715 Melissa Romero          1
*/

Select 
	UY.SeqNum,	UY.HDTNum,	UY.Requester, 
	UY.Loan, TT.NBSLOANNUMBER,
	UY.NewBoProtectedNBS, UY.CurBoProtectedNBS, TT.BoProtectedNBS
	
from DATAUPDT.HDTNBS UY 
inner join celink.TBLNONBORROWINGSPOUSES TT
on UY.Loan = TT.NBSLOANNUMBER

where  NEWBOPROTECTEDNBS<>CURBOPROTECTEDNBS

Order by UY.SeqNum
for read only with ur;

/*
 SEQNUM HDTNUM REQUESTER      LOAN    NBSLOANNUMBER NEWBOPROTECTEDNBS CURBOPROTECTEDNBS BOPROTECTEDNBS
 ------ ------ -------------- ------- ------------- ----------------- ----------------- --------------
      1 198715 Melissa Romero 1183874     1183874.0 Y                 N                 N
*/

-------------------------------------------------------------------- note for bulk upload
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	'0'   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
--	'Per HDT ' || HDTNum || ' (' || Requester || ') NBS Protected Flag set to ' ||
	'Per HDT ' || HDTNum || ' NBS Protected Flag set to ' ||
	case upper(NewBoProtectedNBS) 
	when 'N' then 'False' 
	when 'Y' then 'True' 
	else 'False'
	end 
	|| 	'.' 	as "Loan Note" 
	From DATAUPDT.HDTNBS
	
where  NEWBOPROTECTEDNBS<>CURBOPROTECTEDNBS

Order by SeqNum
;

-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- ----------------------------------------------
--      1     1183874 N              0                                                 Per HDT 198715 NBS Protected Flag set to True.

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- Update
MERGE INTO celink.TBLNONBORROWINGSPOUSES TT
USING
	(
	select
	SeqNum,	HDTNum,	Requester, Loan, NewBoProtectedNBS
	from DATAUPDT.HDTNBS UY 
	where  NEWBOPROTECTEDNBS<>CURBOPROTECTEDNBS
	order by SeqNum
	) UY (SeqNum, HDTNum, Requester, Loan, NewBoProtectedNBS)
	on UY.Loan = TT.NBSLOANNUMBER 
WHEN MATCHED THEN UPDATE 
Set
TT.BoProtectedNBS = NewBoProtectedNBS
;

/*
 SEQNUM HDTNUM REQUESTER      LOAN    NEWBOPROTECTEDNBS
 ------ ------ -------------- ------- -----------------

*/
--------------------------------------------------
-- validation
select 
	UY.SeqNum,
	UY.HDTNum, 
	UY.Requester,
	UY.Loan,
	UY.NewBoProtectedNBS, UY.CurBoProtectedNBS,
	TT.BoProtectedNBS,
	TT.NBSLOANNUMBER
from DATAUPDT.HDTNBS UY
inner join celink.TBLNONBORROWINGSPOUSES TT
on UY.Loan = TT.NBSLOANNUMBER 
order by UY.seqnum
with ur
;
/*
 SEQNUM HDTNUM REQUESTER      LOAN    NEWBOPROTECTEDNBS CURBOPROTECTEDNBS BOPROTECTEDNBS NBSLOANNUMBER
 ------ ------ -------------- ------- ----------------- ----------------- -------------- -------------
      1 198715 Melissa Romero 1183874 Y                 N                 Y                  1183874.0
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Notes

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

Select 
--	SeqNum,	
	Loan as "Loan Number",
--	'Per HDT ' || HDTNum || ' (' || Requester || ') NBS Protected Flag set to ' ||
	'Per HDT ' || HDTNum || ' NBS Protected Flag set to ' ||
	case upper(NewBoProtectedNBS) 
		when 'N' then 'False' 
		when 'Y' then 'True' 
		else 'False'
	end 
	|| 	'.' 	as "Loan Note" 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0, 0
From DATAUPDT.HDTNBS 
where  NEWBOPROTECTEDNBS<>CURBOPROTECTEDNBS
Order by SeqNum
; 

-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                    CHRUSERID BLNPRIORITY NOTESTEP
-- -------------------------- ------------ ------------------------ ----------------------------------------------- --------- ----------- --------

------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP  --,*
	From DATAUPDT.HDTNBS  P
	inner join celink.tblloannotes a
	on  p.loan = a.INTSUBSERVICERLOANNUMBER
	and a.CHRLOANNOTES like 'Per HDT%' || P.HDTNum || '%'
	order by p.SeqNum  
with ur;

/*
 DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                   CHRUSERID BLNPRIORITY NOTESTEP
 -------------------------- ------------ ------------------------ ---------------------------------------------- --------- ----------- --------
 2025-09-04 17:23:24.768911    213281233                1183874.0 Per HDT 198715 NBS Protected Flag set to True. tkato               0        0

4 loans updated.  Peer review pending.
10 loans updated.  Peer review pending.
1 loan updated.  Peer review pending.

NBS protected flag updated 1 loan.  Peer review pending.
NBS protected flag updated 5 loans. Peer review pending.
Updated 3 loans.  Peer review pending.

*/

--end

-- ------ ------ -------------- ------- ----------------- ----------------- -------------- ------------- ------------------------
-- just ref ------ ------ -------------- ------- ----------------- ----------------- -------------- ------------- ------------------------
---------------------------------------------------------------------- note for bulk upload
--Select 
--	SeqNum,	
--	Loan as "Loan Number",
--	'N'  as "Priority (Y/N)", 
--	''   as "Note Step Number",
--	''   as "Step Date Completed (YYYY-MM-DD)", 
--	'Per HDT ' || HDTNum || ' (' || Requester || ') NBS Protected Flag set to ' ||
--	case NewBoProtectedNBS 
--	when 'N' then 'False' 
--	when 'Y' then 'True' 
--	else 'False'
--	end 
--	|| 	'.' 	as "Loan Note" 
--	From DATAUPDT.HDTNBS
--Order by SeqNum
; 

-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- ----------------------------------------------------------------
--      1     1223807 N                                                                Per HDT 108166 (Brittnay Ahmed) NBS Protected Flag set to False.

--
--notes validation
--		select 
--			a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
--			from celink.tblloannotes a  
--		--	where a.INTSUBSERVICERLOANNUMBER = 1119157
--			where a.CHRLOANNOTES like 'Per HDT 48606%'
--			order by a.IDSLOANNOTES desc 
--		for read only with ur;

--		select 
--			a.seqnum, --CHAR(Current Date, USA) || ' ' || char(Current Time, LOCAL) ----, -- -- char(Current Time, USA),
--			a.HDTNum, a.Requester, a.Loan, a.HDTNum --, a.New_ApprOdrDate, a.Cur_ApprOdrDate
--		,
--			a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
--		--	from celink.tblloannotes a  --where a.INTSUBSERVICERLOANNUMBER in () order by a.IDSLOANNOTES desc with ur;
--			from 
--			(
--				select 
--				M.SeqNum, M.HDTNum, M.Requester, M.Loan
--				,
--				N.DTMNOTEDATE,	N.IDSLOANNOTES,	N.INTSUBSERVICERLOANNUMBER,	N.CHRLOANNOTES, N.CHRUSERID, N.BLNPRIORITY --,*
--				from DATAUPDT.HDTNBS M
--				inner join celink.tblloannotes N
--				ON  M.Loan = N.INTSUBSERVICERLOANNUMBER
--				--where M.Loan in () 
--				order by M.SeqNum	
--			) a
--			inner join
--			(
--				select 
--				max(IDSLOANNOTES) MyMax, --max(DTMNOTEDATE) MyMax, --,
--				INTSUBSERVICERLOANNUMBER --, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY ,*
--				from celink.tblloannotes a
--				INNER join DATAUPDT.HDTNBS UY 
--				on a.INTSUBSERVICERLOANNUMBER = UY.Loan 
--			--	where a.INTSUBSERVICERLOANNUMBER in
--			--	(
--			--	)
--				group by a.INTSUBSERVICERLOANNUMBER
--			--order by IDSLOANNOTES desc
--			) x  
--			on a.IDSLOANNOTES = x.MyMax --on a.DTMNOTEDATE = x.MyMax 
--			and x.INTSUBSERVICERLOANNUMBER = a.INTSUBSERVICERLOANNUMBER
--			--and a.INTSUBSERVICERLOANNUMBER in
--			--(
--			--)
--			order by a.seqnum
--		with ur;	



---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Refs
-- Notes
--select 
--	DTMNOTEDATE, * 
--	from CELINK.TBLLOANNOTES 
--	where INTSUBSERVICERLOANNUMBER=  
--	order by IDSLOANNOTES desc 
--with ur;

-- Status	
--select 
--	IDSSTATUSCODE, * 
--	from celink.tblactioncodesall 
----	where CHRACTIONCODEDROPBOX like '%%'
--	where IDSSTATUSCODE in (15,57) 
--	order by IDSSTATUSCODE 
--	with ur; 

--select 
--	Loannumber, CLIENTLOANNUMBER, IDSSTATUSCODE, * 
--	from celinkwh.loandata 
--	where loannumber = 	
--with ur;

--select 
--	* 
--	from celink.TBLLOANDATA 
--	where INTSUBSERVICERLOANNUMBER =  
--with ur; --this is like tblHOLoans

--select 
--	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, 
--	CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
--	* 
--	from celink.TBLTRANSACTIONS 
--	where INTSUBSERVICERLOANNUMBER =  
--	order by IDSTRANSID desc 
--with ur;




