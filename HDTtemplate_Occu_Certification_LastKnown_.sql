
/*
20250714
194571	Ted Kato	Occupancy Certification data	Jennifer Whisenhunt	Low	7/14/2025 14:16

Per discussion with Cyndie and Vicky, please update the highlighted fields on the loan list attached with the occ received date given in the file. 

Occupancy Certificate Received (chek mark)	TBLBORROWER.BTNOCCUPCERTRECEIVED
Occupancy Certificate Received Date			TBLBORROWER.DTMOCCUPCERTDATERECEIVED
Date of Last Known Occupancy 				TBLOCCUPANCY.OCCLASTKNOWNOCCDATE

294 loan updated in tblborrower and tbloccupancy.   Peer review pending.
*/

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------

/*
20250904

198711	Ted Kato	Occupancy Dates	Jennifer Whisenhunt		Low	9/4/2025 13:53
Please update the 
Occupancy Certificate Received Date and 
Date of Last Known Occupancy 
with the date listed on report for each loan.  

Please also ensure the 
Occupancy Certificate Received box is checked. 

1. Occupancy Certificate Received Date and 
2. Date of Last Known Occupancy 
3. Occupancy Certificate Received box is checked. 

1152 loans updated in tblborrower, tbloccupancy.   Peer review pending. 
*Desired Last Known Date for below 4 loans are already in place.
  
		-- SEQNUM HDTNUM REQUESTER           LOAN    NewDate    CurLasKnown CHANGENEEDED
		-- ------ ------ ------------------- ------- ---------- ----------- ------------
		--      1 198711 Jennifer Whisenhunt 3321982 2024-12-05 2024-11-15            -1
		--      2 198711 Jennifer Whisenhunt 3292290 2024-11-14 2022-09-29            -1
		--      3 198711 Jennifer Whisenhunt 3292118 2024-11-01 2022-09-27            -1
		--      4 198711 Jennifer Whisenhunt 3291100 2024-11-12 2022-09-19            -1
		--      5 198711 Jennifer Whisenhunt 3230134 2024-11-07 2021-09-28            -1


-- -- -- 
Jennifer Whisenhunt
9/8/2025 3:50 PM

Ted, some of the loans on the report had the wrong date, can you have the dates updated to the date on this report please?

1106 loans updated.  Please raise a new ticket if you want to update the loans that were included in the first 1152 but not in 1107 loans.   
1106 loans updated in tblborrower, tbloccupancy.  Peer review pending. 

*/

----------------------------------------------------------------------------------------------------------------------------------------------
-- single check Occu Last Known Date
SELECT 
	OCCLOANNUMBER,  OCCLASTKNOWNOCCDATE,
	*
FROM CELINK.TBLOCCUPANCY
where OCCLOANNUMBER in (3318433)
for read only with ur;
-- OCCLOANNUMBER OCCLASTKNOWNOCCDATE OCCLOANNUMBER OCC1STOCCLETTERSENTDATE OCC2NDOCCLETTERSENTDATE OCC1STFOLLOWUPPHONECALLDATE OCCSKIPTRACECOMPLETEDATE OCC2NDFOLLOWUPPHONECALLDATE OCCPROPINSPORDEREDDATE OCCINSPFOLLOWUPDATE OCCRESOLVEDDATE OCCREASONFORRESOLVE OCCLASTKNOWNOCCDATE OCC12MONTHFOLLOWUPDATE OCCTEXASOCCLOAN OCCNOTES OCCVERBALOCCCOMPLETEDDATE
-- ------------- ------------------- ------------- ----------------------- ----------------------- --------------------------- ------------------------ --------------------------- ---------------------- ------------------- --------------- ------------------- ------------------- ---------------------- --------------- -------- -------------------------
--     3318433.0 NULL                    3318433.0 2024-08-12              2024-09-11              NULL                        NULL                     NULL                        2024-10-11             2024-10-21          NULL                              0 NULL                NULL                                 0          NULL

----------------------------------------------------------------------------------------------------------------------------------------------
-- single check tblBorrower 
select 
	INTSUBSERVICERLOANNUMBER,
	BTNOCCUPCERTRECEIVED,
	DTMOCCUPCERTDATERECEIVED
	, *
from CELINK.TBLBORROWER
where INTSUBSERVICERLOANNUMBER in (3318433) 
--where BTNOCCUPCERTRECEIVED = -1
order by DTMOCCUPCERTDATERECEIVED desc
with ur;

-- INTSUBSERVICERLOANNUMBER BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED IDSBORROWERID INTSUBSERVICERLOANNUMBER CHRSSN    INTPIN CHRFIRSTNAME CHRMIDDLENAME CHRLASTNAME CHRMAILADDRESS       CHRMAILCITY      CHRMAILSTATE CHRMAILZIPCODE CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS       CURINCOME   DTMBIRTHDATE          INTAGE CHRGENDER CHRMARITALSTATUS CHRRACE CHRETHNICITY DTMDEATHDATE BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED INTOCCUPCERTDATEFIRSTLETTER INTOCCUPCERTDATESECONDLETTER INTOCCUPCERTDATETHIRDLETTER BTNSTATEMENTSTOP CHRFAX     NONBORROWINGSPOUSE DTCOMPLAINTDATE DTLITIGATIONDATE DTCEASEANDDESIST CONVENIENCECHECKINDICATOR PERSONID MAILADDRESSID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID CELLCONSENT MODEREC_CELLCONSENT LANGCODE
-- ------------------------ -------------------- ------------------------ ------------- ------------------------ --------- ------ ------------ ------------- ----------- -------------------- ---------------- ------------ -------------- ------------ ------------ -------------- --------------------- ----------- --------------------- ------ --------- ---------------- ------- ------------ ------------ -------------------- ------------------------ --------------------------- ---------------------------- --------------------------- ---------------- ---------- ------------------ --------------- ---------------- ---------------- ------------------------- -------- ------------- ----------- ----------- ------------- ------- ----------- ------------------- --------
--                3318433.0                    0 NULL                            795266                3318433.0 553376398   NULL TAMI         L.            ALLEN       3311 Holly Grove St. WESTLAKE VILLAGE CA           91362          2408413405                               tamila1020b@gmail.com 1161.000000 1959-10-20 12:00:00.0     64 F         S                0       2            NULL                            0 NULL                                               8                            9                          10                0            N                  NULL            NULL             NULL                                     0   627842        627842      627842     2627842       4627842  627842        NULL NULL                en-us

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
---- Generic Table 
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
	(SeqNum, HDTNum, Requester, Loan, NewDate) as 
	(Values

--Raw Data <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(1, 198711, 'Jennifer Whisenhunt', 3321982, date('11/19/2024')),
(2, 198711, 'Jennifer Whisenhunt', 3292118, date('11/07/2024')),
(3, 198711, 'Jennifer Whisenhunt', 3291100, date('11/07/2024')),
(4, 198711, 'Jennifer Whisenhunt', 3230134, date('11/21/2024')),
(5, 198711, 'Jennifer Whisenhunt', 3228818, date('11/14/2024')),
(6, 198711, 'Jennifer Whisenhunt', 1319944, date('11/07/2024')),
(7, 198711, 'Jennifer Whisenhunt', 1269211, date('11/07/2024')),
(8, 198711, 'Jennifer Whisenhunt', 3321251, date('11/21/2024')),
(9, 198711, 'Jennifer Whisenhunt', 3292844, date('11/13/2024')),
(10, 198711, 'Jennifer Whisenhunt', 3234044, date('12/27/2024')),
(11, 198711, 'Jennifer Whisenhunt', 3228253, date('05/31/2025')),
(12, 198711, 'Jennifer Whisenhunt', 3227990, date('11/01/2024')),
(13, 198711, 'Jennifer Whisenhunt', 3174176, date('01/04/2025')),
(14, 198711, 'Jennifer Whisenhunt', 1385795, date('11/02/2024')),
(15, 198711, 'Jennifer Whisenhunt', 3290861, date('11/13/2024')),
(16, 198711, 'Jennifer Whisenhunt', 3290738, date('11/05/2024')),
(17, 198711, 'Jennifer Whisenhunt', 1265689, date('01/22/2025')),
(18, 198711, 'Jennifer Whisenhunt', 3227329, date('01/31/2025')),
(19, 198711, 'Jennifer Whisenhunt', 3174949, date('07/29/2025')),
(20, 198711, 'Jennifer Whisenhunt', 3173615, date('11/08/2024')),
(21, 198711, 'Jennifer Whisenhunt', 3110283, date('11/14/2024')),
(22, 198711, 'Jennifer Whisenhunt', 1319396, date('12/28/2024')),
(23, 198711, 'Jennifer Whisenhunt', 1232061, date('04/24/2025')),
(24, 198711, 'Jennifer Whisenhunt', 3322068, date('01/08/2025')),
(25, 198711, 'Jennifer Whisenhunt', 3291447, date('12/25/2024')),
(26, 198711, 'Jennifer Whisenhunt', 3290654, date('11/20/2024')),
(27, 198711, 'Jennifer Whisenhunt', 3290447, date('11/07/2024')),
(28, 198711, 'Jennifer Whisenhunt', 3230516, date('11/01/2024')),
(29, 198711, 'Jennifer Whisenhunt', 3227923, date('11/20/2024')),
(30, 198711, 'Jennifer Whisenhunt', 1380511, date('11/28/2024')),
(31, 198711, 'Jennifer Whisenhunt', 1319672, date('12/31/2024')),
(32, 198711, 'Jennifer Whisenhunt', 1230097, date('02/01/2025')),
(33, 198711, 'Jennifer Whisenhunt', 1096391, date('11/12/2024')),
(34, 198711, 'Jennifer Whisenhunt', 3320551, date('11/07/2024')),
(35, 198711, 'Jennifer Whisenhunt', 3320229, date('11/08/2024')),
(36, 198711, 'Jennifer Whisenhunt', 3319998, date('12/24/2024')),
(37, 198711, 'Jennifer Whisenhunt', 3231859, date('01/03/2025')),
(38, 198711, 'Jennifer Whisenhunt', 3228600, date('11/19/2024')),
(39, 198711, 'Jennifer Whisenhunt', 1385644, date('11/01/2024')),
(40, 198711, 'Jennifer Whisenhunt', 3174730, date('03/13/2025')),
(41, 198711, 'Jennifer Whisenhunt', 3172215, date('12/31/2024')),
(42, 198711, 'Jennifer Whisenhunt', 3129649, date('11/28/2024')),
(43, 198711, 'Jennifer Whisenhunt', 3293848, date('08/19/2025')),
(44, 198711, 'Jennifer Whisenhunt', 3292851, date('11/07/2024')),
(45, 198711, 'Jennifer Whisenhunt', 3292234, date('02/07/2025')),
(46, 198711, 'Jennifer Whisenhunt', 3291771, date('12/14/2024')),
(47, 198711, 'Jennifer Whisenhunt', 3126340, date('12/04/2024')),
(48, 198711, 'Jennifer Whisenhunt', 3110174, date('11/07/2024')),
(49, 198711, 'Jennifer Whisenhunt', 1320854, date('12/05/2024')),
(50, 198711, 'Jennifer Whisenhunt', 1319761, date('01/25/2025')),
(51, 198711, 'Jennifer Whisenhunt', 3230556, date('11/12/2024')),
(52, 198711, 'Jennifer Whisenhunt', 3227031, date('11/23/2024')),
(53, 198711, 'Jennifer Whisenhunt', 1267138, date('01/09/2025')),
(54, 198711, 'Jennifer Whisenhunt', 1095056, date('06/17/2025')),
(55, 198711, 'Jennifer Whisenhunt', 1178580, date('05/21/2025')),
(56, 198711, 'Jennifer Whisenhunt', 3321545, date('11/14/2024')),
(57, 198711, 'Jennifer Whisenhunt', 3107115, date('01/29/2025')),
(58, 198711, 'Jennifer Whisenhunt', 3107686, date('11/07/2024')),
(59, 198711, 'Jennifer Whisenhunt', 3114488, date('11/16/2024')),
(60, 198711, 'Jennifer Whisenhunt', 3290770, date('11/28/2024')),
(61, 198711, 'Jennifer Whisenhunt', 3175847, date('01/09/2025')),
(62, 198711, 'Jennifer Whisenhunt', 3171767, date('12/20/2024')),
(63, 198711, 'Jennifer Whisenhunt', 1323063, date('11/20/2024')),
(64, 198711, 'Jennifer Whisenhunt', 1182007, date('12/04/2024')),
(65, 198711, 'Jennifer Whisenhunt', 3320193, date('11/13/2024')),
(66, 198711, 'Jennifer Whisenhunt', 3131390, date('11/07/2024')),
(67, 198711, 'Jennifer Whisenhunt', 3291617, date('11/14/2024')),
(68, 198711, 'Jennifer Whisenhunt', 3289232, date('06/03/2025')),
(69, 198711, 'Jennifer Whisenhunt', 3292826, date('11/01/2024')),
(70, 198711, 'Jennifer Whisenhunt', 3290796, date('11/07/2024')),
(71, 198711, 'Jennifer Whisenhunt', 3173182, date('11/19/2024')),
(72, 198711, 'Jennifer Whisenhunt', 3175177, date('04/25/2025')),
(73, 198711, 'Jennifer Whisenhunt', 3230658, date('01/23/2025')),
(74, 198711, 'Jennifer Whisenhunt', 3291431, date('11/28/2024')),
(75, 198711, 'Jennifer Whisenhunt', 3291265, date('01/06/2025')),
(76, 198711, 'Jennifer Whisenhunt', 3289514, date('11/20/2024')),
(77, 198711, 'Jennifer Whisenhunt', 3228143, date('11/01/2024')),
(78, 198711, 'Jennifer Whisenhunt', 3227849, date('08/27/2025')),
(79, 198711, 'Jennifer Whisenhunt', 3291726, date('01/07/2025')),
(80, 198711, 'Jennifer Whisenhunt', 3291121, date('11/01/2024')),
(81, 198711, 'Jennifer Whisenhunt', 3288884, date('11/16/2024')),
(82, 198711, 'Jennifer Whisenhunt', 3175088, date('12/11/2024')),
(83, 198711, 'Jennifer Whisenhunt', 3173088, date('08/22/2025')),
(84, 198711, 'Jennifer Whisenhunt', 3050280, date('11/19/2024')),
(85, 198711, 'Jennifer Whisenhunt', 1385620, date('04/30/2025')),
(86, 198711, 'Jennifer Whisenhunt', 1337175, date('12/06/2024')),
(87, 198711, 'Jennifer Whisenhunt', 3231206, date('11/14/2024')),
(88, 198711, 'Jennifer Whisenhunt', 3227493, date('12/14/2024')),
(89, 198711, 'Jennifer Whisenhunt', 3108113, date('07/17/2025')),
(90, 198711, 'Jennifer Whisenhunt', 3321262, date('11/15/2024')),
(91, 198711, 'Jennifer Whisenhunt', 3321043, date('08/21/2025')),
(92, 198711, 'Jennifer Whisenhunt', 3227994, date('11/19/2024')),
(93, 198711, 'Jennifer Whisenhunt', 3230511, date('11/08/2024')),
(94, 198711, 'Jennifer Whisenhunt', 3230938, date('11/20/2024')),
(95, 198711, 'Jennifer Whisenhunt', 3225429, date('08/06/2025')),
(96, 198711, 'Jennifer Whisenhunt', 1178909, date('12/24/2024')),
(97, 198711, 'Jennifer Whisenhunt', 1388028, date('12/27/2024')),
(98, 198711, 'Jennifer Whisenhunt', 1140750, date('01/23/2025')),
(99, 198711, 'Jennifer Whisenhunt', 3184629, date('11/13/2024')),
(100, 198711, 'Jennifer Whisenhunt', 3174768, date('11/01/2024')),
(101, 198711, 'Jennifer Whisenhunt', 3174359, date('11/01/2024')),
(102, 198711, 'Jennifer Whisenhunt', 3321833, date('11/14/2024')),
(103, 198711, 'Jennifer Whisenhunt', 3322149, date('12/07/2024')),
(104, 198711, 'Jennifer Whisenhunt', 3320702, date('11/28/2024')),
(105, 198711, 'Jennifer Whisenhunt', 3171864, date('02/08/2025')),
(106, 198711, 'Jennifer Whisenhunt', 3173249, date('11/07/2024')),
(107, 198711, 'Jennifer Whisenhunt', 3174952, date('01/15/2025')),
(108, 198711, 'Jennifer Whisenhunt', 3290632, date('11/28/2024')),
(109, 198711, 'Jennifer Whisenhunt', 3290552, date('11/09/2024')),
(110, 198711, 'Jennifer Whisenhunt', 3176162, date('11/14/2024')),
(111, 198711, 'Jennifer Whisenhunt', 3291559, date('12/04/2024')),
(112, 198711, 'Jennifer Whisenhunt', 3105534, date('11/14/2024')),
(113, 198711, 'Jennifer Whisenhunt', 3109202, date('11/09/2024')),
(114, 198711, 'Jennifer Whisenhunt', 1382616, date('11/13/2024')),
(115, 198711, 'Jennifer Whisenhunt', 1387836, date('12/31/2024')),
(116, 198711, 'Jennifer Whisenhunt', 1382693, date('02/04/2025')),
(117, 198711, 'Jennifer Whisenhunt', 3230061, date('11/14/2024')),
(118, 198711, 'Jennifer Whisenhunt', 3322208, date('11/13/2024')),
(119, 198711, 'Jennifer Whisenhunt', 1332407, date('12/04/2024')),
(120, 198711, 'Jennifer Whisenhunt', 3228243, date('11/01/2024')),
(121, 198711, 'Jennifer Whisenhunt', 3227148, date('11/07/2024')),
(122, 198711, 'Jennifer Whisenhunt', 3225241, date('11/21/2024')),
(123, 198711, 'Jennifer Whisenhunt', 1265221, date('11/01/2024')),
(124, 198711, 'Jennifer Whisenhunt', 3172458, date('01/04/2025')),
(125, 198711, 'Jennifer Whisenhunt', 3322978, date('04/29/2025')),
(126, 198711, 'Jennifer Whisenhunt', 3320671, date('11/16/2024')),
(127, 198711, 'Jennifer Whisenhunt', 3171164, date('11/13/2024')),
(128, 198711, 'Jennifer Whisenhunt', 1212283, date('11/28/2024')),
(129, 198711, 'Jennifer Whisenhunt', 3229201, date('11/01/2024')),
(130, 198711, 'Jennifer Whisenhunt', 3288977, date('12/11/2024')),
(131, 198711, 'Jennifer Whisenhunt', 3170889, date('11/14/2024')),
(132, 198711, 'Jennifer Whisenhunt', 3175357, date('11/07/2024')),
(133, 198711, 'Jennifer Whisenhunt', 3109362, date('11/20/2024')),
(134, 198711, 'Jennifer Whisenhunt', 3172907, date('11/19/2024')),
(135, 198711, 'Jennifer Whisenhunt', 3107022, date('11/21/2024')),
(136, 198711, 'Jennifer Whisenhunt', 1230458, date('12/28/2024')),
(137, 198711, 'Jennifer Whisenhunt', 1209817, date('02/07/2025')),
(138, 198711, 'Jennifer Whisenhunt', 1178404, date('12/04/2024')),
(139, 198711, 'Jennifer Whisenhunt', 3292648, date('12/14/2024')),
(140, 198711, 'Jennifer Whisenhunt', 3291902, date('11/14/2024')),
(141, 198711, 'Jennifer Whisenhunt', 3291272, date('11/09/2024')),
(142, 198711, 'Jennifer Whisenhunt', 1139819, date('11/15/2024')),
(143, 198711, 'Jennifer Whisenhunt', 3289141, date('11/02/2024')),
(144, 198711, 'Jennifer Whisenhunt', 3120682, date('04/25/2025')),
(145, 198711, 'Jennifer Whisenhunt', 3293229, date('11/14/2024')),
(146, 198711, 'Jennifer Whisenhunt', 3291280, date('08/05/2025')),
(147, 198711, 'Jennifer Whisenhunt', 3292058, date('02/14/2025')),
(148, 198711, 'Jennifer Whisenhunt', 1371558, date('12/18/2024')),
(149, 198711, 'Jennifer Whisenhunt', 1385968, date('01/07/2025')),
(150, 198711, 'Jennifer Whisenhunt', 3243216, date('01/08/2025')),
(151, 198711, 'Jennifer Whisenhunt', 3231449, date('11/19/2024')),
(152, 198711, 'Jennifer Whisenhunt', 3228577, date('11/21/2024')),
(153, 198711, 'Jennifer Whisenhunt', 1337269, date('11/14/2024')),
(154, 198711, 'Jennifer Whisenhunt', 3110269, date('04/29/2025')),
(155, 198711, 'Jennifer Whisenhunt', 1231397, date('11/01/2024')),
(156, 198711, 'Jennifer Whisenhunt', 1380488, date('11/20/2024')),
(157, 198711, 'Jennifer Whisenhunt', 1324004, date('11/28/2024')),
(158, 198711, 'Jennifer Whisenhunt', 1316944, date('11/09/2024')),
(159, 198711, 'Jennifer Whisenhunt', 1201349, date('11/09/2024')),
(160, 198711, 'Jennifer Whisenhunt', 1177790, date('06/20/2025')),
(161, 198711, 'Jennifer Whisenhunt', 3321558, date('12/03/2024')),
(162, 198711, 'Jennifer Whisenhunt', 3292943, date('11/28/2024')),
(163, 198711, 'Jennifer Whisenhunt', 3322105, date('11/08/2024')),
(164, 198711, 'Jennifer Whisenhunt', 3321462, date('11/14/2024')),
(165, 198711, 'Jennifer Whisenhunt', 3320372, date('11/14/2024')),
(166, 198711, 'Jennifer Whisenhunt', 3322668, date('12/03/2024')),
(167, 198711, 'Jennifer Whisenhunt', 3322235, date('12/17/2024')),
(168, 198711, 'Jennifer Whisenhunt', 3292067, date('11/07/2024')),
(169, 198711, 'Jennifer Whisenhunt', 3290513, date('05/06/2025')),
(170, 198711, 'Jennifer Whisenhunt', 3288649, date('12/04/2024')),
(171, 198711, 'Jennifer Whisenhunt', 3229471, date('08/23/2025')),
(172, 198711, 'Jennifer Whisenhunt', 3226132, date('11/19/2024')),
(173, 198711, 'Jennifer Whisenhunt', 3320297, date('05/22/2025')),
(174, 198711, 'Jennifer Whisenhunt', 3128465, date('11/14/2024')),
(175, 198711, 'Jennifer Whisenhunt', 3109464, date('12/27/2024')),
(176, 198711, 'Jennifer Whisenhunt', 1385726, date('11/28/2024')),
(177, 198711, 'Jennifer Whisenhunt', 1385192, date('11/22/2024')),
(178, 198711, 'Jennifer Whisenhunt', 1384468, date('11/19/2024')),
(179, 198711, 'Jennifer Whisenhunt', 1323293, date('12/18/2024')),
(180, 198711, 'Jennifer Whisenhunt', 3230214, date('11/01/2024')),
(181, 198711, 'Jennifer Whisenhunt', 3292030, date('12/25/2024')),
(182, 198711, 'Jennifer Whisenhunt', 3322793, date('11/02/2024')),
(183, 198711, 'Jennifer Whisenhunt', 3230333, date('11/01/2024')),
(184, 198711, 'Jennifer Whisenhunt', 3230123, date('01/17/2025')),
(185, 198711, 'Jennifer Whisenhunt', 3227528, date('08/14/2025')),
(186, 198711, 'Jennifer Whisenhunt', 3227461, date('11/19/2024')),
(187, 198711, 'Jennifer Whisenhunt', 3321564, date('11/28/2024')),
(188, 198711, 'Jennifer Whisenhunt', 1320780, date('11/07/2024')),
(189, 198711, 'Jennifer Whisenhunt', 3322228, date('01/28/2025')),
(190, 198711, 'Jennifer Whisenhunt', 3289709, date('01/29/2025')),
(191, 198711, 'Jennifer Whisenhunt', 3174939, date('11/28/2024')),
(192, 198711, 'Jennifer Whisenhunt', 3172886, date('12/04/2024')),
(193, 198711, 'Jennifer Whisenhunt', 3290805, date('12/05/2024')),
(194, 198711, 'Jennifer Whisenhunt', 3290589, date('11/12/2024')),
(195, 198711, 'Jennifer Whisenhunt', 3290251, date('11/04/2024')),
(196, 198711, 'Jennifer Whisenhunt', 3226876, date('01/28/2025')),
(197, 198711, 'Jennifer Whisenhunt', 3291062, date('11/14/2024')),
(198, 198711, 'Jennifer Whisenhunt', 3295319, date('01/23/2025')),
(199, 198711, 'Jennifer Whisenhunt', 3294934, date('03/21/2025')),
(200, 198711, 'Jennifer Whisenhunt', 3293178, date('12/12/2024')),
(201, 198711, 'Jennifer Whisenhunt', 3290925, date('01/22/2025')),
(202, 198711, 'Jennifer Whisenhunt', 3107882, date('11/07/2024')),
(203, 198711, 'Jennifer Whisenhunt', 3288848, date('11/05/2024')),
(204, 198711, 'Jennifer Whisenhunt', 3292375, date('06/10/2025')),
(205, 198711, 'Jennifer Whisenhunt', 3291185, date('11/08/2024')),
(206, 198711, 'Jennifer Whisenhunt', 3291238, date('11/07/2024')),
(207, 198711, 'Jennifer Whisenhunt', 3234314, date('11/23/2024')),
(208, 198711, 'Jennifer Whisenhunt', 3227595, date('03/27/2025')),
(209, 198711, 'Jennifer Whisenhunt', 1325500, date('04/16/2025')),
(210, 198711, 'Jennifer Whisenhunt', 3225613, date('11/23/2024')),
(211, 198711, 'Jennifer Whisenhunt', 3225193, date('11/14/2024')),
(212, 198711, 'Jennifer Whisenhunt', 1266416, date('11/05/2024')),
(213, 198711, 'Jennifer Whisenhunt', 3175675, date('11/07/2024')),
(214, 198711, 'Jennifer Whisenhunt', 3171015, date('11/07/2024')),
(215, 198711, 'Jennifer Whisenhunt', 3130176, date('01/24/2025')),
(216, 198711, 'Jennifer Whisenhunt', 3230143, date('11/13/2024')),
(217, 198711, 'Jennifer Whisenhunt', 3178250, date('02/27/2025')),
(218, 198711, 'Jennifer Whisenhunt', 1385156, date('11/01/2024')),
(219, 198711, 'Jennifer Whisenhunt', 3320629, date('11/01/2024')),
(220, 198711, 'Jennifer Whisenhunt', 3320374, date('11/09/2024')),
(221, 198711, 'Jennifer Whisenhunt', 3226658, date('08/26/2025')),
(222, 198711, 'Jennifer Whisenhunt', 3291689, date('11/14/2024')),
(223, 198711, 'Jennifer Whisenhunt', 3291309, date('11/01/2024')),
(224, 198711, 'Jennifer Whisenhunt', 3177157, date('03/14/2025')),
(225, 198711, 'Jennifer Whisenhunt', 3173802, date('11/01/2024')),
(226, 198711, 'Jennifer Whisenhunt', 1231531, date('11/07/2024')),
(227, 198711, 'Jennifer Whisenhunt', 1231268, date('01/24/2025')),
(228, 198711, 'Jennifer Whisenhunt', 3320784, date('02/19/2025')),
(229, 198711, 'Jennifer Whisenhunt', 3106637, date('11/20/2024')),
(230, 198711, 'Jennifer Whisenhunt', 3175849, date('11/13/2024')),
(231, 198711, 'Jennifer Whisenhunt', 3174800, date('02/08/2025')),
(232, 198711, 'Jennifer Whisenhunt', 3173676, date('12/03/2024')),
(233, 198711, 'Jennifer Whisenhunt', 3230140, date('04/12/2025')),
(234, 198711, 'Jennifer Whisenhunt', 3228242, date('11/05/2024')),
(235, 198711, 'Jennifer Whisenhunt', 3108322, date('11/13/2024')),
(236, 198711, 'Jennifer Whisenhunt', 1228269, date('12/27/2024')),
(237, 198711, 'Jennifer Whisenhunt', 1389487, date('11/14/2024')),
(238, 198711, 'Jennifer Whisenhunt', 1383719, date('11/01/2024')),
(239, 198711, 'Jennifer Whisenhunt', 3133908, date('11/07/2024')),
(240, 198711, 'Jennifer Whisenhunt', 3108754, date('12/20/2024')),
(241, 198711, 'Jennifer Whisenhunt', 3230728, date('11/01/2024')),
(242, 198711, 'Jennifer Whisenhunt', 3229958, date('11/08/2024')),
(243, 198711, 'Jennifer Whisenhunt', 1230650, date('08/19/2025')),
(244, 198711, 'Jennifer Whisenhunt', 3175413, date('01/14/2025')),
(245, 198711, 'Jennifer Whisenhunt', 3171763, date('11/07/2024')),
(246, 198711, 'Jennifer Whisenhunt', 3227648, date('03/20/2025')),
(247, 198711, 'Jennifer Whisenhunt', 3320199, date('11/02/2024')),
(248, 198711, 'Jennifer Whisenhunt', 3131369, date('11/21/2024')),
(249, 198711, 'Jennifer Whisenhunt', 3227660, date('12/18/2024')),
(250, 198711, 'Jennifer Whisenhunt', 3126231, date('11/07/2024')),
(251, 198711, 'Jennifer Whisenhunt', 3120419, date('12/07/2024')),
(252, 198711, 'Jennifer Whisenhunt', 1318369, date('11/19/2024')),
(253, 198711, 'Jennifer Whisenhunt', 3322197, date('06/11/2025')),
(254, 198711, 'Jennifer Whisenhunt', 3321556, date('11/16/2024')),
(255, 198711, 'Jennifer Whisenhunt', 1265289, date('11/01/2024')),
(256, 198711, 'Jennifer Whisenhunt', 1380397, date('06/26/2025')),
(257, 198711, 'Jennifer Whisenhunt', 1380243, date('11/02/2024')),
(258, 198711, 'Jennifer Whisenhunt', 3108179, date('11/09/2024')),
(259, 198711, 'Jennifer Whisenhunt', 3176665, date('11/15/2024')),
(260, 198711, 'Jennifer Whisenhunt', 3228016, date('11/07/2024')),
(261, 198711, 'Jennifer Whisenhunt', 1321563, date('11/14/2024')),
(262, 198711, 'Jennifer Whisenhunt', 3120925, date('11/14/2024')),
(263, 198711, 'Jennifer Whisenhunt', 3174379, date('12/12/2024')),
(264, 198711, 'Jennifer Whisenhunt', 3322101, date('11/06/2024')),
(265, 198711, 'Jennifer Whisenhunt', 3321632, date('11/13/2024')),
(266, 198711, 'Jennifer Whisenhunt', 1320315, date('07/19/2025')),
(267, 198711, 'Jennifer Whisenhunt', 3175831, date('11/09/2024')),
(268, 198711, 'Jennifer Whisenhunt', 1380325, date('11/14/2024')),
(269, 198711, 'Jennifer Whisenhunt', 3171936, date('03/18/2025')),
(270, 198711, 'Jennifer Whisenhunt', 1389453, date('12/21/2024')),
(271, 198711, 'Jennifer Whisenhunt', 1384810, date('11/09/2024')),
(272, 198711, 'Jennifer Whisenhunt', 1363406, date('11/07/2024')),
(273, 198711, 'Jennifer Whisenhunt', 3294338, date('11/07/2024')),
(274, 198711, 'Jennifer Whisenhunt', 1323576, date('11/13/2024')),
(275, 198711, 'Jennifer Whisenhunt', 1321112, date('12/06/2024')),
(276, 198711, 'Jennifer Whisenhunt', 1179481, date('11/28/2024')),
(277, 198711, 'Jennifer Whisenhunt', 1265703, date('11/01/2024')),
(278, 198711, 'Jennifer Whisenhunt', 1179666, date('11/20/2024')),
(279, 198711, 'Jennifer Whisenhunt', 3289113, date('01/07/2025')),
(280, 198711, 'Jennifer Whisenhunt', 1233428, date('12/12/2024')),
(281, 198711, 'Jennifer Whisenhunt', 1268662, date('12/25/2024')),
(282, 198711, 'Jennifer Whisenhunt', 3228486, date('12/18/2024')),
(283, 198711, 'Jennifer Whisenhunt', 3229248, date('01/07/2025')),
(284, 198711, 'Jennifer Whisenhunt', 3228823, date('11/16/2024')),
(285, 198711, 'Jennifer Whisenhunt', 3322242, date('04/23/2025')),
(286, 198711, 'Jennifer Whisenhunt', 1229325, date('01/02/2025')),
(287, 198711, 'Jennifer Whisenhunt', 1147614, date('11/19/2024')),
(288, 198711, 'Jennifer Whisenhunt', 3175999, date('12/20/2024')),
(289, 198711, 'Jennifer Whisenhunt', 3174134, date('11/09/2024')),
(290, 198711, 'Jennifer Whisenhunt', 3172206, date('01/15/2025')),
(291, 198711, 'Jennifer Whisenhunt', 3321850, date('11/07/2024')),
(292, 198711, 'Jennifer Whisenhunt', 3321028, date('03/05/2025')),
(293, 198711, 'Jennifer Whisenhunt', 3295320, date('11/14/2024')),
(294, 198711, 'Jennifer Whisenhunt', 3292972, date('01/08/2025')),
(295, 198711, 'Jennifer Whisenhunt', 3292314, date('12/21/2024')),
(296, 198711, 'Jennifer Whisenhunt', 3321260, date('11/28/2024')),
(297, 198711, 'Jennifer Whisenhunt', 3321205, date('11/01/2024')),
(298, 198711, 'Jennifer Whisenhunt', 3171349, date('11/08/2024')),
(299, 198711, 'Jennifer Whisenhunt', 3109020, date('04/29/2025')),
(300, 198711, 'Jennifer Whisenhunt', 3291429, date('11/01/2024')),
(301, 198711, 'Jennifer Whisenhunt', 3288812, date('01/22/2025')),
(302, 198711, 'Jennifer Whisenhunt', 3293026, date('11/20/2024')),
(303, 198711, 'Jennifer Whisenhunt', 3288678, date('11/07/2024')),
(304, 198711, 'Jennifer Whisenhunt', 3290019, date('11/12/2024')),
(305, 198711, 'Jennifer Whisenhunt', 3290339, date('12/20/2024')),
(306, 198711, 'Jennifer Whisenhunt', 3293055, date('01/09/2025')),
(307, 198711, 'Jennifer Whisenhunt', 3108073, date('12/05/2024')),
(308, 198711, 'Jennifer Whisenhunt', 1383935, date('01/09/2025')),
(309, 198711, 'Jennifer Whisenhunt', 3293425, date('11/08/2024')),
(310, 198711, 'Jennifer Whisenhunt', 3230681, date('11/15/2024')),
(311, 198711, 'Jennifer Whisenhunt', 3229312, date('11/12/2024')),
(312, 198711, 'Jennifer Whisenhunt', 3320031, date('07/02/2025')),
(313, 198711, 'Jennifer Whisenhunt', 3229062, date('12/18/2024')),
(314, 198711, 'Jennifer Whisenhunt', 1096290, date('11/14/2024')),
(315, 198711, 'Jennifer Whisenhunt', 3226981, date('03/04/2025')),
(316, 198711, 'Jennifer Whisenhunt', 3321194, date('11/07/2024')),
(317, 198711, 'Jennifer Whisenhunt', 3321030, date('11/08/2024')),
(318, 198711, 'Jennifer Whisenhunt', 1179886, date('11/07/2024')),
(319, 198711, 'Jennifer Whisenhunt', 3225236, date('11/14/2024')),
(320, 198711, 'Jennifer Whisenhunt', 1317669, date('05/14/2025')),
(321, 198711, 'Jennifer Whisenhunt', 3229600, date('11/09/2024')),
(322, 198711, 'Jennifer Whisenhunt', 3229333, date('01/03/2025')),
(323, 198711, 'Jennifer Whisenhunt', 1337022, date('12/24/2024')),
(324, 198711, 'Jennifer Whisenhunt', 1332392, date('01/25/2025')),
(325, 198711, 'Jennifer Whisenhunt', 3229202, date('07/11/2025')),
(326, 198711, 'Jennifer Whisenhunt', 3228803, date('12/17/2024')),
(327, 198711, 'Jennifer Whisenhunt', 3322230, date('12/18/2024')),
(328, 198711, 'Jennifer Whisenhunt', 3321641, date('11/07/2024')),
(329, 198711, 'Jennifer Whisenhunt', 3320732, date('01/31/2025')),
(330, 198711, 'Jennifer Whisenhunt', 3320608, date('11/21/2024')),
(331, 198711, 'Jennifer Whisenhunt', 3174799, date('11/07/2024')),
(332, 198711, 'Jennifer Whisenhunt', 3292148, date('11/13/2024')),
(333, 198711, 'Jennifer Whisenhunt', 3291544, date('11/14/2024')),
(334, 198711, 'Jennifer Whisenhunt', 3290477, date('04/03/2025')),
(335, 198711, 'Jennifer Whisenhunt', 3290308, date('12/12/2024')),
(336, 198711, 'Jennifer Whisenhunt', 3290177, date('11/28/2024')),
(337, 198711, 'Jennifer Whisenhunt', 1320370, date('11/07/2024')),
(338, 198711, 'Jennifer Whisenhunt', 1318063, date('07/17/2025')),
(339, 198711, 'Jennifer Whisenhunt', 1138180, date('11/02/2024')),
(340, 198711, 'Jennifer Whisenhunt', 3291867, date('11/07/2024')),
(341, 198711, 'Jennifer Whisenhunt', 3323637, date('11/07/2024')),
(342, 198711, 'Jennifer Whisenhunt', 3321898, date('01/14/2025')),
(343, 198711, 'Jennifer Whisenhunt', 3172218, date('11/19/2024')),
(344, 198711, 'Jennifer Whisenhunt', 3291910, date('11/07/2024')),
(345, 198711, 'Jennifer Whisenhunt', 3291644, date('05/02/2025')),
(346, 198711, 'Jennifer Whisenhunt', 3290913, date('11/14/2024')),
(347, 198711, 'Jennifer Whisenhunt', 3289075, date('11/19/2024')),
(348, 198711, 'Jennifer Whisenhunt', 3109062, date('01/01/2025')),
(349, 198711, 'Jennifer Whisenhunt', 3230411, date('11/09/2024')),
(350, 198711, 'Jennifer Whisenhunt', 1385421, date('03/11/2025')),
(351, 198711, 'Jennifer Whisenhunt', 3129643, date('11/01/2024')),
(352, 198711, 'Jennifer Whisenhunt', 3108189, date('03/07/2025')),
(353, 198711, 'Jennifer Whisenhunt', 3107203, date('11/01/2024')),
(354, 198711, 'Jennifer Whisenhunt', 1384984, date('02/15/2025')),
(355, 198711, 'Jennifer Whisenhunt', 1317962, date('11/07/2024')),
(356, 198711, 'Jennifer Whisenhunt', 1264804, date('11/01/2024')),
(357, 198711, 'Jennifer Whisenhunt', 1264119, date('01/18/2025')),
(358, 198711, 'Jennifer Whisenhunt', 1265925, date('12/03/2024')),
(359, 198711, 'Jennifer Whisenhunt', 3175216, date('11/23/2024')),
(360, 198711, 'Jennifer Whisenhunt', 3173673, date('11/09/2024')),
(361, 198711, 'Jennifer Whisenhunt', 3173618, date('11/07/2024')),
(362, 198711, 'Jennifer Whisenhunt', 3173997, date('11/16/2024')),
(363, 198711, 'Jennifer Whisenhunt', 3230942, date('01/04/2025')),
(364, 198711, 'Jennifer Whisenhunt', 3290939, date('11/23/2024')),
(365, 198711, 'Jennifer Whisenhunt', 1140998, date('11/13/2024')),
(366, 198711, 'Jennifer Whisenhunt', 3294328, date('11/14/2024')),
(367, 198711, 'Jennifer Whisenhunt', 1139061, date('11/07/2024')),
(368, 198711, 'Jennifer Whisenhunt', 3130352, date('11/01/2024')),
(369, 198711, 'Jennifer Whisenhunt', 3177491, date('11/01/2024')),
(370, 198711, 'Jennifer Whisenhunt', 3174628, date('01/22/2025')),
(371, 198711, 'Jennifer Whisenhunt', 3106837, date('11/28/2024')),
(372, 198711, 'Jennifer Whisenhunt', 3289060, date('11/02/2024')),
(373, 198711, 'Jennifer Whisenhunt', 3291919, date('12/07/2024')),
(374, 198711, 'Jennifer Whisenhunt', 3290955, date('11/12/2024')),
(375, 198711, 'Jennifer Whisenhunt', 3322380, date('11/01/2024')),
(376, 198711, 'Jennifer Whisenhunt', 3321317, date('11/20/2024')),
(377, 198711, 'Jennifer Whisenhunt', 3109388, date('12/28/2024')),
(378, 198711, 'Jennifer Whisenhunt', 3105549, date('11/07/2024')),
(379, 198711, 'Jennifer Whisenhunt', 3105551, date('11/20/2024')),
(380, 198711, 'Jennifer Whisenhunt', 3107120, date('11/01/2024')),
(381, 198711, 'Jennifer Whisenhunt', 1384767, date('11/13/2024')),
(382, 198711, 'Jennifer Whisenhunt', 3126548, date('11/01/2024')),
(383, 198711, 'Jennifer Whisenhunt', 3106878, date('11/19/2024')),
(384, 198711, 'Jennifer Whisenhunt', 3046663, date('11/01/2024')),
(385, 198711, 'Jennifer Whisenhunt', 3291545, date('12/06/2024')),
(386, 198711, 'Jennifer Whisenhunt', 3321619, date('12/05/2024')),
(387, 198711, 'Jennifer Whisenhunt', 3288425, date('11/07/2024')),
(388, 198711, 'Jennifer Whisenhunt', 3321774, date('07/22/2025')),
(389, 198711, 'Jennifer Whisenhunt', 3321138, date('12/20/2024')),
(390, 198711, 'Jennifer Whisenhunt', 3229690, date('11/14/2024')),
(391, 198711, 'Jennifer Whisenhunt', 3292728, date('03/11/2025')),
(392, 198711, 'Jennifer Whisenhunt', 3291232, date('11/28/2024')),
(393, 198711, 'Jennifer Whisenhunt', 1389488, date('02/13/2025')),
(394, 198711, 'Jennifer Whisenhunt', 1386701, date('01/12/2025')),
(395, 198711, 'Jennifer Whisenhunt', 1389837, date('11/13/2024')),
(396, 198711, 'Jennifer Whisenhunt', 3228785, date('11/01/2024')),
(397, 198711, 'Jennifer Whisenhunt', 3171205, date('04/15/2025')),
(398, 198711, 'Jennifer Whisenhunt', 3227009, date('11/05/2024')),
(399, 198711, 'Jennifer Whisenhunt', 3226974, date('12/06/2024')),
(400, 198711, 'Jennifer Whisenhunt', 3174163, date('11/07/2024')),
(401, 198711, 'Jennifer Whisenhunt', 3225216, date('03/12/2025')),
(402, 198711, 'Jennifer Whisenhunt', 1319400, date('12/04/2024')),
(403, 198711, 'Jennifer Whisenhunt', 1318185, date('12/04/2024')),
(404, 198711, 'Jennifer Whisenhunt', 3288481, date('01/04/2025')),
(405, 198711, 'Jennifer Whisenhunt', 1385773, date('11/14/2024')),
(406, 198711, 'Jennifer Whisenhunt', 1385088, date('12/25/2024')),
(407, 198711, 'Jennifer Whisenhunt', 1384874, date('11/12/2024')),
(408, 198711, 'Jennifer Whisenhunt', 3321837, date('11/13/2024')),
(409, 198711, 'Jennifer Whisenhunt', 3320071, date('12/11/2024')),
(410, 198711, 'Jennifer Whisenhunt', 1266017, date('11/09/2024')),
(411, 198711, 'Jennifer Whisenhunt', 1264841, date('11/14/2024')),
(412, 198711, 'Jennifer Whisenhunt', 3296233, date('01/07/2025')),
(413, 198711, 'Jennifer Whisenhunt', 1386211, date('06/10/2025')),
(414, 198711, 'Jennifer Whisenhunt', 3292437, date('01/10/2025')),
(415, 198711, 'Jennifer Whisenhunt', 3292381, date('03/04/2025')),
(416, 198711, 'Jennifer Whisenhunt', 3292292, date('11/08/2024')),
(417, 198711, 'Jennifer Whisenhunt', 3290904, date('11/07/2024')),
(418, 198711, 'Jennifer Whisenhunt', 1231949, date('11/14/2024')),
(419, 198711, 'Jennifer Whisenhunt', 3291498, date('11/01/2024')),
(420, 198711, 'Jennifer Whisenhunt', 1269694, date('12/03/2024')),
(421, 198711, 'Jennifer Whisenhunt', 1385142, date('11/13/2024')),
(422, 198711, 'Jennifer Whisenhunt', 3292279, date('11/14/2024')),
(423, 198711, 'Jennifer Whisenhunt', 3173269, date('11/06/2024')),
(424, 198711, 'Jennifer Whisenhunt', 3172937, date('11/07/2024')),
(425, 198711, 'Jennifer Whisenhunt', 3289719, date('06/13/2025')),
(426, 198711, 'Jennifer Whisenhunt', 1321354, date('11/28/2024')),
(427, 198711, 'Jennifer Whisenhunt', 1317432, date('12/07/2024')),
(428, 198711, 'Jennifer Whisenhunt', 1316840, date('04/12/2025')),
(429, 198711, 'Jennifer Whisenhunt', 3291208, date('11/12/2024')),
(430, 198711, 'Jennifer Whisenhunt', 3225949, date('11/12/2024')),
(431, 198711, 'Jennifer Whisenhunt', 3225803, date('11/01/2024')),
(432, 198711, 'Jennifer Whisenhunt', 1319642, date('12/04/2024')),
(433, 198711, 'Jennifer Whisenhunt', 1229233, date('01/10/2025')),
(434, 198711, 'Jennifer Whisenhunt', 1177159, date('01/16/2025')),
(435, 198711, 'Jennifer Whisenhunt', 1139509, date('11/02/2024')),
(436, 198711, 'Jennifer Whisenhunt', 3229765, date('11/01/2024')),
(437, 198711, 'Jennifer Whisenhunt', 3227772, date('11/21/2024')),
(438, 198711, 'Jennifer Whisenhunt', 1075962, date('05/15/2025')),
(439, 198711, 'Jennifer Whisenhunt', 3294849, date('11/19/2024')),
(440, 198711, 'Jennifer Whisenhunt', 3230036, date('01/10/2025')),
(441, 198711, 'Jennifer Whisenhunt', 3233707, date('12/05/2024')),
(442, 198711, 'Jennifer Whisenhunt', 3229648, date('11/01/2024')),
(443, 198711, 'Jennifer Whisenhunt', 3231214, date('12/27/2024')),
(444, 198711, 'Jennifer Whisenhunt', 3230595, date('01/10/2025')),
(445, 198711, 'Jennifer Whisenhunt', 3232315, date('11/01/2024')),
(446, 198711, 'Jennifer Whisenhunt', 3231419, date('11/28/2024')),
(447, 198711, 'Jennifer Whisenhunt', 3226033, date('12/05/2024')),
(448, 198711, 'Jennifer Whisenhunt', 1384526, date('12/03/2024')),
(449, 198711, 'Jennifer Whisenhunt', 3107547, date('11/20/2024')),
(450, 198711, 'Jennifer Whisenhunt', 3322466, date('11/28/2024')),
(451, 198711, 'Jennifer Whisenhunt', 3321218, date('01/04/2025')),
(452, 198711, 'Jennifer Whisenhunt', 3320601, date('12/14/2024')),
(453, 198711, 'Jennifer Whisenhunt', 3320586, date('08/28/2025')),
(454, 198711, 'Jennifer Whisenhunt', 3293520, date('07/16/2025')),
(455, 198711, 'Jennifer Whisenhunt', 3291820, date('08/14/2025')),
(456, 198711, 'Jennifer Whisenhunt', 1230136, date('01/01/2025')),
(457, 198711, 'Jennifer Whisenhunt', 3290075, date('03/07/2025')),
(458, 198711, 'Jennifer Whisenhunt', 3289319, date('12/04/2024')),
(459, 198711, 'Jennifer Whisenhunt', 3129860, date('11/01/2024')),
(460, 198711, 'Jennifer Whisenhunt', 3289706, date('05/30/2025')),
(461, 198711, 'Jennifer Whisenhunt', 3106850, date('02/05/2025')),
(462, 198711, 'Jennifer Whisenhunt', 3171200, date('04/23/2025')),
(463, 198711, 'Jennifer Whisenhunt', 3231204, date('11/13/2024')),
(464, 198711, 'Jennifer Whisenhunt', 3290185, date('11/28/2024')),
(465, 198711, 'Jennifer Whisenhunt', 3174491, date('12/06/2024')),
(466, 198711, 'Jennifer Whisenhunt', 3292711, date('11/07/2024')),
(467, 198711, 'Jennifer Whisenhunt', 3292563, date('11/07/2024')),
(468, 198711, 'Jennifer Whisenhunt', 1384883, date('12/25/2024')),
(469, 198711, 'Jennifer Whisenhunt', 1384861, date('11/03/2024')),
(470, 198711, 'Jennifer Whisenhunt', 3322673, date('02/06/2025')),
(471, 198711, 'Jennifer Whisenhunt', 3290292, date('11/01/2024')),
(472, 198711, 'Jennifer Whisenhunt', 3289245, date('01/29/2025')),
(473, 198711, 'Jennifer Whisenhunt', 3321178, date('11/13/2024')),
(474, 198711, 'Jennifer Whisenhunt', 3174137, date('11/02/2024')),
(475, 198711, 'Jennifer Whisenhunt', 1320395, date('12/03/2024')),
(476, 198711, 'Jennifer Whisenhunt', 1317895, date('01/28/2025')),
(477, 198711, 'Jennifer Whisenhunt', 3110318, date('01/03/2025')),
(478, 198711, 'Jennifer Whisenhunt', 3321518, date('11/14/2024')),
(479, 198711, 'Jennifer Whisenhunt', 3321517, date('11/16/2024')),
(480, 198711, 'Jennifer Whisenhunt', 3320138, date('01/01/2025')),
(481, 198711, 'Jennifer Whisenhunt', 3234079, date('11/07/2024')),
(482, 198711, 'Jennifer Whisenhunt', 3232307, date('01/07/2025')),
(483, 198711, 'Jennifer Whisenhunt', 3130314, date('11/20/2024')),
(484, 198711, 'Jennifer Whisenhunt', 3129793, date('05/22/2025')),
(485, 198711, 'Jennifer Whisenhunt', 3232316, date('01/23/2025')),
(486, 198711, 'Jennifer Whisenhunt', 3126132, date('07/03/2025')),
(487, 198711, 'Jennifer Whisenhunt', 3226367, date('11/07/2024')),
(488, 198711, 'Jennifer Whisenhunt', 3107702, date('11/01/2024')),
(489, 198711, 'Jennifer Whisenhunt', 3292199, date('11/13/2024')),
(490, 198711, 'Jennifer Whisenhunt', 3225717, date('12/18/2024')),
(491, 198711, 'Jennifer Whisenhunt', 3120862, date('11/01/2024')),
(492, 198711, 'Jennifer Whisenhunt', 3172321, date('01/24/2025')),
(493, 198711, 'Jennifer Whisenhunt', 3173019, date('01/31/2025')),
(494, 198711, 'Jennifer Whisenhunt', 3291906, date('11/09/2024')),
(495, 198711, 'Jennifer Whisenhunt', 3230923, date('11/09/2024')),
(496, 198711, 'Jennifer Whisenhunt', 3225637, date('11/01/2024')),
(497, 198711, 'Jennifer Whisenhunt', 3291514, date('11/16/2024')),
(498, 198711, 'Jennifer Whisenhunt', 3290938, date('11/15/2024')),
(499, 198711, 'Jennifer Whisenhunt', 3319931, date('11/30/2024')),
(500, 198711, 'Jennifer Whisenhunt', 3319950, date('11/23/2024')),
(501, 198711, 'Jennifer Whisenhunt', 1380141, date('11/07/2024')),
(502, 198711, 'Jennifer Whisenhunt', 1385278, date('12/27/2024')),
(503, 198711, 'Jennifer Whisenhunt', 3173467, date('11/01/2024')),
(504, 198711, 'Jennifer Whisenhunt', 3173409, date('11/19/2024')),
(505, 198711, 'Jennifer Whisenhunt', 1336687, date('05/07/2025')),
(506, 198711, 'Jennifer Whisenhunt', 1332303, date('11/13/2024')),
(507, 198711, 'Jennifer Whisenhunt', 3290011, date('11/16/2024')),
(508, 198711, 'Jennifer Whisenhunt', 3321402, date('08/15/2025')),
(509, 198711, 'Jennifer Whisenhunt', 1320186, date('11/14/2024')),
(510, 198711, 'Jennifer Whisenhunt', 1332559, date('11/01/2024')),
(511, 198711, 'Jennifer Whisenhunt', 3320655, date('02/27/2025')),
(512, 198711, 'Jennifer Whisenhunt', 3321781, date('12/25/2024')),
(513, 198711, 'Jennifer Whisenhunt', 3177613, date('11/14/2024')),
(514, 198711, 'Jennifer Whisenhunt', 3171756, date('11/07/2024')),
(515, 198711, 'Jennifer Whisenhunt', 3171214, date('12/05/2024')),
(516, 198711, 'Jennifer Whisenhunt', 3322110, date('11/21/2024')),
(517, 198711, 'Jennifer Whisenhunt', 3322063, date('12/03/2024')),
(518, 198711, 'Jennifer Whisenhunt', 3321985, date('03/25/2025')),
(519, 198711, 'Jennifer Whisenhunt', 3230045, date('12/05/2024')),
(520, 198711, 'Jennifer Whisenhunt', 3321566, date('11/01/2024')),
(521, 198711, 'Jennifer Whisenhunt', 3321152, date('07/08/2025')),
(522, 198711, 'Jennifer Whisenhunt', 3175104, date('12/30/2024')),
(523, 198711, 'Jennifer Whisenhunt', 3172717, date('11/01/2024')),
(524, 198711, 'Jennifer Whisenhunt', 3110254, date('12/04/2024')),
(525, 198711, 'Jennifer Whisenhunt', 3106694, date('11/13/2024')),
(526, 198711, 'Jennifer Whisenhunt', 3231457, date('11/07/2024')),
(527, 198711, 'Jennifer Whisenhunt', 3227863, date('11/07/2024')),
(528, 198711, 'Jennifer Whisenhunt', 3115061, date('01/16/2025')),
(529, 198711, 'Jennifer Whisenhunt', 3231856, date('04/25/2025')),
(530, 198711, 'Jennifer Whisenhunt', 3230235, date('11/20/2024')),
(531, 198711, 'Jennifer Whisenhunt', 3229043, date('11/07/2024')),
(532, 198711, 'Jennifer Whisenhunt', 1266062, date('02/28/2025')),
(533, 198711, 'Jennifer Whisenhunt', 3293837, date('11/15/2024')),
(534, 198711, 'Jennifer Whisenhunt', 1385658, date('11/09/2024')),
(535, 198711, 'Jennifer Whisenhunt', 1267402, date('04/01/2025')),
(536, 198711, 'Jennifer Whisenhunt', 3120870, date('11/01/2024')),
(537, 198711, 'Jennifer Whisenhunt', 3110250, date('11/02/2024')),
(538, 198711, 'Jennifer Whisenhunt', 3109496, date('12/11/2024')),
(539, 198711, 'Jennifer Whisenhunt', 3291279, date('11/07/2024')),
(540, 198711, 'Jennifer Whisenhunt', 3291051, date('01/08/2025')),
(541, 198711, 'Jennifer Whisenhunt', 3106558, date('12/27/2024')),
(542, 198711, 'Jennifer Whisenhunt', 3290778, date('11/28/2024')),
(543, 198711, 'Jennifer Whisenhunt', 3289977, date('08/15/2025')),
(544, 198711, 'Jennifer Whisenhunt', 3289213, date('11/28/2024')),
(545, 198711, 'Jennifer Whisenhunt', 3288985, date('04/23/2025')),
(546, 198711, 'Jennifer Whisenhunt', 3291168, date('11/01/2024')),
(547, 198711, 'Jennifer Whisenhunt', 3289991, date('12/27/2024')),
(548, 198711, 'Jennifer Whisenhunt', 3289844, date('02/06/2025')),
(549, 198711, 'Jennifer Whisenhunt', 3289438, date('11/21/2024')),
(550, 198711, 'Jennifer Whisenhunt', 3170875, date('01/08/2025')),
(551, 198711, 'Jennifer Whisenhunt', 1389849, date('11/05/2024')),
(552, 198711, 'Jennifer Whisenhunt', 1318547, date('11/06/2024')),
(553, 198711, 'Jennifer Whisenhunt', 3109488, date('11/02/2024')),
(554, 198711, 'Jennifer Whisenhunt', 3109204, date('11/07/2024')),
(555, 198711, 'Jennifer Whisenhunt', 3227259, date('12/18/2024')),
(556, 198711, 'Jennifer Whisenhunt', 3323359, date('01/20/2025')),
(557, 198711, 'Jennifer Whisenhunt', 3321644, date('05/28/2025')),
(558, 198711, 'Jennifer Whisenhunt', 3108560, date('12/25/2024')),
(559, 198711, 'Jennifer Whisenhunt', 1383523, date('03/11/2025')),
(560, 198711, 'Jennifer Whisenhunt', 1382728, date('01/16/2025')),
(561, 198711, 'Jennifer Whisenhunt', 1318604, date('11/28/2024')),
(562, 198711, 'Jennifer Whisenhunt', 3226789, date('04/24/2025')),
(563, 198711, 'Jennifer Whisenhunt', 3320875, date('11/01/2024')),
(564, 198711, 'Jennifer Whisenhunt', 3322099, date('11/07/2024')),
(565, 198711, 'Jennifer Whisenhunt', 3320713, date('11/28/2024')),
(566, 198711, 'Jennifer Whisenhunt', 3320560, date('11/12/2024')),
(567, 198711, 'Jennifer Whisenhunt', 1316841, date('12/06/2024')),
(568, 198711, 'Jennifer Whisenhunt', 3173942, date('01/15/2025')),
(569, 198711, 'Jennifer Whisenhunt', 3173275, date('11/07/2024')),
(570, 198711, 'Jennifer Whisenhunt', 3229866, date('11/01/2024')),
(571, 198711, 'Jennifer Whisenhunt', 3228144, date('04/24/2025')),
(572, 198711, 'Jennifer Whisenhunt', 3226996, date('11/02/2024')),
(573, 198711, 'Jennifer Whisenhunt', 3320708, date('11/28/2024')),
(574, 198711, 'Jennifer Whisenhunt', 1386112, date('01/01/2025')),
(575, 198711, 'Jennifer Whisenhunt', 1385340, date('04/18/2025')),
(576, 198711, 'Jennifer Whisenhunt', 1384973, date('01/24/2025')),
(577, 198711, 'Jennifer Whisenhunt', 3291469, date('11/21/2024')),
(578, 198711, 'Jennifer Whisenhunt', 3290351, date('12/04/2024')),
(579, 198711, 'Jennifer Whisenhunt', 1140120, date('11/07/2024')),
(580, 198711, 'Jennifer Whisenhunt', 1323911, date('12/31/2024')),
(581, 198711, 'Jennifer Whisenhunt', 3289925, date('11/06/2024')),
(582, 198711, 'Jennifer Whisenhunt', 3289533, date('11/01/2024')),
(583, 198711, 'Jennifer Whisenhunt', 3321969, date('02/18/2025')),
(584, 198711, 'Jennifer Whisenhunt', 3320002, date('12/06/2024')),
(585, 198711, 'Jennifer Whisenhunt', 1229649, date('11/28/2024')),
(586, 198711, 'Jennifer Whisenhunt', 3174928, date('08/13/2025')),
(587, 198711, 'Jennifer Whisenhunt', 3291963, date('11/09/2024')),
(588, 198711, 'Jennifer Whisenhunt', 1325556, date('11/20/2024')),
(589, 198711, 'Jennifer Whisenhunt', 3290985, date('11/07/2024')),
(590, 198711, 'Jennifer Whisenhunt', 3290448, date('11/01/2024')),
(591, 198711, 'Jennifer Whisenhunt', 3106423, date('02/06/2025')),
(592, 198711, 'Jennifer Whisenhunt', 1138045, date('04/16/2025')),
(593, 198711, 'Jennifer Whisenhunt', 3174020, date('11/08/2024')),
(594, 198711, 'Jennifer Whisenhunt', 3126529, date('12/19/2024')),
(595, 198711, 'Jennifer Whisenhunt', 3324075, date('11/28/2024')),
(596, 198711, 'Jennifer Whisenhunt', 3321019, date('12/04/2024')),
(597, 198711, 'Jennifer Whisenhunt', 3319956, date('02/14/2025')),
(598, 198711, 'Jennifer Whisenhunt', 1316806, date('12/05/2024')),
(599, 198711, 'Jennifer Whisenhunt', 3291148, date('08/22/2025')),
(600, 198711, 'Jennifer Whisenhunt', 3291066, date('08/08/2025')),
(601, 198711, 'Jennifer Whisenhunt', 3107603, date('11/05/2024')),
(602, 198711, 'Jennifer Whisenhunt', 1317222, date('03/07/2025')),
(603, 198711, 'Jennifer Whisenhunt', 3291884, date('11/07/2024')),
(604, 198711, 'Jennifer Whisenhunt', 3291668, date('11/28/2024')),
(605, 198711, 'Jennifer Whisenhunt', 3229650, date('11/15/2024')),
(606, 198711, 'Jennifer Whisenhunt', 3229515, date('11/01/2024')),
(607, 198711, 'Jennifer Whisenhunt', 3229148, date('11/13/2024')),
(608, 198711, 'Jennifer Whisenhunt', 3229143, date('12/22/2024')),
(609, 198711, 'Jennifer Whisenhunt', 3228139, date('11/07/2024')),
(610, 198711, 'Jennifer Whisenhunt', 3291901, date('01/07/2025')),
(611, 198711, 'Jennifer Whisenhunt', 3289607, date('01/24/2025')),
(612, 198711, 'Jennifer Whisenhunt', 1389373, date('12/05/2024')),
(613, 198711, 'Jennifer Whisenhunt', 1386367, date('11/07/2024')),
(614, 198711, 'Jennifer Whisenhunt', 3292056, date('01/10/2025')),
(615, 198711, 'Jennifer Whisenhunt', 3289309, date('01/15/2025')),
(616, 198711, 'Jennifer Whisenhunt', 3289132, date('11/01/2024')),
(617, 198711, 'Jennifer Whisenhunt', 1265194, date('11/08/2024')),
(618, 198711, 'Jennifer Whisenhunt', 1385091, date('11/14/2024')),
(619, 198711, 'Jennifer Whisenhunt', 3120713, date('12/12/2024')),
(620, 198711, 'Jennifer Whisenhunt', 3229997, date('12/27/2024')),
(621, 198711, 'Jennifer Whisenhunt', 3105559, date('11/01/2024')),
(622, 198711, 'Jennifer Whisenhunt', 3171528, date('01/11/2025')),
(623, 198711, 'Jennifer Whisenhunt', 1339578, date('11/19/2024')),
(624, 198711, 'Jennifer Whisenhunt', 3229315, date('12/31/2024')),
(625, 198711, 'Jennifer Whisenhunt', 3227241, date('03/20/2025')),
(626, 198711, 'Jennifer Whisenhunt', 1265769, date('11/02/2024')),
(627, 198711, 'Jennifer Whisenhunt', 3292853, date('11/14/2024')),
(628, 198711, 'Jennifer Whisenhunt', 1229117, date('11/13/2024')),
(629, 198711, 'Jennifer Whisenhunt', 1319120, date('12/25/2024')),
(630, 198711, 'Jennifer Whisenhunt', 1317202, date('12/28/2024')),
(631, 198711, 'Jennifer Whisenhunt', 1386129, date('04/16/2025')),
(632, 198711, 'Jennifer Whisenhunt', 3231947, date('11/20/2024')),
(633, 198711, 'Jennifer Whisenhunt', 3228197, date('12/28/2024')),
(634, 198711, 'Jennifer Whisenhunt', 3288679, date('01/07/2025')),
(635, 198711, 'Jennifer Whisenhunt', 3291463, date('11/28/2024')),
(636, 198711, 'Jennifer Whisenhunt', 3291088, date('11/07/2024')),
(637, 198711, 'Jennifer Whisenhunt', 3175995, date('11/01/2024')),
(638, 198711, 'Jennifer Whisenhunt', 3174031, date('01/28/2025')),
(639, 198711, 'Jennifer Whisenhunt', 3288820, date('11/20/2024')),
(640, 198711, 'Jennifer Whisenhunt', 1229831, date('11/23/2024')),
(641, 198711, 'Jennifer Whisenhunt', 1336922, date('11/14/2024')),
(642, 198711, 'Jennifer Whisenhunt', 3322093, date('11/01/2024')),
(643, 198711, 'Jennifer Whisenhunt', 3322641, date('12/25/2024')),
(644, 198711, 'Jennifer Whisenhunt', 1318485, date('11/07/2024')),
(645, 198711, 'Jennifer Whisenhunt', 3324647, date('11/21/2024')),
(646, 198711, 'Jennifer Whisenhunt', 3321380, date('01/15/2025')),
(647, 198711, 'Jennifer Whisenhunt', 3289994, date('11/19/2024')),
(648, 198711, 'Jennifer Whisenhunt', 3320501, date('11/01/2024')),
(649, 198711, 'Jennifer Whisenhunt', 3108995, date('12/18/2024')),
(650, 198711, 'Jennifer Whisenhunt', 1321830, date('12/04/2024')),
(651, 198711, 'Jennifer Whisenhunt', 1321282, date('12/13/2024')),
(652, 198711, 'Jennifer Whisenhunt', 1318105, date('11/01/2024')),
(653, 198711, 'Jennifer Whisenhunt', 3129499, date('05/03/2025')),
(654, 198711, 'Jennifer Whisenhunt', 3046067, date('02/19/2025')),
(655, 198711, 'Jennifer Whisenhunt', 3322183, date('11/01/2024')),
(656, 198711, 'Jennifer Whisenhunt', 3226470, date('12/21/2024')),
(657, 198711, 'Jennifer Whisenhunt', 3108498, date('11/19/2024')),
(658, 198711, 'Jennifer Whisenhunt', 3228726, date('11/07/2024')),
(659, 198711, 'Jennifer Whisenhunt', 3226744, date('11/19/2024')),
(660, 198711, 'Jennifer Whisenhunt', 3225209, date('01/24/2025')),
(661, 198711, 'Jennifer Whisenhunt', 3322976, date('12/05/2024')),
(662, 198711, 'Jennifer Whisenhunt', 1265918, date('02/13/2025')),
(663, 198711, 'Jennifer Whisenhunt', 1384417, date('11/15/2024')),
(664, 198711, 'Jennifer Whisenhunt', 3231441, date('11/01/2024')),
(665, 198711, 'Jennifer Whisenhunt', 3231599, date('11/07/2024')),
(666, 198711, 'Jennifer Whisenhunt', 3227292, date('07/26/2025')),
(667, 198711, 'Jennifer Whisenhunt', 3172076, date('12/04/2024')),
(668, 198711, 'Jennifer Whisenhunt', 3321639, date('11/01/2024')),
(669, 198711, 'Jennifer Whisenhunt', 3174387, date('11/28/2024')),
(670, 198711, 'Jennifer Whisenhunt', 1232077, date('07/11/2025')),
(671, 198711, 'Jennifer Whisenhunt', 3225017, date('11/07/2024')),
(672, 198711, 'Jennifer Whisenhunt', 3226527, date('01/09/2025')),
(673, 198711, 'Jennifer Whisenhunt', 1384564, date('06/11/2025')),
(674, 198711, 'Jennifer Whisenhunt', 3171701, date('11/13/2024')),
(675, 198711, 'Jennifer Whisenhunt', 3229311, date('11/05/2024')),
(676, 198711, 'Jennifer Whisenhunt', 3227865, date('08/09/2025')),
(677, 198711, 'Jennifer Whisenhunt', 3290800, date('11/22/2024')),
(678, 198711, 'Jennifer Whisenhunt', 3290595, date('01/30/2025')),
(679, 198711, 'Jennifer Whisenhunt', 3290580, date('03/05/2025')),
(680, 198711, 'Jennifer Whisenhunt', 3290391, date('11/21/2024')),
(681, 198711, 'Jennifer Whisenhunt', 1383797, date('02/07/2025')),
(682, 198711, 'Jennifer Whisenhunt', 3293275, date('01/10/2025')),
(683, 198711, 'Jennifer Whisenhunt', 3290824, date('11/07/2024')),
(684, 198711, 'Jennifer Whisenhunt', 1008063, date('11/15/2024')),
(685, 198711, 'Jennifer Whisenhunt', 3290841, date('11/13/2024')),
(686, 198711, 'Jennifer Whisenhunt', 3290569, date('01/09/2025')),
(687, 198711, 'Jennifer Whisenhunt', 3289452, date('12/11/2024')),
(688, 198711, 'Jennifer Whisenhunt', 3292183, date('11/01/2024')),
(689, 198711, 'Jennifer Whisenhunt', 3289716, date('11/07/2024')),
(690, 198711, 'Jennifer Whisenhunt', 3289512, date('04/10/2025')),
(691, 198711, 'Jennifer Whisenhunt', 1320149, date('01/01/2025')),
(692, 198711, 'Jennifer Whisenhunt', 3232484, date('11/06/2024')),
(693, 198711, 'Jennifer Whisenhunt', 3180877, date('12/04/2024')),
(694, 198711, 'Jennifer Whisenhunt', 3128158, date('07/01/2025')),
(695, 198711, 'Jennifer Whisenhunt', 3296371, date('01/09/2025')),
(696, 198711, 'Jennifer Whisenhunt', 3228215, date('11/23/2024')),
(697, 198711, 'Jennifer Whisenhunt', 3230291, date('11/01/2024')),
(698, 198711, 'Jennifer Whisenhunt', 3292768, date('04/10/2025')),
(699, 198711, 'Jennifer Whisenhunt', 3292073, date('12/25/2024')),
(700, 198711, 'Jennifer Whisenhunt', 3290510, date('01/03/2025')),
(701, 198711, 'Jennifer Whisenhunt', 3290217, date('11/20/2024')),
(702, 198711, 'Jennifer Whisenhunt', 3175385, date('12/20/2024')),
(703, 198711, 'Jennifer Whisenhunt', 3230589, date('12/24/2024')),
(704, 198711, 'Jennifer Whisenhunt', 3289066, date('04/18/2025')),
(705, 198711, 'Jennifer Whisenhunt', 3322276, date('03/08/2025')),
(706, 198711, 'Jennifer Whisenhunt', 1196790, date('01/15/2025')),
(707, 198711, 'Jennifer Whisenhunt', 3174429, date('11/28/2024')),
(708, 198711, 'Jennifer Whisenhunt', 3173561, date('11/19/2024')),
(709, 198711, 'Jennifer Whisenhunt', 3322284, date('01/10/2025')),
(710, 198711, 'Jennifer Whisenhunt', 3322114, date('11/07/2024')),
(711, 198711, 'Jennifer Whisenhunt', 3321895, date('01/04/2025')),
(712, 198711, 'Jennifer Whisenhunt', 3321758, date('11/14/2024')),
(713, 198711, 'Jennifer Whisenhunt', 3320283, date('12/03/2024')),
(714, 198711, 'Jennifer Whisenhunt', 3228178, date('11/07/2024')),
(715, 198711, 'Jennifer Whisenhunt', 1386377, date('11/07/2024')),
(716, 198711, 'Jennifer Whisenhunt', 3175490, date('11/19/2024')),
(717, 198711, 'Jennifer Whisenhunt', 1140095, date('02/25/2025')),
(718, 198711, 'Jennifer Whisenhunt', 3181445, date('11/08/2024')),
(719, 198711, 'Jennifer Whisenhunt', 1265042, date('11/07/2024')),
(720, 198711, 'Jennifer Whisenhunt', 3173336, date('07/03/2025')),
(721, 198711, 'Jennifer Whisenhunt', 1320445, date('11/01/2024')),
(722, 198711, 'Jennifer Whisenhunt', 1318104, date('11/21/2024')),
(723, 198711, 'Jennifer Whisenhunt', 1318067, date('11/19/2024')),
(724, 198711, 'Jennifer Whisenhunt', 3229320, date('12/10/2024')),
(725, 198711, 'Jennifer Whisenhunt', 3173978, date('11/01/2024')),
(726, 198711, 'Jennifer Whisenhunt', 3172080, date('11/07/2024')),
(727, 198711, 'Jennifer Whisenhunt', 3114524, date('04/16/2025')),
(728, 198711, 'Jennifer Whisenhunt', 3227642, date('11/01/2024')),
(729, 198711, 'Jennifer Whisenhunt', 1323055, date('11/07/2024')),
(730, 198711, 'Jennifer Whisenhunt', 3292997, date('01/07/2025')),
(731, 198711, 'Jennifer Whisenhunt', 3230003, date('01/10/2025')),
(732, 198711, 'Jennifer Whisenhunt', 3292589, date('12/25/2024')),
(733, 198711, 'Jennifer Whisenhunt', 3291829, date('01/10/2025')),
(734, 198711, 'Jennifer Whisenhunt', 1229469, date('06/20/2025')),
(735, 198711, 'Jennifer Whisenhunt', 1228747, date('03/07/2025')),
(736, 198711, 'Jennifer Whisenhunt', 1380500, date('11/20/2024')),
(737, 198711, 'Jennifer Whisenhunt', 3108205, date('01/23/2025')),
(738, 198711, 'Jennifer Whisenhunt', 3291767, date('11/07/2024')),
(739, 198711, 'Jennifer Whisenhunt', 3290726, date('12/21/2024')),
(740, 198711, 'Jennifer Whisenhunt', 3290655, date('11/01/2024')),
(741, 198711, 'Jennifer Whisenhunt', 3230499, date('12/07/2024')),
(742, 198711, 'Jennifer Whisenhunt', 3321581, date('02/20/2025')),
(743, 198711, 'Jennifer Whisenhunt', 3321332, date('08/21/2025')),
(744, 198711, 'Jennifer Whisenhunt', 3320860, date('02/11/2025')),
(745, 198711, 'Jennifer Whisenhunt', 3320558, date('08/22/2025')),
(746, 198711, 'Jennifer Whisenhunt', 3225401, date('11/01/2024')),
(747, 198711, 'Jennifer Whisenhunt', 1231526, date('05/03/2025')),
(748, 198711, 'Jennifer Whisenhunt', 1139444, date('11/09/2024')),
(749, 198711, 'Jennifer Whisenhunt', 1179280, date('11/16/2024')),
(750, 198711, 'Jennifer Whisenhunt', 3175082, date('11/28/2024')),
(751, 198711, 'Jennifer Whisenhunt', 3172923, date('11/07/2024')),
(752, 198711, 'Jennifer Whisenhunt', 3172651, date('12/25/2024')),
(753, 198711, 'Jennifer Whisenhunt', 1371553, date('12/25/2024')),
(754, 198711, 'Jennifer Whisenhunt', 3230832, date('02/11/2025')),
(755, 198711, 'Jennifer Whisenhunt', 3230236, date('01/09/2025')),
(756, 198711, 'Jennifer Whisenhunt', 3229314, date('03/13/2025')),
(757, 198711, 'Jennifer Whisenhunt', 3226208, date('11/21/2024')),
(758, 198711, 'Jennifer Whisenhunt', 3107798, date('11/08/2024')),
(759, 198711, 'Jennifer Whisenhunt', 3175899, date('12/04/2024')),
(760, 198711, 'Jennifer Whisenhunt', 3175671, date('11/07/2024')),
(761, 198711, 'Jennifer Whisenhunt', 3174254, date('12/02/2024')),
(762, 198711, 'Jennifer Whisenhunt', 3172383, date('07/09/2025')),
(763, 198711, 'Jennifer Whisenhunt', 3176008, date('11/01/2024')),
(764, 198711, 'Jennifer Whisenhunt', 3174238, date('12/04/2024')),
(765, 198711, 'Jennifer Whisenhunt', 3171588, date('01/04/2025')),
(766, 198711, 'Jennifer Whisenhunt', 1230872, date('12/26/2024')),
(767, 198711, 'Jennifer Whisenhunt', 1228454, date('11/07/2024')),
(768, 198711, 'Jennifer Whisenhunt', 3171996, date('11/13/2024')),
(769, 198711, 'Jennifer Whisenhunt', 3227034, date('11/21/2024')),
(770, 198711, 'Jennifer Whisenhunt', 3114937, date('11/01/2024')),
(771, 198711, 'Jennifer Whisenhunt', 3120856, date('11/13/2024')),
(772, 198711, 'Jennifer Whisenhunt', 3109048, date('11/28/2024')),
(773, 198711, 'Jennifer Whisenhunt', 3110180, date('06/23/2025')),
(774, 198711, 'Jennifer Whisenhunt', 3173807, date('08/19/2025')),
(775, 198711, 'Jennifer Whisenhunt', 3295347, date('01/22/2025')),
(776, 198711, 'Jennifer Whisenhunt', 3293917, date('11/28/2024')),
(777, 198711, 'Jennifer Whisenhunt', 1269773, date('11/28/2024')),
(778, 198711, 'Jennifer Whisenhunt', 1265464, date('11/21/2024')),
(779, 198711, 'Jennifer Whisenhunt', 3114553, date('11/02/2024')),
(780, 198711, 'Jennifer Whisenhunt', 1398422, date('11/15/2024')),
(781, 198711, 'Jennifer Whisenhunt', 1324812, date('01/01/2025')),
(782, 198711, 'Jennifer Whisenhunt', 3229243, date('12/04/2024')),
(783, 198711, 'Jennifer Whisenhunt', 3231588, date('11/08/2024')),
(784, 198711, 'Jennifer Whisenhunt', 3107232, date('03/18/2025')),
(785, 198711, 'Jennifer Whisenhunt', 3290866, date('11/20/2024')),
(786, 198711, 'Jennifer Whisenhunt', 3289044, date('11/21/2024')),
(787, 198711, 'Jennifer Whisenhunt', 3179176, date('11/22/2024')),
(788, 198711, 'Jennifer Whisenhunt', 3175327, date('11/07/2024')),
(789, 198711, 'Jennifer Whisenhunt', 3175147, date('02/20/2025')),
(790, 198711, 'Jennifer Whisenhunt', 3173085, date('11/01/2024')),
(791, 198711, 'Jennifer Whisenhunt', 1230809, date('11/07/2024')),
(792, 198711, 'Jennifer Whisenhunt', 3293611, date('11/28/2024')),
(793, 198711, 'Jennifer Whisenhunt', 3293103, date('11/01/2024')),
(794, 198711, 'Jennifer Whisenhunt', 3290337, date('12/07/2024')),
(795, 198711, 'Jennifer Whisenhunt', 3321295, date('03/14/2025')),
(796, 198711, 'Jennifer Whisenhunt', 1358778, date('11/07/2024')),
(797, 198711, 'Jennifer Whisenhunt', 1319888, date('12/05/2024')),
(798, 198711, 'Jennifer Whisenhunt', 1265827, date('11/01/2024')),
(799, 198711, 'Jennifer Whisenhunt', 1363408, date('11/19/2024')),
(800, 198711, 'Jennifer Whisenhunt', 1346316, date('05/08/2025')),
(801, 198711, 'Jennifer Whisenhunt', 3172650, date('02/25/2025')),
(802, 198711, 'Jennifer Whisenhunt', 1348780, date('11/07/2024')),
(803, 198711, 'Jennifer Whisenhunt', 3235927, date('11/06/2024')),
(804, 198711, 'Jennifer Whisenhunt', 3234187, date('11/01/2024')),
(805, 198711, 'Jennifer Whisenhunt', 3176995, date('11/13/2024')),
(806, 198711, 'Jennifer Whisenhunt', 3172772, date('11/15/2024')),
(807, 198711, 'Jennifer Whisenhunt', 3172657, date('11/07/2024')),
(808, 198711, 'Jennifer Whisenhunt', 1230178, date('12/12/2024')),
(809, 198711, 'Jennifer Whisenhunt', 3109230, date('11/09/2024')),
(810, 198711, 'Jennifer Whisenhunt', 1325521, date('11/07/2024')),
(811, 198711, 'Jennifer Whisenhunt', 3227294, date('01/07/2025')),
(812, 198711, 'Jennifer Whisenhunt', 1320141, date('11/09/2024')),
(813, 198711, 'Jennifer Whisenhunt', 1319401, date('11/20/2024')),
(814, 198711, 'Jennifer Whisenhunt', 1201197, date('11/12/2024')),
(815, 198711, 'Jennifer Whisenhunt', 3291957, date('12/17/2024')),
(816, 198711, 'Jennifer Whisenhunt', 3289669, date('11/01/2024')),
(817, 198711, 'Jennifer Whisenhunt', 3291017, date('12/25/2024')),
(818, 198711, 'Jennifer Whisenhunt', 3289911, date('01/15/2025')),
(819, 198711, 'Jennifer Whisenhunt', 1317603, date('01/10/2025')),
(820, 198711, 'Jennifer Whisenhunt', 1139139, date('11/14/2024')),
(821, 198711, 'Jennifer Whisenhunt', 3290817, date('11/19/2024')),
(822, 198711, 'Jennifer Whisenhunt', 3292487, date('11/01/2024')),
(823, 198711, 'Jennifer Whisenhunt', 3129754, date('11/07/2024')),
(824, 198711, 'Jennifer Whisenhunt', 1320800, date('01/29/2025')),
(825, 198711, 'Jennifer Whisenhunt', 1095539, date('02/28/2025')),
(826, 198711, 'Jennifer Whisenhunt', 1265586, date('11/07/2024')),
(827, 198711, 'Jennifer Whisenhunt', 1228057, date('11/07/2024')),
(828, 198711, 'Jennifer Whisenhunt', 1322648, date('12/05/2024')),
(829, 198711, 'Jennifer Whisenhunt', 1325513, date('11/01/2024')),
(830, 198711, 'Jennifer Whisenhunt', 3294126, date('03/08/2025')),
(831, 198711, 'Jennifer Whisenhunt', 3172677, date('11/01/2024')),
(832, 198711, 'Jennifer Whisenhunt', 1266774, date('12/12/2024')),
(833, 198711, 'Jennifer Whisenhunt', 3289540, date('08/23/2025')),
(834, 198711, 'Jennifer Whisenhunt', 1200392, date('11/07/2024')),
(835, 198711, 'Jennifer Whisenhunt', 3294062, date('04/22/2025')),
(836, 198711, 'Jennifer Whisenhunt', 3293398, date('11/01/2024')),
(837, 198711, 'Jennifer Whisenhunt', 3292185, date('01/10/2025')),
(838, 198711, 'Jennifer Whisenhunt', 3291475, date('11/16/2024')),
(839, 198711, 'Jennifer Whisenhunt', 1138565, date('12/13/2024')),
(840, 198711, 'Jennifer Whisenhunt', 3322209, date('11/14/2024')),
(841, 198711, 'Jennifer Whisenhunt', 3320619, date('11/01/2024')),
(842, 198711, 'Jennifer Whisenhunt', 3293097, date('01/09/2025')),
(843, 198711, 'Jennifer Whisenhunt', 1137974, date('11/01/2024')),
(844, 198711, 'Jennifer Whisenhunt', 1229661, date('11/02/2024')),
(845, 198711, 'Jennifer Whisenhunt', 1227931, date('11/09/2024')),
(846, 198711, 'Jennifer Whisenhunt', 1138337, date('01/25/2025')),
(847, 198711, 'Jennifer Whisenhunt', 3320234, date('12/27/2024')),
(848, 198711, 'Jennifer Whisenhunt', 1229631, date('11/07/2024')),
(849, 198711, 'Jennifer Whisenhunt', 3322066, date('11/14/2024')),
(850, 198711, 'Jennifer Whisenhunt', 3321131, date('02/22/2025')),
(851, 198711, 'Jennifer Whisenhunt', 3320423, date('01/09/2025')),
(852, 198711, 'Jennifer Whisenhunt', 1320341, date('11/13/2024')),
(853, 198711, 'Jennifer Whisenhunt', 3290246, date('11/08/2024')),
(854, 198711, 'Jennifer Whisenhunt', 3175247, date('11/28/2024')),
(855, 198711, 'Jennifer Whisenhunt', 3290916, date('12/04/2024')),
(856, 198711, 'Jennifer Whisenhunt', 3321792, date('01/14/2025')),
(857, 198711, 'Jennifer Whisenhunt', 1386270, date('11/01/2024')),
(858, 198711, 'Jennifer Whisenhunt', 3228977, date('11/07/2024')),
(859, 198711, 'Jennifer Whisenhunt', 3228753, date('01/24/2025')),
(860, 198711, 'Jennifer Whisenhunt', 3107901, date('11/15/2024')),
(861, 198711, 'Jennifer Whisenhunt', 1270810, date('11/28/2024')),
(862, 198711, 'Jennifer Whisenhunt', 1230420, date('11/12/2024')),
(863, 198711, 'Jennifer Whisenhunt', 3321075, date('02/26/2025')),
(864, 198711, 'Jennifer Whisenhunt', 3108336, date('12/05/2024')),
(865, 198711, 'Jennifer Whisenhunt', 1228788, date('11/01/2024')),
(866, 198711, 'Jennifer Whisenhunt', 3319902, date('06/17/2025')),
(867, 198711, 'Jennifer Whisenhunt', 3291063, date('12/27/2024')),
(868, 198711, 'Jennifer Whisenhunt', 3290574, date('11/28/2024')),
(869, 198711, 'Jennifer Whisenhunt', 1321883, date('11/13/2024')),
(870, 198711, 'Jennifer Whisenhunt', 1320378, date('11/19/2024')),
(871, 198711, 'Jennifer Whisenhunt', 3292098, date('11/15/2024')),
(872, 198711, 'Jennifer Whisenhunt', 3290296, date('11/09/2024')),
(873, 198711, 'Jennifer Whisenhunt', 3290008, date('02/11/2025')),
(874, 198711, 'Jennifer Whisenhunt', 3232610, date('11/21/2024')),
(875, 198711, 'Jennifer Whisenhunt', 3292325, date('01/04/2025')),
(876, 198711, 'Jennifer Whisenhunt', 3291688, date('12/25/2024')),
(877, 198711, 'Jennifer Whisenhunt', 1322832, date('02/13/2025')),
(878, 198711, 'Jennifer Whisenhunt', 1317988, date('02/01/2025')),
(879, 198711, 'Jennifer Whisenhunt', 1317891, date('11/20/2024')),
(880, 198711, 'Jennifer Whisenhunt', 3226015, date('11/07/2024')),
(881, 198711, 'Jennifer Whisenhunt', 3226261, date('11/30/2024')),
(882, 198711, 'Jennifer Whisenhunt', 3292819, date('11/14/2024')),
(883, 198711, 'Jennifer Whisenhunt', 3228881, date('03/12/2025')),
(884, 198711, 'Jennifer Whisenhunt', 3226621, date('11/06/2024')),
(885, 198711, 'Jennifer Whisenhunt', 3230868, date('11/14/2024')),
(886, 198711, 'Jennifer Whisenhunt', 3290980, date('07/10/2025')),
(887, 198711, 'Jennifer Whisenhunt', 1332306, date('11/01/2024')),
(888, 198711, 'Jennifer Whisenhunt', 1318195, date('11/01/2024')),
(889, 198711, 'Jennifer Whisenhunt', 1177412, date('12/14/2024')),
(890, 198711, 'Jennifer Whisenhunt', 1097591, date('12/07/2024')),
(891, 198711, 'Jennifer Whisenhunt', 1264881, date('08/23/2025')),
(892, 198711, 'Jennifer Whisenhunt', 3290973, date('11/20/2024')),
(893, 198711, 'Jennifer Whisenhunt', 3290773, date('05/02/2025')),
(894, 198711, 'Jennifer Whisenhunt', 3226272, date('11/13/2024')),
(895, 198711, 'Jennifer Whisenhunt', 1385655, date('11/07/2024')),
(896, 198711, 'Jennifer Whisenhunt', 3229943, date('05/03/2025')),
(897, 198711, 'Jennifer Whisenhunt', 3292617, date('11/01/2024')),
(898, 198711, 'Jennifer Whisenhunt', 3291909, date('11/28/2024')),
(899, 198711, 'Jennifer Whisenhunt', 3291418, date('01/03/2025')),
(900, 198711, 'Jennifer Whisenhunt', 3290940, date('11/08/2024')),
(901, 198711, 'Jennifer Whisenhunt', 3226720, date('11/13/2024')),
(902, 198711, 'Jennifer Whisenhunt', 3225410, date('12/19/2024')),
(903, 198711, 'Jennifer Whisenhunt', 3230224, date('01/08/2025')),
(904, 198711, 'Jennifer Whisenhunt', 1266417, date('12/14/2024')),
(905, 198711, 'Jennifer Whisenhunt', 3288567, date('11/07/2024')),
(906, 198711, 'Jennifer Whisenhunt', 1267332, date('11/28/2024')),
(907, 198711, 'Jennifer Whisenhunt', 1266702, date('11/07/2024')),
(908, 198711, 'Jennifer Whisenhunt', 1318473, date('11/07/2024')),
(909, 198711, 'Jennifer Whisenhunt', 3320888, date('11/08/2024')),
(910, 198711, 'Jennifer Whisenhunt', 3319896, date('11/15/2024')),
(911, 198711, 'Jennifer Whisenhunt', 3175628, date('05/28/2025')),
(912, 198711, 'Jennifer Whisenhunt', 3321932, date('02/14/2025')),
(913, 198711, 'Jennifer Whisenhunt', 3230310, date('11/07/2024')),
(914, 198711, 'Jennifer Whisenhunt', 3229095, date('12/04/2024')),
(915, 198711, 'Jennifer Whisenhunt', 3321447, date('12/11/2024')),
(916, 198711, 'Jennifer Whisenhunt', 3321250, date('11/28/2024')),
(917, 198711, 'Jennifer Whisenhunt', 3320377, date('12/31/2024')),
(918, 198711, 'Jennifer Whisenhunt', 1318331, date('07/18/2025')),
(919, 198711, 'Jennifer Whisenhunt', 3129918, date('11/07/2024')),
(920, 198711, 'Jennifer Whisenhunt', 3114611, date('12/10/2024')),
(921, 198711, 'Jennifer Whisenhunt', 3109329, date('11/01/2024')),
(922, 198711, 'Jennifer Whisenhunt', 3173593, date('12/28/2024')),
(923, 198711, 'Jennifer Whisenhunt', 3105477, date('11/05/2024')),
(924, 198711, 'Jennifer Whisenhunt', 3120574, date('04/29/2025')),
(925, 198711, 'Jennifer Whisenhunt', 1386387, date('04/15/2025')),
(926, 198711, 'Jennifer Whisenhunt', 3292527, date('01/04/2025')),
(927, 198711, 'Jennifer Whisenhunt', 3292475, date('11/01/2024')),
(928, 198711, 'Jennifer Whisenhunt', 1384198, date('12/20/2024')),
(929, 198711, 'Jennifer Whisenhunt', 3291449, date('05/07/2025')),
(930, 198711, 'Jennifer Whisenhunt', 1378525, date('12/10/2024')),
(931, 198711, 'Jennifer Whisenhunt', 1380347, date('11/19/2024')),
(932, 198711, 'Jennifer Whisenhunt', 1266852, date('11/28/2024')),
(933, 198711, 'Jennifer Whisenhunt', 1325545, date('03/28/2025')),
(934, 198711, 'Jennifer Whisenhunt', 1384496, date('12/19/2024')),
(935, 198711, 'Jennifer Whisenhunt', 1318544, date('02/27/2025')),
(936, 198711, 'Jennifer Whisenhunt', 3289986, date('11/28/2024')),
(937, 198711, 'Jennifer Whisenhunt', 3290176, date('11/03/2024')),
(938, 198711, 'Jennifer Whisenhunt', 3289070, date('01/22/2025')),
(939, 198711, 'Jennifer Whisenhunt', 1321053, date('11/01/2024')),
(940, 198711, 'Jennifer Whisenhunt', 1265634, date('11/01/2024')),
(941, 198711, 'Jennifer Whisenhunt', 1326111, date('12/03/2024')),
(942, 198711, 'Jennifer Whisenhunt', 1320037, date('01/07/2025')),
(943, 198711, 'Jennifer Whisenhunt', 1319072, date('02/13/2025')),
(944, 198711, 'Jennifer Whisenhunt', 3291656, date('12/03/2024')),
(945, 198711, 'Jennifer Whisenhunt', 3290444, date('03/27/2025')),
(946, 198711, 'Jennifer Whisenhunt', 3120695, date('11/07/2024')),
(947, 198711, 'Jennifer Whisenhunt', 3120548, date('11/21/2024')),
(948, 198711, 'Jennifer Whisenhunt', 3172599, date('11/30/2024')),
(949, 198711, 'Jennifer Whisenhunt', 3176263, date('12/02/2024')),
(950, 198711, 'Jennifer Whisenhunt', 3174830, date('11/23/2024')),
(951, 198711, 'Jennifer Whisenhunt', 3320562, date('01/10/2025')),
(952, 198711, 'Jennifer Whisenhunt', 3109390, date('11/07/2024')),
(953, 198711, 'Jennifer Whisenhunt', 1228376, date('04/15/2025')),
(954, 198711, 'Jennifer Whisenhunt', 1196863, date('01/11/2025')),
(955, 198711, 'Jennifer Whisenhunt', 3109239, date('12/20/2024')),
(956, 198711, 'Jennifer Whisenhunt', 3108232, date('11/07/2024')),
(957, 198711, 'Jennifer Whisenhunt', 1210459, date('11/14/2024')),
(958, 198711, 'Jennifer Whisenhunt', 3227201, date('11/13/2024')),
(959, 198711, 'Jennifer Whisenhunt', 3321790, date('04/17/2025')),
(960, 198711, 'Jennifer Whisenhunt', 3230929, date('12/19/2024')),
(961, 198711, 'Jennifer Whisenhunt', 1322118, date('11/07/2024')),
(962, 198711, 'Jennifer Whisenhunt', 1325932, date('11/05/2024')),
(963, 198711, 'Jennifer Whisenhunt', 1139328, date('11/30/2024')),
(964, 198711, 'Jennifer Whisenhunt', 3230913, date('11/08/2024')),
(965, 198711, 'Jennifer Whisenhunt', 3227463, date('08/13/2025')),
(966, 198711, 'Jennifer Whisenhunt', 3107553, date('12/12/2024')),
(967, 198711, 'Jennifer Whisenhunt', 3226469, date('11/13/2024')),
(968, 198711, 'Jennifer Whisenhunt', 3225680, date('12/19/2024')),
(969, 198711, 'Jennifer Whisenhunt', 3106871, date('11/07/2024')),
(970, 198711, 'Jennifer Whisenhunt', 3107850, date('12/04/2024')),
(971, 198711, 'Jennifer Whisenhunt', 3229046, date('11/12/2024')),
(972, 198711, 'Jennifer Whisenhunt', 3292745, date('01/25/2025')),
(973, 198711, 'Jennifer Whisenhunt', 3290790, date('02/20/2025')),
(974, 198711, 'Jennifer Whisenhunt', 3290273, date('11/28/2024')),
(975, 198711, 'Jennifer Whisenhunt', 1318917, date('11/09/2024')),
(976, 198711, 'Jennifer Whisenhunt', 3179108, date('11/07/2024')),
(977, 198711, 'Jennifer Whisenhunt', 3231591, date('11/16/2024')),
(978, 198711, 'Jennifer Whisenhunt', 3227817, date('11/01/2024')),
(979, 198711, 'Jennifer Whisenhunt', 3108670, date('01/15/2025')),
(980, 198711, 'Jennifer Whisenhunt', 3292730, date('08/14/2025')),
(981, 198711, 'Jennifer Whisenhunt', 3321730, date('11/15/2024')),
(982, 198711, 'Jennifer Whisenhunt', 1386347, date('11/09/2024')),
(983, 198711, 'Jennifer Whisenhunt', 1384309, date('04/29/2025')),
(984, 198711, 'Jennifer Whisenhunt', 3292077, date('12/24/2024')),
(985, 198711, 'Jennifer Whisenhunt', 1385746, date('11/28/2024')),
(986, 198711, 'Jennifer Whisenhunt', 3232624, date('11/05/2024')),
(987, 198711, 'Jennifer Whisenhunt', 3230808, date('12/18/2024')),
(988, 198711, 'Jennifer Whisenhunt', 3229264, date('11/21/2024')),
(989, 198711, 'Jennifer Whisenhunt', 1385611, date('12/03/2024')),
(990, 198711, 'Jennifer Whisenhunt', 1319346, date('01/22/2025')),
(991, 198711, 'Jennifer Whisenhunt', 3290220, date('11/13/2024')),
(992, 198711, 'Jennifer Whisenhunt', 3290000, date('11/07/2024')),
(993, 198711, 'Jennifer Whisenhunt', 3289878, date('11/19/2024')),
(994, 198711, 'Jennifer Whisenhunt', 3289819, date('11/16/2024')),
(995, 198711, 'Jennifer Whisenhunt', 3288881, date('12/19/2024')),
(996, 198711, 'Jennifer Whisenhunt', 3129941, date('12/30/2024')),
(997, 198711, 'Jennifer Whisenhunt', 3172382, date('11/02/2024')),
(998, 198711, 'Jennifer Whisenhunt', 1386279, date('01/31/2025')),
(999, 198711, 'Jennifer Whisenhunt', 1269415, date('11/28/2024')),
(1000, 198711, 'Jennifer Whisenhunt', 3229972, date('02/11/2025')),
(1001, 198711, 'Jennifer Whisenhunt', 3171748, date('01/05/2025')),
(1002, 198711, 'Jennifer Whisenhunt', 3171745, date('11/07/2024')),
(1003, 198711, 'Jennifer Whisenhunt', 3172355, date('12/24/2024')),
(1004, 198711, 'Jennifer Whisenhunt', 3171876, date('01/22/2025')),
(1005, 198711, 'Jennifer Whisenhunt', 3228570, date('11/01/2024')),
(1006, 198711, 'Jennifer Whisenhunt', 3171603, date('01/03/2025')),
(1007, 198711, 'Jennifer Whisenhunt', 1198774, date('01/31/2025')),
(1008, 198711, 'Jennifer Whisenhunt', 1319759, date('11/09/2024')),
(1009, 198711, 'Jennifer Whisenhunt', 1140507, date('11/07/2024')),
(1010, 198711, 'Jennifer Whisenhunt', 1318941, date('12/05/2024')),
(1011, 198711, 'Jennifer Whisenhunt', 3230557, date('08/15/2025')),
(1012, 198711, 'Jennifer Whisenhunt', 3108446, date('11/14/2024')),
(1013, 198711, 'Jennifer Whisenhunt', 3107447, date('07/02/2025')),
(1014, 198711, 'Jennifer Whisenhunt', 3109463, date('11/14/2024')),
(1015, 198711, 'Jennifer Whisenhunt', 3108679, date('11/15/2024')),
(1016, 198711, 'Jennifer Whisenhunt', 3320765, date('12/31/2024')),
(1017, 198711, 'Jennifer Whisenhunt', 3130270, date('01/10/2025')),
(1018, 198711, 'Jennifer Whisenhunt', 3126330, date('04/04/2025')),
(1019, 198711, 'Jennifer Whisenhunt', 3109456, date('01/18/2025')),
(1020, 198711, 'Jennifer Whisenhunt', 3173968, date('12/03/2024')),
(1021, 198711, 'Jennifer Whisenhunt', 3171900, date('11/20/2024')),
(1022, 198711, 'Jennifer Whisenhunt', 3110347, date('07/04/2025')),
(1023, 198711, 'Jennifer Whisenhunt', 1230366, date('01/31/2025')),
(1024, 198711, 'Jennifer Whisenhunt', 1230344, date('11/09/2024')),
(1025, 198711, 'Jennifer Whisenhunt', 3178226, date('11/01/2024')),
(1026, 198711, 'Jennifer Whisenhunt', 1269365, date('12/28/2024')),
(1027, 198711, 'Jennifer Whisenhunt', 3106695, date('11/28/2024')),
(1028, 198711, 'Jennifer Whisenhunt', 3294228, date('01/10/2025')),
(1029, 198711, 'Jennifer Whisenhunt', 3174770, date('11/28/2024')),
(1030, 198711, 'Jennifer Whisenhunt', 3172761, date('12/13/2024')),
(1031, 198711, 'Jennifer Whisenhunt', 3173490, date('11/14/2024')),
(1032, 198711, 'Jennifer Whisenhunt', 3231216, date('11/12/2024')),
(1033, 198711, 'Jennifer Whisenhunt', 1384581, date('04/25/2025')),
(1034, 198711, 'Jennifer Whisenhunt', 1230424, date('12/05/2024')),
(1035, 198711, 'Jennifer Whisenhunt', 1384616, date('12/05/2024')),
(1036, 198711, 'Jennifer Whisenhunt', 1385022, date('11/21/2024')),
(1037, 198711, 'Jennifer Whisenhunt', 3173938, date('11/28/2024')),
(1038, 198711, 'Jennifer Whisenhunt', 3129636, date('01/11/2025')),
(1039, 198711, 'Jennifer Whisenhunt', 1382711, date('12/05/2024')),
(1040, 198711, 'Jennifer Whisenhunt', 1367336, date('01/14/2025')),
(1041, 198711, 'Jennifer Whisenhunt', 3321513, date('06/14/2025')),
(1042, 198711, 'Jennifer Whisenhunt', 1332355, date('11/15/2024')),
(1043, 198711, 'Jennifer Whisenhunt', 1200555, date('04/29/2025')),
(1044, 198711, 'Jennifer Whisenhunt', 3108683, date('12/12/2024')),
(1045, 198711, 'Jennifer Whisenhunt', 1320894, date('11/19/2024')),
(1046, 198711, 'Jennifer Whisenhunt', 1318037, date('11/07/2024')),
(1047, 198711, 'Jennifer Whisenhunt', 1380454, date('11/23/2024')),
(1048, 198711, 'Jennifer Whisenhunt', 3106876, date('11/15/2024')),
(1049, 198711, 'Jennifer Whisenhunt', 1371469, date('11/28/2024')),
(1050, 198711, 'Jennifer Whisenhunt', 1380215, date('02/27/2025')),
(1051, 198711, 'Jennifer Whisenhunt', 1319465, date('12/25/2024')),
(1052, 198711, 'Jennifer Whisenhunt', 3322065, date('12/13/2024')),
(1053, 198711, 'Jennifer Whisenhunt', 1265445, date('11/01/2024')),
(1054, 198711, 'Jennifer Whisenhunt', 1321755, date('11/19/2024')),
(1055, 198711, 'Jennifer Whisenhunt', 1267950, date('11/02/2024')),
(1056, 198711, 'Jennifer Whisenhunt', 1265371, date('11/01/2024')),
(1057, 198711, 'Jennifer Whisenhunt', 1386290, date('11/16/2024')),
(1058, 198711, 'Jennifer Whisenhunt', 1265564, date('11/13/2024')),
(1059, 198711, 'Jennifer Whisenhunt', 1265070, date('01/18/2025')),
(1060, 198711, 'Jennifer Whisenhunt', 3172716, date('11/07/2024')),
(1061, 198711, 'Jennifer Whisenhunt', 1229956, date('12/03/2024')),
(1062, 198711, 'Jennifer Whisenhunt', 1208988, date('11/01/2024')),
(1063, 198711, 'Jennifer Whisenhunt', 1138446, date('03/14/2025')),
(1064, 198711, 'Jennifer Whisenhunt', 1197942, date('11/28/2024')),
(1065, 198711, 'Jennifer Whisenhunt', 1201496, date('12/13/2024')),
(1066, 198711, 'Jennifer Whisenhunt', 1179209, date('11/28/2024')),
(1067, 198711, 'Jennifer Whisenhunt', 3127809, date('11/01/2024')),
(1068, 198711, 'Jennifer Whisenhunt', 3334158, date('01/25/2025')),
(1069, 198711, 'Jennifer Whisenhunt', 1035208, date('03/21/2025')),
(1070, 198711, 'Jennifer Whisenhunt', 3320273, date('07/17/2025')),
(1071, 198711, 'Jennifer Whisenhunt', 1362713, date('11/02/2024')),
(1072, 198711, 'Jennifer Whisenhunt', 1265632, date('11/28/2024')),
(1073, 198711, 'Jennifer Whisenhunt', 1095989, date('11/28/2024')),
(1074, 198711, 'Jennifer Whisenhunt', 1228792, date('01/09/2025')),
(1075, 198711, 'Jennifer Whisenhunt', 3292443, date('11/01/2024')),
(1076, 198711, 'Jennifer Whisenhunt', 3292405, date('01/04/2025')),
(1077, 198711, 'Jennifer Whisenhunt', 3229281, date('11/07/2024')),
(1078, 198711, 'Jennifer Whisenhunt', 3107801, date('11/07/2024')),
(1079, 198711, 'Jennifer Whisenhunt', 1266111, date('11/14/2024')),
(1080, 198711, 'Jennifer Whisenhunt', 3293032, date('11/08/2024')),
(1081, 198711, 'Jennifer Whisenhunt', 1268316, date('12/30/2024')),
(1082, 198711, 'Jennifer Whisenhunt', 3228116, date('04/12/2025')),
(1083, 198711, 'Jennifer Whisenhunt', 3292276, date('01/23/2025')),
(1084, 198711, 'Jennifer Whisenhunt', 3290328, date('11/16/2024')),
(1085, 198711, 'Jennifer Whisenhunt', 3290271, date('01/07/2025')),
(1086, 198711, 'Jennifer Whisenhunt', 1266877, date('11/21/2024')),
(1087, 198711, 'Jennifer Whisenhunt', 1266612, date('11/01/2024')),
(1088, 198711, 'Jennifer Whisenhunt', 3174583, date('11/08/2024')),
(1089, 198711, 'Jennifer Whisenhunt', 3173964, date('12/28/2024')),
(1090, 198711, 'Jennifer Whisenhunt', 1179415, date('11/01/2024')),
(1091, 198711, 'Jennifer Whisenhunt', 1177256, date('11/12/2024')),
(1092, 198711, 'Jennifer Whisenhunt', 1385274, date('01/08/2025')),
(1093, 198711, 'Jennifer Whisenhunt', 1380251, date('07/25/2025')),
(1094, 198711, 'Jennifer Whisenhunt', 1231022, date('11/09/2024')),
(1095, 198711, 'Jennifer Whisenhunt', 1267673, date('11/19/2024')),
(1096, 198711, 'Jennifer Whisenhunt', 1265052, date('07/29/2025')),
(1097, 198711, 'Jennifer Whisenhunt', 1179942, date('12/10/2024')),
(1098, 198711, 'Jennifer Whisenhunt', 3229662, date('11/09/2024')),
(1099, 198711, 'Jennifer Whisenhunt', 3228806, date('11/07/2024')),
(1100, 198711, 'Jennifer Whisenhunt', 3226769, date('01/15/2025')),
(1101, 198711, 'Jennifer Whisenhunt', 3225881, date('12/05/2024')),
(1102, 198711, 'Jennifer Whisenhunt', 1086619, date('11/13/2024')),
(1103, 198711, 'Jennifer Whisenhunt', 3232722, date('01/09/2025')),
(1104, 198711, 'Jennifer Whisenhunt', 3321945, date('11/06/2024')),
(1105, 198711, 'Jennifer Whisenhunt', 3321139, date('11/20/2024')),
(1106, 198711, 'Jennifer Whisenhunt', 3294033, date('02/26/2025'))
--Raw Data <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
)
--	(SeqNum, HDTNum, Requester, Loan, NewTiAanalysis, CurTiAanalysis, ChangeNeeded)
SELECT 
		P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.NewDate ,
		TT.OCCLASTKNOWNOCCDATE AS "CurLastKnown",
		--UU.	BTNOCCUPCERTRECEIVED "CertCheck",
		--UU.DTMOCCUPCERTDATERECEIVED "CuCertDate",
		case when date(P.NewDate) = COALESCE(cast(TT.OCCLASTKNOWNOCCDATE as varchar(20)), date('2999-01-01')) then 0 else -1 end as ChangeNeeded_LastKnown
from param P 
left outer join CELINK.TBLOCCUPANCY TT
on    P.Loan = TT.OCCLOANNUMBER
left outer join CELINK.TBLBORROWER UU
on    P.Loan = UU.INTSUBSERVICERLOANNUMBER 
Order by P.SeqNum
with UR;
-- SEQNUM HDTNUM REQUESTER           LOAN    NEWDATE    CurLastKnown CertCheck CuCertDate CHANGENEEDED_LASTKNOWN
-- ------ ------ ------------------- ------- ---------- ------------ --------- ---------- ----------------------

		-- data check
		select * from DATAUPDT.HDTDataUpdt_TnIdata_SA order by seqnum;   -- we change all ... see backup C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTBackup 198711-2.csv
		-- SEQNUM HDTNUM REQUESTER           LOAN    NEWTIAANALYSIS CURTIAANALYSIS CHANGENEEDED NEWNOTES
		-- ------ ------ ------------------- ------- -------------- -------------- ------------ --------
		
		select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded =  0 order by seqnum;  -- -- effective when creating note -- 0
		-- SEQNUM HDTNUM REQUESTER           LOAN    NEWTIAANALYSIS CURTIAANALYSIS CHANGENEEDED NEWNOTES
		-- ------ ------ ------------------- ------- -------------- -------------- ------------ --------


		select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded = -1 order by seqnum;  -- -- effective when creating note -- 287
		
		select
			SeqNum, HDTNum, Requester, Loan, 
			NewTiAanalysis "NewDate",
			CurTiAanalysis "CurLasKnown",
			ChangeNeeded
		from DATAUPDT.HDTDataUpdt_TnIdata_SA 
		where ChangeNeeded = -1 -- effective when creating note -- 
		order by seqnum;  
		--1106 all
		-- SEQNUM HDTNUM REQUESTER           LOAN    NewDate    CurLasKnown CHANGENEEDED
		-- ------ ------ ------------------- ------- ---------- ----------- ------------
		--      1 198711 Jennifer Whisenhunt 3321982 2024-11-19 2024-12-05            -1
		--      2 198711 Jennifer Whisenhunt 3292118 2024-11-07 2024-11-01            -1
		--      3 198711 Jennifer Whisenhunt 3291100 2024-11-07 2024-11-12            -1
		--      4 198711 Jennifer Whisenhunt 3230134 2024-11-21 2024-11-07            -1
		--      5 198711 Jennifer Whisenhunt 3228818 2024-11-14 2025-01-07            -1
		--      6 198711 Jennifer Whisenhunt 1319944 2024-11-07 2024-12-04            -1
		--      7 198711 Jennifer Whisenhunt 1269211 2024-11-07 2024-11-13            -1
		--      8 198711 Jennifer Whisenhunt 3321251 2024-11-21 2025-08-19            -1
		--      9 198711 Jennifer Whisenhunt 3292844 2024-11-13 2024-11-07            -1

		
/* backup
 SEQNUM HDTNUM REQUESTER           LOAN    NEWTIAANALYSIS CURTIAANALYSIS CHANGENEEDED NEWNOTES
 ------ ------ ------------------- ------- -------------- -------------- ------------ --------

*/		


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- note string creation
select
--P.SeqNum,P.ChangeNeeded,
'(' 
|| P.Loan
|| ', ' || '''Per HDT ' || P.HDTNum || '-2 Occupancy Cerificated Received Check added and Date udpated from <blank> to ' || cast(P.NewTiAanalysis as varchar(20)) || '. '
||
case when ChangeNeeded = 0
then ''
else 
' Occupancy Last Known Date from '  || COALESCE(cast(P.CurTiAanalysis as varchar(50)), '<Blank>') || ' to ' || P.NewTiAanalysis || '.'
end

|| '''' || ', ' 
|| 'CURRENT_TIMESTAMP, ''tkato'', 0, 0),' as "NoteString"
	
from 
(
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.NewTiAanalysis , P.CurTiAanalysis,P.ChangeNeeded,
	TT.OCCLASTKNOWNOCCDATE AS "CurLastKnown",
	UU.	BTNOCCUPCERTRECEIVED "CertCheck",
	UU.DTMOCCUPCERTDATERECEIVED "CuCertDate"
from DATAUPDT.HDTDataUpdt_TnIdata_SA  P 
left outer join CELINK.TBLOCCUPANCY TT
on    P.Loan = TT.OCCLOANNUMBER
left outer join CELINK.TBLBORROWER UU
on    P.Loan = UU.INTSUBSERVICERLOANNUMBER 
Order by P.SeqNum
)P 
for read only with ur
;
/*
--note val
 NoteString
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 (3321982, 'Per HDT 198711-2 Occupancy Cerificated Received Check added and Date udpated from <blank> to 2024-11-19.  Occupancy Last Known Date from 2024-12-05 to 2024-11-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0),
 (3292118, 'Per HDT 198711-2 Occupancy Cerificated Received Check added and Date udpated from <blank> to 2024-11-07.  Occupancy Last Known Date from 2024-11-01 to 2024-11-07.', CURRENT_TIMESTAMP, 'tkato', 0, 0),
 (3291100, 'Per HDT 198711-2 Occupancy Cerificated Received Check added and Date udpated from <blank> to 2024-11-07.  Occupancy Last Known Date from 2024-11-12 to 2024-11-07.', CURRENT_TIMESTAMP, 'tkato', 0, 0),
 (3230134, 'Per HDT 198711-2 Occupancy Cerificated Received Check added and Date udpated from <blank> to 2024-11-21.  Occupancy Last Known Date from 2024-11-07 to 2024-11-21.', CURRENT_TIMESTAMP, 'tkato', 0, 0),
 (3228818, 'Per HDT 198711-2 Occupancy Cerificated Received Check added and Date udpated from <blank> to 2024-11-14.  Occupancy Last Known Date from 2025-01-07 to 2024-11-14.', CURRENT_TIMESTAMP, 'tkato', 0, 0),
 (1319944, 'Per HDT 198711-2 Occupancy Cerificated Received Check added and Date udpated from <blank> to 2024-11-07.  Occupancy Last Known Date from 2024-12-04 to 2024-11-07.', CURRENT_TIMESTAMP, 'tkato', 0, 0),

*/

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- updateeeee  Last KNown Date
MERGE INTO celink.TBLOCCUPANCY TT
USING
	(

	select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where NewTiAanalysis <> date ('2999-01-01')	
	and   ChangeNeeded = -1 --1106
	order by SeqNum
	
	) 
	UY (SeqNum,	HDTNum,	Requester, Loan, NewDate, ChangeNeeded)
	ON Loan = TT.OCCLOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
TT.OCCLASTKNOWNOCCDATE =  UY.NewDate
;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- updateeeee  Cert Rcvd Date and Check mark
--MERGE INTO CELINK.TBLBORROWER UU
--USING
--	(
--
--	select
--	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded
--	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
--	where NewTiAanalysis <> date ('2999-01-01')	
--	order by SeqNum
--	
--	) 
--	UY (SeqNum,	HDTNum,	Requester, Loan, NewDate, ChangeNeeded)
--	ON Loan = UU.INTSUBSERVICERLOANNUMBER
--WHEN MATCHED THEN UPDATE 
--Set
--UU.BTNOCCUPCERTRECEIVED = -1,
--UU.DTMOCCUPCERTDATERECEIVED =  UY.NewDate
--;


	----------------------------------------------------------------------------------------------
	-- test Borr
	select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded,
	UU.BTNOCCUPCERTRECEIVED,
	UU.DTMOCCUPCERTDATERECEIVED,
	case when date(UY.NewTiAanalysis) = COALESCE(cast(UU.DTMOCCUPCERTDATERECEIVED as varchar(20)), date('2999-01-01')) then 0 else -1 end as ChangeNeeded_Borr

	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	inner join CELINK.TBLBORROWER UU
	on  UY.Loan = UU.INTSUBSERVICERLOANNUMBER
	where NewTiAanalysis <> date ('2999-01-01')	
	and case when date(UY.NewTiAanalysis) = COALESCE(cast(UU.DTMOCCUPCERTDATERECEIVED as varchar(20)), date('2999-01-01')) then 0 else -1 end = -1

	order by SeqNum
	;

-- C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTBackup 198711-2_tblBorrower.csv
-- SEQNUM HDTNUM REQUESTER           LOAN    NEWTIAANALYSIS CHANGENEEDED BTNOCCUPCERTRECEIVED DTMOCCUPCERTDATERECEIVED CHANGENEEDED_BORR
-- ------ ------ ------------------- ------- -------------- ------------ -------------------- ------------------------ -----------------
--      1 198711 Jennifer Whisenhunt 3321982 2024-11-19               -1                   -1 2024-12-05 00:00:00.0                   -1
--      2 198711 Jennifer Whisenhunt 3292118 2024-11-07               -1                   -1 2024-11-01 00:00:00.0                   -1
--      3 198711 Jennifer Whisenhunt 3291100 2024-11-07               -1                   -1 2024-11-12 00:00:00.0                   -1
--      4 198711 Jennifer Whisenhunt 3230134 2024-11-21               -1                   -1 2024-11-07 00:00:00.0                   -1
--      5 198711 Jennifer Whisenhunt 3228818 2024-11-14               -1                   -1 2025-01-07 00:00:00.0                   -1
--      6 198711 Jennifer Whisenhunt 1319944 2024-11-07               -1                   -1 2024-12-04 00:00:00.0                   -1
--      7 198711 Jennifer Whisenhunt 1269211 2024-11-07               -1                   -1 2024-11-13 00:00:00.0                   -1
--      8 198711 Jennifer Whisenhunt 3321251 2024-11-21               -1                   -1 2025-08-19 00:00:00.0                   -1
--      9 198711 Jennifer Whisenhunt 3292844 2024-11-13               -1                   -1 2024-11-07 00:00:00.0                   -1
--   

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- updateeeee  Cert Rcvd Date and Check mark
MERGE INTO CELINK.TBLBORROWER UU
USING
(
	select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded
	--,
	--UU.BTNOCCUPCERTRECEIVED,
	--UU.DTMOCCUPCERTDATERECEIVED,
	--case when date(UY.NewTiAanalysis) = COALESCE(cast(UU.DTMOCCUPCERTDATERECEIVED as varchar(20)), date('2999-01-01')) then 0 else -1 end as ChangeNeeded_Borr

	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	inner join CELINK.TBLBORROWER UU
	on  UY.Loan = UU.INTSUBSERVICERLOANNUMBER
	where NewTiAanalysis <> date ('2999-01-01')	
	and case when date(UY.NewTiAanalysis) = COALESCE(cast(UU.DTMOCCUPCERTDATERECEIVED as varchar(20)), date('2999-01-01')) then 0 else -1 end = -1
	order by SeqNum

--	select
--	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded
--	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
--	where NewTiAanalysis <> date ('2999-01-01')	
--	order by SeqNum

) 
UY (SeqNum,	HDTNum,	Requester, Loan, NewDate, ChangeNeeded)
ON Loan = UU.INTSUBSERVICERLOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
UU.BTNOCCUPCERTRECEIVED = -1,
UU.DTMOCCUPCERTDATERECEIVED =  UY.NewDate
;

-- validation after
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.NewTiAanalysis , P.CurTiAanalysis,P.ChangeNeeded,
	TT.OCCLASTKNOWNOCCDATE AS "CurLastKnown",
	UU.	BTNOCCUPCERTRECEIVED  "CertCheck",
	UU.DTMOCCUPCERTDATERECEIVED "CuCertDate"
from DATAUPDT.HDTDataUpdt_TnIdata_SA  P 
left outer join CELINK.TBLOCCUPANCY TT
on    P.Loan = TT.OCCLOANNUMBER
left outer join CELINK.TBLBORROWER UU
on    P.Loan = UU.INTSUBSERVICERLOANNUMBER 
Order by P.SeqNum
;
-- SEQNUM HDTNUM REQUESTER           LOAN    NEWTIAANALYSIS CURTIAANALYSIS CHANGENEEDED CurLastKnown CertCheck CuCertDate
-- ------ ------ ------------------- ------- -------------- -------------- ------------ ------------ --------- ---------------------
--      1 195995 Jennifer Whisenhunt 3318433 2024-11-28     NULL                     -1 2024-11-28          -1 2024-11-28 00:00:00.0
--      2 195995 Jennifer Whisenhunt 3223466 2024-10-30     2021-08-20               -1 2024-10-30          -1 2024-10-30 00:00:00.0
--      3 195995 Jennifer Whisenhunt 1226337 2024-10-16     2023-12-19               -1 2024-10-16          -1 2024-10-16 00:00:00.0
--      4 195995 Jennifer Whisenhunt 3220318 2025-05-23     2023-01-24               -1 2025-05-23          -1 2025-05-23 00:00:00.0
--      5 195995 Jennifer Whisenhunt 3170011 2025-04-16     2025-04-16                0 2025-04-16          -1 2025-04-16 00:00:00.0
--      6 195995 Jennifer Whisenhunt 3167910 2025-07-17     2020-08-05               -1 2025-07-17          -1 2025-07-17 00:00:00.0
--      7 195995 Jennifer Whisenhunt 3107879 2024-10-05     2019-08-23               -1 2024-10-05          -1 2024-10-05 00:00:00.0
--      8 195995 Jennifer Whisenhunt 1383356 2025-04-15     2022-05-09               -1 2025-04-15          -1 2025-04-15 00:00:00.0
--      9 195995 Jennifer Whisenhunt 1175804 2024-10-22     2024-10-17               -1 2024-10-22          -1 2024-10-22 00:00:00.0
--     10 195995 Jennifer Whisenhunt 3291850 2024-12-31     2022-08-31               -1 2024-12-31          -1 2024-12-31 00:00:00.0
--     11 195995 Jennifer Whisenhunt 3290054 2024-10-16     2022-08-31               -1 2024-10-16          -1 2024-10-16 00:00:00.0
--     12 195995 Jennifer Whisenhunt 3288290 2024-10-26     2022-08-31               -1 2024-10-26          -1 2024-10-26 00:00:00.0
--     13 195995 Jennifer Whisenhunt 1315475 2024-11-28     2023-11-25               -1 2024-11-28          -1 2024-11-28 00:00:00.0
--     14 195995 Jennifer Whisenhunt 3222066 2024-11-07     2021-08-16               -1 2024-11-07          -1 2024-11-07 00:00:00.0
--     15 195995 Jennifer Whisenhunt 3171622 2025-07-30     2025-07-22               -1 2025-07-30          -1 2025-07-30 00:00:00.0
--     16 195995 Jennifer Whisenhunt 3169929 2024-10-04     2020-08-21               -1 2024-10-04          -1 2024-10-04 00:00:00.0


/*
----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter ,,, plug in valeus fro -- Note Insert Value Creastion
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, StepNum) as
(values
--copy values from backed up SS
)  
select * from P
;
*/

--end
