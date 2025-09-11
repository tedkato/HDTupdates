
/*
20231205 ,,, This is intending to be a template for radio button using a new DATAUpdt table created to intend to comply to a variable radio buttons 
*/

/* combined ticket SS
--format
1		="(" & D2 & ", " & B2 & ", '" & C2 &"', " & A21 & ", 0),"

--source
Loan	HDT	Requester	
1292997	160568	Celeste Cantwell	1
3259783	160536	Faith Welch	2
3329731	160536	Faith Welch	3
1183653	160508	Laxmikant Chilveri	4


(1001, 161345, 'Faith Welch', 1402161, 0),
(1002, 161345, 'Faith Welch', 3179862, 0),
(1003, 161345, 'Faith Welch', 3204971, 0),
(1004, 161345, 'Faith Welch', 3287942, 0),
(2001, 161408, 'Celeste Cantwell', 1294124, 0),
(2002, 161408, 'Celeste Cantwell', 1294439, 0),
(2003, 161408, 'Celeste Cantwell', 1251577, 0),
(2004, 161408, 'Celeste Cantwell', 1361341, 0),
(2005, 161408, 'Celeste Cantwell', 3154704, 0),
(2006, 161408, 'Celeste Cantwell', 1251967, 0),
(2007, 161408, 'Celeste Cantwell', 3265806, 0)
*/

------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
/*
--*-- 	Ticket started including Radio cahnge request on loans that need Deplete.
		So this script doe radio in the normal way but not include Note postnig.
		Notes posting will be done in Deplete side including verbiage for both change.
		  
20250820
197513	Ted Kato	TISA Deplete & Radio	Celeste Cantwell		Low	8/20/2025 15:41
197514	Ted Kato	TISA Radio	Celeste Cantwell		Low	8/20/2025 15:42
197513 197514

-- -1 for both Radio & Deplete ... suppress notes

1	="(" & B1+1000 & ", 197513, 'Celeste Cantwell', " & A1 & ", -1)," 
1	="(" & B1+2000 & ", 197514, 'Celeste Cantwell', " & A1 & ", 0),"

(1001, 197513, 'Celeste Cantwell', 3286900, -1),
(1002, 197513, 'Celeste Cantwell', 1262820, -1),
(1003, 197513, 'Celeste Cantwell', 3120191, -1),
(1004, 197513, 'Celeste Cantwell', 3120251, -1),

(2001, 197514, 'Celeste Cantwell', 3121219, 0),
(2002, 197514, 'Celeste Cantwell', 3107793, 0),
(2003, 197514, 'Celeste Cantwell', 3297492, 0),
(2004, 197514, 'Celeste Cantwell', 3327442, 0),
(2005, 197514, 'Celeste Cantwell', 1395838, 0),
(2006, 197514, 'Celeste Cantwell', 3231862, 0),
(2007, 197514, 'Celeste Cantwell', 3267081, 0),
(2008, 197514, 'Celeste Cantwell', 3286695, 0)
*/
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250909

199014	Ted Kato	TISA Deplete & Radio	Celeste Cantwell		Low	9/9/2025 11:40
199002	Ted Kato	TISA Radio	Pankaj Doiphode		Low	9/9/2025 10:55
199014 199002

1	="(" & B1+1000 & ", 199014, 'Celeste Cantwell', " & A1 & ", 0),"
1	="(" & B1+2000 & ", 199002, 'Pankaj Doiphode', " & A1 & ", 0),"

(1001, 199014, 'Celeste Cantwell', 1383710, 0),
(1002, 199014, 'Celeste Cantwell', 3226303, 0),
(1003, 199014, 'Celeste Cantwell', 3230213, 0),
(1004, 199014, 'Celeste Cantwell', 3289446, 0),
(1005, 199014, 'Celeste Cantwell', 3289314, 0),
(1006, 199014, 'Celeste Cantwell', 3290979, 0),
(1007, 199014, 'Celeste Cantwell', 1318862, 0),
(1008, 199014, 'Celeste Cantwell', 3171514, 0),

(2001, 199002, 'Pankaj Doiphode', 1268279, 0)

*/


-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------
/* -- DATAUpdt table  
create table DATAUPDT.HDTTISARadio   
	(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,
	Loan integer,
	CurTax   integer,
	CurIns   integer,
	CurTnI   integer,
	CurDsc   varchar(50),
	NewRad   integer,		--(1=Tax, 2=Ins, 3=Tax&Ins, 0=None)
	NewTax   integer,
	NewIns   integer,
	NewTnI   integer,
	NewDsc   varchar(50),

	ChangeRequired integer   -- might not be used
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTTISARadio  TO group db2_ast;
	
	-- drop table DATAUPDT.HDTTISARadio;
	 select * from DATAUPDT.HDTTISARadio;

 SEQNUM HDTNUM REQUESTER LOAN CURTAX CURINS CURTNI CURDSC NEWRAD NEWTAX NEWINS NEWTNI NEWDSC CHANGEREQUIRED
 ------ ------ --------- ---- ------ ------ ------ ------ ------ ------ ------ ------ ------ --------------
	 
*/

select * from  CELINK.TBLTAXANDINSDATA X  where X.TIDATALOANNUMBER = 3932718;

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table 2 ... my table
-- delete always to refresh for other data points needs to be added in the table for the loans no matter they have TISA to Zero changes previously  --  

DELETE from DATAUPDT.HDTTISARadio;
-- -- --update 	DATAUPDT.HDTTISARadio set Requester = 'Celeste Cantwell';
-- source	
insert into DATAUPDT.HDTTISARadio
	(
	SeqNum,
	HDTNum, 
	Requester,
	Loan,
	CurTax,
	CurIns,
	CurTnI,
	CurDsc,

	NewRad,
	NewTax,
	NewIns,
	NewTnI,
	NewDsc,

	ChangeRequired
	)	

with param (SeqNum, HDTNum, Requester, loan, New) as
(values  -- -- the TISA values NA here
(1001, 199014, 'Celeste Cantwell', 1383710, 0),
(1002, 199014, 'Celeste Cantwell', 3226303, 0),
(1003, 199014, 'Celeste Cantwell', 3230213, 0),
(1004, 199014, 'Celeste Cantwell', 3289446, 0),
(1005, 199014, 'Celeste Cantwell', 3289314, 0),
(1006, 199014, 'Celeste Cantwell', 3290979, 0),
(1007, 199014, 'Celeste Cantwell', 1318862, 0),
(1008, 199014, 'Celeste Cantwell', 3171514, 0),
(2001, 199002, 'Pankaj Doiphode', 1268279, 0)
)
select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan,   --	X.TIDATALOANNUMBER,
	X.SETASIDETAXES , X.SETASIDEINSURANCE , X.SETASIDETAXANDINS ,  -- current values
	case when X.SETASIDETAXES = -1 then 'Taxes' 
	else case when X.SETASIDEINSURANCE = -1 then 'Insurance'
		 else case when X.SETASIDETAXANDINS = -1 then 'TaxesAndInsurance' end
	end
	end CurDsc,		  
	
	P.New, 

	case P.New --(1=Tax, 2=Ins, 3=Tax&Ins, 0=None)
	when 1 then -1 --"X_SETASIDETAXES" --, 0 as X_SETASIDEINSURANCE, 0 as X_SETASIDETAXANDINS ,  -- new values when request = 1
	when 2 then 0 --as X_SETASIDETAXES --, -1 as X_SETASIDEINSURANCE, 0 as X_SETASIDETAXANDINS ,  -- new values when request = 1
	when 3 then 0 --as X_SETASIDETAXES --, 0 as X_SETASIDEINSURANCE, -1 as X_SETASIDETAXANDINS ,  -- new values when request = 1
	when 0 then 0 --as X_SETASIDETAXES --, 0 as X_SETASIDEINSURANCE, 0 as X_SETASIDETAXANDINS ,  -- new values when request = 1
	end as NewTax
	,
	case P.New   --(1=Tax, 2=Ins, 3=Tax&Ins, 0=None)
	when 1 then  0  
	when 2 then  -1 
	when 3 then  0 
	when 0 then  0 
	end as NewIns
	,
	case P.New  --(1=Tax, 2=Ins, 3=Tax&Ins, 0=None)
	when 1 then  0  
	when 2 then  0 
	when 3 then  -1 
	when 0 then  0 
	end as NewTnI
	,
	case P.New
	when 1 then 'Taxes' 
	when 2 then 'Insurance'
	when 3 then 'TaxesAndInsurance'
	when 0 then 'None'
	end NewDsc
	,
	0 as "CHANGEREQUIRED" -- not used 	

from  Param P
inner join CELINK.TBLTAXANDINSDATA X  
on    P.Loan = X.TIDATALOANNUMBER
order by P.SeqNum
;

-----------------------------------
select * from DATAUPDT.HDTTISARadio order by SeqNum; -- CHANGEREQUIRED column is NA at this time
-- SEQNUM HDTNUM REQUESTER        LOAN    CURTAX CURINS CURTNI CURDSC            NEWRAD NEWTAX NEWINS NEWTNI NEWDSC CHANGEREQUIRED
-- ------ ------ ---------------- ------- ------ ------ ------ ----------------- ------ ------ ------ ------ ------ --------------
--   1001 199014 Celeste Cantwell 1383710      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   1002 199014 Celeste Cantwell 3226303      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   1003 199014 Celeste Cantwell 3230213      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   1004 199014 Celeste Cantwell 3289446      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   1005 199014 Celeste Cantwell 3289314      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   1006 199014 Celeste Cantwell 3290979      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   1007 199014 Celeste Cantwell 1318862      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   1008 199014 Celeste Cantwell 3171514      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--   2001 199002 Pankaj Doiphode  1268279      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0

/*
select * from DATAUPDT.HDTTISARadio where order by SeqNum; -- CHANGEREQUIRED column is NA at this time
			--20250328
			-- SEQNUM HDTNUM REQUESTER      LOAN    CURTAX CURINS CURTNI CURDSC            NEWRAD NEWTAX NEWINS NEWTNI NEWDSC CHANGEREQUIRED
			-- ------ ------ -------------- ------- ------ ------ ------ ----------------- ------ ------ ------ ------ ------ --------------
			--      1 185581 Nikita Vanjeri 3322413      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
			
			select 
				X.TIDATALOANNUMBER,
				X.SETASIDETAXES, 
				X.SETASIDEINSURANCE, 
				X.SETASIDETAXANDINS, 
				'-->', X.* 
			from CELINK.TBLTAXANDINSDATA X  
			where X.TIDATALOANNUMBER = 3372351
			for read only with ur;
			
			-- **** the history of the transaction ... 
			SELECT 
				TIDATALOANNUMBER,
				SETASIDETAXES, 
				SETASIDEINSURANCE, 
				SETASIDETAXANDINS, 
				SYS_START, SYS_END, USER_ID_COL, CHANGE_REC
				FROM CELINK.TBLTAXANDINSDATA
				for system_time from '2015-01-01-00.00.00.000000' to '9999-12-30-00.00.00.000000'
				where TIDATALOANNUMBER = 3322413  
				order by SYS_END desc
			for read only with UR;
*/

select HDTNUM "HDT #", count(*) "Loan Count"  from DATAUPDT.HDTTISARadio group by HDTNUM; 
select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count"  from DATAUPDT.HDTTISARadio group by HDTNUM, Requester; 
select Loan, count(Loan) from DATAUPDT.HDTTISARadio group by Loan having count(Loan) > 1; 

/*
 LOAN 2
 ---- -

 HDT #  Requester        Loan Count
 ------ ---------------- ----------
 199002 Pankaj Doiphode           1
 199014 Celeste Cantwell          8

--sample closure posts
Set Asides radio button updated for 1 loan.  Peer review pending.
Set Asides radio button updated for 3 loans.  Peer review pending.
Set Asides radio button updated for 4 loans.  Peer review pending.
Set Asides radio button updated for 5 loans.  Peer review pending.
Set Asides radio button updated for 20 loans. 1 loan(3337627) alread had the radio set to none.  Peer review pending.

Set Asides radio button updated for 9 loans. Below 3 loans alread had the radio set to none.  Peer review pending.
        3318295.0
        3292937.0
        3349680.0

*CHANGEREQUIRED is N/A at this time.
 SEQNUM HDTNUM REQUESTER        LOAN    CURTAX CURINS CURTNI CURDSC            NEWRAD NEWTAX NEWINS NEWTNI NEWDSC CHANGEREQUIRED
 ------ ------ ---------------- ------- ------ ------ ------ ----------------- ------ ------ ------ ------ ------ --------------

*/

select 
	T.SeqNum, T.Loan, DUP.Cnt 
from DATAUPDT.HDTTISARadio T
inner join 
(
select Loan, count(Loan) as Cnt from DATAUPDT.HDTTISARadio group by Loan having count(Loan) > 1 
) DUP
on DUP.loan = T.Loan
order by T.SeqNum
;
-- SEQNUM LOAN CNT
-- ------ ---- ---

	
-- ------ ------ ------------ ------- -------- ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------
-- TBLTAXANDINSDATA  
-- Bulk check
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.ChangeRequired, 
	CurTax,
	CurIns,
	CurTnI,
	CurDsc,

	NewRad,
	NewTax,
	NewIns,
	NewTnI,
	NewDsc,
		
	X.TIDATALOANNUMBER,
	X.SETASIDETAXES, 
	X.SETASIDEINSURANCE, 
	X.SETASIDETAXANDINS, 
	'-->', X.* 
from DATAUPDT.HDTTISARadio P
inner join CELINK.TBLTAXANDINSDATA X  
on P.Loan = X.TIDATALOANNUMBER
order by P.SeqNum
for read only with ur;

/*
 SEQNUM HDTNUM REQUESTER        LOAN    CHANGEREQUIRED CURTAX CURINS CURTNI CURDSC            NEWRAD NEWTAX NEWINS NEWTNI NEWDSC TIDATALOANNUMBER SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS 19  TIDATALOANNUMBER TIDATATAXOFFICE                TIDATAWINTERTAXDATE TIDATASUMMERTAXDATE TIDATATYPE                     TIDATAWINTERTAXAMOUNT TIDATADATEWINTERPAID TIDATASUMMERTAXAMOUNT TIDATADATESUMMERPAID TIDATAPROPERTYID               TIDATAHAZARDCARRIER            TIDATAHAZARDEXPIREDATE TIDATAHAZARDPOLICYNUMBER       TIDATAFLOODCARRIER             TIDATAFLOODEXPIREDATE TIDATAFLOODPOLICYNUMBER        TIDATAWINDCARRIER              TIDATAWINDEXPIREDATE TIDATAWINDPOLICYNUMBER         TIDATAFORCEDPLACEDAMOUNT TIDATAFORCEDPLACEDEXPIREDATE TIDATANOTES REQUIREDINSCOVERAGE HAZARDINSCOVERAGEAMT HAZARDINSFORCEDPLACED FLOODINSCOVERAGEAMT FLOODINSFORCEDPLACED WINDINSCOVERAGEAMT WINDINSFORCEDPLACED HOANAME                                                                                              HOAPHONE HOACONTACTNAME                                                                                       HOAMONTHLYPAYMENTAMT HOALASTPAYMENTMADEDATE HOANEXTPAYMENTDUEDATE HOAADDRESS SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS TISAMANDATORY TISAFUNDED TISASHORTFALL SUSPENDSEMIANNUALDISBURSE ANNUALTIANALYSISCOMPDATE EXPECTEDFRSTYRTIDISBURSEAMT INSTRCKTERMDATE REACTIVATIONFLAG REACTIVATIONDATE TAXTRCKTERMDATE TAXREACTIVATIONFLAG TAXREACTIVATIONDATE TAXDEFERRALIND TISAPCTTHRESHOLD LOCPCTTHRESHOLD TIDANNUALPROPTAX TIDANNUALPROPINSPREMIUM PROJECTANNUALPROPERTYCHG TIDLASTPAYTAXDATE TIDLASTPAYINSDATE TISAFULLDISBURSEDATE SETASIDEHHF SETASIDEHHFSTATE
 ------ ------ ---------------- ------- -------------- ------ ------ ------ ----------------- ------ ------ ------ ------ ------ ---------------- ------------- ----------------- ----------------- --- ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- -------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ---------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
   1001 199014 Celeste Cantwell 1383710              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          1383710.0             0                 0                -1 -->        1383710.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2024-09-06                               2318.760000 NULL                        NULL NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL
   1002 199014 Celeste Cantwell 3226303              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          3226303.0             0                 0                -1 -->        3226303.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2024-09-08                               4155.860000 NULL                           0 NULL             NULL                              0 NULL                             3              0.0             0.0             NULL                    NULL                 0.000000 NULL              NULL              NULL                           0 NULL
   1003 199014 Celeste Cantwell 3230213              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          3230213.0             0                 0                -1 -->        3230213.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            58         61      0.000000                         0 2024-09-08                               3569.860000 NULL                           0 NULL             NULL                              0 NULL                             3              0.0             0.0             NULL                    NULL                 0.000000 NULL              NULL              NULL                           0 NULL
   1004 199014 Celeste Cantwell 3289446              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          3289446.0             0                 0                -1 -->        3289446.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2024-09-06                               1003.760000 NULL                           0 NULL             NULL                              0 NULL                             3              0.0             0.0             NULL                    NULL                 0.000000 NULL              NULL              NULL                           0 NULL
   1005 199014 Celeste Cantwell 3289314              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          3289314.0             0                 0                -1 -->        3289314.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            58         61      0.000000                         0 2024-09-08                               2077.800000 NULL                           0 NULL             NULL                              0 NULL                             3              0.0             0.0             NULL                    NULL                 0.000000 NULL              NULL              NULL                           0 NULL
   1006 199014 Celeste Cantwell 3290979              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          3290979.0             0                 0                -1 -->        3290979.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2024-09-08                               4860.120000 NULL                           0 NULL             NULL                              0 NULL                             3              0.0             0.0             NULL                    NULL                 0.000000 NULL              NULL              NULL                           0 NULL
   1007 199014 Celeste Cantwell 1318862              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          1318862.0             0                 0                -1 -->        1318862.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2024-09-09                               4097.360000 NULL                        NULL NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL
   1008 199014 Celeste Cantwell 3171514              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          3171514.0             0                 0                -1 -->        3171514.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2024-09-09                               5616.770000 NULL                           0 NULL             NULL                              0 NULL                             3              0.0             0.0             NULL                    NULL                 0.000000 NULL              NULL              NULL                           0 NULL
   2001 199002 Pankaj Doiphode  1268279              0      0      0     -1 TaxesAndInsurance      0      0      0      0 None          1268279.0             0                 0                -1 -->        1268279.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                      0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2024-10-12                               1109.720000 NULL                        NULL NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL

--Pull loans already "None"
select 
--	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.ChangeRequired, 
--	CurTax,
--	CurIns,
--	CurTnI,
--	CurDsc,
--	NewRad,
--	NewTax,
--	NewIns,
--	NewTnI,
--	NewDsc,
	X.TIDATALOANNUMBER
--	,
--	X.SETASIDETAXES, 
--	X.SETASIDEINSURANCE, 
--	X.SETASIDETAXANDINS, 
--	'-->', X.* 
from DATAUPDT.HDTTISARadio P
inner join CELINK.TBLTAXANDINSDATA X  
on P.Loan = X.TIDATALOANNUMBER
where COALESCE(cast(P.CURDSC as varchar(50)), 'None') = 'None'  	
order by P.SeqNum
for read only with ur;

 TIDATALOANNUMBER
 ----------------
        3372351.0
*/



-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
-- ** Notes value creation
select * from DATAUPDT.HDTTISARadio order by SeqNum; -- CHANGEREQUIRED column is NA at this time
-- SEQNUM HDTNUM REQUESTER        LOAN    CURTAX CURINS CURTNI CURDSC            NEWRAD NEWTAX NEWINS NEWTNI NEWDSC CHANGEREQUIRED
-- ------ ------ ---------------- ------- ------ ------ ------ ----------------- ------ ------ ------ ------ ------ --------------
--   1001 197513 Celeste Cantwell 3286900      0      0     -1 TaxesAndInsurance      0      0      0      0 None                0
--    'Per HDT ' || P.HDTNum || ' T&I Data Set Asides radio button updated from ' || COALESCE(cast(P.CURDSC as varchar(50)), '<blank>') || ' to ' || P.NewDSC || '.'

select 
--SeqNum,	
'(' || 
Loan || ', ' ||
'''Per HDT ' || P.HDTNum || ' ' || 'T&I Data Set Asides radio button updated from ' || COALESCE(cast(P.CURDSC as varchar(50)), '<blank>') || ' to ' || P.NewDSC || '.'
|| '''' || ', ' 
|| 'CURRENT_TIMESTAMP, '
|| '''tkato'', 0, 0), '
as "Note Insert Value"

from DATAUPDT.HDTTISARadio P
inner join celink.TBLTAXANDINSDATA TT 
on P.Loan = TT.TIDATALOANNUMBER

and P.SeqNum >=2000 --!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! this works ...

where COALESCE(cast(P.CURDSC as varchar(50)), 'None') <> NewDSC  	
order by P.SeqNum
for read only with ur
;

/*
 Note Insert Value
 ----------------------------------------------------------------------------------------------------------------------------------------
 (1268279, 'Per HDT 199002 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 

*/

-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
------** Notes test ... commented after 20250820  
--select	
--	SeqNum, HDTNum, Requester, loan, CHANGEREQUIRED,NewDSC,
--	TT.TIDATALOANNUMBER,
--	TT.SETASIDETAXES, 
--	TT.SETASIDEINSURANCE, 
--	TT.SETASIDETAXANDINS, 
--	'--Note->', 
--	SeqNum,	
--	Loan as "Loan Number",
----	'N'  as "Priority (Y/N)", 
--	'0'   as "Note Step Number",
----	''   as "Step Date Completed (YYYY-MM-DD)", 
--    'Per HDT ' || P.HDTNum || ' T&I Data Set Asides radio button updated from ' || COALESCE(cast(P.CURDSC as varchar(50)), '<blank>') || ' to ' || P.NewDSC || '.'
--
--from DATAUPDT.HDTTISARadio P
--inner join celink.TBLTAXANDINSDATA TT 
--on P.Loan = TT.TIDATALOANNUMBER
--where COALESCE(cast(P.CURDSC as varchar(50)), 'None') <> NewDSC  	
--
--order by P.SeqNum
--for read only with ur
--;
/*
 SEQNUM HDTNUM REQUESTER         LOAN    CHANGEREQUIRED NEWDSC TIDATALOANNUMBER SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS 11       SEQNUM Loan Number Note Step Number 15
 ------ ------ ----------------- ------- -------------- ------ ---------------- ------------- ----------------- ----------------- -------- ------ ----------- ---------------- ---------------------------------------------------------------------------------------

*/

select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count"  from DATAUPDT.HDTTISARadio where CURDSC <> NewDSC group by HDTNUM, Requester ; 
-- HDT #  Requester        Loan Count
-- ------ ---------------- ----------

-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
-- mergeeeeeee
MERGE into CELINK.TBLTAXANDINSDATA TT
USING 
(
	select 
		P.SeqNum, P.Loan, case when CURDSC <> NewDSC then-1 else 0 end as CHANGEREQUIRED,
--	CurTax,
--	CurIns,
--	CurTnI,
--	CurDsc,
	NewRad,
	NewDsc,
		NewTax, X.SETASIDETAXES, 
		NewIns, X.SETASIDEINSURANCE, 
		NewTnI, X.SETASIDETAXANDINS,
		X.TIDATALOANNUMBER
	from DATAUPDT.HDTTISARadio P
	inner join celink.TBLTAXANDINSDATA X 
	on P.Loan = X.TIDATALOANNUMBER
--	where CURDSC <> NewDSC  
--	where COALESCE(cast(CURDSC as varchar(50)), '<blank>') <> NewDSC  
	where COALESCE(cast(CURDSC as varchar(50)), 'None') <> NewDSC  
		
	order by P.SeqNum
) UY (SeqNum, Loan, CHANGEREQUIRED, NewRad, NewDsc, NewTax, RadioTax, NewIns, RadioIns, NewTnI, RadioTaxIns, TILoan)
ON UY.Loan = TT.TIDATALOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
TT.SETASIDETAXES = NewTax, TT.SETASIDEINSURANCE = NewIns, TT.SETASIDETAXANDINS = NewTnI
;
/*
-- the select
 SEQNUM LOAN    CHANGEREQUIRED NEWRAD NEWDSC NEWTAX SETASIDETAXES NEWINS SETASIDEINSURANCE NEWTNI SETASIDETAXANDINS TIDATALOANNUMBER
 ------ ------- -------------- ------ ------ ------ ------------- ------ ----------------- ------ ----------------- ----------------

*/

-- ---------------- ------------- ----------------- 
-- Validation after ,,, fetch all listed
select 
	P.SeqNum, P.HDTNUM, P.Loan, case when CURDSC <> NewDSC then-1 else 0 end as CHANGEREQUIRED,
	CurTax,
	CurIns,
	CurTnI,
	CurDsc,

NewRad,
NewDsc,

	NewTax, X.SETASIDETAXES, 
	NewIns, X.SETASIDEINSURANCE, 
	NewTnI, X.SETASIDETAXANDINS,
	X.TIDATALOANNUMBER
from DATAUPDT.HDTTISARadio P
inner join celink.TBLTAXANDINSDATA X 
on P.Loan = X.TIDATALOANNUMBER
--where CURDSC <> NewDSC  	
--where COALESCE(cast(CURDSC as varchar(50)), '<blank>') <> NewDSC  
order by P.SeqNum
for read only with ur;

/*
 SEQNUM HDTNUM LOAN    CHANGEREQUIRED CURTAX CURINS CURTNI CURDSC            NEWRAD NEWDSC NEWTAX SETASIDETAXES NEWINS SETASIDEINSURANCE NEWTNI SETASIDETAXANDINS TIDATALOANNUMBER
 ------ ------ ------- -------------- ------ ------ ------ ----------------- ------ ------ ------ ------------- ------ ----------------- ------ ----------------- ----------------
   1001 199014 1383710             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        1383710.0
   1002 199014 3226303             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        3226303.0
   1003 199014 3230213             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        3230213.0
   1004 199014 3289446             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        3289446.0
   1005 199014 3289314             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        3289314.0
   1006 199014 3290979             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        3290979.0
   1007 199014 1318862             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        1318862.0
   1008 199014 3171514             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        3171514.0
   2001 199002 1268279             -1      0      0     -1 TaxesAndInsurance      0 None        0             0      0                 0      0                 0        1268279.0

*/
 

-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
------** --Notes ... with note values
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, StepNum) as
(values
-- Note Insert Value
-- ----------------------------------------------------------------------------------------------------------------------------------------
 (1268279, 'Per HDT 199002 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.', CURRENT_TIMESTAMP, 'tkato', 0, 0)
) 
select * from P
;

/*
 LOAN    NOTE                                                                                    TIMES                      WHO   PRIO STEPNUM
 ------- --------------------------------------------------------------------------------------- -------------------------- ----- ---- -------
 1268279 Per HDT 199002 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. 2025-09-09 13:28:57.059842 tkato    0       0
*/

-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
------** Notes 
/* not used

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

select	
	Loan as "Loan Number",
    'Per HDT ' || P.HDTNum || ' T&I Data Set Asides radio button updated from ' || COALESCE(cast(CURDSC as varchar(50)), '<blank>') || ' to ' || P.NewDSC || '.'
	, CURRENT_TIMESTAMP		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA)
	, 'tkato'
	, 0
	, 0
from DATAUPDT.HDTTISARadio P
inner join celink.TBLTAXANDINSDATA TT 
on P.Loan = TT.TIDATALOANNUMBER
--where CURDSC <> NewDSC  	
--where COALESCE(cast(CURDSC as varchar(50)), '<blank>') <> NewDSC  
where COALESCE(cast(CURDSC as varchar(50)), 'None') <> NewDSC  
order by P.SeqNum
;
 Loan Number 2                                                                                       3                          4     5 6
 ----------- --------------------------------------------------------------------------------------- -------------------------- ----- - -

*/
------------------
-- Notes validation
select 
--count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
	from DATAUPDT.HDTTISARadio UY  
	inner join 	celink.tblloannotes a
	on UY.Loan = a.INTSUBSERVICERLOANNUMBER
	and CHRLOANNOTES like 'Per HDT%' || HDTNum ||'%'
--	and CHRLOANNOTES like 'Per HDT 163053%'
	
	--order by UY.IDSLOANNOTES desc 
	order by UY.SeqNum
with ur;

/*
 SEQNUM DTMNOTEDATE               IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                           CHRUSERID BLNPRIORITY NOTESTEP
 ------ ------------------------- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- ----------- --------
   1001 2025-09-09 13:08:50.20079    213680015                1383710.0 Per HDT 199014 Set Aside Balance updated to $0 from $3961.70.  $3961.70 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
   1002 2025-09-09 13:08:50.20079    213680016                3226303.0 Per HDT 199014 Set Aside Balance updated to $0 from $3549.29.  $3549.29 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
   1003 2025-09-09 13:08:50.20079    213680017                3230213.0 Per HDT 199014 Set Aside Balance updated to $0 from $1660.89.  $1660.89 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
   1004 2025-09-09 13:08:50.20079    213680018                3289446.0 Per HDT 199014 Set Aside Balance updated to $0 from $1873.99.  $1873.99 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
   1005 2025-09-09 13:08:50.20079    213680019                3289314.0 Per HDT 199014 Set Aside Balance updated to $0 from $896.52.  $896.52 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None.   tkato               0     6370
   1006 2025-09-09 13:08:50.20079    213680020                3290979.0 Per HDT 199014 Set Aside Balance updated to $0 from $5999.06.  $5999.06 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
   1007 2025-09-09 13:08:50.20079    213680021                1318862.0 Per HDT 199014 Set Aside Balance updated to $0 from $4365.77.  $4365.77 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
   1008 2025-09-09 13:08:50.20079    213680022                3171514.0 Per HDT 199014 Set Aside Balance updated to $0 from $1341.18.  $1341.18 is gleaned from the most recent transaction on the loan.  Set Asides radio button set to None. tkato               0     6370
   2001 2025-09-09 13:29:24.35633    213681144                1268279.0 Per HDT 199002 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.                                                                                tkato               0        0

1 loan updated. Peer review pending.
6 loans updated. Peer review pending.
8 loans updated. Peer review pending. 1 loan (3372351) already set to none
9 loans updated. Peer review pending.

Radio updated to Tax And Insurance for 1 loan.  Peer review pending.

8 loans updated. Peer review pending.
T&I Set Asides radio button updated for 2 loans.  Peer review pending.
10 loans. T&I Set Asides radio button updated.  Peer review pending.

1 loan. T&I Set Asides radio button updated.  Peer review pending.
T&I Set Asides radio button updated for 5 loan.  Peer review pending.
T&I Set Asides radio button updated 1 loan.  Peer review pending.

T&I Set Asides radio button updated 3 loans.  Peer review pending.
T&I Set Asides radio button updated 6 loans.  Peer review pending.


Set Asides radio button updated for 9 loans.  Peer review pending.
*below 3 loans got TISA depleted
3122178
1396250
1348581

*Loan 3286153 already had been set NONE.

*/

--end


/*
--------** --Notes ... parameter ,,, plug in valeus fro -- Note Insert Value Creastion
--Insert into celink.tblLoanNotes 
--	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
--
--with p (Loan, Note, TimeS, who, prio, StepNum) as
--(values
--
---- Note Insert Value
---- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--(1293119, 'Per HDT 161103 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.',CURRENT_TIMESTAMP, 'tkato', 0, 0),
--(1304514, 'Per HDT 161078 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.',CURRENT_TIMESTAMP, 'tkato', 0, 0),
--(1246334, 'Per HDT 161078 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.',CURRENT_TIMESTAMP, 'tkato', 0, 0)
--
-- ) 
--select * from P
--;
*/

/*
 ----------- --------------------------------------------------------------------------------------- -------------------------- ----- - -
 LOAN    NOTE                                                                                    TIMES                     WHO   PRIO STEPNUM
 ------- --------------------------------------------------------------------------------------- ------------------------- ----- ---- -------
 1293119 Per HDT 161102 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. 2024-04-17 16:58:58.60176 tkato    0       0
 1304514 Per HDT 161078 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. 2024-04-17 16:58:58.60176 tkato    0       0
 1246334 Per HDT 161078 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. 2024-04-17 16:58:58.60176 tkato    0       0
*/


select a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP from celink.tblloannotes a where IDSLOANNOTES = 173492346 --for read only with ur;
union
select a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP from celink.tblloannotes a where IDSLOANNOTES = 173492347 --for read only with ur;
order by IDSLOANNOTES
for read only with ur;

-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                            CHRUSERID BLNPRIORITY NOTESTEP
-- -------------------------- ------------ ------------------------ --------------------------------------------------------------------------------------- --------- ----------- --------
-- 2023-12-08 11:22:52.756377    173492346                1235577.0 Per HDT 150938 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. tkato               0        0
-- 2023-12-08 11:22:52.756377    173492347                1276513.0 Per HDT 150938 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. tkato               0        0

--UPDATE celink.tblloannotes set CHRLOANNOTES = 'Per HDT 151018 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.' where IDSLOANNOTES = 173492346;
--UPDATE celink.tblloannotes set CHRLOANNOTES = 'Per HDT 151018 T&I Data Set Asides radio button updated from TaxesAndInsurance to None.' where IDSLOANNOTES = 173492347;

-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                            CHRUSERID BLNPRIORITY NOTESTEP
-- -------------------------- ------------ ------------------------ --------------------------------------------------------------------------------------- --------- ----------- --------
-- 2023-12-08 11:22:52.756377    173492346                1235577.0 Per HDT 151018 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. tkato               0        0
-- 2023-12-08 11:22:52.756377    173492347                1276513.0 Per HDT 151018 T&I Data Set Asides radio button updated from TaxesAndInsurance to None. tkato               0        0


/* *********************************************************************************************************************************************************************** */
/* *********************************************************************************************************************************************************************** */
/* *********************************************************************************************************************************************************************** */
/* *********************************************************************************************************************************************************************** */
/* *********************************************************************************************************************************************************************** */
/* *********************************************************************************************************************************************************************** */

-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
-- Ref ,,, code that is not using DATAUPDT table

select 
TIDATALOANNUMBER, 
SETASIDETAXES, SETASIDEINSURANCE, SETASIDETAXANDINS, 
ANNUALTIANALYSISCOMPDATE, * 
from CELINK.TBLTAXANDINSDATA 
where TIDATALOANNUMBER =   1304153  
for read only with ur;
-- TIDATALOANNUMBER SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS ANNUALTIANALYSISCOMPDATE TIDATALOANNUMBER TIDATATAXOFFICE                TIDATAWINTERTAXDATE TIDATASUMMERTAXDATE TIDATATYPE                     TIDATAWINTERTAXAMOUNT TIDATADATEWINTERPAID TIDATASUMMERTAXAMOUNT TIDATADATESUMMERPAID TIDATAPROPERTYID               TIDATAHAZARDCARRIER            TIDATAHAZARDEXPIREDATE TIDATAHAZARDPOLICYNUMBER       TIDATAFLOODCARRIER             TIDATAFLOODEXPIREDATE TIDATAFLOODPOLICYNUMBER        TIDATAWINDCARRIER              TIDATAWINDEXPIREDATE TIDATAWINDPOLICYNUMBER         TIDATAFORCEDPLACEDAMOUNT TIDATAFORCEDPLACEDEXPIREDATE TIDATANOTES REQUIREDINSCOVERAGE HAZARDINSCOVERAGEAMT HAZARDINSFORCEDPLACED FLOODINSCOVERAGEAMT FLOODINSFORCEDPLACED WINDINSCOVERAGEAMT WINDINSFORCEDPLACED HOANAME                                                                                              HOAPHONE   HOACONTACTNAME                                                                                       HOAMONTHLYPAYMENTAMT HOALASTPAYMENTMADEDATE HOANEXTPAYMENTDUEDATE HOAADDRESS                      SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS TISAMANDATORY TISAFUNDED TISASHORTFALL SUSPENDSEMIANNUALDISBURSE ANNUALTIANALYSISCOMPDATE EXPECTEDFRSTYRTIDISBURSEAMT INSTRCKTERMDATE REACTIVATIONFLAG REACTIVATIONDATE TAXTRCKTERMDATE TAXREACTIVATIONFLAG TAXREACTIVATIONDATE TAXDEFERRALIND TISAPCTTHRESHOLD LOCPCTTHRESHOLD TIDANNUALPROPTAX TIDANNUALPROPINSPREMIUM PROJECTANNUALPROPERTYCHG TIDLASTPAYTAXDATE TIDLASTPAYINSDATE TISAFULLDISBURSEDATE SETASIDEHHF SETASIDEHHFSTATE
-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
--        1244455.0             0                 0                -1 2022-02-15                      1244455.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0 Pirates Cove Townhoues Owners Association                                                            7134891702                                                                                                                  0.000000 NULL                   NULL                  PO Box 300426  Houston TX 77230             0                 0                -1            57         61      0.000000                         0 2022-02-15                               2848.010000 NULL                        NULL NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL


-- Dup check
with Param (SeqNum, HDTNum, Requester, loan) as
(Values

--Radio
(1, 131968, 'Randi Werner', 1221383),
(2, 131968, 'Randi Werner', 1371156),
(3, 131968, 'Randi Werner', 1413346),
(4, 131968, 'Randi Werner', 3124906),
(5, 131968, 'Randi Werner', 3213813),
(6, 131968, 'Randi Werner', 3101394)

)
select	
	Loan, count(*) 
from Param P
group by P.loan having count(*) >1
for read only with ur;

-- LOAN    2
-- ------- -

-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
------** Notes 

with Param (SeqNum, HDTNum, Requester, loan) as
(Values

--Radio
(1, 131968, 'Randi Werner', 1221383),
(2, 131968, 'Randi Werner', 1371156),
(3, 131968, 'Randi Werner', 1413346),
(4, 131968, 'Randi Werner', 3124906),
(5, 131968, 'Randi Werner', 3213813),
(6, 131968, 'Randi Werner', 3101394)

)
select	
	SeqNum, HDTNum, Requester, loan, 
	'--Note->', 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
    'Per HDT ' || P.HDTNum || ' T&I Data Set Asides radio button set to none.'

from Param P
inner join celink.TBLTAXANDINSDATA TT 
	on P.Loan = TT.TIDATALOANNUMBER
order by P.SeqNum
for read only with ur
;

/*

C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTUpdtNotes_ 131671.csv

 SEQNUM HDTNUM REQUESTER    LOAN    5        SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) 11
 ------ ------ ------------ ------- -------- ------ ----------- -------------- ---------------- -------------------------------- ------------------------------------------------------------
      1 131968 Randi Werner 1221383 --Note->      1     1221383 N                                                                Per HDT 131968 T&I Data Set Asides radio button set to none.
      2 131968 Randi Werner 1371156 --Note->      2     1371156 N                                                                Per HDT 131968 T&I Data Set Asides radio button set to none.
      3 131968 Randi Werner 1413346 --Note->      3     1413346 N                                                                Per HDT 131968 T&I Data Set Asides radio button set to none.
      4 131968 Randi Werner 3124906 --Note->      4     3124906 N                                                                Per HDT 131968 T&I Data Set Asides radio button set to none.
      5 131968 Randi Werner 3213813 --Note->      5     3213813 N                                                                Per HDT 131968 T&I Data Set Asides radio button set to none.
      6 131968 Randi Werner 3101394 --Note->      6     3101394 N                                                                Per HDT 131968 T&I Data Set Asides radio button set to none.

*/
-- ------ ------ ------------ ------- -------- ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------
-- TBLTAXANDINSDATA  
-- Bulk check
with param (SeqNum, HDTNum, Requester, Loan) as 
(VALUES

--Radio
(1, 131968, 'Randi Werner', 1221383),
(2, 131968, 'Randi Werner', 1371156),
(3, 131968, 'Randi Werner', 1413346),
(4, 131968, 'Randi Werner', 3124906),
(5, 131968, 'Randi Werner', 3213813),
(6, 131968, 'Randi Werner', 3101394)

)
select 
	P.SeqNum, P.Loan,
	
	X.TIDATALOANNUMBER,
	X.SETASIDETAXES, 
	X.SETASIDEINSURANCE, 
	X.SETASIDETAXANDINS, 
	X.* 
from param P
inner join CELINK.TBLTAXANDINSDATA X  
	on P.Loan = X.TIDATALOANNUMBER
	
--where SETASIDETAXES <> 0 or SETASIDEINSURANCE <> 0 or SETASIDETAXANDINS <> 0	
--where SETASIDETAXES = 0 and SETASIDEINSURANCE = 0 and SETASIDETAXANDINS = 0	
order by P.SeqNum
for read only with ur;


/*

 SEQNUM LOAN    TIDATALOANNUMBER SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS TIDATALOANNUMBER TIDATATAXOFFICE                TIDATAWINTERTAXDATE TIDATASUMMERTAXDATE TIDATATYPE                     TIDATAWINTERTAXAMOUNT TIDATADATEWINTERPAID TIDATASUMMERTAXAMOUNT TIDATADATESUMMERPAID TIDATAPROPERTYID               TIDATAHAZARDCARRIER            TIDATAHAZARDEXPIREDATE TIDATAHAZARDPOLICYNUMBER       TIDATAFLOODCARRIER             TIDATAFLOODEXPIREDATE TIDATAFLOODPOLICYNUMBER        TIDATAWINDCARRIER              TIDATAWINDEXPIREDATE TIDATAWINDPOLICYNUMBER         TIDATAFORCEDPLACEDAMOUNT TIDATAFORCEDPLACEDEXPIREDATE TIDATANOTES REQUIREDINSCOVERAGE HAZARDINSCOVERAGEAMT HAZARDINSFORCEDPLACED FLOODINSCOVERAGEAMT FLOODINSFORCEDPLACED WINDINSCOVERAGEAMT WINDINSFORCEDPLACED HOANAME                                                                                              HOAPHONE   HOACONTACTNAME                                                                                       HOAMONTHLYPAYMENTAMT HOALASTPAYMENTMADEDATE HOANEXTPAYMENTDUEDATE HOAADDRESS SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS TISAMANDATORY TISAFUNDED TISASHORTFALL SUSPENDSEMIANNUALDISBURSE ANNUALTIANALYSISCOMPDATE EXPECTEDFRSTYRTIDISBURSEAMT INSTRCKTERMDATE REACTIVATIONFLAG REACTIVATIONDATE TAXTRCKTERMDATE TAXREACTIVATIONFLAG TAXREACTIVATIONDATE TAXDEFERRALIND TISAPCTTHRESHOLD LOCPCTTHRESHOLD TIDANNUALPROPTAX TIDANNUALPROPINSPREMIUM PROJECTANNUALPROPERTYCHG TIDLASTPAYTAXDATE TIDLASTPAYINSDATE TISAFULLDISBURSEDATE SETASIDEHHF SETASIDEHHFSTATE
 ------ ------- ---------------- ------------- ----------------- ----------------- ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ---------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
      1 1221383        1221383.0             0                 0                -1        1221383.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                                                                                                                                                  0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2022-06-27                                548.660000 NULL                        NULL NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL
      2 1371156        1371156.0             0                 0                -1        1371156.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                        0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2021-06-25                               2731.320000 NULL                        NULL NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL
      3 1413346        1413346.0             0                 0                -1        1413346.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                        0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2022-06-27                               2412.860000 NULL                           0 NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL
      4 3124906        3124906.0             0                 0                -1        3124906.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                        0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2022-06-27                                  0.000000 NULL                           0 NULL             NULL                              0 NULL                             3             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL
      5 3213813        3213813.0             0                 0                -1        3213813.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                        0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2022-06-27                               7935.730000 NULL                           0 NULL             NULL                              0 NULL                             3              0.0             0.0             NULL                    NULL                 0.000000 NULL              NULL              NULL                           0 NULL
      6 3101394        3101394.0             0                 0                -1        3101394.0                                NULL                NULL                                                            0.000000 NULL                              0.000000 NULL                                                                               NULL                                                                                 NULL                                                                                NULL                                                                0.000000 NULL                                                       0             0.000000                     0            0.000000                    0           0.000000                   0                                                                                                      NULL                                                                                                                        0.000000 NULL                   NULL                                         0                 0                -1            57         61      0.000000                         0 2021-06-28                               1672.340000 NULL                           0 NULL             NULL                           NULL NULL                          NULL             NULL            NULL             NULL                    NULL                 0.000000 NULL              NULL              NULL                        NULL NULL

*/

/* ****************************************************************************************************** update 
--UPDATE CELINK.TBLTAXANDINSDATA set SETASIDETAXANDINS = 0 where TIDATALOANNUMBER = 1353604 ; --(1, 121355, 'Randi Werner', 1353604) --Please change the Radio Button to None.  
* ******************************************************************************************************* update */ 

/* *****
MERGE into CELINK.TBLTAXANDINSDATA TT
USING 
(
	select 
		P.SeqNum, P.Loan,
		X.TIDATALOANNUMBER,
		X.SETASIDETAXES, 
		X.SETASIDEINSURANCE, 
		X.SETASIDETAXANDINS
	from 
	(VALUES

--Radio
(1, 131968, 'Randi Werner', 1221383),
(2, 131968, 'Randi Werner', 1371156),
(3, 131968, 'Randi Werner', 1413346),
(4, 131968, 'Randi Werner', 3124906),
(5, 131968, 'Randi Werner', 3213813),
(6, 131968, 'Randi Werner', 3101394)

	) P (SeqNum, HDTNum, Requester, Loan)  
	inner join CELINK.TBLTAXANDINSDATA X  
	on 	  P.Loan = X.TIDATALOANNUMBER
	where SETASIDETAXES <> 0 or SETASIDEINSURANCE <> 0 or SETASIDETAXANDINS <> 0	
	order by P.SeqNum
) UY
ON UY.Loan = TT.TIDATALOANNUMBER
WHEN MATCHED THEN UPDATE 
Set
TT.SETASIDETAXES = 0, TT.SETASIDEINSURANCE = 0, TT.SETASIDETAXANDINS = 0
;

***** */

--------------------------------------------
/*
---- inside select ,,, 

-- after
 SEQNUM LOAN    TIDATALOANNUMBER SETASIDETAXES SETASIDEINSURANCE SETASIDETAXANDINS
 ------ ------- ---------------- ------------- ----------------- -----------------
      1 1221383        1221383.0             0                 0                 0
      2 1371156        1371156.0             0                 0                 0
      3 1413346        1413346.0             0                 0                 0
      4 3124906        3124906.0             0                 0                 0
      5 3213813        3213813.0             0                 0                 0
      6 3101394        3101394.0             0                 0                 0

*/

	select 
		P.SeqNum, P.Loan,
		X.TIDATALOANNUMBER,
		X.SETASIDETAXES, 
		X.SETASIDEINSURANCE, 
		X.SETASIDETAXANDINS
	from 
	(VALUES

--Radio
(1, 131968, 'Randi Werner', 1221383),
(2, 131968, 'Randi Werner', 1371156),
(3, 131968, 'Randi Werner', 1413346),
(4, 131968, 'Randi Werner', 3124906),
(5, 131968, 'Randi Werner', 3213813),
(6, 131968, 'Randi Werner', 3101394)

	) P (SeqNum, HDTNum, Requester, Loan)  
	inner join CELINK.TBLTAXANDINSDATA X  
	on 	  P.Loan = X.TIDATALOANNUMBER
	--where SETASIDETAXES <> 0 or SETASIDEINSURANCE <> 0 or SETASIDETAXANDINS <> 0	
	order by P.SeqNum;


/* *****
-- ---------------- ------------- ----------------- ----------------- ------------------------ ---------------- ------------------------------ ------------------- ------------------- ------------------------------ --------------------- -------------------- --------------------- -------------------- ------------------------------ ------------------------------ ---------------------- ------------------------------ ------------------------------ --------------------- ------------------------------ ------------------------------ -------------------- ------------------------------ ------------------------ ---------------------------- ----------- ------------------- -------------------- --------------------- ------------------- -------------------- ------------------ ------------------- ---------------------------------------------------------------------------------------------------- ---------- ---------------------------------------------------------------------------------------------------- -------------------- ---------------------- --------------------- ------------------------------- ------------- ----------------- ----------------- ------------- ---------- ------------- ------------------------- ------------------------ --------------------------- --------------- ---------------- ---------------- --------------- ------------------- ------------------- -------------- ---------------- --------------- ---------------- ----------------------- ------------------------ ----------------- ----------------- -------------------- ----------- ----------------
------** Notes Post ... 20230425 ,,, we do post directly 

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY)

with Param (SeqNum, HDTNum, Requester, loan) as
(Values

--Radio
(1, 131968, 'Randi Werner', 1221383),
(2, 131968, 'Randi Werner', 1371156),
(3, 131968, 'Randi Werner', 1413346),
(4, 131968, 'Randi Werner', 3124906),
(5, 131968, 'Randi Werner', 3213813),
(6, 131968, 'Randi Werner', 3101394)

)
select	
--	SeqNum, HDTNum, Requester, loan, 
	Loan as "Loan Number",
--	'N'  as "Priority (Y/N)", 
--	''   as "Note Step Number",
--	''   as "Step Date Completed (YYYY-MM-DD)", 
--    'Per HDT ' || P.HDTNum || ' (' || P.Requester || ') ' || 'T&I Data Set Asides radio button set to none.'
    'Per HDT ' || P.HDTNum || ' T&I Data Set Asides radio button set to none.'
	, CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0
from Param P
inner join celink.TBLTAXANDINSDATA TT 
on P.Loan = TT.TIDATALOANNUMBER
--where SETASIDETAXES <> 0 or SETASIDEINSURANCE <> 0 or SETASIDETAXANDINS <> 0	

order by P.SeqNum
;

***** */

/*

 Loan Number 2                                                            3                          4     5
 ----------- ------------------------------------------------------------ -------------------------- ----- -
     1221383 Per HDT 131968 T&I Data Set Asides radio button set to none. 2023-06-30 14:41:30.904291 tkato 0
     1371156 Per HDT 131968 T&I Data Set Asides radio button set to none. 2023-06-30 14:41:30.904291 tkato 0
     1413346 Per HDT 131968 T&I Data Set Asides radio button set to none. 2023-06-30 14:41:30.904291 tkato 0
     3124906 Per HDT 131968 T&I Data Set Asides radio button set to none. 2023-06-30 14:41:30.904291 tkato 0
     3213813 Per HDT 131968 T&I Data Set Asides radio button set to none. 2023-06-30 14:41:30.904291 tkato 0
     3101394 Per HDT 131968 T&I Data Set Asides radio button set to none. 2023-06-30 14:41:30.904291 tkato 0


*/

------------------
-- Notes validation
with Param (SeqNum, HDTNum, Requester, loan) as
(Values

--Radio
(1, 131968, 'Randi Werner', 1221383),
(2, 131968, 'Randi Werner', 1371156),
(3, 131968, 'Randi Werner', 1413346),
(4, 131968, 'Randi Werner', 3124906),
(5, 131968, 'Randi Werner', 3213813),
(6, 131968, 'Randi Werner', 3101394)

)
select 
--	count(*) as "MyCount"
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from param P
	inner join celink.tblloannotes a
	on  p.loan = a.INTSUBSERVICERLOANNUMBER
	and a.CHRLOANNOTES like 'Per HDT%' || P.HDTNum || '%'
	order by p.SeqNum  
with ur;

/*

 DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                            CHRUSERID BLNPRIORITY
 -------------------------- ------------ ------------------------ --------------------------------------------------------------------------------------------------------------------------------------- --------- -----------
 2023-06-30 14:32:28.079801    164644952                1221383.0 Per HDT 131968 TISA balance has been forced to zero from 456.38 where 456.38 is gleaned from the most recent transaction on the loan.   tkato               0
 2023-06-30 14:42:00.448748    164645226                1221383.0 Per HDT 131968 T&I Data Set Asides radio button set to none.                                                                            tkato               0
 2023-06-30 14:32:28.079801    164644953                1371156.0 Per HDT 131968 TISA balance has been forced to zero from 56.74 where 56.74 is gleaned from the most recent transaction on the loan.     tkato               0
 2023-06-30 14:42:00.448748    164645227                1371156.0 Per HDT 131968 T&I Data Set Asides radio button set to none.                                                                            tkato               0
 2023-06-30 14:32:28.079801    164644954                1413346.0 Per HDT 131968 TISA balance has been forced to zero from 2180.70 where 2180.70 is gleaned from the most recent transaction on the loan. tkato               0
 2023-06-30 14:42:00.448748    164645228                1413346.0 Per HDT 131968 T&I Data Set Asides radio button set to none.                                                                            tkato               0
 2023-06-30 14:32:28.079801    164644955                3124906.0 Per HDT 131968 TISA balance has been forced to zero from 1991.05 where 1991.05 is gleaned from the most recent transaction on the loan. tkato               0
 2023-06-30 14:42:00.448748    164645229                3124906.0 Per HDT 131968 T&I Data Set Asides radio button set to none.                                                                            tkato               0
 2023-06-30 14:32:28.079801    164644956                3213813.0 Per HDT 131968 TISA balance has been forced to zero from 9761.98 where 9761.98 is gleaned from the most recent transaction on the loan. tkato               0
 2023-06-30 14:42:00.448748    164645230                3213813.0 Per HDT 131968 T&I Data Set Asides radio button set to none.                                                                            tkato               0
 2023-06-30 14:32:28.079801    164644957                3101394.0 Per HDT 131968 TISA balance has been forced to zero from 409.51 where 409.51 is gleaned from the most recent transaction on the loan.   tkato               0
 2023-06-30 14:42:00.448748    164645231                3101394.0 Per HDT 131968 T&I Data Set Asides radio button set to none.                                                                            tkato               0

                                                                        tkato               0
*/

/*		
		select 
		--	count(*) as "MyCount"
			a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
			from celink.tblloannotes a
			
			where CHRLOANNOTES like 'Per HDT%126685%' -- or CHRLOANNOTES like 'Per HDT%126480%'
			order by INTSUBSERVICERLOANNUMBER desc 
		with ur;
*/		


