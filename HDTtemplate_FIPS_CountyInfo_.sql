

/*
20231115
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT0149353_Validation.csv
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTUpdtNotes_ 0149353.csv

[ID:0149353] County Name 11/15/2023 4:53 PM Created by Aurelia Shorter
Received a request to updated borrowers' county information. Please see attached.
*/

/*
20241127
[ID:0178087] FIPS County Code 11/27/2024 4:56 PM Renee Buyarski
FIPS County - IT TIcket.xlsx
--
1651 loans updated (164 loans already have the request FIPS code).  Peer review pending.
*/

------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------


/*
20250904
198689	Ted Kato	FIPS code	Sue Benitez		Low	9/4/2025 12:29
Please update FIPs Codes of attached loans
="(" & L2 & ", 198689, 'Sue Benitez', " & B2 & ", '" & TEXT(A2,"00000") & "'),"
20 loans updated.  Peer review pending.
*/

------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
-- find objects
SELECT
NAME,COLTYPE,LENGTH,SCALE, tbname, *
FROM SYSIBM.SYSCOLUMNS
WHERE   NAME like '%FIP%' and TBNAME like '%';

/*
 FIPSALPHACODE         VARCHAR       5     0 TBLFIPSCOUNTYCODES     FIPSALPHACODE         TBLFIPSCOUNTYCODES     CELINK    NULL    VARCHAR  N         1208       1200      5     0     1    3087 'WY043'                             'AL003'                        9   NULL VARCHAR   SYSIBM     NULL             5                       100       100               1208          0 NULL             NULL                                        0        0             5        -1               -1 N        O                      NULL              -1.0 NULL                   0 0x00000002ff00ffff         -1         -1             -1.0
 FIPSCOUNTYNAME        VARCHAR      45     0 TBLFIPSCOUNTYCODES     FIPSCOUNTYNAME        TBLFIPSCOUNTYCODES     CELINK    NULL    VARCHAR  N         1208       1200     45     0     2    1952 'Zavala                           ' 'AGUADA'                      48   NULL VARCHAR   SYSIBM     NULL            45                       100       100               1208          0 NULL             NULL                                        0        0            44        -1               -1 N        O                      NULL              -1.0 NULL                   0 0x00000002ff00ffff         -1         -1             -1.0
 FIPSNUMERICCODE       VARCHAR       5     0 TBLFIPSCOUNTYCODES     FIPSNUMERICCODE       TBLFIPSCOUNTYCODES     CELINK    NULL    VARCHAR  N         1208       1200      5     0     0    3087 '78020'                             '01003'                        9      1 VARCHAR   SYSIBM     NULL             5                       100       100               1208          0 NULL             NULL                                        0        0             5        -1               -1 N        O                      NULL              -1.0 NULL                   0 0x00000002ff00ffff         -1         -1             -1.0
 FIPSSTATE             VARCHAR      15     0 TBLFIPSCOUNTYCODES     FIPSSTATE             TBLFIPSCOUNTYCODES     CELINK    NULL    VARCHAR  N         1208       1200     15     0     3      59 'Wisconsin      '                   'American Samoa'              19   NULL VARCHAR   SYSIBM     NULL            15                       100       100               1208          0 NULL             NULL                                        0        0            15        -1               -1 N        O                      NULL              -1.0 NULL                   0 0x00000002ff00ffff         -1         -1             -1.0
 FIPSSTATEABBREVIATION VARCHAR       2     0 TBLFIPSCOUNTYCODES     FIPSSTATEABBREVIATION TBLFIPSCOUNTYCODES     CELINK    NULL    VARCHAR  N         1208       1200      2     0     5      53 'WV'                                'AR'                           6   NULL VARCHAR   SYSIBM     NULL             2                       100       100               1208          0 NULL             NULL                                        0        0             2        -1               -1 N        O                      NULL              -1.0 NULL                   0 0x00000002ff00ffff         -1         -1             -1.0
 FIPSSTATECODE         VARCHAR       2     0 TBLFIPSCOUNTYCODES    
 
*/

--Use 
--------------------------------------------------------------------
/* DATAUPDT table already there
-- Generic 
-- DATAUPDT Table for   
create table DATAUPDT.HDTDataUPDT_GenSrc   
	(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan integer,

	DateOne  date default NULL, 
	DateTwo  date default NULL, 

	ChangeNeeded	integer default 0,  
	NewNotes        varchar (200) default NULL-- this column might not be used
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTDataUPDT_GenSrc  TO group db2_ast;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTDataUPDT_GenSrc  TO user cking;

-- drop table DATAUPDT.HDTDataUPDT_GenSrc;
select * from DATAUPDT.HDTDataUPDT_GenSrc;
-- SEQNUM HDTNUM REQUESTER LOAN DATEONE DATETWO CHANGENEEDED NEWNOTES
-- ------ ------ --------- ---- ------- ------- ------------ --------
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTDataUPDT_GenSrc;

-------------------------------------------------------------------------------------------------------------------------------------
-- Data  
insert into DATAUPDT.HDTDataUPDT_GenSrc
	(SeqNum, HDTNum, Requester, Loan, NewNotes, ChangeNeeded)
with P(SeqNum, HDTNum, Requester, Loan, FIPSGood) as 
(VALUES
(1, 198689, 'Sue Benitez', 3374083, '34029'),
(2, 198689, 'Sue Benitez', 3374089, '48251'),
(3, 198689, 'Sue Benitez', 3374090, '39097'),
(4, 198689, 'Sue Benitez', 3374091, '21089'),
(5, 198689, 'Sue Benitez', 3374249, '06073'),
(6, 198689, 'Sue Benitez', 3374268, '06037'),
(7, 198689, 'Sue Benitez', 3374270, '12086'),
(8, 198689, 'Sue Benitez', 3374555, '08099'),
(9, 198689, 'Sue Benitez', 3374557, '04013'),
(10, 198689, 'Sue Benitez', 3374564, '06067'),
(11, 198689, 'Sue Benitez', 3374566, '49035'),
(12, 198689, 'Sue Benitez', 3374567, '27141'),
(13, 198689, 'Sue Benitez', 3374584, '04021'),
(14, 198689, 'Sue Benitez', 3374618, '47113'),
(15, 198689, 'Sue Benitez', 3374619, '08123'),
(16, 198689, 'Sue Benitez', 3374620, '34023'),
(17, 198689, 'Sue Benitez', 3374621, '06009'),
(18, 198689, 'Sue Benitez', 3374643, '12086'),
(19, 198689, 'Sue Benitez', 3374656, '06111'),
(20, 198689, 'Sue Benitez', 3374710, '09003')
)
select 
SeqNum, HDTNum, Requester, Loan, FIPSGood
,case when T.FIPSCOUNTYCODE = P.FIPSGood then 0 else -1 end ChangeNeeded
from P
inner join celink.tblPropertyDescription T
on P.Loan = T.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
;

-----------------------------------------------------------
select * from DATAUPDT.HDTDataUPDT_GenSrc  order by seqnum;

select 
	P.*, T.FIPSCOUNTYCODe, T.INTSUBSERVICERLOANNUMBER 
from DATAUPDT.HDTDataUPDT_GenSrc P
inner join celink.tblPropertyDescription T
on P.Loan = T.INTSUBSERVICERLOANNUMBER
order by seqnum;
--C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTBackup_0182422.csv
-- SEQNUM HDTNUM REQUESTER   LOAN    DATEONE DATETWO CHANGENEEDED NEWNOTES FIPSCOUNTYCODE       INTSUBSERVICERLOANNUMBER
-- ------ ------ ----------- ------- ------- ------- ------------ -------- -------------------- ------------------------
--      1 198689 Sue Benitez 3374083 NULL    NULL              -1 34029                                        3374083.0
--      2 198689 Sue Benitez 3374089 NULL    NULL              -1 48251                                        3374089.0
--      3 198689 Sue Benitez 3374090 NULL    NULL              -1 39097                                        3374090.0
--      4 198689 Sue Benitez 3374091 NULL    NULL              -1 21089                                        3374091.0
--      5 198689 Sue Benitez 3374249 NULL    NULL              -1 06073                                        3374249.0
--      6 198689 Sue Benitez 3374268 NULL    NULL              -1 06037                                        3374268.0
--      7 198689 Sue Benitez 3374270 NULL    NULL              -1 12086                                        3374270.0
--      8 198689 Sue Benitez 3374555 NULL    NULL              -1 08099    099                                 3374555.0
--      9 198689 Sue Benitez 3374557 NULL    NULL              -1 04013    013                                 3374557.0
--     10 198689 Sue Benitez 3374564 NULL    NULL              -1 06067    067                                 3374564.0
--     11 198689 Sue Benitez 3374566 NULL    NULL              -1 49035    035                                 3374566.0
--     12 198689 Sue Benitez 3374567 NULL    NULL              -1 27141    141                                 3374567.0
--     13 198689 Sue Benitez 3374584 NULL    NULL              -1 04021    021                                 3374584.0
--     14 198689 Sue Benitez 3374618 NULL    NULL              -1 47113    113                                 3374618.0
--     15 198689 Sue Benitez 3374619 NULL    NULL              -1 08123    123                                 3374619.0
--     16 198689 Sue Benitez 3374620 NULL    NULL              -1 34023    023                                 3374620.0
--     17 198689 Sue Benitez 3374621 NULL    NULL              -1 06009    009                                 3374621.0
--     18 198689 Sue Benitez 3374643 NULL    NULL              -1 12086    086                                 3374643.0
--     19 198689 Sue Benitez 3374656 NULL    NULL              -1 06111    111                                 3374656.0
--     20 198689 Sue Benitez 3374710 NULL    NULL              -1 09003    003                                 3374710.0

		select * from DATAUPDT.HDTDataUPDT_GenSrc where CHANGENEEDED=-1 order by seqnum; -- all
		-- SEQNUM HDTNUM REQUESTER   LOAN    DATEONE DATETWO CHANGENEEDED NEWNOTES
		-- ------ ------ ----------- ------- ------- ------- ------------ --------

		select 
			P.*, T.FIPSCOUNTYCODe, T.INTSUBSERVICERLOANNUMBER 
		from DATAUPDT.HDTDataUPDT_GenSrc P
		inner join celink.tblPropertyDescription T
		on P.Loan = T.INTSUBSERVICERLOANNUMBER
		where P. CHANGENEEDED=0 
		order by seqnum;
		-- SEQNUM HDTNUM REQUESTER   LOAN    DATEONE DATETWO CHANGENEEDED NEWNOTES FIPSCOUNTYCODE       INTSUBSERVICERLOANNUMBER
		-- ------ ------ ----------- ------- ------- ------- ------------ -------- -------------------- ------------------------

------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
-- check/backup
select 
P.SeqNum, P.Loan, P.NEWNOTES, 
T.INTSUBSERVICERLOANNUMBER,
T.FIPSCOUNTYCODE  "FIPSinProp",
T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE

from DATAUPDT.HDTDataUPDT_GenSrc P
inner join celink.tblPropertyDescription T
on P.Loan = T.INTSUBSERVICERLOANNUMBER
where CHANGENEEDED = -1 
order by P.SeqNum
for read only
with ur;

/*
 SEQNUM LOAN    NEWNOTES INTSUBSERVICERLOANNUMBER FIPSinProp           CHRPROPSTATE CHRPROPCITY        CHRPROPZIPCODE
 ------ ------- -------- ------------------------ -------------------- ------------ ------------------ --------------
      1 3374083 34029                   3374083.0                      NJ           Little Egg Harbor  08087
      2 3374089 48251                   3374089.0                      TX           Joshua             76058
      3 3374090 39097                   3374090.0                      OH           London             43140
      4 3374091 21089                   3374091.0                      KY           Russell            41169
      5 3374249 06073                   3374249.0                      CA           San Diego          92128
      6 3374268 06037                   3374268.0                      CA           Whittier           90605
      7 3374270 12086                   3374270.0                      FL           Miami              33175
      8 3374555 08099                   3374555.0 099                  CO           Lamar              81052
      9 3374557 04013                   3374557.0 013                  AZ           Scottsdale         85251
     10 3374564 06067                   3374564.0 067                  CA           Rancho Cordova     95670
     11 3374566 49035                   3374566.0 035                  UT           Draper             84020
     12 3374567 27141                   3374567.0 141                  MN           Elk River          55330
     13 3374584 04021                   3374584.0 021                  AZ           Red Rock           85145
     14 3374618 47113                   3374618.0 113                  TN           Jackson            38305
     15 3374619 08123                   3374619.0 123                  CO           Greeley            80634
     16 3374620 34023                   3374620.0 023                  NJ           Carteret           07008
     17 3374621 06009                   3374621.0 009                  CA           Murphys            95247
     18 3374643 12086                   3374643.0 086                  FL           Miami Gardens      33056
     19 3374656 06111                   3374656.0 111                  CA           Camarillo          93012
     20 3374710 09003                   3374710.0 003                  CT           New Britain        06051

*/

select 
P.SeqNum, P.Loan, P.NEWNOTES, 
T.INTSUBSERVICERLOANNUMBER,
T.FIPSCOUNTYCODE  "FIPSinProp",
T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE

from DATAUPDT.HDTDataUPDT_GenSrc P
inner join celink.tblPropertyDescription T
on P.Loan = T.INTSUBSERVICERLOANNUMBER
where CHANGENEEDED = 0 
order by P.SeqNum
for read only
with ur;

/*
 SEQNUM LOAN    NEWNOTES INTSUBSERVICERLOANNUMBER FIPSinProp           CHRPROPSTATE CHRPROPCITY CHRPROPZIPCODE
 ------ ------- -------- ------------------------ -------------------- ------------ ----------- --------------
*/

-- ------ ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Note value 
--Insert into celink.tblLoanNotes 
--	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

select 
--	P.SeqNum,	
	'(' || 
	P.Loan || ', ' ||
	'''Per HDT' || P.HDTNum || ' ' 
	|| 'FIPS county code updated from ' || --trim(T.FIPSCOUNTYCODE)
	case 
	when coalesce(cast(trim(T.FIPSCOUNTYCODE) as varchar) , '<Blank>') = '<Blank>' then '<Blank>' 
	when trim(T.FIPSCOUNTYCODE) = '' then '<Blank>'	
	else trim(T.FIPSCOUNTYCODE)
	end
	|| ' to ' || P.NEWNOTES || '.'
	|| '''' || ', ' 
	|| 'CURRENT_TIMESTAMP, '
	|| '''tkato'', 0, 0), '
	as "Note Insert Value"
			
from DATAUPDT.HDTDataUPDT_GenSrc P
inner join celink.tblPropertyDescription T
on P.Loan = T.INTSUBSERVICERLOANNUMBER
where CHANGENEEDED = -1 
order by SeqNum
;

/*
 Note Insert Value
 --------------------------------------------------------------------------------------------------------------
 (3374083, 'Per HDT198689 FIPS county code updated from <Blank> to 34029.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374089, 'Per HDT198689 FIPS county code updated from <Blank> to 48251.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374090, 'Per HDT198689 FIPS county code updated from <Blank> to 39097.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374091, 'Per HDT198689 FIPS county code updated from <Blank> to 21089.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374249, 'Per HDT198689 FIPS county code updated from <Blank> to 06073.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374268, 'Per HDT198689 FIPS county code updated from <Blank> to 06037.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374270, 'Per HDT198689 FIPS county code updated from <Blank> to 12086.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374555, 'Per HDT198689 FIPS county code updated from 099 to 08099.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374557, 'Per HDT198689 FIPS county code updated from 013 to 04013.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374564, 'Per HDT198689 FIPS county code updated from 067 to 06067.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374566, 'Per HDT198689 FIPS county code updated from 035 to 49035.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374567, 'Per HDT198689 FIPS county code updated from 141 to 27141.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374584, 'Per HDT198689 FIPS county code updated from 021 to 04021.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374618, 'Per HDT198689 FIPS county code updated from 113 to 47113.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374619, 'Per HDT198689 FIPS county code updated from 123 to 08123.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374620, 'Per HDT198689 FIPS county code updated from 023 to 34023.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374621, 'Per HDT198689 FIPS county code updated from 009 to 06009.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374643, 'Per HDT198689 FIPS county code updated from 086 to 12086.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374656, 'Per HDT198689 FIPS county code updated from 111 to 06111.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374710, 'Per HDT198689 FIPS county code updated from 003 to 09003.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 

*/

-- ------- -------------------------------------------------- -------------------------- ----- - -
-- note,,, do this before mergeeeeeeeeeeeeeeeeeeeeeeeeeeee
--select 
----	P.SeqNum,
--	P.Loan,  
----	'Per HDT ' || P.HDTNum || ' FIPS county code updated from ''' || coalesce(cast(trim(T.FIPSCOUNTYCODE) as varchar), '<Blank>')	|| ''' to ''' || P.NEWNOTES ||'''.',
--	'Per HDT ' || P.HDTNum || ' FIPS county code updated from ' || 
--	case 
--	when coalesce(cast(trim(T.FIPSCOUNTYCODE) as varchar) , '<Blank>') = '<Blank>' then '<Blank>' 
--	when T.FIPSCOUNTYCODE = '' then '<Blank>'	
--	end
--	|| ' to ' || P.NEWNOTES || '.',
----	'Per HDT ' || P.HDTNum || ' FIPS county code set to ' || P.NEWNOTES ||'.',
--	CURRENT_TIMESTAMP, 'tkato', 0, 0
--from DATAUPDT.HDTDataUPDT_GenSrc P
--inner join celink.tblPropertyDescription T
--on P.Loan = T.INTSUBSERVICERLOANNUMBER
--where CHANGENEEDED = -1 
--order by SeqNum
--;


/* -----------------------------------------------------------------------------------------------------------
-- Notes
select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
from DATAUPDT.HDTDataUPDT_GenSrc P	
inner join celink.tblloannotes a  
on P.Loan = a.INTSUBSERVICERLOANNUMBER
where a.CHRLOANNOTES like '%Per%HDT%178087%'	
order by a.IDSLOANNOTES desc 
for read only with UR;
*/


-- ------- -------------------------------------------------- -------------------------- ----- - -
-- mergeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
MERGE INTO celink.tblPropertyDescription T
USING
(
select 
P.SeqNum, P.Loan, P.NEWNOTES, CHANGENEEDED,
T.INTSUBSERVICERLOANNUMBER,
T.FIPSCOUNTYCODE  "FIPSinProp",
T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE
from DATAUPDT.HDTDataUPDT_GenSrc P
inner join celink.tblPropertyDescription T
on P.Loan = T.INTSUBSERVICERLOANNUMBER
where P.CHANGENEEDED = -1 
order by P.SeqNum
) UY 
on UY.LOAN = T.INTSUBSERVICERLOANNUMBER
and UY.CHANGENEEDED = -1
WHEN MATCHED THEN UPDATE 
Set
T.FIPSCOUNTYCODE = UY.NEWNOTES
;

-- SEQNUM LOAN    NEWNOTES CHANGENEEDED INTSUBSERVICERLOANNUMBER FIPSinProp           CHRPROPSTATE CHRPROPCITY   CHRPROPZIPCODE
-- ------ ------- -------- ------------ ------------------------ -------------------- ------------ ------------- --------------

			----------------------------------------------------------------------------------------------------------------------------------------------
			--verify after
			select 
			P.SeqNum, P.Loan, P.NEWNOTES, 
			T.INTSUBSERVICERLOANNUMBER,
			T.FIPSCOUNTYCODE  "FIPSinProd",
			T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE
			from DATAUPDT.HDTDataUPDT_GenSrc P
			inner join celink.tblPropertyDescription T
			on P.Loan = T.INTSUBSERVICERLOANNUMBER
			--where CHANGENEEDED = -1 
			order by P.SeqNum
			for read only
			with ur;

			-- SEQNUM LOAN    NEWNOTES INTSUBSERVICERLOANNUMBER FIPSinProd           CHRPROPSTATE CHRPROPCITY        CHRPROPZIPCODE
			-- ------ ------- -------- ------------------------ -------------------- ------------ ------------------ --------------
			--      1 3374083 34029                   3374083.0 34029                NJ           Little Egg Harbor  08087
			--      2 3374089 48251                   3374089.0 48251                TX           Joshua             76058
			--      3 3374090 39097                   3374090.0 39097                OH           London             43140
			--      4 3374091 21089                   3374091.0 21089                KY           Russell            41169
			--      5 3374249 06073                   3374249.0 06073                CA           San Diego          92128
			--      6 3374268 06037                   3374268.0 06037                CA           Whittier           90605
			--      7 3374270 12086                   3374270.0 12086                FL           Miami              33175
			--      8 3374555 08099                   3374555.0 08099                CO           Lamar              81052
			--      9 3374557 04013                   3374557.0 04013                AZ           Scottsdale         85251
			--     10 3374564 06067                   3374564.0 06067                CA           Rancho Cordova     95670
			--     11 3374566 49035                   3374566.0 49035                UT           Draper             84020
			--     12 3374567 27141                   3374567.0 27141                MN           Elk River          55330
			--     13 3374584 04021                   3374584.0 04021                AZ           Red Rock           85145
			--     14 3374618 47113                   3374618.0 47113                TN           Jackson            38305
			--     15 3374619 08123                   3374619.0 08123                CO           Greeley            80634
			--     16 3374620 34023                   3374620.0 34023                NJ           Carteret           07008
			--     17 3374621 06009                   3374621.0 06009                CA           Murphys            95247
			--     18 3374643 12086                   3374643.0 12086                FL           Miami Gardens      33056
			--     19 3374656 06111                   3374656.0 06111                CA           Camarillo          93012
			--     20 3374710 09003                   3374710.0 09003                CT           New Britain        06051

----------------------------------------------------------------------------------------------------------------------------------------------
-- Notes
Insert into celink.tblLoanNotes 
(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)
with p (Loan, Note, TimeS, who, prio, NoteStep) as
(values
-- Note Insert Value
-- --------------------------------------------------------------------------------------------------------------
 (3374083, 'Per HDT198689 FIPS county code updated from <Blank> to 34029.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374089, 'Per HDT198689 FIPS county code updated from <Blank> to 48251.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374090, 'Per HDT198689 FIPS county code updated from <Blank> to 39097.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374091, 'Per HDT198689 FIPS county code updated from <Blank> to 21089.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374249, 'Per HDT198689 FIPS county code updated from <Blank> to 06073.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374268, 'Per HDT198689 FIPS county code updated from <Blank> to 06037.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374270, 'Per HDT198689 FIPS county code updated from <Blank> to 12086.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374555, 'Per HDT198689 FIPS county code updated from 099 to 08099.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374557, 'Per HDT198689 FIPS county code updated from 013 to 04013.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374564, 'Per HDT198689 FIPS county code updated from 067 to 06067.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374566, 'Per HDT198689 FIPS county code updated from 035 to 49035.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374567, 'Per HDT198689 FIPS county code updated from 141 to 27141.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374584, 'Per HDT198689 FIPS county code updated from 021 to 04021.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374618, 'Per HDT198689 FIPS county code updated from 113 to 47113.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374619, 'Per HDT198689 FIPS county code updated from 123 to 08123.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374620, 'Per HDT198689 FIPS county code updated from 023 to 34023.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374621, 'Per HDT198689 FIPS county code updated from 009 to 06009.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374643, 'Per HDT198689 FIPS county code updated from 086 to 12086.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374656, 'Per HDT198689 FIPS county code updated from 111 to 06111.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3374710, 'Per HDT198689 FIPS county code updated from 003 to 09003.', CURRENT_TIMESTAMP, 'tkato', 0, 0)
) 
select * from P
;

/*
 LOAN    NOTE                                                          TIMES                      WHO   PRIO NOTESTEP
 ------- ------------------------------------------------------------- -------------------------- ----- ---- --------
 3374083 Per HDT198689 FIPS county code updated from <Blank> to 34029. 2025-09-04 15:34:17.689775 tkato    0        0
 3374089 Per HDT198689 FIPS county code updated from <Blank> to 48251. 2025-09-04 15:34:17.689775 tkato    0        0
 3374090 Per HDT198689 FIPS county code updated from <Blank> to 39097. 2025-09-04 15:34:17.689775 tkato    0        0
 3374091 Per HDT198689 FIPS county code updated from <Blank> to 21089. 2025-09-04 15:34:17.689775 tkato    0        0
 3374249 Per HDT198689 FIPS county code updated from <Blank> to 06073. 2025-09-04 15:34:17.689775 tkato    0        0
 3374268 Per HDT198689 FIPS county code updated from <Blank> to 06037. 2025-09-04 15:34:17.689775 tkato    0        0
 3374270 Per HDT198689 FIPS county code updated from <Blank> to 12086. 2025-09-04 15:34:17.689775 tkato    0        0
 3374555 Per HDT198689 FIPS county code updated from 099 to 08099.     2025-09-04 15:34:17.689775 tkato    0        0
 3374557 Per HDT198689 FIPS county code updated from 013 to 04013.     2025-09-04 15:34:17.689775 tkato    0        0
 3374564 Per HDT198689 FIPS county code updated from 067 to 06067.     2025-09-04 15:34:17.689775 tkato    0        0
 3374566 Per HDT198689 FIPS county code updated from 035 to 49035.     2025-09-04 15:34:17.689775 tkato    0        0
 3374567 Per HDT198689 FIPS county code updated from 141 to 27141.     2025-09-04 15:34:17.689775 tkato    0        0
 3374584 Per HDT198689 FIPS county code updated from 021 to 04021.     2025-09-04 15:34:17.689775 tkato    0        0
 3374618 Per HDT198689 FIPS county code updated from 113 to 47113.     2025-09-04 15:34:17.689775 tkato    0        0
 3374619 Per HDT198689 FIPS county code updated from 123 to 08123.     2025-09-04 15:34:17.689775 tkato    0        0
 3374620 Per HDT198689 FIPS county code updated from 023 to 34023.     2025-09-04 15:34:17.689775 tkato    0        0
 3374621 Per HDT198689 FIPS county code updated from 009 to 06009.     2025-09-04 15:34:17.689775 tkato    0        0
 3374643 Per HDT198689 FIPS county code updated from 086 to 12086.     2025-09-04 15:34:17.689775 tkato    0        0
 3374656 Per HDT198689 FIPS county code updated from 111 to 06111.     2025-09-04 15:34:17.689775 tkato    0        0
 3374710 Per HDT198689 FIPS county code updated from 003 to 09003.     2025-09-04 15:34:17.689775 tkato    0        0

*/

------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------

--end





/*
-- single update

------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
-- UPDATEeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

select T.INTSUBSERVICERLOANNUMBER,T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE,T.FIPSCOUNTYCODE from celink.tblPropertyDescription T where INTSUBSERVICERLOANNUMBER = 3322121 UNION
select T.INTSUBSERVICERLOANNUMBER,T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE,T.FIPSCOUNTYCODE from celink.tblPropertyDescription T where INTSUBSERVICERLOANNUMBER = 3322051 UNION
select T.INTSUBSERVICERLOANNUMBER,T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE,T.FIPSCOUNTYCODE from celink.tblPropertyDescription T where INTSUBSERVICERLOANNUMBER = 3322046 UNION
select T.INTSUBSERVICERLOANNUMBER,T.CHRPROPSTATE, T.CHRPROPCITY, T.CHRPROPZIPCODE,T.FIPSCOUNTYCODE from celink.tblPropertyDescription T where INTSUBSERVICERLOANNUMBER = 3318118
order by INTSUBSERVICERLOANNUMBER;

--UPDATE celink.tblPropertyDescription  set FIPSCOUNTYCODE = '06037' where INTSUBSERVICERLOANNUMBER = 3322121;
UPDATE celink.tblPropertyDescription  set FIPSCOUNTYCODE = '06071' where INTSUBSERVICERLOANNUMBER = 3322051;
UPDATE celink.tblPropertyDescription  set FIPSCOUNTYCODE = '36001' where INTSUBSERVICERLOANNUMBER = 3322046;
UPDATE celink.tblPropertyDescription  set FIPSCOUNTYCODE = '24021' where INTSUBSERVICERLOANNUMBER = 3318118;




-- INTSUBSERVICERLOANNUMBER CHRPROPSTATE CHRPROPCITY CHRPROPZIPCODE FIPSCOUNTYCODE
-- ------------------------ ------------ ----------- -------------- --------------------
--                3318118.0 MD           Frederick   21701                              
--                3322046.0 NY           Latham      12110                              
--                3322051.0 CA           Loma Linda  92354                              
--                3322121.0 CA           Los Angeles 90041                              

*/



/*
 Baad result
 Result SEQNUM LOAN    CNAMES         INTSUBSERVICERLOANNUMBER CHRPROPSTATE CHRPROPCITY CHRPROPZIPCODE FIPSinProp           FIPSinFips FIPSALPHACODE FIPSCOUNTYNAME                                FIPSSTATE       FIPSSTATECODE FIPSSTATEABBREVIATION ChangeRequired
 ------ ------ ------- -------------- ------------------------ ------------ ----------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
 Baad       13 3322121 Los Angeles                   3322121.0 CA           Los Angeles 90041                               06037      CA037         Los Angeles                                   California      06            CA                                -1
 Baad       23 3322051 San Bernardino                3322051.0 CA           Loma Linda  92354                               06071      CA071         San Bernardino                                California      06            CA                                -1
 Baad       24 3322046 Albany                        3322046.0 NY           Latham      12110                               36001      NY001         Albany                                        New York        36            NY                                -1
 Baad       45 3318118 Frederick                     3318118.0 MD           Frederick   21701                               24021      MD021         Frederick                                     Maryland        24            MD                                -1


 Good result
 Result SEQNUM LOAN    CNAMES         INTSUBSERVICERLOANNUMBER CHRPROPSTATE CHRPROPCITY                CHRPROPZIPCODE FIPSinProp           FIPSinFips FIPSALPHACODE FIPSCOUNTYNAME                                FIPSSTATE       FIPSSTATECODE FIPSSTATEABBREVIATION ChangeRequired
 ------ ------ ------- -------------- ------------------------ ------------ -------------------------- -------------- -------------------- ---------- ------------- --------------------------------------------- --------------- ------------- --------------------- --------------
 GOOD        1 3319890 Los Angeles                   3319890.0 CA           Monterey Park              91754          06037                06037      CA037         Los Angeles                                   California      06            CA                                 0
 GOOD        2 3320502 Miami-Dade                    3320502.0 FL           Miami                      33138          12086                12086      FL086         Miami-Dade                                    Florids         12            FL                                 0
 GOOD        3 3319889 Windham                       3319889.0 CT           Killingly                  06239          09015                09015      CT015         Windham                                       Connecticut     09            CT                                 0
 GOOD        4 3319894 Sacramento                    3319894.0 CA           Rancho Murieta             95683          06067                06067      CA067         Sacramento                                    California      06            CA                                 0
 GOOD        5 3319891 Kern                          3319891.0 CA           Ridgecrest                 93555          06029                06029      CA029         Kern                                          California      06            CA                                 0
 GOOD        6 3320504 Queens                        3320504.0 NY           Whitestone                 11357          36081                36081      NY081         Queens                                        New York        36            NY                                 0
 GOOD        7 3320264 Broward                       3320264.0 FL           Fort Lauderdale            33312          12011                12011      FL011         Broward                                       Florida         12            FL                                 0
 GOOD        8 3320266 Alameda                       3320266.0 CA           Castro Valley              94552          06001                06001      CA001         Alameda                                       California      06            CA                                 0
 GOOD        9 3321286 Jefferson                     3321286.0 CO           Arvada                     80403          08059                08059      CO059         Jefferson                                     Colorado        08            CO                                 0
 GOOD       10 3319892 Los Angeles                   3319892.0 CA           Palmdale                   93550          06037                06037      CA037         Los Angeles                                   California      06            CA                                 0
 GOOD       11 3320999 San Diego                     3320999.0 CA           San Diego                  92139          06073                06073      CA073         San Diego                                     California      06            CA                                 0
 GOOD       12 3320752 Adams                         3320752.0 CO           Aurora                     80011          08001                08001      CO001         Adams                                         Colorado        08            CO                                 0
 Baad       13 3322121 Los Angeles                   3322121.0 CA           Los Angeles                90041                               06037      CA037         Los Angeles                                   California      06            CA                                -1
 GOOD       14 3320265 Sacramento                    3320265.0 CA           Antelope                   95843          06067                06067      CA067         Sacramento                                    California      06            CA                                 0
 GOOD       15 3320454 Wayne                         3320454.0 MI           Grosse Pointe Woods        48236          26163                26163      MI163         Wayne                                         Michigan        26            MI                                 0
 GOOD       16 3319807 Lane                          3319807.0 OR           Eugene                     97402          41039                41039      OR039         Lane                                          Oregon          41            OR                                 0
 GOOD       17 3320755 El Paso                       3320755.0 CO           Colorado Springs           80925          08041                08041      CO041         El Paso                                       Colorado        08            CO                                 0
 GOOD       18 3320757 Jackson                       3320757.0 MO           Lees Summit                64086          29095                29095      MO095         Jackson                                       Missouri        29            MO                                 0
 GOOD       19 3319895 Santa Barbara                 3319895.0 CA           Solvang                    93463          06083                06083      CA083         Santa Barbara                                 California      06            CA                                 0
 GOOD       20 3320506 Orange                        3320506.0 CA           Fountain Valley            92708          06059                06059      CA059         Orange                                        California      06            CA                                 0
 GOOD       21 3321097 Volusia                       3321097.0 FL           Ormond Beach               32174          12127                12127      FL127         Volusia                                       Florida         12            FL                                 0
 GOOD       22 3321614 Fort Bend                     3321614.0 TX           Missouri City              77489          48157                48157      TX157         Fort Bend                                     Texas           48            TX                                 0
 Baad       23 3322051 San Bernardino                3322051.0 CA           Loma Linda                 92354                               06071      CA071         San Bernardino                                California      06            CA                                -1
 Baad       24 3322046 Albany                        3322046.0 NY           Latham                     12110                               36001      NY001         Albany                                        New York        36            NY                                -1
 GOOD       25 3321454 Miami-Dade                    3321454.0 FL           Miami                      33150          12086                12086      FL086         Miami-Dade                                    Florids         12            FL                                 0
 GOOD       26 3320456 Placer                        3320456.0 CA           Rocklin                    95765          06061                06061      CA061         Placer                                        California      06            CA                                 0
 GOOD       27 3320998 Talbot                        3320998.0 MD           Easton                     21601          24041                24041      MD041         Talbot                                        Maryland        24            MD                                 0
 GOOD       28 3320858 Maricopa                      3320858.0 AZ           Peoria                     85381          04013                04013      AZ013         Maricopa                                      Arizona         04            AZ                                 0
 GOOD       29 3320503 San Bernardino                3320503.0 CA           Hesperia                   92345          06071                06071      CA071         San Bernardino                                California      06            CA                                 0
 GOOD       30 3320563 Los Angeles                   3320563.0 CA           (Sylmar Area), Los Angeles 91342          06037                06037      CA037         Los Angeles                                   California      06            CA                                 0
 GOOD       31 3320756 Los Angeles                   3320756.0 CA           Long Beach                 90808          06037                06037      CA037         Los Angeles                                   California      06            CA                                 0
 GOOD       32 3321588 Los Angeles                   3321588.0 CA           Whittier                   90601          06037                06037      CA037         Los Angeles                                   California      06            CA                                 0
 GOOD       33 3320455 Madison                       3320455.0 MT           Ennis                      59729          30057                30057      MT057         Madison                                       Montana         30            MT                                 0
 GOOD       34 3320457 Dallas                        3320457.0 TX           Dallas                     75230          48113                48113      TX113         Dallas                                        Texas           48            TX                                 0
 GOOD       35 3320754 Orange                        3320754.0 FL           Orlando                    32812          12095                12095      FL095         Orange                                        Florida         12            FL                                 0
 GOOD       36 3321688 Hartford                      3321688.0 CT           West Hartford              06117          09003                09003      CT003         Hartford                                      Connecticut     09            CT                                 0
 GOOD       37 3320753 Larimer                       3320753.0 CO           Loveland                   80538          08069                08069      CO069         Larimer                                       Colorado        08            CO                                 0
 GOOD       38 3319893 Monroe                        3319893.0 MI           Lambertville               48144          26115                26115      MI115         Monroe                                        Michigan        26            MI                                 0
 GOOD       39 3320509 Miami-Dade                    3320509.0 FL           Miami                      33173          12086                12086      FL086         Miami-Dade                                    Florids         12            FL                                 0
 GOOD       40 3321503 Carroll                       3321503.0 GA           Carrollton                 30117          13045                13045      GA045         Carroll                                       Georgia         13            GA                                 0
 GOOD       41 3321008 Kern                          3321008.0 CA           Bakersfield                93309          06029                06029      CA029         Kern                                          California      06            CA                                 0
 GOOD       42 3321298 Maricopa                      3321298.0 AZ           Scottsdale                 85260          04013                04013      AZ013         Maricopa                                      Arizona         04            AZ                                 0
 GOOD       43 3321209 Fresno                        3321209.0 CA           Fresno                     93722          06019                06019      CA019         Fresno                                        California      06            CA                                 0
 GOOD       44 3321297 Lea                           3321297.0 NM           Hobbs                      88240          35025                35025      NM025         Lea                                           New Mexico      35            NM                                 0
 Baad       45 3318118 Frederick                     3318118.0 MD           Frederick                  21701                               24021      MD021         Frederick                                     Maryland        24            MD                                -1
*/

-- --------------- ------------- --------------------------------------------- --------------- ------------- ---------------------
-- Ref
select * from celink.tblPropertyDescription where INTSUBSERVICERLOANNUMBER = 3319890 for read only with ur;
-- IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS   CHRPROPCITY   CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE     DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- ----------------- ------------------------ ---------------- ------------- ------------ -------------- --------------- ---------------- ------------------ ------------------ --------------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
--            172372                1094405.0 727 Somewhere St Chagrin Falls OH           71499          CDO                            1 NULL               NULL               2012-10-22 00:00:00.0 NULL                  NULL                       2012-07-26       NULL               NULL                        0                    -1                         0              0              180000.0 2012-07-26                            0 NULL                              0 NULL                                 0 39055                              NULL       4000001


select * from celink.TBLFIPSCOUNTYCODES limit 1;

-- FIPSNUMERICCODE FIPSALPHACODE FIPSCOUNTYNAME                                FIPSSTATE       FIPSSTATECODE FIPSSTATEABBREVIATION
-- --------------- ------------- --------------------------------------------- --------------- ------------- ---------------------
-- 01001           AL001         Autauga                                       Alabama         01            AL

select * from celink.TBLFIPSCOUNTYCODES where FIPSCOUNTYNAME like '%Los Angeles%' for read only with ur;
-- FIPSNUMERICCODE FIPSALPHACODE FIPSCOUNTYNAME                                FIPSSTATE       FIPSSTATECODE FIPSSTATEABBREVIATION
-- --------------- ------------- --------------------------------------------- --------------- ------------- ---------------------
-- 06037           CA037         Los Angeles                                   California      06            CA

select * from celink.TBLFIPSCOUNTYCODES where FIPSCOUNTYNAME like '%Miami-Dade%' for read only with ur;
--  FIPSNUMERICCODE FIPSALPHACODE FIPSCOUNTYNAME FIPSSTATE FIPSSTATECODE FIPSSTATEABBREVIATION
-- --------------- ------------- -------------- --------- ------------- ---------------------
-- 12086           FL086         Miami-Dade     Florids   12            FL




with p (seqnum, cName) as
(values
(1, 'Los Angeles'),
(2, 'Miami-Dade'),
(3, 'Windham'),
(4, 'Sacramento'),
(5, 'Kern'),
(6, 'Queens'),
(7, 'Broward'),
(8, 'Alameda'),
(9, 'Jefferson'),
(10, 'San Diego'),
(11, 'Adams'),
(12, 'Wayne'),
(13, 'Lane'),
(14, 'El Paso'),
(15, 'Jackson'),
(16, 'Santa Barbara'),
(17, 'Orange'),
(18, 'Volusia'),
(19, 'Fort Bend'),
(20, 'San Bernardino'),
(21, 'Albany'),
(22, 'Placer'),
(23, 'Talbot'),
(24, 'Maricopa'),
(25, 'Madison'),
(26, 'Dallas'),
(27, 'Hartford'),
(28, 'Larimer'),
(29, 'Monroe'),
(30, 'Carroll'),
(31, 'Fresno'),
(32, 'Lea'),
(33, 'Frederick')
)
select 
P.seqNum, P.cName,
T.FIPSNUMERICCODE, T.FIPSALPHACODE, T.FIPSCOUNTYNAME, T.FIPSSTATE, T.FIPSSTATECODE, T.FIPSSTATEABBREVIATION
from P
inner join celink.TBLFIPSCOUNTYCODES T
on P.cName = T.FIPSCOUNTYNAME
order by P.SeqNum
for read only
with ur;

-- SEQNUM CNAME          FIPSNUMERICCODE FIPSALPHACODE FIPSCOUNTYNAME                                FIPSSTATE       FIPSSTATECODE FIPSSTATEABBREVIATION
-- ------ -------------- --------------- ------------- --------------------------------------------- --------------- ------------- ---------------------
--      1 Los Angeles    06037           CA037         Los Angeles                                   California      06            CA
--      2 Miami-Dade     12086           FL086         Miami-Dade                                    Florids         12            FL
--      3 Windham        09015           CT015         Windham                                       Connecticut     09            CT
--      3 Windham        50025           VT025         Windham                                       Vermont         50            VT
--      4 Sacramento     06067           CA067         Sacramento                                    California      06            CA
--      5 Kern           06029           CA029         Kern                                          California      06            CA
--      6 Queens         36081           NY081         Queens                                        New York        36            NY
--      7 Broward        12011           FL011         Broward                                       Florida         12            FL
--      8 Alameda        06001           CA001         Alameda                                       California      06            CA
--      9 Jefferson      01073           AL073         Jefferson                                     Alabama         01            AL
--      9 Jefferson      05069           AR069         Jefferson                                     Arkansas        05            AR
--      9 Jefferson      08059           CO059         Jefferson                                     Colorado        08            CO
--      9 Jefferson      12065           FL065         Jefferson                                     Florida         12            FL
--      9 Jefferson      13163           GA163         Jefferson                                     Georgia         13            GA
--      9 Jefferson      16051           ID051         Jefferson                                     Idaho           16            ID
--      9 Jefferson      17081           IL081         Jefferson                                     Illinois        17            IL
--      9 Jefferson      18077           IN077         Jefferson                                     Indiana         18            IN
--      9 Jefferson      19101           IA101         Jefferson                                     Iowa            19            IA
--      9 Jefferson      20087           KS087         Jefferson                                     Kansas          20            KS
--      9 Jefferson      21111           KY111         Jefferson                                     Kentucky        21            KY
--      9 Jefferson      28063           MS063         Jefferson                                     Mississippi     28            MS
--      9 Jefferson      29099           MO099         Jefferson                                     Missouri        29            MO
--      9 Jefferson      30043           MT043         Jefferson                                     Montana         30            MT
--      9 Jefferson      31095           NE095         Jefferson                                     Nebraska        31            NE
--      9 Jefferson      36045           NY045         Jefferson                                     New York        36            NY
--      9 Jefferson      39081           OH081         Jefferson                                     Ohio            39            OH
--      9 Jefferson      40067           OK067         Jefferson                                     Oklahoma        40            OK
--      9 Jefferson      41031           OR031         Jefferson                                     Oregon          41            OR
--      9 Jefferson      42065           PA065         Jefferson                                     Pennsylvania    42            PA
--      9 Jefferson      47089           TN089         Jefferson                                     Tennessee       47            TN
--      9 Jefferson      48245           TX245         Jefferson                                     Texas           48            TX
--      9 Jefferson      53031           WA031         Jefferson                                     Washington      53            WA
--      9 Jefferson      54037           WV037         Jefferson                                     West Virginia   54            WV
--      9 Jefferson      55055           WI055         Jefferson                                     Wisconsin       55            WI
--     10 San Diego      06073           CA073         San Diego                                     California      06            CA
--     11 Adams          08001           CO001         Adams                                         Colorado        08            CO
--     11 Adams          16003           ID003         Adams                                         Idaho           16            ID
--     11 Adams          17001           IL001         Adams                                         Illinois        17            IL
--     11 Adams          18001           IN001         Adams                                         Indiana         18            IN
--     11 Adams          19003           IA003         Adams                                         Iowa            19            IA
--     11 Adams          28001           MS001         Adams                                         Mississippi     28            MS
--     11 Adams          31001           NE001         Adams                                         Nebraska        31            NE
--     11 Adams          38001           ND001         Adams                                         North Dakota    38            ND
--     11 Adams          39001           OH001         Adams                                         Ohio            39            OH
--     11 Adams          42001           PA001         Adams                                         Pennsylvania    42            PA
--     11 Adams          53001           WA001         Adams                                         Washington      53            WA
--     11 Adams          55001           WI001         Adams                                         Wisconsin       55            WI
--     12 Wayne          13305           GA305         Wayne                                         Georgia         13            GA
--     12 Wayne          17191           IL191         Wayne                                         Illinois        17            IL
--     12 Wayne          18177           IN177         Wayne                                         Indiana         18            IN
--     12 Wayne          19185           IA185         Wayne                                         Iowa            19            IA
--     12 Wayne          21231           KY231         Wayne                                         Kentucky        21            KY
--     12 Wayne          26163           MI163         Wayne                                         Michigan        26            MI
--     12 Wayne          28153           MS153         Wayne                                         Mississippi     28            MS
--     12 Wayne          29223           MO223         Wayne                                         Missouri        29            MO
--     12 Wayne          31179           NE179         Wayne                                         Nebraska        31            NE
--     12 Wayne          36117           NY117         Wayne                                         New York        36            NY
--     12 Wayne          37191           NC191         Wayne                                         North Carolina  37            NC
--     12 Wayne          39169           OH169         Wayne                                         Ohio            39            OH
--     12 Wayne          42127           PA127         Wayne                                         Pennsylvania    42            PA
--     12 Wayne          47181           TN181         Wayne                                         Tennessee       47            TN
--     12 Wayne          49055           UT055         Wayne                                         Utah            49            UT
--     12 Wayne          54099           WV099         Wayne                                         West Virginia   54            WV
--     13 Lane           20101           KS101         Lane                                          Kansas          20            KS
--     13 Lane           41039           OR039         Lane                                          Oregon          41            OR
--     14 El Paso        08041           CO041         El Paso                                       Colorado        08            CO
--     14 El Paso        48141           TX141         El Paso                                       Texas           48            TX
--     15 Jackson        01071           AL071         Jackson                                       Alabama         01            AL
--     15 Jackson        05067           AR067         Jackson                                       Arkansas        05            AR
--     15 Jackson        12063           FL063         Jackson                                       Florida         12            FL
--     15 Jackson        13157           GA157         Jackson                                       Georgia         13            GA
--     15 Jackson        17077           IL077         Jackson                                       Illinois        17            IL
--     15 Jackson        18071           IN071         Jackson                                       Indiana         18            IN
--     15 Jackson        19097           IA097         Jackson                                       Iowa            19            IA
--     15 Jackson        20085           KS085         Jackson                                       Kansas          20            KS
--     15 Jackson        21109           KY109         Jackson                                       Kentucky        21            KY
--     15 Jackson        22049           LA049         Jackson                                       Louisiana       22            LA
--     15 Jackson        26075           MI075         Jackson                                       Michigan        26            MI
--     15 Jackson        27063           MN063         Jackson                                       Minnesota       27            MN
--     15 Jackson        28059           MS059         Jackson                                       Mississippi     28            MS
--     15 Jackson        29095           MO095         Jackson                                       Missouri        29            MO
--     15 Jackson        37099           NC099         Jackson                                       North Carolina  37            NC
--     15 Jackson        39079           OH079         Jackson                                       Ohio            39            OH
--     15 Jackson        40065           OK065         Jackson                                       Oklahoma        40            OK
--     15 Jackson        41029           OR029         Jackson                                       Oregon          41            OR
--     15 Jackson        46071           SD071         Jackson                                       South Dakota    46            SD
--     15 Jackson        47087           TN087         Jackson                                       Tennessee       47            TN
--     15 Jackson        48239           TX239         Jackson                                       Texas           48            TX
--     15 Jackson        54035           WV035         Jackson                                       West Virginia   54            WV
--     15 Jackson        55053           WI053         Jackson                                       Wisconsin       55            WI
--     15 Jackson        08057           CO057         Jackson                                       Colorado        08            CO
--     16 Santa Barbara  06083           CA083         Santa Barbara                                 California      06            CA
--     17 Orange         18117           IN117         Orange                                        Indiana         18            IN
--     17 Orange         36071           NY071         Orange                                        New York        36            NY
--     17 Orange         37135           NC135         Orange                                        North Carolina  37            NC
--     17 Orange         48361           TX361         Orange                                        Texas           48            TX
--     17 Orange         50017           VT017         Orange                                        Vermont         50            VT
--     17 Orange         51137           VA137         Orange                                        Virginia        51            VA
--     17 Orange         06059           CA059         Orange                                        California      06            CA
--     17 Orange         12095           FL095         Orange                                        Florida         12            FL
--     18 Volusia        12127           FL127         Volusia                                       Florida         12            FL
--     19 Fort Bend      48157           TX157         Fort Bend                                     Texas           48            TX
--     20 San Bernardino 06071           CA071         San Bernardino                                California      06            CA
--     21 Albany         36001           NY001         Albany                                        New York        36            NY
--     21 Albany         56001           WY001         Albany                                        Wyoming         56            WY
--     22 Placer         06061           CA061         Placer                                        California      06            CA
--     23 Talbot         13263           GA263         Talbot                                        Georgia         13            GA
--     23 Talbot         24041           MD041         Talbot                                        Maryland        24            MD
--     24 Maricopa       04013           AZ013         Maricopa                                      Arizona         04            AZ
--     25 Madison        01089           AL089         Madison                                       Alabama         01            AL
--     25 Madison        05087           AR087         Madison                                       Arkansas        05            AR
--     25 Madison        12079           FL079         Madison                                       Florida         12            FL
--     25 Madison        13195           GA195         Madison                                       Georgia         13            GA
--     25 Madison        16065           ID065         Madison                                       Idaho           16            ID
--     25 Madison        17119           IL119         Madison                                       Illinois        17            IL
--     25 Madison        18095           IN095         Madison                                       Indiana         18            IN
--     25 Madison        19121           IA121         Madison                                       Iowa            19            IA
--     25 Madison        21151           KY151         Madison                                       Kentucky        21            KY
--     25 Madison        22065           LA065         Madison                                       Louisiana       22            LA
--     25 Madison        28089           MS089         Madison                                       Mississippi     28            MS
--     25 Madison        29123           MO123         Madison                                       Missouri        29            MO
--     25 Madison        30057           MT057         Madison                                       Montana         30            MT
--     25 Madison        31119           NE119         Madison                                       Nebraska        31            NE
--     25 Madison        36053           NY053         Madison                                       New York        36            NY
--     25 Madison        37115           NC115         Madison                                       North Carolina  37            NC
--     25 Madison        39097           OH097         Madison                                       Ohio            39            OH
--     25 Madison        47113           TN113         Madison                                       Tennessee       47            TN
--     25 Madison        48313           TX313         Madison                                       Texas           48            TX
--     25 Madison        51113           VA113         Madison                                       Virginia        51            VA
--     26 Dallas         01047           AL047         Dallas                                        Alabama         01            AL
--     26 Dallas         05039           AR039         Dallas                                        Arkansas        05            AR
--     26 Dallas         19049           IA049         Dallas                                        Iowa            19            IA
--     26 Dallas         29059           MO059         Dallas                                        Missouri        29            MO
--     26 Dallas         48113           TX113         Dallas                                        Texas           48            TX
--     27 Hartford       09003           CT003         Hartford                                      Connecticut     09            CT
--     28 Larimer        08069           CO069         Larimer                                       Colorado        08            CO
--     29 Monroe         01099           AL099         Monroe                                        Alabama         01            AL
--     29 Monroe         05095           AR095         Monroe                                        Arkansas        05            AR
--     29 Monroe         13207           GA207         Monroe                                        Georgia         13            GA
--     29 Monroe         17133           IL133         Monroe                                        Illinois        17            IL
--     29 Monroe         18105           IN105         Monroe                                        Indiana         18            IN
--     29 Monroe         19135           IA135         Monroe                                        Iowa            19            IA
--     29 Monroe         21171           KY171         Monroe                                        Kentucky        21            KY
--     29 Monroe         26115           MI115         Monroe                                        Michigan        26            MI
--     29 Monroe         28095           MS095         Monroe                                        Mississippi     28            MS
--     29 Monroe         29137           MO137         Monroe                                        Missouri        29            MO
--     29 Monroe         36055           NY055         Monroe                                        New York        36            NY
--     29 Monroe         39111           OH111         Monroe                                        Ohio            39            OH
--     29 Monroe         42089           PA089         Monroe                                        Pennsylvania    42            PA
--     29 Monroe         47123           TN123         Monroe                                        Tennessee       47            TN
--     29 Monroe         54063           WV063         Monroe                                        West Virginia   54            WV
--     29 Monroe         55081           WI081         Monroe                                        Wisconsin       55            WI
--     29 Monroe         12087           FL087         Monroe                                        Florida         12            FL
--     30 Carroll        05015           AR015         Carroll                                       Arkansas        05            AR
--     30 Carroll        13045           GA045         Carroll                                       Georgia         13            GA
--     30 Carroll        17015           IL015         Carroll                                       Illinois        17            IL
--     30 Carroll        18015           IN015         Carroll                                       Indiana         18            IN
--     30 Carroll        19027           IA027         Carroll                                       Iowa            19            IA
--     30 Carroll        21041           KY041         Carroll                                       Kentucky        21            KY
--     30 Carroll        24013           MD013         Carroll                                       Maryland        24            MD
--     30 Carroll        28015           MS015         Carroll                                       Mississippi     28            MS
--     30 Carroll        29033           MO033         Carroll                                       Missouri        29            MO
--     30 Carroll        33003           NH003         Carroll                                       New Hampshire   33            NH
--     30 Carroll        39019           OH019         Carroll                                       Ohio            39            OH
--     30 Carroll        47017           TN017         Carroll                                       Tennessee       47            TN
--     30 Carroll        51035           VA035         Carroll                                       Virginia        51            VA
--     31 Fresno         06019           CA019         Fresno                                        California      06            CA
--     32 Lea            35025           NM025         Lea                                           New Mexico      35            NM
--     33 Frederick      24021           MD021         Frederick                                     Maryland        24            MD
--     33 Frederick      51069           VA069         Frederick                                     Virginia        51            VA


