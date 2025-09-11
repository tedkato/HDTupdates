/* ****************************************************************************************************************************
* from Cyndie's note below, the Original Appraisal Value needs to  
Update following ... 
1. tblPropertyDescription.CurrentAppraisalValue
2. tblLoanData.CURPROPAPPRAISEDVALUE
3. Post 105 to tblTransactions with zero interest/mip, with requested value at CURPROPAPPRAISEDVALUE.
******************************************************************************************************************************** */

/* ref : 109825
1257811	Original Appraisal Amount	125,000.00	130,000.00
--
Cyndie King
Sep 07, 2022 at 1:37 PM
Edited Sep 7 1:39 PM
Ted, these are done by posting a zero amount - zero interest/mip 105 to tblTransactions that updates the CURPROPAPPRAISEDVALUE field only,
tblPropertyDescription.CurrentAppraisalValue and tblPropertyDescription.CURRENTAPPRAISALDATE
tblLoanData.CURPROPAPPRAISEDVALUE only
--130,000.00 as "CURPROPAPPRAISEDVALUE"
--0.00 as "CURTRANSACTIONAMT"
--0.00 as "CURTRANSACTIONINTEREST"
--0.00 as "CURTRANSACTIONMIP"
*/

/*
20220909
C:\Users\ted.kato\RS\Incident\ZZ HDTveri\aDoc\HDTValidation_x_.csv
C:\Users\ted.kato\Documents\HDTUpdtNotes_109718.csv
HDT109718_OriginalAppraisalValue.sql

INCIDENT #109718
Jennifer Dees
Director, Client Relations
Multiple changes in request
Created: Sep 02, 2022 at 7:25 PM by Jennifer Dees
Property Appraisals
60 various loans
RMF Z35392 Celin...xlsx

1199393	Original Appraisal Amount	195,000.00	200,000.00

--200,000.00 as "CURPROPAPPRAISEDVALUE"
--0.00 as "CURTRANSACTIONAMT"
--0.00 as "CURTRANSACTIONINTEREST"
--0.00 as "CURTRANSACTIONMIP"
*/

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
20250910  ... this is to update both  Appraisal and MCA

[ID:0199112]  Appraisal Value Change  9/10/2025 11:53 AM  Jordann Greene
3358168, 3371814 3372073 3372778 3372772 3372773 3372774
Please update the appraised values as specified on the attached. 
I've already updated the auth contacts so you can disregard those. 
Thank you! 

="(" & E2 & ", 0199112, 'Jordann Greene', " & A2 & ", " & C2 & ", " & D2 & ", '" & B2 & "'),"
*/

-- ------------------------ ---------- ------------------- ------------------ ------------- -------------------- ---------------- -------------------------- ------------- --------------------- ----------------- ---------- ------------------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- ------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- -------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
-- ------------------------ ---------- ------------------- ------------------ ------------- -------------------- ---------------- -------------------------- ------------- --------------------- ----------------- ---------- ------------------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- ------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- -------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
-- tblTransactions ... single check  
select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT,
	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, DTMEFFECTIVEDATE, --,CURTRANSACTIONINTEREST ,CURTRANSACTIONMIP ,CURSCHEDULEDPAYMENTMIP, -- CURSCHEDULEDPAYMENTMIP = prev CURSCHEDULEDPAYMENTMIP + CURTRANSACTIONMIP
	DTMTRANSACTIONCREATIONDATE, IDSUSERID,
	CURPROPAPPRAISEDVALUE,     
	CURMAXCLAIMAMOUNT
	
	,* 
	from celink.TBLTRANSACTIONS 
	where INTSUBSERVICERLOANNUMBER = 3369013
	order by IDSTRANSID desc 
for read only with ur;

-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS DTMEFFECTIVEDATE DTMTRANSACTIONCREATIONDATE IDSUSERID     CURPROPAPPRAISEDVALUE CURMAXCLAIMAMOUNT IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE  CHRPAYTYPE CHRINTERESTTYPE IDSUSERID     DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ------------------ ------------- -------------------- ---------------- -------------------------- ------------- --------------------- ----------------- ---------- ------------------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- ------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- -------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--


-----------------------------
-- Select New and most recent 
-----------------------------
	with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
	(VALUES
(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')
	)
select
	-- -- -- 	IDSTRANSID --	,
	-- -- -- 	
	D.SeqNum,  -->>> test purpose
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount, -- -- 5   as "IdsTransactionCount",    --IDSTRANSACTIONCOUNT ,
	105	as "IdsTransactionCode", --IDSTRANSACTIONCODE
	
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
	
	'tkato' as "IdsUserID", --IDSUSERID 	,
	CURRENT_DATE as "DtmTransactionCreationDate", -- date ('2021-11-30') as "DtmTransactionCreationDate", --DTMTRANSACTIONCREATIONDATE ,
	CURRENT_DATE as  "DtmEffectiveDate",          --date ('2021-11-30') as "DtmEffectiveDate", --DTMEFFECTIVEDATE
	
	DTMFUNDINGDATE 	,
	DTMCLOSINGDATE 	,
	DTMPURCHASEDATE 	,
	
	0.00 as "*CURTRANSACTIONAMT*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	
	CURSCHEDULEDPAYMENTUPB 	,
	CURSCHEDULEDPAYMENTINTEREST 	,
	CURSCHEDULEDPAYINTACCRUED 	,
	CURSCHEDULEDPAYMENTMIP 	,
	CURSCHEDULEDPAYMIPACCRUED 	,
	0.00 as "*CURTRANSACTIONINTEREST*" 	,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	0.00 as "*CURTRANSACTIONMIP*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	D.Good as "*CURMAXCLAIMAMOUNT*", -- MCA !!   -- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	D.Good as "*CURPROPAPPRAISEDVALUE*",	     -- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	CHRLOANSTATUSREMARKS 	,
	CUR1098MIP 	,
	INTVENDOR 	,
	CHRMEMO 	,
	INTPAYTO 	,
	CURTRANSACTIONSERVICEFEE as "*CURTRANSACTIONSERVICEFEE*" -- may need to force 0 
FROM  MyVal D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

------------------------------------------
			UNION
------------------------------------------
select
	-- -- -- 	IDSTRANSID --	,
	-- -- -- 	
	D.SeqNum,  -->>> test purpose
	A.IDSTRANSACTIONCOUNT  AS RowCount, -- -- 5   as "IdsTransactionCount",    --IDSTRANSACTIONCOUNT ,
	IdsTransactionCode,
	
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
	
	IDSUSERID 	,
	DtmTransactionCreationDate, -- date ('2021-11-30') as "DtmTransactionCreationDate", --DTMTRANSACTIONCREATIONDATE ,
	DtmEffectiveDate,          --date ('2021-11-30') as "DtmEffectiveDate", --DTMEFFECTIVEDATE
	
	DTMFUNDINGDATE 	,
	DTMCLOSINGDATE 	,
	DTMPURCHASEDATE 	,
	
	CURTRANSACTIONAMT as "*CURTRANSACTIONAMT*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	
	CURSCHEDULEDPAYMENTUPB 	,
	CURSCHEDULEDPAYMENTINTEREST 	,
	CURSCHEDULEDPAYINTACCRUED 	,
	CURSCHEDULEDPAYMENTMIP 	,
	CURSCHEDULEDPAYMIPACCRUED 	,
	CURTRANSACTIONINTEREST as "*CURTRANSACTIONINTEREST*" 	,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	CURTRANSACTIONMIP as "*CURTRANSACTIONMIP*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	CURMAXCLAIMAMOUNT 	  as "*CURMAXCLAIMAMOUNT*" ,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	CURPROPAPPRAISEDVALUE as "*CURPROPAPPRAISEDVALUE*",	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	CHRLOANSTATUSREMARKS 	,
	CUR1098MIP 	,
	INTVENDOR 	,
	CHRMEMO 	,
	INTPAYTO 	,
	CURTRANSACTIONSERVICEFEE	
FROM  MyVal D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT

order by SeqNum, RowCount Desc 
for read only with ur
;

----------------------------------------------------------------------------------------------------------------------
-- Validation before update ... compare count against above  ... use below with SeqNum
-- ------ -------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- -------- ******************* *********************** ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- --------------------------
-- SEQNUM ROWCOUNT IdsTransactionCode IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE  CHRPAYTYPE CHRINTERESTTYPE IdsUserID DtmTransactionCreationDate DtmEffectiveDate DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE *CURTRANSACTIONAMT* CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED *CURTRANSACTIONINTEREST* *CURTRANSACTIONMIP* CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL CURNETPL      *CURMAXCLAIMAMOUNT* *CURPROPAPPRAISEDVALUE* CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO *CURTRANSACTIONSERVICEFEE*
-- ------ -------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- ------------- ------------------- ----------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- --------------------------
--      1       12                105 BABS25RM11          6600        234790013             0                3358168.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-02-10     2025-02-05     2999-01-01                 0.000000          713680.530000                35747.730000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   677932.800000  713680.530000  677932.800000  677932.800000         0.000000      0.000000      1290000.000000          1290000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0939            0.0939              0.0939   0.0939       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      1       11                101 BABS25RM11          6600        234790013             0                3358168.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-02-10     2025-02-05     2999-01-01              5541.190000          713680.530000                35747.730000                  0.000000               0.000000                  0.000000              5541.190000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   677932.800000  713680.530000  677932.800000  677932.800000         0.000000      0.000000      1264800.000000          1290000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0939            0.0939              0.0939   0.0939       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

--      2        5                105 CENTIER             6600             6600             0                3371814.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-07-28     2025-07-23     2999-01-01                 0.000000         2064881.900000                16867.220000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  2047914.680000 2064881.900000 3630341.400000 3630341.400000         0.000000 730015.440000      6700000.000000          6700000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000           852411.280000       852411.280000          0.000000      0.000000  0.000000      50.000000            100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      2        4                101 CENTIER             6600             6600             0                3371814.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-07-28     2025-07-23     2999-01-01             15404.010000         2064881.900000                16867.220000                  0.000000               0.000000                  0.000000             15354.010000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  2047914.680000 2064881.900000 3630341.400000 3630341.400000         0.000000 730015.440000      6566000.000000          6566000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000           852411.280000       852411.280000          0.000000      0.000000  0.000000      50.000000            100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

--      3        5                105 CENTIER             6600             6600             0                3372073.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-07-30     2025-07-25     2999-01-01                 0.000000          796304.930000                 6109.160000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   790195.770000  796304.930000  790195.770000  790195.770000         0.000000      0.000000      1575000.000000          1575000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      3        4                101 CENTIER             6600             6600             0                3372073.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-07-30     2025-07-25     2999-01-01              5914.750000          796304.930000                 6109.160000                  0.000000               0.000000                  0.000000              5914.750000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   790195.770000  796304.930000  790195.770000  790195.770000         0.000000      0.000000      1397340.000000          1397340.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

--      4        4                105 CENTIER             6600             6600             0                3372778.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-04     2025-07-30     2999-01-01                 0.000000          844359.180000                 5577.810000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   838751.370000  844359.180000  884778.520000  884778.520000         0.000000      0.000000      1800000.000000          1800000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            46027.150000        46027.150000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      4        3                101 CENTIER             6600             6600             0                3372778.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-04     2025-07-30     2999-01-01              5607.810000          844359.180000                 5577.810000                  0.000000               0.000000                  0.000000              5577.810000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   838751.370000  844359.180000  884778.520000  884778.520000         0.000000      0.000000      1572660.000000          1572660.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            46027.150000        46027.150000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

--      5        4                105 CENTIER             6600             6600             0                3372772.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-06     2025-08-01     2999-01-01                 0.000000          113057.260000                  691.710000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   112335.550000  113057.260000  142673.750000  142673.750000         0.000000      0.000000       393000.000000           393000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            30338.200000        30338.200000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      5        3                101 CENTIER             6600             6600             0                3372772.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-06     2025-08-01     2999-01-01               721.710000          113057.260000                  691.710000                  0.000000               0.000000                  0.000000               691.710000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   112335.550000  113057.260000  142673.750000  142673.750000         0.000000      0.000000       345289.800000           345289.800000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            30338.200000        30338.200000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

--      6        4                105 CENTIER             6600             6600             0                3372773.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-05     2025-07-31     2999-01-01                 0.000000          799863.340000                 5083.970000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   794779.370000  799863.340000  794779.370000  794779.370000         0.000000      0.000000      1730000.000000          1730000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      6        3                101 CENTIER             6600             6600             0                3372773.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-05     2025-07-31     2999-01-01              5083.970000          799863.340000                 5083.970000                  0.000000               0.000000                  0.000000              5083.970000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   794779.370000  799863.340000  794779.370000  794779.370000         0.000000      0.000000      1594022.000000          1594022.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

--      7        4                105 CENTIER             6600             6600             0                3372774.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-05     2025-07-31     2999-01-01                 0.000000          756950.040000                 4811.220000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   752138.820000  756950.040000  752138.820000  752138.820000         0.000000      0.000000      1500000.000000          1500000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      7        3                101 CENTIER             6600             6600             0                3372774.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-05     2025-07-31     2999-01-01              4811.220000          756950.040000                 4811.220000                  0.000000               0.000000                  0.000000              4811.220000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   752138.820000  756950.040000  752138.820000  752138.820000         0.000000      0.000000      1382100.000000          1382100.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

----------------------------------------------------------------------------------------------------------------------
-- Validation right before update ... compare count against above  ... use below with SeqNum
-- -------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- -------- ***************** ********************* ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
-- ROWCOUNT IdsTransactionCode IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE  CHRPAYTYPE CHRINTERESTTYPE IdsUserID DtmTransactionCreationDate DtmEffectiveDate DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE *CURTRANSACTIONAMT* CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED *CURTRANSACTIONINTEREST* *CURTRANSACTIONMIP* CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- -------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--       12                105 BABS25RM11          6600        234790013             0                3358168.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-02-10     2025-02-05     2999-01-01                     0.00          713680.530000                35747.730000                  0.000000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   677932.800000  713680.530000  677932.800000  677932.800000         0.000000      0.000000           1290000               1290000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0939            0.0939              0.0939   0.0939       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--        5                105 CENTIER             6600             6600             0                3371814.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-07-28     2025-07-23     2999-01-01                     0.00         2064881.900000                16867.220000                  0.000000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  2047914.680000 2064881.900000 3630341.400000 3630341.400000         0.000000 730015.440000           6700000               6700000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000           852411.280000       852411.280000          0.000000      0.000000  0.000000      50.000000            100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--        5                105 CENTIER             6600             6600             0                3372073.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-07-30     2025-07-25     2999-01-01                     0.00          796304.930000                 6109.160000                  0.000000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   790195.770000  796304.930000  790195.770000  790195.770000         0.000000      0.000000           1575000               1575000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--        4                105 CENTIER             6600             6600             0                3372778.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-04     2025-07-30     2999-01-01                     0.00          844359.180000                 5577.810000                  0.000000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   838751.370000  844359.180000  884778.520000  884778.520000         0.000000      0.000000           1800000               1800000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            46027.150000        46027.150000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--        4                105 CENTIER             6600             6600             0                3372772.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-06     2025-08-01     2999-01-01                     0.00          113057.260000                  691.710000                  0.000000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   112335.550000  113057.260000  142673.750000  142673.750000         0.000000      0.000000            393000                393000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            30338.200000        30338.200000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--        4                105 CENTIER             6600             6600             0                3372773.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-05     2025-07-31     2999-01-01                     0.00          799863.340000                 5083.970000                  0.000000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   794779.370000  799863.340000  794779.370000  794779.370000         0.000000      0.000000           1730000               1730000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--        4                105 CENTIER             6600             6600             0                3372774.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-05     2025-07-31     2999-01-01                     0.00          756950.040000                 4811.220000                  0.000000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   752138.820000  756950.040000  752138.820000  752138.820000         0.000000      0.000000           1500000               1500000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

----------------------------------------------------------------------------------------------------------------------
-- Validation AFTER update ... compare count against above  ... use below with SeqNum
----------------------------------------------------------------------------------------------------------------------
-- SEQNUM ROWCOUNT IDSTRANSACTIONCODE IDSPOOLID  IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE  CHRPAYTYPE CHRINTERESTTYPE IDSUSERID DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE *CURTRANSACTIONAMT* CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED *CURTRANSACTIONINTEREST* *CURTRANSACTIONMIP* CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL CURNETPL      *CURMAXCLAIMAMOUNT* *CURPROPAPPRAISEDVALUE* CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------ -------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- ------------- ------------------- ----------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--      1       12                105 BABS25RM11          6600        234790013             0                3358168.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-02-10     2025-02-05     2999-01-01                 0.000000          713680.530000                35747.730000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   677932.800000  713680.530000  677932.800000  677932.800000         0.000000      0.000000      1290000.000000          1290000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0939            0.0939              0.0939   0.0939       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      1       11                101 BABS25RM11          6600        234790013             0                3358168.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-02-10     2025-02-05     2999-01-01              5541.190000          713680.530000                35747.730000                  0.000000               0.000000                  0.000000              5541.190000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   677932.800000  713680.530000  677932.800000  677932.800000         0.000000      0.000000      1264800.000000          1290000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0939            0.0939              0.0939   0.0939       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      1       10                105 BABS25RM11          6600        234790013             0                3358168.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-08-13                 2025-08-13       2025-02-10     2025-02-05     2999-01-01                 0.000000          708139.340000                30206.540000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   677932.800000  708139.340000  677932.800000  677932.800000         0.000000      0.000000      1264800.000000          1290000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0939            0.0939              0.0939   0.0939       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

--      2        5                105 CENTIER             6600             6600             0                3371814.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-07-28     2025-07-23     2999-01-01                 0.000000         2064881.900000                16867.220000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  2047914.680000 2064881.900000 3630341.400000 3630341.400000         0.000000 730015.440000      6700000.000000          6700000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000           852411.280000       852411.280000          0.000000      0.000000  0.000000      50.000000            100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      2        4                101 CENTIER             6600             6600             0                3371814.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-07-28     2025-07-23     2999-01-01             15404.010000         2064881.900000                16867.220000                  0.000000               0.000000                  0.000000             15354.010000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  2047914.680000 2064881.900000 3630341.400000 3630341.400000         0.000000 730015.440000      6566000.000000          6566000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000           852411.280000       852411.280000          0.000000      0.000000  0.000000      50.000000            100.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      2        3                600 CENTIER             6600             6600             0                3371814.0              0.0 0                Equity Power Lump Sum   Fixed           dbeet     2025-08-07                 2025-08-01       2025-07-28     2025-07-23     2999-01-01                 0.000000         2049477.890000                 1513.210000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  2047914.680000 2049477.890000 3630341.400000 3630341.400000         0.000000 730015.440000      6566000.000000          6566000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000           852411.280000       852411.280000          0.000000      0.000000  0.000000      50.000000             50.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

--      3        5                105 CENTIER             6600             6600             0                3372073.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-07-30     2025-07-25     2999-01-01                 0.000000          796304.930000                 6109.160000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   790195.770000  796304.930000  790195.770000  790195.770000         0.000000      0.000000      1575000.000000          1575000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      3        4                101 CENTIER             6600             6600             0                3372073.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-07-30     2025-07-25     2999-01-01              5914.750000          796304.930000                 6109.160000                  0.000000               0.000000                  0.000000              5914.750000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   790195.770000  796304.930000  790195.770000  790195.770000         0.000000      0.000000      1397340.000000          1397340.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      3        3                600 CENTIER             6600             6600             0                3372073.0              0.0 0                Equity Power Lump Sum   Fixed           dbeet     2025-08-07                 2025-08-01       2025-07-30     2025-07-25     2999-01-01                 0.000000          790390.180000                  194.410000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   790195.770000  790390.180000  790195.770000  790195.770000         0.000000      0.000000      1397340.000000          1397340.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

--      4        4                105 CENTIER             6600             6600             0                3372778.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-04     2025-07-30     2999-01-01                 0.000000          844359.180000                 5577.810000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   838751.370000  844359.180000  884778.520000  884778.520000         0.000000      0.000000      1800000.000000          1800000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            46027.150000        46027.150000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      4        3                101 CENTIER             6600             6600             0                3372778.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-04     2025-07-30     2999-01-01              5607.810000          844359.180000                 5577.810000                  0.000000               0.000000                  0.000000              5577.810000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   838751.370000  844359.180000  884778.520000  884778.520000         0.000000      0.000000      1572660.000000          1572660.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            46027.150000        46027.150000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      4        2                600 CENTIER             6600             6600             0                3372778.0              0.0 0                Equity Power Lump Sum   Fixed           dbeet     2025-08-13                 2025-08-01       2025-08-04     2025-07-30     2999-01-01                 0.000000          838751.370000                    0.000000               5577.810000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   838751.370000  838751.370000  884778.520000  884778.520000         0.000000      0.000000      1572660.000000          1572660.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            46027.150000        46027.150000          0.000000      0.000000  0.000000      30.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

--      5        4                105 CENTIER             6600             6600             0                3372772.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-06     2025-08-01     2999-01-01                 0.000000          113057.260000                  691.710000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   112335.550000  113057.260000  142673.750000  142673.750000         0.000000      0.000000       393000.000000           393000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            30338.200000        30338.200000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      5        3                101 CENTIER             6600             6600             0                3372772.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-06     2025-08-01     2999-01-01               721.710000          113057.260000                  691.710000                  0.000000               0.000000                  0.000000               691.710000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   112335.550000  113057.260000  142673.750000  142673.750000         0.000000      0.000000       345289.800000           345289.800000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            30338.200000        30338.200000          0.000000      0.000000  0.000000      30.000000             30.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      5        2                600 CENTIER             6600             6600             0                3372772.0              0.0 0                Equity Power Lump Sum   Fixed           dbeet     2025-08-13                 2025-08-01       2025-08-06     2025-08-01     2999-01-01                 0.000000          112335.550000                    0.000000                691.710000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   112335.550000  112335.550000  142673.750000  142673.750000         0.000000      0.000000       345289.800000           345289.800000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000            30338.200000        30338.200000          0.000000      0.000000  0.000000      30.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0899            0.0899              0.0899   0.0899       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

--      6        4                105 CENTIER             6600             6600             0                3372773.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-05     2025-07-31     2999-01-01                 0.000000          799863.340000                 5083.970000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   794779.370000  799863.340000  794779.370000  794779.370000         0.000000      0.000000      1730000.000000          1730000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      6        3                101 CENTIER             6600             6600             0                3372773.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-05     2025-07-31     2999-01-01              5083.970000          799863.340000                 5083.970000                  0.000000               0.000000                  0.000000              5083.970000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   794779.370000  799863.340000  794779.370000  794779.370000         0.000000      0.000000      1594022.000000          1594022.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      6        2                600 CENTIER             6600             6600             0                3372773.0              0.0 0                Equity Power Lump Sum   Fixed           dbeet     2025-08-13                 2025-08-01       2025-08-05     2025-07-31     2999-01-01                 0.000000          794779.370000                    0.000000               5083.970000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   794779.370000  794779.370000  794779.370000  794779.370000         0.000000      0.000000      1594022.000000          1594022.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

--      7        4                105 CENTIER             6600             6600             0                3372774.0              0.0 0                Equity Power Lump Sum   Fixed           tkato     2025-09-10                 2025-09-10       2025-08-05     2025-07-31     2999-01-01                 0.000000          756950.040000                 4811.220000                  0.000000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   752138.820000  756950.040000  752138.820000  752138.820000         0.000000      0.000000      1500000.000000          1500000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      7        3                101 CENTIER             6600             6600             0                3372774.0              0.0 0                Equity Power Lump Sum   Fixed           BATCH     2025-08-29                 2025-08-31       2025-08-05     2025-07-31     2999-01-01              4811.220000          756950.040000                 4811.220000                  0.000000               0.000000                  0.000000              4811.220000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   752138.820000  756950.040000  752138.820000  752138.820000         0.000000      0.000000      1382100.000000          1382100.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
--      7        2                600 CENTIER             6600             6600             0                3372774.0              0.0 0                Equity Power Lump Sum   Fixed           dbeet     2025-08-13                 2025-08-01       2025-08-05     2025-07-31     2999-01-01                 0.000000          752138.820000                    0.000000               4811.220000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   752138.820000  752138.820000  752138.820000  752138.820000         0.000000      0.000000      1382100.000000          1382100.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0898            0.0898              0.0898   0.0898       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0

-- ------ -------- ------------------ ---------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ------------ ---------- --------------- --------- -------------------------- ---------------- -------------- -------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- ------------ ----------------- *********************** ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- --------------------------

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

-- select the last trans as source -----------------------------------------------------------------------------------------------------------
	with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
	(VALUES

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

	)
select
	-- -- -- 	IDSTRANSID --	,
	-- -- --	D.SeqNum,  -->>> test purpose
	A.IDSTRANSACTIONCOUNT + 1 AS RowCount, -- -- 5   as "IdsTransactionCount",    --IDSTRANSACTIONCOUNT ,
	105	as "IdsTransactionCode", --IDSTRANSACTIONCODE
	
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
	
	'tkato' as "IdsUserID", --IDSUSERID 	,
	CURRENT_DATE as "DtmTransactionCreationDate", -- date ('2021-11-30') as "DtmTransactionCreationDate", --DTMTRANSACTIONCREATIONDATE ,
	CURRENT_DATE as  "DtmEffectiveDate",          --date ('2021-11-30') as "DtmEffectiveDate", --DTMEFFECTIVEDATE
	
	DTMFUNDINGDATE 	,
	DTMCLOSINGDATE 	,
	DTMPURCHASEDATE 	,
	
	0.00 as "*CURTRANSACTIONAMT*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	
	CURSCHEDULEDPAYMENTUPB 	,
	CURSCHEDULEDPAYMENTINTEREST 	,
	CURSCHEDULEDPAYINTACCRUED 	,
	CURSCHEDULEDPAYMENTMIP 	,
	CURSCHEDULEDPAYMIPACCRUED 	,
	0.00 as "*CURTRANSACTIONINTEREST*" 	,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	0.00 as "*CURTRANSACTIONMIP*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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

	D.Good as CURMAXCLAIMAMOUNT ,
	D.Good as CURPROPAPPRAISEDVALUE,

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
	CHRLOANSTATUSREMARKS 	,
	CUR1098MIP 	,
	INTVENDOR 	,
	CHRMEMO 	,
	INTPAYTO 	,
	CURTRANSACTIONSERVICEFEE	
FROM  MyVal D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      = C.MAXCOUNT
order by D.SeqNum
;	  
  
--

----------------------------------------------------------------------------------------------------------------------
-- validation after
----------------------------------------------------------------------------------------------------------------------
	with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
	(VALUES

(1, 0199112, 'Jordann Greene', 3358168, 1264800, 1290000, 'Appraisal Value'),
(2, 0199112, 'Jordann Greene', 3371814, 6566000, 6700000, 'Appraisal Value'),
(3, 0199112, 'Jordann Greene', 3372073, 1397340, 1575000, 'Appraisal Value'),
(4, 0199112, 'Jordann Greene', 3372778, 1572660, 1800000, 'Appraisal Value'),
(5, 0199112, 'Jordann Greene', 3372772, 345289.8, 393000, 'Appraisal Value'),
(6, 0199112, 'Jordann Greene', 3372773, 1594022, 1730000, 'Appraisal Value'),
(7, 0199112, 'Jordann Greene', 3372774, 1382100, 1500000, 'Appraisal Value')

	)
select
	-- -- -- 	IDSTRANSID --	,
	-- -- -- 	
	D.SeqNum,  -->>> test purpose
	A.IDSTRANSACTIONCOUNT  AS RowCount, -- -- 5   as "IdsTransactionCount",    --IDSTRANSACTIONCOUNT ,
	IdsTransactionCode,
	
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
	
	IDSUSERID 	,
	DtmTransactionCreationDate, -- date ('2021-11-30') as "DtmTransactionCreationDate", --DTMTRANSACTIONCREATIONDATE ,
	DtmEffectiveDate,          --date ('2021-11-30') as "DtmEffectiveDate", --DTMEFFECTIVEDATE
	
	DTMFUNDINGDATE 	,
	DTMCLOSINGDATE 	,
	DTMPURCHASEDATE 	,
	
	CURTRANSACTIONAMT as "*CURTRANSACTIONAMT*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	
	CURSCHEDULEDPAYMENTUPB 	,
	CURSCHEDULEDPAYMENTINTEREST 	,
	CURSCHEDULEDPAYINTACCRUED 	,
	CURSCHEDULEDPAYMENTMIP 	,
	CURSCHEDULEDPAYMIPACCRUED 	,
	CURTRANSACTIONINTEREST as "*CURTRANSACTIONINTEREST*" 	,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	CURTRANSACTIONMIP as "*CURTRANSACTIONMIP*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	CURMAXCLAIMAMOUNT as "*CURMAXCLAIMAMOUNT*" 			,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	CURPROPAPPRAISEDVALUE as "*CURPROPAPPRAISEDVALUE*"	,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	CHRLOANSTATUSREMARKS 	,
	CUR1098MIP 	,
	INTVENDOR 	,
	CHRMEMO 	,
	INTPAYTO 	,
	CURTRANSACTIONSERVICEFEE	
FROM  MyVal D
INNER JOIN CELINK.TBLTRANSACTIONS A
	on 	D.LOAN = A.INTSUBSERVICERLOANNUMBER 
inner join CELINK.CHOOSELASTRECORD C
	on  A.INTSUBSERVICERLOANNUMBER = C.CELINKLOAN 
	AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT -2

order by SeqNum, RowCount Desc 
for read only with ur
;

-------------------------------------------------------------------------------------------------------------------------------------
-- end
-------------------------------------------------------------------------------------------------------------------------------------
  