
/*
20231220 ... HDtemplate_TX8HtoX8L_RowNum_TableWith_.sql
...Table version 
...Transaction code change from Highx80s to Lowx80s intending to cover any high 80's to any low 80's like 86 to 81, 285 to 281, 288 to 281 etc.
*/

---------------------------------------------------------
/* MyVal from source data samples 
(SeqNum, Loan, Amount, TransDate, NewCode, HDT, Requester)
NewCode at C .. ="(" & K2 & ", " & A2 & ", " & TEXT(ROUND(B2,2), "0.00")  & ", date('" & TEXT(D2, "YYYY-MM-DD") & "'), " & C2 & ", 0151970, 'Jeanne Porter'),"
NewCode at D .. ="(" & K2 & ", " & A2 & ", " & TEXT(ROUND(B2,2), "0.00")  & ", date('" & TEXT(C2, "YYYY-MM-DD") & "'), " & D2 & ", 0151970, 'Natasha Kuykendoll'),"

(1, 3126561, -388.87, date('2023-12-20'), 81, 0151970, 'Natasha Kuykendoll'),

1 transaction updated.  Peer review pending.
25 transactions updated.  Peer review pending.
50 transactions updated (43 loans).  Peer review pending. *Loan 1412580 iao -105.47 8/8/2024 already changed to 81 (Ticket 169873)
*/

-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------

/*
20250910
199086	Ted Kato	Transaction Code Change	Michael Wendel		Low	9/10/2025 10:10
199072	Ted Kato	Transaction Code Change	Fabrizio Albinati		Low	9/10/2025 7:24

="(" & K2+1000 & ", " & A2 & ", " & TEXT(ROUND(C2,2), "0.00")  & ", date('" & TEXT(B2, "YYYY-MM-DD") & "'), " & E2 & ", 199086, 'Michael Wendel'),"
="(" & K2+2000 & ", " & A2 & ", " & TEXT(ROUND(C2,2), "0.00")  & ", date('" & TEXT(B2, "YYYY-MM-DD") & "'), " & E2 & ", 199072, 'Fabrizio Albinati'),"

(1001, 1211001, -623.61, date('2025-09-10'), 81, 199086, 'Michael Wendel'),
(2001, 1324271, -2196.48, date('2025-09-10'), 81, 199072, 'Fabrizio Albinati')
*/

---------------------------------------------------------
---------------------------------------------------------

-- Reverse trans mapping
-- DBLREVERSELOANNUMBER      DOUBLE        8     0 TBLREVERSETRANSMAP 
select * from celink.TBLREVERSETRANSMAP where DBLREVERSELOANNUMBER = 3016325 for read only with ur;
-- DBLREVERSELOANNUMBER INTTRANSCOUNTORIGINAL INTTRANSCOUNTREVERSED
-- -------------------- --------------------- ---------------------
--            3016325.0                   241                   242


---------------------------------------------------------
--Transactions check
select 
	INTSUBSERVICERLOANNUMBER, IDSTRANSID, IDSTRANSACTIONCOUNT, DTMEFFECTIVEDATE, IDSTRANSACTIONCODE,  CURTRANSACTIONAMT, IDSSTATUSCODE, CHRLOANSTATUSREMARKS, '-->' , * 
	from celink.TBLTRANSACTIONS 
	where intsubservicerloannumber = 295931
--	and IDSTRANSID =  
--	and IDSTRANSACTIONCODE = 85
	order by IDSTRANSACTIONCOUNT desc 
for read only with ur;
-- INTSUBSERVICERLOANNUMBER IDSTRANSID IDSTRANSACTIONCOUNT DTMEFFECTIVEDATE IDSTRANSACTIONCODE CURTRANSACTIONAMT IDSSTATUSCODE CHRLOANSTATUSREMARKS      9   IDSTRANSID IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE IDSPOOLID IDSSERVICERID IDSSUBSERVICERID IDSSTATUSCODE INTSUBSERVICERLOANNUMBER INTFMALOANNUMBER INTFHACASENUMBER CHRLOANTYPE CHRPAYTYPE     CHRINTERESTTYPE IDSUSERID    DTMTRANSACTIONCREATIONDATE DTMEFFECTIVEDATE DTMFUNDINGDATE DTMCLOSINGDATE DTMPURCHASEDATE CURTRANSACTIONAMT CURSCHEDULEDPAYMENTUPB CURSCHEDULEDPAYMENTINTEREST CURSCHEDULEDPAYINTACCRUED CURSCHEDULEDPAYMENTMIP CURSCHEDULEDPAYMIPACCRUED CURTRANSACTIONINTEREST CURTRANSACTIONMIP CURUNSCHEDULEDPAYMENTUPB CURUNSCHEDULEDPAYMENTINTEREST CURUNSCHEDULEDPAYINTACCRUED CURUNSCHEDULEDPAYMENTMIP CURUNSCHEDULEDPAYMIPACCRUED CURREPAYMENTBALANCE CURREPAYMENTINTEREST CURREPAYMENTMIP CURORIGTOTALUBP CURTOTALUPB   CURORIGINALPL CURCURRENTPL  CURORIGINALNETPL CURNETPL      CURMAXCLAIMAMOUNT CURPROPAPPRAISEDVALUE CURORIGSERVICEFEESETASIDE CURSERVICEFEESETASIDE CURORIGREPAIRSSETASIDE CURREPAIRSSETASIDE CURORGFRSTYRPROPCHARGESETASIDE CURFIRSTYRPROPCHARGESETASIDE CURORIGTAXINSURSETASIDE CURTAXINSURSETASIDE CURORIGLOCRESERVE CURLOCRESERVE CURNETLOC     CURSERVICEFEES CURACCRUEDSERVICEFEES CURPLANCHANGESERVICEFEES CURACCRUEDPLANCHANGEFEES CUR1098INTEREST CURMNTHLYPAYMENTS CURMNTHLYWITHHOLD CHRPLANCHANGEREASON INTTERMMONTHS INTTERMMONTHSLEFT INTBEGININTRATE INTCURRENTINTRATE    INTEXPECTAVGINTRATE INTINDEX INTMARGIN BLNINTERESTROUND BLNLOANSUSPENDED CHRLOANSTATUSREMARKS      CUR1098MIP  INTVENDOR CHRMEMO INTPAYTO CURTRANSACTIONSERVICEFEE
-- ------------------------ ---------- ------------------- ---------------- ------------------ ----------------- ------------- ------------------------- --- ---------- ------------------- ------------------ --------- ------------- ---------------- ------------- ------------------------ ---------------- ---------------- ----------- -------------- --------------- ------------ -------------------------- ---------------- -------------- -------------- --------------- ----------------- ---------------------- --------------------------- ------------------------- ---------------------- ------------------------- ---------------------- ----------------- ------------------------ ----------------------------- --------------------------- ------------------------ --------------------------- ------------------- -------------------- --------------- --------------- ------------- ------------- ------------- ---------------- ------------- ----------------- --------------------- ------------------------- --------------------- ---------------------- ------------------ ------------------------------ ---------------------------- ----------------------- ------------------- ----------------- ------------- ------------- -------------- --------------------- ------------------------ ------------------------ --------------- ----------------- ----------------- ------------------- ------------- ----------------- --------------- -------------------- ------------------- -------- --------- ---------------- ---------------- ------------------------- ----------- --------- ------- -------- ------------------------
--                 295931.0   76213342                 583 2025-09-05                       85       -132.570000            71 Liquidated/3rd Party Sale -->   76213342                 583                 85 47            249240001        234790013            71                 295931.0     6.00004408E9 004313407982     HECM        Line of Credit ARM 857         F.albinati   2025-09-05                 2025-09-05       2000-02-07     2000-02-07     2000-03-06            -132.570000          146833.500000                    0.000000                  0.000000               0.000000                  0.000000               0.000000          0.000000           -164963.240000                      0.000000                    0.000000                 0.000000                    0.000000       193974.520000             2.220000        0.400000    48833.050000 -18129.740000  56350.000000 146526.620000      1275.000000 -33367.220000     115000.000000         115000.000000               3941.950000              0.000000            1275.000000           0.000000                       0.000000                     0.000000                0.000000            0.000000          0.000000  -1472.660000 -33367.220000       0.000000              0.000000                 0.000000                 0.000000        0.000000          0.000000          0.000000                                 0                 0          0.0737               0.0528              0.0788   0.0408     0.012                0               -1 Liquidated/3rd Party Sale    0.000000      NULL NULL        NULL                      0.0

-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
-- begin process
-------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------
/*	DATAUPDT table already created
create table DATAUPDT.TransCodeX8HtoX8L
	(
	RowNum integer,  
	SeqNum integer,
	LOAN   Double, 
	AMOUNT DECIMAL(16,6), 
	TRANSDATE DATE, 
	TRANSID   integer,
	OldCode	  integer,	
	NewCode   integer,
	HDTNum    integer,
	Requester varchar(50) default NULL 
	) COMPRESS YES ADAPTIVE IN DATAUPDT_TS16
;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE DATAUPDT.TransCodeX8HtoX8L TO group db2_ast
;
	-- drop table DATAUPDT.TransCodeX8HtoX8L;
	-- select * from DATAUPDT.TransCodeX8HtoX8L;
*/

-- source data .. DATAUpdt table already created
select * from dataupdt.TransCodeX8HtoX8L for read only with ur; 


---------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.TransCodeX8HtoX8L;

---------------------------------------------------------
-- Check before insert
with W (SeqNum, Loan, Amount, TransDate, NewCode, HDTNum, Requester) as
(VALUES
(1001, 1211001, -623.61, date('2025-09-10'), 81, 199086, 'Michael Wendel'),
(2001, 1324271, -2196.48, date('2025-09-10'), 81, 199072, 'Fabrizio Albinati')
)
select 
	ROW_NUMBER() OVER (partition by W.Loan order by W.SeqNum) as RowNum,
	W.SeqNum, 
	W.Loan, 			T.INTSUBSERVICERLOANNUMBER,	 T.IDSTRANSACTIONCOUNT, T.IDSTRANSACTIONCODE,
	W.Amount,			T.CURTRANSACTIONAMT ,  		-Abs(T.CURTRANSACTIONAMT) as "AbsCurTransactionAmt",
	W.TransDate,		T.DTMEFFECTIVEDATE,
	T.IDSTRANSID,
	T.IDSTRANSACTIONCODE,
	W.NewCode,
	W.HDTNum,
	W.Requester
from W
inner join celink.TBLTRANSACTIONS T
	ON T.INTSUBSERVICERLOANNUMBER = W.Loan
/*
--	for 8x where amount is negative
--	and T.CURTRANSACTIONAMT = -Abs(W.Amount) 
--	and T.IDSTRANSACTIONCODE not in (80, 81)

--	for 288, 287 where amount is positive
	and T.CURTRANSACTIONAMT = W.Amount 
--	and T.IDSTRANSACTIONCODE in (288, 287, 286, 285)
	and T.IDSTRANSACTIONCODE not in (281, 280)
*/	

--	for both high 280's and 80's	
	and T.CURTRANSACTIONAMT = W.Amount 
	and T.IDSTRANSACTIONCODE not in (281, 280, 81, 80)
	and T.DTMEFFECTIVEDATE = W.Transdate	
--order by W.SeqNum ,W.Loan -- prefered way to check trans
--order by W.Loan, W.SeqNum
order by W.SeqNum
with ur;	
/*
 ROWNUM SEQNUM LOAN    INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE AMOUNT   CURTRANSACTIONAMT AbsCurTransactionAmt TRANSDATE  DTMEFFECTIVEDATE IDSTRANSID IDSTRANSACTIONCODE NEWCODE HDTNUM REQUESTER
 ------ ------ ------- ------------------------ ------------------- ------------------ -------- ----------------- -------------------- ---------- ---------------- ---------- ------------------ ------- ------ -----------------
      1   1001 1211001                1211001.0                 425                 85  -623.61       -623.610000          -623.610000 2025-09-10 2025-09-10         76229013                 85      81 199086 Michael Wendel
      1   2001 1324271                1324271.0                 191                 85 -2196.48      -2196.480000         -2196.480000 2025-09-10 2025-09-10         76228552                 85      81 199072 Fabrizio Albinati
*/

-------------------------------------------------------------------------------------------
-- Clear DATAUPDT table
DELETE from DATAUPDT.TransCodeX8HtoX8L;

-------------------------------------------------------------------------------------------
-- Insert
insert into DATAUPDT.TransCodeX8HtoX8L
	(
	RowNum ,  
	SeqNum ,
	LOAN   , 
	AMOUNT , 
	TRANSDATE, 
	TRANSID,	-- fetch from table
	OldCode,	-- fetch from table
	NewCode  ,
	HDTNum   ,
	Requester     
	)	
with W (SeqNum, Loan, Amount, TransDate, NewCode, HDTNum, Requester) as
(VALUES
(1001, 1211001, -623.61, date('2025-09-10'), 81, 199086, 'Michael Wendel'),
(2001, 1324271, -2196.48, date('2025-09-10'), 81, 199072, 'Fabrizio Albinati')
)
select 
	ROW_NUMBER() OVER (partition by W.Loan order by W.SeqNum) as RowNum,
	W.SeqNum, 
	W.Loan, 				--, T.INTSUBSERVICERLOANNUMBER,	 T.IDSTRANSACTIONCOUNT, T.IDSTRANSACTIONCODE,
	W.Amount			, 	
	-- test T.CURTRANSACTIONAMT ,  	-Abs(T.CURTRANSACTIONAMT) as "AbsCurTransactionAmt",
	W.TransDate,			
	-- test T.DTMEFFECTIVEDATE,
	T.IDSTRANSID,
	T.IDSTRANSACTIONCODE,
	W.NewCode,
	W.HDTNum,
	W.Requester
from W
inner join celink.TBLTRANSACTIONS T
ON T.INTSUBSERVICERLOANNUMBER = W.Loan
/*
--	for 8x where amount is negative
--	and T.CURTRANSACTIONAMT = -Abs(W.Amount) 
--	and T.IDSTRANSACTIONCODE not in (80, 81)

--	for 288, 287 where amount is positive
	and T.CURTRANSACTIONAMT = W.Amount 
--	and T.IDSTRANSACTIONCODE in (288, 287, 286, 285)
	and T.IDSTRANSACTIONCODE not in (281, 280)
*/	
--	for both high 280's and 80's	
	and T.CURTRANSACTIONAMT = W.Amount 
	and T.IDSTRANSACTIONCODE not in (281, 280, 81, 80)
	and T.DTMEFFECTIVEDATE = W.Transdate	

--order by W.SeqNum ,W.Loan
--order by W.Loan, W.SeqNum
order by W.SeqNum
with ur;	

/* insertion result
select * from dataupdt.TransCodeX8HtoX8L order by RowNum with ur;
*/	

-- source validation
--	select * from dataupdt.TransCodeX8HtoX8L order by RowNum with ur;
--	select * from dataupdt.TransCodeX8HtoX8L order by SeqNum with ur;
--	select * from dataupdt.TransCodeX8HtoX8L order by Loan   with ur;
-- 	-- delete dataupdt.ConvertHigh80sTo81_tkato where RowNum in (1,2);

select * from dataupdt.TransCodeX8HtoX8L order by RowNum with ur;
select * from dataupdt.TransCodeX8HtoX8L order by SeqNum, transid  with ur;
select * from dataupdt.TransCodeX8HtoX8L order by Loan, transid   with ur;

/*
--order by SeqNum, transid
 ROWNUM SEQNUM LOAN      AMOUNT       TRANSDATE  TRANSID  OLDCODE NEWCODE HDTNUM REQUESTER
 ------ ------ --------- ------------ ---------- -------- ------- ------- ------ -----------------
      1   1001 1211001.0  -623.610000 2025-09-10 76229013      85      81 199086 Michael Wendel
      1   2001 1324271.0 -2196.480000 2025-09-10 76228552      85      81 199072 Fabrizio Albinati

--order by Loan, transid  ,,, good to check multiple trans for a loan
 ROWNUM SEQNUM LOAN      AMOUNT       TRANSDATE  TRANSID  OLDCODE NEWCODE HDTNUM REQUESTER
 ------ ------ --------- ------------ ---------- -------- ------- ------- ------ -----------------

*/

/*
select distinct Loan  from dataupdt.TransCodeX8HtoX8L order by Loan with ur; 
 LOAN
 ---------

select distinct Loan, AMOUNT,TRANSDATE from dataupdt.TransCodeX8HtoX8L order by Loan with ur; 
 LOAN      AMOUNT        TRANSDATE
 --------- ------------- ----------

select distinct Loan, TRANSID from dataupdt.TransCodeX8HtoX8L order by Loan with ur; 
 LOAN      TRANSID
 --------- --------

select distinct TRANSID from dataupdt.TransCodeX8HtoX8L order by TRANSID with ur; 

select TRANSID, count(TRANSID) from DATAUPDT.TransCodeX8HtoX8L group by TRANSID having count(TRANSID) > 1; 
-- * DUP !!!!!!!!!!!!!!!!
 TRANSID 2
 ------- - 
no
*/ 

----------------------------------------------------------------------------------------------------------------------------------------------
-- validation before update
Select 
	W.RowNum,
	W.SeqNum,
	W.Loan, 		T.INTSUBSERVICERLOANNUMBER,	 T.IDSTRANSACTIONCOUNT, T.IDSTRANSACTIONCODE,
	W.Amount, 		T.CURTRANSACTIONAMT, ---Abs(T.CURTRANSACTIONAMT) as "AbsCurTransactionAmt",
	W.TransDate,    T.DTMEFFECTIVEDATE,
	W.TransID,		T.IDSTRANSID,
	W.OldCode,
	W.NewCode,
	W.HDTNum, 
	W.Requester
from dataupdt.TransCodeX8HtoX8L W
inner join celink.TBLTRANSACTIONS T
	ON  T.INTSUBSERVICERLOANNUMBER = W.Loan
	and T.IDSTRANSID = W.TRANSID
--	and W.RowNum = 1 -- need to include 2 as well for this one
--order by W.Loan
order by W.SeqNum
with ur;

/* validation before
 ROWNUM SEQNUM LOAN      INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT IDSTRANSACTIONCODE AMOUNT       CURTRANSACTIONAMT TRANSDATE  DTMEFFECTIVEDATE TRANSID  IDSTRANSID OLDCODE NEWCODE HDTNUM REQUESTER
 ------ ------ --------- ------------------------ ------------------- ------------------ ------------ ----------------- ---------- ---------------- -------- ---------- ------- ------- ------ -----------------
      1   1001 1211001.0                1211001.0                 425                 85  -623.610000       -623.610000 2025-09-10 2025-09-10       76229013   76229013      85      81 199086 Michael Wendel
      1   2001 1324271.0                1324271.0                 191                 85 -2196.480000      -2196.480000 2025-09-10 2025-09-10       76228552   76228552      85      81 199072 Fabrizio Albinati
*/

----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- Note before
-- sample : "Per HDT 75012 Transaction code on IDSTransID 44264127 updated from 85 to 81.(12/21/2020 11:29:08 AM)"
--Insert into celink.tblLoanNotes 
--	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)
Select 
	UY.Rownum,
	UY.SeqNum,
	UY.Loan as "Loan Number",
	'Per HDT ' || UY.HDTNum  || ' Transaction code on TransID ' || UY.TransID  ||  ' updated from ' || UY.OldCode || ' to ' || UY.NewCode || '.'
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from dataupdt.TransCodeX8HtoX8L UY  
-- -- where UY.RowNum = 1  -- need to include 2 as well for this one
Order by SeqNum 
; 

/* note check
 ROWNUM SEQNUM Loan Number 4                                                                          5                          6     7 8
 ------ ------ ----------- -------------------------------------------------------------------------- -------------------------- ----- - -
      1   1001   1211001.0 Per HDT 199086 Transaction code on TransID 76229013 updated from 85 to 81. 2025-09-10 10:38:00.392799 tkato 0 0
      1   2001   1324271.0 Per HDT 199072 Transaction code on TransID 76228552 updated from 85 to 81. 2025-09-10 10:38:00.392799 tkato 0 0
*/


----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- my merge ... I can see what will be updated before execution       

MERGE INTO celink.TBLTRANSACTIONS T
USING 
	(
	Select 
	W.RowNum,
	W.SeqNum,
	W.Loan, 		--T.INTSUBSERVICERLOANNUMBER,	 T.IDSTRANSACTIONCOUNT, T.IDSTRANSACTIONCODE,
	W.Amount, 		--T.CURTRANSACTIONAMT, ---Abs(T.CURTRANSACTIONAMT) as "AbsCurTransactionAmt",
	W.TransDate,    --T.DTMEFFECTIVEDATE,
	W.TransID, 		--T.IDSTRANSID
	W.OldCode,
	W.NewCode,
	W.HDTNum,
	W.Requester
	
	from dataupdt.TransCodeX8HtoX8L W

-- --	where W.RowNum = 1 -- to pull 1 good transaction
	
	order by W.Loan
	) X
ON T.idstransid = X.TransID
WHEN MATCHED THEN UPDATE 
	SET T.IDSTRANSACTIONCODE = X.NewCode
;

/* the select
 ROWNUM SEQNUM LOAN      AMOUNT      TRANSDATE  TRANSID  OLDCODE NEWCODE HDTNUM REQUESTER
 ------ ------ --------- ----------- ---------- -------- ------- ------- ------ -----------------

*/
    
----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- validation after update
Select 
	W.RowNum,
	W.SeqNum,
	W.Loan, 		T.INTSUBSERVICERLOANNUMBER,	 T.IDSTRANSACTIONCOUNT,
	W.Amount, 		T.CURTRANSACTIONAMT, ---Abs(T.CURTRANSACTIONAMT) as "AbsCurTransactionAmt",
	W.TransDate,    T.DTMEFFECTIVEDATE,
	W.TransID,		T.IDSTRANSID,
	W.OldCode,		
	W.NewCode,		T.IDSTRANSACTIONCODE,
	W.HDTNum,
	W.Requester
from dataupdt.TransCodeX8HtoX8L W
inner join celink.TBLTRANSACTIONS T
	ON  T.INTSUBSERVICERLOANNUMBER = W.Loan
	and T.IDSTRANSID = W.TRANSID
--order by W.Loan
order by W.SeqNum
with ur;

/* validation after
 ROWNUM SEQNUM LOAN      INTSUBSERVICERLOANNUMBER IDSTRANSACTIONCOUNT AMOUNT       CURTRANSACTIONAMT TRANSDATE  DTMEFFECTIVEDATE TRANSID  IDSTRANSID OLDCODE NEWCODE IDSTRANSACTIONCODE HDTNUM REQUESTER
 ------ ------ --------- ------------------------ ------------------- ------------ ----------------- ---------- ---------------- -------- ---------- ------- ------- ------------------ ------ -----------------
      1   1001 1211001.0                1211001.0                 425  -623.610000       -623.610000 2025-09-10 2025-09-10       76229013   76229013      85      81                 81 199086 Michael Wendel
      1   2001 1324271.0                1324271.0                 191 -2196.480000      -2196.480000 2025-09-10 2025-09-10       76228552   76228552      85      81                 81 199072 Fabrizio Albinati

*/


----------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------
-- Note
-- sample : "Per HDT 75012 Transaction code on IDSTransID 44264127 updated from 85 to 81.(12/21/2020 11:29:08 AM)"
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)

Select 
	UY.Loan as "Loan Number",
--	'Per HDT ' || UY.HDTNum  || ' Transaction code on IDSTransID ' || UY.TransID  ||  ' updated from ' || UY.OldCode || ' to ' || UY.NewCode || '.'
	'Per HDT ' || UY.HDTNum  || ' Transaction code on TransID ' || UY.TransID  ||  ' updated from ' || UY.OldCode || ' to ' || UY.NewCode || '.'
	,
	CURRENT_TIMESTAMP,		--CHAR(Current Date, USA) || ' ' || char(Current Time, USA),
	'tkato', 
	0,
	0
from dataupdt.TransCodeX8HtoX8L UY  
-- -- where UY.RowNum = 1 -- to pull 1 good transaction

Order by SeqNum 
; 

/* note 
 Loan Number 2                                                                          3                          4     5 6
 ----------- -------------------------------------------------------------------------- -------------------------- ----- - -
 */

----------------------------------------------------------------------------------------------------------------------------------------------
-- Notes validation
select 
--	count(*) as "MyCount"
	UY.SeqNum,
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
from DATAUPDT.TransCodeX8HtoX8L UY  
inner join	celink.tblloannotes a  
on  UY.loan = a.INTSUBSERVICERLOANNUMBER 
and a.CHRLOANNOTES like 'Per%HDT%' || HDTNum ||'%'

order by UY.SeqNum --a.IDSLOANNOTES desc 
with ur;


/* validation .. pulls multiple notes for loans listed multiple times
 SEQNUM DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                               CHRUSERID BLNPRIORITY NOTESTEP
 ------ -------------------------- ------------ ------------------------ -------------------------------------------------------------------------- --------- ----------- --------
   1001 2025-09-10 10:39:11.366886    213713414                1211001.0 Per HDT 199086 Transaction code on TransID 76229013 updated from 85 to 81. tkato               0        0
   2001 2025-09-10 10:39:11.366886    213713415                1324271.0 Per HDT 199072 Transaction code on TransID 76228552 updated from 85 to 81. tkato               0        0

--*--
1 transaction updated.  Peer review pending.
4 transactions/3 loans updated.  Peer review pending.
6 transactions updated.  Peer review pending.
1 transaction (1 loan) updated.  Peer review pending.
1 transaction updated.  Peer review pending.

*/

----------------------------------------------------------------------------------------------------------------------------------------------
-- Notes validation
select 
	a.DTMNOTEDATE,	a.IDSLOANNOTES,	a.INTSUBSERVICERLOANNUMBER,	a.CHRLOANNOTES, a.CHRUSERID, a.BLNPRIORITY, NOTESTEP --,*
from celink.tblloannotes a  
where a.INTSUBSERVICERLOANNUMBER =  1362732
and a.CHRLOANNOTES like 'Per%HDT%180663%'
order by a.IDSLOANNOTES desc 
with ur;

-- DTMNOTEDATE                IDSLOANNOTES INTSUBSERVICERLOANNUMBER CHRLOANNOTES                                                                  CHRUSERID BLNPRIORITY NOTESTEP
-- -------------------------- ------------ ------------------------ ----------------------------------------------------------------------------- --------- ----------- --------
-- 2025-01-10 09:49:21.618952    194674472                1362732.0 Per HDT 180663 Transaction code on IDSTransID 72085118 updated from 85 to 81. tkato               0        0
-- 2025-01-10 09:49:21.618952    194674471                1362732.0 Per HDT 180663 Transaction code on IDSTransID 72085117 updated from 85 to 81. tkato               0        0

--end

