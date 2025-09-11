
/* ********************************************************************************************************************************************** 
-------------------------------------------------------------------------------------------------------------------------------
-- master data table
Select * from celink.tblContactType where LEGALCAPACITY = 'R'; --- relationship to borr. ATT = 0
Select * from celink.tblContactType where LEGALCAPACITY = 'L'; --- Legal capacity        ATT = -1, ATT = 0 for Other, Attorney
Select * from celink.tblContactType where LEGALCAPACITY = 'D'; --- Authorized Designee
Select chrcontacttype from celink.tblcontacttype where idscontacttype = 0 and legalcapacity = 'R'; -- this is how RS populate ATT (Authorized To Talk)

-- D ... Authorized Designee
-- IDSCONTACTTYPE CHRCONTACTTYPE        LEGALCAPACITY ATT
-- -------------- --------------------- ------------- ---
--            154 Authorized Designee 1 D               0
--            155 Authorized Designee 2 D               0
--            156 Authorized Designee 3 D               0
--            157 Authorized Designee 4 D               0
--            158 Authorized Designee 5 D               0
--            159 Authorized Designee 6 D               0


-- R ... relationship
-- IDSCONTACTTYPE CHRCONTACTTYPE          LEGALCAPACITY ATT
-- -------------- ----------------------- ------------- ---
--             24 Sister in Law           R               0
--             25 Son                     R               0
--             26 Son in Law              R               0
--             27 Spouse                  R               0
--             28 Step Daughter           R               0
--             29 Step Son                R               0
--             21 Realtor                 R               0
--             90 Financial Advisor       R               0
--             94 Caregiver               R               0
--            100 Domestic Partner        R               0
--            131 Cousin                  R               0
--            150 Remainderman            R               0
--              3 Brother                 R               0
--              4 Brother in Law          R               0
--            153 Non-Borrowing Spouse    R               0
--              6 Daughter                R               0
--              7 Daughter in Law         R               0
--              9 Friend                  R               0
--             10 Grandchild              R               0
--             12 Nearest Living Relative R               0
--             13 Neighbor                R               0
--             14 Nephew                  R               0
--             15 Niece                   R               0
--             16 Other                   R               0
--             17 Parent                  R               0
--             22 Religious Leader        R               0
--             23 Sister                  R               0
--            160 POA                     R               0


-- L ... legal capacity
-- IDSCONTACTTYPE CHRCONTACTTYPE                      LEGALCAPACITY ATT
-- -------------- ----------------------------------- ------------- ---
--             30 Trustee                             L              -1
--             19 POA for Coborrower                  L              -1
--             20 POA for Both Borrowers              L              -1
--             31 Additional Borrower                 L              -1
--             91 Guardian for Borrower               L              -1
--             92 Guardian for CoBorrower             L              -1
--             93 Guardian for Both Borrowers         L              -1
--             95 CoExecutor                          L              -1
--             96 Conservator for Borrower            L              -1
--             97 Conservator for CoBorrower          L              -1
--             98 Conservator for both Borrowers      L              -1
--              0 None                                L               0
--            110 Authorized by Borrower              L              -1
--            130 Authorized by Legal Representative  L              -1
--              1 Attorney                            L               0
--              2 Attorney for Estate                 L              -1
--              5 Conservator                         L              -1
--              8 Executor                            L              -1
--             11 Guardian                            L              -1
--             18 POA for Borrower                    L              -1
--            151 Authorized by Affidavit of Heirship L              -1
--            152 Self                                L              -1

* ********************************************************************************************************************************************** */

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250903
[ID:0198610]  Other  9/3/2025 2:43 PM  Created by  Jordann Greene
Celink#	Data field to be corrected	Incorrect Value	Correct Value

3373146	Designee 1 Name		Schenectady Office		Schenectady County Aging Office
3373350	Designee 1 Name		Monroe Aging			Monroe County Office for the Aging
3373020	Designee 1 Name		NA						Marge Knodel
3373020	Designee 1 Address	NA						6616 Duvon Place, Manassas, Virginia, 20111
3373020	Designee 1 Phonee	NA						(703) 361-9890

*/

------ ------------------------ ------------ -------------- ---------------- ------------------- ------------------- ------------------ ------------------------ -------------- --------------- ----------------- ------------ ---------- ------------- --- ------------ ------------------------ -------------- ---------------- ------------------- ------------------- ------------------ ------------------------ -------------- --------------- ----------------- ------ ------------ ------------ -------------- ---------------------- ---------- ------------- -------- ----------- ----------- ------------- ------- ------------- ----------- -------------------
------ ------------------------ ------------ -------------- ---------------- ------------------- ------------------- ------------------ ------------------------ -------------- --------------- ----------------- ------------ ---------- ------------- --- ------------ ------------------------ -------------- ---------------- ------------------- ------------------- ------------------ ------------------------ -------------- --------------- ----------------- ------ ------------ ------------ -------------- ---------------------- ---------- ------------- -------- ----------- ----------- ------------- ------- ------------- ----------- -------------------
-- backup
with P(SeqNum, HDTNum, Loan) as
(VALUES

(1, 0198610, 3373146),
(2, 0198610, 3373350),
(3, 0198610, 3373020)

)
select 
P.SeqNum,
INTSUBSERVICERLOANNUMBER, IDSCONTACTID,
INTCONTACTTYPE, 
INTLEGALCAPACITY, 
BTNAUTHORIZEDTOTALK, 
CHRCONTACTFIRSTNAME ,
CHRCONTACTLASTNAME, 
CHRCONTACTADDRESS  ,                
CHRCONTACTCITY     ,    
CHRCONTACTSTATE ,	
CHRCONTACTZIPCODE, 
CHRHOMEPHONE ,
INTPRIMARY ,
CHRCONTACTFAX, 
'-->' ,X.*
from P
inner join celink.TBLCONTACT X
on P.Loan = X.INTSUBSERVICERLOANNUMBER 
--where INTSUBSERVICERLOANNUMBER = 3370728 and INTCONTACTTYPE = 154 and IDSCONTACTID = 1381470
order by P.SeqNum, X.IDSCONTACTID desc 
with ur;

-- SEQNUM INTSUBSERVICERLOANNUMBER IDSCONTACTID INTCONTACTTYPE INTLEGALCAPACITY BTNAUTHORIZEDTOTALK CHRCONTACTFIRSTNAME CHRCONTACTLASTNAME CHRCONTACTADDRESS                                        CHRCONTACTCITY CHRCONTACTSTATE CHRCONTACTZIPCODE CHRHOMEPHONE INTPRIMARY CHRCONTACTFAX 16  IDSCONTACTID INTSUBSERVICERLOANNUMBER INTCONTACTTYPE INTLEGALCAPACITY BTNAUTHORIZEDTOTALK CHRCONTACTFIRSTNAME CHRCONTACTLASTNAME CHRCONTACTADDRESS                                        CHRCONTACTCITY CHRCONTACTSTATE CHRCONTACTZIPCODE CHRSSN CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS INTPRIMARY CHRCONTACTFAX PERSONID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID MAILADDRESSID CELLCONSENT MODEREC_CELLCONSENT
-- ------ ------------------------ ------------ -------------- ---------------- ------------------- ------------------- ------------------ -------------------------------------------------------- -------------- --------------- ----------------- ------------ ---------- ------------- --- ------------ ------------------------ -------------- ---------------- ------------------- ------------------- ------------------ -------------------------------------------------------- -------------- --------------- ----------------- ------ ------------ ------------ -------------- --------------- ---------- ------------- -------- ----------- ----------- ------------- ------- ------------- ----------- -------------------
--      1                3373146.0      1386173            154              154                   0 Schenectady         Office             107 Nott Terrace #202                                    Schenectady    NY              12308             5183828481            0 NULL          -->      1386173                3373146.0            154              154                   0 Schenectady         Office             107 Nott Terrace #202                                    Schenectady    NY              12308                    5183828481                                                        0 NULL           6174553    12174546    13174546      14174546 4174546       6174546        NULL NULL
--      1                3373146.0      1386172              3              110                  -1 Christopher         Helbling           161 Drager Rd                                            Galway         NY              12074             5188106233           -1 NULL          -->      1386172                3373146.0              3              110                  -1 Christopher         Helbling           161 Drager Rd                                            Galway         NY              12074                    5188106233                               NULL                    -1 NULL           6174552    12174545    13174545      14174545 4174545       6174545        NULL NULL
--      2                3373350.0      1386598            154              154                   0 Monroe              Aging              435 East Henrietta Road Room 3rd Floor West (Faith Wing) Rochester      NY              14620             5857536280            0 NULL          -->      1386598                3373350.0            154              154                   0 Monroe              Aging              435 East Henrietta Road Room 3rd Floor West (Faith Wing) Rochester      NY              14620                    5857536280                                                        0 NULL           6174978    12174971    13174971      14174971 4174971       6174971        NULL NULL
--      2                3373350.0      1386597              9              110                  -1 Ngo Xuan            Truong             6226 Marco Plns                                          San Antonio    TX              78222             8302928470           -1 NULL          -->      1386597                3373350.0              9              110                  -1 Ngo Xuan            Truong             6226 Marco Plns                                          San Antonio    TX              78222                    8302928470                               NULL                    -1 NULL           6174977    12174970    13174970      14174970 4174970       6174970        NULL NULL
--      3                3373020.0      1385924             23              110                  -1 Marge               Knodel             6616 Duvon Place                                         Manassas       VA              20111             7033619890           -1 NULL          -->      1385924                3373020.0             23              110                  -1 Marge               Knodel             6616 Duvon Place                                         Manassas       VA              20111                    7033619890                               NULL                    -1 NULL           6174304    12174297    13174297      14174297 4174297       6174297        NULL NULL

-- after
-- SEQNUM INTSUBSERVICERLOANNUMBER IDSCONTACTID INTCONTACTTYPE INTLEGALCAPACITY BTNAUTHORIZEDTOTALK CHRCONTACTFIRSTNAME CHRCONTACTLASTNAME   CHRCONTACTADDRESS                                        CHRCONTACTCITY CHRCONTACTSTATE CHRCONTACTZIPCODE CHRHOMEPHONE INTPRIMARY CHRCONTACTFAX 16  IDSCONTACTID INTSUBSERVICERLOANNUMBER INTCONTACTTYPE INTLEGALCAPACITY BTNAUTHORIZEDTOTALK CHRCONTACTFIRSTNAME CHRCONTACTLASTNAME   CHRCONTACTADDRESS                                        CHRCONTACTCITY CHRCONTACTSTATE CHRCONTACTZIPCODE CHRSSN CHRHOMEPHONE CHRWORKPHONE CHRMOBILEPHONE CHREMAILADDRESS INTPRIMARY CHRCONTACTFAX PERSONID HOMEPHONEID WORKPHONEID MOBILEPHONEID EMAILID MAILADDRESSID CELLCONSENT MODEREC_CELLCONSENT
-- ------ ------------------------ ------------ -------------- ---------------- ------------------- ------------------- -------------------- -------------------------------------------------------- -------------- --------------- ----------------- ------------ ---------- ------------- --- ------------ ------------------------ -------------- ---------------- ------------------- ------------------- -------------------- -------------------------------------------------------- -------------- --------------- ----------------- ------ ------------ ------------ -------------- --------------- ---------- ------------- -------- ----------- ----------- ------------- ------- ------------- ----------- -------------------
--      1                3373146.0      1386173            154              154                   0 Schenectady County  Aging Office         107 Nott Terrace #202                                    Schenectady    NY              12308             5183828481            0 NULL          -->      1386173                3373146.0            154              154                   0 Schenectady County  Aging Office         107 Nott Terrace #202                                    Schenectady    NY              12308                    5183828481                                                        0 NULL           6174553    12174546    13174546      14174546 4174546       6174546        NULL NULL
--      1                3373146.0      1386172              3              110                  -1 Christopher         Helbling             161 Drager Rd                                            Galway         NY              12074             5188106233           -1 NULL          -->      1386172                3373146.0              3              110                  -1 Christopher         Helbling             161 Drager Rd                                            Galway         NY              12074                    5188106233                               NULL                    -1 NULL           6174552    12174545    13174545      14174545 4174545       6174545        NULL NULL
--      2                3373350.0      1386598            154              154                   0 Monroe County       Office for the Aging 435 East Henrietta Road Room 3rd Floor West (Faith Wing) Rochester      NY              14620             5857536280            0 NULL          -->      1386598                3373350.0            154              154                   0 Monroe County       Office for the Aging 435 East Henrietta Road Room 3rd Floor West (Faith Wing) Rochester      NY              14620                    5857536280                                                        0 NULL           6174978    12174971    13174971      14174971 4174971       6174971        NULL NULL
--      2                3373350.0      1386597              9              110                  -1 Ngo Xuan            Truong               6226 Marco Plns                                          San Antonio    TX              78222             8302928470           -1 NULL          -->      1386597                3373350.0              9              110                  -1 Ngo Xuan            Truong               6226 Marco Plns                                          San Antonio    TX              78222                    8302928470                               NULL                    -1 NULL           6174977    12174970    13174970      14174970 4174970       6174970        NULL NULL
--      3                3373020.0      1389886            154              154                   0 Marge               Knodel               6616 Duvon Place                                         Manassas       VA              20111             7033619890            0 NULL          -->      1389886                3373020.0            154              154                   0 Marge               Knodel               6616 Duvon Place                                         Manassas       VA              20111             NULL   7033619890   NULL         NULL           NULL                     0 NULL           6178259    12178252    13178252      14178252 4178252       6178252        NULL NULL
--      3                3373020.0      1385924             23              110                  -1 Marge               Knodel               6616 Duvon Place                                         Manassas       VA              20111             7033619890           -1 NULL          -->      1385924                3373020.0             23              110                  -1 Marge               Knodel               6616 Duvon Place                                         Manassas       VA              20111                    7033619890                               NULL                    -1 NULL           6174304    12174297    13174297      14174297 4174297       6174297        NULL NULL

-- ------ ------------------------ ------------ -------------- ---------------- ------------------- ------------------- ------------------ -------------------------------------------------------- -------------- --------------- ----------------- ------------ ---------- ------------- --- ------------ ------------------------ -------------- ---------------- ------------------- ------------------- ------------------ -------------------------------------------------------- -------------- --------------- ----------------- ------ ------------ ------------ -------------- --------------- ---------- ------------- -------- ----------- ----------- ------------- ------- ------------- ----------- -------------------
--3373146	Designee 1 Name		Schenectady Office		Schenectady County Aging Office
select 1 Seq,
INTSUBSERVICERLOANNUMBER, IDSCONTACTID, INTCONTACTTYPE, INTLEGALCAPACITY, BTNAUTHORIZEDTOTALK, CHRCONTACTFIRSTNAME ,CHRCONTACTLASTNAME, CHRCONTACTADDRESS, CHRCONTACTCITY, CHRCONTACTSTATE, CHRCONTACTZIPCODE, CHRHOMEPHONE, INTPRIMARY, CHRCONTACTFAX --',-->' ,X.*
from celink.TBLCONTACT X
where INTSUBSERVICERLOANNUMBER = 3373146 and INTCONTACTTYPE = 154 and IDSCONTACTID = 1386173
order by INTCONTACTTYPE
for read only with ur;
-- SEQ INTSUBSERVICERLOANNUMBER IDSCONTACTID INTCONTACTTYPE INTLEGALCAPACITY BTNAUTHORIZEDTOTALK CHRCONTACTFIRSTNAME CHRCONTACTLASTNAME CHRCONTACTADDRESS     CHRCONTACTCITY CHRCONTACTSTATE CHRCONTACTZIPCODE CHRHOMEPHONE INTPRIMARY CHRCONTACTFAX
-- --- ------------------------ ------------ -------------- ---------------- ------------------- ------------------- ------------------ --------------------- -------------- --------------- ----------------- ------------ ---------- -------------
--   1                3373146.0      1386173            154              154                   0 Schenectady         Office             107 Nott Terrace #202 Schenectady    NY              12308             5183828481            0 NULL

--
--				UPDATE celink.TBLCONTACT 
--				set 
--				CHRCONTACTFIRSTNAME = 'Schenectady County', 
--				CHRCONTACTLASTNAME = 'Aging Office'  
--				where INTSUBSERVICERLOANNUMBER = 3373146 and INTCONTACTTYPE = 154 and IDSCONTACTID = 1386173;
--
--(3373146, 'Per HDT 198610 Authorized Designee 1 Name updated from [Schenectady Office] to [Schenectady County Aging Office].',CURRENT_TIMESTAMP, 'tkato', 0, 0)


-- --- ------------------------ ------------ -------------- ---------------- ------------------- ------------------- ------------------ ---------------------- -------------- --------------- ----------------- ------------ ---------- -------------
--3373350	Designee 1 Name		Monroe Aging			Monroe County Office for the Aging
--      2                3373350.0      1386598            154              154                   0 Monroe              Aging              435 East Henrietta Road Room 3rd Floor West (Faith Wing) Rochester      NY              14620             5857536280            0 NULL          -->      1386598                3373350.0            154              154                   0 Monroe              Aging              435 East Henrietta Road Room 3rd Floor West (Faith Wing) Rochester      NY              14620                    5857536280                                                        0 NULL           6174978    12174971    13174971      14174971 4174971       6174971        NULL NULL

select 2 Seq,
INTSUBSERVICERLOANNUMBER, IDSCONTACTID, INTCONTACTTYPE, INTLEGALCAPACITY, BTNAUTHORIZEDTOTALK, CHRCONTACTFIRSTNAME ,CHRCONTACTLASTNAME, CHRCONTACTADDRESS, CHRCONTACTCITY, CHRCONTACTSTATE, CHRCONTACTZIPCODE, CHRHOMEPHONE, INTPRIMARY, CHRCONTACTFAX --',-->' ,X.*
from celink.TBLCONTACT X
where INTSUBSERVICERLOANNUMBER = 3373350 and INTCONTACTTYPE = 154 and IDSCONTACTID = 1386598
order by INTCONTACTTYPE
for read only with ur;
-- SEQ INTSUBSERVICERLOANNUMBER IDSCONTACTID INTCONTACTTYPE INTLEGALCAPACITY BTNAUTHORIZEDTOTALK CHRCONTACTFIRSTNAME CHRCONTACTLASTNAME CHRCONTACTADDRESS                                        CHRCONTACTCITY CHRCONTACTSTATE CHRCONTACTZIPCODE CHRHOMEPHONE INTPRIMARY CHRCONTACTFAX
-- --- ------------------------ ------------ -------------- ---------------- ------------------- ------------------- ------------------ -------------------------------------------------------- -------------- --------------- ----------------- ------------ ---------- -------------
--   2                3373350.0      1386598            154              154                   0 Monroe              Aging              435 East Henrietta Road Room 3rd Floor West (Faith Wing) Rochester      NY              14620             5857536280            0 NULL


--
--				UPDATE celink.TBLCONTACT 
--				set 
--				CHRCONTACTFIRSTNAME = 'Monroe County', 
--				CHRCONTACTLASTNAME = 'Office for the Aging'  
--				where INTSUBSERVICERLOANNUMBER = 3373350 and INTCONTACTTYPE = 154 and IDSCONTACTID = 1386598;
----
--(3373350, 'Per HDT 198610 Authorized Designee 1 Name updated from [Monroe Aging] to [Monroe County Office for the Aging].',CURRENT_TIMESTAMP, 'tkato', 0, 0)



-- ------------ ------------------------ ----------------------------------------------- ----------------------- --------- ----------- ----------- -------- -----------------
--3373020	Designee 1 Name		NA						Marge Knodel
--3373020	Designee 1 Address	NA						6616 Duvon Place, Manassas, Virginia, 20111
--3373020	Designee 1 Phonee	NA						(703) 361-9890

--
--		insert into celink.TBLCONTACT
--		(INTSUBSERVICERLOANNUMBER,INTCONTACTTYPE,INTLEGALCAPACITY,BTNAUTHORIZEDTOTALK,CHRCONTACTFIRSTNAME,CHRCONTACTLASTNAME,CHRCONTACTADDRESS,CHRCONTACTCITY,CHRCONTACTSTATE,CHRCONTACTZIPCODE,CHRHOMEPHONE,INTPRIMARY,CHRCONTACTFAX) 
--
--		with P (Loan, ContType, LegaCapa, AuthTalk, MyFname, MyLname, MyAddr, MyCity, MyState, MyZip, MyPhone, MyPrimary, MyFax) as 
--		(VALUES
--		(3373020, 154, 154, 0, 'Marge', 'Knodel', '6616 Duvon Place', 'Manassas', 'VA', '20111', '7033619890', 0, NULL)
--		)
--		select * from P
--		;
--		-- LOAN    CONTTYPE LEGACAPA AUTHTALK MYFNAME MYLNAME MYADDR           MYCITY   MYSTATE MYZIP MYPHONE    MYPRIMARY MYFAX
--		-- ------- -------- -------- -------- ------- ------- ---------------- -------- ------- ----- ---------- --------- -----
--		-- 3373020      154      154        0 Marge   Knodel  6616 Duvon Place Manassas VA      20111 7033619890         0 NULL
--
--(3373020, 'Per HDT 198610 Authorized Designee 1 [Marge Knodel].',CURRENT_TIMESTAMP, 'tkato', 0, 0)

-- ------------ ------------------------ ----------------------------------------------- ----------------------- --------- ----------- ----------- -------- -----------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)

with p (Loan, Note, TimeS, who, prio, StepID) as
(values

(3373146, 'Per HDT 198610 Authorized Designee 1 Name updated from [Schenectady Office] to [Schenectady County Aging Office].',CURRENT_TIMESTAMP, 'tkato', 0, 0),
(3373350, 'Per HDT 198610 Authorized Designee 1 Name updated from [Monroe Aging] to [Monroe County Office for the Aging].',CURRENT_TIMESTAMP, 'tkato', 0, 0),
(3373020, 'Per HDT 198610 Authorized Designee 1 [Marge Knodel] added.',CURRENT_TIMESTAMP, 'tkato', 0, 0)

) 
select * from P
;

-- LOAN    NOTE                                                                                                              TIMES                      WHO   PRIO STEPID
-- ------- ----------------------------------------------------------------------------------------------------------------- -------------------------- ----- ---- ------
-- 3373146 Per HDT 198610 Authorized Designee 1 Name updated from [Schenectady Office] to [Schenectady County Aging Office]. 2025-09-03 17:01:05.134306 tkato    0      0
-- 3373350 Per HDT 198610 Authorized Designee 1 Name updated from [Monroe Aging] to [Monroe County Office for the Aging].    2025-09-03 17:01:05.134306 tkato    0      0
-- 3373020 Per HDT 198610 Authorized Designee 1 [Marge Knodel] added.                                                        2025-09-03 17:01:05.134306 tkato    0      0
