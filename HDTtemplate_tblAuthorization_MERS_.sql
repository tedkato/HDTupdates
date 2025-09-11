/*
20210622

INCIDENT #85545
Jennifer White
Compliance Change Manager
Edit and Bulk Upload Access to MERS Tab
Created: Jun 18, 2021 at 1:58 PM by Jennifer White
Hello,
Can you please grant Kelly Cantu the same level of access I have for ReverseServ?   
She is taking over the MERS Support process management and will 
need to be able to edit fields on the MERS Tab in the Loan Maintenance section of ReverseServ 
AND utilize the Bulk MERS - Bulk Processing feature in the Loan Transactions menu.
*/

-- --- ---------- ---------- ---------- -------- ----------------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- --- ---------- ---------- ---------- -------- ----------------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------

/*
20250729
[IN-0193061]  Need Bulk notes processing access in RS  6/23/2025 11:14 AM  Created by  Jeffrey Nicolas
Hello Team,
Kindly provide Bulk notes processing access in RS.
Username: Guluri.Lahari
--
@Ted Kato  Please assign the ability for Bulk MERS Upload to guluri.lahari. 
I spoke to Vicky and she mentioned you are able to complete this. Let me know if there is anything else I can provide.

BULK MERS upload access granted.  Please verify the access at the earliest chance.  
Peer review pending.
*/

-- --- ---------- ---------- ---------- -------- ----------------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- --- ---------- ---------- ---------- -------- ----------------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------

/**
-- by eMail Addr -- CHRUSEREMAIL
select 1 seq,  AccessMode , * from celink.tblusers a where lower(a.CHRUSEREMAIL) like lower('%kasi.manasa@reversedepartment.com%')
union
select 2 seq,  AccessMode , * from celink.tblusers a where lower(a.CHRUSEREMAIL) like lower('%Srinivasa.Chandrappa@reversedepartment.com%')
union
select 3 seq,  AccessMode , * from celink.tblusers a where lower(a.CHRUSEREMAIL) like lower('%Darshan.Ukkadagatrimath@reversedepartment.com%')
union
select 4 seq,  AccessMode , * from celink.tblusers a where lower(a.CHRUSEREMAIL) like lower('%lakesha.ram@reversedepartment.com%')

order by Seq, CHRLDAPNAME
for read only  with ur; 

-- SEQ ACCESSMODE USERID     ACCESSMODE PASSWORD CHRLDAPNAME             BTNCOGNOSRESTRICTED TICKLERLEVEL CHRUSEREMAIL                                       DIVISIONID DEPARTMENTID TEAMID
-- --- ---------- ---------- ---------- -------- ----------------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
--   1 U          kasi.manas U          reverse  kasi.manasa                               0 N             kasi.manasa@reversedepartment.com                          0            0      0
--   2 M          CCO.Schand M          NONE     srinivasa.chandrappa                      0 N            Srinivasa.Chandrappa@reversedepartment.com                  0            0      0
--   3 M          Darshan.Uk M          NONE     Darshan.Ukkadagatrimath                   0 N            Darshan.Ukkadagatrimath@reversedepartment.com               0            0      0
--***4 U          CCO.lram   U          reverse  lakesha.ram                               0 N            lakesha.ram@reversedepartment.com                           0            0      0
*/

--select AccessMode , * from celink.tblusers a where lower(a.CHRLDAPNAME) like '%antu%' order by a.USERID for read only  with ur; 

select 0 seq, AccessMode , * from celink.tblusers a where lower(a.CHRLDAPNAME) like lower('%Kulal%')  
union
select 0 seq,  AccessMode , * from celink.tblusers a where lower(a.CHRLDAPNAME) like lower('%Lahari%')
order by Seq, CHRLDAPNAME
for read only  with ur; 

-- SEQ ACCESSMODE USERID     ACCESSMODE PASSWORD CHRLDAPNAME    BTNCOGNOSRESTRICTED TICKLERLEVEL CHRUSEREMAIL                                       DIVISIONID DEPARTMENTID TEAMID
-- --- ---------- ---------- ---------- -------- -------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
--   0 M          glahari    M          reverse  guluri.lahari                    0 N            guluri.lahari@reversedepartment.com                         0            0      0
--   0 M          mahendra.k M          NONE     mahendra.kulal                   0 N            mahendra.kulal@reversedepartment.com                        0            0      0


select AccessMode , * from celink.tblusers a where a.USERID 
in 
(
'mahendra.k',
'glahari'

) order by a.USERID for read only  with ur; 

-- ACCESSMODE USERID     ACCESSMODE PASSWORD CHRLDAPNAME    BTNCOGNOSRESTRICTED TICKLERLEVEL CHRUSEREMAIL                                       DIVISIONID DEPARTMENTID TEAMID
-- ---------- ---------- ---------- -------- -------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- M          glahari    M          reverse  guluri.lahari                    0 N            guluri.lahari@reversedepartment.com                         0            0      0
-- M          mahendra.k M          NONE     mahendra.kulal                   0 N            mahendra.kulal@reversedepartment.com                        0            0      0

select * from celink.tblauthorization a where VALUE 
in 
(
'mahendra.k',
'glahari'
) 
order by a.value,  a.ID with ur;

-- ID KEY   VALUE
-- -- ----- ----------
--  7 admin mahendra.k
-- 12 user  mahendra.k

select 
	a.ID, a.Key as "Assecc Mode", a.Value as "User Name", b.value as "Value"
	from celink.tblauthorization a 
	inner join celink.tblauthorization b
	on a.ID = b.ID 
	and b.KEY in ('page', 'field') 
	where a.VALUE in 
(
'mahendra.k',
'glahari'
)  
	order by a.ID 
with ur;

-- ID Assecc Mode User Name  Value
-- -- ----------- ---------- --------
--  7 admin       mahendra.k MERSEdit
-- 12 user        mahendra.k BulkMERS

--after
-- ID Assecc Mode User Name  Value
-- -- ----------- ---------- --------
--  7 admin       mahendra.k MERSEdit
-- 12 user        mahendra.k BulkMERS
-- 12 user        glahari    BulkMERS



/* *
Insert into celink.tblauthorization 
	(ID, KEY,  VALUE)
with P (AuthID, AuthMD, AuthUR) as
(values 
(12,  'user', 'glahari')   -- 12 user        mahendra.k BulkMERS
)
select AuthID, AuthMD, AuthUR from P;

-- AUTHID AUTHMD AUTHUR
-- ------ ------ --------
--     12 user   CCO.lram
*/


