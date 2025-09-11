/*
20250529
[ID:0190886]
Balance Updates
5/28/2025 5:53 PM
Jennifer Dees

3146452

--AM
Please change the date of the 109 and 110 effective dates on this loan from 5/31/2025 to 6/1/2025. 
Amy Morrill
VP- Investor Reporting
Celink
517.703.5821
Email: Amy.Morrill@celink.com

--*--
Effective dates updated for 2 transactions.  Peer review pending.

*/

select  
	INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT,
	DTMEFFECTIVEDATE,

--	CURTRANSACTIONAMT,
--	CURTRANSACTIONINTEREST,
--	CUR1098INTEREST,

	IDSTRANSACTIONCODE,
	CURTRANSACTIONAMT        as "Amount",
	CURSCHEDULEDPAYMENTUPB   as "SP UPB",
	CURUNSCHEDULEDPAYMENTUPB as "USP UPB", 
	CURTOTALUPB              as "Total UPB",
	CURTRANSACTIONINTEREST   as "TransInt",
	CURTRANSACTIONMIP        as "TransMIP",
	CURSERVICEFEES           as "SF",
	INTBEGININTRATE,
	INTCURRENTINTRATE, --<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	*
	from celink.TBLTRANSACTIONS 
where INTSUBSERVICERLOANNUMBER = 3146452
and IDSTRANSACTIONCOUNT in (141, 140)
--	order by IDSTRANSID desc 
	order by INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT desc
for read only with ur;

-- INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE Amount        SP UPB   USP UPB  Total UPB TransInt TransMIP SF       INTBEGININTRATE INTCURRENTINTRATE IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE CHRINTERESTTYPE IDSUSERID DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL       CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS     CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ------------------- ---------------- ------------------ ------------- -------- -------- --------- -------- -------- -------- --------------- ----------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ----------- ------------- ------------- ---------------- -------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- ------------------------ ---------- --------- ------- -------- ------------------------
--                3146452.0                 141 2025-05-31                      110      0.000000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000          0.0724            0.0724   74230996                 141                110 NomuraHS      266130007        266130007           110                3146452.0              0.0 0                HomeSafe    Lump Sum   Fixed           cking     2025-05-29                 2025-05-31       2020-02-19     2020-02-13     2999-01-01               0.000000               0.000000                    0.000000                  0.000000               0.000000                  0.000000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000       964691.010000             0.000000        0.000000   776231.900000    0.000000 786500.000000 791245.220000         0.000000 -247701.410000    1300000.000000        1300000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            10268.100000            0.000000          0.000000      0.000000 -18162.740000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0724            0.0724              0.0724   0.0724       0.0                0               -1 Inactive                   0.000000      NULL NULL        NULL                      0.0
--                3146452.0                 140 2025-05-31                      109 -70512.060000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000          0.0724            0.0724   74230995                 140                109 NomuraHS      266130007        266130007            70                3146452.0              0.0 0                HomeSafe    Lump Sum   Fixed           cking     2025-05-29                 2025-05-31       2020-02-19     2020-02-13     2999-01-01          -70512.060000               0.000000                    0.000000                  0.000000               0.000000                  0.000000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000       964691.010000             0.000000        0.000000   776231.900000    0.000000 786500.000000 791245.220000         0.000000 -247701.410000    1300000.000000        1300000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            10268.100000            0.000000          0.000000      0.000000 -18162.740000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0724            0.0724              0.0724   0.0724       0.0                0               -1 Liquidated/Held for Sale   0.000000      NULL NULL        NULL                      0.0

-- INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE Amount        SP UPB   USP UPB  Total UPB TransInt TransMIP SF       INTBEGININTRATE INTCURRENTINTRATE IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE CHRINTERESTTYPE IDSUSERID DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL       CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS     CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ------------------- ---------------- ------------------ ------------- -------- -------- --------- -------- -------- -------- --------------- ----------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ----------- ------------- ------------- ---------------- -------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- ------------------------ ---------- --------- ------- -------- ------------------------
--                3146452.0                 141 2025-06-01                      110      0.000000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000          0.0724            0.0724   74230996                 141                110 NomuraHS      266130007        266130007           110                3146452.0              0.0 0                HomeSafe    Lump Sum   Fixed           cking     2025-05-29                 2025-06-01       2020-02-19     2020-02-13     2999-01-01               0.000000               0.000000                    0.000000                  0.000000               0.000000                  0.000000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000       964691.010000             0.000000        0.000000   776231.900000    0.000000 786500.000000 791245.220000         0.000000 -247701.410000    1300000.000000        1300000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            10268.100000            0.000000          0.000000      0.000000 -18162.740000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0724            0.0724              0.0724   0.0724       0.0                0               -1 Inactive                   0.000000      NULL NULL        NULL                      0.0
--                3146452.0                 140 2025-06-01                      109 -70512.060000 0.000000 0.000000  0.000000 0.000000 0.000000 0.000000          0.0724            0.0724   74230995                 140                109 NomuraHS      266130007        266130007            70                3146452.0              0.0 0                HomeSafe    Lump Sum   Fixed           cking     2025-05-29                 2025-06-01       2020-02-19     2020-02-13     2999-01-01          -70512.060000               0.000000                    0.000000                  0.000000               0.000000                  0.000000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000       964691.010000             0.000000        0.000000   776231.900000    0.000000 786500.000000 791245.220000         0.000000 -247701.410000    1300000.000000        1300000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            10268.100000            0.000000          0.000000      0.000000 -18162.740000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0724            0.0724              0.0724   0.0724       0.0                0               -1 Liquidated/Held for Sale   0.000000      NULL NULL        NULL                      0.0

--UPDATE celink.TBLTRANSACTIONS set DTMEFFECTIVEDATE = date('2025-06-01') where INTSUBSERVICERLOANNUMBER = 3146452 and IDSTRANSACTIONCOUNT = 141;
--UPDATE celink.TBLTRANSACTIONS set DTMEFFECTIVEDATE = date('2025-06-01') where INTSUBSERVICERLOANNUMBER = 3146452 and IDSTRANSACTIONCOUNT = 140;

-----------------------------------------------------
select  
	'(' || cast(INTSUBSERVICERLOANNUMBER as integer) || ', '
	|| '''Per HDT 190886 Transaction updated in DTMEFFECTIVEDATE in row#140 #141.'''
	|| ', ' 
	|| 'CURRENT_TIMESTAMP, '
	|| '''tkato'', 0, 0), '
	as "Note Insert Value"
from celink.TBLTRANSACTIONS 
where INTSUBSERVICERLOANNUMBER = 3146452
and IDSTRANSACTIONCOUNT in (141,140)

order by INTSUBSERVICERLOANNUMBER, IDSTRANSACTIONCOUNT
for read only with ur;

-- Note Insert Value
-- ------------------------------------------------------------------------------------------------------------------------
-- (3146452, 'Per HDT 190886 Transaction updated in DTMEFFECTIVEDATE in row#140 #141.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 
-- (3146452, 'Per HDT 190886 Transaction updated in DTMEFFECTIVEDATE in row#140 #141.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 

----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter ,,, plug in valeus fro -- Note Insert Value Creastion
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, StepNum) as
(values
-- Note Insert Value
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
(3146452, 'Per HDT 190886 Transaction updated in DTMEFFECTIVEDATE in row#140 #141.', CURRENT_TIMESTAMP, 'tkato', 0, 0)
) 
select * from P
;

-- LOAN    NOTE                                                                    TIMES                      WHO   PRIO STEPNUM
-- ------- ----------------------------------------------------------------------- -------------------------- ----- ---- -------
-- 3146452 Per HDT 190886 Transaction updated in DTMEFFECTIVEDATE in row#140 #141. 2025-05-30 09:59:13.843486 tkato    0       0
                