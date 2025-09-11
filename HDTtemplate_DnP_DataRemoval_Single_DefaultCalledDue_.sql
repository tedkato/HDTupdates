/*
select DAPAPPRAISALDATE, cast(DAPAPPRAISALDATE as varchar(30)), * from celink.tblDueAndPayable where DAPLOANNUMBER = 3018076 for read only with ur; 
select DAPAPPRAISALAMOUNT, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur;
select DAPAPPRAISALRECEIVEDDATE, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur; 
select DEMANDBREACHLETTERSENTDT, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur; 
select APPRAISALORDDT, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur; 
select DAPAPPRAISALTYPE, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur; 
	   select DAPAPPRAISALTYPE, * from celink.tblDueAndPayable where DAPAPPRAISALTYPE is null order by DAPLOANNUMBER desc limit 1000 for read only with ur;		
	   select DAPAPPRAISALTYPE, * from celink.tblDueAndPayable where DAPAPPRAISALTYPE = 0     order by DAPLOANNUMBER desc limit 1000 for read only with ur;		

select DPHERMITREQUEST, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur; 
select HUDAPPRDAP, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur; 
select DPELIGIBILITY, * from celink.tblDueAndPayable where DAPLOANNUMBER in (3018076) for read only with ur; 

select DPRECISSIONREQUEST, DPRECISSIONAPPROVE, * from celink.tblDueAndPayable where DAPLOANNUMBER in (1172051) for read only with ur; 
*/

/* note for the ticket ********************************************************************************************************************************************
--*--
Following data removed from D&P tab for 1 loan.  Pending verification
D&P Eligibility (2/3/2022) HUD Approved D&P (2/17/2022) Appraisal Ordered date (2/25/2022) D&P HERMIT Request (2/16/2022) Demand/Breach Letter Sent (2/23/2022) 
Reason Called Due (57) Date Called due (2/17/2022) Default type (51) Date of Default (7/25/2019)
--*--
1 loan updated as follows.  Pending verification.
D&P Eligibility, HERMIT Request, Rescission Request/Approval, HUD Approved D&P, Demand/Breach Letter Sent removed.
Date Called Due, Reason Called Due, Date Of Default, Default Type removed in (tblstatustracking).
--*--
1 loan updated. *HUD Approved D&P Dates updated,  Date Called Due updated in tblStatusTracking.
* note for the ticket ****************************************************************************************************************************************** */

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250904
[ID:0198618] D&P data 9/3/2025 3:52 PM Christopher Castaneda
1289077  remove D&P data
Celink Loan Number	Data field to be corrected	 Incorrect Value 	 Correct Value 
1289077	Reason Called Due	Called Due: Tax & Insurance		Remove data
		Date Called Due		5/5/2022						Remove data
1 loan updated. Peer review pending. *Called Due and default data removed in tblStatusTracking.
*/

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--StatusTracking

--tblStatusTracking single
select 
	statusloan, 
	DEFAULTDATE, DEFAULTType, 
	CALLEDDUEDATE, CALLEDDUETYPE, 
	* 
from celink.tblstatustracking  
where statusloan in ()
order by statusloan
;
-- STATUSLOAN DEFAULTDATE DEFAULTTYPE CALLEDDUEDATE CALLEDDUETYPE STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- ---------- ----------- ----------- ------------- ------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------

--tblStatusTracking
with p (SeqNum, HDT, Loan) as
(Values

(1, 0198618, 1289077)
)
select 
	statusloan, 
	DEFAULTDATE, DEFAULTType, 
	CALLEDDUEDATE, CALLEDDUETYPE, 
	FORECLOSUREDATE,
	FORECLOSURETYPE,
	T.* 
from P
inner join celink.tblstatustracking T
on P.loan = T.statusloan
order by P.seqnum
;

/*
-- -------- ----------- ----------- ************* ************* --------------- --------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
-- -------- *********** *********** ************* ************* --------------- --------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
-- STATUSLOAN DEFAULTDATE DEFAULTTYPE CALLEDDUEDATE CALLEDDUETYPE FORECLOSUREDATE FORECLOSURETYPE STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
--  1289077.0 2022-04-01           54 2022-05-05               57 2022-08-02                   13  1289077.0          54 2022-04-01             57 2022-05-05                 13 2022-08-02      NULL                              0 NULL                           0                0                0                       0.000000 NULL                   NULL                   NULL                                    0.000000                       0 NULL                            0.000000                      0.0                  0.0 2022-05-05               0 NULL
--after
-- STATUSLOAN DEFAULTDATE DEFAULTTYPE CALLEDDUEDATE CALLEDDUETYPE FORECLOSUREDATE FORECLOSURETYPE STATUSLOAN DEFAULTTYPE DEFAULTDATE CALLEDDUETYPE CALLEDDUEDATE FORECLOSURETYPE FORECLOSUREDATE FORECLOSURESALEDATE LIQUIDATIONTYPE LIQUIDATIONDATE EXT1DOCSRECEIVED EXT2DOCSRECEIVED DEMANDLETTERSENT DOCSSTILLNEEDED DEFAULTBALANCE INSPECTION5ORDEREDDATE INSPECTION6ORDEREDDATE REPAYMENTPLANLETTERSENTDATE MONTHLYPAYMENTAMOUNT REPAYMENTNUMBEROFMONTHS PAYMENTDUEDATE ACCUMULATEDTANDIREPAYMENT DEFAULTBALANCEADJUSTMENT BOARDEDDEFAULTAMOUNT LBREFERRALDATE MINIMIRANDA EXTENSION1APPROVEDDT
-- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
--  1289077.0 2022-04-01           54 NULL                      0 2022-08-02                   13  1289077.0          54 2022-04-01              0 NULL                       13 2022-08-02      NULL                              0 NULL                           0                0                0                       0.000000 NULL                   NULL                   NULL                                    0.000000                       0 NULL                            0.000000                      0.0                  0.0 2022-05-05               0 NULL
*/

--CAFI
SELECT
	CALCFLDS.CFIDATE AS "CafiDate", CALCFLDS.* 
from  CELINK.TBLCALCFIELDS AS CALCFLDS 
where CALCFLDS.CFIFIELDID in (103, 132) -- 103 Called Due Date , 132 Default date
and   CALCFLDS.CFILOANNUMBER =  1289077
FOR READ ONLY with ur;
-- CafiDate   CFILOANNUMBER CFIFIELDID CFIDATE    CFIDECIMAL    CFIBOOLEAN CREATIONDATE               CFIINT CFISTRING
-- ---------- ------------- ---------- ---------- ------------- ---------- -------------------------- ------ ---------
-- 2022-05-05     1289077.0        103 2022-05-05 349221.980000       NULL 2025-09-03 15:50:06.893949   NULL NULL
-- 2022-04-01     1289077.0        132 2022-04-01          NULL       NULL 2025-09-03 15:50:06.916132   NULL NULL


-- ---------- ----------- ----------- ------------- ------------- ---------- ----------- ----------- ------------- ------------- --------------- --------------- ------------------- --------------- --------------- ---------------- ---------------- ---------------- --------------- -------------- ---------------------- ---------------------- --------------------------- -------------------- ----------------------- -------------- ------------------------- ------------------------ -------------------- -------------- ----------- --------------------
-- trans
SELECT
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT,
	DTMEFFECTIVEDATE,	IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, 
	DTMTRANSACTIONCREATIONDATE, IDSUSERID     
from celink.TBLTRANSACTIONS TT
where TT.IDSTRANSACTIONCODE in (55,56,57,58,59,5501,5701,5702, 50,51,52,53,54,60,61,62,63)
and TT.INTSUBSERVICERLOANNUMBER = 3158260
ORDER BY INTSUBSERVICERLOANNUMBER, CHRLOANSTATUSREMARKS, IDSTRANSID desc 
with ur;
-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS        DTMTRANSACTIONCREATIONDATE IDSUSERID
-- ------------------------ ---------- ------------------- ---------------- ------------------ ------------- --------------------------- -------------------------- ----------
--                3158260.0   75215162                  76 2025-07-09                       55            55 Called Due: Death           2025-07-09                 CCO.VBhale
--                3158260.0   65105927                  50 2023-12-01                       57            57 Called Due: Tax & Insurance 2023-12-01                 CRodriguez
--                3158260.0   63897341                  46 2023-10-11                       62            62 Default: Insurance          2023-10-12                 jwilson

-- ------------- --------------- ---------- ------------------ ------------------ ------------- ------------------- -------------------- --------------------------- ------------------------- -------------------- --------------------------- --------------------------- --------------- ---------------- ---------------- ------------------ ----------------------------------------------------------------------------------------------------------- ------------------- ------------------- ------------- ------------------- ----------------- ---------------------- ------------------ ------------------ ------------------ ------------------ ------------------ --------------- ---------------------- ------------------------ ------------------ -------------- --------------------- --------------- ------------ ---------------- ----------- ----------------- ---------------------- --------------------- ------------------- ------------------ --------------------------- ------------------------ ---------------------- ------------------- ---------------- ------------- -------------- ------------------ ------------------ ------------------- ------------------ ---------------------- ------------------------ ---------- --------------- ------------- ---------------- --------------------- --------------------- ---------------- ---------------------- ------------------ ---------- ----------------------- ------------------- ---------------- ----------------------------- -------------------------
-- Note creation tblDueAndPayable
select 
	'(' || cast(X.statusloan as integer) || ', '
--	|| '''Per HDT ' || P.HDT || ' D&P Called Due data (2024-11-25, Type56) removed in tblStatusTracking.'
	|| '''Per HDT ' || P.HDT || ' D&P Default Date '|| X.DEFAULTDATE || ' Type ' || X.DEFAULTTYPE || ' Called due Date ' || X.CALLEDDUEDATE || ' Type ' || X.CALLEDDUETYPE || ' removed in tblStatusTracking'
--	|| '''Per HDT ' || P.HDT || ' D&P  Called due Date ' || X.CALLEDDUEDATE || ' Type ' || X.CALLEDDUETYPE || ' removed in tblStatusTracking'
	|| '.''' 
	|| ', ' 
	|| 'CURRENT_TIMESTAMP, '
	|| '''tkato'', 0, 0), '
as "Note Insert Value"
from
(VALUES 
(1, 0198618, 1289077)
) P (SeqNum, HDT, Loan)
inner join celink.tblstatustracking X
on P.Loan = X.statusloan 
order by SeqNum
for read only with ur; 

/*
 Note Insert Value
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------
 (1289077, 'Per HDT 198618 D&P Default Date 2022-04-01 Type 54 Called due Date 2022-05-05 Type 57 removed in tblStatusTracking.', CURRENT_TIMESTAMP, 'tkato', 0, 0), 

*/

/* UPDATEeeeeeeeeeeeeeeeeeeeeeeeee ***********************************************************************************************

UPDATE celink.tblstatustracking set CALLEDDUEDATE=NULL, CALLEDDUETYPE=0  where statusloan = 1289077;

-- -- UPDATE celink.tblstatustracking set DEFAULTDATE = NULL, DEFAULTTYPE = 0, CALLEDDUEDATE=NULL, CALLEDDUETYPE=0  where statusloan = ;

******************************* */

----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter

Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, step) as
(values
-- Note Insert Value
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------
 (1289077, 'Per HDT 198618 D&P Default Date 2022-04-01 Type 54 Called due Date 2022-05-05 Type 57 removed in tblStatusTracking.', CURRENT_TIMESTAMP, 'tkato', 0, 0) 

)
select * from P 
;

-- LOAN    NOTE                                                                                                                TIMES                      WHO   PRIO STEP
-- ------- ------------------------------------------------------------------------------------------------------------------- -------------------------- ----- ---- ----
-- 1289077 Per HDT 198618 D&P Default Date 2022-04-01 Type 54 Called due Date 2022-05-05 Type 57 removed in tblStatusTracking. 2025-09-04 12:49:07.905986 tkato    0    0

-----------------------------------------------------------------------------------------------------------
-- Notes validation
with p (SeqNum, HDT, Loan) as
(Values
(1, 0198618, 1289077)
)
select
	P.SeqNum, 
	a.DTMNOTEDATE,
	a.IDSLOANNOTES,
	a.INTSUBSERVICERLOANNUMBER,
	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
	from P
	inner join celink.tblloannotes a  
	on P.Loan = a.INTSUBSERVICERLOANNUMBER 
	and a.CHRLOANNOTES like 'Per HDT%' || P.HDT ||'%'
	order by P.SeqNum 
for read only with UR;
-- SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                   CHRUSERID BLNPRIORITY
-- ------ -------------------------- ------------ ------------------------ -------------------------------------------------------------------------------------------------------------------------------------------------------------- --------- -----------

--Notes validation
--select 
--	a.DTMNOTEDATE,
--	a.IDSLOANNOTES,
--	a.INTSUBSERVICERLOANNUMBER,
--	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY --,*
--	from celink.tblloannotes a  
--	where a.INTSUBSERVICERLOANNUMBER in (3154985) 
--	and   a.CHRLOANNOTES like '%Per HDT%153458%'
--	order by a.IDSLOANNOTES desc 
--for read only with UR;
---- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                                                                                                 CHRUSERID BLNPRIORITY
---- -------------------------- ------------ ------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------ --------- -----------

-- end


-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
-- reference ... CAFI, Trans 
-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
with p (SeqNum, HDT, Loan) as
(Values

(1, 195372, 1098321),
(2, 195372, 1163737),
(3, 195372, 1205088),
(4, 195372, 3117465)
)
select 
	P.SeqNum, P.Loan, 
	CALCFLDS.CFIDATE AS "CafiDate", CALCFLDS.* 
from P
inner join CELINK.TBLCALCFIELDS AS CALCFLDS
on  CALCFLDS.CFILOANNUMBER = P.Loan
and CALCFLDS.CFIFIELDID in (132, 103) -- 103 Called Due Date , 132 Default date
order by CREATIONDATE
FOR READ ONLY with ur;

-- SEQNUM LOAN    CafiDate   CFILOANNUMBER CFIFIELDID CFIDATE    CFIDECIMAL    CFIBOOLEAN CREATIONDATE               CFIINT CFISTRING
-- ------ ------- ---------- ------------- ---------- ---------- ------------- ---------- -------------------------- ------ ---------
--      1 1098321 2016-12-01     1098321.0        103 2016-12-01 213516.620000       NULL 2025-07-23 15:21:06.61386    NULL NULL
--      1 1098321 2016-11-02     1098321.0        132 2016-11-02          NULL       NULL 2025-07-23 15:21:06.639931   NULL NULL
--      2 1163737 2016-09-22     1163737.0        103 2016-09-22 142464.350000       NULL 2025-07-23 15:23:06.071301   NULL NULL
--      2 1163737 2016-07-19     1163737.0        132 2016-07-19          NULL       NULL 2025-07-23 15:23:06.09008    NULL NULL
--      3 1205088 2022-02-10     1205088.0        103 2022-02-10 186018.420000       NULL 2025-07-23 15:23:08.305099   NULL NULL
--      3 1205088 2019-07-15     1205088.0        132 2019-07-15          NULL       NULL 2025-07-23 15:23:08.32142    NULL NULL
--      4 3117465 2023-05-25     3117465.0        103 2023-05-25 116156.930000       NULL 2025-07-23 15:24:07.28729    NULL NULL
--      4 3117465 2022-10-28     3117465.0        132 2022-10-28          NULL       NULL 2025-07-23 15:24:07.3078     NULL NULL

--CALCFLDS
select 
	CALCFLDS.CFIDATE AS "CafiDate", CALCFLDS.* 
	from CELINK.TBLCALCFIELDS AS CALCFLDS 
	where CALCFLDS.CFIFIELDID in (132) -- 103 Called Due Date , 132 Default date
	and   CALCFLDS.CFILOANNUMBER in (3127455, 1111334)
	order by CREATIONDATE
FOR READ ONLY with ur;


-- ------ ---- -------- ------------- ---------- ------- ---------- ---------- ------------ ------ ---------
--Transactions
with p (SeqNum, HDT, Loan) as
(Values

(1, 188411, 3186266)
)
select 
	--P.SeqNum
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, DTMEFFECTIVEDATE, IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, * 
from P
inner join celink.TBLTRANSACTIONS
on P.Loan = intsubservicerloannumber
--	and IDSTRANSID =  
order by P.SeqNum, IDSTRANSACTIONCOUNT desc --DTMEFFECTIVEDATE desc 
for read only with ur;

--                3186266.0   66788308                 114 2024-03-21                        1            56 Called Due: Non-Occupancy                      1 188411 3186266   66788308                 114                  1 CA6812             6800             6800            56                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         MDehoyos     2024-03-21                 2024-03-21       2020-12-23     2020-12-17     2021-12-01               0.000000           35886.490000                 5978.960000                  0.000000            3199.930000                  0.000000               0.000000          0.000000              1455.140000                    169.320000                    0.200000                10.820000                    0.010000            0.000000             0.000000        0.000000    29407.600000 37341.630000  70470.000000 86269.090000     41062.400000 48927.460000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50382.600000 48927.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0803              0.0406    0.048    0.0323                0               -1 Called Due: Non-Occupancy                   0.000000      NULL NULL        NULL                      0.0
--**              3186266.0   66788307                 113 2024-03-21                       56            56 Called Due: Non-Occupancy                      1 188411 3186266   66788307                 113                 56 CA6812             6800             6800            56                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         MDehoyos     2024-03-21                 2024-03-21       2020-12-23     2020-12-17     2021-12-01               0.000000           35886.490000                 5978.960000                  0.000000            3199.930000                  0.000000               0.000000          0.000000              1455.140000                    169.320000                    0.200000                10.820000                    0.010000            0.000000             0.000000        0.000000    29407.600000 37341.630000  70470.000000 86269.090000     41062.400000 48927.460000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50382.600000 48927.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0803              0.0406    0.048    0.0323                0                0 Called Due: Non-Occupancy                   0.000000      NULL NULL        NULL                      0.0
--**              3186266.0   66777601                 112 2024-03-02                       50            50 Default: Non-Occupancy                         1 188411 3186266   66777601                 112                 50 CA6812             6800             6800            50                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         APerez       2024-03-18                 2024-03-02       2020-12-23     2020-12-17     2021-12-01               0.000000           35886.490000                 5978.960000                  0.000000            3199.930000                  0.000000               0.000000          0.000000              1455.140000                    169.320000                    0.200000                10.820000                    0.010000            0.000000             0.000000        0.000000    29407.600000 37341.630000  70470.000000 86269.090000     41062.400000 48927.460000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50382.600000 48927.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0803              0.0406    0.048    0.0323                0                0 Default: Non-Occupancy                      0.000000      NULL NULL        NULL                      0.0
--                3186266.0   66731388                 111 2024-03-01                       92            54 Default: Unreturned Occupancy Certificate      1 188411 3186266   66731388                 111                 92 CA6812             6800             6800            54                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         Batch        2024-03-01                 2024-03-01       2020-12-23     2020-12-17     2021-12-01              30.000000           35886.490000                 5978.960000                  0.000000            3199.930000                  0.000000               0.200000          0.010000              1455.140000                    169.320000                    0.200000                10.820000                    0.010000            0.000000             0.000000        0.000000    29407.600000 37341.630000  70470.000000 86269.090000     41062.400000 48927.460000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50382.600000 48927.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0803              0.0406    0.048    0.0323                0                0 Default: Unreturned Occupancy Certificate   0.000000      NULL NULL        NULL                     0.01
--                3186266.0   66634583                 110 2024-03-01                      103            54 Default: Unreturned Occupancy Certificate      1 188411 3186266   66634583                 110                103 CA6812             6800             6800            54                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         BATCH        2024-02-29                 2024-03-01       2020-12-23     2020-12-17     2021-12-01               0.000000           35886.490000                 5978.960000                  0.000000            3199.930000                  0.000000               0.000000          0.000000              1425.140000                    169.320000                    0.000000                10.820000                    0.000000            0.000000             0.000000        0.000000    29407.600000 37311.630000  70470.000000 86269.090000     41062.400000 48957.460000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50382.600000 48957.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0803              0.0406    0.048    0.0323                0                0 Default: Unreturned Occupancy Certificate   0.000000      NULL NULL        NULL                      0.0
--                3186266.0   66489580                 109 2024-02-29                      101            54 Default: Unreturned Occupancy Certificate      1 188411 3186266   66489580                 109                101 CA6812             6800             6800            54                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         BATCH        2024-02-29                 2024-02-29       2020-12-23     2020-12-17     2021-12-01             265.230000           35886.490000                 5978.960000                  0.000000            3199.930000                  0.000000             250.370000         15.440000              1425.140000                    169.320000                    0.000000                10.820000                    0.000000            0.000000             0.000000        0.000000    29407.600000 37311.630000  70470.000000 86269.090000     41062.400000 48957.460000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50382.600000 48957.460000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0811              0.0406   0.0488    0.0323                0                0 Default: Unreturned Occupancy Certificate   0.000000      NULL NULL        NULL                     9.26
--                3186266.0   66299000                 108 2024-02-29                      105            54 Default: Unreturned Occupancy Certificate      1 188411 3186266   66299000                 108                105 CA6812             6800             6800            54                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         cking        2024-02-29                 2024-02-29       2020-12-23     2020-12-17     2021-12-01               0.000000           35631.410000                 5738.150000                  0.000000            3185.660000                 -0.580000               0.000000         -0.580000              1414.990000                    159.760000                    0.000000                10.230000                    0.000000            0.000000             0.000000        0.000000    29407.600000 37046.400000  70470.000000 85654.520000     41062.400000 48608.120000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50023.110000 48608.120000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0811              0.0406   0.0488    0.0323                0                0 Default: Unreturned Occupancy Certificate   0.000000      NULL NULL        NULL                      0.0
--                3186266.0   66210837                 107 2024-02-01                       54            54 Default: Unreturned Occupancy Certificate      1 188411 3186266   66210837                 107                 54 CA6812             6800             6800            54                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         brsteiner    2024-02-01                 2024-02-01       2020-12-23     2020-12-17     2021-12-01               0.000000           35631.410000                 5738.150000                  0.000000            3185.660000                  0.000000               0.000000          0.000000              1414.990000                    159.760000                    0.000000                10.230000                    0.000000            0.000000             0.000000        0.000000    29407.600000 37046.400000  70470.000000 85654.520000     41062.400000 48608.120000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50023.110000 48608.120000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0811              0.0406   0.0488    0.0323                0                0 Default: Unreturned Occupancy Certificate   0.000000      NULL NULL        NULL                      0.0
--                3186266.0   66119177                 106 2024-02-01                      103             0 Active                                         1 188411 3186266   66119177                 106                103 CA6812             6800             6800             0                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         BATCH        2024-01-31                 2024-02-01       2020-12-23     2020-12-17     2021-12-01               0.000000           35631.410000                 5738.150000                  0.000000            3185.660000                  0.000000               0.000000          0.000000              1414.990000                    159.760000                    0.000000                10.230000                    0.000000            0.000000             0.000000        0.000000    29407.600000 37046.400000  70470.000000 85654.520000     41062.400000 48608.120000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50023.110000 48608.120000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0811              0.0406   0.0488    0.0323                0                0 Active                                      0.000000      NULL NULL        NULL                      0.0
--                3186266.0   65955004                 105 2024-01-31                      101             0 Active                                         1 188411 3186266   65955004                 105                101 CA6812             6800             6800             0                3186266.0              0.0 002216289090     HECM        Line of Credit ARM 861         BATCH        2024-01-31                 2024-01-31       2020-12-23     2020-12-17     2021-12-01             274.920000           35631.410000                 5738.150000                  0.000000            3185.660000                  0.000000             260.160000         15.330000              1414.990000                    159.760000                    0.000000                10.230000                    0.000000            0.000000             0.000000        0.000000    29407.600000 37046.400000  70470.000000 85654.520000     41062.400000 48608.120000     135000.000000         135000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      41062.400000  50023.110000 48608.120000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0333            0.0849              0.0406   0.0526    0.0323                0                0 Active                                      0.000000      NULL NULL        NULL                     9.19

--Transactions
select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, DTMEFFECTIVEDATE, IDSTRANSACTIONCODE, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, * 
	from celink.TBLTRANSACTIONS 
	where intsubservicerloannumber = 1378743 --1258846
--	and IDSTRANSID =  
	order by DTMEFFECTIVEDATE desc 
for read only with ur;

-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS                      IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID  DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS                      CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ---------------- ------------------ ------------- ----------------------------------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ---------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- ----------------------------------------- ----------- --------- ------- -------- ------------------------

--                1258846.0   49080208                 145 2021-08-23                       95            13 Refer for FCL: Tax & Insurance              49080208                 145                 95 AH1288             3400             3400            13                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         Batch         2021-08-23                 2021-08-23       2016-07-13     2016-07-07     2999-01-01             625.000000          178527.440000                36430.820000                  0.000000           10437.410000                  0.000000               0.450000          0.170000            130873.350000                  20319.250000                    0.480000              1669.560000                    0.180000        -5068.200000            21.430000        5.080000   132362.400000 309400.790000 220604.000000 298099.500000     88241.600000 -11301.290000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 119572.060000 -11301.290000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.03249               0.046  0.00249      0.03                0               -1 Refer for FCL: Tax & Insurance               0.000000      NULL NULL        NULL                     0.04
--                1258846.0   49045061                 144 2021-08-13                       92            13 Refer for FCL: Tax & Insurance              49045061                 144                 92 AH1288             3400             3400            13                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         Batch         2021-08-13                 2021-08-13       2016-07-13     2016-07-07     2999-01-01              20.000000          178527.440000                36430.820000                  0.000000           10437.410000                  0.000000               0.030000          0.010000            130248.350000                  20319.250000                    0.030000              1669.560000                    0.010000        -5068.200000            21.430000        5.080000   132362.400000 308775.790000 220604.000000 298099.500000     88241.600000 -10676.290000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 119572.060000 -10676.290000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.03249               0.046  0.00249      0.03                0               -1 Refer for FCL: Tax & Insurance               0.000000      NULL NULL        NULL                      0.0
--                1258846.0   49015617                 143 2021-08-04                       13            13 Refer for FCL: Tax & Insurance              49015617                 143                 13 AH1288             3400             3400            13                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         CCO.RSonik    2021-08-04                 2021-08-04       2016-07-13     2016-07-07     2999-01-01               0.000000          178527.440000                36430.820000                  0.000000           10437.410000                  0.000000               0.000000          0.000000            130228.350000                  20319.250000                    0.000000              1669.560000                    0.000000        -5068.200000            21.430000        5.080000   132362.400000 308755.790000 220604.000000 298099.500000     88241.600000 -10656.290000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 119572.060000 -10656.290000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.03249               0.046  0.00249      0.03                0               -1 Refer for FCL: Tax & Insurance               0.000000      NULL NULL        NULL                      0.0
--                1258846.0   48872081                 142 2021-08-01                      103            57 Called Due: Tax & Insurance                 48872081                 142                103 AH1288             3400             3400            57                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         BATCH         2021-07-30                 2021-08-01       2016-07-13     2016-07-07     2999-01-01               0.000000          178527.440000                36430.820000                  0.000000           10437.410000                  0.000000               0.000000          0.000000            130228.350000                  20319.250000                    0.000000              1669.560000                    0.000000        -5068.200000            21.430000        5.080000   132362.400000 308755.790000 220604.000000 298099.500000     88241.600000 -10656.290000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 119572.060000 -10656.290000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.03249               0.046  0.00249      0.03                0               -1 Called Due: Tax & Insurance                  0.000000      NULL NULL        NULL                      0.0
--                1258846.0   48589528                 141 2021-07-31                      101            57 Called Due: Tax & Insurance                 48589528                 141                101 AH1288             3400             3400            57                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         BATCH         2021-07-30                 2021-07-31       2016-07-13     2016-07-07     2999-01-01            1231.570000          178527.440000                36430.820000                  0.000000           10437.410000                  0.000000             905.870000        317.540000            130228.350000                  20319.250000                    0.000000              1669.560000                    0.000000        -5068.200000            21.430000        5.080000   132362.400000 308755.790000 220604.000000 298099.500000     88241.600000 -10656.290000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 119572.060000 -10656.290000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.03566               0.046  0.00566      0.03                0               -1 Called Due: Tax & Insurance                  0.000000      NULL NULL        NULL                    76.21
--                1258846.0   48454077                 140 2021-07-08                       90            57 Called Due: Tax & Insurance                 48454077                 140                 90 AH1288             3400             3400            57                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         Batch         2021-07-08                 2021-07-08       2016-07-13     2016-07-07     2999-01-01            2687.050000          177813.820000                35902.420000                  0.000000           10252.190000                  0.000000               6.040000          2.120000            129710.400000                  19935.740000                    6.040000              1535.120000                    2.120000        -5068.200000            21.430000        5.080000   132362.400000 307524.220000 220604.000000 296907.910000     88241.600000 -10616.310000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 119094.090000 -10616.310000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.03566               0.046  0.00566      0.03                0               -1 Called Due: Tax & Insurance                  0.000000      NULL NULL        NULL                     0.51
--
--                1258846.0   39565149                 103 2020-04-30                      101            57 Called Due: Tax & Insurance                 39565149                 103                101 AH1288             3400             3400            57                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         BATCH         2020-04-30                 2020-04-30       2016-07-13     2016-07-07     2999-01-01            1512.820000          167444.470000                28048.350000                  0.000000            7912.910000                  0.000000            1218.600000        294.180000            116499.880000                  14387.010000                    0.000000              1810.670000                    0.000000        -2837.200000             5.610000        1.260000   132362.400000 283944.350000 220604.000000 279593.450000     88241.600000  -4350.900000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 112148.980000  -4350.900000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.05178               0.046  0.02178      0.03                0               -1 Called Due: Tax & Insurance                  0.000000      NULL NULL        NULL                     70.6
--                1258846.0   39235741                 102 2020-04-20                       92            57 Called Due: Tax & Insurance                 39235741                 102                 92 AH1288             3400             3400            57                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         Batch         2020-04-20                 2020-04-20       2016-07-13     2016-07-07     2999-01-01              20.000000          166552.310000                27329.680000                  0.000000            7739.420000                  0.000000               0.030000          0.010000            115879.220000                  13887.050000                    0.030000              1689.970000                    0.010000        -2837.200000             5.610000        1.260000   132362.400000 282431.530000 220604.000000 278103.740000     88241.600000  -4327.790000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 111551.430000  -4327.790000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.05178               0.046  0.02178      0.03                0               -1 Called Due: Tax & Insurance                  0.000000      NULL NULL        NULL                      0.0
--***             1258846.0   39173617                 101 2020-04-01                       57            57 Called Due: Tax & Insurance                 39173617                 101                 57 AH1288             3400             3400            57                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         CRodriguez    2020-04-01                 2020-04-01       2016-07-13     2016-07-07     2999-01-01               0.000000          166552.310000                27329.680000                  0.000000            7739.420000                  0.000000               0.000000          0.000000            115859.220000                  13887.050000                    0.000000              1689.970000                    0.000000        -2837.200000             5.610000        1.260000   132362.400000 282411.530000 220604.000000 278103.740000     88241.600000  -4307.790000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 111551.430000  -4307.790000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.05178               0.046  0.02178      0.03                0               -1 Called Due: Tax & Insurance                  0.000000      NULL NULL        NULL                      0.0
--                1258846.0   38960799                 100 2020-03-31                      101            51 Default: Tax & Insurance                    38960799                 100                101 AH1288             3400             3400            51                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         BATCH         2020-03-31                 2020-03-31       2016-07-13     2016-07-07     2999-01-01            1503.780000          166552.310000                27329.680000                  0.000000            7739.420000                  0.000000            1202.490000        290.290000            115859.220000                  13887.050000                    0.000000              1689.970000                    0.000000        -2837.200000             5.610000        1.260000   132362.400000 282411.530000 220604.000000 278103.740000     88241.600000  -4307.790000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 111551.430000  -4307.790000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.05178               0.046  0.02178      0.03                0               -1 Default: Tax & Insurance                     0.000000      NULL NULL        NULL                    69.67
--                1258846.0   38559169                  99 2020-03-04                       51            51 Default: Tax & Insurance                    38559169                  99                 51 AH1288             3400             3400            51                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         ZAhmed        2020-03-04                 2020-03-04       2016-07-13     2016-07-07     2999-01-01               0.000000          165664.900000                26614.840000                  0.000000            7566.850000                  0.000000               0.000000          0.000000            115242.850000                  13390.540000                    8.860000              1570.110000                    2.140000        -2837.200000             5.610000        1.260000   132362.400000 280907.750000 220604.000000 276621.970000     88241.600000  -4285.780000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 110957.070000  -4285.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.05178               0.046  0.02178      0.03                0               -1 Default: Tax & Insurance                     0.000000      NULL NULL        NULL                      0.0
--                1258846.0   38545865                  98 2020-03-03                       91            61 Default: Taxes                              38545865                  98                 91 AH1288             3400             3400            61                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         Batch         2020-03-03                 2020-03-03       2016-07-13     2016-07-07     2999-01-01            2231.000000          165664.900000                26614.840000                  0.000000            7566.850000                  0.000000               8.860000          2.140000            115242.850000                  13390.540000                    8.860000              1570.110000                    2.140000        -2837.200000             5.610000        1.260000   132362.400000 280907.750000 220604.000000 276621.970000     88241.600000  -4285.780000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 110957.070000  -4285.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.05178               0.046  0.02178      0.03                0               -1 Default: Taxes                               0.000000      NULL NULL        NULL                     0.51
--                1258846.0   38309306                  97 2020-02-29                      101            61 Default: Taxes                              38309306                  97                101 AH1288             3400             3400            61                1258846.0              0.0 003326334290     HECM        Line of Credit ARM 860         BATCH         2020-02-28                 2020-02-29       2016-07-13     2016-07-07     2999-01-01            1484.830000          165664.900000                26614.840000                  0.000000            7566.850000                  0.000000            1196.090000        288.740000            113011.850000                  13390.540000                    0.000000              1570.110000                    0.000000        -2837.200000             5.610000        1.260000   132362.400000 278676.750000 220604.000000 276621.970000     88241.600000  -2054.780000     421000.000000         421000.000000                  0.000000              0.000000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000      88241.600000 110957.070000  -2054.780000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0         0.04235           0.05178               0.046  0.02178      0.03                0               -1 Default: Taxes                               0.000000      NULL NULL        NULL                     69.3



-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE IDSSTATUSCODE CHRLOANSTATUSREMARKS                      IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID  DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL     CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC    CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS                      CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ---------------- ------------------ ------------- ----------------------------------------- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ---------- -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------ ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------ -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- ----------------- ------------------- -------- --------- ---------------- ---------------- ----------------------------------------- ----------- --------- ------- -------- ------------------------

--                1378743.0   25839553                   2 2016-06-30                       13            13 Refer for FCL: Tax & Insurance   25839553                   2                 13 RMF_FNMA_F     316800009        316800009            13                1378743.0    6.000405225E9 000945327799     HECM        Line of Credit ARM 857         cking        2018-09-05                 2016-06-30       2008-04-29     2008-04-24     2018-09-01               0.000000          240513.200000                42666.970000                785.680000           10122.730000                100.210000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   167193.690000 240513.200000 172264.000000 225726.370000    167193.690000 -18817.710000     244000.000000         244000.000000               5070.310000           4030.880000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -18817.710000 -18817.710000      30.000000           3750.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0317            0.0392              0.0517   0.0242     0.015                0                0 Refer for FCL: Tax & Insurance    0.000000      NULL NULL        NULL                      0.0
--                1378743.0   25843111                   4 2016-06-30                       13            13 Refer for FCL: Tax & Insurance   25843111                   4                 13 RMF_FNMA_F     316800009        316800009            13                1378743.0    6.000405225E9 000945327799     HECM        Line of Credit ARM 857         cking        2018-09-05                 2016-06-30       2008-04-29     2008-04-24     2018-09-01               0.000000          240513.200000                42666.970000                785.680000           10122.730000                100.210000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   167193.690000 240513.200000 172264.000000 225726.370000    167193.690000 -18817.710000     244000.000000         244000.000000               5070.310000           4030.880000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -18817.710000 -18817.710000      30.000000           3750.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0317            0.0392              0.0517   0.0242     0.015                0                0 Refer for FCL: Tax & Insurance    0.000000      NULL NULL        NULL                      0.0
--****            1378743.0   25841193                   3 2016-02-09                       57            57 Called Due: Tax & Insurance      25841193                   3                 57 RMF_FNMA_F     316800009        316800009            57                1378743.0    6.000405225E9 000945327799     HECM        Line of Credit ARM 857         cking        2018-09-05                 2016-02-09       2008-04-29     2008-04-24     2018-09-01               0.000000          240513.200000                42666.970000                785.680000           10122.730000                100.210000               0.000000          0.000000                 0.000000                      0.000000                    0.000000                 0.000000                    0.000000            0.000000             0.000000        0.000000   167193.690000 240513.200000 172264.000000 225726.370000    167193.690000 -18817.710000     244000.000000         244000.000000               5070.310000           4030.880000               0.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000 -18817.710000 -18817.710000      30.000000           3750.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000 NULL                            0                 0          0.0317            0.0392              0.0517   0.0242     0.015                0                0 Called Due: Tax & Insurance       0.000000      NULL NULL        NULL                      0.0

 ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
-- not for this 
-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----
-- ------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -------------------------- ----- ---- ----

--with P ( SeqNum, HDTNum, Requester, Loan) as
--(values
--(1, 135540, 'Christopher Castaneda', 1140869)
--)
--select 
--	SeqNum, HDTNum, Requester, Loan, 
--	
--	a.DAPLOANNUMBER ,
--	a.DPELIGIBILITY            "D&P Eligibility", 
--	a.HUDAPPRDAP               "HUD Approved D&P", 
--	a.APPRAISALORDDT           "Appraisal Ordered date", 
--	a.DPHERMITREQUEST          "D&P HERMIT Request", 
--	a.DEMANDBREACHLETTERSENTDT "Demand Breach Letter Sent",
--	  
--	b.statusloan,
--	b.DEFAULTDATE, 
--	b.DEFAULTTYPE, 
--	b.CALLEDDUEDATE,
--	b.CALLEDDUETYPE
--	
--from  P
--inner join celink.tblDueAndPayable a
--on 	  a.DAPLOANNUMBER = P.loan
--inner join celink.tblstatustracking b
--on 	  b.statusloan = P.loan
--where DAPLOANNUMBER in (1140869) for read only with ur; 

/* *****
-- ------------- --------------- ---------- ------------------ ------------------ ------------- ------------------- -------------------- --------------------------- ------------------------- -------------------- --------------------------- --------------------------- --------------- ---------------- ---------------- ------------------ ----------------------------------------------------------------------------------------------------------- ------------------- ------------------- ------------- ------------------- ----------------- ---------------------- ------------------ ------------------ ------------------ ------------------ ------------------ --------------- ---------------------- ------------------------ ------------------ -------------- --------------------- --------------- ------------ ---------------- ----------- ----------------- ---------------------- --------------------- ------------------- ------------------ --------------------------- ------------------------ ---------------------- ------------------- ---------------- ------------- -------------- ------------------ ------------------ ------------------- ------------------ ---------------------- ------------------------ ---------- --------------- ------------- ---------------- --------------------- --------------------- ---------------- ---------------------- ------------------ ---------- ----------------------- ------------------- ---------------- ----------------------------- -------------------------
-----** --Notes ... Export Before UPdate !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
select	
--	SeqNum, HDTNum, Requester, loan, 
--	GoodDate, 
--	TT.DPHERMITREQUEST
--	,
--	'--Note->', 
	1 as "SeqNum",	
	TT.DAPLOANNUMBER as "Loan Number",
	'N'  as "Priority (Y/N)", 
	''   as "Note Step Number",
	''   as "Step Date Completed (YYYY-MM-DD)", 
'Per HDT 130141 (Abraham Perez) D&P HERMIT Request updated from 6/5/2019 to <blank> Rescission Request from 4/10/2023 to <blank> Rescission Approval from 4/17/2023 to <blank> HUD Approved D&P from 6/5/2019 to <blank> (tblDueAndPayable). Date Of Default from 05/12/2019 to <blank> Date Called Due from 6/5/2019  to <blank> Reason Called Due from 56 to <blank> (tblstatustracking).'
 

from celink.tblDueAndPayable TT 
inner join celink.tblstatustracking SS
on TT.DAPLOANNUMBER = SS.statusloan
where TT.DAPLOANNUMBER = 1203209
for read only with ur
;
***** */







