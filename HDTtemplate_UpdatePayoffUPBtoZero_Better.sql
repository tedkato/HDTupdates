
/*
20210423 ... Finding_HDT82238_UpdatePayoffUPBtoZero.sql

C:\Users\Ted.Kato\Documents\HDTUpdtNotes_82238.csv

INCIDENT #82238
Ryan LaRose
Chief Operations Officer
UPB or LOC Change (Balances)
Created: Apr 21, 2021 at 9:57 AM by Ryan LaRose

Update payoff UPB to $0

rptPayoffWithUPB.xlsx 

--
Cyndie King
Apr 21, 2021 at 4:27 PM
Done. On Hold pending verification.
If the data is satisfactory, please do not respond -- not even to approve the update -- and the ticket will be closed after a week or so.
If the data is not satisfactory, please respond prior to the ticket being closed or any comments will go unseen by the Help Desk.

--*--
13 transactions posted

--
="(" & E3 & ", 82238, 'Ryan LaRose', " & A3 & ", '" & TEXT(C3, "YYYY-MM-DD") & "', " & D3 & "),"
(1, 82238, 'Ryan LaRose', 1300458, '2021-04-19', -645.37),
(2, 82238, 'Ryan LaRose', 3003878, '2021-04-16', 0.09),
(3, 82238, 'Ryan LaRose', 3011758, '2021-04-20', 0.03),
(4, 82238, 'Ryan LaRose', 3014751, '2021-04-20', 0.03),
(5, 82238, 'Ryan LaRose', 3019633, '2021-04-19', -0.02),
(6, 82238, 'Ryan LaRose', 3026551, '2021-04-20', -0.01),
(7, 82238, 'Ryan LaRose', 3035825, '2021-04-19', -0.02),
(8, 82238, 'Ryan LaRose', 3038836, '2021-04-20', -0.01),
(9, 82238, 'Ryan LaRose', 3049690, '2021-04-20', 0.18),
(10, 82238, 'Ryan LaRose', 3054513, '2021-04-20', 0.01),
(11, 82238, 'Ryan LaRose', 3063542, '2021-04-20', -0.05),
(12, 82238, 'Ryan LaRose', 3072550, '2021-04-19', 1.75),
(13, 82238, 'Ryan LaRose', 3133476, '2021-04-19', -398.77),

*/

---------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------


/*
20250829
198293	Ted Kato	Payoff UPB to zero	Ryan LaRose		Low	8/29/2025 12:00
Please update the payoff UPB to $0
="(" & E3 & ", 198293, 'Ryan LaRose', " & A3 & ", '" & TEXT(C3, "YYYY-MM-DD") & "', " & D3 & "),"
*/

------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------
-- Notes ... check previous  
select 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from celink.tblloannotes a  
	where a.INTSUBSERVICERLOANNUMBER in (1023433) 
	order by a.IDSLOANNOTES desc 
for read only with UR;

--------------------------------------
-- check to see how it is prior to resolution ...
select  
	INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT,	IDSTRANSACTIONCODE, IDSSTATUSCODE,	dtmEFFECTIVEDATE, DTMTRANSACTIONCREATIONDATE, IDSUSERID, CHRPAYTYPE,
	
	CURTRANSACTIONAMT        as "Amount",
	CURSCHEDULEDPAYMENTUPB   as "SP UPB",
	CURUNSCHEDULEDPAYMENTUPB as "USP UPB", 
	CURTOTALUPB              as "Total UPB",
	CURTRANSACTIONINTEREST   as "TransInt",
	CURTRANSACTIONMIP        as "TransMIP",
	CURTRANSACTIONSERVICEFEE as "ServiceFee"
	, '---->'
	, *
	from celink.TBLTRANSACTIONS 
where INTSUBSERVICERLOANNUMBER = 1015883 -- and IDSTRANSACTIONCOUNT in ( , ) -- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
order by INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT desc
for read only with ur;

-- INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID    CHRPAYTYPE     Amount         SP UPB        USP UPB      Total UPB     TransInt   TransMIP  ServiceFee 16    IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID    DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS                CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ------------------- ------------------ ------------- ---------------- -------------------------- ------------ -------------- -------------- ------------- ------------ ------------- ---------- --------- ---------- ----- ---------- ------------------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ------------ -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- ----------------------------------- ----------- --------- ------- -------- ------------------------
--                1378485.0                 248                 35           104 2024-07-30       2024-07-31                 CNagle       Line of Credit -171339.720000      0.000000     0.030000      0.030000 835.210000 67.670000        0.0 ---->   69027055                 248                 35 RMF_FNMA_F     249240001        234790013           104                1378485.0    6.000318652E9 000936178071     HECM        Line of Credit ARM 857         CNagle       2024-07-31                 2024-07-30       2007-10-15     2007-10-10     2018-09-01         -171339.720000               0.000000                    0.000000                  0.000000               0.000000                  0.000000             835.210000         67.670000                 0.030000                      0.000000                    0.000000                 0.000000                    0.000000         -267.200000             0.290000        0.040000    80567.930000      0.030000  85670.000000 136380.990000     80567.930000      0.000000     130000.000000         130000.000000               5102.070000           3605.150000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -26492.620000 -37630.950000      30.000000              0.000000                 0.000000                 0.000000    48300.070000          0.000000          0.000000                                 0                 0          0.0512            0.0617              0.0557   0.0517      0.01                0               -1 Loan Paid in Full                   9535.550000      NULL NULL        NULL                      0.0
--                1378485.0                 247                 92            13 2024-07-17       2024-07-17                 Batch        Line of Credit      30.000000 159268.460000 11138.330000 170406.790000   0.070000  0.010000        0.0 ---->   68958006                 247                 92 RMF_FNMA_F     249240001        234790013            13                1378485.0    6.000318652E9 000936178071     HECM        Line of Credit ARM 857         Batch        2024-07-17                 2024-07-17       2007-10-15     2007-10-10     2018-09-01              30.000000          159268.460000                46294.990000                  0.000000            9325.280000                  0.000000               0.070000          0.010000             11138.330000                   1169.870000                    0.070000               142.600000                    0.010000         -267.200000             0.290000        0.040000    80567.930000 170406.790000  85670.000000 136380.990000     80567.930000 -37630.950000     130000.000000         130000.000000               5102.070000           3605.150000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -26492.620000 -37630.950000      30.000000           6030.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0512            0.0617              0.0557   0.0517      0.01                0               -1 Refer for FCL: Tax & Insurance         0.000000      NULL NULL        NULL                      0.0
--
--(1, 0169012, 'Ryan LaRose', 1378485, '2024-07-30', 0.0300),

-- sample from previous
--(1, 168830, 'Ryan LaRose', 1015883, '2024-07-22', 1.76),
-- INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID    CHRPAYTYPE      Amount         SP UPB        USP UPB      Total UPB     TransInt    TransMIP  ServiceFee 16    IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE      CHRINTERESTTYPE IDSUSERID    DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE    INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS        CUR1098MIP   INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ------------------- ------------------ ------------- ---------------- -------------------------- ------------ --------------- -------------- ------------- ------------ ------------- ----------- --------- ---------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- --------------- --------------- ------------ -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- -------------------- ------------------- -------- --------- ---------------- ---------------- --------------------------- ------------ --------- ------- -------- ------------------------
--                1015883.0                 647                105           104 2024-07-30       2024-07-30                 tkato        Modified Tenure      -1.760000      0.000000     0.000000      0.000000    0.000000  0.000000        0.0 ---->   69024492                 647                105 35            234790013        234790013           104                1015883.0    6.000423551E9 000950723065     HECM        Modified Tenure ARM 857         tkato        2024-07-30                 2024-07-30       2008-06-23     2008-06-18     2008-06-23              -1.760000               0.000000                    0.000000                  0.000000               0.000000                  0.000000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000        -4531.160000             3.230000        0.320000    12389.250000      0.000000 125705.000000 210461.890000    109562.690000      0.000000     155000.000000         155000.000000               3753.060000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       1581.000000   1942.040000  -233.600000      30.000000              0.000000                 0.000000                 0.000000    60311.480000         32.190000          0.000000                                 0               -48          0.0401               0.0667              0.0535   0.0517     0.015                0               -1 Loan Paid in Full           11263.760000      NULL NULL        NULL                      0.0
--                1015883.0                 646                 31           104 2024-07-22       2024-07-22                 CNagle       Modified Tenure -211512.170000      0.000000     1.760000      1.760000  808.060000 60.570000        0.0 ---->   68973009                 646                 31 35            234790013        234790013           104                1015883.0    6.000423551E9 000950723065     HECM        Modified Tenure ARM 857         CNagle       2024-07-22                 2024-07-22       2008-06-23     2008-06-18     2008-06-23         -211512.170000               0.000000                    0.000000                  0.000000               0.000000                  0.000000             808.060000         60.570000                 1.760000                      0.000000                    0.000000                 0.000000                    0.000000        -4531.160000             3.230000        0.320000    12389.250000      1.760000 125705.000000 210461.890000    109562.690000      0.000000     155000.000000         155000.000000               3753.060000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       1581.000000   1942.040000  -233.600000      30.000000              0.000000                 0.000000                 0.000000    60311.480000         32.190000          0.000000                                 0               -48          0.0401               0.0667              0.0535   0.0517     0.015                0               -1 Loan Paid in Full           11263.760000      NULL NULL        NULL                      0.0
--                1015883.0                 645                 92            55 2024-07-17       2024-07-17                 Batch        Modified Tenure      30.000000 208439.570000  2175.640000 210615.210000    0.080000  0.010000        0.0 ---->   68957989                 645                 92 35            234790013        234790013            55                1015883.0    6.000423551E9 000950723065     HECM        Modified Tenure ARM 857         Batch        2024-07-17                 2024-07-17       2008-06-23     2008-06-18     2008-06-23              30.000000          208439.570000                59117.760000                  0.000000            8202.030000                  0.000000               0.080000          0.010000              2175.640000                    385.660000                    0.080000                 3.000000                    0.010000        -4531.160000             3.230000        0.320000    12389.250000 210615.210000 125705.000000 210461.890000    109562.690000   -153.320000     155000.000000         155000.000000               3753.060000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000       1581.000000   1942.040000  -233.600000      30.000000           5790.000000                 0.000000                 0.000000        0.000000         32.190000          0.000000                                 0               -48          0.0401               0.0667              0.0535   0.0517     0.015                0               -1 Called Due: Death            2998.160000      NULL NULL        NULL                      0.0

----------------------------------------------------------------------------------------------------------------------------------------------------
/*
--  
--create table DATAUPDT.HDTUpdatePayoffUPBtoZero   
--	(
--	SeqNum integer,
--	HDTNum integer, 
--	Requester varchar(30) ,
--	Loan      integer,
--	
--	PayoffEffDate DATE, 
--	LastTranTotalUPB decimal(16,6)
----	, 
----	NewAmount  decimal(16,6),  
----	BadAmount  decimal(16,6),   
----	CurAmount  decimal(16,6)   -- -- tbltransactions.CURTRANSACTIONAMT
--
--	)
--	COMPRESS YES ADAPTIVE
--	IN DATAUPDT_TS16;
--GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.HDTUpdatePayoffUPBtoZero  TO group db2_ast;
--	

-- drop table DATAUPDT.HDTUpdatePayoffUPBtoZero;
select * from DATAUPDT.HDTUpdatePayoffUPBtoZero;
*/

-------------------------------------------------------------------------------------------------------------------------------------
-- Clear DATAUPDT table 
DELETE from DATAUPDT.HDTUpdatePayoffUPBtoZero;
	
----------------------------------------------------------------------------------------------------------------------------------------------------

insert into DATAUPDT.HDTUpdatePayoffUPBtoZero 
(	SeqNum ,
	HDTNum , 
	Requester ,
	Loan ,
	PayoffEffDate , 
	LastTranTotalUPB
)	
with Param (SeqNum, HDTNum, Requester, Loan, PayoffEffDate, LastTranTotalUPB) as 
(VALUES 

(1, 198293, 'Ryan LaRose', 1331223, '2025-08-04', 1464.54),
(2, 198293, 'Ryan LaRose', 1382222, '2025-08-04', 0.02)

) --(SeqNum, HDTNum, Requester, Loan, PayoffEffDate, LastTranTotalUPB)
select 
P.SeqNum, P.HDTNum, P.Requester, P.Loan, P.PayoffEffDate, P.LastTranTotalUPB 
from  Param P
order by P.SeqNum
with ur;	  

	-------------------------------------------------
	select * from DATAUPDT.HDTUpdatePayoffUPBtoZero order by seqnum;
	--	 SEQNUM HDTNUM REQUESTER   LOAN    PAYOFFEFFDATE LASTTRANTOTALUPB
	--	 ------ ------ ----------- ------- ------------- ----------------
	--	      1 198293 Ryan LaRose 1331223 2025-08-04         1464.540000
	--	      2 198293 Ryan LaRose 1382222 2025-08-04            0.020000
	

/* ***** use UNION method below *************************************************************************************** */
-------------------------------------------------------------------------------------------------------------------------------------------
-- check current values ... using max count
select
	SeqNum, P.HDTNum, P.Requester, P.Loan, P.PayoffEffDate, TT.DTMEFFECTIVEDATE, P.LastTranTotalUPB, TT.CURTOTALUPB 
	,
    TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSID, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.CHRPAYTYPE, 
	TT.CURTRANSACTIONAMT        as "Amount",
	TT.CURTOTALUPB              as "Total UPB",
	TT.CURUNSCHEDULEDPAYMENTUPB as "USP UPB", 
	TT.CURSCHEDULEDPAYMENTUPB   as "SP UPB",
	TT.CURTRANSACTIONINTEREST   as "TransInt",
	TT.CURTRANSACTIONMIP        as "TransMIP",
	TT.CURTRANSACTIONSERVICEFEE as "ServiceFee"

from  DATAUPDT.HDTUpdatePayoffUPBtoZero P

inner join celink.tbltransactions TT
	on  P.loan = TT.INTSUBSERVICERLOANNUMBER

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

 
-- place the result below and verify the results from one below, they should match 
--
-------------------------------------------------------------------------------------------------------------------------------------------
-- check current values ... using effective date and UPB amount
select
	SeqNum, P.HDTNum, P.Requester, P.Loan, P.PayoffEffDate, TT.DTMEFFECTIVEDATE, P.LastTranTotalUPB, TT.CURTOTALUPB 
	,
    TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSID, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.CHRPAYTYPE, 
	TT.CURTRANSACTIONAMT        as "Amount",
	TT.CURTOTALUPB              as "Total UPB",
	TT.CURUNSCHEDULEDPAYMENTUPB as "USP UPB", 
	TT.CURSCHEDULEDPAYMENTUPB   as "SP UPB",
	TT.CURTRANSACTIONINTEREST   as "TransInt",
	TT.CURTRANSACTIONMIP        as "TransMIP",
	TT.CURTRANSACTIONSERVICEFEE as "ServiceFee"

from  DATAUPDT.HDTUpdatePayoffUPBtoZero P

inner join celink.tbltransactions TT
	on  P.loan             = TT.INTSUBSERVICERLOANNUMBER
	and P.PayoffEffDate    = TT.DTMEFFECTIVEDATE
	and P.LastTranTotalUPB = TT.CURTOTALUPB
	and TT.IDSTRANSACTIONCODE in (31,32,33,34,35)

--inner join CELINK.CHOOSELASTRECORD XX  
--	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
--	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 

/* *****
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

/* use below union
-- check 1

-- check 2
 SEQNUM HDTNUM REQUESTER   LOAN    PAYOFFEFFDATE DTMEFFECTIVEDATE LASTTRANTOTALUPB CURTOTALUPB   INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE CHRPAYTYPE     Amount         Total UPB     USP UPB        SP UPB        TransInt    TransMIP  ServiceFee
 ------ ------ ----------- ------- ------------- ---------------- ---------------- ------------- ------------------------ ---------- ------------------- ------------------ -------------- -------------- ------------- -------------- ------------- ----------- --------- ----------
      1 190919 Ryan LaRose 1003467 2025-05-01    2025-05-01              -0.130000     -0.130000                1003467.0   74147587                 606                 31 Line of Credit -223128.070000     -0.130000      -0.130000      0.000000    0.000000  0.000000        0.0
      2 190919 Ryan LaRose 1018605 2025-05-01    2025-05-01               0.010000      0.010000                1018605.0   74145820                 621                 31 Line of Credit -417033.900000      0.010000       0.010000      0.000000    0.000000  0.000000        0.0
      3 190919 Ryan LaRose 1023235 2025-05-01    2025-05-01              -0.030000     -0.030000                1023235.0   74144033                 391                 35 Line of Credit  -96272.920000     -0.030000      -0.030000      0.000000    0.000000  0.000000        0.0
      4 190919 Ryan LaRose 1378530 2025-05-22    2025-05-22              -0.020000     -0.020000                1378530.0   74191952                 246                 31 Line of Credit -238183.630000     -0.020000      -0.020000      0.000000  695.050000 68.270000        0.0
      5 190919 Ryan LaRose 3002687 2025-05-16    2025-05-16          124211.960000 124211.960000                3002687.0   74185249                 207                 34 Line of Credit -200000.000000 124211.960000  124211.960000      0.000000 1077.500000  0.000000        0.0
      7 190919 Ryan LaRose 3362148 2025-05-05    2025-05-05           91712.940000  91712.940000                3362148.0   74158204                   8                 32 Line of Credit -164181.610000  91712.940000 -164151.610000 255864.550000  142.730000 14.020000        0.0

*/

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- UNION USE
-------------------------------------------------------------------------------------------------------------------------------------------
-- check current values ... using max count
select
	'Maxx count' "Method",
	SeqNum, P.HDTNum, P.Requester, P.Loan, P.PayoffEffDate, TT.DTMEFFECTIVEDATE, P.LastTranTotalUPB, TT.CURTOTALUPB 
	,
    TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSID, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.CHRPAYTYPE, 
	TT.CURTRANSACTIONAMT        as "Amount",
	TT.CURTOTALUPB              as "Total UPB",
	TT.CURUNSCHEDULEDPAYMENTUPB as "USP UPB", 
	TT.CURSCHEDULEDPAYMENTUPB   as "SP UPB",
	TT.CURTRANSACTIONINTEREST   as "TransInt",
	TT.CURTRANSACTIONMIP        as "TransMIP",
	TT.CURTRANSACTIONSERVICEFEE as "ServiceFee"

from  DATAUPDT.HDTUpdatePayoffUPBtoZero P

inner join celink.tbltransactions TT
	on  P.loan = TT.INTSUBSERVICERLOANNUMBER

inner join CELINK.CHOOSELASTRECORD XX  
	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT 

-------------------------------------------------------------------------------------------------------------------------------------------
UNION
-------------------------------------------------------------------------------------------------------------------------------------------

-- check current values ... using effective date and UPB amount
select
	'EffDateAmt' "Method",
	SeqNum, P.HDTNum, P.Requester, P.Loan, P.PayoffEffDate, TT.DTMEFFECTIVEDATE, P.LastTranTotalUPB, TT.CURTOTALUPB 
	,
    TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSID, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.CHRPAYTYPE, 
	TT.CURTRANSACTIONAMT        as "Amount",
	TT.CURTOTALUPB              as "Total UPB",
	TT.CURUNSCHEDULEDPAYMENTUPB as "USP UPB", 
	TT.CURSCHEDULEDPAYMENTUPB   as "SP UPB",
	TT.CURTRANSACTIONINTEREST   as "TransInt",
	TT.CURTRANSACTIONMIP        as "TransMIP",
	TT.CURTRANSACTIONSERVICEFEE as "ServiceFee"

from  DATAUPDT.HDTUpdatePayoffUPBtoZero P

inner join celink.tbltransactions TT
	on  P.loan             = TT.INTSUBSERVICERLOANNUMBER
	and P.PayoffEffDate    = TT.DTMEFFECTIVEDATE
	and P.LastTranTotalUPB = TT.CURTOTALUPB
	and TT.IDSTRANSACTIONCODE in (31,32,33,34,35)

order by SeqNum
with ur;	 

/* --result from union --

 Method     SEQNUM HDTNUM REQUESTER   LOAN    PAYOFFEFFDATE DTMEFFECTIVEDATE LASTTRANTOTALUPB CURTOTALUPB INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE CHRPAYTYPE     Amount         Total UPB   USP UPB     SP UPB   TransInt   TransMIP  ServiceFee
 ---------- ------ ------ ----------- ------- ------------- ---------------- ---------------- ----------- ------------------------ ---------- ------------------- ------------------ -------------- -------------- ----------- ----------- -------- ---------- --------- ----------
 EffDateAmt      1 198293 Ryan LaRose 1331223 2025-08-04    2025-08-04            1464.540000 1464.540000                1331223.0   75713015                 308                 31 Line of Credit -467726.290000 1464.540000 1464.540000 0.000000 191.950000 19.270000        0.0
 Maxx count      1 198293 Ryan LaRose 1331223 2025-08-04    2025-08-04            1464.540000 1464.540000                1331223.0   75713015                 308                 31 Line of Credit -467726.290000 1464.540000 1464.540000 0.000000 191.950000 19.270000        0.0

 EffDateAmt      2 198293 Ryan LaRose 1382222 2025-08-04    2025-08-04               0.020000    0.020000                1382222.0   75711621                 233                 35 Line of Credit -161156.150000    0.020000    0.020000 0.000000  98.990000  6.610000        0.0
 Maxx count      2 198293 Ryan LaRose 1382222 2025-08-04    2025-08-04               0.020000    0.020000                1382222.0   75711621                 233                 35 Line of Credit -161156.150000    0.020000    0.020000 0.000000  98.990000  6.610000        0.0

*/
--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Check Current loan status  ... usually 104-Loan Paid in Full 
		SELECT 
			UY.SeqNum,
			INTSUBSERVICERLOANNUMBER, IDSSTATUSCODE, * 
		from dataupdt.HDTUpdatePayoffUPBtoZero UY  
		inner join CELINK.LOANCURRENTSTATUS --see DDL_View_LOANCurrentStatus 
		on UY.Loan = INTSUBSERVICERLOANNUMBER
		order by UY.SeqNum
		for read only with ur;
/*
 SEQNUM INTSUBSERVICERLOANNUMBER IDSSTATUSCODE SEQNUM HDTNUM REQUESTER   LOAN    PAYOFFEFFDATE LASTTRANTOTALUPB INTSUBSERVICERLOANNUMBER IDSSTATUSCODE BLNLOANSUSPENDED
 ------ ------------------------ ------------- ------ ------ ----------- ------- ------------- ---------------- ------------------------ ------------- ----------------
      1                1331223.0           104      1 198293 Ryan LaRose 1331223 2025-08-04         1464.540000                1331223.0           104               -1
      2                1382222.0           104      2 198293 Ryan LaRose 1382222 2025-08-04            0.020000                1382222.0           104               -1

*/

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- note 
	Select 
		SeqNum,
		Loan as "Loan Number",
		'N'  as "Priority (Y/N)", 
		'0'   as "Note Step Number",
		''   as "Step Date Completed (YYYY-MM-DD)", 
	-- 'Per HDT ' || UY.HDTNum || ' Adjustment posted to force UPBs to zero on paid-in-full loan. (' || VARCHAR_FORMAT(CURRENT_TIMESTAMP (0),'YYYY-MM-DD HH24:MI:SS', 'en_US') ||  ')' as "Loan Note" 
	   'Per HDT ' || UY.HDTNum || ' Adjustment posted to force UPBs to zero on paid-in-full loan.' as "Loan Note" 
		from dataupdt.HDTUpdatePayoffUPBtoZero UY  
	--Order by Loan 
	Order by SeqNum 
	; 


/*
C:\Users\ted.kato\Documents\HDTUpdtNotes_125644.csv
C:\Users\ted.kato\OneDrive - Celink\Ted.Kato\Documents - Copy\HDTUpdtNotes_ 127700.csv

 SEQNUM Loan Number Priority (Y/N) Note Step Number Step Date Completed (YYYY-MM-DD) Loan Note
 ------ ----------- -------------- ---------------- -------------------------------- ----------------------------------------------------------------------------
      1     1331223 N              0                                                 Per HDT 198293 Adjustment posted to force UPBs to zero on paid-in-full loan.
      2     1382222 N              0                                                 Per HDT 198293 Adjustment posted to force UPBs to zero on paid-in-full loan.

-- note sample ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               CHRUSERID  BLNPRIORITY
-- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ ---------- -----------
-- 2021-10-08 18:41:45.0         130389780                1032169.0 Per HDT 91375 Adjustment posted to force UPBs to zero on paid-in-full loan. (10/1/2021 4:05:32 PM)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         cking                0

*/

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- Validation before update ... compare count agains above  ... use below with SeqNum
-- new values
select 
	D.SeqNum,
	-- new values
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
	105 AS RowCode,  
	'tkato' AS UserID, 
	Current_Date AS CreationDate,  
	Current_Date AS EffectiveDate,  
	D.LastTranTotalUPB *(-1)  as TransAmount,
	0.00 as TotalUPB,
	0.00 AS UspUPB, 
	0.00 as SpUPB, 
	0.00 AS TransInt,
	0.00 AS TransMIP,
	0.00 AS TransServiceFee , 
	A.INTSUBSERVICERLOANNUMBER  as LoanNum

--/*
,   
-- values from last trans to copy into the new row
A.CURNETPL, A.CURNETLOC, A.CURTAXINSURSETASIDE,
A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, A.IDSSTATUSCODE, A.INTSUBSERVICERLOANNUMBER,  
A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE, 
--A.CURSCHEDULEDPAYMENTUPB,  
A.CURSCHEDULEDPAYMENTINTEREST, 
A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, 
--A.CURUNSCHEDULEDPAYMENTUPB, 
A.CURUNSCHEDULEDPAYMENTINTEREST,  
A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  
--A.CURTOTALUPB, -- included in above
A.CURORIGINALPL, A.CURCURRENTPL, 
A.CURORIGINALNETPL, A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, A.CURORIGTAXINSURSETASIDE, 
A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  A.BLNLOANSUSPENDED, A.CHRLOANSTATUSREMARKS, 
A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO
--*/

FROM  DATAUPDT.HDTUpdatePayoffUPBtoZero D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

----------------------------------------------------
UNION  ---------- !!!!! UNION !!!!! ----------------
----------------------------------------------------

 -- current value (This may be called sa Last Value)
 select 
	D.SeqNum,
	A2.IDSTRANSACTIONCOUNT as RowCount,  
	A2.IDSTRANSACTIONCODE as RowCode,  
	A2.IDSUSERID as UserID,  
	A2.DTMTRANSACTIONCREATIONDATE as CreationDate,  
	A2.DTMEFFECTIVEDATE as EffectiveDate,  
	A2.CURTRANSACTIONAMT        as TransAmount,
	A2.CURTOTALUPB              as TotalUPB, 
	A2.CURUNSCHEDULEDPAYMENTUPB as UspUPB, 
	A2.CURSCHEDULEDPAYMENTUPB   as SpUPB,
	A2.CURTRANSACTIONINTEREST   as TransInt,
	A2.CURTRANSACTIONMIP        as TransMIP,
	A2.CURTRANSACTIONSERVICEFEE as TransServiceFee,
	A2.INTSUBSERVICERLOANNUMBER  as LoanNum
--/*
,
-- values from last trans to copy into the new row
A2.CURNETPL, A2.CURNETLOC, A2.CURTAXINSURSETASIDE,
A2.IDSPOOLID, A2.IDSSERVICERID, A2.IDSSUBSERVICERID, A2.IDSSTATUSCODE, A2.INTSUBSERVICERLOANNUMBER,  
A2.INTFMALOANNUMBER,A2.INTFHACASENUMBER, A2.CHRLOANTYPE, A2.CHRPAYTYPE, A2.CHRINTERESTTYPE, 
A2.DTMFUNDINGDATE, A2.DTMCLOSINGDATE, A2.DTMPURCHASEDATE, 
--A2.CURSCHEDULEDPAYMENTUPB,  
A2.CURSCHEDULEDPAYMENTINTEREST, 
A2.CURSCHEDULEDPAYINTACCRUED, A2.CURSCHEDULEDPAYMENTMIP,  A2.CURSCHEDULEDPAYMIPACCRUED, 
--A2.CURUNSCHEDULEDPAYMENTUPB, 
A2.CURUNSCHEDULEDPAYMENTINTEREST,  
A2.CURUNSCHEDULEDPAYINTACCRUED, A2.CURUNSCHEDULEDPAYMENTMIP, A2.CURUNSCHEDULEDPAYMIPACCRUED,  A2.CURREPAYMENTBALANCE, A2.CURREPAYMENTINTEREST, 
A2.CURREPAYMENTMIP, A2.CURORIGTOTALUBP,  
--A2.CURTOTALUPB, -- included in above
A2.CURORIGINALPL, A2.CURCURRENTPL, 
A2.CURORIGINALNETPL, A2.CURMAXCLAIMAMOUNT,  A2.CURPROPAPPRAISEDVALUE, A2.CURORIGSERVICEFEESETASIDE, A2.CURSERVICEFEESETASIDE,  
A2.CURORIGREPAIRSSETASIDE, A2.CURREPAIRSSETASIDE, A2.CURORGFRSTYRPROPCHARGESETASIDE,  A2.CURFIRSTYRPROPCHARGESETASIDE, A2.CURORIGTAXINSURSETASIDE, 
A2.CURORIGLOCRESERVE,  A2.CURLOCRESERVE, A2.CURSERVICEFEES, A2.CURACCRUEDSERVICEFEES, A2.CURPLANCHANGESERVICEFEES,  
A2.CURACCRUEDPLANCHANGEFEES, A2.CUR1098INTEREST, A2.CURMNTHLYPAYMENTS, A2.CURMNTHLYWITHHOLD,  A2.CHRPLANCHANGEREASON, 
A2.INTTERMMONTHS, A2.INTTERMMONTHSLEFT, A2.INTBEGININTRATE,  A2.INTCURRENTINTRATE, A2.INTEXPECTAVGINTRATE, 
A2.INTINDEX, A2.INTMARGIN, A2.BLNINTERESTROUND,  A2.BLNLOANSUSPENDED, A2.CHRLOANSTATUSREMARKS, 
A2.CUR1098MIP, A2.INTVENDOR, A2.CHRMEMO, A2.INTPAYTO
--*/

FROM  DATAUPDT.HDTUpdatePayoffUPBtoZero D
INNER JOIN CELINK.TBLTRANSACTIONS A2
	on 	D.LOAN = A2.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A2.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
--	AND A2.IDSTRANSACTIONCOUNT      = C.MAXCOUNT	
	AND A2.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 2  -- fecth the last 2 trans to compare

order by SeqNum, RowCount Desc 
;

/*
 SEQNUM ROWCOUNT ROWCODE USERID    CREATIONDATE EFFECTIVEDATE TRANSAMOUNT    TOTALUPB      USPUPB        SPUPB         TRANSINT   TRANSMIP  TRANSSERVICEFEE LOANNUM   CURNETPL      CURNETLOC     CURTAXINSURSETASIDE IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP   INTVENDOR CHRMEMO INTPAYTO
 ------ -------- ------- --------- ------------ ------------- -------------- ------------- ------------- ------------- ---------- --------- --------------- --------- ------------- ------------- ------------------- ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ----------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ------------ --------- ------- --------
      1      309     105 tkato     2025-08-29   2025-08-29      -1464.540000      0.000000      0.000000      0.000000   0.000000  0.000000             0.0 1331223.0      0.000000 -12802.090000            0.000000 RMF_FNMA_J     249240001        234790013           104                1331223.0    6.000283601E9 000484461518     HECM        Line of Credit ARM 857         2007-04-03     2007-03-29     2017-12-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000       -10049.990000            15.660000        2.170000   256927.110000 261571.590000 458126.620000    256927.110000     362790.000000         451000.000000               4644.480000           1979.100000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -7878.980000      30.000000              0.000000                 0.000000                 0.000000   167363.610000          0.000000          0.000000                                 0                 0          0.0593            0.0498              0.0558   0.0398      0.01                0               -1 Loan Paid in Full    20986.690000      NULL NULL        NULL
      1      308      31 mwendel   2025-08-05   2025-08-04    -467726.290000   1464.540000   1464.540000      0.000000 191.950000 19.270000             0.0 1331223.0      0.000000 -12802.090000            0.000000 RMF_FNMA_J     249240001        234790013           104                1331223.0    6.000283601E9 000484461518     HECM        Line of Credit ARM 857         2007-04-03     2007-03-29     2017-12-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000       -10049.990000            15.660000        2.170000   256927.110000 261571.590000 458126.620000    256927.110000     362790.000000         451000.000000               4644.480000           1979.100000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -7878.980000      30.000000              0.000000                 0.000000                 0.000000   167363.610000          0.000000          0.000000                                 0                 0          0.0593            0.0498              0.0558   0.0398      0.01                0               -1 Loan Paid in Full    20986.690000      NULL NULL        NULL
      1      307     103 BATCH     2025-07-31   2025-08-01          0.000000 468949.610000   4923.110000 464026.500000   0.000000  0.000000             0.0 1331223.0 -12802.090000 -12802.090000            0.000000 RMF_FNMA_J     249240001        234790013            11                1331223.0    6.000283601E9 000484461518     HECM        Line of Credit ARM 857         2007-04-03     2007-03-29     2017-12-01                    166709.720000                  0.000000           20943.000000                  0.000000                    461.940000                    0.000000                24.420000                    0.000000       -10049.990000            15.660000        2.170000   256927.110000 261571.590000 458126.620000    256927.110000     362790.000000         451000.000000               4644.480000           1979.100000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -7878.980000      30.000000           6630.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0593            0.0498              0.0558   0.0398      0.01                0               -1 Refer for FCL: Death     0.000000      NULL NULL        NULL

      2      234     105 tkato     2025-08-29   2025-08-29         -0.020000      0.000000      0.000000      0.000000   0.000000  0.000000             0.0 1382222.0      0.000000  -7713.650000            0.000000 RMF_FNMA_9     249240001        234790013           104                1382222.0    6.000727357E9 000233436028     HECM        Line of Credit ARM 857         2009-07-10     2009-07-06     2018-09-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000        -9964.300000            45.490000        3.440000    60534.830000  65700.000000 156365.860000     60534.830000     100000.000000         100000.000000               5165.170000           3063.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -20268.160000      35.000000              0.000000                 0.000000                 0.000000    85211.180000          0.000000          0.000000                                 0                 0          0.0398            0.0748              0.0626   0.0398     0.035                0               -1 Loan Paid in Full     2823.720000      NULL NULL        NULL
      2      233      35 e_jrayman 2025-08-05   2025-08-04    -161156.150000      0.020000      0.020000      0.000000  98.990000  6.610000             0.0 1382222.0      0.000000  -7713.650000            0.000000 RMF_FNMA_9     249240001        234790013           104                1382222.0    6.000727357E9 000233436028     HECM        Line of Credit ARM 857         2009-07-10     2009-07-06     2018-09-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000        -9964.300000            45.490000        3.440000    60534.830000  65700.000000 156365.860000     60534.830000     100000.000000         100000.000000               5165.170000           3063.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -20268.160000      35.000000              0.000000                 0.000000                 0.000000    85211.180000          0.000000          0.000000                                 0                 0          0.0398            0.0748              0.0626   0.0398     0.035                0               -1 Loan Paid in Full     2823.720000      NULL NULL        NULL
      2      232     103 BATCH     2025-07-31   2025-08-01          0.000000 161015.570000 -12554.510000 173570.080000   0.000000  0.000000             0.0 1382222.0  -7713.650000  -7713.650000            0.000000 RMF_FNMA_9     249240001        234790013             0                1382222.0    6.000727357E9 000233436028     HECM        Line of Credit ARM 857         2009-07-10     2009-07-06     2018-09-01                     88915.510000                  0.000000            2936.550000                  0.000000                  -3803.320000                    0.000000              -119.440000                    0.000000        -9964.300000            45.490000        3.440000    60534.830000  65700.000000 156365.860000     60534.830000     100000.000000         100000.000000               5165.170000           3063.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -20268.160000      35.000000           2076.650000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0398            0.0748              0.0626   0.0398     0.035                0                0 Active                   0.000000      NULL NULL        NULL

-- all columns after resolved ... compare against above 

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- check again right before insertion with below select part
-------------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------
-- after ... result from above 2nd part of UNION
-------------------------------------------------------------------------------------------------------------------------------------
 SEQNUM ROWCOUNT ROWCODE USERID    CREATIONDATE EFFECTIVEDATE TRANSAMOUNT    TOTALUPB      USPUPB        SPUPB         TRANSINT   TRANSMIP  TRANSSERVICEFEE LOANNUM   CURNETPL      CURNETLOC     CURTAXINSURSETASIDE IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP   INTVENDOR CHRMEMO INTPAYTO
 ------ -------- ------- --------- ------------ ------------- -------------- ------------- ------------- ------------- ---------- --------- --------------- --------- ------------- ------------- ------------------- ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- -------------- -------------- --------------- --------------------------- ------------------------- ---------------------- ------------------------- ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ---------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ----------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ------------ --------- ------- --------
      1      309     105 tkato     2025-08-29   2025-08-29      -1464.540000      0.000000      0.000000      0.000000   0.000000  0.000000             0.0 1331223.0      0.000000 -12802.090000            0.000000 RMF_FNMA_J     249240001        234790013           104                1331223.0    6.000283601E9 000484461518     HECM        Line of Credit ARM 857         2007-04-03     2007-03-29     2017-12-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000       -10049.990000            15.660000        2.170000   256927.110000 261571.590000 458126.620000    256927.110000     362790.000000         451000.000000               4644.480000           1979.100000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -7878.980000      30.000000              0.000000                 0.000000                 0.000000   167363.610000          0.000000          0.000000                                 0                 0          0.0593            0.0498              0.0558   0.0398      0.01                0               -1 Loan Paid in Full    20986.690000      NULL NULL        NULL
      1      308      31 mwendel   2025-08-05   2025-08-04    -467726.290000   1464.540000   1464.540000      0.000000 191.950000 19.270000             0.0 1331223.0      0.000000 -12802.090000            0.000000 RMF_FNMA_J     249240001        234790013           104                1331223.0    6.000283601E9 000484461518     HECM        Line of Credit ARM 857         2007-04-03     2007-03-29     2017-12-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000       -10049.990000            15.660000        2.170000   256927.110000 261571.590000 458126.620000    256927.110000     362790.000000         451000.000000               4644.480000           1979.100000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -7878.980000      30.000000              0.000000                 0.000000                 0.000000   167363.610000          0.000000          0.000000                                 0                 0          0.0593            0.0498              0.0558   0.0398      0.01                0               -1 Loan Paid in Full    20986.690000      NULL NULL        NULL
      1      307     103 BATCH     2025-07-31   2025-08-01          0.000000 468949.610000   4923.110000 464026.500000   0.000000  0.000000             0.0 1331223.0 -12802.090000 -12802.090000            0.000000 RMF_FNMA_J     249240001        234790013            11                1331223.0    6.000283601E9 000484461518     HECM        Line of Credit ARM 857         2007-04-03     2007-03-29     2017-12-01                    166709.720000                  0.000000           20943.000000                  0.000000                    461.940000                    0.000000                24.420000                    0.000000       -10049.990000            15.660000        2.170000   256927.110000 261571.590000 458126.620000    256927.110000     362790.000000         451000.000000               4644.480000           1979.100000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000  -7878.980000      30.000000           6630.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0593            0.0498              0.0558   0.0398      0.01                0               -1 Refer for FCL: Death     0.000000      NULL NULL        NULL

      2      234     105 tkato     2025-08-29   2025-08-29         -0.020000      0.000000      0.000000      0.000000   0.000000  0.000000             0.0 1382222.0      0.000000  -7713.650000            0.000000 RMF_FNMA_9     249240001        234790013           104                1382222.0    6.000727357E9 000233436028     HECM        Line of Credit ARM 857         2009-07-10     2009-07-06     2018-09-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000        -9964.300000            45.490000        3.440000    60534.830000  65700.000000 156365.860000     60534.830000     100000.000000         100000.000000               5165.170000           3063.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -20268.160000      35.000000              0.000000                 0.000000                 0.000000    85211.180000          0.000000          0.000000                                 0                 0          0.0398            0.0748              0.0626   0.0398     0.035                0               -1 Loan Paid in Full     2823.720000      NULL NULL        NULL
      2      233      35 e_jrayman 2025-08-05   2025-08-04    -161156.150000      0.020000      0.020000      0.000000  98.990000  6.610000             0.0 1382222.0      0.000000  -7713.650000            0.000000 RMF_FNMA_9     249240001        234790013           104                1382222.0    6.000727357E9 000233436028     HECM        Line of Credit ARM 857         2009-07-10     2009-07-06     2018-09-01                         0.000000                  0.000000               0.000000                  0.000000                      0.000000                    0.000000                 0.000000                    0.000000        -9964.300000            45.490000        3.440000    60534.830000  65700.000000 156365.860000     60534.830000     100000.000000         100000.000000               5165.170000           3063.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -20268.160000      35.000000              0.000000                 0.000000                 0.000000    85211.180000          0.000000          0.000000                                 0                 0          0.0398            0.0748              0.0626   0.0398     0.035                0               -1 Loan Paid in Full     2823.720000      NULL NULL        NULL
      2      232     103 BATCH     2025-07-31   2025-08-01          0.000000 161015.570000 -12554.510000 173570.080000   0.000000  0.000000             0.0 1382222.0  -7713.650000  -7713.650000            0.000000 RMF_FNMA_9     249240001        234790013             0                1382222.0    6.000727357E9 000233436028     HECM        Line of Credit ARM 857         2009-07-10     2009-07-06     2018-09-01                     88915.510000                  0.000000            2936.550000                  0.000000                  -3803.320000                    0.000000              -119.440000                    0.000000        -9964.300000            45.490000        3.440000    60534.830000  65700.000000 156365.860000     60534.830000     100000.000000         100000.000000               5165.170000           3063.940000               0.000000           0.000000                       0.000000                     0.000000                0.000000          0.000000 -20268.160000      35.000000           2076.650000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0398            0.0748              0.0626   0.0398     0.035                0                0 Active                   0.000000      NULL NULL        NULL

*/

-------------------------------------------------------------------------------------------------------------------------------------
-- inserrrrrrt 
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------

-- -- /* ******************************************************************* comment out while testing
INSERT INTO CELINK.TBLTRANSACTIONS 
( 
-- 	SeqNum,
	IDSTRANSACTIONCOUNT ,  
	IDSTRANSACTIONCODE ,  
	IDSUSERID ,  
	DTMTRANSACTIONCREATIONDATE ,  
	DTMEFFECTIVEDATE ,  
	CURTRANSACTIONAMT ,
	CURTOTALUPB       , 
	CURUNSCHEDULEDPAYMENTUPB , 
	CURSCHEDULEDPAYMENTUPB   ,
	CURTRANSACTIONINTEREST   ,
	CURTRANSACTIONMIP        ,
	CURTRANSACTIONSERVICEFEE ,
	INTSUBSERVICERLOANNUMBER  
,	
CURNETPL, CURNETLOC, CURTAXINSURSETASIDE,
IDSPOOLID, IDSSERVICERID, IDSSUBSERVICERID, IDSSTATUSCODE, 
INTFMALOANNUMBER,INTFHACASENUMBER, CHRLOANTYPE, CHRPAYTYPE, CHRINTERESTTYPE, 
DTMFUNDINGDATE, DTMCLOSINGDATE, DTMPURCHASEDATE, 
--CURSCHEDULEDPAYMENTUPB,  
CURSCHEDULEDPAYMENTINTEREST, 
CURSCHEDULEDPAYINTACCRUED, CURSCHEDULEDPAYMENTMIP,  CURSCHEDULEDPAYMIPACCRUED, 
--CURUNSCHEDULEDPAYMENTUPB, 
CURUNSCHEDULEDPAYMENTINTEREST,  
CURUNSCHEDULEDPAYINTACCRUED, CURUNSCHEDULEDPAYMENTMIP, CURUNSCHEDULEDPAYMIPACCRUED,  CURREPAYMENTBALANCE, CURREPAYMENTINTEREST, 
CURREPAYMENTMIP, CURORIGTOTALUBP,  
--CURTOTALUPB, -- included in above
CURORIGINALPL, CURCURRENTPL, 
CURORIGINALNETPL, CURMAXCLAIMAMOUNT,  CURPROPAPPRAISEDVALUE, CURORIGSERVICEFEESETASIDE, CURSERVICEFEESETASIDE,  
CURORIGREPAIRSSETASIDE, CURREPAIRSSETASIDE, CURORGFRSTYRPROPCHARGESETASIDE,  CURFIRSTYRPROPCHARGESETASIDE, CURORIGTAXINSURSETASIDE, 
CURORIGLOCRESERVE,  CURLOCRESERVE, CURSERVICEFEES, CURACCRUEDSERVICEFEES, CURPLANCHANGESERVICEFEES,  
CURACCRUEDPLANCHANGEFEES, CUR1098INTEREST, CURMNTHLYPAYMENTS, CURMNTHLYWITHHOLD,  CHRPLANCHANGEREASON, 
INTTERMMONTHS, INTTERMMONTHSLEFT, INTBEGININTRATE,  INTCURRENTINTRATE, INTEXPECTAVGINTRATE, 
INTINDEX, INTMARGIN, BLNINTERESTROUND,  BLNLOANSUSPENDED, CHRLOANSTATUSREMARKS, 
CUR1098MIP, INTVENDOR, CHRMEMO, INTPAYTO
) 
-- -- ********************************************************************************************* */

select 
-- -- -- D.SeqNum,  -->>> test purpose
	-- new values
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount,  
	105 AS RowCode,  
	'tkato' AS UserID, 
	Current_Date AS CreationDate,  
	Current_Date AS EffectiveDate,  
	D.LastTranTotalUPB *(-1)  as TransAmount,
	0.00 as TotalUPB,
	0.00 AS UspUPB, 
	0.00 as SpUPB, 
	0.00 AS TransInt,
	0.00 AS TransMIP,
	0.00 AS TransServiceFee , 
	A.INTSUBSERVICERLOANNUMBER  as LoanNum
,   
A.CURNETPL, A.CURNETLOC, A.CURTAXINSURSETASIDE,
A.IDSPOOLID, A.IDSSERVICERID, A.IDSSUBSERVICERID, A.IDSSTATUSCODE, 
A.INTFMALOANNUMBER,A.INTFHACASENUMBER, A.CHRLOANTYPE, A.CHRPAYTYPE, A.CHRINTERESTTYPE, 
A.DTMFUNDINGDATE, A.DTMCLOSINGDATE, A.DTMPURCHASEDATE, 
--A.CURSCHEDULEDPAYMENTUPB,  
A.CURSCHEDULEDPAYMENTINTEREST, 
A.CURSCHEDULEDPAYINTACCRUED, A.CURSCHEDULEDPAYMENTMIP,  A.CURSCHEDULEDPAYMIPACCRUED, 
--A.CURUNSCHEDULEDPAYMENTUPB, 
A.CURUNSCHEDULEDPAYMENTINTEREST,  
A.CURUNSCHEDULEDPAYINTACCRUED, A.CURUNSCHEDULEDPAYMENTMIP, A.CURUNSCHEDULEDPAYMIPACCRUED,  A.CURREPAYMENTBALANCE, A.CURREPAYMENTINTEREST, 
A.CURREPAYMENTMIP, A.CURORIGTOTALUBP,  
--A.CURTOTALUPB, -- included in above
A.CURORIGINALPL, A.CURCURRENTPL, 
A.CURORIGINALNETPL, A.CURMAXCLAIMAMOUNT,  A.CURPROPAPPRAISEDVALUE, A.CURORIGSERVICEFEESETASIDE, A.CURSERVICEFEESETASIDE,  
A.CURORIGREPAIRSSETASIDE, A.CURREPAIRSSETASIDE, A.CURORGFRSTYRPROPCHARGESETASIDE,  A.CURFIRSTYRPROPCHARGESETASIDE, A.CURORIGTAXINSURSETASIDE, 
A.CURORIGLOCRESERVE,  A.CURLOCRESERVE, A.CURSERVICEFEES, A.CURACCRUEDSERVICEFEES, A.CURPLANCHANGESERVICEFEES,  
A.CURACCRUEDPLANCHANGEFEES, A.CUR1098INTEREST, A.CURMNTHLYPAYMENTS, A.CURMNTHLYWITHHOLD,  A.CHRPLANCHANGEREASON, 
A.INTTERMMONTHS, A.INTTERMMONTHSLEFT, A.INTBEGININTRATE,  A.INTCURRENTINTRATE, A.INTEXPECTAVGINTRATE, 
A.INTINDEX, A.INTMARGIN, A.BLNINTERESTROUND,  A.BLNLOANSUSPENDED, A.CHRLOANSTATUSREMARKS, 
A.CUR1098MIP, A.INTVENDOR, A.CHRMEMO, A.INTPAYTO

	FROM  DATAUPDT.HDTUpdatePayoffUPBtoZero D
	INNER JOIN CELINK.TBLTRANSACTIONS A
		on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
	inner join CELINK.CHOOSELASTRECORD C
		on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
		AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
	order by D.SeqNum
	;	  


------------------------------------------------
-- after ... result from above 2nd part of UNION
-- above section

--------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
-- note ... 20230425 write privilege re-instated

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)
 
Select 
--	SeqNum,
	Loan as "Loan Number",
--   'Per HDT ' || UY.HDTNum || ' Adjustment posted to force UPBs to zero on paid-in-full loan. (' || VARCHAR_FORMAT(CURRENT_TIMESTAMP (0),'YYYY-MM-DD HH24:MI:SS', 'en_US') ||  ')' as "Loan Note" 
   'Per HDT ' || UY.HDTNum || ' Adjustment posted to force UPBs to zero on paid-in-full loan.' as "Loan Note" 
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from dataupdt.HDTUpdatePayoffUPBtoZero UY  
Order by SeqNum 
; 

/*
--*--
Adjustment transaction posted for 3 loans. Pending verification.
Adjustment transaction posted for 1 loan. Pending verification.

 Loan Number Loan Note                                                                    3                          4     5 6
 ----------- ---------------------------------------------------------------------------- -------------------------- ----- - -

*/

------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, notestep --,*
from DATAUPDT.HDTUpdatePayoffUPBtoZero UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'
order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;

/*
2 adjustment transactions posted. Peer review pending.
 SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                 CHRUSERID BLNPRIORITY NOTESTEP
 ------ -------------------------- ------------ ------------------------ ---------------------------------------------------------------------------- --------- ----------- --------
      1 2025-08-29 12:15:33.878145    213046977                1331223.0 Per HDT 198293 Adjustment posted to force UPBs to zero on paid-in-full loan. tkato               0        0
      2 2025-08-29 12:15:33.878145    213046978                1382222.0 Per HDT 198293 Adjustment posted to force UPBs to zero on paid-in-full loan. tkato               0        0

*/

-- note sample
-- SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                 CHRUSERID BLNPRIORITY NOTESTEP
-- ------ -------------------------- ------------ ------------------------ ---------------------------------------------------------------------------- --------- ----------- --------
--      1 2025-06-30 10:18:54.220243    204402001                1005584.0 Per HDT 193550 Adjustment posted to force UPBs to zero on paid-in-full loan. tkato               0        0
--      2 2025-06-30 10:18:54.220243    204402002                1006518.0 Per HDT 193550 Adjustment posted to force UPBs to zero on paid-in-full loan. tkato               0        0
--      3 2025-06-30 10:18:54.220243    204402003                1382462.0 Per HDT 193550 Adjustment posted to force UPBs to zero on paid-in-full loan. tkato               0        0


-- end

/* ******************************************************************************************************************************************** */
-- refs: ------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------------------
---- After resolved
---- check to see how the 105 trans inserted to resolve
---- pull the last transaction (newly inserted) and second to the last (shown above)
-- new values
select 
	SeqNum,
	RowCount,  
	RowCode,  
	UserID, 
	CreationDate,  
	EffectiveDate,  
	
	TransAmount,  
	TotUPB,
	UspUPB,
	SpUPB
	TransInterest,  
	TransMIP,  
	TransServiceFee,  
	LoanNum
from
(
select 
	D.SeqNum,
	A.IDSTRANSACTIONCOUNT as RowCount,  
	A.IDSTRANSACTIONCODE as RowCode,  
	A.IDSUSERID as UserID,  
	A.DTMTRANSACTIONCREATIONDATE as CreationDate,  
	A.DTMEFFECTIVEDATE as EffectiveDate,  

	A.CURTRANSACTIONAMT        as "LastTran Amount",
	A.CURTOTALUPB              as "LastTran Total UPB", 
	A.CURUNSCHEDULEDPAYMENTUPB as "LastTran USP UPB", 
	A.CURSCHEDULEDPAYMENTUPB   as "LastTran SP UPB",
	A.CURTRANSACTIONINTEREST   as "LastTran TransInt",
	A.CURTRANSACTIONMIP        as "LastTran TransMIP",
	A.CURTRANSACTIONSERVICEFEE as "LastTran ServiceFee",

	A.INTSUBSERVICERLOANNUMBER  as LoanNum

FROM  DATAUPDT.HDTUpdatePayoffUPBtoZero D

INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 

inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
)

UNION

 -- last value
select 
	SeqNum,
	RowCount,  
	RowCode,  
	UserID, 
	CreationDate,  
	EffectiveDate,  
	TransAmount,  
	TotUPB,
	UspUPB,
	SpUPB
	TransInterest,  
	TransMIP,  
	TransServiceFee,  
	LoanNum
from
(
select 
	D.SeqNum,
	A2.IDSTRANSACTIONCOUNT as RowCount,  
	A2.IDSTRANSACTIONCODE as RowCode,  
	A2.IDSUSERID as UserID,  
	A2.DTMTRANSACTIONCREATIONDATE as CreationDate,  
	A2.DTMEFFECTIVEDATE as EffectiveDate,  

	A2.CURTRANSACTIONAMT        as "LastTran Amount",
	A2.CURTOTALUPB              as "LastTran Total UPB", 
	A2.CURUNSCHEDULEDPAYMENTUPB as "LastTran USP UPB", 
	A2.CURSCHEDULEDPAYMENTUPB   as "LastTran SP UPB",
	A2.CURTRANSACTIONINTEREST   as "LastTran TransInt",
	A2.CURTRANSACTIONMIP        as "LastTran TransMIP",
	A2.CURTRANSACTIONSERVICEFEE as "LastTran ServiceFee",

	A2.INTSUBSERVICERLOANNUMBER  as LoanNum

FROM  DATAUPDT.HDTUpdatePayoffUPBtoZero D

inner join celink.tbltransactions A2
	on  P.loan = A2.INTSUBSERVICERLOANNUMBER
	and A2.IDSTRANSACTIONCOUNT = 
	( 
	SELECT 
		max(IDSTRANSACTIONCOUNT) -1 -- for tesing  
	from celink.tbltransactions where INTSUBSERVICERLOANNUMBER = P.loan
	)  
)
order by SeqNum, RowCount Desc 
;	




-- ------------------------------------------------
-- ------------------------------------------------
-- ------------------------------------------------
-- ------------------------------------------------
-- ------------------------------------------------
-- below will not be used
---------------------------------------------------
-- Before new 105 will be inserted 
-- pull the last transaction to copy 
with param (SeqNum, HDTNum, Requester, Loan, LastEffDate, LastTranTotalUPB) as
(VALUES
(1, 82683, 'Ryan LaRose', 1099575, '2021-05-01', 57.79),
(2, 82683, 'Ryan LaRose', 1377954, '2021-04-30', 0.02),
(3, 82683, 'Ryan LaRose', 1382095, '2021-05-01', 113.87),
(4, 82683, 'Ryan LaRose', 3002859, '2021-04-30', 0.01),
(5, 82683, 'Ryan LaRose', 3005177, '2021-05-01', 46.48),
(6, 82683, 'Ryan LaRose', 3024528, '2021-05-03', -0.02),
(7, 82683, 'Ryan LaRose', 3026060, '2021-05-01', 57.3),
(8, 82683, 'Ryan LaRose', 3031110, '2021-05-03', -0.01),
(9, 82683, 'Ryan LaRose', 3033607, '2021-05-01', 62.05),
(10, 82683, 'Ryan LaRose', 3034415, '2021-05-01', 45.85),
(11, 82683, 'Ryan LaRose', 3047900, '2021-04-30', -5.45),
(12, 82683, 'Ryan LaRose', 3072617, '2021-04-30', 0.03)

) --(SeqNum, HDTNum, Requester, Loan, LastEffDate, LastTranTotalUPB)

select 
	P.SeqNum, P.HDTNum, P.Requester,
	P.Loan, 
		TT.INTSUBSERVICERLOANNUMBER, TT.CHRPAYTYPE,
	P.LastEffDate as "Given Eff Date" 

    , TT.IDSTRANSID as "LastTran ID"
	, TT.IDSTRANSACTIONCOUNT as "LastTran CT" 
	, TT.IDSTRANSACTIONCOUNT + 1 as "NewTran CT"
    ,

	TT.CURTRANSACTIONAMT        as "LastTran Amount",
	P.LastTranTotalUPB *(-1)  as "NewTran Amount",

	P.LastTranTotalUPB          as "Given Tota UPB", 
	TT.CURTOTALUPB              as "LastTran Total UPB", 
	0.00 as "NewTran Total UPB",
	
	TT.CURUNSCHEDULEDPAYMENTUPB as "LastTran USP UPB", 
	0.00 AS "NewTran USP UPB", 

	TT.CURSCHEDULEDPAYMENTUPB   as "LastTran SP UPB",
	0.00 as "NewTran SP UPB", 

	TT.CURTRANSACTIONINTEREST   as "LastTran TransInt",
	0.00 AS "NewTran TransInt",
	  
	TT.CURTRANSACTIONMIP        as "LastTran TransMIP",
	0.00 AS "NewTran TransMIP",
	
	TT.CURTRANSACTIONSERVICEFEE as "LastTran ServiceFee",
	0.00 AS "NewTran ServiceFee"  
	  
	, TT.IDSTRANSACTIONCODE as "LastTran Code"
	, 105 	AS "NewRowCode" 
	, 'tkato' AS "NewUserID" 
	, TT.IDSUSERID as "CurUserID" 
	, Current_Date AS "NewCreationDate"  
	, Current_Date AS "NewEffDateDate"  
	, TT.DTMTRANSACTIONCREATIONDATE, TT.dtmEFFECTIVEDATE 
	


from  Param P
inner join celink.tbltransactions TT
	on  P.loan = TT.INTSUBSERVICERLOANNUMBER
inner join CELINK.CHOOSELASTRECORD XX
	on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
	AND TT.IDSTRANSACTIONCOUNT      = XX.MAXCOUNT      -- effective date must be cosidered????? 

order by P.SeqNum
with ur;	  

---- before update 
-- SEQNUM HDTNUM REQUESTER   LOAN    INTSUBSERVICERLOANNUMBER CHRPAYTYPE     Given Eff Date LastTran ID LastTran CT NewTran CT LastTran Amount NewTran Amount Given Tota UPB LastTran Total UPB NewTran Total UPB LastTran USP UPB NewTran USP UPB LastTran SP UPB NewTran SP UPB LastTran TransInt NewTran TransInt LastTran TransMIP NewTran TransMIP LastTran ServiceFee NewTran ServiceFee LastTran Code NewRowCode NewUserID CurUserID NewCreationDate NewEffDateDate DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE
-- ------ ------ ----------- ------- ------------------------ -------------- -------------- ----------- ----------- ---------- --------------- -------------- -------------- ------------------ ----------------- ---------------- --------------- --------------- -------------- ----------------- ---------------- ----------------- ---------------- ------------------- ------------------ ------------- ---------- --------- --------- --------------- -------------- -------------------------- ----------------
--      1  82683 Ryan LaRose 1099575                1099575.0 Line of Credit 2021-05-01        47214693         210        211  -180533.530000         -57.79          57.79          57.790000              0.00        57.790000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-01
--      2  82683 Ryan LaRose 1377954                1377954.0 Line of Credit 2021-04-30        46744094          65         66  -237600.620000          -0.02           0.02           0.020000              0.00         0.020000            0.00        0.000000           0.00        297.730000             0.00         94.220000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-04-30                 2021-04-30
--      3  82683 Ryan LaRose 1382095                1382095.0 Line of Credit 2021-05-01        47215067          71         72  -182708.150000        -113.87         113.87         113.870000              0.00       113.870000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00            31        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-01
--      4  82683 Ryan LaRose 3002859                3002859.0 Line of Credit 2021-04-30        46741038          93         94  -151993.380000          -0.01           0.01           0.010000              0.00         0.010000            0.00        0.000000           0.00        172.360000             0.00         60.270000             0.00                 0.0               0.00            31        105 tkato     mwendel   2021-05-04      2021-05-04     2021-04-30                 2021-04-30
--      5  82683 Ryan LaRose 3005177                3005177.0 Line of Credit 2021-05-01        47214982          86         87  -141226.100000         -46.48          46.48          46.480000              0.00        46.480000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-01
--      6  82683 Ryan LaRose 3024528                3024528.0 Line of Credit 2021-05-03        47214477          84         85  -408091.270000           0.02          -0.02          -0.020000              0.00        -0.020000            0.00        0.000000           0.00         40.690000             0.00         11.180000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-03
--      7  82683 Ryan LaRose 3026060                3026060.0 Line of Credit 2021-05-01        47214887          83         84  -336130.870000         -57.30          57.30          57.300000              0.00        57.300000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-01
--      8  82683 Ryan LaRose 3031110                3031110.0 Line of Credit 2021-05-03        47225075          91         92  -318166.400000           0.01          -0.01          -0.010000              0.00        -0.010000            0.00        0.000000           0.00         27.370000             0.00          8.710000             0.00                 0.0               0.00            31        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-03
--      9  82683 Ryan LaRose 3033607                3033607.0 Line of Credit 2021-05-01        47214793          83         84  -333264.980000         -62.05          62.05          62.050000              0.00        62.050000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-01
--     10  82683 Ryan LaRose 3034415                3034415.0 Line of Credit 2021-05-01        47214585          88         89  -195987.080000         -45.85          45.85          45.850000              0.00        45.850000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-05-03                 2021-05-01
--     11  82683 Ryan LaRose 3047900                3047900.0 Term           2021-04-30        46741039          86         87  -244157.490000           5.45          -5.45          -5.450000              0.00        -5.450000            0.00        0.000000           0.00        305.960000             0.00         96.830000             0.00                 0.0               0.00            35        105 tkato     mwendel   2021-05-04      2021-05-04     2021-04-30                 2021-04-30
--     12  82683 Ryan LaRose 3072617                3072617.0 Line of Credit 2021-04-30        46744090          92         93  -344747.230000          -0.03           0.03           0.030000              0.00         0.030000            0.00        0.000000           0.00        500.250000             0.00        136.680000             0.00                 0.0               0.00            31        105 tkato     mwendel   2021-05-04      2021-05-04     2021-04-30                 2021-04-30

-- SEQNUM HDTNUM REQUESTER   LOAN    INTSUBSERVICERLOANNUMBER CHRPAYTYPE     Given Eff Date LastTran ID LastTran CT NewTran CT LastTran Amount NewTran Amount Given Tota UPB LastTran Total UPB NewTran Total UPB LastTran USP UPB NewTran USP UPB LastTran SP UPB NewTran SP UPB LastTran TransInt NewTran TransInt LastTran TransMIP NewTran TransMIP LastTran ServiceFee NewTran ServiceFee LastTran Code NewRowCode NewUserID CurUserID NewCreationDate NewEffDateDate DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE
-- ------ ------ ----------- ------- ------------------------ -------------- -------------- ----------- ----------- ---------- --------------- -------------- -------------- ------------------ ----------------- ---------------- --------------- --------------- -------------- ----------------- ---------------- ----------------- ---------------- ------------------- ------------------ ------------- ---------- --------- --------- --------------- -------------- -------------------------- ----------------
--      1  82683 Ryan LaRose 1023433                1023433.0 Line of Credit 2021-04-27        46739131         329        330       -0.030000          -0.03           0.03           0.000000              0.00         0.000000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00           105        105 tkato     cking     2021-04-29      2021-04-29     2021-04-29                 2021-04-29
--      1  82683 Ryan LaRose 1023433                1023433.0 Line of Credit 2021-04-27        46734158         328        329  -241195.430000          -0.03           0.03           0.030000              0.00         0.030000            0.00        0.000000           0.00        485.020000             0.00         85.700000             0.00                 0.0               0.00        105            35 tkato     mwendel   2021-04-29      2021-04-29     2021-04-28                 2021-04-27

--      2  82683 Ryan LaRose 3008405                3008405.0 Line of Credit 2021-04-28        46739132          59         60       -0.120000          -0.12           0.12           0.000000              0.00         0.000000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00           105        105 tkato     cking     2021-04-29      2021-04-29     2021-04-29                 2021-04-29
--      2  82683 Ryan LaRose 3008405                3008405.0 Line of Credit 2021-04-28        46736967          58         59  -210380.490000          -0.12           0.12           0.120000              0.00         0.120000            0.00        0.000000           0.00        346.290000             0.00         77.650000             0.00                 0.0               0.00        105            35 tkato     mwendel   2021-04-29      2021-04-29     2021-04-28                 2021-04-28

--      3  82683 Ryan LaRose 3033952                3033952.0 Line of Credit 2021-04-28        46739133          82         83       -0.060000          -0.06           0.06           0.000000              0.00         0.000000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00           105        105 tkato     cking     2021-04-29      2021-04-29     2021-04-29                 2021-04-29
--      4  82683 Ryan LaRose 3037847                3037847.0 Line of Credit 2021-04-27        46739134          85         86        0.010000           0.01          -0.01           0.000000              0.00         0.000000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00           105        105 tkato     cking     2021-04-29      2021-04-29     2021-04-29                 2021-04-29
--      5  82683 Ryan LaRose 3038337                3038337.0 Line of Credit 2021-04-27        46739135          83         84       -0.120000          -0.12           0.12           0.000000              0.00         0.000000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00           105        105 tkato     cking     2021-04-29      2021-04-29     2021-04-29                 2021-04-29
--      6  82683 Ryan LaRose 3048248                3048248.0 Line of Credit 2021-04-27        46739136          88         89        0.010000           0.01          -0.01           0.000000              0.00         0.000000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00           105        105 tkato     cking     2021-04-29      2021-04-29     2021-04-29                 2021-04-29
--      7  82683 Ryan LaRose 3070302                3070302.0 Line of Credit 2021-04-27        46739137         126        127        1.270000           1.27          -1.27           0.000000              0.00         0.000000            0.00        0.000000           0.00          0.000000             0.00          0.000000             0.00                 0.0               0.00           105        105 tkato     cking     2021-04-29      2021-04-29     2021-04-29                 2021-04-29

