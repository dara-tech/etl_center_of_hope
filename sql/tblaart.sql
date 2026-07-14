SELECT art.ClinicId as ClinicID, 
       art.ARTnumber as ART, 
       art.dat as DaArt 
FROM (
  SELECT ci.ClinicId, ci.ARTnumber, MIN(a.StartDate) as dat
  FROM tblART a
  INNER JOIN tblCodeID ci ON ci.PtCode = a.ID 
  WHERE a.StartDate IS NOT NULL
  GROUP BY ci.ClinicId, ci.ARTnumber
) art;
