
/*
20221220
C:\Users\ted.kato\Documents\HDTUpdtNotes_117235.csv
HDT117235_InactivateDupBoardingLoan.sql

INCIDENT #117235
Stacey Henderson
Senior Investor Reporting Analyst
3 duplicate loans boarded 12/06/2022
Created: Dec 20, 2022 at 6:06 PM by Stacey Henderson
FHA numbers 223166432, 1064554828, 1942206579

Each boarded twice on 12/06/22. Will one of the duplicates be moved to inactive status soon?

--*--
Following 3 loans moved to inactive status. Pending verification.
3299032, 3299038, 3299054
*/

/*
20250527
[ID:0190772]
Inactivate loans
3366266 - 3366267

Issue: I boarded 2 loans by mistake when testing boarding in Stage via webservices. 
I used the wrong end point by mistake and two loans numbers were boarded. 
Reported them as soon as I noticed. Please deactivate, appreciate it and sorry for the inconvenience this may cause.
3366266 
3366267
*/

/* samples

--3253658	3411935634	RMF
--3253659	3411935634	RMF --< highlighted ... delete
--3253660	3411935634	RMF --< highlighted ... delete


----	Baad     Good
--(1, 3253659, 3253658),
--(2, 3253660, 3253658),

With Param (SeqNum, BaadLoan, GoodLoan) as
(values --Baad    Good
		(1, 3299032, 3299031),
		(2, 3299038, 3299037),
		(3, 3299054, 3299053)
)
*/


-----------------------------------------------------------------------------------------------------------
-- Notes
select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from celink.tblloannotes a  
--	where a.INTSUBSERVICERLOANNUMBER in (3299031, 3299032) 
--	where a.INTSUBSERVICERLOANNUMBER in (3299038, 3299037)
	where a.INTSUBSERVICERLOANNUMBER in (3366266, 3366267)
	order by a.INTSUBSERVICERLOANNUMBER, a.IDSLOANNOTES desc 
for read only with UR;

-- DTMNOTEDATE           IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                        CHRUSERID       BLNPRIORITY
-- --------------------- ------------ ------------------------ ----------------------------------------------------------------------------------------------------------------------------------- --------------- -----------
-- 2025-05-27 19:06:48.0    201628787                3366266.0 Per HDT 190772 This loan was boarded in error. Servicer ID set to Celink, SubServicer boarded as Celink. Loan has been inactivated. cking                     0
-- 2025-05-27 17:01:43.0    201624402                3366266.0 AB: Loan boarded on 05/27/2025                                                                                                      suzanne.sweileh           0

-- 2025-05-27 19:06:58.0    201628788                3366267.0 Per HDT 190772 This loan was boarded in error. Servicer ID set to Celink, SubServicer boarded as Celink. Loan has been inactivated. cking                     0
-- 2025-05-27 17:32:16.0    201625723                3366267.0 AB: Loan boarded on 05/27/2025                                                                                                      suzanne.sweileh           0

----------------------------------------------------------------------------------------------------------------------------------------------------------
--** Current loan status 
----------------------------------------------------------------------------------------------------------------------------------------------------------
With Param (SeqNum, BaadLoan, GoodLoan) as
(values --Baad    Good
		(1, 3299032, 3299031),
		(2, 3299038, 3299037),
		(3, 3299054, 3299053)
	
	(1, 0190772, 3366266),
	(2, 0190772, 3366267)
)
SELECT
	P.seqnum, P.BaadLoan, P.GoodLoan,
	TT.INTSUBSERVICERLOANNUMBER, TT.IDSSTATUSCODE, TT.* 
	FROM Param P
	inner join CELINK.LOANCURRENTSTATUS TT --see DDL_View_LOANCurrentStatus 
	on P.BaadLoan = TT.INTSUBSERVICERLOANNUMBER
order by SeqNum
for read only with ur;

-- SEQNUM BAADLOAN GOODLOAN INTSUBSERVICERLOANNUMBER IDSSTATUSCODE INTSUBSERVICERLOANNUMBER IDSSTATUSCODE BLNLOANSUSPENDED
-- ------ -------- -------- ------------------------ ------------- ------------------------ ------------- ----------------
--      1  3299032  3299031                3299032.0             0                3299032.0             0                0
--      2  3299038  3299037                3299038.0             0                3299038.0             0                0
--      3  3299054  3299053                3299054.0             0                3299054.0             0                0

-- SEQNUM BAADLOAN GOODLOAN INTSUBSERVICERLOANNUMBER IDSSTATUSCODE INTSUBSERVICERLOANNUMBER IDSSTATUSCODE BLNLOANSUSPENDED
-- ------ -------- -------- ------------------------ ------------- ------------------------ ------------- ----------------
--      1  3299032  3299031                3299032.0           110                3299032.0           110                0
--      2  3299038  3299037                3299038.0           110                3299038.0           110                0
--      3  3299054  3299053                3299054.0           110                3299054.0           110                0

----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... use bulk upload
----------------------------------------------------------------------------------------------------------------------------------------------------------
With Param (SeqNum, BaadLoan, GoodLoan) as
(values
	(1, 3299032, 3299031),
	(2, 3299038, 3299037),
	(3, 3299054, 3299053)
)
select	
	P.SeqNum, P.BaadLoan, 
	P.GoodLoan, 
--	'--Note->', 
	SeqNum,	
	P.BaadLoan as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
    'Per HDT117235 Loan set to inactive, duplicate of ' || P.GoodLoan || '.'

from Param P
order by P.SeqNum
for read only with ur
;
-- SEQNUM BAADLOAN GOODLOAN SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) 9
-- ------ -------- -------- ------ ----------- -------------- ---------------- -------------------------------- ---------------------------------------------------------
--      1  3299032  3299031      1     3299032 N                                                                Per HDT117235 Loan set to inactive, duplicate of 3299031.
--      2  3299038  3299037      2     3299038 N                                                                Per HDT117235 Loan set to inactive, duplicate of 3299037.
--      3  3299054  3299053      3     3299054 N                                                                Per HDT117235 Loan set to inactive, duplicate of 3299053.


----------------------------------------------------------------------------------------------------------------------------------------------------------
------** transaction
----------------------------------------------------------------------------------------------------------------------------------------------------------
select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT,
	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
	DTMTRANSACTIONCREATIONDATE, IDSUSERID     
	,* 
	from celink.TBLTRANSACTIONS 
--	where INTSUBSERVICERLOANNUMBER in (3299032, 3299038, 3299054)
	where INTSUBSERVICERLOANNUMBER in (3299031, 3299037, 3299053)
	
	order by INTSUBSERVICERLOANNUMBER, IDSTRANSID desc 
for read only with ur;

-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID      IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID      DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ------------------ ------------- -------------------- ---------------- -------------------------- -------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- -------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--                3299032.0   57858655                   1                100             0 Active               2022-12-02       2022-12-06                 svc_Plaza_Corp   57858655                   1                100 21                 3800             3800             0                3299032.0              0.0 000223166432     HECM        Line of Credit ARM 861         svc_Plaza_Corp 2022-12-06                 2022-12-02       2022-12-02     2022-11-28     2999-01-01               0.000000          247680.660000                    0.000000               1357.830000           12220.000000                 98.390000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   247680.660000 247680.660000 253565.000000 253565.000000      5884.340000  5884.340000     611000.000000         611000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       5884.340000   5884.340000  5884.340000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0           0.069             0.069              0.0604   0.0465    0.0225               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0
--                3299038.0   57859262                   2                101             0 Active               2022-11-30       2022-12-06                 svc_Longbridge   57859262                   2                101 31                 4800             4800             0                3299038.0              0.0 001064554828     HECM        Line of Credit ARM 861         svc_Longbridge 2022-12-06                 2022-11-30       2022-11-07     2022-11-02     2999-01-01             417.610000           95979.820000                  387.500000                  0.000000            7330.110000                  0.000000             387.500000         30.110000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000    95562.210000  95979.820000 170455.000000 171440.090000        67.480000   202.540000     365000.000000         365000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            74825.310000        75257.730000         67.480000    202.540000   202.540000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.06435           0.06435             0.05045   0.0456   0.01875               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0
--                3299038.0   57859260                   1                100             0 Active               2022-11-07       2022-12-06                 svc_Longbridge   57859260                   1                100 31                 4800             4800             0                3299038.0              0.0 001064554828     HECM        Line of Credit ARM 861         svc_Longbridge 2022-12-06                 2022-11-07       2022-11-07     2022-11-02     2999-01-01               0.000000           95562.210000                    0.000000                387.500000            7300.000000                 30.110000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000    95562.210000  95562.210000 170455.000000 170455.000000        67.480000    67.480000     365000.000000         365000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            74825.310000        74825.310000         67.480000     67.480000    67.480000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.06435           0.06435             0.05045   0.0456   0.01875               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0
--                3299054.0   57859954                   1                100             0 Active               2022-12-05       2022-12-06                 svc_Plaza_Corp   57859954                   1                100 21                 3800             3800             0                3299054.0              0.0 001942206579     HECM        Line of Credit ARM 861         svc_Plaza_Corp 2022-12-06                 2022-12-05       2022-12-05     2022-11-29     2999-01-01               0.000000          115084.240000                    0.000000                574.660000            9100.000000                 40.990000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   115084.240000 115084.240000 171990.000000 171990.000000     32193.580000 32193.580000     455000.000000         455000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            24712.180000        24712.180000      32193.580000  32193.580000 32193.580000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0701            0.0701              0.0604   0.0476    0.0225               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0

-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID      IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID      DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ------------------ ------------- -------------------- ---------------- -------------------------- -------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- -------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--                3299031.0   57858654                   1                100             0 Active               2022-12-02       2022-12-06                 svc_Plaza_Corp   57858654                   1                100 21                 3800             3800             0                3299031.0              0.0 000223166432     HECM        Line of Credit ARM 861         svc_Plaza_Corp 2022-12-06                 2022-12-02       2022-12-02     2022-11-28     2999-01-01               0.000000          247680.660000                    0.000000               1357.830000           12220.000000                 98.390000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   247680.660000 247680.660000 253565.000000 253565.000000      5884.340000  5884.340000     611000.000000         611000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       5884.340000   5884.340000  5884.340000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0           0.069             0.069              0.0604   0.0465    0.0225               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0
--                3299037.0   57859261                   2                101             0 Active               2022-11-30       2022-12-06                 svc_Longbridge   57859261                   2                101 31                 4800             4800             0                3299037.0              0.0 001064554828     HECM        Line of Credit ARM 861         svc_Longbridge 2022-12-06                 2022-11-30       2022-11-07     2022-11-02     2999-01-01             417.610000           95979.820000                  387.500000                  0.000000            7330.110000                  0.000000             387.500000         30.110000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000    95562.210000  95979.820000 170455.000000 171440.090000        67.480000   202.540000     365000.000000         365000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            74825.310000        75257.730000         67.480000    202.540000   202.540000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.06435           0.06435             0.05045   0.0456   0.01875               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0
--                3299037.0   57859259                   1                100             0 Active               2022-11-07       2022-12-06                 svc_Longbridge   57859259                   1                100 31                 4800             4800             0                3299037.0              0.0 001064554828     HECM        Line of Credit ARM 861         svc_Longbridge 2022-12-06                 2022-11-07       2022-11-07     2022-11-02     2999-01-01               0.000000           95562.210000                    0.000000                387.500000            7300.000000                 30.110000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000    95562.210000  95562.210000 170455.000000 170455.000000        67.480000    67.480000     365000.000000         365000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            74825.310000        74825.310000         67.480000     67.480000    67.480000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.06435           0.06435             0.05045   0.0456   0.01875               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0
--                3299053.0   57859955                   1                100             0 Active               2022-12-05       2022-12-06                 svc_Plaza_Corp   57859955                   1                100 21                 3800             3800             0                3299053.0              0.0 001942206579     HECM        Line of Credit ARM 861         svc_Plaza_Corp 2022-12-06                 2022-12-05       2022-12-05     2022-11-29     2999-01-01               0.000000          115084.240000                    0.000000                574.660000            9100.000000                 40.990000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   115084.240000 115084.240000 171990.000000 171990.000000     32193.580000 32193.580000     455000.000000         455000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            24712.180000        24712.180000      32193.580000  32193.580000 32193.580000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0701            0.0701              0.0604   0.0476    0.0225               -1                0 Active                 0.000000      NULL NULL        NULL                      0.0


-------------------------------------------------------------------------------------------------------------------------------------------
-- check current values ... using max count
-------------------------------------------------------------------------------------------------------------------------------------------
With Param (SeqNum, BaadLoan, GoodLoan) as
(values

	(1, 3299032, 3299031),
	(2, 3299038, 3299037),
	(3, 3299054, 3299053)
)
select
	P.SeqNum, P.BaadLoan,  
	TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSID, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.CHRPAYTYPE, 
	TT.CURTRANSACTIONAMT        as "Amount",
	TT.CURTOTALUPB              as "Total UPB",
	TT.CURUNSCHEDULEDPAYMENTUPB as "USP UPB", 
	TT.CURSCHEDULEDPAYMENTUPB   as "SP UPB",
	TT.CURTRANSACTIONINTEREST   as "TransInt",
	TT.CURTRANSACTIONMIP        as "TransMIP",
	TT.CURTRANSACTIONSERVICEFEE as "ServiceFee"
from  Param P
inner join celink.tbltransactions TT
	on  P.BaadLoan = TT.INTSUBSERVICERLOANNUMBER
inner join CELINK.CHOOSELASTRECORD XX  
	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 

/* ****
-- my test below when a ticket is resolved and the last trans is already shows the inserted 105 
inner join celink.tbltransactions T2
	on  P.loan = T2.INTSUBSERVICERLOANNUMBER
	and T2.IDSTRANSACTIONCOUNT = 
	( 
	SELECT 
	--	max(IDSTRANSACTIONCOUNT)  
		max(IDSTRANSACTIONCOUNT) -1 -- for tesing  
	from celink.tbltransactions where INTSUBSERVICERLOANNUMBER = P.loan
	)  
*/	
order by P.SeqNum
with ur;	

-- SEQNUM BAADLOAN INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE CHRPAYTYPE     Amount     Total UPB     USP UPB  SP UPB        TransInt   TransMIP  ServiceFee
-- ------ -------- ------------------------ ---------- ------------------- ------------------ -------------- ---------- ------------- -------- ------------- ---------- --------- ----------
--      1  3299032                3299032.0   57858655                   1                100 Line of Credit   0.000000 247680.660000 0.000000 247680.660000   0.000000  0.000000        0.0
--      2  3299038                3299038.0   57859262                   2                101 Line of Credit 417.610000  95979.820000 0.000000  95979.820000 387.500000 30.110000        0.0
--      3  3299054                3299054.0   57859954                   1                100 Line of Credit   0.000000 115084.240000 0.000000 115084.240000   0.000000  0.000000        0.0

----------------------------------------------------------------------------------------------------------------------------------
-- the last trans before insert from above
----------------------------------------------------------------------------------------------------------------------------------
-- SEQNUM BAADLOAN INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE CHRPAYTYPE     Amount     Total UPB     USP UPB  SP UPB        TransInt   TransMIP  ServiceFee
-- ------ -------- ------------------------ ---------- ------------------- ------------------ -------------- ---------- ------------- -------- ------------- ---------- --------- ----------
--      1  3299032                3299032.0   57858655                   1                100 Line of Credit   0.000000 247680.660000 0.000000 247680.660000   0.000000  0.000000        0.0
--      2  3299038                3299038.0   57859262                   2                101 Line of Credit 417.610000  95979.820000 0.000000  95979.820000 387.500000 30.110000        0.0
--      3  3299054                3299054.0   57859954                   1                100 Line of Credit   0.000000 115084.240000 0.000000 115084.240000   0.000000  0.000000        0.0

 
----------------------------------------------------------------------------------------------------------------------------------
-- validation right before insert
----------------------------------------------------------------------------------------------------------------------------------
-- SEQNUM ROWCOUNT IdsTransactionCode IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IdsStatusCode INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IdsUserID DtmTransactionCreationDate DtmEffectiveDate DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CurTransactionAmt CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------ -------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--      1        2                110 21                 3800             3800           110                3299032.0              0.0 000223166432     HECM        Line of Credit ARM 861         tkato     2022-12-20                 2022-12-20       2022-12-02     2022-11-28     2999-01-01                   0.00          247680.660000                    0.000000               1357.830000           12220.000000                 98.390000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   247680.660000 247680.660000 253565.000000 253565.000000      5884.340000  5884.340000     611000.000000         611000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       5884.340000   5884.340000  5884.340000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0           0.069             0.069              0.0604   0.0465    0.0225               -1                0 Inactive               0.000000      NULL NULL        NULL                      0.0
--      2        3                110 31                 4800             4800           110                3299038.0              0.0 001064554828     HECM        Line of Credit ARM 861         tkato     2022-12-20                 2022-12-20       2022-11-07     2022-11-02     2999-01-01                   0.00           95979.820000                  387.500000                  0.000000            7330.110000                  0.000000             387.500000         30.110000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000    95562.210000  95979.820000 170455.000000 171440.090000        67.480000   202.540000     365000.000000         365000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            74825.310000        75257.730000         67.480000    202.540000   202.540000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.06435           0.06435             0.05045   0.0456   0.01875               -1                0 Inactive               0.000000      NULL NULL        NULL                      0.0
--      3        2                110 21                 3800             3800           110                3299054.0              0.0 001942206579     HECM        Line of Credit ARM 861         tkato     2022-12-20                 2022-12-20       2022-12-05     2022-11-29     2999-01-01                   0.00          115084.240000                    0.000000                574.660000            9100.000000                 40.990000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   115084.240000 115084.240000 171990.000000 171990.000000     32193.580000 32193.580000     455000.000000         455000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            24712.180000        24712.180000      32193.580000  32193.580000 32193.580000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0701            0.0701              0.0604   0.0476    0.0225               -1                0 Inactive               0.000000      NULL NULL        NULL                      0.0

----------------------------------------------------------------------------------------------------------------------------------
-- validation right AFTER insert
----------------------------------------------------------------------------------------------------------------------------------
-- SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSUSERID      IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURTRANSACTIONSERVICEFEE BLNLOANSUSPENDED INTSUBSERVICERLOANNUMBER CURUNSCHEDULEDPAYMENTUPB CURTOTALUPB   IDSPOOLID IDSSERVICERID IDSSUBSERVICERID INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND CUR1098MIP INTVENDOR CHRMEMO INTPAYTO
-- ------ ------------------------ ------------------- ------------------ -------------- ------------- -------------------- -------------------------- ---------------- ----------------- ---------------------- ----------------- ------------------------ ---------------- ------------------------ ------------------------ ------------- --------- ------------- ---------------- ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------- --------- ------- --------
--      1                3299032.0                   2                110 tkato                    110 Inactive             2022-12-20                 2022-12-20                0.000000               0.000000          0.000000                      0.0                0                3299032.0                 0.000000 247680.660000 21                 3800             3800              0.0 000223166432     HECM        Line of Credit ARM 861         2022-12-02     2022-11-28     2999-01-01               247680.660000                    0.000000               1357.830000           12220.000000                 98.390000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   247680.660000 253565.000000 253565.000000      5884.340000  5884.340000     611000.000000         611000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       5884.340000   5884.340000  5884.340000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0           0.069             0.069              0.0604   0.0465    0.0225               -1   0.000000      NULL NULL        NULL
--      1                3299032.0                   1                100 svc_Plaza_Corp             0 Active               2022-12-06                 2022-12-02                0.000000               0.000000          0.000000                      0.0                0                3299032.0                 0.000000 247680.660000 21                 3800             3800              0.0 000223166432     HECM        Line of Credit ARM 861         2022-12-02     2022-11-28     2999-01-01               247680.660000                    0.000000               1357.830000           12220.000000                 98.390000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   247680.660000 253565.000000 253565.000000      5884.340000  5884.340000     611000.000000         611000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       5884.340000   5884.340000  5884.340000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0           0.069             0.069              0.0604   0.0465    0.0225               -1   0.000000      NULL NULL        NULL

--      2                3299038.0                   3                110 tkato                    110 Inactive             2022-12-20                 2022-12-20                0.000000             387.500000         30.110000                      0.0                0                3299038.0                 0.000000  95979.820000 31                 4800             4800              0.0 001064554828     HECM        Line of Credit ARM 861         2022-11-07     2022-11-02     2999-01-01                95979.820000                  387.500000                  0.000000            7330.110000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000    95562.210000 170455.000000 171440.090000        67.480000   202.540000     365000.000000         365000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            74825.310000        75257.730000         67.480000    202.540000   202.540000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.06435           0.06435             0.05045   0.0456   0.01875               -1   0.000000      NULL NULL        NULL
--      2                3299038.0                   2                101 svc_Longbridge             0 Active               2022-12-06                 2022-11-30              417.610000             387.500000         30.110000                      0.0                0                3299038.0                 0.000000  95979.820000 31                 4800             4800              0.0 001064554828     HECM        Line of Credit ARM 861         2022-11-07     2022-11-02     2999-01-01                95979.820000                  387.500000                  0.000000            7330.110000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000    95562.210000 170455.000000 171440.090000        67.480000   202.540000     365000.000000         365000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            74825.310000        75257.730000         67.480000    202.540000   202.540000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.06435           0.06435             0.05045   0.0456   0.01875               -1   0.000000      NULL NULL        NULL

--      3                3299054.0                   2                110 tkato                    110 Inactive             2022-12-20                 2022-12-20                0.000000               0.000000          0.000000                      0.0                0                3299054.0                 0.000000 115084.240000 21                 3800             3800              0.0 001942206579     HECM        Line of Credit ARM 861         2022-12-05     2022-11-29     2999-01-01               115084.240000                    0.000000                574.660000            9100.000000                 40.990000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   115084.240000 171990.000000 171990.000000     32193.580000 32193.580000     455000.000000         455000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            24712.180000        24712.180000      32193.580000  32193.580000 32193.580000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0701            0.0701              0.0604   0.0476    0.0225               -1   0.000000      NULL NULL        NULL
--      3                3299054.0                   1                100 svc_Plaza_Corp             0 Active               2022-12-06                 2022-12-05                0.000000               0.000000          0.000000                      0.0                0                3299054.0                 0.000000 115084.240000 21                 3800             3800              0.0 001942206579     HECM        Line of Credit ARM 861         2022-12-05     2022-11-29     2999-01-01               115084.240000                    0.000000                574.660000            9100.000000                 40.990000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   115084.240000 171990.000000 171990.000000     32193.580000 32193.580000     455000.000000         455000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            24712.180000        24712.180000      32193.580000  32193.580000 32193.580000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0701            0.0701              0.0604   0.0476    0.0225               -1   0.000000      NULL NULL        NULL

--/* ************************************************************** -- UPDATE ... insert trans by copying the last transaction  	

Insert into celink.TBLTRANSACTIONS 
(
--IDSTRANSID --	,
IDSTRANSACTIONCOUNT ,
IDSTRANSACTIONCODE 	,
IDSPOOLID 	,
IDSSERVICERID 	,
IDSSUBSERVICERID 	,
IDSSTATUSCODE 	,
INTSUBSERVICERLOANNUMBER 	,
INTFMALOANNUMBER 	,
INTFHACASENUMBER 	,
CHRLOANTYPE 	,
CHRPAYTYPE 	,
CHRINTERESTTYPE 	,
IDSUSERID,
DTMTRANSACTIONCREATIONDATE ,
DTMEFFECTIVEDATE 	,
DTMFUNDINGDATE 	,
DTMCLOSINGDATE 	,
DTMPURCHASEDATE 	,
CURTRANSACTIONAMT 	,
CURSCHEDULEDPAYMENTUPB 	,
CURSCHEDULEDPAYMENTINTEREST 	,
CURSCHEDULEDPAYINTACCRUED 	,
CURSCHEDULEDPAYMENTMIP 	,
CURSCHEDULEDPAYMIPACCRUED 	,
CURTRANSACTIONINTEREST 	,
CURTRANSACTIONMIP 	,
CURUNSCHEDULEDPAYMENTUPB 	,
CURUNSCHEDULEDPAYMENTINTEREST 	,
CURUNSCHEDULEDPAYINTACCRUED 	,
CURUNSCHEDULEDPAYMENTMIP 	,
CURUNSCHEDULEDPAYMIPACCRUED 	,
CURREPAYMENTBALANCE 	,
CURREPAYMENTINTEREST 	,
CURREPAYMENTMIP 	,
CURORIGTOTALUBP 	,
CURTOTALUPB   	,
CURORIGINALPL 	,
CURCURRENTPL  	,
CURORIGINALNETPL 	,
CURNETPL    	,
CURMAXCLAIMAMOUNT 	,
CURPROPAPPRAISEDVALUE 	,
CURORIGSERVICEFEESETASIDE 	,
CURSERVICEFEESETASIDE 	,
CURORIGREPAIRSSETASIDE 	,
CURREPAIRSSETASIDE 	,
CURORGFRSTYRPROPCHARGESETASIDE 	,
CURFIRSTYRPROPCHARGESETASIDE 	,
CURORIGTAXINSURSETASIDE 	,
CURTAXINSURSETASIDE 	,
CURORIGLOCRESERVE 	,
CURLOCRESERVE 	,
CURNETLOC 	,
CURSERVICEFEES 	,
CURACCRUEDSERVICEFEES 	,
CURPLANCHANGESERVICEFEES 	,
CURACCRUEDPLANCHANGEFEES 	,
CUR1098INTEREST 	,
CURMNTHLYPAYMENTS 	,
CURMNTHLYWITHHOLD 	,
CHRPLANCHANGEREASON 	,
INTTERMMONTHS 	,
INTTERMMONTHSLEFT 	,
INTBEGININTRATE 	,
INTCURRENTINTRATE 	,
INTEXPECTAVGINTRATE 	,
INTINDEX 	,
INTMARGIN 	,
BLNINTERESTROUND 	,
BLNLOANSUSPENDED 	,
CHRLOANSTATUSREMARKS 	,
CUR1098MIP 	,
INTVENDOR 	,
CHRMEMO 	,
INTPAYTO 	,
CURTRANSACTIONSERVICEFEE
)

--************************************************************** */ -- UPDATE ... insert trans by copying the last transaction  	

-- select the last trans as source
select
	-- -- -- 	IDSTRANSID --	,
	-- -- -- 	D.SeqNum,  -->>> test purpose
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount, -- -- 5   as "IdsTransactionCount",    --IDSTRANSACTIONCOUNT ,
	110	as "IdsTransactionCode", --IDSTRANSACTIONCODE
	
	IDSPOOLID 	,
	IDSSERVICERID 	,
	IDSSUBSERVICERID 	,
	
	110 as "IdsStatusCode", -- IDSSTATUSCODE 	,
	
	INTSUBSERVICERLOANNUMBER 	,
	INTFMALOANNUMBER 	,
	INTFHACASENUMBER 	,
	CHRLOANTYPE 	,
	CHRPAYTYPE 	,
	CHRINTERESTTYPE 	,
	
	'tkato' as "IdsUserID", --IDSUSERID 	,
	CURRENT_DATE as "DtmTransactionCreationDate", -- date ('2021-11-30') as "DtmTransactionCreationDate", --DTMTRANSACTIONCREATIONDATE ,
	CURRENT_DATE as  "DtmEffectiveDate",          --date ('2021-11-30') as "DtmEffectiveDate", --DTMEFFECTIVEDATE
	
	DTMFUNDINGDATE 	,
	DTMCLOSINGDATE 	,
	DTMPURCHASEDATE 	,
	
	0.00 as "CurTransactionAmt", --CURTRANSACTIONAMT 	,
	
	CURSCHEDULEDPAYMENTUPB 	,
	CURSCHEDULEDPAYMENTINTEREST 	,
	CURSCHEDULEDPAYINTACCRUED 	,
	CURSCHEDULEDPAYMENTMIP 	,
	CURSCHEDULEDPAYMIPACCRUED 	,
	CURTRANSACTIONINTEREST 	,
	CURTRANSACTIONMIP 	,
	CURUNSCHEDULEDPAYMENTUPB 	,
	CURUNSCHEDULEDPAYMENTINTEREST 	,
	CURUNSCHEDULEDPAYINTACCRUED 	,
	CURUNSCHEDULEDPAYMENTMIP 	,
	CURUNSCHEDULEDPAYMIPACCRUED 	,
	CURREPAYMENTBALANCE 	,
	
	CURREPAYMENTINTEREST 	, --0.00 , --CURREPAYMENTINTEREST 	,
	
	CURREPAYMENTMIP 	,
	CURORIGTOTALUBP 	,
	CURTOTALUPB   	,
	CURORIGINALPL 	,
	
	CURCURRENTPL  	, --0.00, -- CURCURRENTPL  	, -- total available funding --<???????????????????????????????????????????
	
	CURORIGINALNETPL 	,
	CURNETPL    	,
	CURMAXCLAIMAMOUNT 	,
	CURPROPAPPRAISEDVALUE 	,
	CURORIGSERVICEFEESETASIDE 	,
	CURSERVICEFEESETASIDE 	,
	CURORIGREPAIRSSETASIDE 	,
	CURREPAIRSSETASIDE 	,
	CURORGFRSTYRPROPCHARGESETASIDE 	,
	CURFIRSTYRPROPCHARGESETASIDE 	,
	
	CURORIGTAXINSURSETASIDE	,
	CURTAXINSURSETASIDE	,  
	
	CURORIGLOCRESERVE 	,
	CURLOCRESERVE 	,
	CURNETLOC 	,
	CURSERVICEFEES 	,
	CURACCRUEDSERVICEFEES 	,
	CURPLANCHANGESERVICEFEES 	,
	CURACCRUEDPLANCHANGEFEES 	,
	CUR1098INTEREST 	,
	CURMNTHLYPAYMENTS 	,
	CURMNTHLYWITHHOLD 	,
	CHRPLANCHANGEREASON 	,
	INTTERMMONTHS 	,
	INTTERMMONTHSLEFT 	,
	INTBEGININTRATE 	,
	INTCURRENTINTRATE 	,
	INTEXPECTAVGINTRATE 	,
	INTINDEX 	,
	INTMARGIN 	,
	BLNINTERESTROUND 	,
	BLNLOANSUSPENDED 	,
	'Inactive' as CHRLOANSTATUSREMARKS 	,
	CUR1098MIP 	,
	INTVENDOR 	,
	CHRMEMO 	,
	INTPAYTO 	,
	CURTRANSACTIONSERVICEFEE	

FROM  --DATAUPDT.HDTInActDupBoardedLoan D
(Values
	(1, 3299032, 3299031),
	(2, 3299038, 3299037),
	(3, 3299054, 3299053)
) D (SeqNum, BaadLoan, GoodLoan)
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.BaadLOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
order by D.SeqNum
;	  
  
		------------------------------------------------------
		-- validation AFTER inactivate post 

		select 
			D.SeqNum,
			A.INTSUBSERVICERLOANNUMBER, 
		
		IDSTRANSACTIONCOUNT,  -- as RowCount,
		IDSTRANSACTIONCODE,   -- as RowCode,
		IDSUSERID,            -- as UserID,
		
		IDSSTATUSCODE,        -- as StatusCode,
		CHRLOANSTATUSREMARKS, -- as StatusRemarks, 
		
		DTMTRANSACTIONCREATIONDATE, -- as CreationDate,
		DTMEFFECTIVEDATE,           -- as EffectiveDate,
		
		CURTRANSACTIONAMT,        -- as TransAmount,
		CURTRANSACTIONINTEREST,   -- as TransInterest,
		CURTRANSACTIONMIP,        -- as TransMIP,
		CURTRANSACTIONSERVICEFEE, -- as TransServiceFee,
		
		BLNLOANSUSPENDED,         -- as LoanSuspended, 
		
		INTSUBSERVICERLOANNUMBER, -- as LoanNum
		
		--
		CURUNSCHEDULEDPAYMENTUPB,  
		CURTOTALUPB,  
		
		IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, 
		--A.IDSSTATUSCODE, 
		--A.INTSUBSERVICERLOANNUMBER,  
		INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
		DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE,
		CURSCHEDULEDPAYMENTUPB,  
		CURSCHEDULEDPAYMENTINTEREST, 
		CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
		-- -- --CURUNSCHEDULEDPAYMENTUPB, 
		CURUNSCHEDULEDPAYMENTINTEREST,  
		CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
		CURREPAYMENTMIP, CURORIGTOTALUBP,  

		-- -- --CURTOTALUPB, 
		CURORIGINALPL, CURCURRENTPL, 
		CURORIGINALNETPL, 

		CURNETPL	,	--	41 *****	
		
		CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
		CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, 
		CURORIGTAXINSURSETASIDE, 

		CURTAXINSURSETASIDE	,	--	51 *****

		CURORIGLOCRESERVE,  CURLOCRESERVE, 
		CURNETLOC	,	--	54 *****	
	
		CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
	
		CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
		INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
		INTINDEX, INTMARGIN, BLNINTERESTROUND,  
		--BLNLOANSUSPENDED, 
		--CHRLOANSTATUSREMARKS, 
		CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO 

		FROM  --DATAUPDT.HDTInActDupBoardedLoan D
		(Values
			(1, 3299032, 3299031),
			(2, 3299038, 3299037),
			(3, 3299054, 3299053)
		) D (SeqNum, BaadLoan, GoodLoan)

		INNER JOIN CELINK.TBLTRANSACTIONS A
			on 	D.BaadLOAN = A.INTSUBSERVICERLOANNUMBER 
		
		inner join CELINK.CHOOSELASTRECORD C
			on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
			AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 1  -- fecth the last one and newly inserted
		
		order by D.SeqNum, IDSTRANSACTIONCOUNT desc
		for read only with ur
		;
		  


-- ------ -------- -------- ------------------------ -------- ---------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- ---------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ----------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
-- check tblLoanData right before update
-- ------ -------- -------- ------------------------ -------- ---------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- ---------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ----------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
With Param (SeqNum, BaadLoan, GoodLoan) as
(values

	(1, 3299032, 3299031),
	(2, 3299038, 3299037),
	(3, 3299054, 3299053)

)
SELECT
	P.seqnum, P.BaadLoan, P.GoodLoan,
	TT.INTSUBSERVICERLOANNUMBER,
	TT.LIVELOAN
	, TT.INTCEILING
	, TT.* 
	from Param P
	inner join celink.tblLoanData TT 
	on P.BaadLoan = TT.INTSUBSERVICERLOANNUMBER
order by SeqNum
for read only with ur; 

-- SEQNUM BAADLOAN GOODLOAN INTSUBSERVICERLOANNUMBER LIVELOAN INTCEILING INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- ------ -------- -------- ------------------------ -------- ---------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--      1  3299032  3299031                3299032.0       -1       0.05                3299032.0          3800             3800 HECM        ARM 861         2022-12-06                 2022-12-02 00:00:00.0 2022-11-28 00:00:00.0         611000.000000                           0.0 Line of Credit 100109802522100103 N             N         2023-01-01              0                     0.000000 2022-12-06                          2 1                  0.005 Y                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                            -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Plaza Home Mortgage, Inc.                 247680.660000 2022-10-12                 0       0.05      0.0                1.0                 1        0.069               25356.5                222324.16      19985.0 0.119000 0.069000                0.0             NULL NULL            0.000000   0.000000          0            2022-12-06              0.0              0.000000 2022-12-06   
--      2  3299038  3299037                3299038.0       -1       0.05                3299038.0          4800             4800 HECM        ARM 861         2022-12-06                 2022-11-07 00:00:00.0 2022-11-02 00:00:00.0         365000.000000                           0.0 Line of Credit 101167500027572829 N             N         2023-01-01              0                     0.000000 2022-12-06                          2 1                  0.005 Y                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                            -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 The Money House, Inc.                     102273.000000 2022-09-23                 0       0.05      0.0                1.0                 1      0.06435                   0.0                 24422.44     13420.86 0.114350 0.064350                0.0             NULL NULL            0.000000   0.000000          0            2022-12-06              0.0              0.000000 2022-12-06   
--      3  3299054  3299053                3299054.0       -1       0.05                3299054.0          3800             3800 HECM        ARM 861         2022-12-06                 2022-12-05 00:00:00.0 2022-11-29 00:00:00.0         455000.000000                           0.0 Line of Credit 100109802522100087 N             N         2023-01-01              0                     0.000000 2022-12-06                          2 1                  0.005 Y                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                            -1      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Plaza Home Mortgage, Inc.                 117023.110000 2022-10-21                 0       0.05      0.0                1.0                 1       0.0701              13829.11                 99824.11     18737.59 0.120100 0.070100                0.0             NULL NULL            0.000000   0.000000          0            2022-12-06              0.0              0.000000 2022-12-06   

-- SEQNUM BAADLOAN GOODLOAN INTSUBSERVICERLOANNUMBER LIVELOAN INTCEILING INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- ------ -------- -------- ------------------------ -------- ---------- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- -------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------
--      1  3299032  3299031                3299032.0        0       0.05                3299032.0          3800             3800 HECM        ARM 861         2022-12-06                 2022-12-02 00:00:00.0 2022-11-28 00:00:00.0         611000.000000                           0.0 Line of Credit 100109802522100103 N             N         2023-01-01              0                     0.000000 2022-12-06                          2 1                  0.005 Y                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                             0      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Plaza Home Mortgage, Inc.                 247680.660000 2022-10-12                 0       0.05      0.0                1.0                 1        0.069               25356.5                222324.16      19985.0 0.119000 0.069000                0.0             NULL NULL            0.000000   0.000000          0            2022-12-06              0.0              0.000000 2022-12-06   
--      2  3299038  3299037                3299038.0        0       0.05                3299038.0          4800             4800 HECM        ARM 861         2022-12-06                 2022-11-07 00:00:00.0 2022-11-02 00:00:00.0         365000.000000                           0.0 Line of Credit 101167500027572829 N             N         2023-01-01              0                     0.000000 2022-12-06                          2 1                  0.005 Y                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                             0      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 The Money House, Inc.                     102273.000000 2022-09-23                 0       0.05      0.0                1.0                 1      0.06435                   0.0                 24422.44     13420.86 0.114350 0.064350                0.0             NULL NULL            0.000000   0.000000          0            2022-12-06              0.0              0.000000 2022-12-06   
--      3  3299054  3299053                3299054.0        0       0.05                3299054.0          3800             3800 HECM        ARM 861         2022-12-06                 2022-12-05 00:00:00.0 2022-11-29 00:00:00.0         455000.000000                           0.0 Line of Credit 100109802522100087 N             N         2023-01-01              0                     0.000000 2022-12-06                          2 1                  0.005 Y                        0.0                  0.0 N                -1                0 0.000000        0.000000                                                                                                             0      0 NULL           NULL                   NULL           NULL                                       0 en-us                  0.0           1 Plaza Home Mortgage, Inc.                 117023.110000 2022-10-21                 0       0.05      0.0                1.0                 1       0.0701              13829.11                 99824.11     18737.59 0.120100 0.070100                0.0             NULL NULL            0.000000   0.000000          0            2022-12-06              0.0              0.000000 2022-12-06   


/* Update tblLoanData ************************************************************************************************* UPDATE
(SeqNum, BaadLoan, GoodLoan)
(1, 3299032, 3299031),
(2, 3299038, 3299037),
(3, 3299054, 3299053)

--do it at the bottom

UPDATE celink.tblLoanData  set LIVELOAN = 0 where INTSUBSERVICERLOANNUMBER = 3299032;
UPDATE celink.tblLoanData  set LIVELOAN = 0 where INTSUBSERVICERLOANNUMBER = 3299038;
UPDATE celink.tblLoanData  set LIVELOAN = 0 where INTSUBSERVICERLOANNUMBER = 3299054;


******************************************************************************************************************************** */

























