SELECT 
  ci.ClinicId as ClinicID, 
  CASE 
    WHEN p.drop_rs = 'Deceased' THEN '1'
    WHEN p.drop_rs = 'Transfer Other Hospital' THEN '3'
    WHEN p.drop_rs = 'LTFU' OR p.drop_rs = 'Moved away' THEN '0'
    ELSE '0' 
  END as Status, 
  '-1' as Place, 
  '' as OPlace,
  p.drop_d as Da, 
  '' as Cause,
  ci.ClinicID + right('0'+cast(day(ISNULL(p.drop_d, '1900-01-01')) as varchar(2)),2) + right('0'+cast(Month(ISNULL(p.drop_d, '1900-01-01')) as varchar(2)),2) + right(cast(year(ISNULL(p.drop_d, '1900-01-01')) as varchar(4)),2) as Vid
FROM tblPATIENT p
INNER JOIN tblCodeID ci ON ci.PtCode=p.ID 
WHERE p.drop_rs IS NOT NULL AND RTRIM(p.drop_rs) <> '';
