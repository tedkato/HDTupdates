/*
20240501

[ID:0162116]  FCL Dates  5/2/2024 12:22 PM  Grace Olivaretti
Please remove FLDD and RDD data from ReverseServ. Fields that need to be cleared are highlighted.
RDD Dates.xlsx

DnP 1st Legal Deadline:	02/18/2023
FCL 1st Legal Deadline:	02/18/2023
FCL Due Diligence Deadline:	01/06/2024
FCL Adjusted Due Diligence Deadline:	01/06/2024

--
Hi Grace, Could you please check Claims module to see if these dates exists since the same in RS are controlled by it?  If exists, changes in RS side is not effective.   Thank you! 
Hi Grace  Have these dates been cleared in Claims module?  If not, changes in RS6 will not be effective since the dates on the RS tabs are controlled by the same in Claims.  Please check if you have not, and advise.  Thank you!  

-- ck
Ted,
First Legal Deadline Date and Due Diligence Deadline dates are CAFI dates and cannot be updated manually.
I have no idea what data points are used to calculate them.

--
Hi Cyndie, 
I will check with Development team for the 4 CAFI fields
133 FIRSTLEGALDEADLINEDATE
136 DueDilligenceDeadline
137 AdjustedDueDilligenceDeadline
138 ADJSTFIRSTLEGALDEADLINE

*The reason I thought this can be resolved by removing 133,13,137,138 in tblOverRides is that we have removed data from tbloverrides for some HDT's in the past (like Samanage #124462 affected 400+ loans).  The ticket was requesting to remove
“Adjusted 1st Legal Deadline Overrides”, 
“1st Legal Deadline”, and 
“Adjusted 1st Legal Deadline” 
and we removed 133 and 138 from  tbloverrides to resolve the ticket after we got instruction from Vicky as below

Vicky Cermak
Mar 31, 2023 at 11:31 AM
@Cyndie King
Per Prashanth:
tbloverrides stores the CFIs, please remove dates from there.
I do not remember if we have any ticket requesting 136 and 137, but as for the loan 49429, I see the existed 3 fields on RS tabs (or tblCalcFields) have been removed by deleting 133, 136, 138 in tblOverRides. 

-- 
Hi Development team,
This ticket is requesting to remove below 4 fiels on RS default tabs.

D&P 1st Legal Deadline:
FCL 1st Legal Deadline:
FCL Due Diligence Deadline:
FCL Adjusted Due Diligence Deadline:

These 4 are CAFI fields show below.  I need to know what data points are used to calculate them so that the dates can be cleared by deleting the data points.  
133 FIRSTLEGALDEADLINEDATE
136 DueDilligenceDeadline
137 AdjustedDueDilligenceDeadline

Thank you!

--*--
Below requested 4 fields on FCL/D&P tab removed by deleting corresponding row in tblOverrides (ID of 133, 136, 137) for 215 loans.  Peer review pending.
D&P 1st Legal Deadline:
FCL 1st Legal Deadline:
FCL Due Diligence Deadline:
FCL Adjusted Due Diligence Deadline:
*/


/*
202406215

166000	166000	Ted Kato	FCL Dates	Grace Olivaretti	Low	6/25/2024 17:12
1331189 ,,, Please update Adjusted RDDD to 4/5/25 per Client Request
"Adjusted Due Deligence Deadline: 11/29/2023"

--x 133 FIRSTLEGALDEADLINEDATE
--x 136 DueDilligenceDeadline
137 AdjustedDueDilligenceDeadline
--x 138 ADJSTFIRSTLEGALDEADLINE

--
Cyndie King
7/11/2024 10:17 AM
After some research, I've determined that this particular CAFI is running as it should and 24 loans were updated today alone.

--
Cyndie King
7/11/2024 9:04 AM
1) The CAFIs weren't fired off on July 1 and some things were missed. They were manually ran on 7/2 but some reports went out with incorrect data. We have determined that they're currently running properly and being approriately triggered when transactions are posted.
2) We also determined that many of the CAFIs have been discontinued as being obsolete based on values being sourced by other processes or calculated "on the fly".
3) This loan went inactive in May so the CAFI is irrelevant.
*/

/*
-- CAFI
--                  133 FIRSTLEGALDEADLINEDATE
--                  136 DueDilligenceDeadline
--                  137 AdjustedDueDilligenceDeadline !! this
--                  138 ADJSTFIRSTLEGALDEADLINE
*/

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
--HDTs

/*
20250820
197457	Ted Kato	RDD dates	Grace Olivaretti		Low	8/20/2025 10:45
3289180 Please remove RDD dates in RSE. These fields should be blank.

Due Deligence deadline          09/20/2025
Adjustd Due Deligence Deasline. 09/20/2025
136 DueDilligenceDeadline
137 AdjustedDueDilligenceDeadline
*/

-----------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter ,,, plug in valeus fro -- Note Insert Value Creastion -- when you done update first and removed original data
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NOTESTEP)

with p (Loan, Note, TimeS, who, prio, StepNum) as
(values
(3289180, 'Per HDT 197457 Due Diligence Deadline and Adjusted Due Diligence Deadline updated from 09/20/2025 to <blank> in tblOverrides.', CURRENT_TIMESTAMP, 'tkato', 0, 0)
) 
select * from P
;
-- LOAN    NOTE                                                                                                                          TIMES                      WHO   PRIO STEPNUM
-- ------- ----------------------------------------------------------------------------------------------------------------------------- -------------------------- ----- ---- -------
-- 3289180 Per HDT 197457 Due Diligence Deadline and Adjusted Due Diligence Deadline updated from 09/20/2025 to <blank> in tblOverrides. 2025-08-20 14:25:30.499303 tkato    0       0

-- ------------------------- ------------- --------------------------- ----------- ---------------- ------------------------- -------------------------- -------------------- -------------------- -------------------------- ------------- --------------- -------------- ----------------- ------------- ------------- -------- ------------------------ ------------ --------------- --------------- ------------------- ----------------------- -------- ------------------------- --------------------- -------------------- ----------------------- ---------------------- --------------------- --------------------- --------------------- -------------------- -------------------- --------------- ---------------- ----------------- ------------------- ------------------------ ---------------------------- ---------------------- ------------------------- ------------------- -------------- --------------------
-- CAFI
--select * from CELINK.TBLCALCFIELDS where CFIFIELDID = 137 and CFILOANNUMBER = 1336521 for read only with ur;
--select * from CELINK.TBLCALCFIELDS where CFIFIELDID = 138 and CFILOANNUMBER = 1336521 for read only with ur;
--select * from CELINK.TBLCALCFIELDS where CFIFIELDID = 136 and CFILOANNUMBER = 13311336521189 for read only with ur;
--select * from CELINK.TBLCALCFIELDS where CFIFIELDID = 10 and CFILOANNUMBER = 1336521 for read only with ur;

select * from CELINK.TBLCALCFIELDS where CFILOANNUMBER in (3289180)  and CFIFIELDID in (136,137) order by CFIFIELDID for read only with ur;
-- CFILOANNUMBER CFIFIELDID CFIDATE    CFIDECIMAL CFIBOOLEAN CREATIONDATE               CFIINT CFISTRING
-- ------------- ---------- ---------- ---------- ---------- -------------------------- ------ ---------
--     3289180.0        136 2025-09-20       NULL       NULL 2025-03-25 02:03:47.614984   NULL NULL
--     3289180.0        137 2025-09-20       NULL       NULL 2025-03-25 02:03:47.627869   NULL NULL

-- seconds after change in tblOverride 
-- CFILOANNUMBER CFIFIELDID CFIDATE CFIDECIMAL CFIBOOLEAN CREATIONDATE CFIINT CFISTRING
-- ------------- ---------- ------- ---------- ---------- ------------ ------ ---------

-------------------------------------------------------------------------------------------------------------------------------------
-- Override
select * FROM CELINK.tblOverrides WHERE LoanNumber in (3289180) order by FIELDCODE for read only with ur;
-- LOANNUMBER FIELDCODE OVERRIDEDATE
-- ---------- --------- ------------
--    3289180       133 2026-02-16
--*    3289180       136 2025-09-20
--*    3289180       137 2025-09-20
--    3289180       138 2026-02-16
--after
-- LOANNUMBER FIELDCODE OVERRIDEDATE
-- ---------- --------- ------------
--    3289180       133 2026-02-16
--    3289180       136 NULL
--    3289180       137 NULL
--    3289180       138 2026-02-16

-- CAFI
--                  133 FIRSTLEGALDEADLINEDATE
--                  136 DueDilligenceDeadline
--                  137 AdjustedDueDilligenceDeadline !! this
--                  138 ADJSTFIRSTLEGALDEADLINE




			/* updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
			
			--UPDATE CELINK.tblOverrides set OVERRIDEDATE = NULL WHERE LoanNumber = 3289180 and FIELDCODE = 136;
			--UPDATE CELINK.tblOverrides set OVERRIDEDATE = NULL WHERE LoanNumber = 3289180 and FIELDCODE = 137;
			
			select * from CELINK.TBLCALCFIELDS where CFILOANNUMBER in (3289180)  and CFIFIELDID in (136,137) order by CFIFIELDID for read only with ur;
			-- CFILOANNUMBER CFIFIELDID CFIDATE CFIDECIMAL CFIBOOLEAN CREATIONDATE CFIINT CFISTRING
			-- ------------- ---------- ------- ---------- ---------- ------------ ------ ---------
			*/





-------------------------------------------------------
/* below is to insert a record
insert into CELINK.tblOverrides
(LOANNUMBER, FIELDCODE, OVERRIDEDATE)

with P (LOANNUMBER, FIELDCODE, OVERRIDEDATE) as
(values
(1211264, 137, date('8/25/2022'))
)
select 
LOANNUMBER, FIELDCODE, OVERRIDEDATE 
from P
;

-- LOANNUMBER FIELDCODE OVERRIDEDATE
-- ---------- --------- ------------
--    1211264       137 2022-08-25

*/

