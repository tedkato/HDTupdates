
/* ***********************************************************************************************************
Zack Aufderheide • 2 minutes ago
Hi Ted, 
Per Cyndie, the field to update when you get the loans is
tblTaxAndInsData.ANNUALTIANALYSISCOMPDATE . She told me to assign this to you.
	SELECT ANNUALTIANALYSISCOMPDATE, * from celink.tblTaxAndInsData where TIDATALOANNUMBER = 1386997 with ur;
*********************************************************************************************************** */

/*
DATES rptTNISetAside...xlsx ... 40 rows
|A      |B          |C  |D ... ="(" & C2 & ", 43185, 'Jazmin Anderson', " & A2 & ", '" & TEXT(B2, "YYYY-MM-DD") & "'),"
1227480	9/5/2019	1	(1, 1227480, '2019-09-05'),
1227792	9/5/2019	2	(2, 1227792, '2019-09-05'),
1227801	9/5/2019	3	(3, 1227801, '2019-09-05'),


-- my value format -- ="(" & C2 & ", 999999, 'Demetra Wyatt', " & A2 & ", '" & TEXT(B2, "YYYY-MM-DD") & "'),"
-- my value format -- ="(" & C2 & ", 999999, 'Randi Werner', " & A2 & ", '" & TEXT(B2, "YYYY-MM-DD") & "'),"
*/

/*
20191030
INCIDENT #45818

Jazmin Anderson, Tax & Insurance Admin. Supervisor
Created: Oct 30, 2019 at 12:32 PM
Bulk upload - Annual T&I Analysis Completed Date field - 10/30/19
Please see attached. 
The first column is the loan number. The second column is the date that should be populated. 
Please bulk upload a date in the Annual T&I Analysis Completed Data field. 
This can be found under Tracking>T&I Data.

TNISetAside Dates 10...xlsx ... 1719 rows

="(" & C2 & ", 45818, 'Jazmin Anderson', " & A2 & ", '" & TEXT(B2, "YYYY-MM-DD") & "'),"
*/


------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250910
[ID:0199118]  T&I Annual Analysis Completed Date  9/10/2025 12:22 PM  Pankaj Doiphode
1	="(" & C1 & ", 0199118, 'Pankaj Doiphode', " & A1 & ", '" & TEXT(B1, "YYYY-MM-DD") & "'),"
*/
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------

select CURRENT_DATE from SYSIBM.SYSDUMMY1;

----------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- DATAUPDT table ... 
-- Global Temp
--declare global TEMPORARY TABLE SESSION.UY
--(
--	SeqNum integer,
--	HDTNum integer         default 34824, 
--	Requester varchar(30)  default 'Jazmin Anderson',
--	Loan integer,
--
--	NewTiAanalysis  date, 
--	CurTiAanalysis  date, 
--	
--	NewNotes        varchar (200) default NULL-- this column might not be used
--)
--ON COMMIT PRESERVE ROWS;


-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

---- DATAUPDT Table for  
--create table DATAUPDT.HDTDataUpdt_TnIdata_SA   
--	(
--	SeqNum integer,
--	HDTNum integer, 
--	Requester varchar(30) ,
--	Loan integer,
--
--	NewTiAanalysis  date, 
--	CurTiAanalysis  date, 
--
--	ChangeNeeded	integer default 0,  
--	
--	NewNotes        varchar (200) default NULL-- this column might not be used
--	)
--	COMPRESS YES ADAPTIVE
--	IN DATAUPDT_TS16;
--GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTDataUpdt_TnIdata_SA  TO group db2_ast;
--	
--	-- drop table DATAUPDT.HDTDataUpdt_TnIdata_SA;
	 select * from DATAUPDT.HDTDataUpdt_TnIdata_SA;


-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTDataUpdt_TnIdata_SA;

-------------------------------------------------------------------------------------------------------------------------------------
-- Data  
insert into DATAUPDT.HDTDataUpdt_TnIdata_SA
	(SeqNum, HDTNum, Requester, Loan, NewTiAanalysis, CurTiAanalysis, ChangeNeeded)
with Param 
	(SeqNum, HDTNum, Requester, Loan, NewTiAanalysis ) as 
	(Values


(1, 0199118, 'Pankaj Doiphode', 3108057, '2025-09-10'),
(2, 0199118, 'Pankaj Doiphode', 1265399, '2025-09-10'),
(3, 0199118, 'Pankaj Doiphode', 3226699, '2025-09-10'),
(4, 0199118, 'Pankaj Doiphode', 3226528, '2025-09-10'),
(5, 0199118, 'Pankaj Doiphode', 3226607, '2025-09-10'),
(6, 0199118, 'Pankaj Doiphode', 1384072, '2025-09-10'),
(7, 0199118, 'Pankaj Doiphode', 3226360, '2025-09-10'),
(8, 0199118, 'Pankaj Doiphode', 3171762, '2025-09-10'),
(9, 0199118, 'Pankaj Doiphode', 3226741, '2025-09-10'),
(10, 0199118, 'Pankaj Doiphode', 3226551, '2025-09-10'),
(11, 0199118, 'Pankaj Doiphode', 3290427, '2025-09-10'),
(12, 0199118, 'Pankaj Doiphode', 3346366, '2025-09-10'),
(13, 0199118, 'Pankaj Doiphode', 1385453, '2025-09-10'),
(14, 0199118, 'Pankaj Doiphode', 3290633, '2025-09-10'),
(15, 0199118, 'Pankaj Doiphode', 3226892, '2025-09-10'),
(16, 0199118, 'Pankaj Doiphode', 1228690, '2025-09-10'),
(17, 0199118, 'Pankaj Doiphode', 3290127, '2025-09-10'),
(18, 0199118, 'Pankaj Doiphode', 3172610, '2025-09-10'),
(19, 0199118, 'Pankaj Doiphode', 3172117, '2025-09-10'),
(20, 0199118, 'Pankaj Doiphode', 3175847, '2025-09-10'),
(21, 0199118, 'Pankaj Doiphode', 1268650, '2025-09-10'),
(22, 0199118, 'Pankaj Doiphode', 3289721, '2025-09-10'),
(23, 0199118, 'Pankaj Doiphode', 1384162, '2025-09-10'),
(24, 0199118, 'Pankaj Doiphode', 3291603, '2025-09-10'),
(25, 0199118, 'Pankaj Doiphode', 3290215, '2025-09-10'),
(26, 0199118, 'Pankaj Doiphode', 3226554, '2025-09-10'),
(27, 0199118, 'Pankaj Doiphode', 3237919, '2025-09-10'),
(28, 0199118, 'Pankaj Doiphode', 3226754, '2025-09-10'),
(29, 0199118, 'Pankaj Doiphode', 3228089, '2025-09-10'),
(30, 0199118, 'Pankaj Doiphode', 3226545, '2025-09-10'),
(31, 0199118, 'Pankaj Doiphode', 3289729, '2025-09-10'),
(32, 0199118, 'Pankaj Doiphode', 3226760, '2025-09-10'),
(33, 0199118, 'Pankaj Doiphode', 3171749, '2025-09-10'),
(34, 0199118, 'Pankaj Doiphode', 3289706, '2025-09-10'),
(35, 0199118, 'Pankaj Doiphode', 3346543, '2025-09-10'),
(36, 0199118, 'Pankaj Doiphode', 3171722, '2025-09-10'),
(37, 0199118, 'Pankaj Doiphode', 3346492, '2025-09-10'),
(38, 0199118, 'Pankaj Doiphode', 3290137, '2025-09-10'),
(39, 0199118, 'Pankaj Doiphode', 3346521, '2025-09-10'),
(40, 0199118, 'Pankaj Doiphode', 3226515, '2025-09-10'),
(41, 0199118, 'Pankaj Doiphode', 3171720, '2025-09-10'),
(42, 0199118, 'Pankaj Doiphode', 3226745, '2025-09-10'),
(43, 0199118, 'Pankaj Doiphode', 3334152, '2025-09-10'),
(44, 0199118, 'Pankaj Doiphode', 3226621, '2025-09-10'),
(45, 0199118, 'Pankaj Doiphode', 3290212, '2025-09-10'),
(46, 0199118, 'Pankaj Doiphode', 3227154, '2025-09-10'),
(47, 0199118, 'Pankaj Doiphode', 3346133, '2025-09-10'),
(48, 0199118, 'Pankaj Doiphode', 3347021, '2025-09-10'),
(49, 0199118, 'Pankaj Doiphode', 3172109, '2025-09-10'),
(50, 0199118, 'Pankaj Doiphode', 3289702, '2025-09-10')
	) 

-- Data  
SELECT
--	count (*)
	P.SeqNum, 
	P.HDTNum,	
	P.Requester,
	P.Loan, P.NewTiAanalysis,
	TT.ANNUALTIANALYSISCOMPDATE as CurTiAanalysis,
--	case when date(P.NewTiAanalysis) = COALESCE(cast(TT.ANNUALTIANALYSISCOMPDATE as varchar(20)), date('2999-01-01')) then 0 else -1 end as ChangeNeeded
	case when date(P.NewTiAanalysis) = COALESCE(cast(TT.ANNUALTIANALYSISCOMPDATE as varchar(20)), date('1900-01-01')) then 0 else -1 end as ChangeNeeded
--,	TT.TIDATALOANNUMBER
--,	XX.intsubservicerloannumber

from Param P 

inner join celink.tblTaxAndInsData TT
ON P.Loan = TT.TIDATALOANNUMBER
	
inner join celink.tblloandata XX 
ON P.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

ORDER BY P.SeqNum
with ur;

	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA ;
--	select count(*) from DATAUpdt.HDTDataUpdt_TnIdata_SA ; --session.UY;
--	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA order by seqnum;  ; -- session.UY order by seqnum desc;
--	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA order by seqnum desc ; -- session.UY order by seqnum desc;

	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded =  0 order by seqnum;  -- session.UY order by seqnum desc; --   
	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded = -1 order by seqnum;  -- session.UY order by seqnum desc; --  
	select Loan, count(Loan) from DATAUPDT.HDTDataUpdt_TnIdata_SA group by Loan having count(Loan) > 1; 

	-- SEQNUM HDTNUM REQUESTER      LOAN    NEWTIAANALYSIS CURTIAANALYSIS CHANGENEEDED NEWNOTES
	-- ------ ------ -------------- ------- -------------- -------------- ------------ --------
    -- no 0s

		/* Better Dup check
		select A.* 
		from DATAUPDT.HDTDataUpdt_TnIdata_SA A
		inner join (select Loan, count(Loan) from DATAUPDT.HDTDataUpdt_TnIdata_SA group by Loan having count(Loan) > 1) B
		on A.Loan = B.Loan
		order by A.SeqNum;
		
		-- SEQNUM HDTNUM REQUESTER   LOAN    NEWTIAANALYSIS CURTIAANALYSIS CHANGENEEDED NEWNOTES
		-- ------ ------ ----------- ------- -------------- -------------- ------------ --------
		--      2 158857 Faith Welch 3305319 2024-02-20     NULL                     -1 NULL
		--     22 158857 Faith Welch 3305319 2024-02-21     NULL                     -1 NULL
		-- delete DATAUPDT.HDTDataUpdt_TnIdata_SA where SeqNum = 2;

		*/ 

	select HDTNUM "HDT #", count(*) "Loan Count"  from DATAUPDT.HDTDataUpdt_TnIdata_SA group by HDTNUM; 
	select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count"  from DATAUPDT.HDTDataUpdt_TnIdata_SA where CHANGENEEDED = -1 group by HDTNUM, Requester; 

/*
--Dup
--	 	LOAN 2
-- 		---- -
--		no dup

 HDT #  Requester       Loan Count
 ------ --------------- ----------
 199118 Pankaj Doiphode         50
 
Updated 1 loan.  Peer review pending. 
Updated 50 loans.  Peer review pending. 
Updated 237 loans.  Peer review pending. 

1 loan 3169349 already has the requested date in place

Annual analysis completed date updated for the 59 loans.  Peer review pending. 

Annual analysis completed date updated for the 1 loan.  Pending verification.
Annual analysis completed date updated for the 157 loans.  Pending verification.

--*--
Annual analysis completed date updated for the 40 loans. Peer review pending.
Annual analysis completed date updated for the 1 loan. Peer review pending.
--*--
Annual analysis completed date updated for the 55 loans. Peer review pending.
Annual analysis completed date updated for the 41 loans.
*loan 1273390 already have the date in place.
*10 loans in the hidden rows were not processed.

Annual analysis completed date updated for below loans.
 HDT #  Requester      Loan Count
 ------ -------------- ----------
 176400 Rutuja Pichare        208
 176448 Rutuja Pichare         60
Peer review pending.

--*--*--
Done. On Hold pending verification.
If the data is satisfactory, please do not respond and the ticket will be closed after a week or so.
xx loans updated 
, 1 loan (1353136) alread had the requested dates, 1 loan (3145673) listed twice.
x 9999999 loans updated, 9999999 loans alread had the requested dates
*/

----------------------------------------------------------------------------------------------------------------------------------------------
-- pre exec validation -- see HDTBackup_122759_122760.txt

select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded, TT.ANNUALTIANALYSISCOMPDATE
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
inner join celink.tblTaxAndInsData TT 
ON Loan = TT.TIDATALOANNUMBER	  
	
where UY.NewTiAanalysis <> date ('2999-01-01')	
and   UY.ChangeNeeded = -1
order by UY.seqnum
with ur;
	--TT.ANNUALTIANALYSISCOMPDATE = case when UY.NewTiAanalysis = date ('1900-01-01') then NULL else UY.NewTiAanalysis end

/*
all
 SEQNUM HDTNUM REQUESTER    LOAN    NEWTIAANALYSIS CHANGENEEDED ANNUALTIANALYSISCOMPDATE
 ------ ------ ------------ ------- -------------- ------------ ------------------------

     40 199118 Pankaj Doiphode 3226515 2025-09-10               -1 2024-09-10
     41 199118 Pankaj Doiphode 3171720 2025-09-10               -1 2024-09-10
     42 199118 Pankaj Doiphode 3226745 2025-09-10               -1 2024-09-10
     43 199118 Pankaj Doiphode 3334152 2025-09-10               -1 2024-09-10
     44 199118 Pankaj Doiphode 3226621 2025-09-10               -1 2024-09-10
     45 199118 Pankaj Doiphode 3290212 2025-09-10               -1 2024-09-10
     46 199118 Pankaj Doiphode 3227154 2025-09-10               -1 2024-09-10
     47 199118 Pankaj Doiphode 3346133 2025-09-10               -1 NULL
     48 199118 Pankaj Doiphode 3347021 2025-09-10               -1 NULL
     49 199118 Pankaj Doiphode 3172109 2025-09-10               -1 2024-09-10
     50 199118 Pankaj Doiphode 3289702 2025-09-10               -1 2024-09-10
 */
 
-- see HDTBackup_122759_122760.txt

-------------------------------------------
---- notes
--	Select 
--		SeqNum ,
--		Loan	
--		,
--	   'Per HDT ' || HDTNum || ' (' || Requester || ') T&I Data ' || 
--		case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
--		then  
--			'Annual T&I Analysis Completed Date changed from ' ||
--			case NewTiAanalysis 
--			when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
--			else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
--			end
--		else '' 
--		end || '.' 
--		,
--		CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
--		'ted.kato', 
--		0
--		from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
--		where ChangeNeeded = -1
--	
--	Order by SeqNum 
--	; 


-------------------------------------------
-- Notes for Bulk upload ... C:\Users\ted.kato\Documents\HDTUpdtNotes_

	Select 
		SeqNum,	
		Loan as "Loan Number",
		'N'  as "Priority (Y/N)", 
		'0'   as "Note Step Number",
		''   as "Step Date Completed (YYYY-MM-DD)", 

--	   'Per HDT ' || HDTNum || ' (' || Requester || ') T&I Data ' || 
	   'Per HDT ' || HDTNum || ' T&I Data ' || 
		case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
		then  
			'Annual T&I Analysis Completed Date changed from ' ||
			case NewTiAanalysis 
			when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
			else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
			end
		else '' 
		end || '.'  as "Loan Note" 
		from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
		where ChangeNeeded = -1
	
	Order by SeqNum 
	; 

/*
 SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
 ------ ----------- -------------- ---------------- -------------------------------- -------------------------------------------------------------------------------------------------

     40     3226515 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     41     3171720 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     42     3226745 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     43     3334152 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     44     3226621 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     45     3290212 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     46     3227154 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     47     3346133 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from <Blank> to 2025-09-10.
     48     3347021 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from <Blank> to 2025-09-10.
     49     3172109 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.
     50     3289702 N              0                                                 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10.

  */
  
  
--/* coment until execution ***************************************************
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Updateeee  tblTaxAndInsData
-----------------------------------------------------------------------------------------------------------------------------------------------------

MERGE INTO celink.tblTaxAndInsData TT
USING
(
	select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded, case when UY.NewTiAanalysis = date ('1900-01-01') then NULL else UY.NewTiAanalysis end as NewVal
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where NewTiAanalysis <> date ('2999-01-01')	
	and   ChangeNeeded = -1
	order by SeqNum
) 
UY (SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded, NewVal)
ON Loan = TT.TIDATALOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
TT.ANNUALTIANALYSISCOMPDATE = case when UY.NewTiAanalysis = date ('1900-01-01') then NULL else UY.NewTiAanalysis end
;

/*
the select 
 SEQNUM HDTNUM REQUESTER     LOAN    NEWTIAANALYSIS CHANGENEEDED NEWVAL
 ------ ------ ------------- ------- -------------- ------------ ----------

*/
----------------------------------------------------------------------------------------------------------------------------------------------
--------------
-- Validation 

		SELECT
			P.SeqNum, P.HDTNum, P.Requester, P.Loan, 
			P.NewTiAanalysis,
		
			P.CurTiAanalysis,
			TT.ANNUALTIANALYSISCOMPDATE
		
		,   P.ChangeNeeded

		--,	XX.intsubservicerloannumber
		--	from session.UY P 
			from DATAUPDT.HDTDataUpdt_TnIdata_SA P  
			
			inner join celink.tblTaxAndInsData TT
			ON P.Loan = TT.TIDATALOANNUMBER
			
		--	inner join celink.tblloandata XX 
		--	ON P.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

			ORDER BY P.SeqNum 
		with ur;

/*
 SEQNUM HDTNUM REQUESTER    LOAN    NEWTIAANALYSIS CURTIAANALYSIS ANNUALTIANALYSISCOMPDATE CHANGENEEDED
 ------ ------ ------------ ------- -------------- -------------- ------------------------ ------------

     41 199118 Pankaj Doiphode 3171720 2025-09-10     2024-09-10     2025-09-10                         -1
     42 199118 Pankaj Doiphode 3226745 2025-09-10     2024-09-10     2025-09-10                         -1
     43 199118 Pankaj Doiphode 3334152 2025-09-10     2024-09-10     2025-09-10                         -1
     44 199118 Pankaj Doiphode 3226621 2025-09-10     2024-09-10     2025-09-10                         -1
     45 199118 Pankaj Doiphode 3290212 2025-09-10     2024-09-10     2025-09-10                         -1
     46 199118 Pankaj Doiphode 3227154 2025-09-10     2024-09-10     2025-09-10                         -1
     47 199118 Pankaj Doiphode 3346133 2025-09-10     NULL           2025-09-10                         -1
     48 199118 Pankaj Doiphode 3347021 2025-09-10     NULL           2025-09-10                         -1
     49 199118 Pankaj Doiphode 3172109 2025-09-10     2024-09-10     2025-09-10                         -1
     50 199118 Pankaj Doiphode 3289702 2025-09-10     2024-09-10     2025-09-10                         -1
 */
   
--* coment until execution ************************************************** */

-------------------------------------------------------------------------------------------------------------------------------------
---- Notes update
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
Select 
--	SeqNum ,
	Loan	
	,
--   'Per HDT ' || HDTNum || ' (' || Requester || ') T&I Data ' || 
   'Per HDT ' || HDTNum || ' T&I Data ' || 
	case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
	then  
		'Annual T&I Analysis Completed Date changed from ' ||
		case NewTiAanalysis 
		when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
		else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
		end
	else '' 
	end || '.' 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where ChangeNeeded = -1

Order by SeqNum 
; 

------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'

order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;
/*
 SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                      CHRUSERID BLNPRIORITY NOTESTEP
 ------ -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------- --------- ----------- --------

     42 2025-09-10 15:58:28.850502    213738617                3226745.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10. tkato               0        0
     43 2025-09-10 15:58:28.850502    213738618                3334152.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10. tkato               0        0
     44 2025-09-10 15:58:28.850502    213738619                3226621.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10. tkato               0        0
     45 2025-09-10 15:58:28.850502    213738620                3290212.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10. tkato               0        0
     46 2025-09-10 15:58:28.850502    213738621                3227154.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10. tkato               0        0
     47 2025-09-10 15:58:28.850502    213738622                3346133.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from <Blank> to 2025-09-10.    tkato               0        0
     48 2025-09-10 15:58:28.850502    213738623                3347021.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from <Blank> to 2025-09-10.    tkato               0        0
     49 2025-09-10 15:58:28.850502    213738624                3172109.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10. tkato               0        0
     50 2025-09-10 15:58:28.850502    213738625                3289702.0 Per HDT 199118 T&I Data Annual T&I Analysis Completed Date changed from 2024-09-10 to 2025-09-10. tkato               0        0

*/

-- end


-------------------------------------------
--no need
-------------------------------------------
-- Notes for Bulk upload 
-- C:\Users\Ted.Kato\Documents\HDTUpdtNotes_125371_125434.csv
	Select 
		SeqNum,	
		Loan as "Loan Number",
		'N'  as "Priority (Y/N)", 
		''   as "Note Step Number",
		''   as "Step Date Completed (YYYY-MM-DD)", 

	   'Per HDT ' || HDTNum || ' (' || Requester || ') T&I Data ' || 
		case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
		then  
			'Annual T&I Analysis Completed Date changed from ' ||
			case NewTiAanalysis 
			when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
			else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
			end
		else '' 
		end || '.'  as "Loan Note" 
		from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
		where ChangeNeeded = -1
	
	Order by SeqNum 
	; 

------------------
-- Notes validation
		select 
			count(*) as "MyCount"
		--	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
			from celink.tblloannotes a  
			where 
			--	a.INTSUBSERVICERLOANNUMBER in (1267454) 
			--	and
				a.CHRLOANNOTES like 'Per HDT 101843%'
			--order by a.IDSLOANNOTES desc 
		with ur;

--		select 
--			count(*) as "MyCount"
--		--	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
--			from celink.tblloannotes a  
--			where 
--			--	a.INTSUBSERVICERLOANNUMBER in (1267454) 
--			--	and
--				a.CHRLOANNOTES like 'Per HDT 54315%'
--			--order by a.IDSLOANNOTES desc 
--		with ur;

		select 
			a.seqnum, --CHAR(Current Date, USA) || ' ' || char(Current Time, LOCAL) ----, -- -- char(Current Time, USA),
			a.HDTNum, a.Requester, a.HDTNum, a.Loan 
		,
			a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
			from 
			(
				select 
				M.SeqNum, M.HDTNum, M.Requester, M.Loan
				,
				N.DTMNOTEDATE,	N.IDSLOANNOTES,	N.INTSUBSERVICERLOANNUMBER,	N.CHRLOANNOTES, N.CHRUSERID, N.BLNPRIORITY --,*
			--	from session.UY M
				from DATAUPDT.HDTDataUpdt_TnIdata_SA M  
				
				inner join celink.tblloannotes N
				ON  M.Loan = N.INTSUBSERVICERLOANNUMBER
				
			--	where M.SeqNum <=10
			--  where M.Loan in () 
				order by M.SeqNum	
			) a
			inner join
			(
				select 
				max(IDSLOANNOTES) MyMax, --max(DTMNOTEDATE) MyMax, --,
				INTSUBSERVICERLOANNUMBER --, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY ,*
				from celink.tblloannotes a
			--	INNER join session.UY UY on a.INTSUBSERVICERLOANNUMBER = UY.Loan
				INNER join DATAUPDT.HDTDataUpdt_TnIdata_SA UY 
				on 	a.INTSUBSERVICERLOANNUMBER = UY.Loan

			--	and UY.SeqNum <=10
				 
			--	where a.INTSUBSERVICERLOANNUMBER in
			--	(
			--	)
				group by a.INTSUBSERVICERLOANNUMBER
			--order by IDSLOANNOTES desc
			) x  
			on a.IDSLOANNOTES = x.MyMax --on a.DTMNOTEDATE = x.MyMax 
			and x.INTSUBSERVICERLOANNUMBER = a.INTSUBSERVICERLOANNUMBER
			--and a.INTSUBSERVICERLOANNUMBER in
			--(
			--)
			order by a.seqnum
		with ur;	


-- SEQNUM HDTNUM REQUESTER    HDTNUM LOAN    DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                     CHRUSERID BLNPRIORITY
-- ------ ------ ------------ ------ ------- -------------------------- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------- --------- -----------
--      1 126461 Randi Werner 126461 3205470 2023-04-27 12:38:19.068727    161211280                3205470.0 Per HDT 126461 (Randi Werner) T&I Data Annual T&I Analysis Completed Date changed from 2022-04-27 to 2023-04-27. ted.kato            0
--      2 126461 Randi Werner 126461 1254088 2023-04-27 12:38:19.068727    161211281                1254088.0 Per HDT 126461 (Randi Werner) T&I Data Annual T&I Analysis Completed Date changed from 2022-04-27 to 2023-04-27. ted.kato            0

----------------------------------------------------------------------------------------------------------------------------------------------
-- End of process
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

	
-- **** EOF **** --
