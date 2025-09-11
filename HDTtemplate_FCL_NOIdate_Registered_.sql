
/*
20230607
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTUpdtNotes_ 129785.csv
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT129785_Backup.csv
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT129785_Backup_LeftJoin.csv
INCIDENT #129785
DeAnna Todd
Supervisor, Short Sales
NY eReg dates 06/06/2023
Created: Jun 06, 2023 at 9:49 PM by DeAnna Todd
preview ,,, FCL ,,, State NOI Registered
Please see attached spreadsheet. We need the attached loans updated with the NOI Registered field on the FCL tab. Thanks so much for you assistance with this.
NOI eReg date_06.06....xlsx
="(" & C2  & ", 129785, 'DeAnna Todd', " & A2 & ", '" & TEXT(B2, "YYYY-MM-DD") & "'),"
NOI Registered date updated for 177 loans.  Pending verification.
*/

/*
20250730
[ID:0195772] FCL Data 7/30/2025 10:51 AM Created by Jorge Solis
I've attached a spreadsheet of all the loans that need the State NOI Registered date filled in. 
="(" & C2  & ", 0195772, 'Jorge Solis', " & A2 & ", '" & TEXT(B2, "YYYY-MM-DD") & "'),"
77 loans. FCL NOI Registered date updated.  Peer review pending.
*/

--------------------------------------------------------------------------------------------------------------
-- NOI field 
select STATENOISENTDT, STATENOIREGISTEREDDT, * from celink.TBLFORECLOSURE where FORLOANNUMBER in 
(
1028866,
1087565,
1091090
,
3225296
)
with ur;

-- STATENOISENTDT FORLOANNUMBER FORATTORNEYACCEPTEDFILEDATE FORATTORNEY FORATTORNEYPHONE FORFIRSTLEGALDEADLINEDATE FORFIRSTLEGALCOMPLETEDDATE FORESTIMATEDSALEDATE FORCONFIRMEDSALEDATE FORREONOTIFICATIONSENTDATE FORTITLECLAIM FORCHAINOFTITLE FORCOURTDELAYS FORATTORNEYDELAYS FORLITIGATION FORBANKRUPTCY FOROTHER FORBIDSENTTOATTORNEYDATE FORBIDAMOUNT FORTOTALDEBTBID FORAPPRAISALBID FORORIGNOTESENTDATE FORATTORNEYFILERECEIVED FORNOTES FORATTNYESTIMATEDSALEDATE FORTITLECLAIMRESOLVED FORTITLECLAIMDETAILS FORCHAINOFTITLERESOLVED FORCHAINOFTITLEDETAILS FORCOURTDELAYSDETAILS FORATTNYDELAYSDETAILS FORLITIGATIONRESOLVED FORLITIGATIONDETAILS FORBANKRUPTCYDETAILS FOROTHERDETAILS FORAPPRAISALDATE FORAPPRAISALVALUE FORRECORDEDDEEDDATE FORAPPRAISALRECEIVEDDATE FORCHAINOFTITLECONFIRMEDDATE FORTHIRDPARTYSTAMPDATE FORFIRSTLEGALNOTIFICATION FORACTUALDATEOFSALE STATENOISENTDT STATENOIREGISTEREDDT
-- -------------- ------------- --------------------------- ----------- ---------------- ------------------------- -------------------------- -------------------- -------------------- -------------------------- ------------- --------------- -------------- ----------------- ------------- ------------- -------- ------------------------ ------------ --------------- --------------- ------------------- ----------------------- -------- ------------------------- --------------------- -------------------- ----------------------- ---------------------- --------------------- --------------------- --------------------- -------------------- -------------------- --------------- ---------------- ----------------- ------------------- ------------------------ ---------------------------- ---------------------- ------------------------- ------------------- -------------- --------------------
-- 2023-06-01         1028866.0 NULL                                                     2021-03-05                NULL                       NULL                 NULL                 NULL                                   0               0              0                 0             0             0        0 NULL                         0.000000               0               0 NULL                                      0          NULL                                          0                                            0                                                                                        0                                                           2021-03-08           700000.000000 NULL                2021-03-08               NULL                         NULL                   NULL                      NULL                2023-06-01     NULL
-- 2023-06-01         1087565.0 NULL                        NULL        NULL             NULL                      NULL                       NULL                 NULL                 NULL                                   0               0              0                 0             0             0        0 NULL                         0.000000               0               0 NULL                                      0 NULL     NULL                                          0 NULL                                       0 NULL                   NULL                  NULL                                      0 NULL                 NULL                 NULL            NULL                      0.000000 NULL                NULL                     NULL                         NULL                   NULL                      NULL                2023-06-01     NULL
-- 2023-06-01         1091090.0 NULL                        NULL        NULL             NULL                      NULL                       NULL                 NULL                 NULL                                   0               0              0                 0             0             0        0 NULL                         0.000000               0               0 NULL                                      0 NULL     NULL                                          0 NULL                                       0 NULL                   NULL                  NULL                                      0 NULL                 NULL                 NULL            NULL                      0.000000 NULL                NULL                     NULL                         NULL                   NULL                      NULL                2023-06-01     NULL

	 select * from DATAUPDT.HDTDataUpdt_TnIdata_SA;


-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- generic table
---- DATAUPDT Table for  
--create table DATAUPDT.HDTDataUpdt_TnIdata_SA   
--

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTDataUpdt_TnIdata_SA;

-------------------------------------------------------------------------------------------------------------------------------------
-- Data  
insert into DATAUPDT.HDTDataUpdt_TnIdata_SA
	(SeqNum, HDTNum, Requester, Loan, NewTiAanalysis, CurTiAanalysis, ChangeNeeded)

with Param 
	(SeqNum, HDTNum, Requester, Loan, NewDate ) as 
	(Values
	
--> source
(1, 0195772, 'Jorge Solis', 1019695, '2025-07-03'),
(2, 0195772, 'Jorge Solis', 1115929, '2025-07-03'),
(3, 0195772, 'Jorge Solis', 1129316, '2025-07-03'),
(4, 0195772, 'Jorge Solis', 1168975, '2025-07-03'),
(5, 0195772, 'Jorge Solis', 1170368, '2025-07-03'),
(6, 0195772, 'Jorge Solis', 1171232, '2025-07-03'),
(7, 0195772, 'Jorge Solis', 1197030, '2025-07-03'),
(8, 0195772, 'Jorge Solis', 1220106, '2025-07-03'),
(9, 0195772, 'Jorge Solis', 1260710, '2025-07-03'),
(10, 0195772, 'Jorge Solis', 1276054, '2025-07-03'),
(11, 0195772, 'Jorge Solis', 1280109, '2025-07-03'),
(12, 0195772, 'Jorge Solis', 1289564, '2025-07-03'),
(13, 0195772, 'Jorge Solis', 1298723, '2025-07-03'),
(14, 0195772, 'Jorge Solis', 1299181, '2025-07-03'),
(15, 0195772, 'Jorge Solis', 1306636, '2025-07-03'),
(16, 0195772, 'Jorge Solis', 1312455, '2025-07-03'),
(17, 0195772, 'Jorge Solis', 1320297, '2025-07-03'),
(18, 0195772, 'Jorge Solis', 1335150, '2025-07-03'),
(19, 0195772, 'Jorge Solis', 1355198, '2025-07-03'),
(20, 0195772, 'Jorge Solis', 1375335, '2025-07-03'),
(21, 0195772, 'Jorge Solis', 1376409, '2025-07-03'),
(22, 0195772, 'Jorge Solis', 1385235, '2025-07-03'),
(23, 0195772, 'Jorge Solis', 1396947, '2025-07-03'),
(24, 0195772, 'Jorge Solis', 1401163, '2025-07-03'),
(25, 0195772, 'Jorge Solis', 1404734, '2025-07-03'),
(26, 0195772, 'Jorge Solis', 3115024, '2025-07-03'),
(27, 0195772, 'Jorge Solis', 3117018, '2025-07-03'),
(28, 0195772, 'Jorge Solis', 3124834, '2025-07-03'),
(29, 0195772, 'Jorge Solis', 3131395, '2025-07-03'),
(30, 0195772, 'Jorge Solis', 3136747, '2025-07-03'),
(31, 0195772, 'Jorge Solis', 3153317, '2025-07-03'),
(32, 0195772, 'Jorge Solis', 3158138, '2025-07-03'),
(33, 0195772, 'Jorge Solis', 3172325, '2025-07-03'),
(34, 0195772, 'Jorge Solis', 3173346, '2025-07-03'),
(35, 0195772, 'Jorge Solis', 3177091, '2025-07-23'),
(36, 0195772, 'Jorge Solis', 3180524, '2025-07-03'),
(37, 0195772, 'Jorge Solis', 3217647, '2025-07-03'),
(38, 0195772, 'Jorge Solis', 3230690, '2025-07-03'),
(39, 0195772, 'Jorge Solis', 3236563, '2025-07-03'),
(40, 0195772, 'Jorge Solis', 3243732, '2025-07-03'),
(41, 0195772, 'Jorge Solis', 3255641, '2025-07-07'),
(42, 0195772, 'Jorge Solis', 3267304, '2025-07-07'),
(43, 0195772, 'Jorge Solis', 3275533, '2025-07-07'),
(44, 0195772, 'Jorge Solis', 3281870, '2025-07-07'),
(45, 0195772, 'Jorge Solis', 3283133, '2025-07-07'),
(46, 0195772, 'Jorge Solis', 3291450, '2025-07-07'),
(47, 0195772, 'Jorge Solis', 3299700, '2025-07-07'),
(48, 0195772, 'Jorge Solis', 3302709, '2025-07-07'),
(49, 0195772, 'Jorge Solis', 3305268, '2025-07-07'),
(50, 0195772, 'Jorge Solis', 3312477, '2025-07-07'),
(51, 0195772, 'Jorge Solis', 3316146, '2025-07-07'),
(52, 0195772, 'Jorge Solis', 3322082, '2025-07-07'),
(53, 0195772, 'Jorge Solis', 3323876, '2025-07-07'),
(54, 0195772, 'Jorge Solis', 3332052, '2025-07-07'),
(55, 0195772, 'Jorge Solis', 3332369, '2025-07-07'),
(56, 0195772, 'Jorge Solis', 3334523, '2025-07-07'),
(57, 0195772, 'Jorge Solis', 3344038, '2025-07-07'),
(58, 0195772, 'Jorge Solis', 3346893, '2025-07-07'),
(59, 0195772, 'Jorge Solis', 3350639, '2025-07-07'),
(60, 0195772, 'Jorge Solis', 3353605, '2025-07-07'),
(61, 0195772, 'Jorge Solis', 3354251, '2025-07-07'),
(62, 0195772, 'Jorge Solis', 3354499, '2025-07-07'),
(63, 0195772, 'Jorge Solis', 1180612, '2025-07-08'),
(64, 0195772, 'Jorge Solis', 3336783, '2025-07-08'),
(65, 0195772, 'Jorge Solis', 3347035, '2025-07-08'),
(66, 0195772, 'Jorge Solis', 3241746, '2025-07-11'),
(67, 0195772, 'Jorge Solis', 3260346, '2025-07-23'),
(68, 0195772, 'Jorge Solis', 3328223, '2025-07-11'),
(69, 0195772, 'Jorge Solis', 1352803, '2025-07-15'),
(70, 0195772, 'Jorge Solis', 1176072, '2025-07-17'),
(71, 0195772, 'Jorge Solis', 1206795, '2025-07-17'),
(72, 0195772, 'Jorge Solis', 3265034, '2025-07-17'),
(73, 0195772, 'Jorge Solis', 3344478, '2025-07-17'),
(74, 0195772, 'Jorge Solis', 3349913, '2025-07-17'),
(75, 0195772, 'Jorge Solis', 3198280, '2025-07-21'),
(76, 0195772, 'Jorge Solis', 1388736, '2025-07-23'),
(77, 0195772, 'Jorge Solis', 1317890, '2025-07-24')
--> source
	) 
SELECT
--	count (*)
	P.SeqNum, 
	P.HDTNum,	
	P.Requester,
	P.Loan, P.NewDate,
	--TT.STATENOISENTDT as CurNOI,
	TT.STATENOIREGISTEREDDT as CurNOIReg,
	case when date(P.NewDate) = COALESCE(cast(TT.STATENOIREGISTEREDDT as varchar(20)), date('2999-01-01')) then 0 else -1 end as ChangeNeeded
--	,TT.FORLOANNUMBER
from Param P 
--	inner join celink.TBLFORECLOSURE TT
--	ON P.Loan = TT.FORLOANNUMBER
-- left join to see ones not exist
left outer join celink.TBLFORECLOSURE TT
ON P.Loan = TT.FORLOANNUMBER
--	where TT.FORLOANNUMBER is null
-- left join to see ones not exist

ORDER BY P.SeqNum
with ur;

-- SEQNUM HDTNUM REQUESTER   LOAN    NEWDATE    CURNOIREG CHANGENEEDED
-- ------ ------ ----------- ------- ---------- --------- ------------
--      1 195772 Jorge Solis 1019695 2025-07-03 NULL                -1
--      2 195772 Jorge Solis 1115929 2025-07-03 NULL                -1
--      3 195772 Jorge Solis 1129316 2025-07-03 NULL                -1
--      4 195772 Jorge Solis 1168975 2025-07-03 NULL                -1
--      5 195772 Jorge Solis 1170368 2025-07-03 NULL                -1
--      6 195772 Jorge Solis 1171232 2025-07-03 NULL                -1
--      7 195772 Jorge Solis 1197030 2025-07-03 NULL                -1
--      8 195772 Jorge Solis 1220106 2025-07-03 NULL                -1
--      9 195772 Jorge Solis 1260710 2025-07-03 NULL                -1
--     10 195772 Jorge Solis 1276054 2025-07-03 NULL                -1


	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA ; --- 77
	-- SEQNUM HDTNUM REQUESTER   LOAN    NEWTIAANALYSIS CURTIAANALYSIS CHANGENEEDED NEWNOTES
	-- ------ ------ ----------- ------- -------------- -------------- ------------ --------
	--      1 195772 Jorge Solis 1019695 2025-07-03     NULL                     -1 NULL
	--      2 195772 Jorge Solis 1115929 2025-07-03     NULL                     -1 NULL
	--      3 195772 Jorge Solis 1129316 2025-07-03     NULL                     -1 NULL
	--      4 195772 Jorge Solis 1168975 2025-07-03     NULL                     -1 NULL
	--      5 195772 Jorge Solis 1170368 2025-07-03     NULL                     -1 NULL
	--      6 195772 Jorge Solis 1171232 2025-07-03     NULL                     -1 NULL
	--      7 195772 Jorge Solis 1197030 2025-07-03     NULL                     -1 NULL

	--     70 195772 Jorge Solis 1176072 2025-07-17     NULL                     -1 NULL
	--     71 195772 Jorge Solis 1206795 2025-07-17     NULL                     -1 NULL
	--     72 195772 Jorge Solis 3265034 2025-07-17     NULL                     -1 NULL
	--     73 195772 Jorge Solis 3344478 2025-07-17     NULL                     -1 NULL
	--     74 195772 Jorge Solis 3349913 2025-07-17     NULL                     -1 NULL
	--     75 195772 Jorge Solis 3198280 2025-07-21     NULL                     -1 NULL
	--     76 195772 Jorge Solis 1388736 2025-07-23     NULL                     -1 NULL
	--     77 195772 Jorge Solis 1317890 2025-07-24     NULL                     -1 NULL
     
	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded =  0 order by seqnum;  -- session.UY order by seqnum desc; --   0
	select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded = -1 order by seqnum;  -- session.UY order by seqnum desc; -- all
	select Loan, count(Loan) from DATAUPDT.HDTDataUpdt_TnIdata_SA group by Loan having count(Loan) > 1; -- no dup

	----------------------------------------------------------------------------------------------------------------------------------------------
	-- pre exec validation -- see HDTBackup_122759_122760.txt
	
	select
		SeqNum,	HDTNum,	Requester, Loan, CurTiAanalysis, NewTiAanalysis, ChangeNeeded, TT.STATENOIREGISTEREDDT
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	inner join celink.TBLFORECLOSURE TT 
	ON UY.Loan = TT.FORLOANNUMBER
		
	where UY.NewTiAanalysis <> date ('2999-01-01')	
	and   UY.ChangeNeeded = -1
	order by UY.seqnum
	with ur;

 /*
 77
 SEQNUM HDTNUM REQUESTER   LOAN    CURTIAANALYSIS NEWTIAANALYSIS CHANGENEEDED STATENOIREGISTEREDDT
 ------ ------ ----------- ------- -------------- -------------- ------------ --------------------
      1 195772 Jorge Solis 1019695 NULL           2025-07-03               -1 NULL
      2 195772 Jorge Solis 1115929 NULL           2025-07-03               -1 NULL
      3 195772 Jorge Solis 1129316 NULL           2025-07-03               -1 NULL
      4 195772 Jorge Solis 1168975 NULL           2025-07-03               -1 NULL
      5 195772 Jorge Solis 1170368 NULL           2025-07-03               -1 NULL
      6 195772 Jorge Solis 1171232 NULL           2025-07-03               -1 NULL
      7 195772 Jorge Solis 1197030 NULL           2025-07-03               -1 NULL
      8 195772 Jorge Solis 1220106 NULL           2025-07-03               -1 NULL
      9 195772 Jorge Solis 1260710 NULL           2025-07-03               -1 NULL
     10 195772 Jorge Solis 1276054 NULL           2025-07-03               -1 NULL
     11 195772 Jorge Solis 1280109 NULL           2025-07-03               -1 NULL
     12 195772 Jorge Solis 1289564 NULL           2025-07-03               -1 NULL
     13 195772 Jorge Solis 1298723 NULL           2025-07-03               -1 NULL
     14 195772 Jorge Solis 1299181 NULL           2025-07-03               -1 NULL
     15 195772 Jorge Solis 1306636 NULL           2025-07-03               -1 NULL
     16 195772 Jorge Solis 1312455 NULL           2025-07-03               -1 NULL
     17 195772 Jorge Solis 1320297 NULL           2025-07-03               -1 NULL
     18 195772 Jorge Solis 1335150 NULL           2025-07-03               -1 NULL
     19 195772 Jorge Solis 1355198 NULL           2025-07-03               -1 NULL
     20 195772 Jorge Solis 1375335 NULL           2025-07-03               -1 NULL
     21 195772 Jorge Solis 1376409 NULL           2025-07-03               -1 NULL
     22 195772 Jorge Solis 1385235 NULL           2025-07-03               -1 NULL
     23 195772 Jorge Solis 1396947 NULL           2025-07-03               -1 NULL
     24 195772 Jorge Solis 1401163 NULL           2025-07-03               -1 NULL
     25 195772 Jorge Solis 1404734 NULL           2025-07-03               -1 NULL
     26 195772 Jorge Solis 3115024 NULL           2025-07-03               -1 NULL
     27 195772 Jorge Solis 3117018 NULL           2025-07-03               -1 NULL
     28 195772 Jorge Solis 3124834 NULL           2025-07-03               -1 NULL
     29 195772 Jorge Solis 3131395 NULL           2025-07-03               -1 NULL
     30 195772 Jorge Solis 3136747 NULL           2025-07-03               -1 NULL
     31 195772 Jorge Solis 3153317 NULL           2025-07-03               -1 NULL
     32 195772 Jorge Solis 3158138 NULL           2025-07-03               -1 NULL
     33 195772 Jorge Solis 3172325 NULL           2025-07-03               -1 NULL
     34 195772 Jorge Solis 3173346 NULL           2025-07-03               -1 NULL
     35 195772 Jorge Solis 3177091 NULL           2025-07-23               -1 NULL
     36 195772 Jorge Solis 3180524 NULL           2025-07-03               -1 NULL
     37 195772 Jorge Solis 3217647 NULL           2025-07-03               -1 NULL
     38 195772 Jorge Solis 3230690 NULL           2025-07-03               -1 NULL
     39 195772 Jorge Solis 3236563 NULL           2025-07-03               -1 NULL
     40 195772 Jorge Solis 3243732 NULL           2025-07-03               -1 NULL
     41 195772 Jorge Solis 3255641 NULL           2025-07-07               -1 NULL
     42 195772 Jorge Solis 3267304 NULL           2025-07-07               -1 NULL
     43 195772 Jorge Solis 3275533 NULL           2025-07-07               -1 NULL
     44 195772 Jorge Solis 3281870 NULL           2025-07-07               -1 NULL
     45 195772 Jorge Solis 3283133 NULL           2025-07-07               -1 NULL
     46 195772 Jorge Solis 3291450 NULL           2025-07-07               -1 NULL
     47 195772 Jorge Solis 3299700 NULL           2025-07-07               -1 NULL
     48 195772 Jorge Solis 3302709 NULL           2025-07-07               -1 NULL
     49 195772 Jorge Solis 3305268 NULL           2025-07-07               -1 NULL
     50 195772 Jorge Solis 3312477 NULL           2025-07-07               -1 NULL
     51 195772 Jorge Solis 3316146 NULL           2025-07-07               -1 NULL
     52 195772 Jorge Solis 3322082 NULL           2025-07-07               -1 NULL
     53 195772 Jorge Solis 3323876 NULL           2025-07-07               -1 NULL
     54 195772 Jorge Solis 3332052 NULL           2025-07-07               -1 NULL
     55 195772 Jorge Solis 3332369 NULL           2025-07-07               -1 NULL
     56 195772 Jorge Solis 3334523 NULL           2025-07-07               -1 NULL
     57 195772 Jorge Solis 3344038 NULL           2025-07-07               -1 NULL
     58 195772 Jorge Solis 3346893 NULL           2025-07-07               -1 NULL
     59 195772 Jorge Solis 3350639 NULL           2025-07-07               -1 NULL
     60 195772 Jorge Solis 3353605 NULL           2025-07-07               -1 NULL
     61 195772 Jorge Solis 3354251 NULL           2025-07-07               -1 NULL
     62 195772 Jorge Solis 3354499 NULL           2025-07-07               -1 NULL
     63 195772 Jorge Solis 1180612 NULL           2025-07-08               -1 NULL
     64 195772 Jorge Solis 3336783 NULL           2025-07-08               -1 NULL
     65 195772 Jorge Solis 3347035 NULL           2025-07-08               -1 NULL
     66 195772 Jorge Solis 3241746 NULL           2025-07-11               -1 NULL
     67 195772 Jorge Solis 3260346 NULL           2025-07-23               -1 NULL
     68 195772 Jorge Solis 3328223 NULL           2025-07-11               -1 NULL
     69 195772 Jorge Solis 1352803 NULL           2025-07-15               -1 NULL
     70 195772 Jorge Solis 1176072 NULL           2025-07-17               -1 NULL
     71 195772 Jorge Solis 1206795 NULL           2025-07-17               -1 NULL
     72 195772 Jorge Solis 3265034 NULL           2025-07-17               -1 NULL
     73 195772 Jorge Solis 3344478 NULL           2025-07-17               -1 NULL
     74 195772 Jorge Solis 3349913 NULL           2025-07-17               -1 NULL
     75 195772 Jorge Solis 3198280 NULL           2025-07-21               -1 NULL
     76 195772 Jorge Solis 1388736 NULL           2025-07-23               -1 NULL
     77 195772 Jorge Solis 1317890 NULL           2025-07-24               -1 NULL
	*/
 
 
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Update tblTaxAndInsData
-----------------------------------------------------------------------------------------------------------------------------------------------------
MERGE INTO celink.TBLFORECLOSURE TT
USING
(
	select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where NewTiAanalysis <> date ('2999-01-01')	
	and   ChangeNeeded = -1
	order by SeqNum
) 
UY (SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded)
ON Loan = TT.FORLOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
TT.STATENOIREGISTEREDDT = case when UY.NewTiAanalysis = date ('1900-01-01') then NULL else UY.NewTiAanalysis end
;
 
 /*
 -- 77
 SEQNUM HDTNUM REQUESTER   LOAN    NEWTIAANALYSIS CHANGENEEDED
 ------ ------ ----------- ------- -------------- ------------
      1 195772 Jorge Solis 1019695 2025-07-03               -1
      2 195772 Jorge Solis 1115929 2025-07-03               -1
      3 195772 Jorge Solis 1129316 2025-07-03               -1
      4 195772 Jorge Solis 1168975 2025-07-03               -1
      5 195772 Jorge Solis 1170368 2025-07-03               -1
      6 195772 Jorge Solis 1171232 2025-07-03               -1
      7 195772 Jorge Solis 1197030 2025-07-03               -1
      8 195772 Jorge Solis 1220106 2025-07-03               -1
      9 195772 Jorge Solis 1260710 2025-07-03               -1
     10 195772 Jorge Solis 1276054 2025-07-03               -1
     11 195772 Jorge Solis 1280109 2025-07-03               -1
     12 195772 Jorge Solis 1289564 2025-07-03               -1
     13 195772 Jorge Solis 1298723 2025-07-03               -1
     14 195772 Jorge Solis 1299181 2025-07-03               -1
     15 195772 Jorge Solis 1306636 2025-07-03               -1
     16 195772 Jorge Solis 1312455 2025-07-03               -1
     17 195772 Jorge Solis 1320297 2025-07-03               -1
     18 195772 Jorge Solis 1335150 2025-07-03               -1
     19 195772 Jorge Solis 1355198 2025-07-03               -1
     20 195772 Jorge Solis 1375335 2025-07-03               -1
     21 195772 Jorge Solis 1376409 2025-07-03               -1
     22 195772 Jorge Solis 1385235 2025-07-03               -1
     23 195772 Jorge Solis 1396947 2025-07-03               -1
     24 195772 Jorge Solis 1401163 2025-07-03               -1
     25 195772 Jorge Solis 1404734 2025-07-03               -1
     26 195772 Jorge Solis 3115024 2025-07-03               -1
     27 195772 Jorge Solis 3117018 2025-07-03               -1
     28 195772 Jorge Solis 3124834 2025-07-03               -1
     29 195772 Jorge Solis 3131395 2025-07-03               -1
     30 195772 Jorge Solis 3136747 2025-07-03               -1
     31 195772 Jorge Solis 3153317 2025-07-03               -1
     32 195772 Jorge Solis 3158138 2025-07-03               -1
     33 195772 Jorge Solis 3172325 2025-07-03               -1
     34 195772 Jorge Solis 3173346 2025-07-03               -1
     35 195772 Jorge Solis 3177091 2025-07-23               -1
     36 195772 Jorge Solis 3180524 2025-07-03               -1
     37 195772 Jorge Solis 3217647 2025-07-03               -1
     38 195772 Jorge Solis 3230690 2025-07-03               -1
     39 195772 Jorge Solis 3236563 2025-07-03               -1
     40 195772 Jorge Solis 3243732 2025-07-03               -1
     41 195772 Jorge Solis 3255641 2025-07-07               -1
     42 195772 Jorge Solis 3267304 2025-07-07               -1
     43 195772 Jorge Solis 3275533 2025-07-07               -1
     44 195772 Jorge Solis 3281870 2025-07-07               -1
     45 195772 Jorge Solis 3283133 2025-07-07               -1
     46 195772 Jorge Solis 3291450 2025-07-07               -1
     47 195772 Jorge Solis 3299700 2025-07-07               -1
     48 195772 Jorge Solis 3302709 2025-07-07               -1
     49 195772 Jorge Solis 3305268 2025-07-07               -1
     50 195772 Jorge Solis 3312477 2025-07-07               -1
     51 195772 Jorge Solis 3316146 2025-07-07               -1
     52 195772 Jorge Solis 3322082 2025-07-07               -1
     53 195772 Jorge Solis 3323876 2025-07-07               -1
     54 195772 Jorge Solis 3332052 2025-07-07               -1
     55 195772 Jorge Solis 3332369 2025-07-07               -1
     56 195772 Jorge Solis 3334523 2025-07-07               -1
     57 195772 Jorge Solis 3344038 2025-07-07               -1
     58 195772 Jorge Solis 3346893 2025-07-07               -1
     59 195772 Jorge Solis 3350639 2025-07-07               -1
     60 195772 Jorge Solis 3353605 2025-07-07               -1
     61 195772 Jorge Solis 3354251 2025-07-07               -1
     62 195772 Jorge Solis 3354499 2025-07-07               -1
     63 195772 Jorge Solis 1180612 2025-07-08               -1
     64 195772 Jorge Solis 3336783 2025-07-08               -1
     65 195772 Jorge Solis 3347035 2025-07-08               -1
     66 195772 Jorge Solis 3241746 2025-07-11               -1
     67 195772 Jorge Solis 3260346 2025-07-23               -1
     68 195772 Jorge Solis 3328223 2025-07-11               -1
     69 195772 Jorge Solis 1352803 2025-07-15               -1
     70 195772 Jorge Solis 1176072 2025-07-17               -1
     71 195772 Jorge Solis 1206795 2025-07-17               -1
     72 195772 Jorge Solis 3265034 2025-07-17               -1
     73 195772 Jorge Solis 3344478 2025-07-17               -1
     74 195772 Jorge Solis 3349913 2025-07-17               -1
     75 195772 Jorge Solis 3198280 2025-07-21               -1
     76 195772 Jorge Solis 1388736 2025-07-23               -1
     77 195772 Jorge Solis 1317890 2025-07-24               -1

 
 */


----------------------------------------------------------------------------------------------------------------------------------------------
--------------
-- Validation 

		SELECT
			P.SeqNum, P.HDTNum, P.Requester, P.Loan, 
			P.NewTiAanalysis,
		
			P.CurTiAanalysis,
			TT.STATENOISENTDT,
			STATENOIREGISTEREDDT
		
		,   P.ChangeNeeded

			from DATAUPDT.HDTDataUpdt_TnIdata_SA P  
			
			inner join celink.TBLFORECLOSURE TT
			ON P.Loan = TT.FORLOANNUMBER
			

			ORDER BY P.SeqNum 
		with ur;
/*
 SEQNUM HDTNUM REQUESTER   LOAN    NEWTIAANALYSIS CURTIAANALYSIS STATENOISENTDT STATENOIREGISTEREDDT CHANGENEEDED
 ------ ------ ----------- ------- -------------- -------------- -------------- -------------------- ------------
      1 195772 Jorge Solis 1019695 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      2 195772 Jorge Solis 1115929 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      3 195772 Jorge Solis 1129316 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      4 195772 Jorge Solis 1168975 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      5 195772 Jorge Solis 1170368 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      6 195772 Jorge Solis 1171232 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      7 195772 Jorge Solis 1197030 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      8 195772 Jorge Solis 1220106 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
      9 195772 Jorge Solis 1260710 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     10 195772 Jorge Solis 1276054 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     11 195772 Jorge Solis 1280109 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     12 195772 Jorge Solis 1289564 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     13 195772 Jorge Solis 1298723 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     14 195772 Jorge Solis 1299181 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     15 195772 Jorge Solis 1306636 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     16 195772 Jorge Solis 1312455 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     17 195772 Jorge Solis 1320297 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     18 195772 Jorge Solis 1335150 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     19 195772 Jorge Solis 1355198 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     20 195772 Jorge Solis 1375335 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     21 195772 Jorge Solis 1376409 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     22 195772 Jorge Solis 1385235 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     23 195772 Jorge Solis 1396947 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     24 195772 Jorge Solis 1401163 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     25 195772 Jorge Solis 1404734 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     26 195772 Jorge Solis 3115024 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     27 195772 Jorge Solis 3117018 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     28 195772 Jorge Solis 3124834 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     29 195772 Jorge Solis 3131395 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     30 195772 Jorge Solis 3136747 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     31 195772 Jorge Solis 3153317 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     32 195772 Jorge Solis 3158138 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     33 195772 Jorge Solis 3172325 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     34 195772 Jorge Solis 3173346 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     35 195772 Jorge Solis 3177091 2025-07-23     NULL           2025-07-02     2025-07-23                     -1
     36 195772 Jorge Solis 3180524 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     37 195772 Jorge Solis 3217647 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     38 195772 Jorge Solis 3230690 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     39 195772 Jorge Solis 3236563 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     40 195772 Jorge Solis 3243732 2025-07-03     NULL           2025-07-02     2025-07-03                     -1
     41 195772 Jorge Solis 3255641 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     42 195772 Jorge Solis 3267304 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     43 195772 Jorge Solis 3275533 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     44 195772 Jorge Solis 3281870 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     45 195772 Jorge Solis 3283133 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     46 195772 Jorge Solis 3291450 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     47 195772 Jorge Solis 3299700 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     48 195772 Jorge Solis 3302709 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     49 195772 Jorge Solis 3305268 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     50 195772 Jorge Solis 3312477 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     51 195772 Jorge Solis 3316146 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     52 195772 Jorge Solis 3322082 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     53 195772 Jorge Solis 3323876 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     54 195772 Jorge Solis 3332052 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     55 195772 Jorge Solis 3332369 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     56 195772 Jorge Solis 3334523 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     57 195772 Jorge Solis 3344038 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     58 195772 Jorge Solis 3346893 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     59 195772 Jorge Solis 3350639 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     60 195772 Jorge Solis 3353605 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     61 195772 Jorge Solis 3354251 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     62 195772 Jorge Solis 3354499 2025-07-07     NULL           2025-07-02     2025-07-07                     -1
     63 195772 Jorge Solis 1180612 2025-07-08     NULL           2025-07-07     2025-07-08                     -1
     64 195772 Jorge Solis 3336783 2025-07-08     NULL           2025-07-07     2025-07-08                     -1
     65 195772 Jorge Solis 3347035 2025-07-08     NULL           2025-07-07     2025-07-08                     -1
     66 195772 Jorge Solis 3241746 2025-07-11     NULL           2025-07-10     2025-07-11                     -1
     67 195772 Jorge Solis 3260346 2025-07-23     NULL           2025-07-10     2025-07-23                     -1
     68 195772 Jorge Solis 3328223 2025-07-11     NULL           2025-07-10     2025-07-11                     -1
     69 195772 Jorge Solis 1352803 2025-07-15     NULL           2025-07-14     2025-07-15                     -1
     70 195772 Jorge Solis 1176072 2025-07-17     NULL           2025-07-16     2025-07-17                     -1
     71 195772 Jorge Solis 1206795 2025-07-17     NULL           2025-07-16     2025-07-17                     -1
     72 195772 Jorge Solis 3265034 2025-07-17     NULL           2025-07-16     2025-07-17                     -1
     73 195772 Jorge Solis 3344478 2025-07-17     NULL           2025-07-16     2025-07-17                     -1
     74 195772 Jorge Solis 3349913 2025-07-17     NULL           2025-07-16     2025-07-17                     -1
     75 195772 Jorge Solis 3198280 2025-07-21     NULL           2025-07-18     2025-07-21                     -1
     76 195772 Jorge Solis 1388736 2025-07-23     NULL           2025-07-22     2025-07-23                     -1
     77 195772 Jorge Solis 1317890 2025-07-24     NULL           2025-07-23     2025-07-24                     -1



*/
		
-------------------------------------------------------------------------------------------------------------------------------------
---- Notes update
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY)
Select 
--	SeqNum ,
	Loan	
	,
--   'Per HDT ' || HDTNum || ' (' || Requester || ') T&I Data ' || 
   'Per HDT ' || HDTNum || ' FCL ' || 
	case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
	then  
		'NOI registered date changed from ' ||
		case NewTiAanalysis 
		when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
		else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
		end
	else '' 
	end || '.' 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where ChangeNeeded = -1

Order by SeqNum 
; 

-- LOAN    2                                                                          3                          4     5
-- ------- -------------------------------------------------------------------------- -------------------------- ----- -
-- 1019695 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
-- 1115929 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
-- 1129316 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
-- 1168975 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
-- 1170368 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
-- 1171232 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
-- 1197030 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
-- 1220106 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. 2025-07-30 11:52:13.584261 tkato 0
--
-- 1352803 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-15. 2025-07-30 11:52:13.584261 tkato 0
-- 1176072 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. 2025-07-30 11:52:13.584261 tkato 0
-- 1206795 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. 2025-07-30 11:52:13.584261 tkato 0
-- 3265034 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. 2025-07-30 11:52:13.584261 tkato 0
-- 3344478 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. 2025-07-30 11:52:13.584261 tkato 0
-- 3349913 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. 2025-07-30 11:52:13.584261 tkato 0
-- 3198280 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-21. 2025-07-30 11:52:13.584261 tkato 0
-- 1388736 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-23. 2025-07-30 11:52:13.584261 tkato 0
-- 1317890 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-24. 2025-07-30 11:52:13.584261 tkato 0
 
 
------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'
order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;
 
/*
 SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                               CHRUSERID BLNPRIORITY
 ------ -------------------------- ------------ ------------------------ -------------------------------------------------------------------------- --------- -----------
      1 2025-07-30 11:53:14.093596    210349163                1019695.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      2 2025-07-30 11:53:14.093596    210349164                1115929.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      3 2025-07-30 11:53:14.093596    210349165                1129316.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      4 2025-07-30 11:53:14.093596    210349166                1168975.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      5 2025-07-30 11:53:14.093596    210349167                1170368.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      6 2025-07-30 11:53:14.093596    210349168                1171232.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      7 2025-07-30 11:53:14.093596    210349169                1197030.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      8 2025-07-30 11:53:14.093596    210349170                1220106.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
      9 2025-07-30 11:53:14.093596    210349171                1260710.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     10 2025-07-30 11:53:14.093596    210349172                1276054.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     11 2025-07-30 11:53:14.093596    210349173                1280109.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     12 2025-07-30 11:53:14.093596    210349174                1289564.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     13 2025-07-30 11:53:14.093596    210349175                1298723.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     14 2025-07-30 11:53:14.093596    210349176                1299181.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     15 2025-07-30 11:53:14.093596    210349177                1306636.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     16 2025-07-30 11:53:14.093596    210349178                1312455.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     17 2025-07-30 11:53:14.093596    210349179                1320297.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     18 2025-07-30 11:53:14.093596    210349180                1335150.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     19 2025-07-30 11:53:14.093596    210349181                1355198.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     20 2025-07-30 11:53:14.093596    210349182                1375335.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     21 2025-07-30 11:53:14.093596    210349183                1376409.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     22 2025-07-30 11:53:14.093596    210349184                1385235.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     23 2025-07-30 11:53:14.093596    210349185                1396947.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     24 2025-07-30 11:53:14.093596    210349186                1401163.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     25 2025-07-30 11:53:14.093596    210349187                1404734.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     26 2025-07-30 11:53:14.093596    210349188                3115024.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     27 2025-07-30 11:53:14.093596    210349189                3117018.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     28 2025-07-30 11:53:14.093596    210349190                3124834.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     29 2025-07-30 11:53:14.093596    210349191                3131395.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     30 2025-07-30 11:53:14.093596    210349192                3136747.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     31 2025-07-30 11:53:14.093596    210349193                3153317.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     32 2025-07-30 11:53:14.093596    210349194                3158138.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     33 2025-07-30 11:53:14.093596    210349195                3172325.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     34 2025-07-30 11:53:14.093596    210349196                3173346.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     35 2025-07-30 11:53:14.093596    210349197                3177091.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-23. tkato               0
     36 2025-07-30 11:53:14.093596    210349198                3180524.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     37 2025-07-30 11:53:14.093596    210349199                3217647.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     38 2025-07-30 11:53:14.093596    210349200                3230690.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     39 2025-07-30 11:53:14.093596    210349201                3236563.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     40 2025-07-30 11:53:14.093596    210349202                3243732.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-03. tkato               0
     41 2025-07-30 11:53:14.093596    210349203                3255641.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     42 2025-07-30 11:53:14.093596    210349204                3267304.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     43 2025-07-30 11:53:14.093596    210349205                3275533.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     44 2025-07-30 11:53:14.093596    210349206                3281870.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     45 2025-07-30 11:53:14.093596    210349207                3283133.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     46 2025-07-30 11:53:14.093596    210349208                3291450.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     47 2025-07-30 11:53:14.093596    210349209                3299700.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     48 2025-07-30 11:53:14.093596    210349210                3302709.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     49 2025-07-30 11:53:14.093596    210349211                3305268.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     50 2025-07-30 11:53:14.093596    210349212                3312477.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     51 2025-07-30 11:53:14.093596    210349213                3316146.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     52 2025-07-30 11:53:14.093596    210349214                3322082.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     53 2025-07-30 11:53:14.093596    210349215                3323876.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     54 2025-07-30 11:53:14.093596    210349216                3332052.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     55 2025-07-30 11:53:14.093596    210349217                3332369.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     56 2025-07-30 11:53:14.093596    210349218                3334523.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     57 2025-07-30 11:53:14.093596    210349219                3344038.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     58 2025-07-30 11:53:14.093596    210349220                3346893.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     59 2025-07-30 11:53:14.093596    210349221                3350639.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     60 2025-07-30 11:53:14.093596    210349222                3353605.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     61 2025-07-30 11:53:14.093596    210349223                3354251.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     62 2025-07-30 11:53:14.093596    210349224                3354499.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-07. tkato               0
     63 2025-07-30 11:53:14.093596    210349225                1180612.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-08. tkato               0
     64 2025-07-30 11:53:14.093596    210349226                3336783.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-08. tkato               0
     65 2025-07-30 11:53:14.093596    210349227                3347035.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-08. tkato               0
     66 2025-07-30 11:53:14.093596    210349228                3241746.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-11. tkato               0
     67 2025-07-30 11:53:14.093596    210349229                3260346.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-23. tkato               0
     68 2025-07-30 11:53:14.093596    210349230                3328223.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-11. tkato               0
     69 2025-07-30 11:53:14.093596    210349231                1352803.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-15. tkato               0
     70 2025-07-30 11:53:14.093596    210349232                1176072.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. tkato               0
     71 2025-07-30 11:53:14.093596    210349233                1206795.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. tkato               0
     72 2025-07-30 11:53:14.093596    210349234                3265034.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. tkato               0
     73 2025-07-30 11:53:14.093596    210349235                3344478.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. tkato               0
     74 2025-07-30 11:53:14.093596    210349236                3349913.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-17. tkato               0
     75 2025-07-30 11:53:14.093596    210349237                3198280.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-21. tkato               0
     76 2025-07-30 11:53:14.093596    210349238                1388736.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-23. tkato               0
     77 2025-07-30 11:53:14.093596    210349239                1317890.0 Per HDT 195772 FCL NOI registered date changed from <Blank> to 2025-07-24. tkato               0


*/ 
 
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Insert for ones not exist in FCL table ... these were actually inserted with 129348 
-----------------------------------------------------------------------------------------------------------------------------------------------------

/* 
 -- left join to see ones not exist
	left outer join celink.TBLFORECLOSURE TT
	ON P.Loan = TT.FORLOANNUMBER
	where TT.FORLOANNUMBER is null
-- left join to see ones not exist
 SEQNUM HDTNUM REQUESTER   LOAN    NEWDATE    CURNOIREG CHANGENEEDED FORLOANNUMBER
 ------ ------ ----------- ------- ---------- --------- ------------ -------------
     41 129785 DeAnna Todd 1257941 2023-06-01 NULL                -1          NULL
     44 129785 DeAnna Todd 1260444 2023-06-01 NULL                -1          NULL
     69 129785 DeAnna Todd 1363240 2023-06-01 NULL                -1          NULL
    110 129785 DeAnna Todd 3113986 2023-06-01 NULL                -1          NULL
    151 129785 DeAnna Todd 3225296 2023-06-01 NULL                -1          NULL
*/ 


------------------------------------------------------------------------------------------------------------------------------------
-- insert ... 5 rows  
insert into celink.TBLFORECLOSURE
	(FORLOANNUMBER, STATENOISENTDT, STATENOIREGISTEREDDT)

with P (loan, newdate) as 
(Values

(1257941, '2023-06-01'),
(1260444, '2023-06-01'),
(1363240, '2023-06-01'),
(3113986, '2023-06-01'),
(3225296, '2023-06-01')

)
select 	P.loan, P.newdate, P.newdate
from P
;


--------------------------------------------------------------------------------------------------------------
-- NOI field 
with P (Loan, NewNOI) as
(VALUES
(1257941, '2023-06-01'),
(1260444, '2023-06-01'),
(1363240, '2023-06-01'),
(3113986, '2023-06-01'),
(3225296, '2023-06-01')

)

select 
P.*,
TT.STATENOISENTDT, TT.STATENOIREGISTEREDDT, TT.* 
from P 
inner join celink.TBLFORECLOSURE TT
on P.Loan = TT.FORLOANNUMBER
with ur;


		
-------------------------------------------------------------------------------------------------------------------------------------
---- Notes update
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY)

with P (Loan, NewNOI) as
(VALUES
(1257941, '2023-06-01'),
(1260444, '2023-06-01'),
(1363240, '2023-06-01'),
(3113986, '2023-06-01'),
(3225296, '2023-06-01')
)

select 
	Loan	
	,
   'Per HDT 129785 FCL NOI registered date changed from <blank> to 2023-06-01.'  
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0
from P  
; 
 
-- LOAN    2                                                                          3                          4     5
-- ------- -------------------------------------------------------------------------- -------------------------- ----- -
-- 1257941 Per HDT 129785 FCL NOI registered date changed from <blank> to 2023-06-01. 2023-06-07 13:37:31.365231 tkato 0
-- 1260444 Per HDT 129785 FCL NOI registered date changed from <blank> to 2023-06-01. 2023-06-07 13:37:31.365231 tkato 0
-- 1363240 Per HDT 129785 FCL NOI registered date changed from <blank> to 2023-06-01. 2023-06-07 13:37:31.365231 tkato 0
-- 3113986 Per HDT 129785 FCL NOI registered date changed from <blank> to 2023-06-01. 2023-06-07 13:37:31.365231 tkato 0
-- 3225296 Per HDT 129785 FCL NOI registered date changed from <blank> to 2023-06-01. 2023-06-07 13:37:31.365231 tkato 0
 
