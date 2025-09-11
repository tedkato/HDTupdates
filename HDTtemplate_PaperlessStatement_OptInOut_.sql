
/*----------------------------------------------------------------------------------------------------------------------------------------------------------
--*--
Amit Shah
2/9/2022 5:02 PM
2 is opt-out and 1 is opt-in
----------------------------------------------------------------------------------------------------------------------------------------------------------*/

/*
20220209

C:\Users\ted.kato\Documents\HDTUpdtNotes_97543.csv

INCIDENT #97543
Seth Waxman
Call Center Supervisor
Other
Created: Feb 09, 2022 at 2:45 PM by Seth Waxman

The accounts in the attached spreadsheet are Cherry Creek Transfers that have portal access and opted in to paperless statements. 
Please revert accounts to mailed statements

Cherry Creek Paperle...xlsx ,,, 50

--
Cyndie King
Feb 10, 2022 at 10:07 AM
Use your userid. 
Also, note that 3101637 is listed in this sheet twice and the most recent choice is already optout. 
Go ahead and post an entry for this loan so there's no question that it was included in the ticket.

-- 
Hi Cyndie,
Please take a look and advise.
I see the corresponding RS table is celink.PAPERLESSOPTION and to change to Opt-out seems to be done by inserting a new row with IDSOPTION = 2, EFFECTIVEDATE = time stamp.  
Could you please advise?  Also I am not sure how USERID shuld be populated.  So please advise on this.
Thank you!


select * from celink.PAPERLESSOPTION where IDSOPTION = 2 

Done. On Hold pending verification.
If the data is satisfactory, please do not respond and the ticket will be closed after a week or so.

48 loans updated (Loan 3101637 listed twice)

*/

---------------------------------------------------------------------------------- ------------------------ --------- -------------------------- ----------------------------------
---------------------------------------------------------------------------------- ------------------------ --------- -------------------------- ----------------------------------

/*
20250903
[ID:0198533]  Paperless Opt-in/out flag  9/3/2025 8:26 AM  Created by Dan Stack
Please remove Paperless Opt-in flag for attached loans so we may run borrower statements
="(" & G2 & ", 0198533, 'Dan Stack', " & A2 & ",  2, 'HDT198533'),"
Paperless option set to Opt-Out(ID2) 10 loans.  Peer review pending.
*/


-- ------------------------ --------- -------------------------- ----------------------------------
--samples
-- ------------------------ --------- -------------------------- ----------------------------------
select * from celink.PAPERLESSOPTION order by INTSUBSERVICERLOANNUMBER for read only with ur;
select * from celink.PAPERLESSOPTION where IDSOPTION = 2 and EFFECTIVEDATE is not null order by INTSUBSERVICERLOANNUMBER for read only with ur;
-- INTSUBSERVICERLOANNUMBER IDSOPTION EFFECTIVEDATE              USERID
-- ------------------------ --------- -------------------------- ----------------------------------
--                1204333.0         2 2021-07-30 11:45:33.668181 acapozza@cox.net
--                1204333.0         2 2021-07-30 11:56:06.969571 acapozza@cox.net
--                3166825.0         2 2021-07-30 12:34:33.995652 jim@independence-planning.com
--                1407380.0         2 2021-07-30 17:05:37.877388 natalia+1407380@thewarehouseco.com
--                3114503.0         2 2021-08-02 09:48:15.0      swaxman
--                3144762.0         2 2021-08-05 16:42:38.160228 cervera_trucking@yahoo.com
--                1284466.0         2 2021-08-09 08:05:00.091915 deegarra@gmail.com
--                3214661.0         2 2021-08-10 10:22:58.082564 inot753@yahoo.com
--                3189206.0         2 2021-08-10 16:41:08.741541 wdroesch@cox.net
--                1291581.0         2 2021-08-13 02:10:27.095546 j.w.collins@att.net
--                3164087.0         2 2021-08-24 14:01:58.759402 jdbailey669@gmail.com
--                3173089.0         2 2021-08-26 13:53:09.664973 sharonhoselton97@gmail.com
--                1295003.0         2 2021-08-30 12:13:46.064389 henryh37363@epbfi.com
--                1260035.0         2 2021-08-30 13:22:10.822646 atx11205@att.net
--                3195780.0         2 2021-08-30 13:28:56.232589 helene.a.miller@gmail.com
--                1297958.0         2 2021-08-30 16:01:55.0      kalieram
--                1220759.0         2 2021-08-31 16:23:23.892298 emonterreyc50@gmail.com

select * from celink.PAPERLESSOPTION where INTSUBSERVICERLOANNUMBER = 3101637 and EFFECTIVEDATE is not null for read only with ur;
-- INTSUBSERVICERLOANNUMBER IDSOPTION EFFECTIVEDATE              USERID
-- ------------------------ --------- -------------------------- ------------------------
--                3114503.0         1 2021-07-29 16:38:18.254911 eitan@thewarehouseco.com
--                3114503.0         2 2021-08-02 09:48:15.0      swaxman

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------

/* -- DATAUPDT Table for  
create table DATAUPDT.HDT_PaperlessStatement   
	(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan   integer,
	Option integer     default 2,      -- must be 2 for Optout
	UserID varchar(30) default 'HD183962'
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDT_PaperlessStatement  TO group db2_ast;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDT_PaperlessStatement  TO user cking;
	
	-- drop table DATAUPDT.HDT_PaperlessStatement;
	 select * from DATAUPDT.HDT_PaperlessStatement;
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDT_PaperlessStatement;

-------------------------------------------------------------------------------------------------------------------------------------
-- Data  
insert into DATAUPDT.HDT_PaperlessStatement
	(SeqNum, HDTNum, Requester, Loan, Option, UserID )
with Param 
	(SeqNum, HDTNum, Requester, Loan, NewOptID, UserID) as 
(Values
(1, 0198533, 'Dan Stack', 3343912,  2, 'HDT198533'),
(2, 0198533, 'Dan Stack', 1173299,  2, 'HDT198533'),
(3, 0198533, 'Dan Stack', 3309096,  2, 'HDT198533'),
(4, 0198533, 'Dan Stack', 3194980,  2, 'HDT198533'),
(5, 0198533, 'Dan Stack', 3349849,  2, 'HDT198533'),
(6, 0198533, 'Dan Stack', 3199183,  2, 'HDT198533'),
(7, 0198533, 'Dan Stack', 3247287,  2, 'HDT198533'),
(8, 0198533, 'Dan Stack', 3164167,  2, 'HDT198533'),
(9, 0198533, 'Dan Stack', 3364961,  2, 'HDT198533'),
(10, 0198533, 'Dan Stack', 3260213,  2, 'HDT198533')
) --(SeqNum, HDTNum, Requester, Loan, NewOptID, UserID) as 

select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.NewOptID, P.UserID 
	--, 2 as "Optout",  CURRENT_TIMESTAMP as "EffDate", 'tkato_HDT97543' as "UserID" 
from Param P
order by P.SeqNum
;

		------------------------------------------------------------
		select * from DATAUPDT.HDT_PaperlessStatement order by SeqNum;
			-- SEQNUM HDTNUM REQUESTER LOAN    OPTION USERID
			-- ------ ------ --------- ------- ------ ---------
			--      1 198533 Dan Stack 3343912      2 HDT198533
			--      2 198533 Dan Stack 1173299      2 HDT198533
			--      3 198533 Dan Stack 3309096      2 HDT198533
			--      4 198533 Dan Stack 3194980      2 HDT198533
			--      5 198533 Dan Stack 3349849      2 HDT198533
			--      6 198533 Dan Stack 3199183      2 HDT198533
			--      7 198533 Dan Stack 3247287      2 HDT198533
			--      8 198533 Dan Stack 3164167      2 HDT198533
			--      9 198533 Dan Stack 3364961      2 HDT198533
			--     10 198533 Dan Stack 3260213      2 HDT198533

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Note using values retreated in DATAUPDT.HDTTISATOZERO;
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
--   'Per HDT ' || UY.HDTNum || '(' || UY.Requester || ') ' || 'Paperless Preference set to Opt-Out.'
--   'Per HDT ' || UY.HDTNum || 'Paperless Preference set to Opt-Out.'
   'Per HDT ' || UY.HDTNum || ' Paperless Preference set from ' 
   || case when T.IDSOPTION = 1 then 'Opt-In' else 'Opt-Out' end || ' to ' 
   || case when UY.OPTION   = 1 then 'Opt-In' else 'Opt-Out' end 
from DATAUPDT.HDT_PaperlessStatement UY  
inner join celink.PAPERLESSOPTION T
on  UY.Loan = T.INTSUBSERVICERLOANNUMBER
and T.EFFECTIVEDATE = (select max(EFFECTIVEDATE) as MaxOP from celink.PAPERLESSOPTION where INTSUBSERVICERLOANNUMBER = UY.Loan)
Order by SeqNum 
; 

-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) 6
-- ------ ----------- -------------- ---------------- -------------------------------- --------------------------------------------------------------
--      1     3343912 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      2     1173299 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      3     3309096 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      4     3194980 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      5     3349849 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      6     3199183 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      7     3247287 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      8     3164167 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--      9     3364961 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out
--     10     3260213 N                                                                Per HDT 198533 Paperless Preference set from Opt-In to Opt-Out


-- (1354361, 'Per HDT 186527 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 

------ ---------------- ------------- -------------- ------------------ ------------------ ------------------- ------------------ ---------------------- ------------------------ ---------- --------------- ------------- ---------------- --------------------- --------------------- ---------------- ---------------------- ------------------ ---------- ----------------------- ------------------- ---------------- ----------------------------- -------------------------
-- Note creation 
	Select 
		'(' || cast(UY.Loan as integer) || ', '
		|| '''Per HDT ' || UY.HDTNum || ' Paperless Preference option set from '
		|| T.IDSOPTION || ':'  
		|| case when T.IDSOPTION = 1 then 'Opt-In' else 'Opt-Out' end || ' to ' 
		|| UY.OPTION || ':' 
	    || case when UY.OPTION   = 1 then 'Opt-In' else 'Opt-Out' end 
		|| '.''' 
		|| ', ' 
		|| 'CURRENT_TIMESTAMP, '
		|| '''tkato'', 0, 0), '
	as "Note Insert Value"
	from DATAUPDT.HDT_PaperlessStatement UY  
	inner join celink.PAPERLESSOPTION T
	on  UY.Loan = T.INTSUBSERVICERLOANNUMBER
	and T.EFFECTIVEDATE = (select max(EFFECTIVEDATE) as MaxOP from celink.PAPERLESSOPTION where INTSUBSERVICERLOANNUMBER = UY.Loan)
		
	Order by SeqNum 
	; 


/*
 Note Insert Value
 ---------------------------------------------------------------------------------------------------------------------------
 (3343912, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1173299, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3309096, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3194980, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3349849, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3199183, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3247287, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3164167, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3364961, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3260213, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 

*/

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- backup
--select * from DATAUPDT.HDT_PaperlessStatement order by SeqNum;
--(SeqNum, HDTNum, Requester, Loan, Option, UserID )

select 
	UY.SeqNum,
	UY.Loan,
	UY.Option,
	CURRENT_TIMESTAMP,
	trim(UY.UserID),
	T.INTSUBSERVICERLOANNUMBER, T.IDSOPTION, T.EFFECTIVEDATE, T.USERID
from  DATAUPDT.HDT_PaperlessStatement UY
inner join celink.PAPERLESSOPTION T
on  UY.Loan = T.INTSUBSERVICERLOANNUMBER
and T.EFFECTIVEDATE = (select max(EFFECTIVEDATE) as MaxOP from celink.PAPERLESSOPTION where INTSUBSERVICERLOANNUMBER = UY.Loan)
--where UY.SeqNum = 1
order by UY.SeqNum
;

/*
 SEQNUM LOAN    OPTION 4                          5         INTSUBSERVICERLOANNUMBER IDSOPTION EFFECTIVEDATE              USERID
 ------ ------- ------ -------------------------- --------- ------------------------ --------- -------------------------- -------------------------
      1 3343912      2 2025-09-03 09:10:08.044177 HDT198533                3343912.0         1 2025-08-11 22:31:41.31758  bob.schroeder@comcast.net
      2 1173299      2 2025-09-03 09:10:08.044177 HDT198533                1173299.0         1 2024-07-01 18:35:02.667672 lwtret70@gmail.com
      3 3309096      2 2025-09-03 09:10:08.044177 HDT198533                3309096.0         1 2024-04-05 00:07:26.707559 tessd6@gmail.com
      4 3194980      2 2025-09-03 09:10:08.044177 HDT198533                3194980.0         1 2025-08-11 16:42:10.754909 rhughes@messiah.edu
      5 3349849      2 2025-09-03 09:10:08.044177 HDT198533                3349849.0         1 2025-02-23 19:01:29.350781 jbdawes@yahoo.com
      6 3199183      2 2025-09-03 09:10:08.044177 HDT198533                3199183.0         1 2021-09-02 11:50:18.041484 fbwindov@yahoo.com
      7 3247287      2 2025-09-03 09:10:08.044177 HDT198533                3247287.0         1 2022-09-12 13:52:10.326486 davidgoehring@gmail.com
      8 3164167      2 2025-09-03 09:10:08.044177 HDT198533                3164167.0         1 2022-11-18 13:30:25.267866 jjrascal@att.net
      9 3364961      2 2025-09-03 09:10:08.044177 HDT198533                3364961.0         1 2025-08-28 23:22:24.383531 linbo4040@aim.com
     10 3260213      2 2025-09-03 09:10:08.044177 HDT198533                3260213.0         1 2024-11-03 11:07:51.432729 mjchaillet@gmail.com

--after
 SEQNUM LOAN    OPTION 4                         5         INTSUBSERVICERLOANNUMBER IDSOPTION EFFECTIVEDATE              USERID
 ------ ------- ------ ------------------------- --------- ------------------------ --------- -------------------------- ---------
      1 3343912      2 2025-09-03 09:11:32.09463 HDT198533                3343912.0         2 2025-09-03 09:11:22.027803 HDT198533
      2 1173299      2 2025-09-03 09:11:32.09463 HDT198533                1173299.0         2 2025-09-03 09:11:22.027803 HDT198533
      3 3309096      2 2025-09-03 09:11:32.09463 HDT198533                3309096.0         2 2025-09-03 09:11:22.027803 HDT198533
      4 3194980      2 2025-09-03 09:11:32.09463 HDT198533                3194980.0         2 2025-09-03 09:11:22.027803 HDT198533
      5 3349849      2 2025-09-03 09:11:32.09463 HDT198533                3349849.0         2 2025-09-03 09:11:22.027803 HDT198533
      6 3199183      2 2025-09-03 09:11:32.09463 HDT198533                3199183.0         2 2025-09-03 09:11:22.027803 HDT198533
      7 3247287      2 2025-09-03 09:11:32.09463 HDT198533                3247287.0         2 2025-09-03 09:11:22.027803 HDT198533
      8 3164167      2 2025-09-03 09:11:32.09463 HDT198533                3164167.0         2 2025-09-03 09:11:22.027803 HDT198533
      9 3364961      2 2025-09-03 09:11:32.09463 HDT198533                3364961.0         2 2025-09-03 09:11:22.027803 HDT198533
     10 3260213      2 2025-09-03 09:11:32.09463 HDT198533                3260213.0         2 2025-09-03 09:11:22.027803 HDT198533
*/

-----------------------------------------------------------------------------------------------------------------------
-- inserrrrt
-----------------------------------------------------------------------------------------------------------------------
--/* executedddd 20220414 JAVATest, 20220419 REVMBRD1

insert into celink.PAPERLESSOPTION 
(
	INTSUBSERVICERLOANNUMBER, IDSOPTION, EFFECTIVEDATE, USERID
)
select 
	UY.Loan,
	UY.Option,
	CURRENT_TIMESTAMP,
	trim(UY.UserID)
from DATAUPDT.HDT_PaperlessStatement UY
-- -- where UY.SeqNum > 1 --------------------------------------< test
order by UY.SeqNum
;

/*
-- the select
 LOAN    OPTION 3                          4
 ------- ------ -------------------------- ---------
 3343912      2 2025-09-03 09:11:00.319818 HDT198533
 1173299      2 2025-09-03 09:11:00.319818 HDT198533
 3309096      2 2025-09-03 09:11:00.319818 HDT198533
 3194980      2 2025-09-03 09:11:00.319818 HDT198533
 3349849      2 2025-09-03 09:11:00.319818 HDT198533
 3199183      2 2025-09-03 09:11:00.319818 HDT198533
 3247287      2 2025-09-03 09:11:00.319818 HDT198533
 3164167      2 2025-09-03 09:11:00.319818 HDT198533
 3364961      2 2025-09-03 09:11:00.319818 HDT198533
 3260213      2 2025-09-03 09:11:00.319818 HDT198533
*/

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--note
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
with p (Loan, Note, TimeS, who, prio, step) as
(values
-- Note Insert Value
-- ---------------------------------------------------------------------------------------------------------------------------
 (3343912, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (1173299, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3309096, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3194980, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3349849, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3199183, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3247287, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3164167, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3364961, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
 (3260213, 'Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out.', CURRENT_TIMESTAMP, 'tkato', 0, 0) 
)
select * from P 
;
	
/*
 LOAN    NOTE                                                                       TIMES                      WHO   PRIO STEP
 ------- -------------------------------------------------------------------------- -------------------------- ----- ---- ----
 3343912 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 1173299 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3309096 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3194980 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3349849 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3199183 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3247287 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3164167 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3364961 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 3260213 Per HDT 198533 Paperless Preference option set from 1:Opt-In to 2:Opt-Out. 2025-09-03 09:12:20.314526 tkato    0    0
 */
 
 -- end
 