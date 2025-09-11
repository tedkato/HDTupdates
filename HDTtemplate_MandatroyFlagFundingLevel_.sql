/*
20210413  ... Fix added in notes construction using pivot ... same as FCL_Juan

20210406  ... WIP 2  Mand-Fund betterment 
This is intending to improve the existing script to copmly with less complicated excel format.  
The update logic and DATAUpdt table may need to be updated as My Value change should work as is, and notes construction needs to be revised. 

--sample
INCIDENT #81124
Kiyauna Brewer
Sr. Associate Loan Boarding, Document Processing
Other
Created: Apr 03, 2021 at 10:14 AM by Kiyauna Brewer

T&I Set Aside?
T&I Set Aside Funded?

Copy of Celink Corre...xlsx

Loan		Data field				Incorrect	Correct Value 
3199832		T&I Set Aside?			None 		Mandatory
3199832		T&I Set Aside Funded?	None 	 	Fully-Funded 
3199374		T&I Set Aside?			None 		Voluntary
3199374		T&I Set Aside Funded?	None 	 	Fully-Funded 

(1, 81124, 'Kiyauna Brewer', 3199832, 57, 61),   --NONE-->Mandatory / NONE-->Fully-Funded	
(2, 81124, 'Kiyauna Brewer', 3199374, 58, 61),   --NONE-->Voluntary / NONE-->Fully-Funded	
--

Instead of preparing update instruction Excel in-line for a loan, break them and let it contain one instruction per row.
Identify Mans or Fund change as 1 or 2.  (Change itself can be done with -999 as currently it does) 
 
(1, 81124, 'Kiyauna Brewer', 3199832, 1, 57,   -999) -- T&I Set Aside?         None --> Mandatory
(3, 81124, 'Kiyauna Brewer', 3199374, 1, 58,   -999) -- T&I Set Aside?         None --> Voluntary
(2, 81124, 'Kiyauna Brewer', 3199832, 2, -999, 61)   -- T&I Set Aside Funded?	None --> Fully-Funded 
(4, 81124, 'Kiyauna Brewer', 3199374, 2, -999, 61)   -- T&I Set Aside Funded?	None --> Fully-Funded 

Having above structure in the table, notes construction needs to be revised.
-999 is used as currently is and notes output can be done using this and change needed flag

*/

/* 20210802    below revised !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- ="(" & E2 & ", 74030, 'Kiyauna Brewer', " & A2 & ", '" & IF(B2="T&I Set Aside?", "Mand", "Fund") & "', '" & C2 & "', '" & D2 & "'),"
-- ="(" & E2 & ", 74030, 'Kiyauna Brewer', " & A2 & ", '" & IF(TRIM(B2)="T&I Set Aside?", "Mand", "Fund") &  "', '" & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(C2), MandLookup,2,FALSE),  VLOOKUP(TRIM(C2), FundLookup,2,FALSE)) &  "', '" & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(D2), MandLookup,2,FALSE),  VLOOKUP(TRIM(D2), FundLookup,2,FALSE))  & "'),"
-- Below lookup ranges must be implemented in the excel sheet
-- with eange names - MandLookup, FundLookup 
MandLookup
Mandatory	57
Voluntary	58
NONE	56
NONE	0

FundLookup	
Partially Funded	60
Fully Funded	61
Partially-Funded	60
Fully-Funded	61
NONE	59
NONE	0

* 20210802   NEW METHOD !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
... VlookUp  'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup ,  'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup
="(" & E2 & ", 87981, 'Kiyauna Brewer', " & A2 & ", '" & IF(TRIM(B2)="T&I Set Aside?", "Mand", "Fund") &  "', " & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),  VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE)) &  ", "  & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),   VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE))  & "),"

* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

*/

/*
-- My Value 1
(1, 74030, 'Kiyauna Brewer', 3183178, 'T&I Set Aside?', 'NONE', 'Mandatory '),
(2, 74030, 'Kiyauna Brewer', 3183178, 'T&I Set Aside Funded?', 'NONE', 'Fully-Funded'),
(3, 74030, 'Kiyauna Brewer', 3182420, 'T&I Set Aside?', 'NONE', 'Mandatory '),
(4, 74030, 'Kiyauna Brewer', 3182420, 'T&I Set Aside Funded?', 'NONE', 'Fully-Funded'),

-- My Value 2
(1, 74030, 'Kiyauna Brewer', 3183178, 'Mand', 'NONE', 'Mandatory '),
(2, 74030, 'Kiyauna Brewer', 3183178, 'Fund', 'NONE', 'Fully-Funded'),
(3, 74030, 'Kiyauna Brewer', 3182420, 'Mand', 'NONE', 'Mandatory '),
(4, 74030, 'Kiyauna Brewer', 3182420, 'Fund', 'NONE', 'Fully-Funded'),

-- My Value Final sample
(1, 74030, 'Kiyauna Brewer', 3183178, 'Mand', '56', '57'), -- Mand or Fund, Baad Value, Good Value
(2, 74030, 'Kiyauna Brewer', 3183178, 'Fund', '59', '61'),
(3, 74030, 'Kiyauna Brewer', 3182420, 'Mand', '56', '57'),
(4, 74030, 'Kiyauna Brewer', 3182420, 'Fund', '59', '61'),

-- sample
(1, 81124, 'Kiyauna Brewer', 3199832, 'Mand', 56, 57) -- T&I Set Aside?         None --> Mandatory	... better being 0??
(2, 81124, 'Kiyauna Brewer', 3199832, 'Fund', 59, 61) -- T&I Set Aside Funded?  None --> Fully-Funded 
(3, 81124, 'Kiyauna Brewer', 3199374, 'Mand', 56, 58) -- T&I Set Aside?         None --> Voluntary
(4, 81124, 'Kiyauna Brewer', 3199374, 'Fund', 59, 61) -- T&I Set Aside Funded?  None --> Fully-Funded 
*/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*  !!!!!!!!!!!!!!!!   NEW 20231213 combined ticket version   !!!!!!!!!!!!!!!!

="(" & G2 & ", " & E2 & ", '" &F2 & "', " & A2 & ", '" & IF(TRIM(B2)="T&I Set Aside?", "Mand", "Fund") &  "', " & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),  VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE)) &  ", "  & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),   VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE))  & "), -- " & C2 & " -> " & D2

Celink Loan Number	Data field to be corrected	Incorrect Value 	Correct Value 	HDT#	Requester
1394784	T&I Set Aside?	 		None 	 Mandatory 		151266	Faith Welch
1394784	T&I Set Aside Funded?	None 	 Fully Funded 	151266	Faith Welch
1343810	T&I Set Aside?	 		None 	 Mandatory 		151401	Faith Welch
1343810	T&I Set Aside Funded?	None 	 Fully Funded 	151401	Faith Welch

(1, 151266, 'Faith Welch', 1394784, 'Mand', 56, 57), -- None -> Mandatory
(2, 151266, 'Faith Welch', 1394784, 'Fund', 59, 61), -- None -> Fully Funded
(3, 151401, 'Faith Welch', 1343810, 'Mand', 56, 57), -- None -> Mandatory
(4, 151401, 'Faith Welch', 1343810, 'Fund', 59, 61), -- None -> Fully Funded

3369139	T&I Set Aside?	Mandatory	Voluntary

(1, 0193845, 'Jennifer Dees', 3369139, 'Mand', 57, 58), -- Mandatory -> Voluntary
*/

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*  !!!!!!!!!!!!!!!!   NEW 20210802   !!!!!!!!!!!!!!!!
... VlookUp  'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup ,  'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup


="(" & E2 & ", 99999, 'Kiyauna Brewer', " & A2 & ", '" & IF(TRIM(B2)="T&I Set Aside?", "Mand", "Fund") &  "', " & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),  VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE)) &  ", "  & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),   VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE))  & "), -- " & C2 & " -> " & D2

xx ="(" & E2 & ", 99999, 'Kiyauna Brewer', " & A2 & ", '" & IF(TRIM(B2)="T&I Set Aside?", "Mand", "Fund") &  "', " & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),  VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE)) &  ", "  & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),   VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE))  & "),"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
(1, 120950, 'Randi Werner', 1391569, 'mand', 57, 56), -- mandatory -> none

(101, 120174, 'Michelle Rymerson', 1276057, 'Mand', 58, 56), -- Voluntary -> none
(102, 120174, 'Michelle Rymerson', 1276057, 'Fund', 61, 59), -- Fully Funded -> none
(103, 120174, 'Michelle Rymerson', 1275932, 'Mand', 58, 56), -- Voluntary -> none
(104, 120174, 'Michelle Rymerson', 1275932, 'Fund', 61, 59), -- Fully Funded -> none
(105, 120174, 'Michelle Rymerson', 1270705, 'Mand', 58, 56), -- Voluntary -> none
(106, 120174, 'Michelle Rymerson', 1270705, 'Fund', 61, 59), -- Fully Funded -> none
(1, 164045, 'Michelle Rymerson', 1236711, 'Mand', 57, 58), -- Mandatory -> Voluntary
(1, 109995, 'Jennifer Dees', 3286998, 'Fund', 59, 61), -- NONE -> Fully-Funded
(2, 109995, 'Jennifer Dees', 3287198, 'Fund', 59, 61), -- NONE -> Fully-Funded
*/

SELECT
	TT.TIDATALOANNUMBER, 
	TT.TISAMANDATORY,
	TT.TISAFUNDED,
	TT.*
	from celink.tblTaxAndInsData TT
	where TT.TIDATALOANNUMBER = 1288876
with ur;
-- TIDATALOANNUMBER TISAMANDATORY TISAFUNDED TIDATALOANNUMBER TIDATATAXOFFICE                TIDATAWINTERTAXDATE TIDATASUMMERTAXDATE TIDATATYPE                     TIDATAWINTERTAXAMOUNT TIDATADATEWINTERPAID TIDATASUMMERTAXAMOUNT TIDATADATESUMMERPAID TIDATAPROPERTYID               TIDATAHAZARDCARRIER            TIDATAHAZARDEXPIREDATE TIDATAHAZARDPOLICYNUMBER       TIDATAFLOODCARRIER             TIDATAFLOODEXPIREDATE TIDATAFLOODPOLICYNUMBER        TIDATAWINDCARRIER              TIDATAWINDEXPIREDATE TIDATAWINDPOLICYNUMBER         TIDATAFORCEDPLACEDAMOUNT TIDATAFORCEDPLACEDEXPIREDATE TIDATANOTES REQUIREDINSCOVERAGE HAZARDINSCOVERAGEAMT HAZARDINSFORCEDPLACED FLOODINSCOVERAGEAMT FLOODINSFORCEDPLACED WINDINSCOVERAGEAMT WINDINSFORCEDPLACED HOANAME                                                                                              HOAPHONE HOACONTACTNAME                                                                                       HOAMONTHLYPAYMENTAMT HOALASTPAYMENTMADEDATE HOANEXTPAYMENTDUEDATE HOAADDRESS SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS TISAMANDATORY TISAFUNDED TISASHORTFALL SUSPENDSEMIANNUALDISBURSE ANNUALTIANALYSISCOMPDATE EXPECTEDFRSTYRTIDISBURSEAMT INSTRCKTERMDATE REACTIVATIONFLAG REACTIVATIONDATE TAXTRCKTERMDATE TAXREACTIVATIONFLAG TAXREACTIVATIONDATE TAXDEFERRALIND TISAPCTTHRESHOLD LOCPCTTHRESHOLD TIDANNUALPROPTAX TIDANNUALPROPINSPREMIUM PROJECTANNUALPROPERTYCHG TIDLASTPAYTAXDATE TIDLASTPAYINSDATE TISAFULLDISBURSEDATE SETASIDEHHF SETASIDEHHFSTATE
-- ---------------- ------------- ---------- ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- -------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ---------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
--        1288876.0            57         60        1288876.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         60      0.000000                        -1 2024-03-01                               1889.160000 NULL                        NULL NULL             NULL                              0 NULL                             3             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
--- Temp Table to source data and current data point ... usually already there ... 
-- Contents MUST be deleted each time 

-------------------------------------
-- MandFund lookup
--'Mand', 'Mandatory', 57, 
--'Mand', 'Voluntary', 58, 
--'Mand', 'None',      56,
--'Fund', 'Partially Funded', 60, 
--'Fund', 'Fully Funded',     61, 
--'Fund', 'None',             59

/*
	create table DATAUPDT.HDTTISAMandFundLookup (
		MandFund varchar(10),   --'Mand', 'Fund'
		MandFundTx varchar(20), --'Mandatory', 'Voluntary', 'Partially Funded', 'Fully Funded', 'None'
		MandFundID integer
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTTISAMandFundLookup  TO group db2_ast;
	
	-- drop table    DATAUPDT.HDTTISAMandFundLookup;
	 select * from DATAUPDT.HDTTISAMandFundLookup;

--	 MANDFUND MANDFUNDTX       MANDFUNDID
--	 -------- ---------------- ----------
--	 Mand     Mandatory                57
--	 Mand     Voluntary                58
--	 Mand     None                     56
--	 Mand     None                      0
--
--	 Fund     Partially Funded         60
--	 Fund     Fully Funded             61
--	 Fund     None                     59
--	 Fund     None                      0

-------------------------------------
DELETE from DATAUPDT.HDTTISAMandFundLookup;

-------------------------------------
insert into DATAUPDT.HDTTISAMandFundLookup
(
		MandFund ,   --'Mand', 'Fund'
		MandFundTx , --'Mandatory', 'Voluntary', 'Partially Funded', 'Fully Funded', 'None'
		MandFundID 
)

with ParamMandFund  
(MandFund , MandFundTx , MandFundID) as 
(Values
('Mand', 'Mandatory', 57), 
('Mand', 'Voluntary', 58), 
('Mand', 'None', 56),
('Mand', 'None', 0),

('Fund', 'Partially Funded', 60), 
('Fund', 'Fully Funded', 61), 
('Fund', 'None', 59),
('Fund', 'None', 0)

)

select 
	MandFund , MandFundTx , MandFundID
from ParamMandFund 
;
	
	select * from DATAUPDT.HDTTISAMandFundLookup;
*/

	  
-------------------------------------------------------------------------------------------------------------------------------------
/*
-- Source Data
-- **** -999 do not touch, other wise replace 
	create table DATAUPDT.HDTTISAMandFund2 (  -- for TnI TISA Mandatory Flga / Funding Level
		SeqNum integer,
		HDTNum integer, 
		Requester varchar(30), --default 'Chelsea Romero',
		Loan integer,
	
		MandFund  varchar(10), -- Mand, Fund 
		CurID integer 		default -999,
		CurDesc varchar(20) default '<Blank>', 
		NewID integer		default -999, 
		NewDesc varchar(20) default '<Blank>',  

		CurLoan integer,
		
		ChangeNeeded integer default 0,  
		NewNotes        varchar (200) default NULL-- this column might not be used
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTTISAMandFund2  TO group db2_ast;
	
	-- drop table    DATAUPDT.HDTTISAMandFund2;
	select * from DATAUPDT.HDTTISAMandFund2;
*/
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- HDT's

/*
20250821
[ID:0197613]  T&I Set Aside Funding Type and Original TSA value  8/21/2025 3:39 PM  Created by  Michelle Rymerson
3366513 Please see the attached Data change spreadsheet and the email regarding making these changes. 

Celink Loan Number	Data field to be corrected	 Incorrect Value 	 Correct Value 
3366513	T&I Set Aside?			NONE	Voluntary
3366513	T&I Set Aside Funded?	NONE	Fully Funded

="(" & E2 & ", 0197613, 'Michelle Rymerson', " & A2 & ", '" & IF(TRIM(B2)="T&I Set Aside?", "Mand", "Fund") &  "', " & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),  VLOOKUP(TRIM(C2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE)) &  ", "  & IF(TRIM(B2)="T&I Set Aside?", VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!MandLookup,2,FALSE),   VLOOKUP(TRIM(D2), 'C:\Users\Ted.Kato\Documents\MandFundLookUp.xlsx'!FundLookup,2,FALSE))  & "), -- " & C2 & " -> " & D2

(1, 0197613, 'Michelle Rymerson', 3366513, 'Mand', 56, 58), -- NONE -> Voluntary
(2, 0197613, 'Michelle Rymerson', 3366513, 'Fund', 59, 61) -- NONE -> Fully Funded
*/

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTTISAMandFund2;

-------------------------------------------------------------------------------------------------------------------------------------
insert into DATAUPDT.HDTTISAMandFund2
(
SeqNum, HDTNum, Requester, 
Loan,
MandFund,  
NewID, NewDesc, CurID, CurDesc,
CurLoan ,
ChangeNeeded
)

with Param 
(SeqNum, HDTNum, Requester,  Loan, MandFund, BadID, NewID) as 
(Values

--(1, 0188111, 'Michelle Rymerson', 3347156, 'Fund', 62, 61) -- NONE -> Fully-Funded
--(1, 0193845, 'Jennifer Dees', 3369139, 'Mand', 57, 58) -- Mandatory -> Voluntary

(1, 0197613, 'Michelle Rymerson', 3366513, 'Mand', 56, 58), -- NONE -> Voluntary
(2, 0197613, 'Michelle Rymerson', 3366513, 'Fund', 59, 61) -- NONE -> Fully Funded

)
-- Data  
SELECT
--	count (*)
	P.SeqNum, 
	P.HDTNum,	
	P.Requester,
	P.Loan, 
	P.MandFund, 
	P.NewID,                                                                               LUNew.MandFundTx as "NewDesc", 
	case when P.MandFund = 'Mand' then TT.TISAMANDATORY else TT.TISAFUNDED end as "CurID", LUCur.MandFundTx as "CurDesc"
	,
	TT.TIDATALOANNUMBER         as "CurLoan",
	case when P.NewID = (case when P.MandFund = 'Mand' then TT.TISAMANDATORY else TT.TISAFUNDED end) then 0 else -1 end as ChangeNeeded
--,	TT.TIDATALOANNUMBER
---,	XX.intsubservicerloannumber

from Param P 

inner join celink.tblTaxAndInsData TT
	ON P.Loan = TT.TIDATALOANNUMBER

left outer join DATAUPDT.HDTTISAMandFundLookup LUNew
	on  P.NewID = LUNew.MandFundID
	and P.MandFund= LUNew.MandFund

left outer join DATAUPDT.HDTTISAMandFundLookup LUCur
--	on  TT.TISAMANDATORY = LUCur.MandFundID
	on  LUCur.MandFundID = (case when P.MandFund = 'Mand' then TT.TISAMANDATORY else TT.TISAFUNDED end)
	and P.MandFund = LUCur.MandFund 

--inner join celink.tblloandata XX 
--	ON P.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

ORDER BY P.SeqNum
with ur;

select * from DATAUPDT.HDTTISAMandFund2 order by seqnum;  
-- SEQNUM HDTNUM REQUESTER         LOAN    MANDFUND CURID CURDESC NEWID NEWDESC      CURLOAN CHANGENEEDED NEWNOTES
-- ------ ------ ----------------- ------- -------- ----- ------- ----- ------------ ------- ------------ --------
--      1 197613 Michelle Rymerson 3366513 Mand         0 None       58 Voluntary    3366513           -1 NULL
--      2 197613 Michelle Rymerson 3366513 Fund         0 None       61 Fully Funded 3366513           -1 NULL

/*
	-- dup check
	select count(*) from DATAUPDT.HDTTISAMandFund2 where SeqNum < 2000 group by LOAN having count(*) >1; --72 select 405 - 72 from sysibm.sysdummy1; -- 333
	select count(*) from DATAUPDT.HDTTISAMandFund2 where SeqNum < 2000 group by LOAN having count(*) >1; --0
	

	select * from DATAUPDT.HDTTISAMandFund2 where ChangeNeeded =  0 order by seqnum;  -- session.UY order by seqnum desc; -- 0 rows
	select distinct Loan from DATAUPDT.HDTTISAMandFund2 where ChangeNeeded = 0 ;                                          -- 0  

	select * from DATAUPDT.HDTTISAMandFund2 where ChangeNeeded = -1 order by seqnum;  -- session.UY order by seqnum desc; -- all

	-- SEQNUM HDTNUM REQUESTER   LOAN    MANDFUND CURID CURDESC NEWID NEWDESC      CURLOAN CHANGENEEDED NEWNOTES
	-- ------ ------ ----------- ------- -------- ----- ------- ----- ------------ ------- ------------ --------

	select distinct Loan from DATAUPDT.HDTTISAMandFund2 where ChangeNeeded = -1 ;                                         -- all
	select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count"  from DATAUPDT.HDTTISAMandFund2 group by HDTNUM, Requester, Loan; 
	select HDTNUM "HDT #", Requester "Requester", Loan, count(*) "Row/Loan Count"  from DATAUPDT.HDTTISAMandFund2 group by HDTNUM, Requester, Loan; -- like it!
	select Loan,  count(*) "Row/Loan Count"  from DATAUPDT.HDTTISAMandFund2 group by loan; 
*/	
	select 
	"HDT #", "Requester", Loan, Count(*) "Loan Count"
	from 
	(
	select distinct HDTNUM "HDT #", Requester "Requester", Loan from DATAUPDT.HDTTISAMandFund2
	) A group by "HDT #", "Requester", Loan
	;
	
/*
 HDT #  Requester         LOAN    Loan Count
 ------ ----------------- ------- ----------
 197613 Michelle Rymerson 3366513          1
1 loan.  Funding Type, Funding Level updated. Peer review pending.
*/
	
-------------------------------------------------------
-------------------------------------------------------
-- pre-exec validation
--C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT0191934_Backup.csv

-- Mand
SELECT
	UY.SeqNum, 
	UY.HDTNum,	
	UY.Requester,
	UY.Loan,    UY.CurLoan, TT.TIDATALOANNUMBER, 
	UY.MandFund, 
--	UY.NewID as "NewMandID", UY.NewDesc as "NewMand", UY.CurID as "CurMandID", UY.CurDesc as "CurMand", TT.TISAMANDATORY, UY.ChangeNeeded
	UY.NewID , UY.NewDesc , UY.CurID , UY.CurDesc , TT.TISAMANDATORY "Actual", UY.ChangeNeeded

from DATAUPDT.HDTTISAMandFund2 UY
inner join celink.tblTaxAndInsData TT
ON UY.Loan = TT.TIDATALOANNUMBER
	
inner join celink.tblloandata XX 
ON UY.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

--	where UY.ChangeNeeded = -1 		-- 320
--	and   UY.MandFund = 'Mand'
----	and   UY.NewDesc = UY.CurDesc 	-- 10 loans ... this will be updated anyway, but not appear in note
where UY.MandFund = 'Mand'
--	ORDER BY UY.SeqNum
--with ur;

UNION

-- Fund
SELECT
	UY.SeqNum, 
	UY.HDTNum,	
	UY.Requester,
	UY.Loan,    UY.CurLoan, TT.TIDATALOANNUMBER, 
	UY.MandFund, 
--	UY.NewID as "NewFundID", UY.NewDesc as "NewFund", UY.CurID as "CurFundID", UY.CurDesc as "CurFund", TT.TISAFUNDED, UY.ChangeNeeded
	UY.NewID , UY.NewDesc , UY.CurID , UY.CurDesc , TT.TISAFUNDED "Actual" , UY.ChangeNeeded
--, TT.*
from DATAUPDT.HDTTISAMandFund2 UY
inner join celink.tblTaxAndInsData TT
ON UY.Loan = TT.TIDATALOANNUMBER
	
inner join celink.tblloandata XX 
ON UY.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB
where UY.MandFund = 'Fund'

ORDER BY MANDFUND, SeqNum
with ur;

/*
 SEQNUM HDTNUM REQUESTER         LOAN    CURLOAN TIDATALOANNUMBER MANDFUND NEWID NEWDESC      CURID CURDESC Actual CHANGENEEDED
 ------ ------ ----------------- ------- ------- ---------------- -------- ----- ------------ ----- ------- ------ ------------
      2 197613 Michelle Rymerson 3366513 3366513        3366513.0 Fund        61 Fully Funded     0 None         0           -1
      1 197613 Michelle Rymerson 3366513 3366513        3366513.0 Mand        58 Voluntary        0 None         0           -1

*/

/*
-- Mand
SELECT
	UY.SeqNum, 
	UY.HDTNum,	
	UY.Requester,
	UY.Loan,    UY.CurLoan, TT.TIDATALOANNUMBER, 
	UY.MandFund, 
	UY.NewID as "NewMandID", UY.NewDesc as "NewMand", UY.CurID as "CurMandID", UY.CurDesc as "CurMand", TT.TISAMANDATORY, UY.ChangeNeeded

	from DATAUPDT.HDTTISAMandFund2 UY
	
	inner join celink.tblTaxAndInsData TT
	ON UY.Loan = TT.TIDATALOANNUMBER
	
	inner join celink.tblloandata XX 
	ON UY.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

	where UY.ChangeNeeded = -1 		-- 320
	and   UY.MandFund = 'Mand'
	--and   UY.NewDesc = UY.CurDesc 	-- Validation purpose
	
	ORDER BY UY.SeqNum
with ur;

------ ------ ----------------- ------- ------- ---------------- -------- --------- --------- --------- ------- ------------- ------------
-- Fund
SELECT
	UY.SeqNum, 
	UY.HDTNum,	
	UY.Requester,
	UY.Loan,    UY.CurLoan, TT.TIDATALOANNUMBER, 
	UY.MandFund, 
	UY.NewID as "NewFundID", UY.NewDesc as "NewFund", UY.CurID as "CurFundID", UY.CurDesc as "CurFund", TT.TISAFUNDED, UY.ChangeNeeded
, TT.*
	from DATAUPDT.HDTTISAMandFund2 UY
	
	inner join celink.tblTaxAndInsData TT
	ON UY.Loan = TT.TIDATALOANNUMBER
	
	inner join celink.tblloandata XX 
	ON UY.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

	where UY.ChangeNeeded = -1		--311
	and   UY.MandFund = 'Fund'
	--and   trim(UY.NewDesc) = trim(UY.CurDesc) 	---- Validation purpose
	
	ORDER BY UY.SeqNum
with ur;

*/

------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
-- update

-- Mand
MERGE INTO celink.tblTaxAndInsData TT
USING 
	(

	SELECT 
		SeqNum, HDTNum, Requester, Loan, MandFund, NewID, ChangeNeeded 
	from DATAUPDT.HDTTISAMandFund2
	where ChangeNeeded = -1 
	and   MandFund = 'Mand'
	order by SeqNum

	) UY (SeqNum, HDTNum, Requester, Loan, NewMand, NewID, ChangeNeededMand)
	ON UY.Loan = TT.TIDATALOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
	TT.TISAMANDATORY = UY.NewID
;	

------
--Fund
MERGE INTO celink.tblTaxAndInsData TT
USING 
	(
	
	SELECT 
		SeqNum, HDTNum, Requester, Loan, MandFund, NewID, ChangeNeeded 
	from DATAUPDT.HDTTISAMandFund2
	where ChangeNeeded = -1 
	and   MandFund = 'Fund'
	order by SeqNum
	
	) UY (SeqNum, HDTNum, Requester, Loan, MandFund, NewID, ChangeNeeded )
	ON UY.Loan = TT.TIDATALOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
	TT.TISAFUNDED = UY.NewID
;	


-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- validation after
--C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT0191934_Validation.csv

-- Mand
SELECT
	UY.SeqNum, 
	UY.HDTNum,	
	UY.Requester,
	UY.Loan,    UY.CurLoan, TT.TIDATALOANNUMBER, 
	UY.MandFund, 
--	UY.NewID as "NewMandID", UY.NewDesc as "NewMand", UY.CurID as "CurMandID", UY.CurDesc as "CurMand", TT.TISAMANDATORY, UY.ChangeNeeded
	UY.NewID , UY.NewDesc , UY.CurID , UY.CurDesc , TT.TISAMANDATORY "After", UY.ChangeNeeded

	from DATAUPDT.HDTTISAMandFund2 UY
	
	inner join celink.tblTaxAndInsData TT
	ON UY.Loan = TT.TIDATALOANNUMBER
	
	inner join celink.tblloandata XX 
	ON UY.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

--	where UY.ChangeNeeded = -1 		-- 320
--	and   UY.MandFund = 'Mand'
----	and   UY.NewDesc = UY.CurDesc 	-- 10 loans ... this will be updated anyway, but not appear in note
	where UY.MandFund = 'Mand'
--	ORDER BY UY.SeqNum
--with ur;

UNION

-- Fund
SELECT
	UY.SeqNum, 
	UY.HDTNum,	
	UY.Requester,
	UY.Loan,    UY.CurLoan, TT.TIDATALOANNUMBER, 
	UY.MandFund, 
--	UY.NewID as "NewFundID", UY.NewDesc as "NewFund", UY.CurID as "CurFundID", UY.CurDesc as "CurFund", TT.TISAFUNDED, UY.ChangeNeeded
	UY.NewID , UY.NewDesc , UY.CurID , UY.CurDesc , TT.TISAFUNDED "After", UY.ChangeNeeded
--, TT.*
	from DATAUPDT.HDTTISAMandFund2 UY
	
	inner join celink.tblTaxAndInsData TT
	ON UY.Loan = TT.TIDATALOANNUMBER
	
	inner join celink.tblloandata XX 
	ON UY.Loan = XX.intsubservicerloannumber   -- Filter out any rows that do not exists in DB

	where UY.MandFund = 'Fund'
	
ORDER BY NEWDESC, SeqNum
with ur;

/* result from above UNION

 SEQNUM HDTNUM REQUESTER         LOAN    CURLOAN TIDATALOANNUMBER MANDFUND NEWID NEWDESC      CURID CURDESC After CHANGENEEDED
 ------ ------ ----------------- ------- ------- ---------------- -------- ----- ------------ ----- ------- ----- ------------
      2 197613 Michelle Rymerson 3366513 3366513        3366513.0 Fund        61 Fully Funded     0 None       61           -1
      1 197613 Michelle Rymerson 3366513 3366513        3366513.0 Mand        58 Voluntary        0 None       58           -1

*/
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Create Notes string ... Pivot

-- select * from DATAUPDT.HDTTISAMandFund2 order by seqnum;  
-- SEQNUM HDTNUM REQUESTER      LOAN    MANDFUND CURID CURDESC   NEWID NEWDESC      CURLOAN CHANGENEEDED NEWNOTES
-- ------ ------ -------------- ------- -------- ----- --------- ----- ------------ ------- ------------ --------
--      1  81629 Kiyauna Brewer 3200612 Mand        57 Mandatory    58 Voluntary    3200612           -1 NULL
--      2  81629 Kiyauna Brewer 3200193 Mand         0 None         57 Mandatory    3200193           -1 NULL
--      3  81629 Kiyauna Brewer 3200194 Fund         0 None         61 Fully Funded 3200194           -1 NULL

declare global TEMPORARY TABLE SESSION.MyPivot
(
	SeqNum integer,
	Loan   integer, 
	UpdtCol1 varchar(50)  default '', 
	UpdtCol2 varchar(50)  default '', 
	UpdtColString varchar(500) default ''
)
ON COMMIT PRESERVE ROWS;


INSERT INTO session.MyPivot
	(SeqNum, Loan, UpdtColString, UpdtCol1, UpdtCol2)   
WITH Loans (SeqNum, Loan) as 
(
	SELECT 
		DISTINCT SeqNum, Loan 
	FROM DATAUPDT.HDTTISAMandFund2 
--	where (ChangeNeeded = -1 and MandFund = 'Mand')
--	or    (ChangeNeeded = -1 and MandFund = 'Fund')
	where (CurDesc <>  NewDesc and MandFund = 'Mand')
	or    (CurDesc <>  NewDesc and MandFund = 'Fund')
) -- construct list of loans

SELECT 
	Loans.SeqNum,
	Loans.Loan
	, 
	case when x1.MandFund is null then '' else ' Mandatory flag updated from ' || X1.CurID || '(' || X1.CurDesc || ') to ' || X1.NewID || '(' || X1.NewDesc ||')' end  
	|| 
	case when x2.MandFund is null then '' else ' Funding Level updated from ' || X2.CurID || '(' || X2.CurDesc || ') to ' || X2.NewID || '(' || X2.NewDesc ||')' end  
	|| '' as UpdtColString
	,
	x1.MandFund, 
	x2.MandFund

FROM Loans

left JOIN DATAUPDT.HDTTISAMandFund2 x1
ON   x1.Loan = Loans.Loan
AND  x1.MandFund = 'Mand'
and  x1.ChangeNeeded = -1

left JOIN DATAUPDT.HDTTISAMandFund2 x2
ON   x2.Loan = Loans.Loan
AND  x2.MandFund = 'Fund'
and  x2.ChangeNeeded = -1

order by Loans.SeqNum
;

select * from session.MyPivot order by SeqNum;
-- SEQNUM LOAN    UPDTCOL1 UPDTCOL2 UPDTCOLSTRING
-- ------ ------- -------- -------- -------------------------------------------------------
--      2 3275463 NULL     Fund      Funding Level updated from 0(None) to 61(Fully Funded)

-------------------------------------------
-- Notes for Bulk upload with  row number ... like it the best
Select 
		UY.RowNum,
		P.SeqNum,	
		P.Loan as "Loan Number",
		'N'  as "Priority (Y/N)", 
		'0'   as "Note Step Number",
		''   as "Step Date Completed (YYYY-MM-DD)", 
    	'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') TISA' || right(P.UpdtColString, length(P.UpdtColString) - 1)  || '.' as "Loan Note" 

	from session.MyPivot P
	inner join 
	(
	SELECT 
		ROW_NUMBER() OVER (partition by loan order by SeqNum) AS RowNum, 
		SeqNum, HDTNum, Requester, Loan
		FROM DATAUPDT.HDTTISAMandFund2
	) UY
	on  P.loan = UY.Loan  
	and P.SeqNum = UY.SeqNum
--	and UY.RowNum = 1	
	where  (P.UpdtCol1 is not null) or (P.UpdtCol2 is not null) -- can be ... where  (P.UpdtCol1 = 'Mand') or (P.UpdtCol2 = 'Fund')
Order by UY.SeqNum
; 

/*
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTUpdtNotes_ 132757.csv

 ROWNUM SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
 ------ ------ ----------- -------------- ---------------- -------------------------------- ----------------------------------------------------------------------------------------------------------------------------------------------

*/

Select 
	P.Loan as "Loan Number",
--    'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') TISA' || right(P.UpdtColString, length(P.UpdtColString) - 1)  || '.' as "Loan Note" 
    'Per HDT ' || UY.HDTNum || ' Funding Type ' || right(P.UpdtColString, length(P.UpdtColString) - 1)  || '.' as "Loan Note" 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from session.MyPivot P
inner join 
	(
	SELECT 
		ROW_NUMBER() OVER (partition by loan order by SeqNum) AS RowNum, 
		SeqNum, HDTNum, Requester, Loan
		FROM DATAUPDT.HDTTISAMandFund2
	) UY
	on  P.loan = UY.Loan  
	and P.SeqNum = UY.SeqNum
	and UY.RowNum = 1	
	where  (P.UpdtCol1 is not null) or (P.UpdtCol2 is not null) -- can be ... where  (P.UpdtCol1 = 'Mand') or (P.UpdtCol2 = 'Fund')
Order by UY.SeqNum
; 
/*

 Loan Number Loan Note                                                                               3                          4     5 6
 ----------- --------------------------------------------------------------------------------------- -------------------------- ----- - -
     3369139 Per HDT 193845 Funding Type Mandatory flag updated from 57(Mandatory) to 58(Voluntary). 2025-07-02 18:53:40.172921 tkato 0 0
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Notes update
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

Select 
	P.Loan as "Loan Number",
--  'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') TISA ' || right(P.UpdtColString, length(P.UpdtColString) - 1)  || '.' as "Loan Note" 
    'Per HDT ' || UY.HDTNum || ' Funding Type ' || right(P.UpdtColString, length(P.UpdtColString) - 1)  || '.' as "Loan Note" 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from session.MyPivot P
inner join 
	(
	SELECT 
		ROW_NUMBER() OVER (partition by loan order by SeqNum) AS RowNum, 
		SeqNum, HDTNum, Requester, Loan
		FROM DATAUPDT.HDTTISAMandFund2
	) UY
	on  P.loan = UY.Loan  
	and P.SeqNum = UY.SeqNum
	and UY.RowNum = 1	
	where  (P.UpdtCol1 is not null) or (P.UpdtCol2 is not null) -- can be ... where  (P.UpdtCol1 = 'Mand') or (P.UpdtCol2 = 'Fund')
Order by UY.SeqNum
; 


------------------
-- Notes validation
select 
--	count(*) as "MyCount"
--	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP , a.*
--from DATAUPDT.HDTTISAMandFund2 UY 
from 
(
select HDTNum, Loan from DATAUPDT.HDTTISAMandFund2 group by Loan, HDTNum
) UY
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || UY.HDTNum ||'%'
with ur;


-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                             CHRUSERID BLNPRIORITY NOTESTEP IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                             DTMNOTEDATE                CHRUSERID BLNPRIORITY CHRCATEGORY NOTESTEP STEPDATECOMPLETED
-- -------------------------- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------------------------------- --------- ----------- -------- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------------------------------- -------------------------- --------- ----------- ----------- -------- -----------------
-- 2025-08-21 19:47:39.311714    212756174                3366513.0 Per HDT 197613 Funding Type Mandatory flag updated from 0(None) to 58(Voluntary) Funding Level updated from 0(None) to 61(Fully Funded). tkato               0        0    212756174                3366513.0 Per HDT 197613 Funding Type Mandatory flag updated from 0(None) to 58(Voluntary) Funding Level updated from 0(None) to 61(Fully Funded). 2025-08-21 19:47:39.311714 tkato               0 NULL               0 NULL


--end


/* ********************** ref
------------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter ,,, plug in valeus fro -- Note Insert Value Creastion
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, StepNum) as
(values

-- Note Insert Value
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
(3347156, 'Per HDT 188111 Funding Level updated from 62 to 61(Fully Funded).', CURRENT_TIMESTAMP, 'tkato', 0, 0)

) 
select * from P
;


-- LOAN    NOTE                                                                               TIMES                      WHO   PRIO STEPNUM
-- ------- ---------------------------------------------------------------------------------- -------------------------- ----- ---- -------
-- 3201311 Per HDT 134798 Funding Type Mandatory flag updated from 0(None) to 57(Mandatory).  2023-09-27 20:25:50.615433 tkato    0       0
-- 3203969 Per HDT 134798 Funding Type Mandatory flag updated from 0(None) to 57(Mandatory).  2023-09-27 20:25:50.615433 tkato    0       0
-- 3204825 Per HDT 134798 Funding Type Mandatory flag updated from 0(None) to 57(Mandatory).  2023-09-27 20:25:50.615433 tkato    0       0
-- 3136682 Per HDT 134792 Funding Type Mandatory flag updated from 58(Voluntary) to 56(None). 2023-09-27 20:25:50.615433 tkato    0       0
*/

-------------------------------------------------------
-------------------------------------------------------
-- sample output
-- ROWNUM SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------------------------------------------------------
--      1      1     3200612 N                                                                
--Per HDT 81629 (Kiyauna Brewer) TISA Mandatory flag updated from 57(Mandatory) to 58(Voluntary).
--      1      2     3200193 N                                                                
--Per HDT 81629 (Kiyauna Brewer) TISA Mandatory flag updated from 0(None) to 57(Mandatory).
--      1      3     3200194 N                                                               
--Per HDT 81629 (Kiyauna Brewer) TISA Funding Level updated from 0(None) to 61(Fully Funded).


-- ROWNUM SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ------ ----------- -------------- ---------------- -------------------------------- --------------------------------------------------------------------------------------------------------------------------------------------------------------------
--      1      1     3199832 N                                                                
--Per HDT 99999 (Kiyauna Brewer) TISA Mandatory flag updated from 57(Mandatory) to 58(Voluntary), Funding Level updated from 61(Fully Funded) to 60(Partially Funded).
--      1      3     3199374 N                                                                
--Per HDT 99999 (Kiyauna Brewer) TISA Mandatory flag updated from 58(Voluntary) to 57(Mandatory), Funding Level updated from 61(Fully Funded) to 59(None).
-------------------------------------------------------
-------------------------------------------------------

-- ROWNUM SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ------ ----------- -------------- ---------------- -------------------------------- -----------------------------------------------------------------------------------------------
--      1      1     3200193 N                                                                
--Per HDT 82103 (Kiyauna Brewer) TISA Funding Level updated from 0(None) to 61(Fully Funded).
--      1      2     3201511 N                                                                
--Per HDT 82103 (Kiyauna Brewer) TISA Mandatory flag updated from 57(Mandatory) to 58(Voluntary).



/* ****************************************************
-------------------------------------------------------
-------------------------------------------------------
-- not good!!!
select 
		X1.SeqNum,	
		X.Loan as "Loan Number",
		'N'  as "Priority (Y/N)", 
		''   as "Note Step Number",
		''   as "Step Date Completed (YYYY-MM-DD)", 
--	X1.SEQNUM, --X1.HDTNUM, X1.REQUESTER, 
--	X.LOAN,
--	X1.NewID as "NewMandID", X1.NewDesc as "NewMand", X1.CurID as "CurMandID", X1.CurDesc as "CurMand",
--	X2.NewID as "NewFundID", X2.NewDesc as "NewFund", X2.CurID as "CurFundID", X2.CurDesc as "CurFund"
--	,
	'Per HDT ' || X1.HDTNum || ' (' || X1.Requester || ') TISA' ||
		case when X1.ChangeNeeded = -1 
		then ' Mandatory flag updated from ' ||X1.CurID || '(' || X1.CurDesc || ') to ' || X1.NewID || '(' || X1.NewDesc ||')'
		else ''
		end ||
		case when X2.ChangeNeeded = -1
		then ' Funding Level updated from ' || X2.CurID || '(' || X2.CurDesc || ') to ' || X2.NewID || '(' || X2.NewDesc ||')'
		else ''
		end ||
		'.' as "Loan Note"
from 
(
select  
	LOAN
from 
DATAUPDT.HDTTISAMandFund2 
where (ChangeNeeded = -1 and MandFund = 'Mand')
or    (ChangeNeeded = -1 and MandFund = 'Fund')
group by LOAN
) X

left outer join -- Mand
(
select 
	SEQNUM, HDTNUM, REQUESTER, LOAN, NEWID, NEWDesc, CURID, CURDesc, ChangeNeeded 
from 
DATAUPDT.HDTTISAMandFund2 
where (ChangeNeeded = -1 and MandFund = 'Mand')
) X1
On X.Loan = X1.Loan

left outer join -- Fund 
(
select 
	SEQNUM, HDTNUM, REQUESTER, LOAN, NEWID, NEWDesc, CURID, CURDesc, ChangeNeeded 
from 
DATAUPDT.HDTTISAMandFund2 
where (ChangeNeeded = -1 and MandFund = 'Fund')
) X2	
on X.Loan = X2.Loan

--Order by X1.SeqNum 
; 


-- SEQNUM HDTNUM REQUESTER      LOAN    NewMandID NewMand   CurMandID CurMand   NewFundID NewFund          CurFundID CurFund      Loan Note
-- ------ ------ -------------- ------- --------- --------- --------- --------- --------- ---------------- --------- ------------ -------------------------------------------------------------------------------------------------------------------------------------------------------------------
--      1  74030 Kiyauna Brewer 3183178        58 Voluntary        57 Mandatory      NULL NULL                  NULL NULL         
--Per HDT 74030 (Kiyauna Brewer) TISA Mandatory flag updated from 57(Mandatory) to 58(Voluntary).
--      3  74030 Kiyauna Brewer 3182420        58 Voluntary        57 Mandatory        60 Partially Funded        61 Fully Funded 
--Per HDT 74030 (Kiyauna Brewer) TISA Mandatory flag updated from 57(Mandatory) to 58(Voluntary) Funding Level updated from 61(Fully Funded) to 60(Partially Funded).
*/
