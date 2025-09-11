
/*
-----------------------------------------------------------------------------------------------------------------------------------------------
-- Excel format ... based on Status Change Request form, added SeqNum, left status change columns blank such as cur.status, err.msg, new status
="(" & K2 & ", " & F2 & ", '" & G2 & "', " & A2 & ", " & J2 & ", '" &I2 & "'),"

*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250828
[ID:0198096] D&P data - Reason Called Due 8/27/2025 1:29 PM Jorge Solis
1200414  Please change reason called due from blank to Reason Called Due: Death 55 55-Called Due: Death
(101, 0198096, 'Jorge Solis', 1200414, 55, 'from blank to Reason Called Due')
1 loan updated.  Peer review pending.
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from celink.tblactioncodesall order by IDSSTATUSCODE for read only with ur;
--            55 55-Called Due: Death                                            Called Due: Death                                                           Called Due: Death                                                        0 Maintenance          Called Due           Default: Death                                     CalledDue                                0                    NULL NULL                   DeathAnn                 0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            55               NULL
--            56 56-Called Due: Non-Occupancy                                    Called Due: Non-Occupancy                                                   Called Due: Non-Occupancy                                                0 Maintenance          Called Due           Default: Non-Occupancy                             CalledDue                                0                    NULL NULL                   Trans                    0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            56               NULL
--            57 57-Called Due: T&I                                              Called Due: Tax & Insurance                                                 Called Due: Tax & Insurance                                              0 Maintenance          Called Due           Default: Tax & Insurance                           CalledDue                                0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            57               NULL
--            58 58-Called Due: Other                                            Called Due: Other                                                           Called Due: Other                                                        0 Maintenance          Called Due           Default: Other                                     CalledDue                                0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            58               NULL
--            59 59-Called Due: Non-Completed Repairs                            Called Due: Non-Completed Repairs                                           Called Due: Non-Completed Repairs                                        0 Maintenance          Called Due           Default: Repairs                                   CalledDue                                0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            58               NULL

--            10 10-Refer for FCL: Non-Completed Repairs                         Refer for FCL: Non-completed Repairs                                        Refer for FCL: Non-completed Repairs                                     0 Maintenance          Foreclosure          Refer for FCL: Non-completed Repairs               Foreclosure                              0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            10               NULL
--            11 11-Refer for FCL: Death                                         Refer for FCL: Death                                                        Refer for FCL: Death                                                     0 Maintenance          Foreclosure          Refer for FCL: Death                               Foreclosure                              0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            11               NULL
--            12 12-Refer for FCL: Non-Occupancy                                 Refer for FCL: Non-Occupancy                                                Refer for FCL: Non-Occupancy                                             0 Maintenance          Foreclosure          Refer for FCL: Non-Occupancy                       Foreclosure                              0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            12               NULL
--            13 13-Refer for FCL: T&I                                           Refer for FCL: Tax & Insurance                                              Refer for FCL: Tax & Insurance                                           0 Maintenance          Foreclosure          Refer for FCL: Tax & Insurance                     Foreclosure                              0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            13               NULL
--            14 14-Refer for FCL: Other                                         Refer for FCL: Other                                                        Refer for FCL: Other                                                     0 Maintenance          Foreclosure          Refer for FCL: Other                               Foreclosure                              0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            14               NULL

-- Called Due: Death-Deferred NBS                                         5501 5501-Called Due: Death-Deferred NBS                             Called Due: Death-Deferred NBS                                              Called Due: Death-Deferred NBS                                           0 Maintenance          Called Due           Default: Death-Deferred NBS                        Called Due                               0                    NULL NULL                   DeathAnn                 0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            55               NULL
-- Called Due: T&I w/Repayment Plan                                       5701 5701-Called Due: T&I w/Repayment Plan                           Called Due: T&I w/Repayment Plan                                            Called Due: T&I w/Repayment Plan                                         0 Maintenance          Called Due           Called Due: T&I w/Repayment Plan                   CalledDue                                0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            53               NULL
-- Called Due: T&I w/At Risk Extension                                    5702 5702-Called Due: T&I w/At Risk Extension                        Called Due: T&I w/At Risk Extension                                         Called Due: T&I w/At Risk Extension                                      0 Maintenance          Called Due           Default: T&I w/At Risk Extension                   CalledDue                                0                    NULL NULL                   NULL                     0                0 LoanStatusMaintenanceTransactions NULL                        0 NULL                   -1         -1              0            57               NULL

--------------------------------------------------------------------------------------------------------

--select 
--	CalledDueType, CALLEDDUEDATE, *
--	from celink.tblstatustracking
--	where CalledDueType = 5701 
--for read only with ur;


------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
--StatusTracking
select 
	CalledDueType, CALLEDDUEDATE, DEFAULTTYPE, DEFAULTDATE, *
	from celink.tblstatustracking
	where statusloan = 
for read only with ur;

-- CALLEDDUETYPE CALLEDDUEDATE STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- ------------- ------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------

--CALCFLDS
select 
	CALCFLDS.CFIDATE AS "CafiDate", CALCFLDS.* 
	from CELINK.TBLCALCFIELDS AS CALCFLDS 
	where CALCFLDS.CFIFIELDID in (103) -- 103 Called Due Date , 132 Default date
	and   CALCFLDS.CFILOANNUMBER = 1217203
	order by CREATIONDATE
FOR READ ONLY with ur;
-- no data

--Transactions
select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, DTMEFFECTIVEDATE, IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, * 
	from celink.TBLTRANSACTIONS 
	where intsubservicerloannumber =  
--	and IDSTRANSID =  
	order by DTMEFFECTIVEDATE desc 
--	order by IDSTRANSACTIONCOUNT desc 
for read only with ur;



-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*-- DATAUPDT Table for  
create table DATAUPDT.HDTCalledDueReason_McDaid   
	(
	SeqNum integer,
	HDTNum integer, 
	Requester varchar(30) ,

	Loan integer,

	ReqDesc varchar (200), 
	ReqType integer,
	ReqTypeDesc varchar (100),
	
	CurType integer , 													
	CurTypeDesc varchar (100),
	
	CurCalledDueDate date, 

	ChangeRequired integer
	)
	COMPRESS YES ADAPTIVE
	IN DATAUPDT_TS16;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTCalledDueReason_McDaid  TO group db2_ast;
	
-- drop table DATAUPDT.HDTCalledDueReason_McDaid;
select * from DATAUPDT.HDTCalledDueReason_McDaid;
*/


-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.HDTCalledDueReason_McDaid;

-------------------------------------------------------------------------------------------------------------------------------------
-- Data  
insert into DATAUPDT.HDTCalledDueReason_McDaid
	(
	SeqNum , HDTNum , Requester ,Loan , ReqDesc, 
	ReqType, ReqTypeDesc,
	CurType, CurTypeDesc,
	CurCalledDueDate, 
	ChangeRequired  
	)
with param (SeqNum, HDTNum, Requester, Loan, ReqType, ReqDesc) as
(Values 
(101, 0198096, 'Jorge Solis', 1200414, 55, 'from blank to Reason Called Due')
)
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.ReqDesc,  
	P.ReqType, 	--Act2.IDSSTATUSCODE as "ReqTypeAct2", 
	Act2.CHRACTIONCODEDROPBOX as "ReqTypeDesc",
	
	X.CalledDueType           as "CurType", --Act1.IDSSTATUSCODE as "CurTypeAct1", 
	COALESCE(cast(Act1.CHRACTIONCODEDROPBOX as VARCHAR(100)), '<Blank>') as "CurTypeDesc",
	
	X.CALLEDDUEDATE as "CurCalledDueDate", 

--	case when P.ReqType  = X.CalledDueType then 0 else -1 end as "ChangeRequired"  
	case when P.ReqType <> COALESCE(X.CalledDueType, -999)  then -1 else 0 end as "ChangeRequired"  

from param P
inner join celink.tblstatustracking X
on P.Loan = X.statusloan
	
left outer join celink.tblactioncodesall Act1 
on  X.CalledDueType = Act1.IDSSTATUSCODE
and Act1.IDSSTATUSCODE in (55,56,57,58,59)  -- ***** 20210202 added in order to avoid the note from being output with dumb verbage like "from 00-Active to ...."
	
left outer join celink.tblactioncodesall Act2 
on P.ReqType = Act2.IDSSTATUSCODE
	
order by P.SeqNum
--for read only 
with ur;

----------------------------------------------------------------
select * from DATAUPDT.HDTCalledDueReason_McDaid order by SeqNum;
-- SEQNUM HDTNUM REQUESTER   LOAN    REQDESC                         REQTYPE REQTYPEDESC          CURTYPE CURTYPEDESC CURCALLEDDUEDATE CHANGEREQUIRED
-- ------ ------ ----------- ------- ------------------------------- ------- -------------------- ------- ----------- ---------------- --------------
--    101 198096 Jorge Solis 1200414 from blank to Reason Called Due      55 55-Called Due: Death    NULL <Blank>     NULL                         -1

-- Count
--select HDTNUM HDT#, Requester "Requester", count(*) "Loan Count", 194246 ParentHDT from DATAUPDT.HDTCalledDueReason_McDaid group by ParentHDT, HDT#, Requester; 
select HDTNUM "HDT #", Requester "Requester", count(*) "Loan Count", 194246 "Parent HDT" from DATAUPDT.HDTCalledDueReason_McDaid group by HDTNUM, Requester; 

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------
select 
	P.seqnum, P.Loan,
	CALCFLDS.CFIDATE AS DATECALLEDDUE, CALCFLDS.*
from DATAUPDT.HDTCalledDueReason_McDaid P
inner join CELINK.TBLCALCFIELDS AS CALCFLDS 
on P.Loan = CALCFLDS.CFILOANNUMBER
AND CALCFLDS.CFIFIELDID in (103) -- 103 Called Due Date , 132 Default date
order by P.SeqNum, CALCFLDS.CREATIONDATE
FOR READ ONLY with ur;
-- SEQNUM LOAN    DATECALLEDDUE CFILOANNUMBER CFIFIELDID CFIDATE    CFIDECIMAL   CFIBOOLEAN CREATIONDATE               CFIINT CFISTRING
-- ------ ------- ------------- ------------- ---------- ---------- ------------ ---------- -------------------------- ------ ---------
--    101 1200414 2025-08-22        1200414.0        103 2025-08-22 47926.680000       NULL 2025-08-22 11:35:06.828989   NULL NULL

select 
	P.seqnum, P.Loan,
	X.INTSUBSERVICERLOANNUMBER, X.IDSSTATUSCODE, X.* 
from DATAUPDT.HDTCalledDueReason_McDaid P
	inner join CELINK.LOANCURRENTSTATUS X --see DDL_View_LOANCurrentStatus 
	on P.Loan = X.INTSUBSERVICERLOANNUMBER 
	order by P.SeqNum 
for read only with ur;
-- SEQNUM LOAN    INTSUBSERVICERLOANNUMBER IDSSTATUSCODE INTSUBSERVICERLOANNUMBER IDSSTATUSCODE BLNLOANSUSPENDED
-- ------ ------- ------------------------ ------------- ------------------------ ------------- ----------------
--    101 1200414                1200414.0            55                1200414.0            55               -1

--		SELECT 
--			INTSUBSERVICERLOANNUMBER, IDSSTATUSCODE, * 
--			FROM CELINK.LOANCURRENTSTATUS --see DDL_View_LOANCurrentStatus 
--			WHERE INTSUBSERVICERLOANNUMBER in   (1200596, 1191858)
--		for read only with ur;

select 
	P.seqnum, P.Loan,
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT,
	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
	DTMTRANSACTIONCREATIONDATE, IDSUSERID     
from DATAUPDT.HDTCalledDueReason_McDaid P
inner join celink.TBLTRANSACTIONS X 
on P.Loan = X.INTSUBSERVICERLOANNUMBER
where IDSSTATUSCODE in (55,56,57,58,59,5501,5701,5702)
order by p.seqnum,  x.IDSTRANSACTIONCOUNT desc
--order by P.SeqNum, X.IDSTRANSID desc 
for read only with ur;	
-- SEQNUM LOAN    INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID
-- ------ ------- ------------------------ ---------- ------------------- ------------------ ------------- -------------------- ---------------- -------------------------- -----------
--    101 1200414                1200414.0   75755512                 327                 55            55 Called Due: Death    2025-08-22       2025-08-22                 april.solis


-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--CALCFLDS
select 
	CALCFLDS.CFIDATE AS "CafiDate", CALCFLDS.* 
	from CELINK.TBLCALCFIELDS AS CALCFLDS 
	where CALCFLDS.CFIFIELDID in (103) -- 103 Called Due Date , 132 Default date
	and   CALCFLDS.CFILOANNUMBER = 
	order by CREATIONDATE
FOR READ ONLY with ur;
-- CafiDate   CFILOANNUMBER CFIFIELDID CFIDATE    CFIDECIMAL    CFIBOOLEAN CREATIONDATE               CFIINT CFISTRING
-- ---------- ------------- ---------- ---------- ------------- ---------- -------------------------- ------ ---------

--StatusTracking
select 
	CalledDueType, CALLEDDUEDATE, *
	from celink.tblstatustracking
	where statusloan = 
for read only with ur;
-- CALLEDDUETYPE CALLEDDUEDATE STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- ------------- ------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------

-- history
SELECT 
	STATUSLOAN, CALLEDDUETYPE,  CALLEDDUEDATE,
	SYS_START, SYS_END, USER_ID_COL, CHANGE_REC
	FROM CELINK.TBLStatusTracking 
	for system_time from '2020-04-01-00.00.00.000000' to '2020-12-30-00.00.00.000000'
	where statusloan = 3365342
	order by STATUSLOAN, SYS_END desc
for read only with UR;

--Transactions
select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, DTMEFFECTIVEDATE, IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, * 
	from celink.TBLTRANSACTIONS 
	where intsubservicerloannumber =  3365342
--	and IDSTRANSID =  
	order by DTMEFFECTIVEDATE desc 
--	order by IDSTRANSACTIONCOUNT desc 
for read only with ur;
-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID         DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ---------------- ------------------ ------------- -------------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ----------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------

------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------
-- validation
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.ReqDesc, 

	P.ReqType,        P.ReqTypeDesc,
	P.CurType,        P.CurTypeDesc, 
	X.CalledDueType,  Act1.CHRACTIONCODEDROPBOX,
	X.CALLEDDUEDATE,

	P.ChangeRequired  
, X.*
from DATAUPDT.HDTCalledDueReason_McDaid P
inner join celink.tblstatustracking X
on P.Loan = X.statusloan
	
left outer join celink.tblactioncodesall Act1 
on X.CalledDueType = Act1.IDSSTATUSCODE
	
--	where P.ChangeRequired = -1
order by P.SeqNum
for read only with ur;
-- SEQNUM HDTNUM REQUESTER   LOAN    REQDESC                         REQTYPE REQTYPEDESC          CURTYPE CURTYPEDESC CALLEDDUETYPE CHRACTIONCODEDROPBOX CALLEDDUEDATE CHANGEREQUIRED STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- ------ ------ ----------- ------- ------------------------------- ------- -------------------- ------- ----------- ------------- -------------------- ------------- -------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
--    101 198096 Jorge Solis 1200414 from blank to Reason Called Due      55 55-Called Due: Death    NULL <Blank>              NULL NULL                 NULL                      -1  1200414.0           0 2020-11-02           NULL NULL                     NULL NULL            NULL                           NULL NULL                           0                0                0                       0.000000 NULL                   NULL                   NULL                                    0.000000                       0 NULL                            0.000000                      0.0                  0.0 NULL                     0 NULL

-- Note
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
   'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') ' || 'D&P Reason Called Due updated from ' || UY.CurTypeDesc || ' to ' || UY.ReqTypeDesc || '.' as "Loan Note" 
	from DATAUPDT.HDTCalledDueReason_McDaid UY  
	where UY.ChangeRequired = -1
--	and   UY.SeqNum >= 100
Order by SeqNum 
; 
-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- ------------------------------------------------------------------------------------------------
--    101     1200414 N                                                                Per HDT 198096 (Jorge Solis) D&P Reason Called Due updated from <Blank> to 55-Called Due: Death.


/*
-- Notes
select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from celink.tblloannotes a  
	where a.INTSUBSERVICERLOANNUMBER in (3013779) 
	order by a.IDSLOANNOTES desc 
with ur;

*/
------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------
---- update
-- SEQNUM LOAN    DATECALLEDDUE CFILOANNUMBER CFIFIELDID CFIDATE    CFIDECIMAL   CFIBOOLEAN CREATIONDATE               CFIINT CFISTRING
-- ------ ------- ------------- ------------- ---------- ---------- ------------ ---------- -------------------------- ------ ---------
--    101 1200414 2025-08-22        1200414.0        103 2025-08-22 47926.680000       NULL 2025-08-22 11:35:06.828989   NULL NULL

--/* date need to be updated bulk?? use below merge with my val
MERGE INTO CELINK.tblstatustracking TT
USING
	(
	select 
	SeqNum, HDTNum, Requester, Loan, ReqType, ChangeRequired  
	from DATAUPDT.HDTCalledDueReason_McDaid P
	where ChangeRequired = -1
	) 
	UY (SeqNum, HDTNum, Requester, Loan, ReqType, ChangeRequired)
	ON  UY.Loan = TT.statusloan
WHEN MATCHED THEN UPDATE 
Set
	TT.CalledDueType = UY.ReqType
	, TT.CALLEDDUEDATE = date('2025-08-22')
;
--*/

/*
my val
-- SEQNUM HDTNUM REQUESTER   LOAN    REQTYPE CHANGEREQUIRED
-- ------ ------ ----------- ------- ------- --------------

*/


-- date consideration
--MERGE INTO CELINK.tblstatustracking TT
--USING
--(
--	select 
--	SeqNum, HDTNum, Requester, Loan, ReqType, ChangeRequired, CAFidate  
--	from --DATAUPDT.HDTCalledDueReason_McDaid P
--	(values
--
--(101, 0194659, 'Jorge Solis', 1252607, 57, -1, date('2025-07-08'))
--
--	) P (SeqNum, HDTNum, Requester, Loan, ReqType, ChangeRequired, CAFidate)
--	where ChangeRequired = -1
--)
--UY (SeqNum, HDTNum, Requester, Loan, ReqType, ChangeRequired, CAFidate)
--ON  UY.Loan = TT.statusloan
--WHEN MATCHED THEN UPDATE 
--Set
--	TT.CalledDueType = UY.ReqType, 
--	TT.CALLEDDUEDATE = UY.CAFidate
--;

-- SEQNUM HDTNUM REQUESTER   LOAN    REQTYPE CHANGEREQUIRED CAFIDATE
-- ------ ------ ----------- ------- ------- -------------- ----------
--    101 194659 Jorge Solis 1252607      57             -1 2025-07-08


--------------------------------------
-- Validation 
select 
	P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.ReqDesc, 

	P.ReqType, P.ReqTypeDesc,
	P.CurType, P.CurTypeDesc, 
	X.CalledDueType, CALLEDDUEDATE, Act1.CHRACTIONCODEDROPBOX,

	P.ChangeRequired  

	from DATAUPDT.HDTCalledDueReason_McDaid P

	inner join celink.tblstatustracking X
	on P.Loan = X.statusloan
	
	left outer join celink.tblactioncodesall Act1 
	on X.CalledDueType = Act1.IDSSTATUSCODE
	
--	where P.ChangeRequired = -1
	order by P.SeqNum
for read only with ur;
-- SEQNUM HDTNUM REQUESTER   LOAN    REQDESC                         REQTYPE REQTYPEDESC          CURTYPE CURTYPEDESC CALLEDDUETYPE CALLEDDUEDATE CHRACTIONCODEDROPBOX CHANGEREQUIRED
-- ------ ------ ----------- ------- ------------------------------- ------- -------------------- ------- ----------- ------------- ------------- -------------------- --------------
--    101 198096 Jorge Solis 1200414 from blank to Reason Called Due      55 55-Called Due: Death    NULL <Blank>                55 2025-08-22    55-Called Due: Death             -1

--------------------------------------------------------------------------
------** --Notes ... 
--------------------------------------------------------------------------
Insert into celink.tblLoanNotes 
(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)

Select 
--	SeqNum,	
	Loan as "Loan Number",
   'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') ' || 'D&P Reason Called Due updated from ' || UY.CurTypeDesc || ' to ' || UY.ReqTypeDesc || '.' as "Loan Note", 
   CURRENT_TIMESTAMP, 
	'tkato', 
	0,
	0
from DATAUPDT.HDTCalledDueReason_McDaid UY  
where UY.ChangeRequired = -1
-- -- and   UY.SeqNum >= 100
Order by SeqNum 
; 
-- Loan Number Loan Note                                                                                        3                         4     5 6
-- ----------- ------------------------------------------------------------------------------------------------ ------------------------- ----- - -
--     1200414 Per HDT 198096 (Jorge Solis) D&P Reason Called Due updated from <Blank> to 55-Called Due: Death. 2025-08-28 09:30:02.32803 tkato 0 0

select  
	SeqNum,	
	Loan as "Loan Number",
	T.*
from DATAUPDT.HDTCalledDueReason_McDaid UY  
inner join celink.tblLoanNotes T
on UY.loan = T.INTSUBSERVICERLOANNUMBER
and T.CHRLOANNOTES like '%Per%HDT%' || UY.HDTNum ||'%'
--and a.CHRLOANNOTES like '%HDT%'|| P.HDT || '%'

where UY.ChangeRequired = -1
Order by IDSLOANNOTES desc 
; 

-- SEQNUM Loan Number IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                     DTMNOTEDATE                CHRUSERID BLNPRIORITY CHRCATEGORY NOTESTEP STEPDATECOMPLETED
-- ------ ----------- ------------ ------------------------ ------------------------------------------------------------------------------------------------ -------------------------- --------- ----------- ----------- -------- -----------------
--    101     1200414    212976945                1200414.0 Per HDT 198096 (Jorge Solis) D&P Reason Called Due updated from <Blank> to 55-Called Due: Death. 2025-08-28 09:30:26.622413 tkato               0 NULL               0 NULL

--end

-- ------ ----------- ------------ ------------------------ ------------------------------------------------------------------------------------------------ -------------------------- --------- ----------- ----------- -------- -----------------
-- refs:
select  
	T.*
from celink.tblLoanNotes T
where T.INTSUBSERVICERLOANNUMBER = 1207136
order by IDSLOANNOTES desc
; 

-- IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         DTMNOTEDATE                CHRUSERID              BLNPRIORITY CHRCATEGORY          NOTESTEP STEPDATECOMPLETED
-- ------------ ------------------------ ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -------------------------- ---------------------- ----------- -------------------- -------- -----------------
--    175907964                1207136.0 Per HDT 154961 (Abraham Perez) D&P Reason Called Due updated from <Blank> to 56-Called Due: Non-Occupancy.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2024-02-02 00:41:51.637849 tkato                            0 NULL                        0 NULL
--    175906245                1207136.0 cron job changed value of reostatus from 50 to 43                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    2024-02-02 00:00:00.0      AWS_CRONBATCH                    0 reo                      9999 2024-02-02

--------------------------------------------------------------------------
------** --Notes ... use bulk upload ... no note needed as mentioned above
--------------------------------------------------------------------------
Select 
	SeqNum,	
	Loan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
   'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') ' || 'D&P Reason Called Due updated from ' || UY.CurTypeDesc || ' to ' || UY.ReqTypeDesc || '.' as "Loan Note" 
  -- 'Per HDT ' || UY.HDTNum || ' (' || UY.Requester || ') ' || 'D&P Reason Called Due updated from <Blank> ' || ' to ' || UY.ReqTypeDesc || '.' as "Loan Note" 
   
	from DATAUPDT.HDTCalledDueReason_McDaid UY  
	where UY.ChangeRequired = -1
	and   UY.SeqNum >= 100
Order by SeqNum 
; 

-- SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
-- ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------------------------------------------------
--    101     3127532 N                                                                Per HDT 150037 (Michael McDaid) D&P Reason Called Due updated from <Blank> to 55-Called Due: Death.

-- ------ ------ ------------- ------- ------------------------------------------------------------------------------------- ------- ---------------------------- ------- ------------------------------------ ------------- ---------------------------- --------------
-- ------ ------ ------------- ------- ------------------------------------------------------------------------------------- ------- ---------------------------- ------- ------------------------------------ ------------- ---------------------------- --------------

	