
/*
20240419

[IN-0161265]  Access required for specific transactions in reverse serv  4/19/2024 4:18 PM  Ivan Corro
Access required for specific transactions in reverse serv
Can we please mirror Camila Roman's access in Reverse Serv  (camila.roman@celink.com)
Bulk Draw Upload
Batch Draw Reports
--*--
Requested accesses granted.  Please have the user verify the access at the earliest chance and let me know if there is any issue.  Pending Verificatio.
*/


-- ---------- ---------- ---------- ---------- ---------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- ---------- ---------- ---------- ---------- ---------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
--HDTs

/*
20250512
[SR-0188023]  Add/Change Access for Application - ReverseServ 6  4/21/2025 11:12 AM  Created by  Frank Nevarez

5/7/2025 11:52 AM
Ricardo Landeros
I am working on a Bulk Draw Upload, but I still do not have access to do so, please see screenshot below:
Which User to Mirror access?
Camila Roman

--*--
Bulk draw access granted.  Please have the user verify the access at the earliest chance and let me know if there is any issue. 
*/

-- ---------- ---------- ---------- ---------- ---------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- ---------- ---------- ---------- ---------- ---------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------


select AccessMode , * from celink.tblusers a where a.CHRLDAPNAME like '%ato%' order by a.USERID for read only  with ur; 
-- ACCESSMODE USERID     ACCESSMODE PASSWORD   CHRLDAPNAME      BTNCOGNOSRESTRICTED TICKLERLEVEL CHRUSEREMAIL                                       DIVISIONID DEPARTMENTID TEAMID
-- ---------- ---------- ---------- ---------- ---------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- M          TKato      M          NONE       ted.kato                           0 N            Ted.Kato@cit.com                                            0            0      0

--select  * from celink.tblusers a where lower(a.CHRLDAPNAME) like lower('%Nagle%')
--union
select  * from celink.tblusers a where lower(a.CHRLDAPNAME) like lower('%Roman%')
union
select  * from celink.tblusers a where lower(a.CHRLDAPNAME) like lower('%Landeros%')
order by CHRLDAPNAME
for read only  with ur;
-- USERID     ACCESSMODE PASSWORD   CHRLDAPNAME      BTNCOGNOSRESTRICTED TICKLERLEVEL CHRUSEREMAIL                                       DIVISIONID DEPARTMENTID TEAMID
-- ---------- ---------- ---------- ---------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- croman     M          NONE       camila.roman                       0 N            camila.roman@celink.com                                     0            0      0
-- r.landeros M          NONE       ricardo.landeros                   0 N            ricardo.landeros@celink.com                                 0            0      0


select 
* 
from celink.tblusers a 
where a.USERID in ('croman', 'r.landeros')
order by CHRLDAPNAME
for read only  with ur; 
-- USERID     ACCESSMODE PASSWORD CHRLDAPNAME      BTNCOGNOSRESTRICTED TICKLERLEVEL CHRUSEREMAIL                                       DIVISIONID DEPARTMENTID TEAMID
-- ---------- ---------- -------- ---------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- croman     M          NONE     camila.roman                       0 N            camila.roman@celink.com                                     0            0      0
-- r.landeros M          NONE     ricardo.landeros                   0 N            ricardo.landeros@celink.com                                 0            0      0


-- --------- ---------- -------- ----------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- --------- ---------- -------- ----------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
select * from celink.tblauthorization a where VALUE in 
('croman', 'r.landeros')
order by a.value,  a.ID with ur;
-- ID KEY   VALUE
-- -- ----- ------
--  1 user  croman
-- 67 admin croman
-- 69 admin croman

select 
	a.ID, a.Key as "Assecc Mode", a.Value as "User Name", b.value as "Value"
from celink.tblauthorization a 
inner join celink.tblauthorization b
on a.ID = b.ID 
and b.KEY in ('page', 'field') 
where a.VALUE in ('croman', 'r.landeros')
order by a.ID 
with ur;

-- -- ----------- --------- ---------------
--  1 user        croman    TransBatchQue
-- 67 admin       croman    BulkDraws
-- 69 admin       croman    BankAccountInfo

/* *********************************************************************************************************************************************************
Insert into celink.tblauthorization 
(ID, KEY,  VALUE)
values 
(1,  'user',  'r.landeros'),    
(67, 'admin', 'r.landeros')   
;	
********************************************************************************************************************************************************* */


