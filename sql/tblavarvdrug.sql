SELECT a.Drug as DrugName, '' as Dose, '0' as Quantity, '' as Freq, 'tab or cap' as Form, 
  '0' as Status, 
  a.StartDate as Da, 
  '' as Reason, 
  '' as Remark,
  ci.ClinicID + right('0'+cast(day(a.StartDate) as varchar(2)),2) + right('0'+cast(Month(a.StartDate) as varchar(2)),2) + right(cast(year(a.StartDate) as varchar(4)),2) as Vid
FROM tblART a
INNER JOIN tblCodeID ci ON ci.PtCode=a.ID 
WHERE a.StartDate IS NOT NULL

UNION ALL

SELECT a.Drug as DrugName, '' as Dose, '0' as Quantity, '' as Freq, 'tab or cap' as Form, 
  '1' as Status, 
  a.StopDate as Da, 
  a.MainStop as Reason, 
  '' as Remark,
  ci.ClinicID + right('0'+cast(day(a.StopDate) as varchar(2)),2) + right('0'+cast(Month(a.StopDate) as varchar(2)),2) + right(cast(year(a.StopDate) as varchar(4)),2) as Vid
FROM tblART a
INNER JOIN tblCodeID ci ON ci.PtCode=a.ID 
WHERE a.StopDate IS NOT NULL;