/*
20240709
sample HDT's
(1001, 166921, 'Noeker', 3292964, -478.66, date('07/08/2024'), 81),
(1002, 166921, 'Noeker', 3292964, -71.8, date('07/08/2024'), 81),
(2001, 166913, 'Wendel', 3277307, -2295.28, date('07/08/2024'), 81),
(3001, 166877, 'Rayman', 3296250, -200, date('07/05/2024'), 81)
* from KT 20240716
posting 81 
liquidated loan 70s ,, CURTRANSACTIONINTEREST CURTRANSACTIONMIP must be zero
*/

/*
20240731
[ID:0168998]
Force Post Transaction
8/1/2024 9:14 AM
Jessica Ambs

Force Post Transaction 8.1.24.xlsx

--[10:17 AM] Ted Kato
For force post 44, should the calculation be the same as 81?
Transaction amount
Transaction amount * (interest rate / 365) * Number of days
Transaction amount * (mip rate / 365) * Number of days
UPB + Transaction amount
Unscheduled UPB + transaction amount
NetPL - Transaction amount
NetLOC - Transaction amount
 
[10:17 AM] Cyndie King
Exactly the same.
 
="("&K2&", 0168998, 'Jessica Ambs', " & A2 & ", " & B2 & ", date('" & TEXT(C2,"MM/DD/YYYY") & "'), " & D2 & "),"

*/


/* ---------------------------------------------------------------------------------------------------------------------------
Peer verified.  1 transaction.
Peer verified.  3 transactions.
--Force Post.xlsx
--="("&K2&", "&L2&", "&M2& ", " & A2 & ", " & B2 & ", date('" & TEXT(C2,"MM/DD/YYYY") & "'), " & D2 & "),"
--="("&K2&", 0068207, 'Michael Wendel', " & A2 & ", " & B2 & ", date('" & TEXT(C2,"MM/DD/YYYY") & "'), " & D2 & "),"
="("& K2  & ", 165175, 'Nagle', " & A2 & ", " & B2 & ", date('" & TEXT(D2,"MM/DD/YYYY") & "'), " & C2 & "), --Nagle Format"
*/ ----------------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250827
[SR-0198087]  3204434 URGENT Force post LOC draw 44 needed  8/27/2025 12:36 PM  Created by  Shay Beverly
Please FORCE post a 44 LOC transaction in the amount of $10,000.00 on this loan. The LOC draw was originally processed 8.26.2025 by the LOC team however during batch release today by IR it gave an error and will not allow posting on our end. We reviewed the loan and determined that this loan does have fund available to withdrawal. It looks like this is not allowing the transaction to post because the logic isn't taking the $1M prepayment the borrower made into consideration.  The loan note says the borrower is entitled to redraw any portion of the LOC they prepay. 
Recap -Force post 44 LOC draw transaction iao 10K. 
(1, 0198087, 'Shay Beverly', 3204434, 10000.00, date('08/27/2025'), 44)
*/

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
select 
	TT.INTSUBSERVICERLOANNUMBER,
--	TT.INITIALDISBURSEMENTLIMIT, --Initial Disbursement Limi
--	TT.DTMClosingDate, 
	TT.DTMFUNDINGDATE, --Funding Date
	TT.DATEFIRSTIRC, --IRC
--	TT.BEGININTRATE, -- Rate_At_Closing
	TT.DBLMIPRATE "**DBLMIPRATE**",
	TT.CHRSUBLOANTYPE, 
	TT.CHRLOANTYPE,
	'-->--', 	*
	from CELINK.TBLLOANDATA TT where TT.INTSUBSERVICERLOANNUMBER in (1409832)
for read only with ur;

----------------------------------------------------------------------------------------
---- tblTransactions ... check to see if it is in Liquid status ,,,FYI 
select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, IDSPOOLID, -- to see if GNMA loan 
	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
	DTMTRANSACTIONCREATIONDATE, IDSUSERID  
	,   
CURTRANSACTIONAMT,
CURTRANSACTIONINTEREST, CURTRANSACTIONMIP,
CURUNSCHEDULEDPAYMENTUPB /*CURUNSCHEDULEDPAYMENTINTEREST*/ , 
CURUNSCHEDULEDPAYINTACCRUED ,
CURUNSCHEDULEDPAYMIPACCRUED,
CURTOTALUPB,
CURNETPL
	, '-->--', * 
	from celink.TBLTRANSACTIONS A 
	where INTSUBSERVICERLOANNUMBER in (1409832)
	and IDSTRANSACTIONCOUNT = (select max(IDSTRANSACTIONCOUNT) from celink.TBLTRANSACTIONS where INTSUBSERVICERLOANNUMBER = A.INTSUBSERVICERLOANNUMBER group by INTSUBSERVICERLOANNUMBER)
	order by INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT 
for read only with ur;


/*
	-----------------------------------------------------------------------------	
	-- bulk check PoolID for GNMA
	with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, TranAmnt, EffDate, TranCode) as
	(VALUES
	(1, 0168998, 'Jessica Ambs', 3035744, 36212.07, date('08/01/2024'), 44),
	(2, 0168998, 'Jessica Ambs', 1077152, 20508.36, date('08/01/2024'), 44)
	)
	select 
		S.SeqNum, S.Loan, 
		INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, IDSPOOLID, -- to see if GNMA loan 
		IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
		DTMTRANSACTIONCREATIONDATE, IDSUSERID  
		,   
	CURTRANSACTIONAMT,
	CURTRANSACTIONINTEREST, CURTRANSACTIONMIP,
	CURUNSCHEDULEDPAYMENTUPB /*CURUNSCHEDULEDPAYMENTINTEREST*/ , 
	CURUNSCHEDULEDPAYINTACCRUED ,
	CURUNSCHEDULEDPAYMIPACCRUED,
	CURTOTALUPB,
	CURNETPL
		, '-->--', * 
	FROM  MyVal S
	INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	 S.LOAN = A.INTSUBSERVICERLOANNUMBER 
	AND A.IDSTRANSACTIONCOUNT = (select max(IDSTRANSACTIONCOUNT) from CELINK.TBLTRANSACTIONS where INTSUBSERVICERLOANNUMBER = S.Loan group by INTSUBSERVICERLOANNUMBER) 	
	order by S.SeqNum 
	for read only with ur;

-- not GNMA
-- ------ ------- ------------------------ ---------- ------------------- ????????? ------------------ ------------- -------------------- ---------------- -------------------------- --------- ----------------- ---------------------- ----------------- ------------------------ --------------------------- --------------------------- ------------- ------------- ----- ------ ------ ----------- ------- -------- ---------- -------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
-- SEQNUM LOAN    INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSPOOLID  IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID CURTRANSACTIONAMT CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMIPACCRUED CURTOTALUPB   CURNETPL     21    SEQNUM HDTNUM REQUESTER    LOAN    TRANAMNT EFFDATE    TRANCODE IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE      CHRINTERESTTYPE IDSUSERID DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------ ------- ------------------------ ---------- ------------------- ---------- ------------------ ------------- -------------------- ---------------- -------------------------- --------- ----------------- ---------------------- ----------------- ------------------------ --------------------------- --------------------------- ------------- ------------ ----- ------ ------ ------------ ------- -------- ---------- -------- ---------- ------------------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- --------------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--      1 3035744                3035744.0   69432461                 244 BO_LBFSHAP                102             0 Active               2024-08-01       2024-08-01                 BATCH            500.000000               2.710000          0.210000              4661.780000                    0.000000                    0.000000 307801.870000 51046.260000 -->--      1 168998 Jessica Ambs 3035744 36212.07 2024-08-01       44   69432461                 244                102 BO_LBFSHAP          6000        234790013             0                3035744.0              0.0 001973553442     HECM        Modified Tenure ARM 857T        BATCH     2024-08-01                 2024-08-01       2006-01-03     2005-12-28     2018-06-02             500.000000          303140.090000               101120.860000                  2.710000           20562.330000                  0.210000               2.710000          0.210000              4661.780000                    968.930000                    0.000000                56.900000                    0.000000        -1554.000000             0.000000        0.000000    68547.470000 307801.870000 184920.940000 363117.640000    158090.850000 51046.260000     312895.000000         370000.000000               5857.620000           4269.510000            2425.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      28268.004600  54323.300000 49661.520000      35.000000           7805.000000                 0.000000                 0.000000        0.000000        500.000000          0.000000                                 0               -75          0.0587             0.066              0.0595    0.051     0.015                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      2 1077152                1077152.0   69183565                 381 TCBBUYOUTS                103             0 Active               2024-08-01       2024-07-31                 BATCH              0.000000               0.000000          0.000000            369338.310000                    0.000000                    0.000000 393501.770000 41247.830000 -->--      2 168998 Jessica Ambs 1077152 20508.36 2024-08-01       44   69183565                 381                103 TCBBUYOUTS     266130007        266130007             0                1077152.0              0.0 000486819145     HECM        Line of Credit  ARM 858         BATCH     2024-07-31                 2024-08-01       2012-01-23     2012-01-18     2999-01-01               0.000000           24163.460000                 7789.050000                  0.000000           10176.190000                  0.000000               0.000000          0.000000            369338.310000                  80416.210000                    0.000000             22711.100000                    0.000000        -1966.000000             0.440000        0.130000    13618.220000 393501.770000 244489.000000 434749.600000    230870.780000 41247.830000     371000.000000         371000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000     230870.780000 410586.140000 41247.830000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02282           0.07451              0.0424  0.05451      0.02                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
*/


/* ***** DATAUPDT tables ***** 
-- see z HDTForcePost81_Tables.sql
----------------------------------------
--Proc status
create table DATAUPDT.zKato_sp_RunResult
----------------------------------------
-- Requested data Source  
create table DATAUPDT.HDTForcePost81Src   
----------------------------------------
-- Calculated values
create table DATAUPDT.HDTForcePost81Clc   
----------------------------------------
-- most recent transactions
create table DATAUPDT.HDTForcePost81Trn   
----------------------------------------
* ***** DATAUPDT tables ***** */



------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
-- begin ---------------------------------------------------------------------------------------------------------------------------
delete from DATAUPDT.zKato_sp_RunResult;
delete from DATAUPDT.HDTForcePost81Src;
delete from DATAUPDT.HDTForcePost81Clc;

------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table ... my src table
DELETE from DATAUPDT.HDTForcePost81Src;

------------------------------------------------------------------------------------------------------------------------------------
-- populate src 
INSERT INTO DATAUPDT.HDTForcePost81Src
(
RowNum, SeqNum, HDTNum, Requester, Loan, TranAmnt, EffDate, DaysToEOM, TranCode, MIPRate, LoanType, LoanSubType, RateBase
)

with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, TranAmnt, EffDate, TranCode) as
(VALUES

(1, 0198087, 'Shay Beverly', 3204434, 10000.00, date('08/27/2025'), 44)
	
)
select
ROW_NUMBER() OVER (partition by P.Loan order by P.SeqNum) as RowNum,

P.SEQNUM, P.HDTNUM, P.REQUESTER, P.LOAN, P.TranAmnt, 
P.EffDate, 
--day(last_day(Current date)) - day(P.EffDate) "DaysTo",
day(last_day(P.EffDate)) - day(P.EffDate) "DaysTo",

P.TranCode, 
TT.DBLMIPRATE "MIPRate",

TT.CHRLOANTYPE "LoanType",
TT.CHRSUBLOANTYPE "LoanSubType",
case when TT.CHRSUBLOANTYPE = 'Select Growth' then 365 else 12 end  "LoanSubType" -- THIS SHOULD BE EFFECTIVE FOR EOM transaction

--, TT.*
from MyVal P
inner join CELINK.TBLLOANDATA TT 
on P.Loan = TT.INTSUBSERVICERLOANNUMBER
order by P.SeqNum
; --for read only with ur;

---------------------------------------	
select * from DATAUPDT.HDTForcePost81Src;

/*
--REVMJava
 ROWNUM SEQNUM HDTNUM REQUESTER    LOAN    TRANAMNT     EFFDATE    DAYSTOEOM TRANCODE MIPRATE LOANTYPE LOANSUBTYPE RATEBASE CHANGEREQUIRED
 ------ ------ ------ ------------ ------- ------------ ---------- --------- -------- ------- -------- ----------- -------- --------------
      1      1 198087 Shay Beverly 3204434 10000.000000 2025-08-27         4       44     0.0 EE       LOC               12           NULL

select * from celink.tblactioncodesall order by IDSSTATUSCODE for read only with ur;

	-----------
	--test GNMA
	select 
		S.SeqNum, S.Loan, 
		INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, IDSPOOLID, -- to see if GNMA loan 
		IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
		DTMTRANSACTIONCREATIONDATE, IDSUSERID  
		, '-->--', A.* 
		
	FROM  DATAUPDT.HDTForcePost81Src S
	INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	 S.LOAN = A.INTSUBSERVICERLOANNUMBER 
	AND A.IDSTRANSACTIONCOUNT = (select max(IDSTRANSACTIONCOUNT) from CELINK.TBLTRANSACTIONS where INTSUBSERVICERLOANNUMBER = S.Loan group by INTSUBSERVICERLOANNUMBER) 	
	order by S.SeqNum 
	for read only with ur;

	-- SEQNUM LOAN    INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSPOOLID  IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID 13    IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
	-- ------ ------- ------------------------ ---------- ------------------- ---------- ------------------ ------------- -------------------- ---------------- -------------------------- --------- ----- ---------- ------------------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
	--      1 3036051                3036051.0   72949681                 273 892333                    103             0 Active               2025-03-01       2025-02-28                 BATCH     -->--   72949681                 273                103 892333              6800             6800             0                3036051.0              0.0 003713590075     HECM        Line of Credit ARM 857         BATCH     2025-02-28                 2025-03-01       2006-07-21     2006-07-17     2019-06-01               0.000000          167196.060000                30760.560000                  0.000000              88.390000                  0.000000               0.000000          0.000000            -41526.330000                   -194.620000                    0.000000               -16.990000                    0.000000       -42787.000000            61.490000        8.710000    81539.930000 125669.730000  92100.000000 181729.550000      7324.280000  53568.950000     150000.000000         150000.000000               4435.790000           2490.870000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       6124.280000  12042.620000  53568.950000      30.000000             30.000000                 0.000000                 0.000000     1297.560000          0.000000          0.000000                                 0                 0          0.0677            0.0569              0.0651   0.0419     0.015                0                0 Active               142.440000      NULL NULL        NULL                      0.0
	--*     2 1339068                1339068.0   72910503                 225 BF9067                    103             0 Active               2025-03-01       2025-02-28                 BATCH     -->--   72910503                 225                103 BF9067              6800             6800             0                1339068.0              0.0 000951023961     HECM        Line of Credit ARM 857         BATCH     2025-02-28                 2025-03-01       2009-01-05     2008-12-29     2017-12-01               0.000000          265338.650000                99911.080000                  0.000000            8057.560000                  0.000000               0.000000          0.000000                13.650000                      9.110000                    0.000000                 0.190000                    0.000000        -7265.440000             6.600000        0.860000   143650.760000 265352.300000 214170.000000 380259.520000     64482.160000 110470.840000     330000.000000         330000.000000               6037.080000           4436.380000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      78653.790000 110484.490000 110470.840000      30.000000           5850.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0           0.022            0.0594              0.0441   0.0419    0.0175                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
	--      3 1099898                1099898.0   72972991                 337 UFS207Rep                 103             0 Active               2025-03-01       2025-02-28                 BATCH     -->--   72972991                 337                103 UFS207Rep      266130007        266130007             0                1099898.0              0.0 004615641281     HECM        Line of Credit ARM 858         BATCH     2025-02-28                 2025-03-01       2012-11-26     2012-11-19     2999-01-01               0.000000           23958.250000                 9334.710000                  0.000000            2243.820000                  0.000000               0.000000          0.000000            167241.910000                  45302.790000                    0.000000              9775.100000                    0.000000        -5000.000000             4.950000        1.880000    12093.740000 191200.160000 124135.000000 246665.860000    112041.260000  55465.700000     185000.000000         185000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000     112041.260000 222707.610000  55465.700000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02959            0.0718               0.046   0.0443    0.0275                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
	--      4 1155605                1155605.0   72992630                 299 FAHB24HB19                103             0 Active               2025-03-01       2025-02-28                 BATCH     -->--   72992630                 299                103 FAHB24HB19     266130007        266130007             0                1155605.0              0.0 003746900025     HECM        Line of Credit ARM 858         BATCH     2025-02-28                 2025-03-01       2013-11-20     2013-11-15     2999-01-01               0.000000          283010.880000                96723.460000                  0.000000           36619.900000                  0.000000               0.000000          0.000000            168824.670000                  41102.560000                    0.000000             10442.280000                    0.000000            0.000000             0.000000        0.000000   157467.520000 451835.550000 264030.000000 475505.110000     96654.980000  23669.560000     390000.000000         390000.000000                  0.000000              0.000000            9907.500000           0.000000                       0.000000                     0.000000                0.000000            0.000000      96654.980000 192494.230000  23669.560000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.02419            0.0668              0.0504   0.0443    0.0225                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
	--      5 1238362                1238362.0   72718013                 168 RMFRMFHCM1                101             0 Active               2025-02-28       2025-02-28                 BATCH     -->--   72718013                 168                101 RMFRMFHCM1          6800             6800             0                1238362.0              0.0 005441232370     HECM        Line of Credit ARM 860         BATCH     2025-02-28                 2025-02-28       2015-12-22     2015-12-17     2018-12-01             452.030000           49288.060000                15389.800000                  0.000000            4069.370000                  0.000000             389.240000         61.060000              9776.350000                   2380.770000                    0.000000               575.580000                    0.000000            0.000000             0.000000        0.000000    21269.280000  59064.410000  36840.000000  65375.180000      7098.520000   2866.670000      60000.000000          60000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000             8472.200000         3444.100000       7098.520000  12643.020000   2866.670000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04067           0.07969              0.0503  0.04969      0.03                0                0 Active                 0.000000      NULL NULL        NULL                    14.65
	
	--GNMA ??
	-- ------ ------- ------------------------ ---------- ------------------- ????????? ------------------ ------------- -------------------- ---------------- -------------------------- --------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
	-- SEQNUM LOAN    INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSPOOLID IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID 13    IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL   CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC  CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
	-- ------ ------- ------------------------ ---------- ------------------- --------- ------------------ ------------- -------------------- ---------------- -------------------------- --------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- ------------- ------------- ---------------- ---------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ---------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------

*/	


------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table 
DELETE from DATAUPDT.HDTForcePost81Trn;

------------------------------------------------------------------------------------------------------------------------------------
-- populate Trn ... most recent trans
insert into DATAUPDT.HDTForcePost81Trn   
(
	RowNum, SeqNum,	
	INTSUBSERVICERLOANNUMBER,
	IDSTRANSACTIONCOUNT,

	IDSTRANSACTIONCODE,
	IDSSTATUSCODE,  
	CHRSTATUSGROUP,
	
	DTMTRANSACTIONCREATIONDATE,
	DTMEFFECTIVEDATE,

	CURTRANSACTIONAMT, 
	INTCURRENTINTRATE,

	CURTRANSACTIONINTEREST,
	CURTRANSACTIONMIP,
	
	CURUNSCHEDULEDPAYMENTUPB,
	
	CURUNSCHEDULEDPAYINTACCRUED,
	CURUNSCHEDULEDPAYMIPACCRUED,
	
	CURTOTALUPB,
	CURNETPL,
	CURNETLOC --   decimal(16,6)   --CURNETLOC --CURNETLOC - D.TranAmnt as "*CURNETLOC*"   	--,  -- <<<<< New Val
)

select
	S.RowNum,
	S.SeqNum,
	A.INTSUBSERVICERLOANNUMBER,
	A.IDSTRANSACTIONCOUNT,

	A.IDSTRANSACTIONCODE,
	A.IDSSTATUSCODE,  
	
	C2.CHRSTATUSGROUP,

	A.DTMTRANSACTIONCREATIONDATE,
	A.DTMEFFECTIVEDATE,
	
	A.CURTRANSACTIONAMT	,
	A.INTCURRENTINTRATE,
	
	A.CURTRANSACTIONINTEREST,
	A.CURTRANSACTIONMIP,
	
	A.CURUNSCHEDULEDPAYMENTUPB,
	A.CURUNSCHEDULEDPAYINTACCRUED,
	A.CURUNSCHEDULEDPAYMIPACCRUED,
	
	A.CURTOTALUPB,
	A.CURNETPL,
	A.CURNETLOC
	
FROM  DATAUPDT.HDTForcePost81Src S
INNER JOIN CELINK.TBLTRANSACTIONS A
on 	 S.LOAN = A.INTSUBSERVICERLOANNUMBER 
--inner join CELINK.CHOOSELASTRECORD C
--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
AND A.IDSTRANSACTIONCOUNT = (select max(IDSTRANSACTIONCOUNT) from CELINK.TBLTRANSACTIONS where INTSUBSERVICERLOANNUMBER = S.Loan group by INTSUBSERVICERLOANNUMBER) 	

inner join celink.tblActionCodesAll C2 
ON    A.IDSSTATUSCODE = C2.IDSSTATUSCODE 	--Select CHRACTIONCODEDESCRIPT From celink.tblActionCodesAll Where IDSSTATUSCODE = P.NewStatus as "NewStatusDesc" ,

where S.RowNum = 1
order by S.SeqNum
with ur
;
			
/* 
--select
*/

-------------------------------------------------------------------------------------	
select * from DATAUPDT.HDTForcePost81Trn order by SeqNum, RowNum;  -- only RowNum = 1
/*
--REVMJAVA
 ROWNUM SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRSTATUSGROUP                 DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE CURTRANSACTIONAMT INTCURRENTINTRATE CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMIPACCRUED CURTOTALUPB    CURNETPL      CURNETLOC
 ------ ------ ------------------------ ------------------- ------------------ ------------- ------------------------------ -------------------------- ---------------- ----------------- ----------------- ---------------------- ----------------- ------------------------ --------------------------- --------------------------- -------------- ------------- -------------
      1      1                  3204434                 100                 44             0 Active                         2025-08-22                 2025-08-22            10000.000000           0.09835              24.250000          0.000000            349297.250000                  169.750000                    0.000000 1112938.790000 698468.300000 698468.300000
*/


-- ------ ------ ------------------------ ------------------- ------------------ ------------- ------------------------------ -------------------------- ---------------- ----------------- ----------------- ---------------------- ----------------- ------------------------ --------------------------- --------------------------- ------------- ------------- -------------
-- ------ ------ ------------------------ ------------------- ------------------ ------------- ------------------------------ -------------------------- ---------------- ----------------- ----------------- ---------------------- ----------------- ------------------------ --------------------------- --------------------------- ------------- ------------- -------------
-- tables should be ready for SP	 
select * from DATAUPDT.zKato_sp_RunResult;
select * from DATAUPDT.HDTForcePost81Src ;
select * from DATAUPDT.HDTForcePost81Trn ;
select * from DATAUPDT.HDTForcePost81Clc ;

-- ------------------------ ------ ------------------- ------------ ----------------- ---------------------- ----------------- ------------------------ --------------------------- ------------- ------------ ------------
-- ------------------------ ------ ------------------- ------------ ----------------- ---------------------- ----------------- ------------------------ --------------------------- ------------- ------------ ------------
-- call SP	
--
--2 execute SP - test loan 3040521(204835161), Feb EOM --period (2/1 and 2/28) 
delete from DATAUPDT.zKato_sp_RunResult;
delete from DATAUPDT.HDTForcePost81Clc;

call DATAUPDT.zKato_sp_ForcePost81 ('198087');      

-------------------------------------------------------------
--3 test result
select * from DATAUPDT.zKato_sp_RunResult order by ERRDATE;
select * from DATAUPDT.HDTForcePost81Clc order by  INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT desc;

select 
	Src.SeqNum, Src.DAYSTOEOM, Src.TRANCODE, Src.MIPRATE,
	Clc.* 
from DATAUPDT.HDTForcePost81Src Src
inner join DATAUPDT.HDTForcePost81Clc Clc
on  src.LOAN = Clc.INTSUBSERVICERLOANNUMBER
and Src.ROWNUM = Clc.ROWNUM
order by  Src.SeqNum, Clc.INTSUBSERVICERLOANNUMBER, Clc.IDSTRANSACTIONCOUNT desc;

/*
--RunResult
 ERRPROC              ERRSTEP ERRCODE ERRNOTE                             ERRDATE
 -------------------- ------- ------- ----------------------------------- --------------------------
 zKato_sp_ForcePost81     101       0 Test Force Post 81 : HDT198087      2025-08-27 13:13:47.850213
 zKato_sp_ForcePost81     102       0 ... Begin process ...               2025-08-27 13:13:47.851183
 zKato_sp_ForcePost81     103       0 Max row : 1                         2025-08-27 13:13:47.851986

 zKato_sp_ForcePost81     201       0 fetch csrSrc : 1//3204434??0        2025-08-27 13:13:47.857916
 zKato_sp_ForcePost81     202       0 srcRowNum = 1 : 1//3204434??0       2025-08-27 13:13:47.858764
 zKato_sp_ForcePost81     204       0 NULL                                2025-08-27 13:13:47.861174

 zKato_sp_ForcePost81     205       0 fetch csrSrc bottom 1//3204434??100 2025-08-27 13:13:47.862006
 zKato_sp_ForcePost81    9999       0 ... End process ...                 2025-08-27 13:13:47.86282


--prod
 SEQNUM DAYSTOEOM TRANCODE MIPRATE ROWNUM SEQNUM INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRSTATUSGROUP                 DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE TRANAMNT     INTCURRENTINTRATE CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMIPACCRUED CURTOTALUPB    CURNETPL      CURNETLOC
 ------ --------- -------- ------- ------ ------ ------------------------ ------------------- ------------------ ------------- ------------------------------ -------------------------- ---------------- ------------ ----------------- ---------------------- ----------------- ------------------------ --------------------------- --------------------------- -------------- ------------- -------------
      1         4       44     0.0      1   NULL                  3204434                 101                 44             0 Active                         NULL                       NULL             10000.000000           0.09835              10.780000          0.000000            359297.250000                  180.530000                    0.000000 1122938.790000 688468.300000 688468.300000

-- note
posting 81 
liquidated loan 70s ,, CURTRANSACTIONINTEREST CURTRANSACTIONMIP must be zero

--
select * from DATAUPDT.HDTForcePost81Clc order by  INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT desc;
*/

-- ------------------------ ------ ------------------- ------------ ----------------- ---------------------- ----------------- ------------------------ --------------------------- ------------- ------------ ------------
-- ------------------------ ------ ------------------- ------------ ----------------- ---------------------- ----------------- ------------------------ --------------------------- ------------- ------------ ------------

--Check Clc with union before post - short
select 
--TT.IDSTRANSID,
Src.SeqNum, Src.RowNum,   -->>> test purpose
Clc.IDSTRANSACTIONCOUNT "//IDSTRANSACTIONCOUNT//",
src.TranCode "//TranCode//",
TT.IDSSTATUSCODE	,
Src.Loan "//Loan//",
'tkato' "//UserMe//",
CURRENT_DATE "//CreationDate//",
Src.EffDate "//EffDate//",
Src.TranAmnt "//TranAmnt//", -- = Clc.TranAmnt
Clc.CURTRANSACTIONINTEREST "//CURTRANSACTIONINTEREST//",
Clc.CURTRANSACTIONMIP "//CURTRANSACTIONMIP//",
Clc.CURUNSCHEDULEDPAYMENTUPB "//CURUNSCHEDULEDPAYMENTUPB//",
TT.CURUNSCHEDULEDPAYMENTINTEREST,
Clc.CURUNSCHEDULEDPAYINTACCRUED "//CURUNSCHEDULEDPAYINTACCRUED//",
CLC.CURUNSCHEDULEDPAYMIPACCRUED "??CURUNSCHEDULEDPAYMIPACCRUED??",

Clc.CURTOTALUPB "//CURTOTALUPB//",
Clc.CURNETPL "//CURNETPL//",
Clc.CURNETLOC "//CURNETLOC//",
Clc.INTCURRENTINTRATE "//INTCURRENTINTRATE//"
,
TT.CHRPAYTYPE 
from DATAUPDT.HDTForcePost81Src Src

inner join DATAUPDT.HDTForcePost81Clc Clc
on  src.LOAN = Clc.INTSUBSERVICERLOANNUMBER
and Src.ROWNUM = Clc.ROWNUM

inner join DATAUPDT.HDTForcePost81Trn Trn
on Src.LOAN = Trn.INTSUBSERVICERLOANNUMBER

inner join CELINK.TBLTRANSACTIONS TT
on  Trn.INTSUBSERVICERLOANNUMBER = TT.INTSUBSERVICERLOANNUMBER
and Trn.IDSTRANSACTIONCOUNT = TT.IDSTRANSACTIONCOUNT
------------------------------------------
			UNION
------------------------------------------
select
	-- -- -- 	IDSTRANSID --	,
	Src.SeqNum, Src.RowNum,   -->>> test purpose
IDSTRANSACTIONCOUNT	"//IDSTRANSACTIONCOUNT//",
IDSTRANSACTIONCODE "TranCode",
IDSSTATUSCODE	,
INTSUBSERVICERLOANNUMBER "//Loan//",
IDSUSERID	 "//UserMe//",
DTMTRANSACTIONCREATIONDATE "//CreationDate//",
DTMEFFECTIVEDATE "//EffDate//",
CURTRANSACTIONAMT "//TranAmnt//",
CURTRANSACTIONINTEREST "//CURTRANSACTIONINTEREST//",
CURTRANSACTIONMIP "//CURTRANSACTIONMIP//",
CURUNSCHEDULEDPAYMENTUPB "//CURUNSCHEDULEDPAYMENTUPB//",
CURUNSCHEDULEDPAYMENTINTEREST	,
CURUNSCHEDULEDPAYINTACCRUED  "//CURUNSCHEDULEDPAYINTACCRUED//",
CURUNSCHEDULEDPAYMIPACCRUED "??CURUNSCHEDULEDPAYMIPACCRUED??",
CURTOTALUPB "//CURTOTALUPB//",
CURNETPL "//CURNETPL//",
CURNETLOC "//CURNETLOC//",
INTCURRENTINTRATE "//INTCURRENTINTRATE//"
,
A.CHRPAYTYPE 
FROM DATAUPDT.HDTForcePost81Src Src

INNER JOIN CELINK.TBLTRANSACTIONS A
on 	Src.LOAN = A.INTSUBSERVICERLOANNUMBER 
and A.IDSTRANSACTIONCOUNT >= (select max(IDSTRANSACTIONCOUNT) from CELINK.TBLTRANSACTIONS where INTSUBSERVICERLOANNUMBER = src.Loan group by INTSUBSERVICERLOANNUMBER)-2

--inner join CELINK.CHOOSELASTRECORD C
--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

order by SeqNum, "//IDSTRANSACTIONCOUNT//" Desc 
for read only with ur
;

--New CURUNSCHEDULEDPAYMIPACCRUED = Current CURUNSCHEDULEDPAYMIPACCRUED +  new CURTRANSACTIONMIP
-- SEQNUM ROWNUM //IDSTRANSACTIONCOUNT// //TranCode// IDSSTATUSCODE //Loan//  //UserMe// //CreationDate// //EffDate// //TranAmnt// //CURTRANSACTIONINTEREST// //CURTRANSACTIONMIP// //CURUNSCHEDULEDPAYMENTUPB// CURUNSCHEDULEDPAYMENTINTEREST //CURUNSCHEDULEDPAYINTACCRUED// ??CURUNSCHEDULEDPAYMIPACCRUED?? //CURTOTALUPB// //CURNETPL//  //CURNETLOC// //INTCURRENTINTRATE// CHRPAYTYPE
-- ------ ------ ----------------------- ------------ ------------- --------- ---------- ---------------- ----------- ------------ -------------------------- --------------------- ---------------------------- ----------------------------- ------------------------------- ------------------------------- --------------- ------------- ------------- --------------------- --------------
--      1      1                     101           44             0 3204434.0 tkato      2025-08-27       2025-08-27  10000.000000                  10.780000              0.000000                359297.250000                 -78854.390000                      180.530000                        0.000000  1122938.790000 688468.300000 688468.300000               0.09835 Line of Credit
--      1      1                     100           44             0 3204434.0 cking      2025-08-22       2025-08-22  10000.000000                  24.250000              0.000000                349297.250000                 -78854.390000                      169.750000                        0.000000  1112938.790000 698468.300000 698468.300000               0.09835 Line of Credit
--      1      1                      99           44             0 3204434.0 cking      2025-08-04       2025-08-04  20000.000000                 145.500000              0.000000                339297.250000                 -78854.390000                      145.500000                        0.000000  1102938.790000 708468.300000 708468.300000               0.09835 Line of Credit
--      1      1                      98          101             0 3204434.0 BATCH      2025-07-31       2025-07-31   8818.820000                8475.480000              0.000000                319297.250000                 -78854.390000                        0.000000                        0.000000  1082938.790000 728468.300000 728468.300000               0.09835 Line of Credit

/*
-- Calculation notes
CURTRANSACTIONINTEREST      = CASE when CHRSTATUSGROUP = 'Liquid' then 0.00 else cast(round(srcTranAmnt * cast(INTCURRENTINTRATE/365 as float) * srcDaysToEOM, 2) as decimal(16,2)) end ,
CURTRANSACTIONMIP           = CASE when CHRSTATUSGROUP = 'Liquid' then 0.00 else cast(round(srcTranAmnt * cast(srcMIPRate/365 as float) * srcDaysToEOM, 2) as decimal(16,2)) end, 
CURUNSCHEDULEDPAYMENTUPB    = CURUNSCHEDULEDPAYMENTUPB + srcTranAmnt,
CURUNSCHEDULEDPAYINTACCRUED = CASE when CHRSTATUSGROUP = 'Liquid' then CURUNSCHEDULEDPAYINTACCRUED + 0.00 else CURUNSCHEDULEDPAYINTACCRUED + cast(round(srcTranAmnt * cast(INTCURRENTINTRATE/365 as float) * srcDaysToEOM, 2) as decimal(16,2)) end,
CURUNSCHEDULEDPAYMIPACCRUED = CASE when CHRSTATUSGROUP = 'Liquid' then CURUNSCHEDULEDPAYMIPACCRUED + 0.00 else CURUNSCHEDULEDPAYMIPACCRUED + cast(round(srcTranAmnt * cast(srcMIPRate/365 as float) * srcDaysToEOM, 2) as decimal(16,2)) end,
                                      
CURTOTALUPB = CURTOTALUPB + srcTranAmnt,
CURNETPL    = CURNETPL - srcTranAmnt,
CURNETLOC   = CURNETLOC - srcTranAmnt 	

case 44 ?????
CURTRANSACTIONAMT = req.amt
CURTRANSACTIONINTEREST = req.amt * ?
CURUNSCHEDULEDPAYMENTUPB = CURUNSCHEDULEDPAYMENTUPB + req.amt

CURUNSCHEDULEDPAYINTACCRUED = req.amt * ?

CURTOTALUPB = CURTOTALUPB +  req.amt
CURNETPL = CURNETPL - req.amt
*/

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--Check with union before post - long
select 
--TT.IDSTRANSID,
Src.SeqNum, Src.RowNum,   -->>> test purpose
Clc.IDSTRANSACTIONCOUNT "//IDSTRANSACTIONCOUNT//",
src.TranCode "//TranCode//",
TT.IDSPOOLID "@@IDSPOOLID@@",
TT.IDSSERVICERID,
TT.IDSSUBSERVICERID,
TT.IDSSTATUSCODE,
Src.Loan "//Loan//",
TT.INTFMALOANNUMBER,
TT.INTFHACASENUMBER,
TT.CHRLOANTYPE,
TT.CHRPAYTYPE,
TT.CHRINTERESTTYPE,
'tkato' "//UserMe//",
CURRENT_DATE "//CreationDate//",
Src.EffDate "//EffDate//",
TT.DTMFUNDINGDATE,
TT.DTMCLOSINGDATE,
TT.DTMPURCHASEDATE,
Src.TranAmnt "//TranAmnt//",
TT.CURSCHEDULEDPAYMENTUPB,
TT.CURSCHEDULEDPAYMENTINTEREST,
TT.CURSCHEDULEDPAYINTACCRUED,
TT.CURSCHEDULEDPAYMENTMIP,
TT.CURSCHEDULEDPAYMIPACCRUED,
Clc.CURTRANSACTIONINTEREST "//CURTRANSACTIONINTEREST//",
Clc.CURTRANSACTIONMIP "//CURTRANSACTIONMIP//",
Clc.CURUNSCHEDULEDPAYMENTUPB "//CURUNSCHEDULEDPAYMENTUPB//",
TT.CURUNSCHEDULEDPAYMENTINTEREST,

Clc.CURUNSCHEDULEDPAYINTACCRUED "//CURUNSCHEDULEDPAYINTACCRUED//",

TT.CURUNSCHEDULEDPAYMENTMIP,
--TT.CURUNSCHEDULEDPAYMIPACCRUED,
Clc.CURUNSCHEDULEDPAYMIPACCRUED "??CURUNSCHEDULEDPAYMIPACCRUED??",

TT.CURREPAYMENTBALANCE,
TT.CURREPAYMENTINTEREST,
TT.CURREPAYMENTMIP,
TT.CURORIGTOTALUBP,
Clc.CURTOTALUPB "//CURTOTALUPB//",
TT.CURORIGINALPL,
TT.CURCURRENTPL,
TT.CURORIGINALNETPL,
Clc.CURNETPL "//CURNETPL//",
TT.CURMAXCLAIMAMOUNT,
TT.CURPROPAPPRAISEDVALUE,
TT.CURORIGSERVICEFEESETASIDE,
TT.CURSERVICEFEESETASIDE,
TT.CURORIGREPAIRSSETASIDE,
TT.CURREPAIRSSETASIDE,
TT.CURORGFRSTYRPROPCHARGESETASIDE,
TT.CURFIRSTYRPROPCHARGESETASIDE,
TT.CURORIGTAXINSURSETASIDE,
TT.CURTAXINSURSETASIDE,
TT.CURORIGLOCRESERVE,
TT.CURLOCRESERVE,
Clc.CURNETLOC "//CURNETLOC//",
TT.CURSERVICEFEES,
TT.CURACCRUEDSERVICEFEES,
TT.CURPLANCHANGESERVICEFEES,
TT.CURACCRUEDPLANCHANGEFEES,
TT.CUR1098INTEREST,
TT.CURMNTHLYPAYMENTS,
TT.CURMNTHLYWITHHOLD,
TT.CHRPLANCHANGEREASON,
TT.INTTERMMONTHS,
TT.INTTERMMONTHSLEFT,
TT.INTBEGININTRATE,
Clc.INTCURRENTINTRATE "//INTCURRENTINTRATE//",
TT.INTEXPECTAVGINTRATE,
TT.INTINDEX,
TT.INTMARGIN,
TT.BLNINTERESTROUND,
TT.BLNLOANSUSPENDED,
TT.CHRLOANSTATUSREMARKS,
TT.CUR1098MIP,
TT.INTVENDOR,
TT.CHRMEMO,
TT.INTPAYTO,
TT.CURTRANSACTIONSERVICEFEE

from DATAUPDT.HDTForcePost81Src Src

inner join DATAUPDT.HDTForcePost81Clc Clc
on  src.LOAN = Clc.INTSUBSERVICERLOANNUMBER
and Src.ROWNUM = Clc.ROWNUM

inner join DATAUPDT.HDTForcePost81Trn Trn
on Src.LOAN = Trn.INTSUBSERVICERLOANNUMBER

inner join CELINK.TBLTRANSACTIONS TT
on  Trn.INTSUBSERVICERLOANNUMBER = TT.INTSUBSERVICERLOANNUMBER
and Trn.IDSTRANSACTIONCOUNT = TT.IDSTRANSACTIONCOUNT

--order by Src.SeqNum
--;
------------------------------------------
			UNION
------------------------------------------
select
	-- -- -- 	IDSTRANSID --	,
	Src.SeqNum, Src.RowNum,   -->>> test purpose
IDSTRANSACTIONCOUNT	"//IDSTRANSACTIONCOUNT//",
IDSTRANSACTIONCODE "TranCode",
IDSPOOLID "@@IDSPOOLID@@"	,
IDSSERVICERID	,
IDSSUBSERVICERID	,
IDSSTATUSCODE	,
INTSUBSERVICERLOANNUMBER "//Loan//",
INTFMALOANNUMBER	,
INTFHACASENUMBER	,
CHRLOANTYPE	,
CHRPAYTYPE	,
CHRINTERESTTYPE	,
IDSUSERID	 "//UserMe//",
DTMTRANSACTIONCREATIONDATE "//CreationDate//",
DTMEFFECTIVEDATE "//EffDate//",
DTMFUNDINGDATE	,
DTMCLOSINGDATE	,
DTMPURCHASEDATE	,
CURTRANSACTIONAMT "//TranAmnt//",
CURSCHEDULEDPAYMENTUPB	,
CURSCHEDULEDPAYMENTINTEREST	,
CURSCHEDULEDPAYINTACCRUED	,
CURSCHEDULEDPAYMENTMIP	,
CURSCHEDULEDPAYMIPACCRUED	,
CURTRANSACTIONINTEREST "//CURTRANSACTIONINTEREST//",
CURTRANSACTIONMIP "//CURTRANSACTIONMIP//",
CURUNSCHEDULEDPAYMENTUPB "//CURUNSCHEDULEDPAYMENTUPB//",
CURUNSCHEDULEDPAYMENTINTEREST	,
CURUNSCHEDULEDPAYINTACCRUED  "//CURUNSCHEDULEDPAYINTACCRUED//",
CURUNSCHEDULEDPAYMENTMIP	,

CURUNSCHEDULEDPAYMIPACCRUED	"??CURUNSCHEDULEDPAYMIPACCRUED??",

CURREPAYMENTBALANCE	,
CURREPAYMENTINTEREST	,
CURREPAYMENTMIP	,
CURORIGTOTALUBP	,
CURTOTALUPB "//CURTOTALUPB//",
CURORIGINALPL	,
CURCURRENTPL	,
CURORIGINALNETPL	,
CURNETPL "//CURNETPL//",
CURMAXCLAIMAMOUNT	,
CURPROPAPPRAISEDVALUE	,
CURORIGSERVICEFEESETASIDE	,
CURSERVICEFEESETASIDE	,
CURORIGREPAIRSSETASIDE	,
CURREPAIRSSETASIDE	,
CURORGFRSTYRPROPCHARGESETASIDE	,
CURFIRSTYRPROPCHARGESETASIDE	,
CURORIGTAXINSURSETASIDE	,
CURTAXINSURSETASIDE	,
CURORIGLOCRESERVE	,
CURLOCRESERVE	,
CURNETLOC "//CURNETLOC//",
CURSERVICEFEES	,
CURACCRUEDSERVICEFEES	,
CURPLANCHANGESERVICEFEES	,
CURACCRUEDPLANCHANGEFEES	,
CUR1098INTEREST	,
CURMNTHLYPAYMENTS	,
CURMNTHLYWITHHOLD	,
CHRPLANCHANGEREASON	,
INTTERMMONTHS	,
INTTERMMONTHSLEFT	,
INTBEGININTRATE	,
INTCURRENTINTRATE "//INTCURRENTINTRATE//",
INTEXPECTAVGINTRATE	,
INTINDEX	,
INTMARGIN	,
BLNINTERESTROUND	,
BLNLOANSUSPENDED	,
CHRLOANSTATUSREMARKS	,
CUR1098MIP	,
INTVENDOR	,
CHRMEMO	,
INTPAYTO	,
CURTRANSACTIONSERVICEFEE	


FROM DATAUPDT.HDTForcePost81Src Src

INNER JOIN CELINK.TBLTRANSACTIONS A
on 	Src.LOAN = A.INTSUBSERVICERLOANNUMBER 
and A.IDSTRANSACTIONCOUNT = (select max(IDSTRANSACTIONCOUNT) from CELINK.TBLTRANSACTIONS where INTSUBSERVICERLOANNUMBER = src.Loan group by INTSUBSERVICERLOANNUMBER)

--inner join CELINK.CHOOSELASTRECORD C
--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

order by SeqNum, "//IDSTRANSACTIONCOUNT//" Desc 
for read only with ur
;

----------------------------------------------------------------------------------------------------------------------
-- Validation before update ... 
-- SEQNUM ROWNUM //IDSTRANSACTIONCOUNT// //TranCode// @@IDSPOOLID@@ IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE //Loan//  INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE //UserMe// //CreationDate// //EffDate// DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE //TranAmnt// CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED //CURTRANSACTIONINTEREST// //CURTRANSACTIONMIP// //CURUNSCHEDULEDPAYMENTUPB// CURUNSCHEDULEDPAYMENTINTEREST //CURUNSCHEDULEDPAYINTACCRUED// CURUNSCHEDULEDPAYMENTMIP ??CURUNSCHEDULEDPAYMIPACCRUED?? CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP //CURTOTALUPB// CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL //CURNETPL//  CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE //CURNETLOC// CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE //INTCURRENTINTRATE// INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------ ------ ----------------------- ------------ ------------- ------------- ---------------- ------------- --------- ---------------- ---------------- ----------- -------------- --------------- ---------- ---------------- ----------- -------------- -------------- --------------- ------------ ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- -------------------------- --------------------- ---------------------------- ----------------------------- ------------------------------- ------------------------ ------------------------------- ------------------- -------------------- --------------- --------------- --------------- -------------- -------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- --------------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--      1      1                     101           44 2021RPIT2              4800             4800             0 3204434.0              0.0 0                EE          Line of Credit ARM 444         tkato      2025-08-27       2025-08-27  2021-04-30     2021-04-26     2999-01-01      10000.000000          763641.540000               147242.590000                  0.000000               0.000000                  0.000000                  10.780000              0.000000                359297.250000                 -78854.390000                      180.530000                 0.000000                        0.000000     -1242224.250000          2046.900000        0.000000   531200.000000  1122938.790000 2124800.000000 2264576.730000   1573600.000000 688468.300000    4150000.000000        4150000.000000                  0.000000              0.000000           20000.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000    1593600.000000 728468.300000 688468.300000      20.000000            500.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0           0.055               0.09835               0.055  0.04585    0.0525                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      1      1                     100           44 2021RPIT2              4800             4800             0 3204434.0              0.0 0                EE          Line of Credit ARM 444         cking      2025-08-22       2025-08-22  2021-04-30     2021-04-26     2999-01-01      10000.000000          763641.540000               147242.590000                  0.000000               0.000000                  0.000000                  24.250000              0.000000                349297.250000                 -78854.390000                      169.750000                 0.000000                        0.000000     -1242224.250000          2046.900000        0.000000   531200.000000  1112938.790000 2124800.000000 2264576.730000   1573600.000000 698468.300000    4150000.000000        4150000.000000                  0.000000              0.000000           20000.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000    1593600.000000 728468.300000 698468.300000      20.000000            500.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0           0.055               0.09835               0.055  0.04585    0.0525                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

----------------------------------------------------------------------------------------------------------------------
-- Validation right before update 
--				 //IDSTRANSACTIONCOUNT// //TranCode// @@IDSPOOLID@@ IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE //Loan// INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE //UserMe// //CreationDate// //EffDate// DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE TranAmnt     CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED //CURTRANSACTIONINTEREST// //CURTRANSACTIONMIP// //CURUNSCHEDULEDPAYMENTUPB// CURUNSCHEDULEDPAYMENTINTEREST //CURUNSCHEDULEDPAYINTACCRUED// CURUNSCHEDULEDPAYMENTMIP ??CURUNSCHEDULEDPAYMIPACCRUED?? CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP //CURTOTALUPB// CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL //CURNETPL//  CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE //CURNETLOC// CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE //INTCURRENTINTRATE// INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
--				 ----------------------- ------------ ------------- ------------- ---------------- ------------- -------- ---------------- ---------------- ----------- -------------- --------------- ---------- ---------------- ----------- -------------- -------------- --------------- ------------ ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- -------------------------- --------------------- ---------------------------- ----------------------------- ------------------------------- ------------------------ ------------------------------- ------------------- -------------------- --------------- --------------- --------------- -------------- -------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- --------------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--				                     101           44 2021RPIT2              4800             4800             0  3204434              0.0 0                EE          Line of Credit ARM 444         tkato      2025-08-27       2025-08-27  2021-04-30     2021-04-26     2999-01-01      10000.000000          763641.540000               147242.590000                  0.000000               0.000000                  0.000000                  10.780000              0.000000                359297.250000                 -78854.390000                      180.530000                 0.000000                        0.000000     -1242224.250000          2046.900000        0.000000   531200.000000  1122938.790000 2124800.000000 2264576.730000   1573600.000000 688468.300000    4150000.000000        4150000.000000                  0.000000              0.000000           20000.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000    1593600.000000 728468.300000 688468.300000      20.000000            500.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0           0.055               0.09835               0.055  0.04585    0.0525                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

----------------------------------------------------------------------------------------------------------------------
-- Validation AFTER update 
-- IDSTRANSID SEQNUM ROWNUM //IDSTRANSACTIONCOUNT// TranCode @@IDSPOOLID@@ IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE //Loan//  INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE //UserMe// //CreationDate// //EffDate// DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE //TranAmnt// CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED //CURTRANSACTIONINTEREST// //CURTRANSACTIONMIP// //CURUNSCHEDULEDPAYMENTUPB// CURUNSCHEDULEDPAYMENTINTEREST //CURUNSCHEDULEDPAYINTACCRUED// CURUNSCHEDULEDPAYMENTMIP ??CURUNSCHEDULEDPAYMIPACCRUED?? CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP //CURTOTALUPB// CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL //CURNETPL//  CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE //CURNETLOC// CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE //INTCURRENTINTRATE// INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ---------- ------ ------ ----------------------- -------- ------------- ------------- ---------------- ------------- --------- ---------------- ---------------- ----------- -------------- --------------- ---------- ---------------- ----------- -------------- -------------- --------------- ------------ ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- -------------------------- --------------------- ---------------------------- ----------------------------- ------------------------------- ------------------------ ------------------------------- ------------------- -------------------- --------------- --------------- --------------- -------------- -------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- --------------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--   75765204      1      1                     101       44 2021RPIT2              4800             4800             0 3204434.0              0.0 0                EE          Line of Credit ARM 444         tkato      2025-08-27       2025-08-27  2021-04-30     2021-04-26     2999-01-01      10000.000000          763641.540000               147242.590000                  0.000000               0.000000                  0.000000                  10.780000              0.000000                359297.250000                 -78854.390000                      180.530000                 0.000000                        0.000000     -1242224.250000          2046.900000        0.000000   531200.000000  1122938.790000 2124800.000000 2264576.730000   1573600.000000 688468.300000    4150000.000000        4150000.000000                  0.000000              0.000000           20000.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000    1593600.000000 728468.300000 688468.300000      20.000000            500.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0           0.055               0.09835               0.055  0.04585    0.0525                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--   75755706      1      1                     100       44 2021RPIT2              4800             4800             0 3204434.0              0.0 0                EE          Line of Credit ARM 444         cking      2025-08-22       2025-08-22  2021-04-30     2021-04-26     2999-01-01      10000.000000          763641.540000               147242.590000                  0.000000               0.000000                  0.000000                  24.250000              0.000000                349297.250000                 -78854.390000                      169.750000                 0.000000                        0.000000     -1242224.250000          2046.900000        0.000000   531200.000000  1112938.790000 2124800.000000 2264576.730000   1573600.000000 698468.300000    4150000.000000        4150000.000000                  0.000000              0.000000           20000.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000    1593600.000000 728468.300000 698468.300000      20.000000            500.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0           0.055               0.09835               0.055  0.04585    0.0525                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--   75708183      1      1                      99       44 2021RPIT2              4800             4800             0 3204434.0              0.0 0                EE          Line of Credit ARM 444         cking      2025-08-04       2025-08-04  2021-04-30     2021-04-26     2999-01-01      20000.000000          763641.540000               147242.590000                  0.000000               0.000000                  0.000000                 145.500000              0.000000                339297.250000                 -78854.390000                      145.500000                 0.000000                        0.000000     -1242224.250000          2046.900000        0.000000   531200.000000  1102938.790000 2124800.000000 2264576.730000   1573600.000000 708468.300000    4150000.000000        4150000.000000                  0.000000              0.000000           20000.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000    1593600.000000 728468.300000 708468.300000      20.000000            500.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0           0.055               0.09835               0.055  0.04585    0.0525                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
--/* Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post *

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
--* Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post Post */

select 
--TT.IDSTRANSID,
--Src.SeqNum, Src.RowNum,   -->>> test purpose, comment out when insert <<<--
Clc.IDSTRANSACTIONCOUNT "//IDSTRANSACTIONCOUNT//",
src.TranCode "//TranCode//",
TT.IDSPOOLID "@@IDSPOOLID@@",
TT.IDSSERVICERID,
TT.IDSSUBSERVICERID,
TT.IDSSTATUSCODE,
Src.Loan "//Loan//",
TT.INTFMALOANNUMBER,
TT.INTFHACASENUMBER,
TT.CHRLOANTYPE,
TT.CHRPAYTYPE,
TT.CHRINTERESTTYPE,
'tkato' "//UserMe//",
CURRENT_DATE "//CreationDate//",
Src.EffDate "//EffDate//",
TT.DTMFUNDINGDATE,
TT.DTMCLOSINGDATE,
TT.DTMPURCHASEDATE,
Src.TranAmnt "TranAmnt",
TT.CURSCHEDULEDPAYMENTUPB,
TT.CURSCHEDULEDPAYMENTINTEREST,
TT.CURSCHEDULEDPAYINTACCRUED,
TT.CURSCHEDULEDPAYMENTMIP,
TT.CURSCHEDULEDPAYMIPACCRUED,
Clc.CURTRANSACTIONINTEREST "//CURTRANSACTIONINTEREST//",
Clc.CURTRANSACTIONMIP "//CURTRANSACTIONMIP//",
Clc.CURUNSCHEDULEDPAYMENTUPB "//CURUNSCHEDULEDPAYMENTUPB//",
TT.CURUNSCHEDULEDPAYMENTINTEREST,
Clc.CURUNSCHEDULEDPAYINTACCRUED "//CURUNSCHEDULEDPAYINTACCRUED//",
TT.CURUNSCHEDULEDPAYMENTMIP,

--TT.CURUNSCHEDULEDPAYMIPACCRUED,
Clc.CURUNSCHEDULEDPAYMIPACCRUED "??CURUNSCHEDULEDPAYMIPACCRUED??",

TT.CURREPAYMENTBALANCE,
TT.CURREPAYMENTINTEREST,
TT.CURREPAYMENTMIP,
TT.CURORIGTOTALUBP,
Clc.CURTOTALUPB "//CURTOTALUPB//",
TT.CURORIGINALPL,
TT.CURCURRENTPL,
TT.CURORIGINALNETPL,
Clc.CURNETPL "//CURNETPL//",
TT.CURMAXCLAIMAMOUNT,
TT.CURPROPAPPRAISEDVALUE,
TT.CURORIGSERVICEFEESETASIDE,
TT.CURSERVICEFEESETASIDE,
TT.CURORIGREPAIRSSETASIDE,
TT.CURREPAIRSSETASIDE,
TT.CURORGFRSTYRPROPCHARGESETASIDE,
TT.CURFIRSTYRPROPCHARGESETASIDE,
TT.CURORIGTAXINSURSETASIDE,
TT.CURTAXINSURSETASIDE,
TT.CURORIGLOCRESERVE,
TT.CURLOCRESERVE,
Clc.CURNETLOC "//CURNETLOC//",
TT.CURSERVICEFEES,
TT.CURACCRUEDSERVICEFEES,
TT.CURPLANCHANGESERVICEFEES,
TT.CURACCRUEDPLANCHANGEFEES,
TT.CUR1098INTEREST,
TT.CURMNTHLYPAYMENTS,
TT.CURMNTHLYWITHHOLD,
TT.CHRPLANCHANGEREASON,
TT.INTTERMMONTHS,
TT.INTTERMMONTHSLEFT,
TT.INTBEGININTRATE,
Clc.INTCURRENTINTRATE "//INTCURRENTINTRATE//",
TT.INTEXPECTAVGINTRATE,
TT.INTINDEX,
TT.INTMARGIN,
TT.BLNINTERESTROUND,
TT.BLNLOANSUSPENDED,
TT.CHRLOANSTATUSREMARKS,
TT.CUR1098MIP,
TT.INTVENDOR,
TT.CHRMEMO,
TT.INTPAYTO,
TT.CURTRANSACTIONSERVICEFEE

from DATAUPDT.HDTForcePost81Src Src

inner join DATAUPDT.HDTForcePost81Clc Clc
on  src.LOAN = Clc.INTSUBSERVICERLOANNUMBER
and Src.ROWNUM = Clc.ROWNUM

inner join DATAUPDT.HDTForcePost81Trn Trn
on Src.LOAN = Trn.INTSUBSERVICERLOANNUMBER

inner join CELINK.TBLTRANSACTIONS TT
on  Trn.INTSUBSERVICERLOANNUMBER = TT.INTSUBSERVICERLOANNUMBER
and Trn.IDSTRANSACTIONCOUNT = TT.IDSTRANSACTIONCOUNT

order by Src.SeqNum
;


		-----------------------------------------------------------------
		-----------------------------------------------------------------
		-- validation after

		select
			IDSTRANSID, 
			Src.SeqNum, Src.RowNum,   -->>> test purpose
		IDSTRANSACTIONCOUNT	"//IDSTRANSACTIONCOUNT//",
		IDSTRANSACTIONCODE "TranCode",
		IDSPOOLID "@@IDSPOOLID@@"	,
		IDSSERVICERID	,
		IDSSUBSERVICERID	,
		IDSSTATUSCODE	,
		INTSUBSERVICERLOANNUMBER "//Loan//",
		INTFMALOANNUMBER	,
		INTFHACASENUMBER	,
		CHRLOANTYPE	,
		CHRPAYTYPE	,
		CHRINTERESTTYPE	,
		IDSUSERID	 "//UserMe//",
		DTMTRANSACTIONCREATIONDATE "//CreationDate//",
		DTMEFFECTIVEDATE "//EffDate//",
		DTMFUNDINGDATE	,
		DTMCLOSINGDATE	,
		DTMPURCHASEDATE	,
		CURTRANSACTIONAMT "//TranAmnt//",
		CURSCHEDULEDPAYMENTUPB	,
		CURSCHEDULEDPAYMENTINTEREST	,
		CURSCHEDULEDPAYINTACCRUED	,
		CURSCHEDULEDPAYMENTMIP	,
		CURSCHEDULEDPAYMIPACCRUED	,
		CURTRANSACTIONINTEREST "//CURTRANSACTIONINTEREST//",
		CURTRANSACTIONMIP "//CURTRANSACTIONMIP//",
		CURUNSCHEDULEDPAYMENTUPB "//CURUNSCHEDULEDPAYMENTUPB//",
		
		CURUNSCHEDULEDPAYMENTINTEREST	,
		CURUNSCHEDULEDPAYINTACCRUED  "//CURUNSCHEDULEDPAYINTACCRUED//",
		
		CURUNSCHEDULEDPAYMENTMIP	,
		CURUNSCHEDULEDPAYMIPACCRUED	"??CURUNSCHEDULEDPAYMIPACCRUED??",
		
		CURREPAYMENTBALANCE	,
		CURREPAYMENTINTEREST	,
		CURREPAYMENTMIP	,
		CURORIGTOTALUBP	,
		CURTOTALUPB "//CURTOTALUPB//",
		CURORIGINALPL	,
		CURCURRENTPL	,
		CURORIGINALNETPL	,
		CURNETPL "//CURNETPL//",
		CURMAXCLAIMAMOUNT	,
		CURPROPAPPRAISEDVALUE	,
		CURORIGSERVICEFEESETASIDE	,
		CURSERVICEFEESETASIDE	,
		CURORIGREPAIRSSETASIDE	,
		CURREPAIRSSETASIDE	,
		CURORGFRSTYRPROPCHARGESETASIDE	,
		CURFIRSTYRPROPCHARGESETASIDE	,
		CURORIGTAXINSURSETASIDE	,
		CURTAXINSURSETASIDE	,
		CURORIGLOCRESERVE	,
		CURLOCRESERVE	,
		CURNETLOC "//CURNETLOC//",
		CURSERVICEFEES	,
		CURACCRUEDSERVICEFEES	,
		CURPLANCHANGESERVICEFEES	,
		CURACCRUEDPLANCHANGEFEES	,
		CUR1098INTEREST	,
		CURMNTHLYPAYMENTS	,
		CURMNTHLYWITHHOLD	,
		CHRPLANCHANGEREASON	,
		INTTERMMONTHS	,
		INTTERMMONTHSLEFT	,
		INTBEGININTRATE	,
		INTCURRENTINTRATE "//INTCURRENTINTRATE//",
		INTEXPECTAVGINTRATE	,
		INTINDEX	,
		INTMARGIN	,
		BLNINTERESTROUND	,
		BLNLOANSUSPENDED	,
		CHRLOANSTATUSREMARKS	,
		CUR1098MIP	,
		INTVENDOR	,
		CHRMEMO	,
		INTPAYTO	,
		CURTRANSACTIONSERVICEFEE	
		
		
		FROM DATAUPDT.HDTForcePost81Src Src
		
		INNER JOIN CELINK.TBLTRANSACTIONS A
		on 	Src.LOAN = A.INTSUBSERVICERLOANNUMBER 
		and A.IDSTRANSACTIONCOUNT >= (select max(IDSTRANSACTIONCOUNT) from CELINK.TBLTRANSACTIONS where INTSUBSERVICERLOANNUMBER = src.Loan group by INTSUBSERVICERLOANNUMBER) -2
		
		--inner join CELINK.CHOOSELASTRECORD C
		--	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
		--	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
		
		order by SeqNum, "//IDSTRANSACTIONCOUNT//" Desc 
		for read only with ur
		;

		-- paste result above --
		
--------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
------ Notes update 
--** sample ... note this picks 2 sets when there is 2 loans
-- SEQNUM HDT    DTMNOTEDATE           IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                              CHRUSERID BLNPRIORITY NOTESTEP
-- ------ ------ --------------------- ------------ ------------------------ ------------------------------------------------------------------------- --------- ----------- --------
--   1001 166921 2024-07-10 11:30:18.0    184472540                3292964.0 Per HDT 166921 Transaction 81 has been forced in the amount of -$478.66.  cking               0     NULL
--   1001 166921 2024-07-10 11:30:24.0    184472546                3292964.0 Per HDT 166921 Transaction 81 has been forced in the amount of -$71.80.   cking               0     NULL
--   1002 166921 2024-07-10 11:30:18.0    184472540                3292964.0 Per HDT 166921 Transaction 81 has been forced in the amount of -$478.66.  cking               0     NULL
--   1002 166921 2024-07-10 11:30:24.0    184472546                3292964.0 Per HDT 166921 Transaction 81 has been forced in the amount of -$71.80.   cking               0     NULL
--   2001 166913 2024-07-10 11:30:13.0    184472531                3277307.0 Per HDT 166913 Transaction 81 has been forced in the amount of -$2295.28. cking               0     NULL
--   3001 166877 2024-07-10 11:30:07.0    184472517                3296250.0 Per HDT 166877 Transaction 81 has been forced in the amount of -$200.00.  cking               0     NULL


select * FROM DATAUPDT.HDTForcePost81Src Src order by seqnum;
-- ROWNUM SEQNUM HDTNUM REQUESTER  LOAN    TRANAMNT    EFFDATE    DAYSTOEOM TRANCODE MIPRATE LOANTYPE     LOANSUBTYPE RATEBASE CHANGEREQUIRED
-- ------ ------ ------ ---------- ------- ----------- ---------- --------- -------- ------- ------------ ----------- -------- --------------

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
Select 
--	SeqNum ,
	Loan	
	,
   'Per HDT ' || HDTNum || ' Transaction ' || TRANCODE || ' has been forced in the amount of ' || case when TRANAMNT < 0 then '-' else '' end || '$' || trim(VARCHAR_FORMAT(abs(TRANAMNT), '99999999999990.00')) ||'.'   
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
	from DATAUPDT.HDTForcePost81Src   
Order by SeqNum 
; 

/* select 
 LOAN    2                                                                         3                          4     5 6
 ------- ------------------------------------------------------------------------- -------------------------- ----- - -
 3204434 Per HDT 198087 Transaction 44 has been forced in the amount of $10000.00. 2025-08-27 13:19:33.575691 tkato 0 0
*/

------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
from DATAUPDT.HDTForcePost81Src UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'

order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;

/* result

 SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                              CHRUSERID BLNPRIORITY NOTESTEP
 ------ -------------------------- ------------ ------------------------ ------------------------------------------------------------------------- --------- ----------- --------
      1 2025-08-27 13:19:57.382363    212945574                3204434.0 Per HDT 198087 Transaction 44 has been forced in the amount of $10000.00. tkato               0        0

--*--
1 transaction posted.  Peer review pending.
9 transactions posted.  Peer review pending.

*/


--------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
------ EOF 105 Adj




---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------------
-- cursors in SP 
------------------------

-- 1 source data 
-- DECLARE csrSrc CURSOR FOR 
	select 
		a.RowNum, a.SeqNum, 
		--a.HDTNum, a.Requester, 
		a.Loan, a.TranAmnt, a.EffDate, a.DaysToEOM, a.TranCode, a.MIPRate, a.LoanType
 	from DATAUPDT.HDTForcePost81Src a
 	order by a.SeqNum
 	;	 	
	





-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ref ...
-- first day of month, last day of month
-- in DB2, the last day of last month is: 
select CURRENT DATE - (DAY(CURRENT DATE)) DAYS from SYSIBM.SYSDUMMY1;
-- ----------
-- 2019-02-28
		select date ('2019-03-09') - (DAY(date ('2019-03-09'))) DAYS from SYSIBM.SYSDUMMY1;
		-- ----------
		-- 2019-02-28
		
--The first day of this month is: 
select CURRENT DATE - (DAY(CURRENT DATE) - 1) DAYS  from SYSIBM.SYSDUMMY1;
-- ----------
-- 2019-03-01


--Last day of last month:
SELECT CURRENT DATE - (DAY(CURRENT DATE) DAYS) from SYSIBM.SYSDUMMY1;
-- ----------
-- 2019-02-28
		SELECT (date ('2019-03-09') - (DAY(date ('2019-03-09')) DAYS)) from SYSIBM.SYSDUMMY1;
		-- ----------
		-- 2019-02-28



--First day of last month:
SELECT (CURRENT DATE - (DAY(CURRENT DATE) DAYS)) - 1 MONTH + 1 DAY from SYSIBM.SYSDUMMY1;
--???
--  ----------
-- 2019-01-29
		SELECT (date ('2019-03-09') - (DAY(date ('2019-03-09')) DAYS)) - 1 MONTH + 1 DAY from SYSIBM.SYSDUMMY1;
		--???
		--  ----------
		-- 2019-01-29
 
		SELECT (date ('2019-03-09') - (DAY(date ('2019-03-09')) DAYS)) - 1 MONTH from SYSIBM.SYSDUMMY1;
		--  ----------
		-- 2019-01-28
 
-- ted version ... this works
SELECT CURRENT DATE - (DAY(CURRENT DATE) DAYS) from SYSIBM.SYSDUMMY1;
SELECT year(CURRENT DATE - (DAY(CURRENT DATE) DAYS)) || '-' || month(CURRENT DATE - (DAY(CURRENT DATE) DAYS)) || '-01'  from SYSIBM.SYSDUMMY1;
SELECT year(CURRENT DATE - (DAY(CURRENT DATE) DAYS)) || '-' || right('00' || month(CURRENT DATE - (DAY(CURRENT DATE) DAYS)),2) || '-01'  from SYSIBM.SYSDUMMY1;
-- ----------
-- 2019-02-01
SELECT date(year(CURRENT DATE - (DAY(CURRENT DATE) DAYS)) || '-' || right('00' || month(CURRENT DATE - (DAY(CURRENT DATE) DAYS)),2) || '-01')  from SYSIBM.SYSDUMMY1;


-- validation
select round(-160.206800, 4) from SYSIBM.SYSDUMMY1;
-- -----------
-- -160.206800
select round(-160.206800, 2) from SYSIBM.SYSDUMMY1;
-- -----------
-- -160.210000

select round(-61618.000000  * 0.002600, 4) from SYSIBM.SYSDUMMY1; -- -160.210000 .vs.  -160.200000
	-- -----------------
	-- -160.206800000000
select round(-61618.000000  * 0.002600, 2) from SYSIBM.SYSDUMMY1; -- -160.210000 .vs.  -160.200000
	-- -----------------
	-- -160.210000000000
 
select round(-290.220000 * 0.018571,4) from SYSIBM.SYSDUMMY1; 
-- ---------------
-- -5.389675620000
  
select 'test ' || cast(3040521 as varchar(10)) || ' loan' from SYSIBM.SYSDUMMY1; 
	-- -----------------
	-- test 3040521 loan
select 'test ' || 3040521 || ' loan' from SYSIBM.SYSDUMMY1; 
 	