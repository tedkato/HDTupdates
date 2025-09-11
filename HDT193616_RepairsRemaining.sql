/*
20250630
193616	Ted Kato	Repairs data	Jordann Greene	Low	6/30/2025 13:18

3364789	RemainingRepairs1	RottingdeckneedstoberepairedandtherailsreplacedandpaintedRottingtrimaroundreardoorReplacecrawlspacedoorRepairceilingaroundthefireplacepreviousleak	NULL
3364789	RepairRiderDueDate	10/25/2025	NULL
3365117	RemainingRepairs1	WaterheaterInstallthetemperatureandpressurereliefvalvewithpipingtosafelydivertescapingsteamorhotwater100ScrapeandpaintpeelingpaintonthebasemententrydoorandthedoorshouldbepaintedinaworkmanlikemannerCosttocu	NULL
3364865	RemainingRepairs1	guesthousetobeclearedandutilitiesturnedonexteriorwoodtrimdamageRoofInspeciton	NULL

RepairRiderDueDate
SELECT
NAME,COLTYPE,LENGTH,SCALE, tbname, *
FROM SYSIBM.SYSCOLUMNS
WHERE   NAME like '%RIDER%' and TBNAME like 'TBL%';

Could it be tblPropertyDescription.DTMREPAIRSEXPECTEDCOMPDATE?

3 loans updated.  Peer review pending.
*/

select REMAININGREPAIRS, * from celink.TBLREPAIRsDETAILs where DBLCELINKLOANNUMBER in (3364789, 3365117, 3364865) for read only with ur;

-- REMAININGREPAIRS                                                                                                                                                                                                                                        DBLCELINKLOANNUMBER REQUIREDREPAIRS                                                                                                                                                                                                                                         REMAININGREPAIRS                                                                                                                                                                                                                                        OWNERSCERTRECEIVEDDATE REPAIRDEFAULTLETTERSENTDATE DEFAULTDESIGNATION REPAIRSNOTES REPAIRADMFEECOLLECTED REPAIRADMINFEE
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- ---------------------- --------------------------- ------------------ ------------ --------------------- --------------
-- Rotting deck needs to be repaired and the rails replaced and painted Rotting trim around rear door Replace crawl space door Repair ceiling around the fireplace previous leak                                                                                     3364789.0 Rotting deck needs to be repaired and the rails replaced and painted Rotting trim around rear door Replace crawl space door Repair ceiling around the fireplace previous leak                                                                           Rotting deck needs to be repaired and the rails replaced and painted Rotting trim around rear door Replace crawl space door Repair ceiling around the fireplace previous leak                                                                           NULL                   NULL                                         0                                  0       0.000000
-- guest house to be cleared and utilities turned onexterior wood trim damageRoof Inspeciton                                                                                                                                                                         3364865.0 guest house to be cleared and utilities turned onexterior wood trim damageRoof Inspeciton                                                                                                                                                               guest house to be cleared and utilities turned onexterior wood trim damageRoof Inspeciton                                                                                                                                                               NULL                   NULL                                         0                                  0       0.000000
-- Water heater Install the temperature and pressure relief valve with piping to safely divert escaping steam or hot water 100 Scrape and paint peeling paint on the basement entry door and the door should be painted in a workmanlike manner Cost to cu           3365117.0 Water heater Install the temperature and pressure relief valve with piping to safely divert escaping steam or hot water 100 Scrape and paint peeling paint on the basement entry door and the door should be painted in a workmanlike manner Cost to cu Water heater Install the temperature and pressure relief valve with piping to safely divert escaping steam or hot water 100 Scrape and paint peeling paint on the basement entry door and the door should be painted in a workmanlike manner Cost to cu NULL                   NULL                                         0                                  0       0.000000


--UPDATE celink.TBLREPAIRsDETAILs set REMAININGREPAIRS = NULL where DBLCELINKLOANNUMBER = 3364789;
--UPDATE celink.TBLREPAIRsDETAILs set REMAININGREPAIRS = NULL where DBLCELINKLOANNUMBER = 3365117;
--UPDATE celink.TBLREPAIRsDETAILs set REMAININGREPAIRS = NULL where DBLCELINKLOANNUMBER = 3364865;


select 
	DTMREPAIRSEXPECTEDCOMPDATE,
	TP.*
from celink.tblPropertyDescription TP
where INTSUBSERVICERLOANNUMBER in (3364789)	
for read only with ur;
UPDATE 

-- DTMREPAIRSEXPECTEDCOMPDATE IDSPROPDESCRIPTID INTSUBSERVICERLOANNUMBER CHRPROPADDRESS     CHRPROPCITY CHRPROPSTATE CHRPROPZIPCODE CHRDWELLINGTYPE INTNUMBEROFUNITS DTMPROPINSPECTLAST DTMPROPINSPECTNEXT DTMMICENDORSEDATE DTMREPAIRCOMPCERTDATE DTMREPAIRSEXPECTEDCOMPDATE DTMAPPRAISALDATE MEMPROPDESCRIPTION OLEPICTURE BTNREPAIRSEXPECTED BTNMICENDORSERECEIVED BTNREPAIRCOMPCERTRECEIVED BTNEQUITYSHARE CURRENTAPPRAISALVALUE CURRENTAPPRAISALDATE INTDOCRECEIVEDEXT1 TIMEEXT1APPROVED INTDOCRECEIVEDEXT2 TIMEEXT2APPROVED INTUTILINSERVICERNAME FIPSCOUNTYCODE       SECONDLIENPOSITION PROPADDRESSID
-- -------------------------- ----------------- ------------------------ ------------------ ----------- ------------ -------------- --------------- ---------------- ------------------ ------------------ ----------------- --------------------- -------------------------- ---------------- ------------------ ---------- ------------------ --------------------- ------------------------- -------------- --------------------- -------------------- ------------------ ---------------- ------------------ ---------------- --------------------- -------------------- ------------------ -------------
-- 2025-10-25 00:00:00.0                 839236                3364789.0 2015 MARY ANN DR   CHARLOTTE   NC           28214          SFD                            1 NULL               NULL               NULL              NULL                  2025-10-25 00:00:00.0      2024-12-19       NULL               NULL                       -1                     0                         0              0              260000.0 NULL                                  0 NULL                              0 NULL                                 0 37119                                 0       4674180

--UPDATE celink.tblPropertyDescription set DTMREPAIRSEXPECTEDCOMPDATE = NULL  where INTSUBSERVICERLOANNUMBER = 3364789; 
 
----------------------------------------------------------------------------------------------------------------------------------------------------------
------** --Notes ... parameter
Insert into celink.tblLoanNotes 
	(INTSUBSERVICERLOANNUMBER, CHRLOANNOTES, DTMNOTEDATE, CHRUSERID, BLNPRIORITY, NoteStep)

with p (Loan, Note, TimeS, who, prio, StepID) as
(values

(3364789, 'Per HDT 193616 Remaining Repairs and Repair Rider Due Date removed.',CURRENT_TIMESTAMP, 'tkato', 0, 0),
(3365117, 'Per HDT 193616 Remaining Repairs removed.',CURRENT_TIMESTAMP, 'tkato', 0, 0),
(3364865, 'Per HDT 193616 Remaining Repairs removed.',CURRENT_TIMESTAMP, 'tkato', 0, 0)
) 
select * from P
;
