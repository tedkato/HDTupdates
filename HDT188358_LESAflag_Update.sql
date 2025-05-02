SELECT 
count(*) 
from DATAUPDT.MICDateFlag UY 
inner join celink.tblTaxAndInsData TT
ON UY.LoanNum = TT.TIDATALOANNUMBER
where TT.TISAMANDATORY = 58
;

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

SELECT 
count(*) 
from DATAUPDT.MICDateFlag UY 
inner join celink.tblTaxAndInsData TT
ON UY.LoanNum = TT.TIDATALOANNUMBER
where TT.TISAMANDATORY = 56
;
