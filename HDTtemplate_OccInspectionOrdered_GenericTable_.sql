/*
20230302
C:\Users\ted.kato\Documents\HDTUpdtNotes_ 122307 .csv
C:\Users\ted.kato\Documents\HDTAnalysis_ .csv
C:\Users\ted.kato\Documents\HDTValidation_ .csv
C:\Users\ted.kato\Documents\HDTBackup_  .txt

HDT122379_OccInspectionOrdered_GenericTable.sql

INCIDENT #122379
Abraham Perez
Supervisor, Occupancy Oversight
Other
Created: Mar 02, 2023 at 7:59 PM by Abraham Perez
Please see attached report with all Celink numbers that need to have 3/02/2023 entered into ‘Property Inspection ordered’ field.
***Also, If there is already a date (old date), please replace the date with 3/02/2023.

Inspections 3.02.202...xlsx ,,, 2093

="(" & B2 & ", 122379, 'Abraham Perez', " & D2 & ", '2023-03-02'),"


--*-- comment would be ....
"Property Inspection ordered" date updated for 702 loans.  Peer review pending.
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250910
[ID:0199106] Property Inspection Order date 9/10/2025 11:27 AM Abraham Perez
Hello,
Please see attached report with all Celink numbers that need to have 9/10/2025 entered into ‘Property Inspection ordered’ field.
***Also, If there is already a date (old date), please replace the date with 9/10/2025.
="(" & B2 & ", 0199106, 'Abraham Perez', " & D2 & ", date('09/10/2025')),"
"Property Inspection ordered" date updated for 880 loans.  Peer review pending.

*/


/* ********************************************************************************************************************** */
-- ref ... view OCCUPANCY 
SELECT 
	OCCUPANCY.OCCLOANNUMBER AS LOANNUMBER, 
	OCCUPANCY.OCCPROPINSPORDEREDDATE AS PropertyInspectionOrdered, --<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	LOANDATA.INTSUBSERVICERLOANNUMBER
FROM CELINK.TBLOCCUPANCY AS OCCUPANCY 
INNER JOIN CELINK.TBLLOANDATA AS LOANDATA 
ON LOANDATA.INTSUBSERVICERLOANNUMBER = OCCUPANCY.OCCLOANNUMBER
; 

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
--	(SeqNum, HDTNum, Requester, Loan, NewTiAanalysis ) as 
	(SeqNum, HDTNum, Requester, Loan, NewDate) as 
	(Values

--Raw Data <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
(1, 0199106, 'Abraham Perez', 90408, date('09/10/2025')),
(2, 0199106, 'Abraham Perez', 90727, date('09/10/2025')),
(3, 0199106, 'Abraham Perez', 1006414, date('09/10/2025')),
(4, 0199106, 'Abraham Perez', 1031481, date('09/10/2025')),
(5, 0199106, 'Abraham Perez', 1092700, date('09/10/2025')),
(6, 0199106, 'Abraham Perez', 1095486, date('09/10/2025')),
(7, 0199106, 'Abraham Perez', 1131380, date('09/10/2025')),
(8, 0199106, 'Abraham Perez', 1132118, date('09/10/2025')),
(9, 0199106, 'Abraham Perez', 1133183, date('09/10/2025')),
(10, 0199106, 'Abraham Perez', 1134158, date('09/10/2025')),
(11, 0199106, 'Abraham Perez', 1172701, date('09/10/2025')),
(12, 0199106, 'Abraham Perez', 1172812, date('09/10/2025')),
(13, 0199106, 'Abraham Perez', 1173116, date('09/10/2025')),
(14, 0199106, 'Abraham Perez', 1173361, date('09/10/2025')),
(15, 0199106, 'Abraham Perez', 1173547, date('09/10/2025')),
(16, 0199106, 'Abraham Perez', 1173790, date('09/10/2025')),
(17, 0199106, 'Abraham Perez', 1173859, date('09/10/2025')),
(18, 0199106, 'Abraham Perez', 1173947, date('09/10/2025')),
(19, 0199106, 'Abraham Perez', 1174009, date('09/10/2025')),
(20, 0199106, 'Abraham Perez', 1174064, date('09/10/2025')),
(21, 0199106, 'Abraham Perez', 1174091, date('09/10/2025')),
(22, 0199106, 'Abraham Perez', 1174144, date('09/10/2025')),
(23, 0199106, 'Abraham Perez', 1174156, date('09/10/2025')),
(24, 0199106, 'Abraham Perez', 1174162, date('09/10/2025')),
(25, 0199106, 'Abraham Perez', 1174218, date('09/10/2025')),
(26, 0199106, 'Abraham Perez', 1174556, date('09/10/2025')),
(27, 0199106, 'Abraham Perez', 1174826, date('09/10/2025')),
(28, 0199106, 'Abraham Perez', 1175872, date('09/10/2025')),
(29, 0199106, 'Abraham Perez', 1175916, date('09/10/2025')),
(30, 0199106, 'Abraham Perez', 1176270, date('09/10/2025')),
(31, 0199106, 'Abraham Perez', 1201252, date('09/10/2025')),
(32, 0199106, 'Abraham Perez', 1201341, date('09/10/2025')),
(33, 0199106, 'Abraham Perez', 1214055, date('09/10/2025')),
(34, 0199106, 'Abraham Perez', 1214140, date('09/10/2025')),
(35, 0199106, 'Abraham Perez', 1221865, date('09/10/2025')),
(36, 0199106, 'Abraham Perez', 1222292, date('09/10/2025')),
(37, 0199106, 'Abraham Perez', 1222490, date('09/10/2025')),
(38, 0199106, 'Abraham Perez', 1223055, date('09/10/2025')),
(39, 0199106, 'Abraham Perez', 1223228, date('09/10/2025')),
(40, 0199106, 'Abraham Perez', 1223600, date('09/10/2025')),
(41, 0199106, 'Abraham Perez', 1223626, date('09/10/2025')),
(42, 0199106, 'Abraham Perez', 1223837, date('09/10/2025')),
(43, 0199106, 'Abraham Perez', 1223864, date('09/10/2025')),
(44, 0199106, 'Abraham Perez', 1224143, date('09/10/2025')),
(45, 0199106, 'Abraham Perez', 1224174, date('09/10/2025')),
(46, 0199106, 'Abraham Perez', 1224254, date('09/10/2025')),
(47, 0199106, 'Abraham Perez', 1224312, date('09/10/2025')),
(48, 0199106, 'Abraham Perez', 1224372, date('09/10/2025')),
(49, 0199106, 'Abraham Perez', 1224477, date('09/10/2025')),
(50, 0199106, 'Abraham Perez', 1224484, date('09/10/2025')),
(51, 0199106, 'Abraham Perez', 1224639, date('09/10/2025')),
(52, 0199106, 'Abraham Perez', 1224782, date('09/10/2025')),
(53, 0199106, 'Abraham Perez', 1224890, date('09/10/2025')),
(54, 0199106, 'Abraham Perez', 1225041, date('09/10/2025')),
(55, 0199106, 'Abraham Perez', 1228321, date('09/10/2025')),
(56, 0199106, 'Abraham Perez', 1258428, date('09/10/2025')),
(57, 0199106, 'Abraham Perez', 1258622, date('09/10/2025')),
(58, 0199106, 'Abraham Perez', 1258723, date('09/10/2025')),
(59, 0199106, 'Abraham Perez', 1258858, date('09/10/2025')),
(60, 0199106, 'Abraham Perez', 1258888, date('09/10/2025')),
(61, 0199106, 'Abraham Perez', 1259072, date('09/10/2025')),
(62, 0199106, 'Abraham Perez', 1259222, date('09/10/2025')),
(63, 0199106, 'Abraham Perez', 1259723, date('09/10/2025')),
(64, 0199106, 'Abraham Perez', 1259918, date('09/10/2025')),
(65, 0199106, 'Abraham Perez', 1260115, date('09/10/2025')),
(66, 0199106, 'Abraham Perez', 1260145, date('09/10/2025')),
(67, 0199106, 'Abraham Perez', 1260265, date('09/10/2025')),
(68, 0199106, 'Abraham Perez', 1260333, date('09/10/2025')),
(69, 0199106, 'Abraham Perez', 1260339, date('09/10/2025')),
(70, 0199106, 'Abraham Perez', 1260350, date('09/10/2025')),
(71, 0199106, 'Abraham Perez', 1260380, date('09/10/2025')),
(72, 0199106, 'Abraham Perez', 1260680, date('09/10/2025')),
(73, 0199106, 'Abraham Perez', 1261116, date('09/10/2025')),
(74, 0199106, 'Abraham Perez', 1261206, date('09/10/2025')),
(75, 0199106, 'Abraham Perez', 1261267, date('09/10/2025')),
(76, 0199106, 'Abraham Perez', 1261777, date('09/10/2025')),
(77, 0199106, 'Abraham Perez', 1262689, date('09/10/2025')),
(78, 0199106, 'Abraham Perez', 1276666, date('09/10/2025')),
(79, 0199106, 'Abraham Perez', 1277822, date('09/10/2025')),
(80, 0199106, 'Abraham Perez', 1307085, date('09/10/2025')),
(81, 0199106, 'Abraham Perez', 1307278, date('09/10/2025')),
(82, 0199106, 'Abraham Perez', 1307462, date('09/10/2025')),
(83, 0199106, 'Abraham Perez', 1307653, date('09/10/2025')),
(84, 0199106, 'Abraham Perez', 1307864, date('09/10/2025')),
(85, 0199106, 'Abraham Perez', 1308126, date('09/10/2025')),
(86, 0199106, 'Abraham Perez', 1308128, date('09/10/2025')),
(87, 0199106, 'Abraham Perez', 1308136, date('09/10/2025')),
(88, 0199106, 'Abraham Perez', 1308192, date('09/10/2025')),
(89, 0199106, 'Abraham Perez', 1308532, date('09/10/2025')),
(90, 0199106, 'Abraham Perez', 1308565, date('09/10/2025')),
(91, 0199106, 'Abraham Perez', 1308788, date('09/10/2025')),
(92, 0199106, 'Abraham Perez', 1308838, date('09/10/2025')),
(93, 0199106, 'Abraham Perez', 1309218, date('09/10/2025')),
(94, 0199106, 'Abraham Perez', 1309542, date('09/10/2025')),
(95, 0199106, 'Abraham Perez', 1309709, date('09/10/2025')),
(96, 0199106, 'Abraham Perez', 1309817, date('09/10/2025')),
(97, 0199106, 'Abraham Perez', 1309924, date('09/10/2025')),
(98, 0199106, 'Abraham Perez', 1310032, date('09/10/2025')),
(99, 0199106, 'Abraham Perez', 1310078, date('09/10/2025')),
(100, 0199106, 'Abraham Perez', 1310202, date('09/10/2025')),
(101, 0199106, 'Abraham Perez', 1310322, date('09/10/2025')),
(102, 0199106, 'Abraham Perez', 1310428, date('09/10/2025')),
(103, 0199106, 'Abraham Perez', 1310658, date('09/10/2025')),
(104, 0199106, 'Abraham Perez', 1310666, date('09/10/2025')),
(105, 0199106, 'Abraham Perez', 1310672, date('09/10/2025')),
(106, 0199106, 'Abraham Perez', 1310680, date('09/10/2025')),
(107, 0199106, 'Abraham Perez', 1310739, date('09/10/2025')),
(108, 0199106, 'Abraham Perez', 1310972, date('09/10/2025')),
(109, 0199106, 'Abraham Perez', 1311195, date('09/10/2025')),
(110, 0199106, 'Abraham Perez', 1311217, date('09/10/2025')),
(111, 0199106, 'Abraham Perez', 1311232, date('09/10/2025')),
(112, 0199106, 'Abraham Perez', 1311242, date('09/10/2025')),
(113, 0199106, 'Abraham Perez', 1311410, date('09/10/2025')),
(114, 0199106, 'Abraham Perez', 1311501, date('09/10/2025')),
(115, 0199106, 'Abraham Perez', 1311505, date('09/10/2025')),
(116, 0199106, 'Abraham Perez', 1311606, date('09/10/2025')),
(117, 0199106, 'Abraham Perez', 1311609, date('09/10/2025')),
(118, 0199106, 'Abraham Perez', 1312045, date('09/10/2025')),
(119, 0199106, 'Abraham Perez', 1312182, date('09/10/2025')),
(120, 0199106, 'Abraham Perez', 1312403, date('09/10/2025')),
(121, 0199106, 'Abraham Perez', 1312577, date('09/10/2025')),
(122, 0199106, 'Abraham Perez', 1312583, date('09/10/2025')),
(123, 0199106, 'Abraham Perez', 1313148, date('09/10/2025')),
(124, 0199106, 'Abraham Perez', 1313310, date('09/10/2025')),
(125, 0199106, 'Abraham Perez', 1313358, date('09/10/2025')),
(126, 0199106, 'Abraham Perez', 1315851, date('09/10/2025')),
(127, 0199106, 'Abraham Perez', 1315856, date('09/10/2025')),
(128, 0199106, 'Abraham Perez', 1331915, date('09/10/2025')),
(129, 0199106, 'Abraham Perez', 1331919, date('09/10/2025')),
(130, 0199106, 'Abraham Perez', 1331928, date('09/10/2025')),
(131, 0199106, 'Abraham Perez', 1336195, date('09/10/2025')),
(132, 0199106, 'Abraham Perez', 1336355, date('09/10/2025')),
(133, 0199106, 'Abraham Perez', 1363270, date('09/10/2025')),
(134, 0199106, 'Abraham Perez', 1363999, date('09/10/2025')),
(135, 0199106, 'Abraham Perez', 1372325, date('09/10/2025')),
(136, 0199106, 'Abraham Perez', 1372466, date('09/10/2025')),
(137, 0199106, 'Abraham Perez', 1372483, date('09/10/2025')),
(138, 0199106, 'Abraham Perez', 1372621, date('09/10/2025')),
(139, 0199106, 'Abraham Perez', 1372807, date('09/10/2025')),
(140, 0199106, 'Abraham Perez', 1372846, date('09/10/2025')),
(141, 0199106, 'Abraham Perez', 1372856, date('09/10/2025')),
(142, 0199106, 'Abraham Perez', 1372888, date('09/10/2025')),
(143, 0199106, 'Abraham Perez', 1372955, date('09/10/2025')),
(144, 0199106, 'Abraham Perez', 1373117, date('09/10/2025')),
(145, 0199106, 'Abraham Perez', 1373343, date('09/10/2025')),
(146, 0199106, 'Abraham Perez', 1373456, date('09/10/2025')),
(147, 0199106, 'Abraham Perez', 1373620, date('09/10/2025')),
(148, 0199106, 'Abraham Perez', 1373735, date('09/10/2025')),
(149, 0199106, 'Abraham Perez', 1373742, date('09/10/2025')),
(150, 0199106, 'Abraham Perez', 1373818, date('09/10/2025')),
(151, 0199106, 'Abraham Perez', 1373897, date('09/10/2025')),
(152, 0199106, 'Abraham Perez', 1373925, date('09/10/2025')),
(153, 0199106, 'Abraham Perez', 1373943, date('09/10/2025')),
(154, 0199106, 'Abraham Perez', 1374092, date('09/10/2025')),
(155, 0199106, 'Abraham Perez', 1374470, date('09/10/2025')),
(156, 0199106, 'Abraham Perez', 1374518, date('09/10/2025')),
(157, 0199106, 'Abraham Perez', 1374535, date('09/10/2025')),
(158, 0199106, 'Abraham Perez', 1374621, date('09/10/2025')),
(159, 0199106, 'Abraham Perez', 1374640, date('09/10/2025')),
(160, 0199106, 'Abraham Perez', 1374664, date('09/10/2025')),
(161, 0199106, 'Abraham Perez', 1374697, date('09/10/2025')),
(162, 0199106, 'Abraham Perez', 1374704, date('09/10/2025')),
(163, 0199106, 'Abraham Perez', 1374710, date('09/10/2025')),
(164, 0199106, 'Abraham Perez', 1374736, date('09/10/2025')),
(165, 0199106, 'Abraham Perez', 1374768, date('09/10/2025')),
(166, 0199106, 'Abraham Perez', 1374794, date('09/10/2025')),
(167, 0199106, 'Abraham Perez', 1374873, date('09/10/2025')),
(168, 0199106, 'Abraham Perez', 1374978, date('09/10/2025')),
(169, 0199106, 'Abraham Perez', 1375012, date('09/10/2025')),
(170, 0199106, 'Abraham Perez', 1375018, date('09/10/2025')),
(171, 0199106, 'Abraham Perez', 1375344, date('09/10/2025')),
(172, 0199106, 'Abraham Perez', 1375408, date('09/10/2025')),
(173, 0199106, 'Abraham Perez', 1375724, date('09/10/2025')),
(174, 0199106, 'Abraham Perez', 1376081, date('09/10/2025')),
(175, 0199106, 'Abraham Perez', 1376604, date('09/10/2025')),
(176, 0199106, 'Abraham Perez', 1377810, date('09/10/2025')),
(177, 0199106, 'Abraham Perez', 1377829, date('09/10/2025')),
(178, 0199106, 'Abraham Perez', 1379747, date('09/10/2025')),
(179, 0199106, 'Abraham Perez', 1379882, date('09/10/2025')),
(180, 0199106, 'Abraham Perez', 1382363, date('09/10/2025')),
(181, 0199106, 'Abraham Perez', 1382452, date('09/10/2025')),
(182, 0199106, 'Abraham Perez', 1382466, date('09/10/2025')),
(183, 0199106, 'Abraham Perez', 1382502, date('09/10/2025')),
(184, 0199106, 'Abraham Perez', 1413319, date('09/10/2025')),
(185, 0199106, 'Abraham Perez', 1413464, date('09/10/2025')),
(186, 0199106, 'Abraham Perez', 1413518, date('09/10/2025')),
(187, 0199106, 'Abraham Perez', 1413786, date('09/10/2025')),
(188, 0199106, 'Abraham Perez', 1413795, date('09/10/2025')),
(189, 0199106, 'Abraham Perez', 1413923, date('09/10/2025')),
(190, 0199106, 'Abraham Perez', 1414035, date('09/10/2025')),
(191, 0199106, 'Abraham Perez', 1414039, date('09/10/2025')),
(192, 0199106, 'Abraham Perez', 1414151, date('09/10/2025')),
(193, 0199106, 'Abraham Perez', 1414306, date('09/10/2025')),
(194, 0199106, 'Abraham Perez', 3004202, date('09/10/2025')),
(195, 0199106, 'Abraham Perez', 3027750, date('09/10/2025')),
(196, 0199106, 'Abraham Perez', 3030612, date('09/10/2025')),
(197, 0199106, 'Abraham Perez', 3035784, date('09/10/2025')),
(198, 0199106, 'Abraham Perez', 3100004, date('09/10/2025')),
(199, 0199106, 'Abraham Perez', 3100014, date('09/10/2025')),
(200, 0199106, 'Abraham Perez', 3100017, date('09/10/2025')),
(201, 0199106, 'Abraham Perez', 3100256, date('09/10/2025')),
(202, 0199106, 'Abraham Perez', 3100261, date('09/10/2025')),
(203, 0199106, 'Abraham Perez', 3100346, date('09/10/2025')),
(204, 0199106, 'Abraham Perez', 3100354, date('09/10/2025')),
(205, 0199106, 'Abraham Perez', 3100439, date('09/10/2025')),
(206, 0199106, 'Abraham Perez', 3100474, date('09/10/2025')),
(207, 0199106, 'Abraham Perez', 3100513, date('09/10/2025')),
(208, 0199106, 'Abraham Perez', 3100529, date('09/10/2025')),
(209, 0199106, 'Abraham Perez', 3100583, date('09/10/2025')),
(210, 0199106, 'Abraham Perez', 3100684, date('09/10/2025')),
(211, 0199106, 'Abraham Perez', 3100958, date('09/10/2025')),
(212, 0199106, 'Abraham Perez', 3100968, date('09/10/2025')),
(213, 0199106, 'Abraham Perez', 3101045, date('09/10/2025')),
(214, 0199106, 'Abraham Perez', 3101080, date('09/10/2025')),
(215, 0199106, 'Abraham Perez', 3101096, date('09/10/2025')),
(216, 0199106, 'Abraham Perez', 3101171, date('09/10/2025')),
(217, 0199106, 'Abraham Perez', 3101172, date('09/10/2025')),
(218, 0199106, 'Abraham Perez', 3101190, date('09/10/2025')),
(219, 0199106, 'Abraham Perez', 3101248, date('09/10/2025')),
(220, 0199106, 'Abraham Perez', 3101258, date('09/10/2025')),
(221, 0199106, 'Abraham Perez', 3101346, date('09/10/2025')),
(222, 0199106, 'Abraham Perez', 3101463, date('09/10/2025')),
(223, 0199106, 'Abraham Perez', 3101465, date('09/10/2025')),
(224, 0199106, 'Abraham Perez', 3101512, date('09/10/2025')),
(225, 0199106, 'Abraham Perez', 3101551, date('09/10/2025')),
(226, 0199106, 'Abraham Perez', 3101654, date('09/10/2025')),
(227, 0199106, 'Abraham Perez', 3101731, date('09/10/2025')),
(228, 0199106, 'Abraham Perez', 3101761, date('09/10/2025')),
(229, 0199106, 'Abraham Perez', 3101778, date('09/10/2025')),
(230, 0199106, 'Abraham Perez', 3101834, date('09/10/2025')),
(231, 0199106, 'Abraham Perez', 3101897, date('09/10/2025')),
(232, 0199106, 'Abraham Perez', 3102189, date('09/10/2025')),
(233, 0199106, 'Abraham Perez', 3102327, date('09/10/2025')),
(234, 0199106, 'Abraham Perez', 3102583, date('09/10/2025')),
(235, 0199106, 'Abraham Perez', 3105345, date('09/10/2025')),
(236, 0199106, 'Abraham Perez', 3105381, date('09/10/2025')),
(237, 0199106, 'Abraham Perez', 3106335, date('09/10/2025')),
(238, 0199106, 'Abraham Perez', 3111073, date('09/10/2025')),
(239, 0199106, 'Abraham Perez', 3113914, date('09/10/2025')),
(240, 0199106, 'Abraham Perez', 3115342, date('09/10/2025')),
(241, 0199106, 'Abraham Perez', 3119643, date('09/10/2025')),
(242, 0199106, 'Abraham Perez', 3119852, date('09/10/2025')),
(243, 0199106, 'Abraham Perez', 3119910, date('09/10/2025')),
(244, 0199106, 'Abraham Perez', 3120273, date('09/10/2025')),
(245, 0199106, 'Abraham Perez', 3125124, date('09/10/2025')),
(246, 0199106, 'Abraham Perez', 3125230, date('09/10/2025')),
(247, 0199106, 'Abraham Perez', 3125331, date('09/10/2025')),
(248, 0199106, 'Abraham Perez', 3125345, date('09/10/2025')),
(249, 0199106, 'Abraham Perez', 3125431, date('09/10/2025')),
(250, 0199106, 'Abraham Perez', 3125450, date('09/10/2025')),
(251, 0199106, 'Abraham Perez', 3128704, date('09/10/2025')),
(252, 0199106, 'Abraham Perez', 3129002, date('09/10/2025')),
(253, 0199106, 'Abraham Perez', 3162944, date('09/10/2025')),
(254, 0199106, 'Abraham Perez', 3162958, date('09/10/2025')),
(255, 0199106, 'Abraham Perez', 3162979, date('09/10/2025')),
(256, 0199106, 'Abraham Perez', 3163101, date('09/10/2025')),
(257, 0199106, 'Abraham Perez', 3163444, date('09/10/2025')),
(258, 0199106, 'Abraham Perez', 3163537, date('09/10/2025')),
(259, 0199106, 'Abraham Perez', 3163634, date('09/10/2025')),
(260, 0199106, 'Abraham Perez', 3163710, date('09/10/2025')),
(261, 0199106, 'Abraham Perez', 3163873, date('09/10/2025')),
(262, 0199106, 'Abraham Perez', 3164004, date('09/10/2025')),
(263, 0199106, 'Abraham Perez', 3164041, date('09/10/2025')),
(264, 0199106, 'Abraham Perez', 3164097, date('09/10/2025')),
(265, 0199106, 'Abraham Perez', 3164152, date('09/10/2025')),
(266, 0199106, 'Abraham Perez', 3164253, date('09/10/2025')),
(267, 0199106, 'Abraham Perez', 3164272, date('09/10/2025')),
(268, 0199106, 'Abraham Perez', 3164312, date('09/10/2025')),
(269, 0199106, 'Abraham Perez', 3164343, date('09/10/2025')),
(270, 0199106, 'Abraham Perez', 3164344, date('09/10/2025')),
(271, 0199106, 'Abraham Perez', 3164373, date('09/10/2025')),
(272, 0199106, 'Abraham Perez', 3164442, date('09/10/2025')),
(273, 0199106, 'Abraham Perez', 3164475, date('09/10/2025')),
(274, 0199106, 'Abraham Perez', 3164535, date('09/10/2025')),
(275, 0199106, 'Abraham Perez', 3164554, date('09/10/2025')),
(276, 0199106, 'Abraham Perez', 3164587, date('09/10/2025')),
(277, 0199106, 'Abraham Perez', 3164861, date('09/10/2025')),
(278, 0199106, 'Abraham Perez', 3164881, date('09/10/2025')),
(279, 0199106, 'Abraham Perez', 3164895, date('09/10/2025')),
(280, 0199106, 'Abraham Perez', 3165010, date('09/10/2025')),
(281, 0199106, 'Abraham Perez', 3165065, date('09/10/2025')),
(282, 0199106, 'Abraham Perez', 3165140, date('09/10/2025')),
(283, 0199106, 'Abraham Perez', 3165318, date('09/10/2025')),
(284, 0199106, 'Abraham Perez', 3165332, date('09/10/2025')),
(285, 0199106, 'Abraham Perez', 3165380, date('09/10/2025')),
(286, 0199106, 'Abraham Perez', 3165420, date('09/10/2025')),
(287, 0199106, 'Abraham Perez', 3165480, date('09/10/2025')),
(288, 0199106, 'Abraham Perez', 3165509, date('09/10/2025')),
(289, 0199106, 'Abraham Perez', 3165530, date('09/10/2025')),
(290, 0199106, 'Abraham Perez', 3165627, date('09/10/2025')),
(291, 0199106, 'Abraham Perez', 3165683, date('09/10/2025')),
(292, 0199106, 'Abraham Perez', 3165730, date('09/10/2025')),
(293, 0199106, 'Abraham Perez', 3165735, date('09/10/2025')),
(294, 0199106, 'Abraham Perez', 3165771, date('09/10/2025')),
(295, 0199106, 'Abraham Perez', 3165851, date('09/10/2025')),
(296, 0199106, 'Abraham Perez', 3165870, date('09/10/2025')),
(297, 0199106, 'Abraham Perez', 3165962, date('09/10/2025')),
(298, 0199106, 'Abraham Perez', 3165971, date('09/10/2025')),
(299, 0199106, 'Abraham Perez', 3165991, date('09/10/2025')),
(300, 0199106, 'Abraham Perez', 3166063, date('09/10/2025')),
(301, 0199106, 'Abraham Perez', 3166203, date('09/10/2025')),
(302, 0199106, 'Abraham Perez', 3166207, date('09/10/2025')),
(303, 0199106, 'Abraham Perez', 3166301, date('09/10/2025')),
(304, 0199106, 'Abraham Perez', 3166312, date('09/10/2025')),
(305, 0199106, 'Abraham Perez', 3166478, date('09/10/2025')),
(306, 0199106, 'Abraham Perez', 3166556, date('09/10/2025')),
(307, 0199106, 'Abraham Perez', 3166679, date('09/10/2025')),
(308, 0199106, 'Abraham Perez', 3166749, date('09/10/2025')),
(309, 0199106, 'Abraham Perez', 3166803, date('09/10/2025')),
(310, 0199106, 'Abraham Perez', 3166830, date('09/10/2025')),
(311, 0199106, 'Abraham Perez', 3166838, date('09/10/2025')),
(312, 0199106, 'Abraham Perez', 3166873, date('09/10/2025')),
(313, 0199106, 'Abraham Perez', 3167132, date('09/10/2025')),
(314, 0199106, 'Abraham Perez', 3167146, date('09/10/2025')),
(315, 0199106, 'Abraham Perez', 3167298, date('09/10/2025')),
(316, 0199106, 'Abraham Perez', 3167311, date('09/10/2025')),
(317, 0199106, 'Abraham Perez', 3167539, date('09/10/2025')),
(318, 0199106, 'Abraham Perez', 3167553, date('09/10/2025')),
(319, 0199106, 'Abraham Perez', 3167573, date('09/10/2025')),
(320, 0199106, 'Abraham Perez', 3167579, date('09/10/2025')),
(321, 0199106, 'Abraham Perez', 3167902, date('09/10/2025')),
(322, 0199106, 'Abraham Perez', 3168158, date('09/10/2025')),
(323, 0199106, 'Abraham Perez', 3168289, date('09/10/2025')),
(324, 0199106, 'Abraham Perez', 3168476, date('09/10/2025')),
(325, 0199106, 'Abraham Perez', 3168919, date('09/10/2025')),
(326, 0199106, 'Abraham Perez', 3169103, date('09/10/2025')),
(327, 0199106, 'Abraham Perez', 3169111, date('09/10/2025')),
(328, 0199106, 'Abraham Perez', 3169154, date('09/10/2025')),
(329, 0199106, 'Abraham Perez', 3171480, date('09/10/2025')),
(330, 0199106, 'Abraham Perez', 3171940, date('09/10/2025')),
(331, 0199106, 'Abraham Perez', 3215067, date('09/10/2025')),
(332, 0199106, 'Abraham Perez', 3215472, date('09/10/2025')),
(333, 0199106, 'Abraham Perez', 3215484, date('09/10/2025')),
(334, 0199106, 'Abraham Perez', 3215507, date('09/10/2025')),
(335, 0199106, 'Abraham Perez', 3215510, date('09/10/2025')),
(336, 0199106, 'Abraham Perez', 3215661, date('09/10/2025')),
(337, 0199106, 'Abraham Perez', 3215695, date('09/10/2025')),
(338, 0199106, 'Abraham Perez', 3215711, date('09/10/2025')),
(339, 0199106, 'Abraham Perez', 3215714, date('09/10/2025')),
(340, 0199106, 'Abraham Perez', 3215858, date('09/10/2025')),
(341, 0199106, 'Abraham Perez', 3216162, date('09/10/2025')),
(342, 0199106, 'Abraham Perez', 3216235, date('09/10/2025')),
(343, 0199106, 'Abraham Perez', 3216303, date('09/10/2025')),
(344, 0199106, 'Abraham Perez', 3216314, date('09/10/2025')),
(345, 0199106, 'Abraham Perez', 3216348, date('09/10/2025')),
(346, 0199106, 'Abraham Perez', 3216395, date('09/10/2025')),
(347, 0199106, 'Abraham Perez', 3216501, date('09/10/2025')),
(348, 0199106, 'Abraham Perez', 3216507, date('09/10/2025')),
(349, 0199106, 'Abraham Perez', 3216568, date('09/10/2025')),
(350, 0199106, 'Abraham Perez', 3216658, date('09/10/2025')),
(351, 0199106, 'Abraham Perez', 3216671, date('09/10/2025')),
(352, 0199106, 'Abraham Perez', 3216696, date('09/10/2025')),
(353, 0199106, 'Abraham Perez', 3216781, date('09/10/2025')),
(354, 0199106, 'Abraham Perez', 3216862, date('09/10/2025')),
(355, 0199106, 'Abraham Perez', 3216938, date('09/10/2025')),
(356, 0199106, 'Abraham Perez', 3216985, date('09/10/2025')),
(357, 0199106, 'Abraham Perez', 3216995, date('09/10/2025')),
(358, 0199106, 'Abraham Perez', 3217124, date('09/10/2025')),
(359, 0199106, 'Abraham Perez', 3217367, date('09/10/2025')),
(360, 0199106, 'Abraham Perez', 3217426, date('09/10/2025')),
(361, 0199106, 'Abraham Perez', 3217640, date('09/10/2025')),
(362, 0199106, 'Abraham Perez', 3217711, date('09/10/2025')),
(363, 0199106, 'Abraham Perez', 3217777, date('09/10/2025')),
(364, 0199106, 'Abraham Perez', 3217809, date('09/10/2025')),
(365, 0199106, 'Abraham Perez', 3217967, date('09/10/2025')),
(366, 0199106, 'Abraham Perez', 3218072, date('09/10/2025')),
(367, 0199106, 'Abraham Perez', 3218074, date('09/10/2025')),
(368, 0199106, 'Abraham Perez', 3218217, date('09/10/2025')),
(369, 0199106, 'Abraham Perez', 3218319, date('09/10/2025')),
(370, 0199106, 'Abraham Perez', 3218479, date('09/10/2025')),
(371, 0199106, 'Abraham Perez', 3218485, date('09/10/2025')),
(372, 0199106, 'Abraham Perez', 3218492, date('09/10/2025')),
(373, 0199106, 'Abraham Perez', 3218512, date('09/10/2025')),
(374, 0199106, 'Abraham Perez', 3218717, date('09/10/2025')),
(375, 0199106, 'Abraham Perez', 3218788, date('09/10/2025')),
(376, 0199106, 'Abraham Perez', 3218796, date('09/10/2025')),
(377, 0199106, 'Abraham Perez', 3218816, date('09/10/2025')),
(378, 0199106, 'Abraham Perez', 3219033, date('09/10/2025')),
(379, 0199106, 'Abraham Perez', 3219150, date('09/10/2025')),
(380, 0199106, 'Abraham Perez', 3219167, date('09/10/2025')),
(381, 0199106, 'Abraham Perez', 3219336, date('09/10/2025')),
(382, 0199106, 'Abraham Perez', 3219357, date('09/10/2025')),
(383, 0199106, 'Abraham Perez', 3219418, date('09/10/2025')),
(384, 0199106, 'Abraham Perez', 3219429, date('09/10/2025')),
(385, 0199106, 'Abraham Perez', 3219474, date('09/10/2025')),
(386, 0199106, 'Abraham Perez', 3219476, date('09/10/2025')),
(387, 0199106, 'Abraham Perez', 3219521, date('09/10/2025')),
(388, 0199106, 'Abraham Perez', 3219665, date('09/10/2025')),
(389, 0199106, 'Abraham Perez', 3219697, date('09/10/2025')),
(390, 0199106, 'Abraham Perez', 3219700, date('09/10/2025')),
(391, 0199106, 'Abraham Perez', 3219740, date('09/10/2025')),
(392, 0199106, 'Abraham Perez', 3219760, date('09/10/2025')),
(393, 0199106, 'Abraham Perez', 3219923, date('09/10/2025')),
(394, 0199106, 'Abraham Perez', 3220040, date('09/10/2025')),
(395, 0199106, 'Abraham Perez', 3220203, date('09/10/2025')),
(396, 0199106, 'Abraham Perez', 3220238, date('09/10/2025')),
(397, 0199106, 'Abraham Perez', 3220459, date('09/10/2025')),
(398, 0199106, 'Abraham Perez', 3221214, date('09/10/2025')),
(399, 0199106, 'Abraham Perez', 3221431, date('09/10/2025')),
(400, 0199106, 'Abraham Perez', 3221439, date('09/10/2025')),
(401, 0199106, 'Abraham Perez', 3222306, date('09/10/2025')),
(402, 0199106, 'Abraham Perez', 3222460, date('09/10/2025')),
(403, 0199106, 'Abraham Perez', 3222652, date('09/10/2025')),
(404, 0199106, 'Abraham Perez', 3223670, date('09/10/2025')),
(405, 0199106, 'Abraham Perez', 3226156, date('09/10/2025')),
(406, 0199106, 'Abraham Perez', 3227011, date('09/10/2025')),
(407, 0199106, 'Abraham Perez', 3279223, date('09/10/2025')),
(408, 0199106, 'Abraham Perez', 3279366, date('09/10/2025')),
(409, 0199106, 'Abraham Perez', 3279397, date('09/10/2025')),
(410, 0199106, 'Abraham Perez', 3279492, date('09/10/2025')),
(411, 0199106, 'Abraham Perez', 3279538, date('09/10/2025')),
(412, 0199106, 'Abraham Perez', 3279558, date('09/10/2025')),
(413, 0199106, 'Abraham Perez', 3279665, date('09/10/2025')),
(414, 0199106, 'Abraham Perez', 3279686, date('09/10/2025')),
(415, 0199106, 'Abraham Perez', 3279688, date('09/10/2025')),
(416, 0199106, 'Abraham Perez', 3279700, date('09/10/2025')),
(417, 0199106, 'Abraham Perez', 3279786, date('09/10/2025')),
(418, 0199106, 'Abraham Perez', 3279850, date('09/10/2025')),
(419, 0199106, 'Abraham Perez', 3279887, date('09/10/2025')),
(420, 0199106, 'Abraham Perez', 3279897, date('09/10/2025')),
(421, 0199106, 'Abraham Perez', 3279962, date('09/10/2025')),
(422, 0199106, 'Abraham Perez', 3279985, date('09/10/2025')),
(423, 0199106, 'Abraham Perez', 3279995, date('09/10/2025')),
(424, 0199106, 'Abraham Perez', 3280003, date('09/10/2025')),
(425, 0199106, 'Abraham Perez', 3280128, date('09/10/2025')),
(426, 0199106, 'Abraham Perez', 3280165, date('09/10/2025')),
(427, 0199106, 'Abraham Perez', 3280176, date('09/10/2025')),
(428, 0199106, 'Abraham Perez', 3280179, date('09/10/2025')),
(429, 0199106, 'Abraham Perez', 3280200, date('09/10/2025')),
(430, 0199106, 'Abraham Perez', 3280203, date('09/10/2025')),
(431, 0199106, 'Abraham Perez', 3280222, date('09/10/2025')),
(432, 0199106, 'Abraham Perez', 3280248, date('09/10/2025')),
(433, 0199106, 'Abraham Perez', 3280332, date('09/10/2025')),
(434, 0199106, 'Abraham Perez', 3280345, date('09/10/2025')),
(435, 0199106, 'Abraham Perez', 3280502, date('09/10/2025')),
(436, 0199106, 'Abraham Perez', 3280508, date('09/10/2025')),
(437, 0199106, 'Abraham Perez', 3280523, date('09/10/2025')),
(438, 0199106, 'Abraham Perez', 3280685, date('09/10/2025')),
(439, 0199106, 'Abraham Perez', 3280712, date('09/10/2025')),
(440, 0199106, 'Abraham Perez', 3280757, date('09/10/2025')),
(441, 0199106, 'Abraham Perez', 3280797, date('09/10/2025')),
(442, 0199106, 'Abraham Perez', 3280799, date('09/10/2025')),
(443, 0199106, 'Abraham Perez', 3280814, date('09/10/2025')),
(444, 0199106, 'Abraham Perez', 3280846, date('09/10/2025')),
(445, 0199106, 'Abraham Perez', 3280852, date('09/10/2025')),
(446, 0199106, 'Abraham Perez', 3280854, date('09/10/2025')),
(447, 0199106, 'Abraham Perez', 3280870, date('09/10/2025')),
(448, 0199106, 'Abraham Perez', 3280876, date('09/10/2025')),
(449, 0199106, 'Abraham Perez', 3280879, date('09/10/2025')),
(450, 0199106, 'Abraham Perez', 3280901, date('09/10/2025')),
(451, 0199106, 'Abraham Perez', 3280931, date('09/10/2025')),
(452, 0199106, 'Abraham Perez', 3280942, date('09/10/2025')),
(453, 0199106, 'Abraham Perez', 3280944, date('09/10/2025')),
(454, 0199106, 'Abraham Perez', 3280961, date('09/10/2025')),
(455, 0199106, 'Abraham Perez', 3280996, date('09/10/2025')),
(456, 0199106, 'Abraham Perez', 3281058, date('09/10/2025')),
(457, 0199106, 'Abraham Perez', 3281099, date('09/10/2025')),
(458, 0199106, 'Abraham Perez', 3281111, date('09/10/2025')),
(459, 0199106, 'Abraham Perez', 3281124, date('09/10/2025')),
(460, 0199106, 'Abraham Perez', 3281158, date('09/10/2025')),
(461, 0199106, 'Abraham Perez', 3281191, date('09/10/2025')),
(462, 0199106, 'Abraham Perez', 3281200, date('09/10/2025')),
(463, 0199106, 'Abraham Perez', 3281233, date('09/10/2025')),
(464, 0199106, 'Abraham Perez', 3281350, date('09/10/2025')),
(465, 0199106, 'Abraham Perez', 3281455, date('09/10/2025')),
(466, 0199106, 'Abraham Perez', 3281459, date('09/10/2025')),
(467, 0199106, 'Abraham Perez', 3281498, date('09/10/2025')),
(468, 0199106, 'Abraham Perez', 3281561, date('09/10/2025')),
(469, 0199106, 'Abraham Perez', 3281565, date('09/10/2025')),
(470, 0199106, 'Abraham Perez', 3281577, date('09/10/2025')),
(471, 0199106, 'Abraham Perez', 3281578, date('09/10/2025')),
(472, 0199106, 'Abraham Perez', 3281617, date('09/10/2025')),
(473, 0199106, 'Abraham Perez', 3281636, date('09/10/2025')),
(474, 0199106, 'Abraham Perez', 3281650, date('09/10/2025')),
(475, 0199106, 'Abraham Perez', 3281662, date('09/10/2025')),
(476, 0199106, 'Abraham Perez', 3281812, date('09/10/2025')),
(477, 0199106, 'Abraham Perez', 3281859, date('09/10/2025')),
(478, 0199106, 'Abraham Perez', 3281869, date('09/10/2025')),
(479, 0199106, 'Abraham Perez', 3281919, date('09/10/2025')),
(480, 0199106, 'Abraham Perez', 3281944, date('09/10/2025')),
(481, 0199106, 'Abraham Perez', 3281968, date('09/10/2025')),
(482, 0199106, 'Abraham Perez', 3281982, date('09/10/2025')),
(483, 0199106, 'Abraham Perez', 3281993, date('09/10/2025')),
(484, 0199106, 'Abraham Perez', 3282014, date('09/10/2025')),
(485, 0199106, 'Abraham Perez', 3282096, date('09/10/2025')),
(486, 0199106, 'Abraham Perez', 3282110, date('09/10/2025')),
(487, 0199106, 'Abraham Perez', 3282116, date('09/10/2025')),
(488, 0199106, 'Abraham Perez', 3282186, date('09/10/2025')),
(489, 0199106, 'Abraham Perez', 3282191, date('09/10/2025')),
(490, 0199106, 'Abraham Perez', 3282255, date('09/10/2025')),
(491, 0199106, 'Abraham Perez', 3282272, date('09/10/2025')),
(492, 0199106, 'Abraham Perez', 3282343, date('09/10/2025')),
(493, 0199106, 'Abraham Perez', 3282347, date('09/10/2025')),
(494, 0199106, 'Abraham Perez', 3282354, date('09/10/2025')),
(495, 0199106, 'Abraham Perez', 3282358, date('09/10/2025')),
(496, 0199106, 'Abraham Perez', 3282394, date('09/10/2025')),
(497, 0199106, 'Abraham Perez', 3282402, date('09/10/2025')),
(498, 0199106, 'Abraham Perez', 3282410, date('09/10/2025')),
(499, 0199106, 'Abraham Perez', 3282415, date('09/10/2025')),
(500, 0199106, 'Abraham Perez', 3282431, date('09/10/2025')),
(501, 0199106, 'Abraham Perez', 3282445, date('09/10/2025')),
(502, 0199106, 'Abraham Perez', 3282452, date('09/10/2025')),
(503, 0199106, 'Abraham Perez', 3282533, date('09/10/2025')),
(504, 0199106, 'Abraham Perez', 3282535, date('09/10/2025')),
(505, 0199106, 'Abraham Perez', 3282621, date('09/10/2025')),
(506, 0199106, 'Abraham Perez', 3282660, date('09/10/2025')),
(507, 0199106, 'Abraham Perez', 3282678, date('09/10/2025')),
(508, 0199106, 'Abraham Perez', 3282743, date('09/10/2025')),
(509, 0199106, 'Abraham Perez', 3282769, date('09/10/2025')),
(510, 0199106, 'Abraham Perez', 3282799, date('09/10/2025')),
(511, 0199106, 'Abraham Perez', 3282889, date('09/10/2025')),
(512, 0199106, 'Abraham Perez', 3282905, date('09/10/2025')),
(513, 0199106, 'Abraham Perez', 3282921, date('09/10/2025')),
(514, 0199106, 'Abraham Perez', 3283039, date('09/10/2025')),
(515, 0199106, 'Abraham Perez', 3283053, date('09/10/2025')),
(516, 0199106, 'Abraham Perez', 3283055, date('09/10/2025')),
(517, 0199106, 'Abraham Perez', 3283105, date('09/10/2025')),
(518, 0199106, 'Abraham Perez', 3283108, date('09/10/2025')),
(519, 0199106, 'Abraham Perez', 3283124, date('09/10/2025')),
(520, 0199106, 'Abraham Perez', 3283141, date('09/10/2025')),
(521, 0199106, 'Abraham Perez', 3283179, date('09/10/2025')),
(522, 0199106, 'Abraham Perez', 3283410, date('09/10/2025')),
(523, 0199106, 'Abraham Perez', 3283413, date('09/10/2025')),
(524, 0199106, 'Abraham Perez', 3283421, date('09/10/2025')),
(525, 0199106, 'Abraham Perez', 3283512, date('09/10/2025')),
(526, 0199106, 'Abraham Perez', 3283517, date('09/10/2025')),
(527, 0199106, 'Abraham Perez', 3283586, date('09/10/2025')),
(528, 0199106, 'Abraham Perez', 3283590, date('09/10/2025')),
(529, 0199106, 'Abraham Perez', 3283613, date('09/10/2025')),
(530, 0199106, 'Abraham Perez', 3283695, date('09/10/2025')),
(531, 0199106, 'Abraham Perez', 3283779, date('09/10/2025')),
(532, 0199106, 'Abraham Perez', 3283793, date('09/10/2025')),
(533, 0199106, 'Abraham Perez', 3283799, date('09/10/2025')),
(534, 0199106, 'Abraham Perez', 3283928, date('09/10/2025')),
(535, 0199106, 'Abraham Perez', 3283976, date('09/10/2025')),
(536, 0199106, 'Abraham Perez', 3284083, date('09/10/2025')),
(537, 0199106, 'Abraham Perez', 3284109, date('09/10/2025')),
(538, 0199106, 'Abraham Perez', 3284247, date('09/10/2025')),
(539, 0199106, 'Abraham Perez', 3284258, date('09/10/2025')),
(540, 0199106, 'Abraham Perez', 3284267, date('09/10/2025')),
(541, 0199106, 'Abraham Perez', 3284378, date('09/10/2025')),
(542, 0199106, 'Abraham Perez', 3284411, date('09/10/2025')),
(543, 0199106, 'Abraham Perez', 3284433, date('09/10/2025')),
(544, 0199106, 'Abraham Perez', 3284494, date('09/10/2025')),
(545, 0199106, 'Abraham Perez', 3285294, date('09/10/2025')),
(546, 0199106, 'Abraham Perez', 3285708, date('09/10/2025')),
(547, 0199106, 'Abraham Perez', 3285740, date('09/10/2025')),
(548, 0199106, 'Abraham Perez', 3286017, date('09/10/2025')),
(549, 0199106, 'Abraham Perez', 3286299, date('09/10/2025')),
(550, 0199106, 'Abraham Perez', 3287192, date('09/10/2025')),
(551, 0199106, 'Abraham Perez', 3288367, date('09/10/2025')),
(552, 0199106, 'Abraham Perez', 3288868, date('09/10/2025')),
(553, 0199106, 'Abraham Perez', 3292836, date('09/10/2025')),
(554, 0199106, 'Abraham Perez', 3298782, date('09/10/2025')),
(555, 0199106, 'Abraham Perez', 3315353, date('09/10/2025')),
(556, 0199106, 'Abraham Perez', 3315358, date('09/10/2025')),
(557, 0199106, 'Abraham Perez', 3315518, date('09/10/2025')),
(558, 0199106, 'Abraham Perez', 3315584, date('09/10/2025')),
(559, 0199106, 'Abraham Perez', 3315587, date('09/10/2025')),
(560, 0199106, 'Abraham Perez', 3315599, date('09/10/2025')),
(561, 0199106, 'Abraham Perez', 3315604, date('09/10/2025')),
(562, 0199106, 'Abraham Perez', 3315749, date('09/10/2025')),
(563, 0199106, 'Abraham Perez', 3315772, date('09/10/2025')),
(564, 0199106, 'Abraham Perez', 3315790, date('09/10/2025')),
(565, 0199106, 'Abraham Perez', 3315804, date('09/10/2025')),
(566, 0199106, 'Abraham Perez', 3315850, date('09/10/2025')),
(567, 0199106, 'Abraham Perez', 3315893, date('09/10/2025')),
(568, 0199106, 'Abraham Perez', 3315896, date('09/10/2025')),
(569, 0199106, 'Abraham Perez', 3315902, date('09/10/2025')),
(570, 0199106, 'Abraham Perez', 3315982, date('09/10/2025')),
(571, 0199106, 'Abraham Perez', 3316012, date('09/10/2025')),
(572, 0199106, 'Abraham Perez', 3316140, date('09/10/2025')),
(573, 0199106, 'Abraham Perez', 3316161, date('09/10/2025')),
(574, 0199106, 'Abraham Perez', 3316200, date('09/10/2025')),
(575, 0199106, 'Abraham Perez', 3316239, date('09/10/2025')),
(576, 0199106, 'Abraham Perez', 3316250, date('09/10/2025')),
(577, 0199106, 'Abraham Perez', 3316261, date('09/10/2025')),
(578, 0199106, 'Abraham Perez', 3316365, date('09/10/2025')),
(579, 0199106, 'Abraham Perez', 3316423, date('09/10/2025')),
(580, 0199106, 'Abraham Perez', 3316497, date('09/10/2025')),
(581, 0199106, 'Abraham Perez', 3316513, date('09/10/2025')),
(582, 0199106, 'Abraham Perez', 3316545, date('09/10/2025')),
(583, 0199106, 'Abraham Perez', 3316627, date('09/10/2025')),
(584, 0199106, 'Abraham Perez', 3316730, date('09/10/2025')),
(585, 0199106, 'Abraham Perez', 3316810, date('09/10/2025')),
(586, 0199106, 'Abraham Perez', 3316910, date('09/10/2025')),
(587, 0199106, 'Abraham Perez', 3316916, date('09/10/2025')),
(588, 0199106, 'Abraham Perez', 3316917, date('09/10/2025')),
(589, 0199106, 'Abraham Perez', 3316966, date('09/10/2025')),
(590, 0199106, 'Abraham Perez', 3316986, date('09/10/2025')),
(591, 0199106, 'Abraham Perez', 3317062, date('09/10/2025')),
(592, 0199106, 'Abraham Perez', 3317078, date('09/10/2025')),
(593, 0199106, 'Abraham Perez', 3317101, date('09/10/2025')),
(594, 0199106, 'Abraham Perez', 3317109, date('09/10/2025')),
(595, 0199106, 'Abraham Perez', 3317149, date('09/10/2025')),
(596, 0199106, 'Abraham Perez', 3317176, date('09/10/2025')),
(597, 0199106, 'Abraham Perez', 3317178, date('09/10/2025')),
(598, 0199106, 'Abraham Perez', 3317186, date('09/10/2025')),
(599, 0199106, 'Abraham Perez', 3317208, date('09/10/2025')),
(600, 0199106, 'Abraham Perez', 3317210, date('09/10/2025')),
(601, 0199106, 'Abraham Perez', 3317214, date('09/10/2025')),
(602, 0199106, 'Abraham Perez', 3317245, date('09/10/2025')),
(603, 0199106, 'Abraham Perez', 3317249, date('09/10/2025')),
(604, 0199106, 'Abraham Perez', 3317361, date('09/10/2025')),
(605, 0199106, 'Abraham Perez', 3317387, date('09/10/2025')),
(606, 0199106, 'Abraham Perez', 3317394, date('09/10/2025')),
(607, 0199106, 'Abraham Perez', 3317468, date('09/10/2025')),
(608, 0199106, 'Abraham Perez', 3317691, date('09/10/2025')),
(609, 0199106, 'Abraham Perez', 3317727, date('09/10/2025')),
(610, 0199106, 'Abraham Perez', 3317765, date('09/10/2025')),
(611, 0199106, 'Abraham Perez', 3317821, date('09/10/2025')),
(612, 0199106, 'Abraham Perez', 3317827, date('09/10/2025')),
(613, 0199106, 'Abraham Perez', 3317887, date('09/10/2025')),
(614, 0199106, 'Abraham Perez', 3317924, date('09/10/2025')),
(615, 0199106, 'Abraham Perez', 3317948, date('09/10/2025')),
(616, 0199106, 'Abraham Perez', 3318326, date('09/10/2025')),
(617, 0199106, 'Abraham Perez', 3318477, date('09/10/2025')),
(618, 0199106, 'Abraham Perez', 3319512, date('09/10/2025')),
(619, 0199106, 'Abraham Perez', 3334086, date('09/10/2025')),
(620, 0199106, 'Abraham Perez', 3334088, date('09/10/2025')),
(621, 0199106, 'Abraham Perez', 3334102, date('09/10/2025')),
(622, 0199106, 'Abraham Perez', 3341054, date('09/10/2025')),
(623, 0199106, 'Abraham Perez', 3341081, date('09/10/2025')),
(624, 0199106, 'Abraham Perez', 3341140, date('09/10/2025')),
(625, 0199106, 'Abraham Perez', 3341203, date('09/10/2025')),
(626, 0199106, 'Abraham Perez', 3341266, date('09/10/2025')),
(627, 0199106, 'Abraham Perez', 3341276, date('09/10/2025')),
(628, 0199106, 'Abraham Perez', 3341303, date('09/10/2025')),
(629, 0199106, 'Abraham Perez', 3341335, date('09/10/2025')),
(630, 0199106, 'Abraham Perez', 3341348, date('09/10/2025')),
(631, 0199106, 'Abraham Perez', 3341358, date('09/10/2025')),
(632, 0199106, 'Abraham Perez', 3341420, date('09/10/2025')),
(633, 0199106, 'Abraham Perez', 3341474, date('09/10/2025')),
(634, 0199106, 'Abraham Perez', 3341488, date('09/10/2025')),
(635, 0199106, 'Abraham Perez', 3341513, date('09/10/2025')),
(636, 0199106, 'Abraham Perez', 3341529, date('09/10/2025')),
(637, 0199106, 'Abraham Perez', 3341658, date('09/10/2025')),
(638, 0199106, 'Abraham Perez', 3341696, date('09/10/2025')),
(639, 0199106, 'Abraham Perez', 3341698, date('09/10/2025')),
(640, 0199106, 'Abraham Perez', 3341740, date('09/10/2025')),
(641, 0199106, 'Abraham Perez', 3341756, date('09/10/2025')),
(642, 0199106, 'Abraham Perez', 3341792, date('09/10/2025')),
(643, 0199106, 'Abraham Perez', 3341797, date('09/10/2025')),
(644, 0199106, 'Abraham Perez', 3341807, date('09/10/2025')),
(645, 0199106, 'Abraham Perez', 3341811, date('09/10/2025')),
(646, 0199106, 'Abraham Perez', 3341818, date('09/10/2025')),
(647, 0199106, 'Abraham Perez', 3341840, date('09/10/2025')),
(648, 0199106, 'Abraham Perez', 3341846, date('09/10/2025')),
(649, 0199106, 'Abraham Perez', 3341906, date('09/10/2025')),
(650, 0199106, 'Abraham Perez', 3341932, date('09/10/2025')),
(651, 0199106, 'Abraham Perez', 3341935, date('09/10/2025')),
(652, 0199106, 'Abraham Perez', 3341962, date('09/10/2025')),
(653, 0199106, 'Abraham Perez', 3342022, date('09/10/2025')),
(654, 0199106, 'Abraham Perez', 3342048, date('09/10/2025')),
(655, 0199106, 'Abraham Perez', 3342051, date('09/10/2025')),
(656, 0199106, 'Abraham Perez', 3342057, date('09/10/2025')),
(657, 0199106, 'Abraham Perez', 3342119, date('09/10/2025')),
(658, 0199106, 'Abraham Perez', 3342120, date('09/10/2025')),
(659, 0199106, 'Abraham Perez', 3342160, date('09/10/2025')),
(660, 0199106, 'Abraham Perez', 3342213, date('09/10/2025')),
(661, 0199106, 'Abraham Perez', 3342217, date('09/10/2025')),
(662, 0199106, 'Abraham Perez', 3342218, date('09/10/2025')),
(663, 0199106, 'Abraham Perez', 3342219, date('09/10/2025')),
(664, 0199106, 'Abraham Perez', 3342221, date('09/10/2025')),
(665, 0199106, 'Abraham Perez', 3342289, date('09/10/2025')),
(666, 0199106, 'Abraham Perez', 3342302, date('09/10/2025')),
(667, 0199106, 'Abraham Perez', 3342311, date('09/10/2025')),
(668, 0199106, 'Abraham Perez', 3342324, date('09/10/2025')),
(669, 0199106, 'Abraham Perez', 3342372, date('09/10/2025')),
(670, 0199106, 'Abraham Perez', 3342376, date('09/10/2025')),
(671, 0199106, 'Abraham Perez', 3342382, date('09/10/2025')),
(672, 0199106, 'Abraham Perez', 3342384, date('09/10/2025')),
(673, 0199106, 'Abraham Perez', 3342437, date('09/10/2025')),
(674, 0199106, 'Abraham Perez', 3342446, date('09/10/2025')),
(675, 0199106, 'Abraham Perez', 3342465, date('09/10/2025')),
(676, 0199106, 'Abraham Perez', 3342496, date('09/10/2025')),
(677, 0199106, 'Abraham Perez', 3342571, date('09/10/2025')),
(678, 0199106, 'Abraham Perez', 3342586, date('09/10/2025')),
(679, 0199106, 'Abraham Perez', 3342599, date('09/10/2025')),
(680, 0199106, 'Abraham Perez', 3342608, date('09/10/2025')),
(681, 0199106, 'Abraham Perez', 3342636, date('09/10/2025')),
(682, 0199106, 'Abraham Perez', 3342682, date('09/10/2025')),
(683, 0199106, 'Abraham Perez', 3342685, date('09/10/2025')),
(684, 0199106, 'Abraham Perez', 3342692, date('09/10/2025')),
(685, 0199106, 'Abraham Perez', 3342706, date('09/10/2025')),
(686, 0199106, 'Abraham Perez', 3342731, date('09/10/2025')),
(687, 0199106, 'Abraham Perez', 3342732, date('09/10/2025')),
(688, 0199106, 'Abraham Perez', 3342737, date('09/10/2025')),
(689, 0199106, 'Abraham Perez', 3342740, date('09/10/2025')),
(690, 0199106, 'Abraham Perez', 3342776, date('09/10/2025')),
(691, 0199106, 'Abraham Perez', 3342778, date('09/10/2025')),
(692, 0199106, 'Abraham Perez', 3342779, date('09/10/2025')),
(693, 0199106, 'Abraham Perez', 3342783, date('09/10/2025')),
(694, 0199106, 'Abraham Perez', 3342789, date('09/10/2025')),
(695, 0199106, 'Abraham Perez', 3342795, date('09/10/2025')),
(696, 0199106, 'Abraham Perez', 3342799, date('09/10/2025')),
(697, 0199106, 'Abraham Perez', 3342884, date('09/10/2025')),
(698, 0199106, 'Abraham Perez', 3342896, date('09/10/2025')),
(699, 0199106, 'Abraham Perez', 3342901, date('09/10/2025')),
(700, 0199106, 'Abraham Perez', 3342915, date('09/10/2025')),
(701, 0199106, 'Abraham Perez', 3342933, date('09/10/2025')),
(702, 0199106, 'Abraham Perez', 3342949, date('09/10/2025')),
(703, 0199106, 'Abraham Perez', 3342950, date('09/10/2025')),
(704, 0199106, 'Abraham Perez', 3342979, date('09/10/2025')),
(705, 0199106, 'Abraham Perez', 3342997, date('09/10/2025')),
(706, 0199106, 'Abraham Perez', 3343063, date('09/10/2025')),
(707, 0199106, 'Abraham Perez', 3343092, date('09/10/2025')),
(708, 0199106, 'Abraham Perez', 3343099, date('09/10/2025')),
(709, 0199106, 'Abraham Perez', 3343131, date('09/10/2025')),
(710, 0199106, 'Abraham Perez', 3343166, date('09/10/2025')),
(711, 0199106, 'Abraham Perez', 3343171, date('09/10/2025')),
(712, 0199106, 'Abraham Perez', 3343182, date('09/10/2025')),
(713, 0199106, 'Abraham Perez', 3343189, date('09/10/2025')),
(714, 0199106, 'Abraham Perez', 3343191, date('09/10/2025')),
(715, 0199106, 'Abraham Perez', 3343197, date('09/10/2025')),
(716, 0199106, 'Abraham Perez', 3343213, date('09/10/2025')),
(717, 0199106, 'Abraham Perez', 3343217, date('09/10/2025')),
(718, 0199106, 'Abraham Perez', 3343223, date('09/10/2025')),
(719, 0199106, 'Abraham Perez', 3343267, date('09/10/2025')),
(720, 0199106, 'Abraham Perez', 3343270, date('09/10/2025')),
(721, 0199106, 'Abraham Perez', 3343292, date('09/10/2025')),
(722, 0199106, 'Abraham Perez', 3343316, date('09/10/2025')),
(723, 0199106, 'Abraham Perez', 3343386, date('09/10/2025')),
(724, 0199106, 'Abraham Perez', 3343480, date('09/10/2025')),
(725, 0199106, 'Abraham Perez', 3343500, date('09/10/2025')),
(726, 0199106, 'Abraham Perez', 3343503, date('09/10/2025')),
(727, 0199106, 'Abraham Perez', 3343506, date('09/10/2025')),
(728, 0199106, 'Abraham Perez', 3343557, date('09/10/2025')),
(729, 0199106, 'Abraham Perez', 3343561, date('09/10/2025')),
(730, 0199106, 'Abraham Perez', 3343573, date('09/10/2025')),
(731, 0199106, 'Abraham Perez', 3343629, date('09/10/2025')),
(732, 0199106, 'Abraham Perez', 3343725, date('09/10/2025')),
(733, 0199106, 'Abraham Perez', 3343904, date('09/10/2025')),
(734, 0199106, 'Abraham Perez', 3344016, date('09/10/2025')),
(735, 0199106, 'Abraham Perez', 3344159, date('09/10/2025')),
(736, 0199106, 'Abraham Perez', 1133539, date('09/10/2025')),
(737, 0199106, 'Abraham Perez', 1197462, date('09/10/2025')),
(738, 0199106, 'Abraham Perez', 1201704, date('09/10/2025')),
(739, 0199106, 'Abraham Perez', 1310347, date('09/10/2025')),
(740, 0199106, 'Abraham Perez', 1311263, date('09/10/2025')),
(741, 0199106, 'Abraham Perez', 1311966, date('09/10/2025')),
(742, 0199106, 'Abraham Perez', 1312269, date('09/10/2025')),
(743, 0199106, 'Abraham Perez', 1312308, date('09/10/2025')),
(744, 0199106, 'Abraham Perez', 1316017, date('09/10/2025')),
(745, 0199106, 'Abraham Perez', 1316073, date('09/10/2025')),
(746, 0199106, 'Abraham Perez', 1336099, date('09/10/2025')),
(747, 0199106, 'Abraham Perez', 1336374, date('09/10/2025')),
(748, 0199106, 'Abraham Perez', 1373859, date('09/10/2025')),
(749, 0199106, 'Abraham Perez', 1374110, date('09/10/2025')),
(750, 0199106, 'Abraham Perez', 1377471, date('09/10/2025')),
(751, 0199106, 'Abraham Perez', 1377473, date('09/10/2025')),
(752, 0199106, 'Abraham Perez', 1413866, date('09/10/2025')),
(753, 0199106, 'Abraham Perez', 1414119, date('09/10/2025')),
(754, 0199106, 'Abraham Perez', 3100363, date('09/10/2025')),
(755, 0199106, 'Abraham Perez', 3100482, date('09/10/2025')),
(756, 0199106, 'Abraham Perez', 3100749, date('09/10/2025')),
(757, 0199106, 'Abraham Perez', 3101989, date('09/10/2025')),
(758, 0199106, 'Abraham Perez', 3103203, date('09/10/2025')),
(759, 0199106, 'Abraham Perez', 3109978, date('09/10/2025')),
(760, 0199106, 'Abraham Perez', 3164243, date('09/10/2025')),
(761, 0199106, 'Abraham Perez', 3164423, date('09/10/2025')),
(762, 0199106, 'Abraham Perez', 3164613, date('09/10/2025')),
(763, 0199106, 'Abraham Perez', 3165666, date('09/10/2025')),
(764, 0199106, 'Abraham Perez', 3165911, date('09/10/2025')),
(765, 0199106, 'Abraham Perez', 3166569, date('09/10/2025')),
(766, 0199106, 'Abraham Perez', 3167962, date('09/10/2025')),
(767, 0199106, 'Abraham Perez', 3167973, date('09/10/2025')),
(768, 0199106, 'Abraham Perez', 3168018, date('09/10/2025')),
(769, 0199106, 'Abraham Perez', 3214995, date('09/10/2025')),
(770, 0199106, 'Abraham Perez', 3215021, date('09/10/2025')),
(771, 0199106, 'Abraham Perez', 3215886, date('09/10/2025')),
(772, 0199106, 'Abraham Perez', 3216428, date('09/10/2025')),
(773, 0199106, 'Abraham Perez', 3216475, date('09/10/2025')),
(774, 0199106, 'Abraham Perez', 3216722, date('09/10/2025')),
(775, 0199106, 'Abraham Perez', 3216745, date('09/10/2025')),
(776, 0199106, 'Abraham Perez', 3216950, date('09/10/2025')),
(777, 0199106, 'Abraham Perez', 3216954, date('09/10/2025')),
(778, 0199106, 'Abraham Perez', 3217584, date('09/10/2025')),
(779, 0199106, 'Abraham Perez', 3217692, date('09/10/2025')),
(780, 0199106, 'Abraham Perez', 3217878, date('09/10/2025')),
(781, 0199106, 'Abraham Perez', 3217893, date('09/10/2025')),
(782, 0199106, 'Abraham Perez', 3218120, date('09/10/2025')),
(783, 0199106, 'Abraham Perez', 3218121, date('09/10/2025')),
(784, 0199106, 'Abraham Perez', 3218163, date('09/10/2025')),
(785, 0199106, 'Abraham Perez', 3218386, date('09/10/2025')),
(786, 0199106, 'Abraham Perez', 3219090, date('09/10/2025')),
(787, 0199106, 'Abraham Perez', 3219105, date('09/10/2025')),
(788, 0199106, 'Abraham Perez', 3219127, date('09/10/2025')),
(789, 0199106, 'Abraham Perez', 3220059, date('09/10/2025')),
(790, 0199106, 'Abraham Perez', 3220310, date('09/10/2025')),
(791, 0199106, 'Abraham Perez', 3220701, date('09/10/2025')),
(792, 0199106, 'Abraham Perez', 3220910, date('09/10/2025')),
(793, 0199106, 'Abraham Perez', 3222009, date('09/10/2025')),
(794, 0199106, 'Abraham Perez', 3222255, date('09/10/2025')),
(795, 0199106, 'Abraham Perez', 3222541, date('09/10/2025')),
(796, 0199106, 'Abraham Perez', 3222805, date('09/10/2025')),
(797, 0199106, 'Abraham Perez', 3223429, date('09/10/2025')),
(798, 0199106, 'Abraham Perez', 3224750, date('09/10/2025')),
(799, 0199106, 'Abraham Perez', 3224963, date('09/10/2025')),
(800, 0199106, 'Abraham Perez', 3279891, date('09/10/2025')),
(801, 0199106, 'Abraham Perez', 3280157, date('09/10/2025')),
(802, 0199106, 'Abraham Perez', 3280172, date('09/10/2025')),
(803, 0199106, 'Abraham Perez', 3280263, date('09/10/2025')),
(804, 0199106, 'Abraham Perez', 3280591, date('09/10/2025')),
(805, 0199106, 'Abraham Perez', 3281001, date('09/10/2025')),
(806, 0199106, 'Abraham Perez', 3281452, date('09/10/2025')),
(807, 0199106, 'Abraham Perez', 3281524, date('09/10/2025')),
(808, 0199106, 'Abraham Perez', 3282467, date('09/10/2025')),
(809, 0199106, 'Abraham Perez', 3282475, date('09/10/2025')),
(810, 0199106, 'Abraham Perez', 3282494, date('09/10/2025')),
(811, 0199106, 'Abraham Perez', 3282815, date('09/10/2025')),
(812, 0199106, 'Abraham Perez', 3282829, date('09/10/2025')),
(813, 0199106, 'Abraham Perez', 3282837, date('09/10/2025')),
(814, 0199106, 'Abraham Perez', 3283275, date('09/10/2025')),
(815, 0199106, 'Abraham Perez', 3283327, date('09/10/2025')),
(816, 0199106, 'Abraham Perez', 3283485, date('09/10/2025')),
(817, 0199106, 'Abraham Perez', 3283650, date('09/10/2025')),
(818, 0199106, 'Abraham Perez', 3283652, date('09/10/2025')),
(819, 0199106, 'Abraham Perez', 3283666, date('09/10/2025')),
(820, 0199106, 'Abraham Perez', 3283859, date('09/10/2025')),
(821, 0199106, 'Abraham Perez', 3283874, date('09/10/2025')),
(822, 0199106, 'Abraham Perez', 3283890, date('09/10/2025')),
(823, 0199106, 'Abraham Perez', 3284130, date('09/10/2025')),
(824, 0199106, 'Abraham Perez', 3284298, date('09/10/2025')),
(825, 0199106, 'Abraham Perez', 3284299, date('09/10/2025')),
(826, 0199106, 'Abraham Perez', 3284510, date('09/10/2025')),
(827, 0199106, 'Abraham Perez', 3284535, date('09/10/2025')),
(828, 0199106, 'Abraham Perez', 3284857, date('09/10/2025')),
(829, 0199106, 'Abraham Perez', 3315127, date('09/10/2025')),
(830, 0199106, 'Abraham Perez', 3315205, date('09/10/2025')),
(831, 0199106, 'Abraham Perez', 3315325, date('09/10/2025')),
(832, 0199106, 'Abraham Perez', 3315718, date('09/10/2025')),
(833, 0199106, 'Abraham Perez', 3315974, date('09/10/2025')),
(834, 0199106, 'Abraham Perez', 3316330, date('09/10/2025')),
(835, 0199106, 'Abraham Perez', 3316353, date('09/10/2025')),
(836, 0199106, 'Abraham Perez', 3316539, date('09/10/2025')),
(837, 0199106, 'Abraham Perez', 3316565, date('09/10/2025')),
(838, 0199106, 'Abraham Perez', 3316640, date('09/10/2025')),
(839, 0199106, 'Abraham Perez', 3316678, date('09/10/2025')),
(840, 0199106, 'Abraham Perez', 3316688, date('09/10/2025')),
(841, 0199106, 'Abraham Perez', 3316700, date('09/10/2025')),
(842, 0199106, 'Abraham Perez', 3316753, date('09/10/2025')),
(843, 0199106, 'Abraham Perez', 3316860, date('09/10/2025')),
(844, 0199106, 'Abraham Perez', 3317515, date('09/10/2025')),
(845, 0199106, 'Abraham Perez', 3317516, date('09/10/2025')),
(846, 0199106, 'Abraham Perez', 3317565, date('09/10/2025')),
(847, 0199106, 'Abraham Perez', 3319837, date('09/10/2025')),
(848, 0199106, 'Abraham Perez', 3341017, date('09/10/2025')),
(849, 0199106, 'Abraham Perez', 3341028, date('09/10/2025')),
(850, 0199106, 'Abraham Perez', 3341384, date('09/10/2025')),
(851, 0199106, 'Abraham Perez', 3341577, date('09/10/2025')),
(852, 0199106, 'Abraham Perez', 3341581, date('09/10/2025')),
(853, 0199106, 'Abraham Perez', 3341704, date('09/10/2025')),
(854, 0199106, 'Abraham Perez', 3341718, date('09/10/2025')),
(855, 0199106, 'Abraham Perez', 3341733, date('09/10/2025')),
(856, 0199106, 'Abraham Perez', 3341868, date('09/10/2025')),
(857, 0199106, 'Abraham Perez', 3341977, date('09/10/2025')),
(858, 0199106, 'Abraham Perez', 3341986, date('09/10/2025')),
(859, 0199106, 'Abraham Perez', 3342039, date('09/10/2025')),
(860, 0199106, 'Abraham Perez', 3342093, date('09/10/2025')),
(861, 0199106, 'Abraham Perez', 3342362, date('09/10/2025')),
(862, 0199106, 'Abraham Perez', 3342419, date('09/10/2025')),
(863, 0199106, 'Abraham Perez', 3342425, date('09/10/2025')),
(864, 0199106, 'Abraham Perez', 3342520, date('09/10/2025')),
(865, 0199106, 'Abraham Perez', 3342527, date('09/10/2025')),
(866, 0199106, 'Abraham Perez', 3342714, date('09/10/2025')),
(867, 0199106, 'Abraham Perez', 3342716, date('09/10/2025')),
(868, 0199106, 'Abraham Perez', 3342717, date('09/10/2025')),
(869, 0199106, 'Abraham Perez', 3342814, date('09/10/2025')),
(870, 0199106, 'Abraham Perez', 3342830, date('09/10/2025')),
(871, 0199106, 'Abraham Perez', 3342868, date('09/10/2025')),
(872, 0199106, 'Abraham Perez', 3342872, date('09/10/2025')),
(873, 0199106, 'Abraham Perez', 3343146, date('09/10/2025')),
(874, 0199106, 'Abraham Perez', 3343148, date('09/10/2025')),
(875, 0199106, 'Abraham Perez', 3343229, date('09/10/2025')),
(876, 0199106, 'Abraham Perez', 3343336, date('09/10/2025')),
(877, 0199106, 'Abraham Perez', 3343511, date('09/10/2025')),
(878, 0199106, 'Abraham Perez', 3343523, date('09/10/2025')),
(879, 0199106, 'Abraham Perez', 3344172, date('09/10/2025')),
(880, 0199106, 'Abraham Perez', 3346215, date('09/10/2025'))
--Raw Data <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

)
--	(SeqNum, HDTNum, Requester, Loan, NewTiAanalysis, CurTiAanalysis, ChangeNeeded)
SELECT 
		P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.NewDate "NewTiAanalysis",
		TT.OCCPROPINSPORDEREDDATE AS "CurTiAanalysis",
		case when date(P.NewDate) = COALESCE(cast(TT.OCCPROPINSPORDEREDDATE as varchar(20)), date('2999-01-01')) then 0 else -1 end as ChangeNeeded
	--	, TT.OCCLOANNUMBER
	--  , XX.INTSUBSERVICERLOANNUMBER
	from param P 
	inner join CELINK.TBLOCCUPANCY TT
	on    P.Loan = TT.OCCLOANNUMBER
	INNER JOIN CELINK.TBLLOANDATA XX
	on    TT.OCCLOANNUMBER = XX.INTSUBSERVICERLOANNUMBER 
	Order by P.SeqNum
with UR;

		-- data check
		select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded =  0 order by seqnum;  -- session.UY order by seqnum desc; -- 0 
		select * from DATAUPDT.HDTDataUpdt_TnIdata_SA where ChangeNeeded = -1 order by seqnum;  -- session.UY order by seqnum desc; -- all
		
		select
			SeqNum, HDTNum, Requester, Loan, 
			NewTiAanalysis "NewDate",
			CurTiAanalysis "CurDate_OccPropInsoOrderDate",
			ChangeNeeded
		from DATAUPDT.HDTDataUpdt_TnIdata_SA 
		where ChangeNeeded = -1 
		order by seqnum;  
		
/*
all 880
 SEQNUM HDTNUM REQUESTER     LOAN    NewDate    CurDate_OccPropInsoOrderDate CHANGENEEDED
 ------ ------ ------------- ------- ---------- ---------------------------- ------------
      1 199106 Abraham Perez   90408 2025-09-10 NULL                                   -1
      2 199106 Abraham Perez   90727 2025-09-10 2022-09-02                             -1
      3 199106 Abraham Perez 1006414 2025-09-10 2023-09-06                             -1
      4 199106 Abraham Perez 1031481 2025-09-10 2023-09-06                             -1
      5 199106 Abraham Perez 1092700 2025-09-10 2020-09-01                             -1
      6 199106 Abraham Perez 1095486 2025-09-10 2022-09-02                             -1
      7 199106 Abraham Perez 1131380 2025-09-10 2023-09-06                             -1
      8 199106 Abraham Perez 1132118 2025-09-10 NULL                                   -1
      9 199106 Abraham Perez 1133183 2025-09-10 NULL                                   -1

    870 199106 Abraham Perez 3342830 2025-09-10 NULL                                   -1
    871 199106 Abraham Perez 3342868 2025-09-10 NULL                                   -1
    872 199106 Abraham Perez 3342872 2025-09-10 NULL                                   -1
    873 199106 Abraham Perez 3343146 2025-09-10 NULL                                   -1
    874 199106 Abraham Perez 3343148 2025-09-10 NULL                                   -1
    875 199106 Abraham Perez 3343229 2025-09-10 NULL                                   -1
    876 199106 Abraham Perez 3343336 2025-09-10 NULL                                   -1
    877 199106 Abraham Perez 3343511 2025-09-10 NULL                                   -1
    878 199106 Abraham Perez 3343523 2025-09-10 NULL                                   -1
    879 199106 Abraham Perez 3344172 2025-09-10 NULL                                   -1
    880 199106 Abraham Perez 3346215 2025-09-10 NULL                                   -1

*/
		/*
		select
			SeqNum, HDTNum, Requester, Loan, 
			NewTiAanalysis "NewDate",
			CurTiAanalysis "CurDate_OccPropInsoOrderDate",
			ChangeNeeded
		from DATAUPDT.HDTDataUpdt_TnIdata_SA 
		where NewTiAanalysis <> date('2025-07-14') 
		order by seqnum;  
		-- SEQNUM HDTNUM REQUESTER LOAN NewDate CurDate_OccPropInsoOrderDate CHANGENEEDED
		-- ------ ------ --------- ---- ------- ---------------------------- ------------
		*/

----------------------------------------------------------------------------------------------------------------------------------------------
-- pre exec validation
select
		SeqNum,	HDTNum,	Requester, Loan, ChangeNeeded,
		NewTiAanalysis "NewDate",
		CurTiAanalysis "CurDate_OccPropInsoOrderDate",
		TT.OCCPROPINSPORDEREDDATE
from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
inner join celink.TBLOCCUPANCY TT 
ON Loan = TT.OCCLOANNUMBER	  
where UY.NewTiAanalysis <> date ('2999-01-01')	
and   UY.ChangeNeeded = -1
order by UY.seqnum
with ur;

/*
all 802
 SEQNUM HDTNUM REQUESTER     LOAN    CHANGENEEDED NewDate    CurDate_OccPropInsoOrderDate OCCPROPINSPORDEREDDATE
 ------ ------ ------------- ------- ------------ ---------- ---------------------------- ----------------------
      1 199106 Abraham Perez   90408           -1 2025-09-10 NULL                         NULL
      2 199106 Abraham Perez   90727           -1 2025-09-10 2022-09-02                   2022-09-02
      3 199106 Abraham Perez 1006414           -1 2025-09-10 2023-09-06                   2023-09-06
      4 199106 Abraham Perez 1031481           -1 2025-09-10 2023-09-06                   2023-09-06
      5 199106 Abraham Perez 1092700           -1 2025-09-10 2020-09-01                   2020-09-01
      6 199106 Abraham Perez 1095486           -1 2025-09-10 2022-09-02                   2022-09-02
      7 199106 Abraham Perez 1131380           -1 2025-09-10 2023-09-06                   2023-09-06
      8 199106 Abraham Perez 1132118           -1 2025-09-10 NULL                         NULL
      9 199106 Abraham Perez 1133183           -1 2025-09-10 NULL                         NULL

    870 199106 Abraham Perez 3342830           -1 2025-09-10 NULL                         NULL
    871 199106 Abraham Perez 3342868           -1 2025-09-10 NULL                         NULL
    872 199106 Abraham Perez 3342872           -1 2025-09-10 NULL                         NULL
    873 199106 Abraham Perez 3343146           -1 2025-09-10 NULL                         NULL
    874 199106 Abraham Perez 3343148           -1 2025-09-10 NULL                         NULL
    875 199106 Abraham Perez 3343229           -1 2025-09-10 NULL                         NULL
    876 199106 Abraham Perez 3343336           -1 2025-09-10 NULL                         NULL
    877 199106 Abraham Perez 3343511           -1 2025-09-10 NULL                         NULL
    878 199106 Abraham Perez 3343523           -1 2025-09-10 NULL                         NULL
    879 199106 Abraham Perez 3344172           -1 2025-09-10 NULL                         NULL
    880 199106 Abraham Perez 3346215           -1 2025-09-10 NULL                         NULL
*/

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
	-- notes ... column name from the generic !!!!!!!
	Select 
		SeqNum,	
		Loan as "Loan Number",
		'N'  as "Priority (Y/N)", 
		'0'   as "Note Step Number",
		''   as "Step Date Completed (YYYY-MM-DD)", 
	--   'Per HDT ' || HDTNum || ' (' || Requester || ') Occupancy ' || 
	   'Per HDT ' || HDTNum || ' Occupancy ' || 
		case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
		then  
			'Property Inspection Ordered date changed from ' ||
			case NewTiAanalysis 
			when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
			else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
			end
		else '' 
		end || '.' as "Loan Note" 
		from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
		where ChangeNeeded = -1
	Order by SeqNum 
	; 

/*
 SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
 ------ ----------- -------------- ---------------- -------------------------------- ------------------------------------------------------------------------------------------------
      1       90408 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
      2       90727 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from 2022-09-02 to 2025-09-10.
      3     1006414 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10.
      4     1031481 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10.
      5     1092700 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from 2020-09-01 to 2025-09-10.
      6     1095486 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from 2022-09-02 to 2025-09-10.
      7     1131380 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10.
      8     1132118 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
      9     1133183 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.

    872     3342872 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    873     3343146 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    874     3343148 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    875     3343229 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    876     3343336 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    877     3343511 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    878     3343523 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    879     3344172 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.
    880     3346215 N              0                                                 Per HDT 199106 Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.

*/
---------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Update ... test the join
select 
	UY.*,
	TT.OCCLOANNUMBER, TT.OCCPROPINSPORDEREDDATE
from 
(
	select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where NewTiAanalysis <> date ('2999-01-01')	
	and   ChangeNeeded = -1
	order by SeqNum
) UY (SeqNum,	HDTNum,	Requester, Loan, NewDate, ChangeNeeded)
inner join celink.TBLOCCUPANCY TT
ON UY.Loan = TT.OCCLOANNUMBER
order by UY.SeqNum
;

-- SEQNUM HDTNUM REQUESTER     LOAN    NEWDATE    CHANGENEEDED OCCLOANNUMBER OCCPROPINSPORDEREDDATE
-- ------ ------ ------------- ------- ---------- ------------ ------------- ----------------------
--      1 199106 Abraham Perez   90408 2025-09-10           -1       90408.0 NULL
--      2 199106 Abraham Perez   90727 2025-09-10           -1       90727.0 2022-09-02
--      3 199106 Abraham Perez 1006414 2025-09-10           -1     1006414.0 2023-09-06
--      4 199106 Abraham Perez 1031481 2025-09-10           -1     1031481.0 2023-09-06
--      5 199106 Abraham Perez 1092700 2025-09-10           -1     1092700.0 2020-09-01
--      6 199106 Abraham Perez 1095486 2025-09-10           -1     1095486.0 2022-09-02
--      7 199106 Abraham Perez 1131380 2025-09-10           -1     1131380.0 2023-09-06
--      8 199106 Abraham Perez 1132118 2025-09-10           -1     1132118.0 NULL
--      9 199106 Abraham Perez 1133183 2025-09-10           -1     1133183.0 NULL
--
--    872 199106 Abraham Perez 3342872 2025-09-10           -1     3342872.0 NULL
--    873 199106 Abraham Perez 3343146 2025-09-10           -1     3343146.0 NULL
--    874 199106 Abraham Perez 3343148 2025-09-10           -1     3343148.0 NULL
--    875 199106 Abraham Perez 3343229 2025-09-10           -1     3343229.0 NULL
--    876 199106 Abraham Perez 3343336 2025-09-10           -1     3343336.0 NULL
--    877 199106 Abraham Perez 3343511 2025-09-10           -1     3343511.0 NULL
--    878 199106 Abraham Perez 3343523 2025-09-10           -1     3343523.0 NULL
--    879 199106 Abraham Perez 3344172 2025-09-10           -1     3344172.0 NULL
--    880 199106 Abraham Perez 3346215 2025-09-10           -1     3346215.0 NULL

---------------------------------
-- updateeeee
MERGE INTO celink.TBLOCCUPANCY TT
USING
	(

	select
	SeqNum,	HDTNum,	Requester, Loan, NewTiAanalysis, ChangeNeeded
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where NewTiAanalysis <> date ('2999-01-01')	
	and   ChangeNeeded = -1
	order by SeqNum
	
	) 
	UY (SeqNum,	HDTNum,	Requester, Loan, NewDate, ChangeNeeded)
	ON Loan = TT.OCCLOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
TT.OCCPROPINSPORDEREDDATE = case when UY.NewDate = date ('1900-01-01') then NULL else UY.NewDate end
;

-----------------------------------------------------------------------------------------------------------------------------------------------------
-- VALIDATION 
-- all
select
		SeqNum,	HDTNum,	Requester, Loan, ChangeNeeded, 
		NewTiAanalysis "NewDate",
		CurTiAanalysis "CurDate_OccPropInsoOrderDate",
		TT.OCCPROPINSPORDEREDDATE
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	inner join celink.TBLOCCUPANCY TT 
	ON Loan = TT.OCCLOANNUMBER	  
--	where UY.NewTiAanalysis <> date ('2999-01-01')	
--	and   UY.ChangeNeeded = -1
	order by UY.seqnum
with ur;

-- SEQNUM HDTNUM REQUESTER     LOAN    CHANGENEEDED NewDate    CurDate_OccPropInsoOrderDate OCCPROPINSPORDEREDDATE
-- ------ ------ ------------- ------- ------------ ---------- ---------------------------- ----------------------
--      1 199106 Abraham Perez   90408           -1 2025-09-10 NULL                         2025-09-10
--      2 199106 Abraham Perez   90727           -1 2025-09-10 2022-09-02                   2025-09-10
--      3 199106 Abraham Perez 1006414           -1 2025-09-10 2023-09-06                   2025-09-10
--      4 199106 Abraham Perez 1031481           -1 2025-09-10 2023-09-06                   2025-09-10
--      5 199106 Abraham Perez 1092700           -1 2025-09-10 2020-09-01                   2025-09-10
--      6 199106 Abraham Perez 1095486           -1 2025-09-10 2022-09-02                   2025-09-10
--      7 199106 Abraham Perez 1131380           -1 2025-09-10 2023-09-06                   2025-09-10
--      8 199106 Abraham Perez 1132118           -1 2025-09-10 NULL                         2025-09-10
--      9 199106 Abraham Perez 1133183           -1 2025-09-10 NULL                         2025-09-10
--
--    870 199106 Abraham Perez 3342830           -1 2025-09-10 NULL                         2025-09-10
--    871 199106 Abraham Perez 3342868           -1 2025-09-10 NULL                         2025-09-10
--    872 199106 Abraham Perez 3342872           -1 2025-09-10 NULL                         2025-09-10
--    873 199106 Abraham Perez 3343146           -1 2025-09-10 NULL                         2025-09-10
--    874 199106 Abraham Perez 3343148           -1 2025-09-10 NULL                         2025-09-10
--    875 199106 Abraham Perez 3343229           -1 2025-09-10 NULL                         2025-09-10
--    876 199106 Abraham Perez 3343336           -1 2025-09-10 NULL                         2025-09-10
--    877 199106 Abraham Perez 3343511           -1 2025-09-10 NULL                         2025-09-10
--    878 199106 Abraham Perez 3343523           -1 2025-09-10 NULL                         2025-09-10
--    879 199106 Abraham Perez 3344172           -1 2025-09-10 NULL                         2025-09-10
--    880 199106 Abraham Perez 3346215           -1 2025-09-10 NULL                         2025-09-10

-- Validation after ... only for change needed
select
		SeqNum,	HDTNum,	Requester, Loan, ChangeNeeded, 
		NewTiAanalysis "NewDate",
		CurTiAanalysis "CurDate_OccPropInsoOrderDate",
		TT.OCCPROPINSPORDEREDDATE
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	inner join celink.TBLOCCUPANCY TT 
	ON Loan = TT.OCCLOANNUMBER	  
	where UY.NewTiAanalysis <> date ('2999-01-01')	
	and   UY.ChangeNeeded = -1
	order by UY.seqnum
with ur;


----------------------------------------------------------------------------------------------------------------------------------------------
-- notes for bulk ... column name from the generic !!!!!!!
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	'0'   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
   'Per HDT ' || HDTNum || ' (' || Requester || ') Occupancy ' || 
	case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
	then  
		'Property Inspection Ordered date changed from ' ||
		case NewTiAanalysis 
		when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
		else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
		end
	else '' 
	end || '.' as "Loan Note" 
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where ChangeNeeded = -1
Order by SeqNum 
; 

--C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTUpdtNotes_ 132108.csv

--    792     3340924 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    793     3341058 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    794     3341262 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    795     3341413 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    796     3341489 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    797     3341708 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    798     3341731 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    799     3341855 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    800     3342426 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    801     3342551 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.
--    802     3343905 N              0                                                 Per HDT 196562 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-08-08.

-------------------------------------------------------------------------------------------------------------------------------------
---- Notes update
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
Select 
--	SeqNum ,
	Loan	
	,
	'Per HDT ' || HDTNum || ' (' || Requester || ') Occupancy ' || 
	case when NewTiAanalysis <> date ('2999-01-01')  -- there should not be any case of 2999-01-01 nor 1900-01-01
	then  
		'Property Inspection Ordered date changed from ' ||
		case NewTiAanalysis 
		when date('1900-01-01') then COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to <Blank>' 
		else                         COALESCE(cast(CurTiAanalysis as varchar(20)), '<Blank>') || ' to ' || cast(NewTiAanalysis as varchar(20))  
		end
	else '' 
	end || '.' as "Loan Note" 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
	from DATAUPDT.HDTDataUpdt_TnIdata_SA UY  
	where ChangeNeeded = -1

Order by SeqNum 
; 

-- LOAN    Loan Note                                                                                                        3                          4     5 6
-- ------- ---------------------------------------------------------------------------------------------------------------- -------------------------- ----- - -
--   90408 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
--   90727 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2022-09-02 to 2025-09-10. 2025-09-10 12:08:07.313633 tkato 0 0
-- 1006414 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10. 2025-09-10 12:08:07.313633 tkato 0 0
-- 1031481 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10. 2025-09-10 12:08:07.313633 tkato 0 0
-- 1092700 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2020-09-01 to 2025-09-10. 2025-09-10 12:08:07.313633 tkato 0 0
-- 1095486 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2022-09-02 to 2025-09-10. 2025-09-10 12:08:07.313633 tkato 0 0
-- 1131380 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10. 2025-09-10 12:08:07.313633 tkato 0 0
-- 1132118 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 1133183 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
--
-- 3342830 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3342868 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3342872 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3343146 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3343148 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3343229 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3343336 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3343511 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3343523 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3344172 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0
-- 3346215 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    2025-09-10 12:08:07.313633 tkato 0 0

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
 SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                     CHRUSERID BLNPRIORITY NOTESTEP
 ------ -------------------------- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------- --------- ----------- --------
      1 2025-09-10 12:09:05.378045    213719880                  90408.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
      2 2025-09-10 12:09:05.378045    213719881                  90727.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2022-09-02 to 2025-09-10. tkato               0        0
      3 2025-09-10 12:09:05.378045    213719882                1006414.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10. tkato               0        0
      4 2025-09-10 12:09:05.378045    213719883                1031481.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10. tkato               0        0
      5 2025-09-10 12:09:05.378045    213719884                1092700.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2020-09-01 to 2025-09-10. tkato               0        0
      6 2025-09-10 12:09:05.378045    213719885                1095486.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2022-09-02 to 2025-09-10. tkato               0        0
      7 2025-09-10 12:09:05.378045    213719886                1131380.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from 2023-09-06 to 2025-09-10. tkato               0        0
      8 2025-09-10 12:09:05.378045    213719887                1132118.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
      9 2025-09-10 12:09:05.378045    213719888                1133183.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0

    869 2025-09-10 12:09:05.378045    213720748                3342814.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    870 2025-09-10 12:09:05.378045    213720749                3342830.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    871 2025-09-10 12:09:05.378045    213720750                3342868.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    872 2025-09-10 12:09:05.378045    213720751                3342872.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    873 2025-09-10 12:09:05.378045    213720752                3343146.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    874 2025-09-10 12:09:05.378045    213720753                3343148.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    875 2025-09-10 12:09:05.378045    213720754                3343229.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    876 2025-09-10 12:09:05.378045    213720755                3343336.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    877 2025-09-10 12:09:05.378045    213720756                3343511.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    878 2025-09-10 12:09:05.378045    213720757                3343523.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    879 2025-09-10 12:09:05.378045    213720758                3344172.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0
    880 2025-09-10 12:09:05.378045    213720759                3346215.0 Per HDT 199106 (Abraham Perez) Occupancy Property Inspection Ordered date changed from <Blank> to 2025-09-10.    tkato               0        0

*/
----------------------------------------------------------------------------------------------------------------------------------------------
-- end
	