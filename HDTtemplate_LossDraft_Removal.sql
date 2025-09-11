/*
20240517
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDT163053_Notes.csv

[ID:0163418]
Loss Draft -- removal
5/20/2024 9:50 AM
Charlotte Helmel
The loans on this list have details in the Loss Draft tracking tab that we are not able to clear and 
they do not belong in the Loss Draft tracking tab any longer. 
The Attached spreadsheet has the list of loans and an X in the field that needs to be cleared for that loan. 
let me know if there are any questions. 

fields not cleared in tracking tab.xlsx

--*--
Insurance Type and/or Type of Loss updated for 126 loans.  Peer review pending.
*Both fields were already blank for 4 loans.  

--**--
Charlotte Helmel
5/22/2024 5:19 AM
I reviewed this list of loans. there were 3 that were not cleared. they are attached
Loan	insurance type not cleared	Type of loss not cleared
1083480	X	
1125598	X	
1210366	X	

Charlotte Helmel
5/24/2024 5:40 AM
UPDATED
Thank that's my fault I marked the wrong column. My apologies and thank you for bringing that to my attention

** see xxx_Take2.sql

*/

/* source sample
--INSTYPE
Celink Loan Number		Loss Draft Insurance Type			
1265479	INSTYPE	Flood                                   	<BLANK>	1	(1001, 189130, 'Patricia Bouton', 1265479, 'INSTYPE', -999, 0),
1330921	INSTYPE	Hazard                                  	<BLANK>	2	(1002, 189130, 'Patricia Bouton', 1330921, 'INSTYPE', -999, 0),
3331214	INSTYPE	Hazard                                  	<BLANK>	3	(1003, 189130, 'Patricia Bouton', 3331214, 'INSTYPE', -999, 0),
3337248	INSTYPE	Hazard                                  	<BLANK>	4	(1004, 189130, 'Patricia Bouton', 3337248, 'INSTYPE', -999, 0),
3317468	INSTYPE	Hazard                                  	<BLANK>	5	(1005, 189130, 'Patricia Bouton', 3317468, 'INSTYPE', -999, 0),
1200742	INSTYPE	Hazard                                  	<BLANK>	6	(1006, 189130, 'Patricia Bouton', 1200742, 'INSTYPE', -999, 0),
1302872	INSTYPE	Hazard                                  	<BLANK>	7	(1007, 189130, 'Patricia Bouton', 1302872, 'INSTYPE', -999, 0),
3294276	INSTYPE	Hazard                                  	<BLANK>	8	(1008, 189130, 'Patricia Bouton', 3294276, 'INSTYPE', -999, 0),
3307256	INSTYPE	Hazard                                  	<BLANK>	9	(1009, 189130, 'Patricia Bouton', 3307256, 'INSTYPE', -999, 0),
1117255	INSTYPE	Hazard                                  	<BLANK>	10	(1010, 189130, 'Patricia Bouton', 1117255, 'INSTYPE', -999, 0),
1345584	INSTYPE	Hazard                                  	<BLANK>	11	(1011, 189130, 'Patricia Bouton', 1345584, 'INSTYPE', -999, 0),
3283879	INSTYPE	Hazard                                  	<BLANK>	12	(1012, 189130, 'Patricia Bouton', 3283879, 'INSTYPE', -999, 0),
3339254	INSTYPE	Hazard                                  	<BLANK>	13	(1013, 189130, 'Patricia Bouton', 3339254, 'INSTYPE', -999, 0),
1333571	INSTYPE	Hazard                                  	<BLANK>	14	(1014, 189130, 'Patricia Bouton', 1333571, 'INSTYPE', -999, 0),

--LOSTYPE
Celink Loan Number		Loss Draft Type of Loss			
1265479	LOSTYPE	Water/Flood                             	<BLANK>	1	(2001, 0180184, 'Patricia Bouton', 1265479, 'LOSTYPE', -999, 0),
1330921	LOSTYPE	Wind                                    	<BLANK>	2	(2002, 0180184, 'Patricia Bouton', 1330921, 'LOSTYPE', -999, 0),
3331214	LOSTYPE	Water/Seepage                           	<BLANK>	3	(2003, 0180184, 'Patricia Bouton', 3331214, 'LOSTYPE', -999, 0),
3337248	LOSTYPE	Water/Seepage                           	<BLANK>	4	(2004, 0180184, 'Patricia Bouton', 3337248, 'LOSTYPE', -999, 0),
3317468	LOSTYPE	Other                                   	<BLANK>	5	(2005, 0180184, 'Patricia Bouton', 3317468, 'LOSTYPE', -999, 0),
1200742	LOSTYPE	Other                                   	<BLANK>	6	(2006, 0180184, 'Patricia Bouton', 1200742, 'LOSTYPE', -999, 0),
1302872	LOSTYPE	Fire                                    	<BLANK>	7	(2007, 0180184, 'Patricia Bouton', 1302872, 'LOSTYPE', -999, 0),
3294276	LOSTYPE	Water/Seepage                           	<BLANK>	8	(2008, 0180184, 'Patricia Bouton', 3294276, 'LOSTYPE', -999, 0),
3307256	LOSTYPE	Wind                                    	<BLANK>	9	(2009, 0180184, 'Patricia Bouton', 3307256, 'LOSTYPE', -999, 0),
1117255	LOSTYPE												<BLANK>	10	(2010, 0180184, 'Patricia Bouton', 1117255, 'LOSTYPE', -999, 0),
1345584	LOSTYPE	Other                                   	<BLANK>	11	(2011, 0180184, 'Patricia Bouton', 1345584, 'LOSTYPE', -999, 0),
3283879	LOSTYPE	Wind                                    	<BLANK>	12	(2012, 0180184, 'Patricia Bouton', 3283879, 'LOSTYPE', -999, 0),
3339254	LOSTYPE	Other                                   	<BLANK>	13	(2013, 0180184, 'Patricia Bouton', 3339254, 'LOSTYPE', -999, 0),
1333571	LOSTYPE	Other                                   	<BLANK>	14	(2014, 0180184, 'Patricia Bouton', 1333571, 'LOSTYPE', -999, 0),

*/

--------------- ---------- ------------ ------------------ ---------------------- --------------- ---------- ---------- ------------------- ---------------- ---------------- -------------------- -------------------- ---------------- --------------- ----------------- ------------------- ---------------- -------------- ----------------- ------------------ -------
--------------- ---------- ------------ ------------------ ---------------------- --------------- ---------- ---------- ------------------- ---------------- ---------------- -------------------- -------------------- ---------------- --------------- ----------------- ------------------- ---------------- -------------- ----------------- ------------------ -------
--HDTs

/*
20250506

189130	Ted Kato	Loss draft	Patricia Bouton	Low	5/6/2025 10:29
Using the attached list, please have the 'Insurance Type" and "Type of loss data" removed from ReverServ. The field need to be changed back to blank. 
Remove Data_Need Approval 5.5.25.xlsx
INSTYPE ... ="(" & E2+1000 & ", 189130, 'Patricia Bouton', " & A2 & ", '" & UPPER(TRIM(B2)) & "', " & IF(UPPER(TRIM(C2)) = "UNKNOWN", -999, -999) & ", " & IF(UPPER(TRIM(D2)) = "<BLANK>",  0, -999) &"),"
LOSTYPE ... ="(" & E2+2000 & ", 0180184, 'Patricia Bouton', " & A2 & ", '" & UPPER(TRIM(B2)) & "', " & IF(UPPER(TRIM(C2)) = "UNKNOWN", -999, -999) & ", " & IF(UPPER(TRIM(D2)) = "<BLANK>",  0, -999) &"),"
*/

--------------- ---------- ------------ ------------------ ---------------------- --------------- ---------- ---------- ------------------- ---------------- ---------------- -------------------- -------------------- ---------------- --------------- ----------------- ------------------- ---------------- -------------- ----------------- ------------------ -------
--------------- ---------- ------------ ------------------ ---------------------- --------------- ---------- ---------- ------------------- ---------------- ---------------- -------------------- -------------------- ---------------- --------------- ----------------- ------------------- ---------------- -------------- ----------------- ------------------ -------

--refs:
select TT.LDINSURANCETYPE, TT.LDLOSsTYPE,* from celink.tblLossDraft TT where TT.LDLoanNumber = 3265706;
 LDINSURANCETYPE LDLOSSTYPE LDLOANNUMBER LDNOTICEOFLOSSDATE LDINSCHECKRECEIVEDDATE LDINSURANCETYPE LDLOSSTYPE LDLOSSDATE LDFORCEDPLACEDCLAIM LDCLAIMFILEDDATE LDADJUSTERNUMBER LDCLAIMFILENUMBER    LDTOTALFUNDSRECEIVED LDFUNDSDISBURSED LDINSCOHOLDBACK LDINSPORDEREDDATE LDOWNERCERTRCVDDATE LDCOMPLETIONDATE LDADJUSTERNAME LDREPAIRSREQUIRED LDREPAIRSREMAINING LDNOTES
 --------------- ---------- ------------ ------------------ ---------------------- --------------- ---------- ---------- ------------------- ---------------- ---------------- -------------------- -------------------- ---------------- --------------- ----------------- ------------------- ---------------- -------------- ----------------- ------------------ -------
               1          2    3265706.0 2024-09-13         NULL                                 1          2 NULL                         0 NULL             NULL             2024012675                       0.000000         0.000000        0.000000 NULL              NULL                NULL             NULL           NULL              NULL               NULL

-- **** the history of the transaction ... 
SELECT 
	LDLoanNumber, LDINSURANCETYPE, LDLOSsTYPE 
	SYS_START, SYS_END, USER_ID_COL, CHANGE_REC
	from celink.tblLossDraft
	for system_time from '2019-06-01-00.00.00.000000' to '9999-12-30-00.00.00.000000'
	where LDLoanNumber = 3265706 
	order by SYS_END desc
for read only with UR;

select * from celink.tblLossDraft where LDLoanNumber = 1391255 for read only with ur;
 LDLOANNUMBER LDNOTICEOFLOSSDATE LDINSCHECKRECEIVEDDATE LDINSURANCETYPE LDLOSSTYPE LDLOSSDATE LDFORCEDPLACEDCLAIM LDCLAIMFILEDDATE LDADJUSTERNUMBER LDCLAIMFILENUMBER    LDTOTALFUNDSRECEIVED LDFUNDSDISBURSED LDINSCOHOLDBACK LDINSPORDEREDDATE LDOWNERCERTRCVDDATE LDCOMPLETIONDATE LDADJUSTERNAME LDREPAIRSREQUIRED LDREPAIRSREMAINING LDNOTES
 ------------ ------------------ ---------------------- --------------- ---------- ---------- ------------------- ---------------- ---------------- -------------------- -------------------- ---------------- --------------- ----------------- ------------------- ---------------- -------------- ----------------- ------------------ -------
    1391255.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 

-- master data
select * from celink.TBLInsuranceType TTx for read only with ur;
select * from celink.TBLLOSsTYPE TTy for read only with ur;

/*
 INSTYPECODE INSTYPEDESC
 ----------- ----------------------------------------
           1 Hazard                                  
           2 Flood                                   

 LOSSTYPECODE LOSSTYPEDESC
 ------------ ----------------------------------------
            1 Fire                                    
            2 Wind                                    
            3 Water/Flood                             
            4 Water/Seepage                           
            5 Theft                                   
            6 Vandalism                               
            7 Other                                   
*/

-------------------------------------
-- Source Data
-------------------------------------

/* **** -999 do not touch, other wise replace **** 
	create table DATAUPDT.HDTLossDraft 
	(
		SeqNum integer,
		HDTNum integer, 
		Requester varchar(30), --default 'Chelsea Romero',
		Loan integer,
	
		UpdtDesc varchar(30),	--What to change
		NewDate  date,			--Notice Of Loss Date, Date of Loss field
		NewType  integer,		--Loss Type, Insurance Type
		NewText  varchar(30),	--Claim File Number

		ChangeNeeded integer default 0,  
		NewNotes        varchar (200) default NULL-- this column might not be used
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTLossDraft  TO group db2_ast;
	
	-- drop table    DATAUPDT.HDTLossDraft;
="(" & E2 & ", 0169247, 'Sue Benitez', " & A2 & ", '" & UPPER(TRIM(B2)) & "', " & IF(UPPER(TRIM(C2)) = "UNKNOWN", -999, -999) & ", " & IF(UPPER(TRIM(D2)) = "<BLANK>",  0, -999) &"),"
*/

select * from DATAUPDT.HDTLossDraft;

with Param 
(SeqNum, HDTNum, Requester, Loan, UpdtDesc, NoUse, NewType) as  --999 do not touch
(Values

--(1001, 0180184, 'Patricia Bouton', 1391255, 'LOSTYPE', -999, 0),
--(1002, 0180184, 'Patricia Bouton', 3329731, 'LOSTYPE', -999, 0)

(1001, 189130, 'Patricia Bouton', 1265479, 'INSTYPE', -999, 0),
(1002, 189130, 'Patricia Bouton', 1330921, 'INSTYPE', -999, 0),
(1003, 189130, 'Patricia Bouton', 3331214, 'INSTYPE', -999, 0),
(1004, 189130, 'Patricia Bouton', 3337248, 'INSTYPE', -999, 0),
(1005, 189130, 'Patricia Bouton', 3317468, 'INSTYPE', -999, 0),
(1006, 189130, 'Patricia Bouton', 1200742, 'INSTYPE', -999, 0),
(1007, 189130, 'Patricia Bouton', 1302872, 'INSTYPE', -999, 0),
(1008, 189130, 'Patricia Bouton', 3294276, 'INSTYPE', -999, 0),
(1009, 189130, 'Patricia Bouton', 3307256, 'INSTYPE', -999, 0),
(1010, 189130, 'Patricia Bouton', 1117255, 'INSTYPE', -999, 0),
(1011, 189130, 'Patricia Bouton', 1345584, 'INSTYPE', -999, 0),
(1012, 189130, 'Patricia Bouton', 3283879, 'INSTYPE', -999, 0),
(1013, 189130, 'Patricia Bouton', 3339254, 'INSTYPE', -999, 0),
(1014, 189130, 'Patricia Bouton', 1333571, 'INSTYPE', -999, 0),

(2001, 0180184, 'Patricia Bouton', 1265479, 'LOSTYPE', -999, 0),
(2002, 0180184, 'Patricia Bouton', 1330921, 'LOSTYPE', -999, 0),
(2003, 0180184, 'Patricia Bouton', 3331214, 'LOSTYPE', -999, 0),
(2004, 0180184, 'Patricia Bouton', 3337248, 'LOSTYPE', -999, 0),
(2005, 0180184, 'Patricia Bouton', 3317468, 'LOSTYPE', -999, 0),
(2006, 0180184, 'Patricia Bouton', 1200742, 'LOSTYPE', -999, 0),
(2007, 0180184, 'Patricia Bouton', 1302872, 'LOSTYPE', -999, 0),
(2008, 0180184, 'Patricia Bouton', 3294276, 'LOSTYPE', -999, 0),
(2009, 0180184, 'Patricia Bouton', 3307256, 'LOSTYPE', -999, 0),
(2010, 0180184, 'Patricia Bouton', 1117255, 'LOSTYPE', -999, 0),
(2011, 0180184, 'Patricia Bouton', 1345584, 'LOSTYPE', -999, 0),
(2012, 0180184, 'Patricia Bouton', 3283879, 'LOSTYPE', -999, 0),
(2013, 0180184, 'Patricia Bouton', 3339254, 'LOSTYPE', -999, 0),
(2014, 0180184, 'Patricia Bouton', 1333571, 'LOSTYPE', -999, 0)

) --(SeqNum, HDTNum, Requester, Loan, UpdtDesc, NewType) as 
select 
pp.SeqNum,
TT.LDINSURANCETYPE,
TT.LDLOSSTYPE,
TT.*
from Param PP 
left outer join celink.tblLossDraft TT 
on PP.Loan =  TT.LDLoanNumber
order by pp.SeqNum
for read only with ur;
/*
 SEQNUM LDINSURANCETYPE LDLOSSTYPE LDLOANNUMBER LDNOTICEOFLOSSDATE LDINSCHECKRECEIVEDDATE LDINSURANCETYPE LDLOSSTYPE LDLOSSDATE LDFORCEDPLACEDCLAIM LDCLAIMFILEDDATE LDADJUSTERNUMBER LDCLAIMFILENUMBER    LDTOTALFUNDSRECEIVED LDFUNDSDISBURSED LDINSCOHOLDBACK LDINSPORDEREDDATE LDOWNERCERTRCVDDATE LDCOMPLETIONDATE LDADJUSTERNAME LDREPAIRSREQUIRED LDREPAIRSREMAINING LDNOTES
 ------ --------------- ---------- ------------ ------------------ ---------------------- --------------- ---------- ---------- ------------------- ---------------- ---------------- -------------------- -------------------- ---------------- --------------- ----------------- ------------------- ---------------- -------------- ----------------- ------------------ --------------------------------------------------
   1001               2          3    1265479.0 NULL               NULL                                 2          3 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   1002               1          2    1330921.0 NULL               NULL                                 1          2 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   1003               1          4    3331214.0 NULL               NULL                                 1          4 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 claim denied
   1004               1          4    3337248.0 NULL               NULL                                 1          4 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   1005               1          7    3317468.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                            o                                    Claim denied
   1006               1          7    1200742.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 Claim Denied
   1007               1          1    1302872.0 NULL               NULL                                 1          1 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   1008               1          4    3294276.0 NULL               NULL                                 1          4 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   1009               1          2    3307256.0 NULL               NULL                                 1          2 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   1010               1          0    1117255.0 NULL               NULL                                 1          0 NULL                         0 NULL             NULL             015896793                        0.000000         0.000000        0.000000 NULL              NULL                NULL             NULL           NULL              NULL               Claim Denied
   1011               1          7    1345584.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   1012               1          2    3283879.0 NULL               NULL                                 1          2 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 Claim denied/below deductible
   1013               1          7    3339254.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 Repairs related to holdback funds//No claims filed
   1014               1          7    1333571.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 wear and tear//claim was denied
   2001               2          3    1265479.0 NULL               NULL                                 2          3 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   2002               1          2    1330921.0 NULL               NULL                                 1          2 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   2003               1          4    3331214.0 NULL               NULL                                 1          4 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 claim denied
   2004               1          4    3337248.0 NULL               NULL                                 1          4 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   2005               1          7    3317468.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                            o                                    Claim denied
   2006               1          7    1200742.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 Claim Denied
   2007               1          1    1302872.0 NULL               NULL                                 1          1 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   2008               1          4    3294276.0 NULL               NULL                                 1          4 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   2009               1          2    3307256.0 NULL               NULL                                 1          2 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   2010               1          0    1117255.0 NULL               NULL                                 1          0 NULL                         0 NULL             NULL             015896793                        0.000000         0.000000        0.000000 NULL              NULL                NULL             NULL           NULL              NULL               Claim Denied
   2011               1          7    1345584.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 
   2012               1          2    3283879.0 NULL               NULL                                 1          2 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 Claim denied/below deductible
   2013               1          7    3339254.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 Repairs related to holdback funds//No claims filed
   2014               1          7    1333571.0 NULL               NULL                                 1          7 NULL                         0 NULL                                                               0.000000         0.000000        0.000000 NULL              NULL                NULL                                                                 wear and tear//claim was denied

*/
-------------------------------------------------------------------------------------------------------------------------------------
-- source 
-------------------------------------------------------------------------------------------------------------------------------------
select * from DATAUPDT.HDTLossDraft;

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTLossDraft;

-------------------------------------------------------------------------------------------------------------------------------------
insert into DATAUPDT.HDTLossDraft
(
SeqNum, HDTNum, Requester, Loan,
UpdtDesc,
NewType,
ChangeNeeded
)

with Param 
(SeqNum, HDTNum, Requester, Loan, UpdtDesc, NoUse,NewType) as  --999 do not touch
(Values

(1001, 189130, 'Patricia Bouton', 1265479, 'INSTYPE', -999, 0),
(1002, 189130, 'Patricia Bouton', 1330921, 'INSTYPE', -999, 0),
(1003, 189130, 'Patricia Bouton', 3331214, 'INSTYPE', -999, 0),
(1004, 189130, 'Patricia Bouton', 3337248, 'INSTYPE', -999, 0),
(1005, 189130, 'Patricia Bouton', 3317468, 'INSTYPE', -999, 0),
(1006, 189130, 'Patricia Bouton', 1200742, 'INSTYPE', -999, 0),
(1007, 189130, 'Patricia Bouton', 1302872, 'INSTYPE', -999, 0),
(1008, 189130, 'Patricia Bouton', 3294276, 'INSTYPE', -999, 0),
(1009, 189130, 'Patricia Bouton', 3307256, 'INSTYPE', -999, 0),
(1010, 189130, 'Patricia Bouton', 1117255, 'INSTYPE', -999, 0),
(1011, 189130, 'Patricia Bouton', 1345584, 'INSTYPE', -999, 0),
(1012, 189130, 'Patricia Bouton', 3283879, 'INSTYPE', -999, 0),
(1013, 189130, 'Patricia Bouton', 3339254, 'INSTYPE', -999, 0),
(1014, 189130, 'Patricia Bouton', 1333571, 'INSTYPE', -999, 0),

(2001, 0180184, 'Patricia Bouton', 1265479, 'LOSTYPE', -999, 0),
(2002, 0180184, 'Patricia Bouton', 1330921, 'LOSTYPE', -999, 0),
(2003, 0180184, 'Patricia Bouton', 3331214, 'LOSTYPE', -999, 0),
(2004, 0180184, 'Patricia Bouton', 3337248, 'LOSTYPE', -999, 0),
(2005, 0180184, 'Patricia Bouton', 3317468, 'LOSTYPE', -999, 0),
(2006, 0180184, 'Patricia Bouton', 1200742, 'LOSTYPE', -999, 0),
(2007, 0180184, 'Patricia Bouton', 1302872, 'LOSTYPE', -999, 0),
(2008, 0180184, 'Patricia Bouton', 3294276, 'LOSTYPE', -999, 0),
(2009, 0180184, 'Patricia Bouton', 3307256, 'LOSTYPE', -999, 0),
(2010, 0180184, 'Patricia Bouton', 1117255, 'LOSTYPE', -999, 0),
(2011, 0180184, 'Patricia Bouton', 1345584, 'LOSTYPE', -999, 0),
(2012, 0180184, 'Patricia Bouton', 3283879, 'LOSTYPE', -999, 0),
(2013, 0180184, 'Patricia Bouton', 3339254, 'LOSTYPE', -999, 0),
(2014, 0180184, 'Patricia Bouton', 1333571, 'LOSTYPE', -999, 0)

) --(SeqNum, HDTNum, Requester, Loan, UpdtDesc, NoUse, NewType) as 

SELECT
--	count (*)
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	case NewType when -999 then 0
	else
		case UpdtDesc
		when 'INSTYPE' then 
			case when TT.LDINSURANCETYPE = PP.NewType then 0 else -1 end
		when 'LOSTYPE' then
			case when TT.LDLOSSTYPE = PP.NewType then 0 else -1 end
		end 
	end ChangeNeeded
--	, 
--	case NewType when -999 then 0
--	else
--		case UpdtDesc
--		when 'INSTYPE' then 
--			case when TT.LDINSURANCETYPE = PP.NewType then '' else ' Insurance type updated from ' || cast(TT.LDINSURANCETYPE as varchar(2)) || '<' || trim(TTx.INSTYPEDESC) || '> to 0<Blank>' end 
--		when 'LOSTYPE' then
--			case when TT.LDLOSTYPE      = PP.NewType then '' else ' Type of loss from ' || cast(TT.LDLOSTYPE as varchar(2)) || '<' || trim(TTy.LOSTYPEDESC) || '> to 0<Blank>' end  
--		end 
--	end NewNotes

from Param PP 
left outer join celink.tblLossDraft TT 
on PP.Loan = TT.LDLoanNumber

--left outer join celink.TBLInsuranceType TTx
--on TT.LDINSURANCETYPE = TTx.INSTYPECODE 
--
--left outer join celink.TBLInsuranceType PPx
--on PP.NewType = PPx.INSTYPECODE
--
--left outer join celink.TBLLOSTYPE TTy
--on TT.LDLOSTYPE = TTy.LOSTYPECODE 
--
--left outer join celink.TBLLOSTYPE PPy
--on PP.NewType = PPy.LOSTYPECODE
--
ORDER BY PP.SeqNum
with ur;

		-- SEQNUM HDTNUM REQUESTER   LOAN    UPDTDESC NEWTYPE CHANGENEEDED
		-- ------ ------ ----------- ------- -------- ------- ------------

		----------------------------------------------------
		select * from DATAUPDT.HDTLossDraft order by SeqNum;
		select * from DATAUPDT.HDTLossDraft order by UPDTDESC, SeqNum;
		select Loan, count(Loan) from DATAUPDT.HDTLossDraft where UpdtDesc = 'INSTYPE' group by Loan having count(Loan) > 1 ; 
		select Loan, count(Loan) from DATAUPDT.HDTLossDraft where UpdtDesc = 'LOSTYPE' group by Loan having count(Loan) > 1 ; 
		-- no dup

		select * from DATAUPDT.HDTLossDraft where UpdtDesc = 'INSTYPE' and ChangeNeeded = -1 
		union
		select * from DATAUPDT.HDTLossDraft where UpdtDesc = 'LOSTYPE' and ChangeNeeded = -1 
		order by SeqNum;
		/*
		 SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWDATE NEWTYPE NEWTEXT CHANGENEEDED NEWNOTES
		 ------ ------ --------------- ------- -------- ------- ------- ------- ------------ --------
		   1001 189130 Patricia Bouton 1265479 INSTYPE  NULL          0 NULL              -1 NULL
		   1002 189130 Patricia Bouton 1330921 INSTYPE  NULL          0 NULL              -1 NULL
		   1003 189130 Patricia Bouton 3331214 INSTYPE  NULL          0 NULL              -1 NULL
		   1004 189130 Patricia Bouton 3337248 INSTYPE  NULL          0 NULL              -1 NULL
		   1005 189130 Patricia Bouton 3317468 INSTYPE  NULL          0 NULL              -1 NULL
		   1006 189130 Patricia Bouton 1200742 INSTYPE  NULL          0 NULL              -1 NULL
		   1007 189130 Patricia Bouton 1302872 INSTYPE  NULL          0 NULL              -1 NULL
		   1008 189130 Patricia Bouton 3294276 INSTYPE  NULL          0 NULL              -1 NULL
		   1009 189130 Patricia Bouton 3307256 INSTYPE  NULL          0 NULL              -1 NULL
		   1010 189130 Patricia Bouton 1117255 INSTYPE  NULL          0 NULL              -1 NULL
		   1011 189130 Patricia Bouton 1345584 INSTYPE  NULL          0 NULL              -1 NULL
		   1012 189130 Patricia Bouton 3283879 INSTYPE  NULL          0 NULL              -1 NULL
		   1013 189130 Patricia Bouton 3339254 INSTYPE  NULL          0 NULL              -1 NULL
		   1014 189130 Patricia Bouton 1333571 INSTYPE  NULL          0 NULL              -1 NULL
		   2001 180184 Patricia Bouton 1265479 LOSTYPE  NULL          0 NULL              -1 NULL
		   2002 180184 Patricia Bouton 1330921 LOSTYPE  NULL          0 NULL              -1 NULL
		   2003 180184 Patricia Bouton 3331214 LOSTYPE  NULL          0 NULL              -1 NULL
		   2004 180184 Patricia Bouton 3337248 LOSTYPE  NULL          0 NULL              -1 NULL
		   2005 180184 Patricia Bouton 3317468 LOSTYPE  NULL          0 NULL              -1 NULL
		   2006 180184 Patricia Bouton 1200742 LOSTYPE  NULL          0 NULL              -1 NULL
		   2007 180184 Patricia Bouton 1302872 LOSTYPE  NULL          0 NULL              -1 NULL
		   2008 180184 Patricia Bouton 3294276 LOSTYPE  NULL          0 NULL              -1 NULL
		   2009 180184 Patricia Bouton 3307256 LOSTYPE  NULL          0 NULL              -1 NULL
		   2011 180184 Patricia Bouton 1345584 LOSTYPE  NULL          0 NULL              -1 NULL
		   2012 180184 Patricia Bouton 3283879 LOSTYPE  NULL          0 NULL              -1 NULL
		   2013 180184 Patricia Bouton 3339254 LOSTYPE  NULL          0 NULL              -1 NULL
		   2014 180184 Patricia Bouton 1333571 LOSTYPE  NULL          0 NULL              -1 NULL
		*/


		select * from DATAUPDT.HDTLossDraft where UpdtDesc = 'INSTYPE' and ChangeNeeded = 0
		union
		select * from DATAUPDT.HDTLossDraft where UpdtDesc = 'LOSTYPE' and ChangeNeeded = 0  
		order by SeqNum; --
		-- SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWDATE NEWTYPE NEWTEXT CHANGENEEDED NEWNOTES
		-- ------ ------ --------------- ------- -------- ------- ------- ------- ------------ --------
		--   2010 180184 Patricia Bouton 1117255 LOSTYPE  NULL          0 NULL               0 NULL

-----------------------------------------------------------------------------------------------------
-- validation/update NewNote ,,, INSTYPE ,,, to complete tracking note data
SELECT
--	count (*)
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PPx.INSTYPEDESC "NewTypeDesc",
	TT.LDINSURANCETYPE, 
	TTx.INSTYPEDESC "CurTypeDesc"
	, changeneeded
	, PP.NewNotes
--	'-->--', TT.*

from DATAUPDT.HDTLossDraft PP 
left outer join celink.tblLossDraft TT 
on PP.Loan = TT.LDLoanNumber

left outer join celink.TBLInsuranceType TTx
on TT.LDINSURANCETYPE = TTx.INSTYPECODE 

left outer join celink.TBLInsuranceType PPx
on PP.NewType = PPx.INSTYPECODE

where UpdtDesc = 'INSTYPE' --and changeneeded = -1
ORDER BY PP.SeqNum
with ur;

-- SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWTYPE NewTypeDesc LDINSURANCETYPE CurTypeDesc                              CHANGENEEDED NEWNOTES
-- ------ ------ --------------- ------- -------- ------- ----------- --------------- ---------------------------------------- ------------ --------
--   1001 189130 Patricia Bouton 1265479 INSTYPE        0 NULL                      2 Flood                                              -1 NULL
--   1002 189130 Patricia Bouton 1330921 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1003 189130 Patricia Bouton 3331214 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1004 189130 Patricia Bouton 3337248 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1005 189130 Patricia Bouton 3317468 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1006 189130 Patricia Bouton 1200742 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1007 189130 Patricia Bouton 1302872 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1008 189130 Patricia Bouton 3294276 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1009 189130 Patricia Bouton 3307256 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1010 189130 Patricia Bouton 1117255 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1011 189130 Patricia Bouton 1345584 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1012 189130 Patricia Bouton 3283879 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1013 189130 Patricia Bouton 3339254 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL
--   1014 189130 Patricia Bouton 1333571 INSTYPE        0 NULL                      1 Hazard                                             -1 NULL

MERGE INTO DATAUPDT.HDTLossDraft TT 
USING 
(
SELECT
--	count (*)
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PPx.INSTYPEDESC "NewTypeDesc",
	TT.LDINSURANCETYPE, 
	TTx.INSTYPEDESC "CurTypeDesc"
	,
	case when ChangeNeeded = -1 then
		case UpdtDesc
		when 'INSTYPE' then ' Insurance type updated from ' || cast(TT.LDINSURANCETYPE as varchar(2)) || '<' || trim(TTx.INSTYPEDESC) || '> to 0<Blank>' 
		end 
	ELSE
		''
	end NewNotes

from DATAUPDT.HDTLossDraft PP 
left outer join celink.tblLossDraft TT 
on PP.Loan = TT.LDLoanNumber

left outer join celink.TBLInsuranceType TTx
on TT.LDINSURANCETYPE = TTx.INSTYPECODE 

left outer join celink.TBLInsuranceType PPx
on PP.NewType = PPx.INSTYPECODE

where UpdtDesc = 'INSTYPE' and changeneeded = -1
ORDER BY PP.SeqNum

)UY
on UY.Loan = TT.Loan
and UY.UpdtDesc = TT.UpdtDesc
WHEN MATCHED THEN UPDATE 
Set
TT.NewNotes = UY.NewNotes
;

-- SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWTYPE NewTypeDesc LDINSURANCETYPE CurTypeDesc                              NEWNOTES
-- ------ ------ --------------- ------- -------- ------- ----------- --------------- ---------------------------------------- --------------------------------------------------
--   1001 189130 Patricia Bouton 1265479 INSTYPE        0 NULL                      2 Flood                                     Insurance type updated from 2<Flood> to 0<Blank>
--   1002 189130 Patricia Bouton 1330921 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1003 189130 Patricia Bouton 3331214 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1004 189130 Patricia Bouton 3337248 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1005 189130 Patricia Bouton 3317468 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1006 189130 Patricia Bouton 1200742 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1007 189130 Patricia Bouton 1302872 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1008 189130 Patricia Bouton 3294276 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1009 189130 Patricia Bouton 3307256 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1010 189130 Patricia Bouton 1117255 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1011 189130 Patricia Bouton 1345584 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1012 189130 Patricia Bouton 3283879 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1013 189130 Patricia Bouton 3339254 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>
--   1014 189130 Patricia Bouton 1333571 INSTYPE        0 NULL                      1 Hazard                                    Insurance type updated from 1<Hazard> to 0<Blank>

-----------------------------------------------------------------------------------------------------
-- validation/Update NewNote ,,, LOSTYPEe  ,,, to complete tracking note data
SELECT
--	count (*)
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PPx.LOSSTYPEDESC "NewTypeDesc",
	TT.LDLOSSTYPE, 
	TTx.LOSSTYPEDESC "CurTypeDesc"
	,
	changeneeded
	,
	NewNotes
	
--	'-->--', TT.*

from DATAUPDT.HDTLossDraft PP 
left outer join celink.tblLossDraft TT 
on PP.Loan = TT.LDLoanNumber

left outer join celink.TBLLOSSTYPE TTx
on TT.LDLOSSTYPE = TTx.LOSSTYPECODE 

left outer join celink.TBLLOSSTYPE PPx
on PP.NewType = PPx.LOSSTYPECODE

where UpdtDesc = 'LOSTYPE' --and changeneeded = -1
ORDER BY PP.SeqNum
with ur;

-- SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWTYPE NewTypeDesc LDLOSSTYPE CurTypeDesc                              CHANGENEEDED NEWNOTES
-- ------ ------ --------------- ------- -------- ------- ----------- ---------- ---------------------------------------- ------------ --------
--   2001 180184 Patricia Bouton 1265479 LOSTYPE        0 NULL                 3 Water/Flood                                        -1 NULL
--   2002 180184 Patricia Bouton 1330921 LOSTYPE        0 NULL                 2 Wind                                               -1 NULL
--   2003 180184 Patricia Bouton 3331214 LOSTYPE        0 NULL                 4 Water/Seepage                                      -1 NULL
--   2004 180184 Patricia Bouton 3337248 LOSTYPE        0 NULL                 4 Water/Seepage                                      -1 NULL
--   2005 180184 Patricia Bouton 3317468 LOSTYPE        0 NULL                 7 Other                                              -1 NULL
--   2006 180184 Patricia Bouton 1200742 LOSTYPE        0 NULL                 7 Other                                              -1 NULL
--   2007 180184 Patricia Bouton 1302872 LOSTYPE        0 NULL                 1 Fire                                               -1 NULL
--   2008 180184 Patricia Bouton 3294276 LOSTYPE        0 NULL                 4 Water/Seepage                                      -1 NULL
--   2009 180184 Patricia Bouton 3307256 LOSTYPE        0 NULL                 2 Wind                                               -1 NULL
--   2010 180184 Patricia Bouton 1117255 LOSTYPE        0 NULL                 0 NULL                                                0 NULL
--   2011 180184 Patricia Bouton 1345584 LOSTYPE        0 NULL                 7 Other                                              -1 NULL
--   2012 180184 Patricia Bouton 3283879 LOSTYPE        0 NULL                 2 Wind                                               -1 NULL
--   2013 180184 Patricia Bouton 3339254 LOSTYPE        0 NULL                 7 Other                                              -1 NULL
--   2014 180184 Patricia Bouton 1333571 LOSTYPE        0 NULL                 7 Other                                              -1 NULL


MERGE INTO DATAUPDT.HDTLossDraft TT 
USING 
(
SELECT
--	count (*)
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PPx.LOSsTYPEDESC "NewTypeDesc",
	TT.LDLOSsTYPE, 
	TTx.LOSsTYPEDESC "CurTypeDesc"
	,
	case when ChangeNeeded = -1 then
		case UpdtDesc
		when 'LOSTYPE' then ' Type of loss updated from ' || cast(TT.LDLOSsTYPE as varchar(2)) || '<' || trim(TTx.LOSsTYPEDESC) || '> to 0<Blank>' 
		end 
	ELSE
		''
	end NewNotes

from DATAUPDT.HDTLossDraft PP 
left outer join celink.tblLossDraft TT 
on PP.Loan = TT.LDLoanNumber

left outer join celink.TBLLOSsTYPE TTx
on TT.LDLOSsTYPE = TTx.LOSsTYPECODE 

left outer join celink.TBLLOSsTYPE PPx
on PP.NewType = PPx.LOSsTYPECODE

where UpdtDesc = 'LOSTYPE' and changeneeded = -1
ORDER BY PP.SeqNum
)UY
on UY.Loan = TT.Loan
and UY.UpdtDesc = TT.UpdtDesc
WHEN MATCHED THEN UPDATE 
Set
TT.NewNotes = UY.NewNotes
;
/*
 SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWTYPE NewTypeDesc LDLOSSTYPE CurTypeDesc                              NEWNOTES
 ------ ------ --------------- ------- -------- ------- ----------- ---------- ---------------------------------------- -------------------------------------------------------
   2001 180184 Patricia Bouton 1265479 LOSTYPE        0 NULL                 3 Water/Flood                               Type of loss updated from 3<Water/Flood> to 0<Blank>
   2002 180184 Patricia Bouton 1330921 LOSTYPE        0 NULL                 2 Wind                                      Type of loss updated from 2<Wind> to 0<Blank>
   2003 180184 Patricia Bouton 3331214 LOSTYPE        0 NULL                 4 Water/Seepage                             Type of loss updated from 4<Water/Seepage> to 0<Blank>
   2004 180184 Patricia Bouton 3337248 LOSTYPE        0 NULL                 4 Water/Seepage                             Type of loss updated from 4<Water/Seepage> to 0<Blank>
   2005 180184 Patricia Bouton 3317468 LOSTYPE        0 NULL                 7 Other                                     Type of loss updated from 7<Other> to 0<Blank>
   2006 180184 Patricia Bouton 1200742 LOSTYPE        0 NULL                 7 Other                                     Type of loss updated from 7<Other> to 0<Blank>
   2007 180184 Patricia Bouton 1302872 LOSTYPE        0 NULL                 1 Fire                                      Type of loss updated from 1<Fire> to 0<Blank>
   2008 180184 Patricia Bouton 3294276 LOSTYPE        0 NULL                 4 Water/Seepage                             Type of loss updated from 4<Water/Seepage> to 0<Blank>
   2009 180184 Patricia Bouton 3307256 LOSTYPE        0 NULL                 2 Wind                                      Type of loss updated from 2<Wind> to 0<Blank>
   2011 180184 Patricia Bouton 1345584 LOSTYPE        0 NULL                 7 Other                                     Type of loss updated from 7<Other> to 0<Blank>
   2012 180184 Patricia Bouton 3283879 LOSTYPE        0 NULL                 2 Wind                                      Type of loss updated from 2<Wind> to 0<Blank>
   2013 180184 Patricia Bouton 3339254 LOSTYPE        0 NULL                 7 Other                                     Type of loss updated from 7<Other> to 0<Blank>
   2014 180184 Patricia Bouton 1333571 LOSTYPE        0 NULL                 7 Other                                     Type of loss updated from 7<Other> to 0<Blank>
*/
--		select * from DATAUPDT.HDTLossDraft where UpdtDesc = 'INSTYPE' and ChangeNeeded = -1 order by SeqNum; --126
--		select * from DATAUPDT.HDTLossDraft where UpdtDesc = 'LOSTYPE' and ChangeNeeded = -1 order by SeqNum; --107
		select * from DATAUPDT.HDTLossDraft where ChangeNeeded = -1 order by SeqNum;
		select * from DATAUPDT.HDTLossDraft where ChangeNeeded = -1 order by UPDTDESC,SeqNum;
		/*
		 SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWDATE NEWTYPE NEWTEXT CHANGENEEDED NEWNOTES
		 ------ ------ --------------- ------- -------- ------- ------- ------- ------------ -------------------------------------------------------
		   1001 189130 Patricia Bouton 1265479 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 2<Flood> to 0<Blank>
		   1002 189130 Patricia Bouton 1330921 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1003 189130 Patricia Bouton 3331214 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1004 189130 Patricia Bouton 3337248 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1005 189130 Patricia Bouton 3317468 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1006 189130 Patricia Bouton 1200742 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1007 189130 Patricia Bouton 1302872 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1008 189130 Patricia Bouton 3294276 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1009 189130 Patricia Bouton 3307256 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1010 189130 Patricia Bouton 1117255 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1011 189130 Patricia Bouton 1345584 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1012 189130 Patricia Bouton 3283879 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1013 189130 Patricia Bouton 3339254 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   1014 189130 Patricia Bouton 1333571 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
		   2001 180184 Patricia Bouton 1265479 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 3<Water/Flood> to 0<Blank>
		   2002 180184 Patricia Bouton 1330921 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 2<Wind> to 0<Blank>
		   2003 180184 Patricia Bouton 3331214 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
		   2004 180184 Patricia Bouton 3337248 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
		   2005 180184 Patricia Bouton 3317468 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
		   2006 180184 Patricia Bouton 1200742 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
		   2007 180184 Patricia Bouton 1302872 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 1<Fire> to 0<Blank>
		   2008 180184 Patricia Bouton 3294276 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
		   2009 180184 Patricia Bouton 3307256 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 2<Wind> to 0<Blank>
		   2010 already shows blank	
		   2011 180184 Patricia Bouton 1345584 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
		   2012 180184 Patricia Bouton 3283879 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 2<Wind> to 0<Blank>
		   2013 180184 Patricia Bouton 3339254 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
		   2014 180184 Patricia Bouton 1333571 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
		*/

-----------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- mergeeeeeee

MERGE INTO celink.tblLossDraft TT
USING
(
SELECT
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PP.ChangeNeeded --case when TT.LDINSURANCETYPE = PP.NewType then 0 else -1 end as ChangeNeeded
from DATAUPDT.HDTLossDraft PP 
where UPDTDESC = 'INSTYPE' and CHANGENEEDED = -1
ORDER BY PP.SeqNum
	
) UY (SeqNum,	HDTNum,	Requester, Loan, UpdtDesc, NewType, ChangeNeeded)
ON UY.Loan = TT.LDLoanNumber
WHEN MATCHED THEN UPDATE 
Set
TT.LDINSURANCETYPE = UY.NewType
;


MERGE INTO celink.tblLossDraft TT
USING
(
SELECT
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PP.ChangeNeeded --case when TT.LDINSURANCETYPE = PP.NewType then 0 else -1 end as ChangeNeeded
from DATAUPDT.HDTLossDraft PP 
where UPDTDESC = 'LOSTYPE' and CHANGENEEDED = -1
ORDER BY PP.SeqNum
	
) UY (SeqNum,	HDTNum,	Requester, Loan, UpdtDesc, NewType, ChangeNeeded)
ON UY.Loan = TT.LDLoanNumber
WHEN MATCHED THEN UPDATE 
Set
TT.LDLOSsTYPE = UY.NewType
;



-----------------------------------------------------------------------------------------------------
-- validation ,,, INSTYPE
SELECT
--	count (*)
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PPx.INSTYPEDESC "NewTypeDesc",
	TT.LDINSURANCETYPE, 
	TTx.INSTYPEDESC "CurTypeDesc"
	, changeneeded
	, PP.NewNotes
--	'-->--', TT.*

from DATAUPDT.HDTLossDraft PP 
left outer join celink.tblLossDraft TT 
on PP.Loan = TT.LDLoanNumber

left outer join celink.TBLInsuranceType TTx
on TT.LDINSURANCETYPE = TTx.INSTYPECODE 

left outer join celink.TBLInsuranceType PPx
on PP.NewType = PPx.INSTYPECODE

where UpdtDesc = 'INSTYPE' --and changeneeded = -1
ORDER BY PP.SeqNum
with ur;

-----------------------------------------------------------------------------------------------------
-- validation ,,, LOSTYPEe
SELECT
--	count (*)
	PP.SeqNum, 
	PP.HDTNum,	
	PP.Requester,
	PP.Loan, 
	PP.UpdtDesc,
	PP.NewType,
	PPx.LOSsTYPEDESC "NewTypeDesc",
	TT.LDLOSsTYPE, 
	TTx.LOSsTYPEDESC "CurTypeDesc"
	, changeneeded
	, NewNotes

--	'-->--', TT.*

from DATAUPDT.HDTLossDraft PP 
left outer join celink.tblLossDraft TT 
on PP.Loan = TT.LDLoanNumber

left outer join celink.TBLLOSsTYPE TTx
on TT.LDLOSsTYPE = TTx.LOSsTYPECODE 

left outer join celink.TBLLOSsTYPE PPx
on PP.NewType = PPx.LOSsTYPECODE

where UpdtDesc = 'LOSTYPE' --and changeneeded = -1
ORDER BY PP.SeqNum
with ur;

/*
 SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWTYPE NewTypeDesc LDINSURANCETYPE CurTypeDesc CHANGENEEDED NEWNOTES
 ------ ------ --------------- ------- -------- ------- ----------- --------------- ----------- ------------ --------------------------------------------------
   1001 189130 Patricia Bouton 1265479 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 2<Flood> to 0<Blank>
   1002 189130 Patricia Bouton 1330921 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1003 189130 Patricia Bouton 3331214 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1004 189130 Patricia Bouton 3337248 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1005 189130 Patricia Bouton 3317468 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1006 189130 Patricia Bouton 1200742 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1007 189130 Patricia Bouton 1302872 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1008 189130 Patricia Bouton 3294276 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1009 189130 Patricia Bouton 3307256 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1010 189130 Patricia Bouton 1117255 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1011 189130 Patricia Bouton 1345584 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1012 189130 Patricia Bouton 3283879 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1013 189130 Patricia Bouton 3339254 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>
   1014 189130 Patricia Bouton 1333571 INSTYPE        0 NULL                      0 NULL                  -1  Insurance type updated from 1<Hazard> to 0<Blank>

 SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWTYPE NewTypeDesc LDLOSSTYPE CurTypeDesc CHANGENEEDED NEWNOTES
 ------ ------ --------------- ------- -------- ------- ----------- ---------- ----------- ------------ -------------------------------------------------------
   2001 180184 Patricia Bouton 1265479 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 3<Water/Flood> to 0<Blank>
   2002 180184 Patricia Bouton 1330921 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 2<Wind> to 0<Blank>
   2003 180184 Patricia Bouton 3331214 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
   2004 180184 Patricia Bouton 3337248 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
   2005 180184 Patricia Bouton 3317468 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 7<Other> to 0<Blank>
   2006 180184 Patricia Bouton 1200742 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 7<Other> to 0<Blank>
   2007 180184 Patricia Bouton 1302872 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 1<Fire> to 0<Blank>
   2008 180184 Patricia Bouton 3294276 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
   2009 180184 Patricia Bouton 3307256 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 2<Wind> to 0<Blank>
   2010 180184 Patricia Bouton 1117255 LOSTYPE        0 NULL                 0 NULL                   0 NULL
   2011 180184 Patricia Bouton 1345584 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 7<Other> to 0<Blank>
   2012 180184 Patricia Bouton 3283879 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 2<Wind> to 0<Blank>
   2013 180184 Patricia Bouton 3339254 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 7<Other> to 0<Blank>
   2014 180184 Patricia Bouton 1333571 LOSTYPE        0 NULL                 0 NULL                  -1  Type of loss updated from 7<Other> to 0<Blank>


*/
-- ------ ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------ ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Create Notes string ... Pivot
select * from DATAUPDT.HDTLossDraft where Changeneeded = -1 order by SeqNum;
-- SEQNUM HDTNUM REQUESTER       LOAN    UPDTDESC NEWDATE NEWTYPE NEWTEXT CHANGENEEDED NEWNOTES
-- ------ ------ --------------- ------- -------- ------- ------- ------- ------------ -------------------------------------------------------
--   1001 189130 Patricia Bouton 1265479 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 2<Flood> to 0<Blank>
--   1002 189130 Patricia Bouton 1330921 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1003 189130 Patricia Bouton 3331214 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1004 189130 Patricia Bouton 3337248 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1005 189130 Patricia Bouton 3317468 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1006 189130 Patricia Bouton 1200742 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1007 189130 Patricia Bouton 1302872 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1008 189130 Patricia Bouton 3294276 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1009 189130 Patricia Bouton 3307256 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1010 189130 Patricia Bouton 1117255 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1011 189130 Patricia Bouton 1345584 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1012 189130 Patricia Bouton 3283879 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1013 189130 Patricia Bouton 3339254 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   1014 189130 Patricia Bouton 1333571 INSTYPE  NULL          0 NULL              -1  Insurance type updated from 1<Hazard> to 0<Blank>
--   2001 180184 Patricia Bouton 1265479 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 3<Water/Flood> to 0<Blank>
--   2002 180184 Patricia Bouton 1330921 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 2<Wind> to 0<Blank>
--   2003 180184 Patricia Bouton 3331214 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
--   2004 180184 Patricia Bouton 3337248 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
--   2005 180184 Patricia Bouton 3317468 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
--   2006 180184 Patricia Bouton 1200742 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
--   2007 180184 Patricia Bouton 1302872 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 1<Fire> to 0<Blank>
--   2008 180184 Patricia Bouton 3294276 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 4<Water/Seepage> to 0<Blank>
--   2009 180184 Patricia Bouton 3307256 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 2<Wind> to 0<Blank>
--   2011 180184 Patricia Bouton 1345584 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
--   2012 180184 Patricia Bouton 3283879 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 2<Wind> to 0<Blank>
--   2013 180184 Patricia Bouton 3339254 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>
--   2014 180184 Patricia Bouton 1333571 LOSTYPE  NULL          0 NULL              -1  Type of loss updated from 7<Other> to 0<Blank>

declare global TEMPORARY TABLE SESSION.MyPivot
(
	SeqNum integer,
	Loan   integer, 
	UpdtCol1 varchar(150)  default '',  
	UpdtCol2 varchar(150)  default '', 
	UpdtColString varchar(800) default ''
	
)
ON COMMIT PRESERVE ROWS;


INSERT INTO session.MyPivot (SeqNum, Loan, UpdtColString, UpdtCol1, UpdtCol2)   

WITH Loans (SeqNum, Loan) as (SELECT DISTINCT SeqNum, Loan FROM DATAUPDT.HDTLossDraft where Changeneeded = -1) -- construct list of loans
SELECT 
	Loans.SeqNum,
	Loans.Loan
	, 
	case when x1.UpdtDesc is null then '' else '. ' || trim(x1.NewNotes) end 
	||
	case when x2.UpdtDesc is null then '' else '. ' || trim(x2.NewNotes) end 
	-- || ' removed' as UpdtColString
	,
	x1.NewNotes,
	x2.NewNotes
	
	
FROM Loans


left JOIN DATAUPDT.HDTLossDraft x1
ON   x1.Loan = Loans.Loan
AND  upper(x1.UpdtDesc) = 'INSTYPE'
and  x1.ChangeNeeded = -1

left JOIN DATAUPDT.HDTLossDraft x2
ON   x2.Loan = Loans.Loan
AND  upper(x2.UpdtDesc) = 'LOSTYPE'
and  x2.ChangeNeeded = -1

order by Loans.SeqNum
;

select * from session.MyPivot order by SeqNum;

-- SEQNUM LOAN    UPDTCOL1                                           UPDTCOL2                               UPDTCOLSTRING
-- ------ ------- -------------------------------------------------- -------------------------------------- ------------------------------------------------------------------------------------------
--      1 1236173 NULL                                                Type of loss from 2<Wind> to 0<Blank> . Type of loss from 2<Wind> to 0<Blank>
--      2 1243618 NULL                                                Type of loss from 2<Wind> to 0<Blank> . Type of loss from 2<Wind> to 0<Blank>
--      3 1299309  Insurance type updated from 1<Hazard> to 0<Blank>  Type of loss from 1<Fire> to 0<Blank> . Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss from 1<Fire> to 0<Blank>
--      4 1299309  Insurance type updated from 1<Hazard> to 0<Blank>  Type of loss from 1<Fire> to 0<Blank> . Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss from 1<Fire> to 0<Blank>
--      5 1304130  Insurance type updated from 1<Hazard> to 0<Blank> NULL                                   . Insurance type updated from 1<Hazard> to 0<Blank>

-- ------ ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Notes for direct insert
Select 
	P.Loan as "Loan Number",
	'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') Loss Daft :' || right(P.UpdtColString, length(P.UpdtColString) - 1)  || '.' as "Loan Note" 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
	from session.MyPivot P
	inner join 
	(
	SELECT 
		ROW_NUMBER() OVER (partition by loan order by SeqNum) AS RowNum, 
		SeqNum, HDTNum, Requester, Loan
		FROM DATAUPDT.HDTLossDraft
	) UY
	on  P.loan = UY.Loan  
	and P.SeqNum = UY.SeqNum
	and UY.RowNum = 1	
	where  (P.UpdtCol1 is not null) or (P.UpdtCol2 is not null) 
Order by UY.SeqNum
; 

/*

 Loan Number Loan Note                                                                                                                                               3                          4     5 6
 ----------- ------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------- ----- - -
     1265479 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 2<Flood> to 0<Blank>. Type of loss updated from 3<Water/Flood> to 0<Blank>.    2025-05-06 14:32:15.385115 tkato 0 0
     1330921 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 2<Wind> to 0<Blank>.          2025-05-06 14:32:15.385115 tkato 0 0
     3331214 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 4<Water/Seepage> to 0<Blank>. 2025-05-06 14:32:15.385115 tkato 0 0
     3337248 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 4<Water/Seepage> to 0<Blank>. 2025-05-06 14:32:15.385115 tkato 0 0
     3317468 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         2025-05-06 14:32:15.385115 tkato 0 0
     1200742 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         2025-05-06 14:32:15.385115 tkato 0 0
     1302872 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 1<Fire> to 0<Blank>.          2025-05-06 14:32:15.385115 tkato 0 0
     3294276 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 4<Water/Seepage> to 0<Blank>. 2025-05-06 14:32:15.385115 tkato 0 0
     3307256 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 2<Wind> to 0<Blank>.          2025-05-06 14:32:15.385115 tkato 0 0
     1117255 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>.                                                         2025-05-06 14:32:15.385115 tkato 0 0
     1345584 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         2025-05-06 14:32:15.385115 tkato 0 0
     3283879 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 2<Wind> to 0<Blank>.          2025-05-06 14:32:15.385115 tkato 0 0
     3339254 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         2025-05-06 14:32:15.385115 tkato 0 0
     1333571 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         2025-05-06 14:32:15.385115 tkato 0 0

*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Notes update
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

Select 
	P.Loan as "Loan Number",
	'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') Loss Daft :' || right(P.UpdtColString, length(P.UpdtColString) - 1)  || '.' as "Loan Note" 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
	from session.MyPivot P
	inner join 
	(
	SELECT 
		ROW_NUMBER() OVER (partition by loan order by SeqNum) AS RowNum, 
		SeqNum, HDTNum, Requester, Loan
		FROM DATAUPDT.HDTLossDraft
	) UY
	on  P.loan = UY.Loan  
	and P.SeqNum = UY.SeqNum
	and UY.RowNum = 1	
	where  (P.UpdtCol1 is not null) or (P.UpdtCol2 is not null) 
Order by UY.SeqNum
; 

------------------
-- Notes validation
select 
--	count(*) as "MyCount"
--	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
from --DATAUPDT.HDTDnPData_Gabe UY 
(
	SELECT distinct HDTNum, Loan FROM DATAUPDT.HDTLossDraft
) UY		
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || UY.HDTNum ||'%'
with ur;

/*
 DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                            CHRUSERID BLNPRIORITY NOTESTEP
 -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------- --------- ----------- --------
 2025-05-06 14:33:00.002522    200845676                1265479.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 2<Flood> to 0<Blank>. Type of loss updated from 3<Water/Flood> to 0<Blank>.    tkato               0        0
 2025-05-06 14:33:00.002522    200845677                1330921.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 2<Wind> to 0<Blank>.          tkato               0        0
 2025-05-06 14:33:00.002522    200845678                3331214.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 4<Water/Seepage> to 0<Blank>. tkato               0        0
 2025-05-06 14:33:00.002522    200845679                3337248.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 4<Water/Seepage> to 0<Blank>. tkato               0        0
 2025-05-06 14:33:00.002522    200845680                3317468.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         tkato               0        0
 2025-05-06 14:33:00.002522    200845681                1200742.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         tkato               0        0
 2025-05-06 14:33:00.002522    200845682                1302872.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 1<Fire> to 0<Blank>.          tkato               0        0
 2025-05-06 14:33:00.002522    200845683                3294276.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 4<Water/Seepage> to 0<Blank>. tkato               0        0
 2025-05-06 14:33:00.002522    200845684                3307256.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 2<Wind> to 0<Blank>.          tkato               0        0
 2025-05-06 14:33:00.002522    200845685                1117255.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>.                                                         tkato               0        0
 2025-05-06 14:33:00.002522    200845686                1345584.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         tkato               0        0
 2025-05-06 14:33:00.002522    200845687                3283879.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 2<Wind> to 0<Blank>.          tkato               0        0
 2025-05-06 14:33:00.002522    200845688                3339254.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         tkato               0        0
 2025-05-06 14:33:00.002522    200845689                1333571.0 Per HDT 189130 (Patricia Bouton) Loss Daft : Insurance type updated from 1<Hazard> to 0<Blank>. Type of loss updated from 7<Other> to 0<Blank>.         tkato               0        0

1 loan updated.  Peer review pending.
14 loans updated.  Peer review pending.
*/