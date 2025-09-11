
/*
** This is to post an 105 adjustment 

** should be the same format as MCA/Appraisal
(SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol)
="(" & E2 & ", 164547, 'Jordann Greene', " & A2 & ", " & C2 & ", " & D2 & ", '" & B2 & "'),"

**
Notes,
tblLoanData,
tblTransactions

--*--
1 transaction posted.  Peer review pending.

*/

--------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------

/*
20250829
[ID:0198294] closing date 8/29/2025 12:11 PM Jordann Greene 
3374081  Please update closing date to 8/19/25

="(" & E2 & ", 0198294, 'Jordann Greene', " & A2 & ", date('" & text(C2, "YYYY-MM-DD") & "'), date('" & text(D2, "YYYY-MM-DD") & "'), '" & B2 & "'),"

(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')

--*--
1 loan.  Closing date updated in tblLoanData, posting 105 adjustment in tblTransactions.  Peer review pending.
*/


--------------------------------------------------------------------------------------------------------------------------------------------
-- closing date ... tblloandata
select 
--	TT.DATEFIRSTIRC,
--	TT.DTMFUNDINGDATE,  
	TT.DTMClosingDate
	, '-->--', TT.* 
from  celink.tblloandata TT
where  TT.INTSUBSERVICERLOANNUMBER = 3364600
for read only with ur;
-- DTMCLOSINGDATE        2     INTSUBSERVICERLOANNUMBER IDSSERVICERID IDSSUBSERVICERID CHRLOANTYPE CHRINTERESTTYPE DTMTRANSACTIONCREATIONDATE DTMFUNDINGDATE        DTMCLOSINGDATE        CURPROPAPPRAISEDVALUE CHRSUBLOANTYPE INTEQUITYGUARD CHRPAYTYPE     CHRMERSNUMBER      SERVICINGONLY CHRPREPAY DATEFIRSTIRC INTCLOSEDEND CHRLOANOFFICER CURSALESPRICE DTMRESCISSIONDATE INTSERVICEFEEMETHOD CHRGOVTBACKER DBLMIPRATE CHRMOM DBLSERVICEFEEFLATRATE DBLSERVICEFEEPERCENT LOCOM GROWTHALLOWED BEINGREPURCHASED GROSSMIP    BORROWERPAIDMIP CHRLOANOFFICEREMAIL                                                                                  LIVELOAN LOCKED SPCCONTACTNAME PREVIOUSSPCCONTACTNAME SPCCONTACTDATE PREVIOUSSPCCONTACTDATE CHAINOFTITLECONFIRMED LANGUAGE REPAIRADMINFEEPCT LOANPURPOSE LOANORIGINATOR                 INITIALDISBURSEMENTLIMIT FHAISSUEDATE NOSFSACALCULATE INTCEILING INTFLOOR INTPERCENTOFCHANGE INTRATECHANGEFREQ BEGININTRATE TENPERCENTUSAGEAMOUNT TOTALMANDATORYOBLIGATION CLOSINGCOSTS MAXRATE  MINRATE  MONTH13SCHEDPAYAMT DEBENTUREINTRATE MICENDORSEDDATE MAXPL    GROWTHRATE GROWTHFREQ GROWTHDATE GROWTHSTOPDATE UNSCHINTRATE MININITIALDRAWPERCENT DRAWSTOPDATE DRAWSTATUS
-- --------------------- ----- ------------------------ ------------- ---------------- ----------- --------------- -------------------------- --------------------- --------------------- --------------------- -------------- -------------- -------------- ------------------ ------------- --------- ------------ ------------ -------------- ------------- ----------------- ------------------- ------------- ---------- ------ --------------------- -------------------- ----- ------------- ---------------- ----------- --------------- ---------------------------------------------------------------------------------------------------- -------- ------ -------------- ---------------------- -------------- ---------------------- --------------------- -------- ----------------- ----------- ------------------------------ ------------------------ ------------ --------------- ---------- -------- ------------------ ----------------- ------------ --------------------- ------------------------ ------------ -------- -------- ------------------ ---------------- --------------- -------- ---------- ---------- ---------- -------------- ------------ --------------------- ------------ ----------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- tblTransactions -- single
select 
	TT.DTMCLOSINGDATE, 
	TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.dtmEFFECTIVEDATE,
	TT.IDSSTATUSCODE, TT.IDSUSERID
	,'-->--', TT.*
	
from  celink.tbltransactions TT
where TT.INTSUBSERVICERLOANNUMBER = 3370280
order by TT.IDSTRANSACTIONCOUNT desc
with ur;

-- DTMCLOSINGDATE INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE DTMEFFECTIVEDATE IDSSTATUSCODE IDSUSERID         8     IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID         DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- -------------- ------------------------ ------------------- ------------------ ---------------- ------------- ----------------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ----------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- tblTransactions -- -- bulk check 
with P (SeqNum, HDTNum, Requester, Loan,  Baad, Good, UpdtCol) as
(values

(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')

)
select 
	P.SeqNum, P.HDTNum,  P.Loan, P.Baad, P.Good,
	TT.DTMCLOSINGDATE, 
	'-->--', --TT.*
	TT.INTSUBSERVICERLOANNUMBER, TT.IDSTRANSACTIONCOUNT, TT.IDSTRANSACTIONCODE, TT.dtmEFFECTIVEDATE,
	TT.IDSSTATUSCODE, TT.IDSUSERID
	,'-->--', TT.*
	
from   P
inner join celink.tbltransactions TT
on  P.loan = TT.INTSUBSERVICERLOANNUMBER
inner join CELINK.CHOOSELASTRECORD XX
on  TT.INTSUBSERVICERLOANNUMBER = XX.CELINKLOAN 
AND TT.IDSTRANSACTIONCOUNT      >= XX.MAXCOUNT -2 
order by P.SeqNum, TT.IDSTRANSACTIONCOUNT desc
with ur;

-- SEQNUM HDTNUM LOAN    BAAD       GOOD       DTMCLOSINGDATE 7     INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE DTMEFFECTIVEDATE IDSSTATUSCODE IDSUSERID      14    IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE CHRINTERESTTYPE IDSUSERID      DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL CURNETPL CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------ ------ ------- ---------- ---------- -------------- ----- ------------------------ ------------------- ------------------ ---------------- ------------- -------------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- ---------- --------------- -------------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- -------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
--      1 198294 3374081 2025-08-18 2025-08-19 2025-08-18     -->--                3374081.0                   1                100 2025-08-25                   0 svc_Longbridge -->--   75761541                   1                100 31                 4800             4800             0                3374081.0              0.0 000000000000     Platinum    Lump Sum   Fixed           svc_Longbridge 2025-08-26                 2025-08-25       2025-08-25     2025-08-18     2999-01-01               0.000000         1774500.000000                    0.000000               2624.780000               0.000000                  0.000000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  1774500.000000 1774500.000000 1774500.000000 1774500.000000         0.000000 0.000000    5250000.000000        5250000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.08875           0.08875             0.08875  0.08875       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0


-- ------------------------ ---------- ------------------- ------------------ -------------------------- ---------------- ------------ -------------- --------------------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ------------ -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ----------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ----------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
-- ------------------------ ---------- ------------------- ------------------ -------------------------- ---------------- ------------ -------------- --------------------- ----- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ------------ -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ----------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ----------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
-- Select New and most recent 
-----------------------------
with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(VALUES

--(1, 0194764, 'Jordann Greene', 3367720, date('2025-06-09'), date('2025-06-03'), 'Closing Date'),
--(2, 0194764, 'Jordann Greene', 3367739, date('2025-06-09'), date('2025-06-04'), 'Closing Date'),
--(3, 0194764, 'Jordann Greene', 3368456, date('2025-06-16'), date('2025-06-13'), 'Closing Date')
--(1, 195600, 'Jordann Greene', 3370280, date('2025-06-25'), date('2025-07-03'), 'Closing Date')
--(1, 196126, 'Jordann Greene', 3357565, date('2025-01-28'), date('2025-01-29'), 'Closing Date')
(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')

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
	D.Good as "*DTMCLOSINGDATE*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	CURMAXCLAIMAMOUNT,	    -- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	CURPROPAPPRAISEDVALUE,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	DTMCLOSINGDATE 	as "*DTMCLOSINGDATE*",
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

/*
----------------------------------------------------------------------------------------------------------------------
-- Validation before update ... compare count against above  ... use below with SeqNum
-- SEQNUM ROWCOUNT IdsTransactionCode IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE CHRINTERESTTYPE IdsUserID      DtmTransactionCreationDate DtmEffectiveDate DTMFUNDINGDATE *DTMCLOSINGDATE* DTMPURCHASEDATE *CURTRANSACTIONAMT* CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED *CURTRANSACTIONINTEREST* *CURTRANSACTIONMIP* CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL CURNETPL CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO *CURTRANSACTIONSERVICEFEE*
-- ------ -------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- ---------- --------------- -------------- -------------------------- ---------------- -------------- ---------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- -------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- --------------------------
--      1        2                105 31                 4800             4800             0                3374081.0              0.0 000000000000     Platinum    Lump Sum   Fixed           tkato          2025-08-29                 2025-08-29       2025-08-25     2025-08-19       2999-01-01                 0.000000         1774500.000000                    0.000000               2624.780000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  1774500.000000 1774500.000000 1774500.000000 1774500.000000         0.000000 0.000000    5250000.000000        5250000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.08875           0.08875             0.08875  0.08875       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0
--      1        1                100 31                 4800             4800             0                3374081.0              0.0 000000000000     Platinum    Lump Sum   Fixed           svc_Longbridge 2025-08-26                 2025-08-25       2025-08-25     2025-08-18       2999-01-01                 0.000000         1774500.000000                    0.000000               2624.780000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  1774500.000000 1774500.000000 1774500.000000 1774500.000000         0.000000 0.000000    5250000.000000        5250000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.08875           0.08875             0.08875  0.08875       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

----------------------------------------------------------------------------------------------------------------------
-- Validation right before update ... compare count against above  ... use below with SeqNum
		 ROWCOUNT IdsTransactionCode IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE CHRINTERESTTYPE IdsUserID DtmTransactionCreationDate DtmEffectiveDate DTMFUNDINGDATE *DTMCLOSINGDATE* DTMPURCHASEDATE *CURTRANSACTIONAMT* CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED *CURTRANSACTIONINTEREST* *CURTRANSACTIONMIP* CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL CURNETPL CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO *CURTRANSACTIONSERVICEFEE*
		 -------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- ---------- --------------- --------- -------------------------- ---------------- -------------- ---------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- -------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- --------------------------
		        2                105 31                 4800             4800             0                3374081.0              0.0 000000000000     Platinum    Lump Sum   Fixed           tkato     2025-08-29                 2025-08-29       2025-08-25     2025-08-19       2999-01-01                     0.00         1774500.000000                    0.000000               2624.780000               0.000000                  0.000000                     0.00                0.00                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  1774500.000000 1774500.000000 1774500.000000 1774500.000000         0.000000 0.000000    5250000.000000        5250000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.08875           0.08875             0.08875  0.08875       0.0                0                0 Active                 0.000000      NULL NULL        NULL                        0.0

----------------------------------------------------------------------------------------------------------------------
-- Validation AFTER update ... compare count against above  ... use below with SeqNum
 SEQNUM ROWCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE CHRINTERESTTYPE IDSUSERID      DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE *DTMCLOSINGDATE* DTMPURCHASEDATE *CURTRANSACTIONAMT* CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED *CURTRANSACTIONINTEREST* *CURTRANSACTIONMIP* CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB    CURORIGINALPL  CURCURRENTPL   CURORIGINALNETPL CURNETPL *CURMAXCLAIMAMOUNT* *CURPROPAPPRAISEDVALUE* CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS CUR1098MIP INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
 ------ -------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- ---------- --------------- -------------- -------------------------- ---------------- -------------- ---------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- -------- ------------------- ----------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
      1        2                105 31                 4800             4800             0                3374081.0              0.0 000000000000     Platinum    Lump Sum   Fixed           tkato          2025-08-29                 2025-08-29       2025-08-25     2025-08-19       2999-01-01                 0.000000         1774500.000000                    0.000000               2624.780000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  1774500.000000 1774500.000000 1774500.000000 1774500.000000         0.000000 0.000000      5250000.000000          5250000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.08875           0.08875             0.08875  0.08875       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
      1        1                100 31                 4800             4800             0                3374081.0              0.0 000000000000     Platinum    Lump Sum   Fixed           svc_Longbridge 2025-08-26                 2025-08-25       2025-08-25     2025-08-18       2999-01-01                 0.000000         1774500.000000                    0.000000               2624.780000               0.000000                  0.000000                 0.000000            0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000  1774500.000000 1774500.000000 1774500.000000 1774500.000000         0.000000 0.000000      5250000.000000          5250000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000      0.000000  0.000000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0         0.08875           0.08875             0.08875  0.08875       0.0                0                0 Active                 0.000000      NULL NULL        NULL                      0.0
*/


------ -------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- ---------- --------------- -------------- -------------------------- ---------------- -------------- ---------------- --------------- ------------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ------------------------ ------------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- -------------- -------------- -------------- ---------------- -------- ------------------- ----------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- --------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- -------------------- ---------- --------- ------- -------- ------------------------
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

-- select the last trans as source
with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(VALUES
(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')
)
select
	-- -- -- 	IDSTRANSID --	,
	-- -- -- 	
	-- -- -- D.SeqNum,  -->>> test purpose
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
	D.Good as "*DTMCLOSINGDATE*" 	,		-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
	CURMAXCLAIMAMOUNT,	    -- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
	CURPROPAPPRAISEDVALUE,	-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
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
order by D.SeqNum
;	  
  

	-----------------------------------------------------------------
	-----------------------------------------------------------------
	-- validation after
	with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
	(VALUES
	(1, 0198294, 'Jordann Greene', 3374081, date('2025-08-18'), date('2025-08-19'), 'Closing Date')
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
		DTMCLOSINGDATE 	as "*DTMCLOSINGDATE*",
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
		AND A.IDSTRANSACTIONCOUNT      >= C.MAXCOUNT - 1
	
	order by SeqNum, RowCount Desc 
	for read only with ur
	;

--------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
------ Notes update ,,, do in the other half

------------------
-- Notes validation
with MyVal (SEQNUM, HDTNUM, REQUESTER, LOAN, Baad, Good, UpdtCol) as
(VALUES

--(1, 0194764, 'Jordann Greene', 3367720, date('2025-06-09'), date('2025-06-03'), 'Closing Date'),
--(2, 0194764, 'Jordann Greene', 3367739, date('2025-06-09'), date('2025-06-04'), 'Closing Date'),
--(3, 0194764, 'Jordann Greene', 3368456, date('2025-06-16'), date('2025-06-13'), 'Closing Date')
)	
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
from MyVal UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'

order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;

-- SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                               CHRUSERID BLNPRIORITY NOTESTEP
-- ------ -------------------------- ------------ ------------------------ ---------------------------------------------------------- --------- ----------- --------
--      1 2025-07-16 14:56:31.104652    207788676                3367720.0 Per HDT 194764 Closing Date from 2025-06-09 to 2025-06-03. tkato               0        0
--      2 2025-07-16 14:56:31.104652    207788677                3367739.0 Per HDT 194764 Closing Date from 2025-06-09 to 2025-06-04. tkato               0        0
--      3 2025-07-16 14:56:31.104652    207788678                3368456.0 Per HDT 194764 Closing Date from 2025-06-16 to 2025-06-13. tkato               0        0

--------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
------ EOF 105 Adj
















