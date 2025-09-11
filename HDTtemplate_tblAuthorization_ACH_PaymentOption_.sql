/*
ACH access requires approval from @Norma Howell @Jorie Kelly

Level 1 – Full read/edit ability*                 ... manager
Level 2 - Full read ability (No edit capability)  ... admin
Level 3 – Limited read-only ability (ACH is masked with only last 4 numbers visible) ... user

@Norma Howell @Jorie Kelly  Please review.
*/

/*
20230707

INCIDENT #132173
Prajwal Udayshankar
Celink Servicing Platform LOC Advance , Mail Box Direct deposit Access required ,Reverse Serv update Payment option
Created: Jul 05, 2023 at 2:51 PM by Prajwal Udayshankar

Hi Team,
Request you to provide the access for below application
Celink Servicing Platform LOC Advance
Mail Box Direct deposit Access required 
Reverse Serv update Payment option
for 
Chaitanya Allam  Chaitanya.Allam@reversedepartment.com
@jorie kelly Please approve same

--
Vicky Cermak
Jul 07, 2023 at 7:24 PM
@Josh Higby
Ted Kato can make the change to allow the user to access/update the info in the Banking Payment Information screen.  

@Ted Kato
Please proceed with the update (tblauthorization) for this user to allow access to view and update the Banking information screen.

--*--
Level 1 (manager) – Full read/edit ability granted to user Chaitanya Allam  Chaitanya.Allam@reversedepartment.com. Please verify the access. 
*/

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
-- HDTs
/*
20250325
185304	Ted Kato	Add/Change Access for Application - ReverseServ 6	Prajwal Udayshankar	Medium	3/18/2025 16:25
Divyesh Roy  - Please provide access on payment option to edit account details in reverse serv
Divyesh.Roy@reversedepartment.com

185303	Ted Kato	Add/Change Access for Application - ReverseServ 6	Prajwal Udayshankar	Medium	3/18/2025 16:24
Rajesh S  - Please provide access on payment option to edit account details in reverse serv
Rajesh.S@reversedepartment.com
*/

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------

select AccessMode , * from celink.tblusers a where a.CHRLDAPNAME like '%ato%' order by a.USERID for read only  with ur; 

select 1 as Seq, USERID, ACCESSMODE, CHRLDAPNAME, CHRUSEREMAIL from celink.tblusers where  lower(CHRLDAPNAME)  like lower('%Divyesh%')
UNION
select 2 as Seq, USERID, ACCESSMODE, CHRLDAPNAME, CHRUSEREMAIL from celink.tblusers where  lower(CHRLDAPNAME)  like lower('%Rajesh%')
Order by Seq
;
-- SEQ USERID     ACCESSMODE CHRLDAPNAME        CHRUSEREMAIL
-- --- ---------- ---------- ------------------ --------------------------------------------------
--   1 CCO.Droy   U          divyesh.roy        divyesh.roy@reversedepartment.com                 
--   2 CCO.RajesS U          rajesh.s           Rajesh.S@reversedepartment.com                    
--   2 cco.rs     U          rajesh.s           rajesh.s@reversedepartment.com                    

select 
* 
from celink.tblusers a 
where a.USERID in 
(
'CCO.Droy',
'CCO.RajesS'
)
order by CHRLDAPNAME
for read only  with ur; 

-- USERID     ACCESSMODE PASSWORD CHRLDAPNAME BTNCOGNOSRESTRICTED TICKLERLEVEL CHRUSEREMAIL                                       DIVISIONID DEPARTMENTID TEAMID
-- ---------- ---------- -------- ----------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- CCO.Droy   U          NONE     divyesh.roy                   0 N            divyesh.roy@reversedepartment.com                           0            0      0
-- CCO.RajesS U          NONE     rajesh.s                      0 N            Rajesh.S@reversedepartment.com                              0            0      0

-- --------- ---------- -------- ----------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
-- --------- ---------- -------- ----------------- ------------------- ------------ -------------------------------------------------- ---------- ------------ ------
select * from celink.tblauthorization a where VALUE in 
(
'CCO.Droy',
'CCO.RajesS'
)
order by a.value,  a.ID with ur;
-- ID KEY VALUE
-- -- --- -----
--none

select 
	a.ID, a.Key as "Assecc Mode", a.Value as "User Name", b.value as "Value"
	from celink.tblauthorization a 
	inner join celink.tblauthorization b
	on a.ID = b.ID 
	and b.KEY in ('page', 'field') 
	where a.VALUE in 
(
'CCO.vjosep',
'CCO.Droy',
'CCO.RajesS'
)
order by a.ID 
with ur;

-- ID Assecc Mode User Name  Value
-- -- ----------- ---------- ---------------
-- 69 manager     CCO.vjosep BankAccountInfo


			/* -- inserrrrrrrrt
			Insert into celink.tblauthorization 
			(ID, KEY,  VALUE)
			values 
			--(69, 'manager', 'CCO.Droy')
			(69, 'manager', 'CCO.RajesS')
			;
			*/


--end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- just check
select * from celink.tblauthorization a where VALUE in 
(
'CCO.knaras',

'CCO.SRafi',
'CCO.Sparsh',
'CCO.Tmane',
'CCO.Jbonga',
'CCO.Sbhada',
'CCO.Gjaisw',
'CCO.Rshaik',
'CCO.dmaind',
'CCO.ILaska'
)
order by a.value,  a.ID with ur;

-- ID KEY     VALUE
-- -- ------- ----------
-- 69 manager CCO.Gjaisw
-- 69 manager CCO.ILaska
-- 69 manager CCO.Jbonga
-- 69 manager CCO.Rshaik

-- 69 manager CCO.SRafi

-- 69 manager CCO.Sbhada
-- 69 manager CCO.Sparsh
-- 69 manager CCO.Tmane
-- 69 manager CCO.dmaind


select 
	a.ID, a.Key as "Assecc Mode", a.Value as "User Name", b.value as "Value"
	from celink.tblauthorization a 
	inner join celink.tblauthorization b
	on a.ID = b.ID 
	and b.KEY in ('page', 'field') 
	where a.VALUE in 
('CCO.PNagar', 'CCO.Spasha')
	order by a.ID 
with ur;

-- after
--
-- ID Assecc Mode User Name  Value
-- -- ----------- ---------- ---------------
-- 69 manager     CCO.PNagar BankAccountInfo
-- 69 manager     CCO.Spasha BankAccountInfo

select 
	a.ID, a.Key as "Assecc Mode", a.Value as "User Name", b.value as "Value"
	from celink.tblauthorization a 
	inner join celink.tblauthorization b
	on a.ID = b.ID 
	and b.KEY in ('page', 'field') 
	where a.id = 69
	order by a.Key 
with ur;
