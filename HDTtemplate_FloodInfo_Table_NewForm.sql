

/* Samples ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

Loan Number	NFIP Map Number	Map Effective Date	Flood zone	LOMC Date	Flood Certification Number	Flood Vendor	HDT		Requester			SeqNum
A-----------B-------------------C---------------D-----------E-----------F---------------------------G---------------H---	I-----------		J----- 
3014026		12115C0134G			3/27/2024		X			3/28/2024	2112098823					SVCLK			160863	Laxmikant Chilveri	1
3245332		12115C0331G			3/27/2024		AE			no change	1217160887					SVCLK			160862	Laxmikant Chilveri	2
3278414		12115C0238G			3/27/2024		AE			no change	1429553017					SVCLK			160862	Laxmikant Chilveri	3

="("&J2&", "&H2&", '"&I2&"', "&A2&", '"&B2&"', date('"&TEXT(C2,"MM/DD/YYYY")&"'), '"&TRIM(D2)&"', "&IF(E2="no change","date('01/01/2999')","date('"& TEXT(E2,"MM/DD/YYYY") &"')" ) & ", '"&F2&"', '"&G2&"'),"

Flood information updated 17 loans.  Peer review pending.

*/


/*
-- my value formula

="("&J2&", "&H2&", '"&I2&"', "&A2&", '"&B2&"', date('"&TEXT(C2,"MM/DD/YYYY")&"'), '"&TRIM(D2)&"', "&IF(E2="no change","date('01/01/2999')","date('"& TEXT(E2,"MM/DD/YYYY") &"')" ) & ", "&F2&", '"&trim(G2)&"'),"
="("&J2&", "&H2&", '"&I2&"', "&A2&", '"&B2&"', date('"&TEXT(C2,"MM/DD/YYYY")&"'), '"&TRIM(D2)&"', "&IF(E2="no change","date('01/01/2999')","date('"& TEXT(E2,"MM/DD/YYYY") &"')" ) & ", '"& right(concat("000000000000", F2),12) &"', '"&trim(G2)&"'),"

-- no change val
="("&J2&", 197519, 'Mukesh Ojha', "&A2&", '"&B2&"', date('"&TEXT(C2,"MM/DD/YYYY")&"'), '"&TRIM(D2)&"', "&IF(E2="no change","date('01/01/2999')","date('"& TEXT(E2,"MM/DD/YYYY") &"')" ) & ", '"&IF(F2="no change", "000000000000", right(concat("000000000000", F2),12)) & "', '"&trim(G2)&"'),"

-- for Combined ticket, nochange
="("&J2&", "&H2&", '"&I2&"', "&A2&", '"&B2&"', date('"&TEXT(C2,"MM/DD/YYYY")&"'), '"&TRIM(D2)&"', "&IF(E2="no change","date('01/01/2999')","date('"& TEXT(E2,"MM/DD/YYYY") &"')" ) & ", '"&IF(F2="no change", "000000000000", right(concat("000000000000", F2),12)) & "', '"&trim(G2)&"'),"


Loan Number	NFIP Map Number	Map Effective Date	Flood zone	LOMC Date	Flood Certification Number	Flood Vendor	HDT		Requester			SeqNum
A-----------B-------------------C---------------D-----------E-----------F---------------------------G---------------H---	I-----------		J----- 
3014026		12115C0134G			3/27/2024		X			3/28/2024	2112098823					SVCLK			160863	Laxmikant Chilveri	1
3245332		12115C0331G			3/27/2024		AE			no change	1217160887					SVCLK			160862	Laxmikant Chilveri	2
3278414		12115C0238G			3/27/2024		AE			no change	1429553017					SVCLK			160862	Laxmikant Chilveri	3
3122219		31055C0217J			3/25/2025		A			no change	000000000000				SVCLK

(1, 160863, 'Laxmikant Chilveri', 3014026, '12115C0134G', date('03/27/2024'), 'X', date('03/28/2024'), '002112098823', 'SVCLK'),

-- my value
((1, 167000, 'Laxmikant Chilveri', 3185961, '23005C0577F', date('06/20/2024'), 'X', date('06/21/2024'), '1208771723', 'SVCLK'),
(2, 167000, 'Laxmikant Chilveri', 3196414, '23005C0626F', date('06/20/2024'), 'C', date('06/21/2024'), '1212232672', 'SVCLK'),
(1, 165324, 'Nikita Vanjeri', 3229268, '06079C1601J', date('06/06/2024'), 'X', date('01/01/2999'), '1216697826', 'SVCLK'),
(1, 165324, 'Nikita Vanjeri', 3166906, '06079C1601J', date('06/06/2024'), 'X', date('01/01/2999'), '1206984410', 'SVCLK'),
(1, 165185, 'Laxmikant Chilveri', 1388061, 'XXXXXXXXXXX', date('01/20/2010'), 'X500', date('02/20/2024'), '000000000000', 'COREL'),
(1, 164771, 'Laxmikant Chilveri', 3184656, '08005C0432N', date('04/11/2024'), 'AE', date('01/01/2999'), '1210925177', 'SVCLK'),
(2, 164771, 'Laxmikant Chilveri', 3011731, '47073C0116E', date('06/06/2024'), 'X', date('01/01/2999'), '2107189017', 'SVCLK'),
(1, 164516, 'Laxmikant Chilveri', 3256227, 'XXXXXXXXXXX', date('09/25/2009'), 'AE', date('04/22/2024'), '000000000000', 'COREL'),
(2, 164515, 'Laxmikant Chilveri', 1381639, 'XXXXXXXXXXX', date('05/22/2024'), 'AE', date('01/01/2999'), '000000000000', 'COREL'),
(3, 164515, 'Laxmikant Chilveri', 1354799, 'XXXXXXXXXXX', date('05/22/2024'), 'X500', date('01/01/2999'), '000000000000', 'COREL'),
(4, 164515, 'Laxmikant Chilveri', 1362171, 'XXXXXXXXXXX', date('05/08/2024'), 'AE', date('01/01/2999'), '000000000000', 'COREL'),
(5, 164515, 'Laxmikant Chilveri', 3191399, 'XXXXXXXXXXX', date('03/27/2024'), 'AE', date('01/01/2999'), '000000000000', 'COREL'),

--*--
Flood information updated 18 loans.  Peer review pending.
Flood information updated 93 loans.  Peer review pending..  *Loan #2200258 (row35) does not exist 
* below 27 loans listed twice.

*Flood Vendor "Servicelink" populated as "DATAV" 
*Flood Vendor "Dataverify"  populated as "SVCLK",
*The value under column [NFIP Map Number] is separated and populated as below ...
1st 6 characters -> "NFIP Community Number:"
2nd 4 characters -> "Map Panel Number: " 
last 1 character -> "SUFIX :"
*/


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250828
198214	Ted Kato	Flood data	Mukesh Ojha		Low	8/28/2025 17:16
="("&J2 & ", 198214, 'Mukesh Ojha', "&A2&", '"&B2&"', date('"&TEXT(C2,"MM/DD/YYYY")&"'), '"&TRIM(D2)&"', "&IF(E2="no change","date('01/01/2999')","date('"& TEXT(E2,"MM/DD/YYYY") &"')" ) & ", '"&IF(F2="no change", "000000000000", right(concat("000000000000", F2),12)) & "', '"&trim(G2)&"'),"
Flood information updated 36 loans.  Peer review pending.
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* -- create Global Temp  ... stopped using, table replaced
declare global TEMPORARY TABLE SESSION.TmpMyVal
(
	RowNum integer,
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan  decimal(18,0),
NewVend     varchar(30), 
NewMapNum   varchar(20), 
NewMapDate  date, 
NewZone		varchar(10)
)	
ON COMMIT PRESERVE ROWS;
*/

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*-- DATAUPDT Table for  
create table DATAUPDT.HDTDataUpdt_Flood2X  
	(
	RowNum integer,
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan  decimal(18,0),

	NewMapNum   varchar(20), 
	NewMapDate  date, 
	NewZone		varchar(10),
	
	NewLOMCDate  date, 
	NewFloodCert char(12),
	NewVend     varchar(30) 

	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTDataUpdt_Flood2X  TO group db2_ast;
	
--	-- drop table DATAUPDT.HDTDataUpdt_Flood2X;
select * from DATAUPDT.HDTDataUpdt_Flood2X;
*/

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
DELETE FROM DATAUPDT.HDTDataUpdt_Flood2X;

-------------------------------------------------------------------------------------------
insert into DATAUPDT.HDTDataUpdt_Flood2X
(
	RowNum, -- integer,
	SeqNum, -- integer,
	HDTNum, -- integer, 
	Requester, -- varchar(30) ,
	Loan, --  decimal(18,0),

	NewMapNum, --   varchar(20), 
	NewMapDate, --  date, 
	NewZone, --		varchar(10),
	
	NewLOMCDate, --  date, 
	NewFloodCert, -- integer,
	NewVend 	 --  varchar(30) 
)

with P 
(
    SeqNum, HDTNum, Requester, Loan, 
	NewMapNum, --   varchar(20), 
	NewMapDate, --  date, 
	NewZone, --		varchar(10),
	
	NewLOMCDate, --  date, 
	NewFloodCert, -- integer,
	NewVend 	 --  varchar(30) 
) as
(VALUES

(1, 198214, 'Mukesh Ojha', 3275741, '12009C0539H', date('01/29/2021'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(2, 198214, 'Mukesh Ojha', 3286443, '34027C0191F', date('08/19/2025'), 'AE', date('01/01/2999'), '000000000000', 'SVCLK'),
(3, 198214, 'Mukesh Ojha', 3175486, '12033C0340J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(4, 198214, 'Mukesh Ojha', 3181912, '34027C0181F', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(5, 198214, 'Mukesh Ojha', 3191837, '12033C0430J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(6, 198214, 'Mukesh Ojha', 1303072, '12033C0430J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(7, 198214, 'Mukesh Ojha', 3232520, '12033C0330J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(8, 198214, 'Mukesh Ojha', 3104354, '34027C0179F', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(9, 198214, 'Mukesh Ojha', 3294596, '12033C0440J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(10, 198214, 'Mukesh Ojha', 3284094, '12033C0365J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(11, 198214, 'Mukesh Ojha', 1004833, '12033C0430J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(12, 198214, 'Mukesh Ojha', 1204477, '34027C0183F', date('08/19/2025'), 'BX', date('01/01/2999'), '000000000000', 'SVCLK'),
(13, 198214, 'Mukesh Ojha', 1204382, '12033C0420J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(14, 198214, 'Mukesh Ojha', 1205619, '12033C0430J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(15, 198214, 'Mukesh Ojha', 1244973, '12033C0280J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(16, 198214, 'Mukesh Ojha', 1097471, '12033C0405J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(17, 198214, 'Mukesh Ojha', 1138375, '12033C0435J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(18, 198214, 'Mukesh Ojha', 1141397, '12033C0290J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(19, 198214, 'Mukesh Ojha', 1201878, '12033C0320J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(20, 198214, 'Mukesh Ojha', 1165591, '12033C0440J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(21, 198214, 'Mukesh Ojha', 1166241, '13287C0135B', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(22, 198214, 'Mukesh Ojha', 1168915, '12033C0345J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(23, 198214, 'Mukesh Ojha', 1175657, '12033C0365J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(24, 198214, 'Mukesh Ojha', 3169992, '12033C0440J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(25, 198214, 'Mukesh Ojha', 1202483, '12033C0410J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(26, 198214, 'Mukesh Ojha', 1214490, '12033C0410J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(27, 198214, 'Mukesh Ojha', 1202153, '12033C0420J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(28, 198214, 'Mukesh Ojha', 3290741, '12033C0345J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(29, 198214, 'Mukesh Ojha', 1239709, '12033C0440J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(30, 198214, 'Mukesh Ojha', 1244799, '12033C0433J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(31, 198214, 'Mukesh Ojha', 3328419, '12033C0533J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(32, 198214, 'Mukesh Ojha', 1267702, '34027C0183F', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(33, 198214, 'Mukesh Ojha', 1271403, '12033C0440J', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(34, 198214, 'Mukesh Ojha', 1306238, '34027C0189F', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(35, 198214, 'Mukesh Ojha', 1310031, '13277C0128F', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK'),
(36, 198214, 'Mukesh Ojha', 1348907, '34027C0187F', date('08/19/2025'), 'X', date('01/01/2999'), '000000000000', 'SVCLK')

)
select 
	ROW_NUMBER() OVER (partition by uy.Loan order by uy.SeqNum) as RowNum,
	uy.SeqNum, uy.HDTNum, uy.Requester, uy.Loan, 
	uy.NewMapNum, 
	uy.NewMapDate, 
	uy.NewZone, 
	uy.NewLOMCDate, 
	uy.NewFloodCert,
	uy.NewVend 
from P uy
order by Loan
--for read only with ur;	
;

--------------------------------------------------------------------------------------------------------------------
select * from DataUPDT.HDTDataUpdt_Flood2X order by SeqNum;
select * from DataUPDT.HDTDataUpdt_Flood2X where rownum = 1 order by loan; --
select * from DataUPDT.HDTDataUpdt_Flood2X where rownum = 2 order by loan; -- no dupe
/*
 ROWNUM SEQNUM HDTNUM REQUESTER    LOAN    NEWMAPNUM   NEWMAPDATE NEWZONE NEWLOMCDATE NEWFLOODCERT NEWVEND
 ------ ------ ------ ------------ ------- ----------- ---------- ------- ----------- ------------ -------

select * from DataUPDT.HDTDataUpdt_Flood2X where LOAN = 3261989 order by seqnum;
 ROWNUM SEQNUM HDTNUM REQUESTER    LOAN    NEWMAPNUM   NEWMAPDATE NEWZONE NEWLOMCDATE NEWFLOODCERT NEWVEND
 ------ ------ ------ ------------ ------- ----------- ---------- ------- ----------- ------------ -------

*/

select HDTNUM "HDT #", count(*) "Loan Count"  from DATAUPDT.HDTDataUpdt_Flood2X group by HDTNUM; 
select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count"  from DATAUPDT.HDTDataUpdt_Flood2X group by HDTNUM, Requester; 

/*
 HDT #  Requester   Loan Count
 ------ ----------- ----------
 198214 Mukesh Ojha         36
Flood information updated 36 loans.  Peer review pending.
*/

-- ------------ ------------ ------------------------ ----------- ------------------------ ------------------ ---------------------- ------------------- ------------- -------------- ------------ ------------ -------------- ------------ ----- ----------- ---- ---------------------- ---------------- ---------------- ----------- ----------- ------ ------------ ---------- -------- ------------------- ------------------ ------------ ------------- ---------------
-- backup
-- ------------ ------------ ------------------------ ----------- ------------------------ ------------------ ---------------------- ------------------- ------------- -------------- ------------ ------------ -------------- ------------ ----- ----------- ---- ---------------------- ---------------- ---------------- ----------- ----------- ------ ------------ ---------- -------- ------------------- ------------------ ------------ ------------- ---------------
select 
RowNum,
SeqNum, HDTNum, Requester, 
Loan,			TT.INTSUBSERVICERLOANNUMBER,

NewMapNum,      
left(NewMapNum, 6)         as NewNFIP, TT.NFIPCOMMNUM as CurNFIP,
substring(NewMapNum, 7, 4) as NewMap,  TT.MAPPANELNUM as CurMap,
right(NewMapNum, 1)        as NewSFX,  TT.SUFFIX      as CurSFX,

NewMapDate,		TT.MAPPANELDATE as CurMapDate,
NewZone,		TT.CHRFLOODZONE as CurZone,

NewLOMCDate,  	TT.LOMCDATE CurLOMCDate, 
NewFloodCert, 	TT.FLOODCERTNUM CurFloodCert,

NewVend,        TT.CURRENTFLOODVENDOR as CurVend

from DataUPDT.HDTDataUpdt_Flood2X
left outer join CELINK.TBLHAZARDINSURANCE TT
--inner join CELINK.TBLHAZARDINSURANCE TT
on    Loan = TT.INTSUBSERVICERLOANNUMBER

where RowNum = 1
--where SeqNum >=2000
--where SeqNum <2000

order by SeqNum
for read only with ur;

/*
 ROWNUM SEQNUM HDTNUM REQUESTER   LOAN    INTSUBSERVICERLOANNUMBER NEWMAPNUM   NEWNFIP CURNFIP NEWMAP CURMAP NEWSFX CURSFX NEWMAPDATE CURMAPDATE NEWZONE CURZONE    NEWLOMCDATE CURLOMCDATE NEWFLOODCERT CURFLOODCERT NEWVEND CURVEND
 ------ ------ ------ ----------- ------- ------------------------ ----------- ------- ------- ------ ------ ------ ------ ---------- ---------- ------- ---------- ----------- ----------- ------------ ------------ ------- -------
      1      1 198214 Mukesh Ojha 3275741                3275741.0 12009C0539H 12009C          0539          H             2021-01-29 NULL       X       VE         2999-01-01  NULL        000000000000              SVCLK   NULL
      1      2 198214 Mukesh Ojha 3286443                3286443.0 34027C0191F 34027C          0191          F             2025-08-19 NULL       AE      A8         2999-01-01  NULL        000000000000              SVCLK   NULL
      1      3 198214 Mukesh Ojha 3175486                3175486.0 12033C0340J 12033C          0340          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1      4 198214 Mukesh Ojha 3181912                3181912.0 34027C0181F 34027C          0181          F             2025-08-19 NULL       X       C          2999-01-01  NULL        000000000000              SVCLK   NULL
      1      5 198214 Mukesh Ojha 3191837                3191837.0 12033C0430J 12033C          0430          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1      6 198214 Mukesh Ojha 1303072                1303072.0 12033C0430J 12033C          0430          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1      7 198214 Mukesh Ojha 3232520                3232520.0 12033C0330J 12033C          0330          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1      8 198214 Mukesh Ojha 3104354                3104354.0 34027C0179F 34027C          0179          F             2025-08-19 NULL       X       C          2999-01-01  NULL        000000000000              SVCLK   NULL
      1      9 198214 Mukesh Ojha 3294596                3294596.0 12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     10 198214 Mukesh Ojha 3284094                3284094.0 12033C0365J 12033C          0365          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     11 198214 Mukesh Ojha 1004833                1004833.0 12033C0430J 12033C  NULL    0430   NULL   J      NULL   2025-08-19 2007-09-28 X       X          2999-01-01  NULL        000000000000 NULL         SVCLK   NULL
      1     12 198214 Mukesh Ojha 1204477                1204477.0 34027C0183F 34027C          0183   0      F             2025-08-19 NULL       BX      X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     13 198214 Mukesh Ojha 1204382                1204382.0 12033C0420J 12033C          0420   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     14 198214 Mukesh Ojha 1205619                1205619.0 12033C0430J 12033C          0430   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     15 198214 Mukesh Ojha 1244973                1244973.0 12033C0280J 12033C          0280          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     16 198214 Mukesh Ojha 1097471                1097471.0 12033C0405J 12033C          0405          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     17 198214 Mukesh Ojha 1138375                1138375.0 12033C0435J 12033C          0435          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     18 198214 Mukesh Ojha 1141397                1141397.0 12033C0290J 12033C          0290          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     19 198214 Mukesh Ojha 1201878                1201878.0 12033C0320J 12033C          0320   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     20 198214 Mukesh Ojha 1165591                1165591.0 12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     21 198214 Mukesh Ojha 1166241                1166241.0 13287C0135B 13287C          0135          B             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     22 198214 Mukesh Ojha 1168915                1168915.0 12033C0345J 12033C          0345   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     23 198214 Mukesh Ojha 1175657                1175657.0 12033C0365J 12033C          0365   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     24 198214 Mukesh Ojha 3169992                3169992.0 12033C0440J 12033C          0440   1203   J             2025-08-19 2006-09-29 X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     25 198214 Mukesh Ojha 1202483                1202483.0 12033C0410J 12033C          0410   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     26 198214 Mukesh Ojha 1214490                1214490.0 12033C0410J 12033C          0410   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     27 198214 Mukesh Ojha 1202153                1202153.0 12033C0420J 12033C          0420   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     28 198214 Mukesh Ojha 3290741                3290741.0 12033C0345J 12033C          0345          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     29 198214 Mukesh Ojha 1239709                1239709.0 12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     30 198214 Mukesh Ojha 1244799                1244799.0 12033C0433J 12033C          0433   0      J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     31 198214 Mukesh Ojha 3328419                3328419.0 12033C0533J 12033C          0533   1203   J             2025-08-19 2006-09-29 X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     32 198214 Mukesh Ojha 1267702                1267702.0 34027C0183F 34027C          0183          F             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     33 198214 Mukesh Ojha 1271403                1271403.0 12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     34 198214 Mukesh Ojha 1306238                1306238.0 34027C0189F 34027C          0189          F             2025-08-19 NULL       X       C          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     35 198214 Mukesh Ojha 1310031                1310031.0 13277C0128F 13277C          0128          F             2025-08-19 NULL       X       X          2999-01-01  NULL        000000000000              SVCLK   NULL
      1     36 198214 Mukesh Ojha 1348907                1348907.0 34027C0187F 34027C          0187          F             2025-08-19 NULL       X       C          2999-01-01  NULL        000000000000              SVCLK   NULL

*/

-------------------------------------------------------------------------------------------------------
-- note value creation
select 
--SeqNum,	

'(' || 
Loan || ', ' ||
'''Per HDT ' || P.HDTNum || ' ' 
|| 'Hazard Insurance tab updated - '
|| 

--20240820 P.NewVend check implemented
CASE when P.NewVend = 'XXXXX'
THEN ''
ELSE
	case when P.CurVend = P.NewVend
	then ''
	else ' Flood Vendor from '  || COALESCE(cast(P.CurVend as varchar(50)), '<Blank>') || ' to ' || P.NewVend || '.' 
	end
END
--|| '. '

||
case when NewMapNum = 'XXXXXXXXXXX' 
then ' '
else
' NFIP Community Number from ' || case when P.CurNFIP = '' then '<Blank>' else COALESCE(cast(P.CurNFIP as varchar(50)), '<Blank>') end  || ' to ' || P.NewNFIP || '.' 
|| ' Map Panel Number from '      || case when P.CurMap  = '' then '<Blank>' else trim( COALESCE(cast(P.CurMap  as varchar(50)), '<Blank>') ) end  || ' to ' || TRIM(P.NewMap) || '.' 
|| ' Suffix from '                || case when P.CurSFX  = '' then '<Blank>' else COALESCE(cast(P.CurSFX  as varchar(50)), '<Blank>') end  || ' to ' || P.NewSFX || '.' 
end

||
case when NewMapDate = date('2999-01-01')
then ''
else 
' Map Panel Date from '  || COALESCE(cast(P.CurMapDate as varchar(50)), '<Blank>') || ' to ' || P.NewMapDate || '.'
end

||
case when P.CurZone = P.NewZone 
then '' 
else ' Flood Zone from '          || P.CurZone || ' to ' || P.NewZone || '.' 
end

||
case when NewLOMCDate = date('2999-01-01')
then ''
else 
' LOMC Date from '  || COALESCE(cast(P.CurLOMCDate as varchar(50)), '<Blank>') || ' to ' || P.NewLOMCDate || '.'
end

||
case when NewFloodCert = '000000000000'
then ''
else 
--' Flood Cert from '  || COALESCE(cast(P.CurFloodCert as varchar(50)), '<Blank>') || ' to ' || P.NewFloodCert || '.'
' Flood Cert from '  || 
case when ((COALESCE(cast(trim(P.CurFloodCert) as varchar(50)), '<Blank>') = '<Blank>') or (P.CurFloodCert = '            '))  
then '<Blank>' 
else
P.CurFloodCert 
end || ' to ' || trim(P.NewFloodCert) || '.'
end

|| '''' || ', ' 
|| 'CURRENT_TIMESTAMP, '
|| '''tkato'', 0, 0), '
as "Note Insert Value"
from
(
select 
	SeqNum, HDTNum, Requester, 
	Loan,			TT.INTSUBSERVICERLOANNUMBER,
	NewVend,        TT.CURRENTFLOODVENDOR as CurVend,
	
	NewMapNum,      
	left(NewMapNum, 6) as NewNFIP, TT.NFIPCOMMNUM as CurNFIP,
	substring(NewMapNum, 7, 4) as NewMap, TT.MAPPANELNUM as CurMap,
	right(NewMapNum, 1) as NewSFX, TT.SUFFIX as CurSFX,
	
	NewMapDate,     TT.MAPPANELDATE as CurMapDate,
	NewZone,        trim(TT.CHRFLOODZONE) as CurZone,

NewLOMCDate,  	TT.LOMCDATE CurLOMCDate, 
NewFloodCert, 	TT.FLOODCERTNUM CurFloodCert

from DataUPDT.HDTDataUpdt_Flood2X UY 
inner join CELINK.TBLHAZARDINSURANCE TT
on    UY.Loan = TT.INTSUBSERVICERLOANNUMBER

where UY.RowNum = 1
--where SeqNum >=2000
--where SeqNum <2000

order by UY.SeqNum
) P
;


-------------------------------------------------------
-- verify before update
select 
	SeqNum, HDTNum, Requester, 
	Loan,			TT.INTSUBSERVICERLOANNUMBER,
	NewVend,        TT.CURRENTFLOODVENDOR as CurVend,
	
	NewMapNum,      
	left(NewMapNum, 6) as NewNFIP, TT.NFIPCOMMNUM as CurNFIP,
	TRIM(substring(NewMapNum, 7, 4)) as NewMap, TT.MAPPANELNUM as CurMap,
	right(NewMapNum, 1) as NewSFX, TT.SUFFIX as CurSFX,
	
	NewMapDate,     TT.MAPPANELDATE as CurMapDate,
	NewZone,        trim(TT.CHRFLOODZONE) as CurZone,

NewLOMCDate,  	TT.LOMCDATE CurLOMCDate, 
NewFloodCert, 	TT.FLOODCERTNUM CurFloodCert, length(FLOODCERTNUM), trim(FLOODCERTNUM)

from DataUPDT.HDTDataUpdt_Flood2X UY 
inner join CELINK.TBLHAZARDINSURANCE TT
on    UY.Loan = TT.INTSUBSERVICERLOANNUMBER

where UY.RowNum = 1
--where SeqNum >=2000
--where SeqNum <2000

order by UY.SeqNum
;

/*

 Note Insert Value
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 (3275741, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12009C. Map Panel Number from <Blank> to 0539. Suffix from <Blank> to H. Map Panel Date from <Blank> to 2021-01-29. Flood Zone from VE to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3286443, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0191. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from A8 to AE.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3175486, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0340. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3181912, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0181. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3191837, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1303072, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3232520, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0330. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3104354, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0179. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3294596, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3284094, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0365. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1004833, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from 2007-09-28 to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1204477, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from 0 to 0183. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from X to BX.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1204382, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0420. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1205619, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1244973, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0280. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1097471, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0405. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1138375, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0435. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1141397, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0290. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1201878, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0320. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1165591, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1166241, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 13287C. Map Panel Number from <Blank> to 0135. Suffix from <Blank> to B. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1168915, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0345. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1175657, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0365. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3169992, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 1203 to 0440. Suffix from <Blank> to J. Map Panel Date from 2006-09-29 to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1202483, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0410. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1214490, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0410. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1202153, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0420. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3290741, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0345. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1239709, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1244799, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0433. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3328419, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 1203 to 0533. Suffix from <Blank> to J. Map Panel Date from 2006-09-29 to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1267702, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0183. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1271403, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1306238, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0189. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1310031, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 13277C. Map Panel Number from <Blank> to 0128. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1348907, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0187. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 

 SEQNUM HDTNUM REQUESTER   LOAN    INTSUBSERVICERLOANNUMBER NEWVEND CURVEND NEWMAPNUM   NEWNFIP CURNFIP NEWMAP CURMAP NEWSFX CURSFX NEWMAPDATE CURMAPDATE NEWZONE CURZONE NEWLOMCDATE CURLOMCDATE NEWFLOODCERT CURFLOODCERT 23   24
 ------ ------ ----------- ------- ------------------------ ------- ------- ----------- ------- ------- ------ ------ ------ ------ ---------- ---------- ------- ------- ----------- ----------- ------------ ------------ ---- ----
      1 198214 Mukesh Ojha 3275741                3275741.0 SVCLK   NULL    12009C0539H 12009C          0539          H             2021-01-29 NULL       X       VE      2999-01-01  NULL        000000000000                12 
      2 198214 Mukesh Ojha 3286443                3286443.0 SVCLK   NULL    34027C0191F 34027C          0191          F             2025-08-19 NULL       AE      A8      2999-01-01  NULL        000000000000                12 
      3 198214 Mukesh Ojha 3175486                3175486.0 SVCLK   NULL    12033C0340J 12033C          0340          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
      4 198214 Mukesh Ojha 3181912                3181912.0 SVCLK   NULL    34027C0181F 34027C          0181          F             2025-08-19 NULL       X       C       2999-01-01  NULL        000000000000                12 
      5 198214 Mukesh Ojha 3191837                3191837.0 SVCLK   NULL    12033C0430J 12033C          0430          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
      6 198214 Mukesh Ojha 1303072                1303072.0 SVCLK   NULL    12033C0430J 12033C          0430          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
      7 198214 Mukesh Ojha 3232520                3232520.0 SVCLK   NULL    12033C0330J 12033C          0330          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
      8 198214 Mukesh Ojha 3104354                3104354.0 SVCLK   NULL    34027C0179F 34027C          0179          F             2025-08-19 NULL       X       C       2999-01-01  NULL        000000000000                12 
      9 198214 Mukesh Ojha 3294596                3294596.0 SVCLK   NULL    12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     10 198214 Mukesh Ojha 3284094                3284094.0 SVCLK   NULL    12033C0365J 12033C          0365          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     11 198214 Mukesh Ojha 1004833                1004833.0 SVCLK   NULL    12033C0430J 12033C  NULL    0430   NULL   J      NULL   2025-08-19 2007-09-28 X       X       2999-01-01  NULL        000000000000 NULL         NULL NULL
     12 198214 Mukesh Ojha 1204477                1204477.0 SVCLK   NULL    34027C0183F 34027C          0183   0      F             2025-08-19 NULL       BX      X       2999-01-01  NULL        000000000000                12 
     13 198214 Mukesh Ojha 1204382                1204382.0 SVCLK   NULL    12033C0420J 12033C          0420   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     14 198214 Mukesh Ojha 1205619                1205619.0 SVCLK   NULL    12033C0430J 12033C          0430   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     15 198214 Mukesh Ojha 1244973                1244973.0 SVCLK   NULL    12033C0280J 12033C          0280          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     16 198214 Mukesh Ojha 1097471                1097471.0 SVCLK   NULL    12033C0405J 12033C          0405          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     17 198214 Mukesh Ojha 1138375                1138375.0 SVCLK   NULL    12033C0435J 12033C          0435          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     18 198214 Mukesh Ojha 1141397                1141397.0 SVCLK   NULL    12033C0290J 12033C          0290          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     19 198214 Mukesh Ojha 1201878                1201878.0 SVCLK   NULL    12033C0320J 12033C          0320   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     20 198214 Mukesh Ojha 1165591                1165591.0 SVCLK   NULL    12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     21 198214 Mukesh Ojha 1166241                1166241.0 SVCLK   NULL    13287C0135B 13287C          0135          B             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     22 198214 Mukesh Ojha 1168915                1168915.0 SVCLK   NULL    12033C0345J 12033C          0345   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     23 198214 Mukesh Ojha 1175657                1175657.0 SVCLK   NULL    12033C0365J 12033C          0365   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     24 198214 Mukesh Ojha 3169992                3169992.0 SVCLK   NULL    12033C0440J 12033C          0440   1203   J             2025-08-19 2006-09-29 X       X       2999-01-01  NULL        000000000000                12 
     25 198214 Mukesh Ojha 1202483                1202483.0 SVCLK   NULL    12033C0410J 12033C          0410   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     26 198214 Mukesh Ojha 1214490                1214490.0 SVCLK   NULL    12033C0410J 12033C          0410   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     27 198214 Mukesh Ojha 1202153                1202153.0 SVCLK   NULL    12033C0420J 12033C          0420   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     28 198214 Mukesh Ojha 3290741                3290741.0 SVCLK   NULL    12033C0345J 12033C          0345          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     29 198214 Mukesh Ojha 1239709                1239709.0 SVCLK   NULL    12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     30 198214 Mukesh Ojha 1244799                1244799.0 SVCLK   NULL    12033C0433J 12033C          0433   0      J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     31 198214 Mukesh Ojha 3328419                3328419.0 SVCLK   NULL    12033C0533J 12033C          0533   1203   J             2025-08-19 2006-09-29 X       X       2999-01-01  NULL        000000000000                12 
     32 198214 Mukesh Ojha 1267702                1267702.0 SVCLK   NULL    34027C0183F 34027C          0183          F             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     33 198214 Mukesh Ojha 1271403                1271403.0 SVCLK   NULL    12033C0440J 12033C          0440          J             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     34 198214 Mukesh Ojha 1306238                1306238.0 SVCLK   NULL    34027C0189F 34027C          0189          F             2025-08-19 NULL       X       C       2999-01-01  NULL        000000000000                12 
     35 198214 Mukesh Ojha 1310031                1310031.0 SVCLK   NULL    13277C0128F 13277C          0128          F             2025-08-19 NULL       X       X       2999-01-01  NULL        000000000000                12 
     36 198214 Mukesh Ojha 1348907                1348907.0 SVCLK   NULL    34027C0187F 34027C          0187          F             2025-08-19 NULL       X       C       2999-01-01  NULL        000000000000                12 

*/


-------------------------------------------------------------------------------------------------------
-- mergeeeee
-------------------------------------------------------------------------------------------------------
--
MERGE INTO CELINK.TBLHAZARDINSURANCE T
USING
(
	select 
	SeqNum, HDTNum, Requester, 
	Loan,			TT.INTSUBSERVICERLOANNUMBER,

	--20240820 P.NewVend check implemented
	NewVend,        
	TT.CURRENTFLOODVENDOR as CurVend,
	CASE when UY.NewVend = 'XXXXX' then TT.CURRENTFLOODVENDOR else UY.NewVend end "NewVendWillBe",
	
	NewMapNum,      
	left(NewMapNum, 6)         as NewNFIP, TT.NFIPCOMMNUM as CurNFIP,
	TRIM(substring(NewMapNum, 7, 4)) as NewMap,  TT.MAPPANELNUM as CurMap,
	right(NewMapNum, 1)        as NewSFX,  TT.SUFFIX      as CurSFX,
	
	case when UY.NewMapNum ='XXXXXXXXXXX' then TT.NFIPCOMMNUM else left(NewMapNum, 6)  end "NewNFIPWillBe", 
	case when UY.NewMapNum ='XXXXXXXXXXX' then TT.MAPPANELNUM else substring(NewMapNum, 7, 4) end "NewMapWillBe",
	case when UY.NewMapNum ='XXXXXXXXXXX' then TT.SUFFIX      else right(NewMapNum, 1)  end "NewSFXWillBe",   
   
	NewMapDate,     TT.MAPPANELDATE as CurMapDate, 	case when UY.NewMapDate = date('2999-01-01') then TT.MAPPANELDATE else UY.NewMapDate end "NewDateWillBe",
	NewZone,        trim(TT.CHRFLOODZONE) as CurZone,
	
	NewLOMCDate,  	TT.LOMCDATE ,  	case when UY.NewLOMCDate = date('2999-01-01') then TT.LOMCDATE else UY.NewLOMCDate end "NewLOMCDateWillBe",
	NewFloodCert, 	TT.FLOODCERTNUM, case when NewFloodCert = '000000000000' then TT.FLOODCERTNUM else NewFloodCert end "NewFloodCertWillBe"
	from DataUPDT.HDTDataUpdt_Flood2X UY --(SeqNum, HDTNum, Requester, Loan, NewVend, NewMapNum, NewMapDate, NewZone)

	inner join CELINK.TBLHAZARDINSURANCE TT
	on    UY.Loan = TT.INTSUBSERVICERLOANNUMBER

	where UY.RowNum = 1

	order by UY.SeqNum

) X
ON X.Loan = T.INTSUBSERVICERLOANNUMBER
WHEN MATCHED THEN UPDATE 
SET 
	--T.CURRENTFLOODVENDOR = X.NewVend,
	T.CURRENTFLOODVENDOR = CASE when X.NewVend = 'XXXXX' then T.CURRENTFLOODVENDOR else X.NewVend end,
	

--	T.NFIPCOMMNUM        = X.NewNFIP, 
--	T.MAPPANELNUM        = X.NewMap,
--	T.SUFFIX             = X.NewSFX	,   

	T.NFIPCOMMNUM        = case when X.NewMapNum ='XXXXXXXXXXX' then T.NFIPCOMMNUM else X.NewNFIP end, 
	T.MAPPANELNUM        = case when X.NewMapNum ='XXXXXXXXXXX' then T.MAPPANELNUM else X.NewMap end,
	T.SUFFIX             = case when X.NewMapNum ='XXXXXXXXXXX' then T.SUFFIX else X.NewSFX end,   
   
--	T.MAPPANELDATE       = X.NewMapDate,
	T.MAPPANELDATE       = case when X.NewMapDate = date('2999-01-01') then T.MAPPANELDATE else X.NewMapDate end,
	
	T.CHRFLOODZONE       = X.NewZone     
	,

	T.LOMCDATE 		= case when X.NewLOMCDate = date('2999-01-01') then T.LOMCDATE else X.NewLOMCDate end,
	T.FLOODCERTNUM		= case when X.NewFloodCert = '000000000000' then T.FLOODCERTNUM else X.NewFloodCert end  
;


/*
 SEQNUM HDTNUM REQUESTER      LOAN    INTSUBSERVICERLOANNUMBER NEWVEND CURVEND NewVendWillBe NEWMAPNUM   NEWNFIP CURNFIP NEWMAP CURMAP NEWSFX CURSFX NewNFIPWillBe NewMapWillBe NewSFXWillBe NEWMAPDATE CURMAPDATE NewDateWillBe NEWZONE CURZONE NEWLOMCDATE LOMCDATE   NewLOMCDateWillBe NEWFLOODCERT FLOODCERTNUM NewFloodCertWillBe
 ------ ------ -------------- ------- ------------------------ ------- ------- ------------- ----------- ------- ------- ------ ------ ------ ------ ------------- ------------ ------------ ---------- ---------- ------------- ------- ------- ----------- ---------- ----------------- ------------ ------------ ------------------

*/ 
 
-- Validation after
select 
--RowNum,
SeqNum, HDTNum, Requester, 
Loan,			TT.INTSUBSERVICERLOANNUMBER,
NewVend,        TT.CURRENTFLOODVENDOR as CurVend,

NewMapNum,      
left(NewMapNum, 6)         as NewNFIP, TT.NFIPCOMMNUM as CurNFIP,
substring(NewMapNum, 7, 4) as NewMap,  TT.MAPPANELNUM as CurMap,
right(NewMapNum, 1)        as NewSFX,  TT.SUFFIX      as CurSFX,

NewMapDate,                            TT.MAPPANELDATE as CurMapDate,
NewZone,                               TT.CHRFLOODZONE
,
NewLOMCDate,  	TT.LOMCDATE as "CurLOMC" , --  	case when UY.NewLOMCDate = date('2999-01-01') then TT.LOMCDATE else UY.NewLOMCDate end "NewLOMCDateWillBe",
NewFloodCert, 	TT.FLOODCERTNUM as "CurFloodCert" --, case when NewFloodCert = 'XXXXXXXXXXXX' then TT.FLOODCERTNUM else NewFloodCert end "NewFloodCertWillBe"

from DataUPDT.HDTDataUpdt_Flood2X
inner join CELINK.TBLHAZARDINSURANCE TT
on    Loan = TT.INTSUBSERVICERLOANNUMBER

where RowNum = 1
--where SeqNum >=2000
--where SeqNum <2000

order by SeqNum
for read only with ur;

/*
 SEQNUM HDTNUM REQUESTER   LOAN    INTSUBSERVICERLOANNUMBER NEWVEND CURVEND NEWMAPNUM   NEWNFIP CURNFIP NEWMAP CURMAP NEWSFX CURSFX NEWMAPDATE CURMAPDATE NEWZONE CHRFLOODZONE NEWLOMCDATE CurLOMC NEWFLOODCERT CurFloodCert
 ------ ------ ----------- ------- ------------------------ ------- ------- ----------- ------- ------- ------ ------ ------ ------ ---------- ---------- ------- ------------ ----------- ------- ------------ ------------
      1 198214 Mukesh Ojha 3275741                3275741.0 SVCLK   SVCLK   12009C0539H 12009C  12009C  0539   0539   H      H      2021-01-29 2021-01-29 X       X            2999-01-01  NULL    000000000000             
      2 198214 Mukesh Ojha 3286443                3286443.0 SVCLK   SVCLK   34027C0191F 34027C  34027C  0191   0191   F      F      2025-08-19 2025-08-19 AE      AE           2999-01-01  NULL    000000000000             
      3 198214 Mukesh Ojha 3175486                3175486.0 SVCLK   SVCLK   12033C0340J 12033C  12033C  0340   0340   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
      4 198214 Mukesh Ojha 3181912                3181912.0 SVCLK   SVCLK   34027C0181F 34027C  34027C  0181   0181   F      F      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
      5 198214 Mukesh Ojha 3191837                3191837.0 SVCLK   SVCLK   12033C0430J 12033C  12033C  0430   0430   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
      6 198214 Mukesh Ojha 1303072                1303072.0 SVCLK   SVCLK   12033C0430J 12033C  12033C  0430   0430   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
      7 198214 Mukesh Ojha 3232520                3232520.0 SVCLK   SVCLK   12033C0330J 12033C  12033C  0330   0330   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
      8 198214 Mukesh Ojha 3104354                3104354.0 SVCLK   SVCLK   34027C0179F 34027C  34027C  0179   0179   F      F      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
      9 198214 Mukesh Ojha 3294596                3294596.0 SVCLK   SVCLK   12033C0440J 12033C  12033C  0440   0440   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     10 198214 Mukesh Ojha 3284094                3284094.0 SVCLK   SVCLK   12033C0365J 12033C  12033C  0365   0365   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     11 198214 Mukesh Ojha 1004833                1004833.0 SVCLK   SVCLK   12033C0430J 12033C  12033C  0430   0430   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000 NULL
     12 198214 Mukesh Ojha 1204477                1204477.0 SVCLK   SVCLK   34027C0183F 34027C  34027C  0183   0183   F      F      2025-08-19 2025-08-19 BX      BX           2999-01-01  NULL    000000000000             
     13 198214 Mukesh Ojha 1204382                1204382.0 SVCLK   SVCLK   12033C0420J 12033C  12033C  0420   0420   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     14 198214 Mukesh Ojha 1205619                1205619.0 SVCLK   SVCLK   12033C0430J 12033C  12033C  0430   0430   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     15 198214 Mukesh Ojha 1244973                1244973.0 SVCLK   SVCLK   12033C0280J 12033C  12033C  0280   0280   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     16 198214 Mukesh Ojha 1097471                1097471.0 SVCLK   SVCLK   12033C0405J 12033C  12033C  0405   0405   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     17 198214 Mukesh Ojha 1138375                1138375.0 SVCLK   SVCLK   12033C0435J 12033C  12033C  0435   0435   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     18 198214 Mukesh Ojha 1141397                1141397.0 SVCLK   SVCLK   12033C0290J 12033C  12033C  0290   0290   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     19 198214 Mukesh Ojha 1201878                1201878.0 SVCLK   SVCLK   12033C0320J 12033C  12033C  0320   0320   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     20 198214 Mukesh Ojha 1165591                1165591.0 SVCLK   SVCLK   12033C0440J 12033C  12033C  0440   0440   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     21 198214 Mukesh Ojha 1166241                1166241.0 SVCLK   SVCLK   13287C0135B 13287C  13287C  0135   0135   B      B      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     22 198214 Mukesh Ojha 1168915                1168915.0 SVCLK   SVCLK   12033C0345J 12033C  12033C  0345   0345   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     23 198214 Mukesh Ojha 1175657                1175657.0 SVCLK   SVCLK   12033C0365J 12033C  12033C  0365   0365   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     24 198214 Mukesh Ojha 3169992                3169992.0 SVCLK   SVCLK   12033C0440J 12033C  12033C  0440   0440   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     25 198214 Mukesh Ojha 1202483                1202483.0 SVCLK   SVCLK   12033C0410J 12033C  12033C  0410   0410   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     26 198214 Mukesh Ojha 1214490                1214490.0 SVCLK   SVCLK   12033C0410J 12033C  12033C  0410   0410   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     27 198214 Mukesh Ojha 1202153                1202153.0 SVCLK   SVCLK   12033C0420J 12033C  12033C  0420   0420   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     28 198214 Mukesh Ojha 3290741                3290741.0 SVCLK   SVCLK   12033C0345J 12033C  12033C  0345   0345   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     29 198214 Mukesh Ojha 1239709                1239709.0 SVCLK   SVCLK   12033C0440J 12033C  12033C  0440   0440   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     30 198214 Mukesh Ojha 1244799                1244799.0 SVCLK   SVCLK   12033C0433J 12033C  12033C  0433   0433   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     31 198214 Mukesh Ojha 3328419                3328419.0 SVCLK   SVCLK   12033C0533J 12033C  12033C  0533   0533   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     32 198214 Mukesh Ojha 1267702                1267702.0 SVCLK   SVCLK   34027C0183F 34027C  34027C  0183   0183   F      F      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     33 198214 Mukesh Ojha 1271403                1271403.0 SVCLK   SVCLK   12033C0440J 12033C  12033C  0440   0440   J      J      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     34 198214 Mukesh Ojha 1306238                1306238.0 SVCLK   SVCLK   34027C0189F 34027C  34027C  0189   0189   F      F      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     35 198214 Mukesh Ojha 1310031                1310031.0 SVCLK   SVCLK   13277C0128F 13277C  13277C  0128   0128   F      F      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             
     36 198214 Mukesh Ojha 1348907                1348907.0 SVCLK   SVCLK   34027C0187F 34027C  34027C  0187   0187   F      F      2025-08-19 2025-08-19 X       X            2999-01-01  NULL    000000000000             

*/

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter ,,, plug in valeus fro -- Note Insert Value Creastion
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, StepNum) as
(values

-- Note Insert Value
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 (3275741, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12009C. Map Panel Number from <Blank> to 0539. Suffix from <Blank> to H. Map Panel Date from <Blank> to 2021-01-29. Flood Zone from VE to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3286443, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0191. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from A8 to AE.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3175486, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0340. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3181912, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0181. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3191837, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1303072, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3232520, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0330. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3104354, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0179. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3294596, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3284094, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0365. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1004833, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from 2007-09-28 to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1204477, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from 0 to 0183. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from X to BX.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1204382, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0420. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1205619, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1244973, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0280. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1097471, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0405. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1138375, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0435. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1141397, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0290. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1201878, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0320. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1165591, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1166241, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 13287C. Map Panel Number from <Blank> to 0135. Suffix from <Blank> to B. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1168915, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0345. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1175657, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0365. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3169992, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 1203 to 0440. Suffix from <Blank> to J. Map Panel Date from 2006-09-29 to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1202483, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0410. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1214490, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0410. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1202153, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0420. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3290741, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0345. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1239709, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1244799, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0433. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3328419, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 1203 to 0533. Suffix from <Blank> to J. Map Panel Date from 2006-09-29 to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1267702, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0183. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1271403, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1306238, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0189. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1310031, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 13277C. Map Panel Number from <Blank> to 0128. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1348907, 'Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0187. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.', CURRENT_TIMESTAMP, 'tkato', 0, 0)

) 
select * from P
;

/* *
 LOAN    NOTE                                                                                                                                                                                                                                                                   TIMES                      WHO   PRIO STEPNUM
 ------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------- ----- ---- -------
 3275741 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12009C. Map Panel Number from <Blank> to 0539. Suffix from <Blank> to H. Map Panel Date from <Blank> to 2021-01-29. Flood Zone from VE to X.  2025-08-28 20:26:55.102351 tkato    0       0
 3286443 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0191. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from A8 to AE. 2025-08-28 20:26:55.102351 tkato    0       0
 3175486 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0340. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 3181912 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0181. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.   2025-08-28 20:26:55.102351 tkato    0       0
 3191837 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1303072 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 3232520 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0330. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 3104354 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0179. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.   2025-08-28 20:26:55.102351 tkato    0       0
 3294596 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 3284094 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0365. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1004833 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0430. Suffix from <Blank> to J. Map Panel Date from 2007-09-28 to 2025-08-19.                        2025-08-28 20:26:55.102351 tkato    0       0
 1204477 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from 0 to 0183. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from X to BX.        2025-08-28 20:26:55.102351 tkato    0       0
 1204382 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0420. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 1205619 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0430. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 1244973 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0280. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1097471 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0405. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1138375 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0435. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1141397 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0290. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1201878 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0320. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 1165591 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1166241 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 13287C. Map Panel Number from <Blank> to 0135. Suffix from <Blank> to B. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1168915 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0345. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 1175657 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0365. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 3169992 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 1203 to 0440. Suffix from <Blank> to J. Map Panel Date from 2006-09-29 to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1202483 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0410. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 1214490 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0410. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 1202153 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0420. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 3290741 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0345. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1239709 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1244799 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 0 to 0433. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                                 2025-08-28 20:26:55.102351 tkato    0       0
 3328419 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from 1203 to 0533. Suffix from <Blank> to J. Map Panel Date from 2006-09-29 to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1267702 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0183. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1271403 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 12033C. Map Panel Number from <Blank> to 0440. Suffix from <Blank> to J. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1306238 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0189. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.   2025-08-28 20:26:55.102351 tkato    0       0
 1310031 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 13277C. Map Panel Number from <Blank> to 0128. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19.                           2025-08-28 20:26:55.102351 tkato    0       0
 1348907 Per HDT 198214 Hazard Insurance tab updated -  Flood Vendor from <Blank> to SVCLK. NFIP Community Number from <Blank> to 34027C. Map Panel Number from <Blank> to 0187. Suffix from <Blank> to F. Map Panel Date from <Blank> to 2025-08-19. Flood Zone from C to X.   2025-08-28 20:26:55.102351 tkato    0       0

*/
 
-- end 
 