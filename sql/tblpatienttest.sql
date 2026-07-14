WITH AllTestDates AS (
    SELECT ID, CD4_d AS TestDate FROM tblLAB_CD4
    UNION
    SELECT ID, RNA_d AS TestDate FROM tblLAB_RNA
    UNION
    SELECT ID, LAB_d AS TestDate FROM tblLAB
)
SELECT distinct
ci.ClinicID + right('0'+cast(day(d.TestDate) as varchar(2)),2) + right('0'+cast(Month(d.TestDate) as varchar(2)),2) + cast(year(d.TestDate) as varchar(4)) as TestID,
ci.ClinicID, d.TestDate as DaArrival, d.TestDate as Dat, d.TestDate as DaCollect, '-1' as CD4Rapid,
LEFT(ISNULL(CAST((SELECT TOP 1 CD4_v FROM tblLAB_CD4 c WHERE c.ID=d.ID AND c.CD4_d=d.TestDate) AS VARCHAR), ''), 5) as CD4, 
'' CD, '' CD8,
LEFT(ISNULL(CAST((SELECT TOP 1 RNA_v FROM tblLAB_RNA r WHERE r.ID=d.ID AND r.RNA_d=d.TestDate) AS VARCHAR), ''), 10) as HIVLoad,
'' HIVLog, '' HCV, '' HCVlog, '-1' HIVAb, '-1' HBsAg, '-1' HCVPCR, '-1' HBeAg, '-1' TPHA, '-1' AntiHBcAb, '-1' RPR, '-1' AntiHBeAb,
'' RPRab, '-1' HCVAb, '-1' HBsAb, '' WBC, '' Neutrophils, 
LEFT(ISNULL(CAST((SELECT TOP 1 LAB_v FROM tblLAB l WHERE l.ID=d.ID AND l.LAB_d=d.TestDate AND l.LAB='Hemoglobine') AS VARCHAR), ''), 5) HGB, 
'' Eosinophis, '' HCT, '' as Lymphocyte, '' MCV, '' Monocyte, '' PLT, '' Reticulocte,
'' Prothrombin, '' ProReticulocyte, 
LEFT(ISNULL(CAST((SELECT TOP 1 LAB_v FROM tblLAB l WHERE l.ID=d.ID AND l.LAB_d=d.TestDate AND l.LAB='Creatinin') AS VARCHAR), ''), 5) as Creatinine, 
'' HDL, '' Bilirubin, '' Glucose, '' Sodium, '' AlPhosphate, 
LEFT(ISNULL(CAST((SELECT TOP 1 LAB_v FROM tblLAB l WHERE l.ID=d.ID AND l.LAB_d=d.TestDate AND l.LAB='SGOT') AS VARCHAR), ''), 5) as GotASAT, 
'' Potassium, '' Amylase,
LEFT(ISNULL(CAST((SELECT TOP 1 LAB_v FROM tblLAB l WHERE l.ID=d.ID AND l.LAB_d=d.TestDate AND l.LAB='SGPT') AS VARCHAR), ''), 5) as GPTALAT, 
'' Chloride, '' CK, '' CHOL, '' Bicarbonate, '' Lactate, '' Triglyceride,
'' Urea, '' Magnesium, '' Phosphorus, '' Calcium, '-1' BHCG, '-1' SputumAFB, '-1' AFBCulture, '' AFBCulture1, '-1' UrineMicroscopy,
'' UrineComment, '' CSFCell, '' CSFGram, '' CSFAFB, '-1' CSFIndian, '' CSFCCag, '' CSFProtein, '' CSFGlucose, '-1' BloodCulture,
'' BloodCulture0, '-1' BloodCulture1, '' BloodCulture10, '-1' CTNA, '-1' GCNA, '-1' CXR, '-1' Abdominal
FROM AllTestDates d
JOIN tblCodeID ci ON ci.PtCode=d.ID 
WHERE d.TestDate IS NOT NULL AND ci.ClinicID IS NOT NULL;
