-- LESA flag update
--count before
SELECT 
count(*) 
from DATAUPDT.MICDateFlag UY 
inner join celink.tblTaxAndInsData TT
ON UY.LoanNum = TT.TIDATALOANNUMBER
where TT.TISAMANDATORY = 58
; --45764/0

			-- update
			MERGE INTO celink.tblTaxAndInsData TT
			USING 
			(
				SELECT
					UY.SeqNum, 
					UY.LoanNum
				from DATAUPDT.MICDateFlag UY
			) UY (SeqNum, LoanNum)
			ON UY.LoanNum = TT.TIDATALOANNUMBER
			WHEN MATCHED THEN UPDATE 
			Set
			TT.TISAMANDATORY = 56
			;	

--count after
SELECT 
count(*) 
from DATAUPDT.MICDateFlag UY 
inner join celink.tblTaxAndInsData TT
ON UY.LoanNum = TT.TIDATALOANNUMBER
where TT.TISAMANDATORY = 56
; --0/45764 


----------------------------------------------------------------------------------------------------
-- Note insertion  
-- Count the number of existing notes
select count(*) from celink.tblLoanNotes for read only with ur; 
-- 185163045

		Insert into celink.tblLoanNotes 
		(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)
		select LOAN, LOANNOTES, CURRENT_TIMESTAMP, USERID, PRIORITY, 0 from DATAUPDT.LOANNOTES_TKATO order by LOAN ;
		
-- Count the number of existing notes again    
select count(*) from celink.tblLoanNotes for read only with ur; 
--  185208809