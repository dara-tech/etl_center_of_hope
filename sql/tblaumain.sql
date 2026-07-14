select distinct ci.ClinicID, p.Enrol_d as Daupdate,
LEFT(ISNULL(i.[Marital status], '-1'), 20) as Marital, 
LEFT(ISNULL(i.Occupation, '-1'), 50) as Occupation,
'-1' as HIVshow, 
'False' as Relative, 
'False' as Family, 
'False' as Community, 
'' as Grou, 
LEFT(ISNULL(i.[House Number], ''), 20) as House, 
LEFT(ISNULL(i.Street, ''), 20) as Street, 
LEFT(ISNULL(i.Phum, ''), 20) as Village, 
LEFT(ISNULL(i.sgkat_com, ''), 25) as Commune, 
LEFT(ISNULL(i.khadis, ''), 25) as District, 
LEFT(ISNULL(i.city_pro, ''), 25) as Province,
LEFT(ISNULL(i.Telephone, ''), 12) as Phone, 
LEFT(ISNULL(i.[Contact person], ''), 30) as AddCont1, 
'' as Phone1, 
'' as AddCont2, 
'' as Phone2, 
'False' as NGO, 
'' as NameNGO,
ci.ClinicID + right('0'+cast(day(p.Enrol_d) as varchar(2)),2) + right('0'+cast(Month(p.Enrol_d) as varchar(2)),2) + right(cast(year(p.Enrol_d) as varchar(4)),2) as AUID
from tblPATIENT p
left join tblPATIENTINFO i on p.ID=i.ID
left outer join tblCodeID ci on ci.PtCode=p.ID 
where ci.ClinicId is not null;
