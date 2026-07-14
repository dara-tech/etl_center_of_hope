select ci.ClinicId as ClinicID, 
       p.Enrol_d as DafirstVisit, 
       '-1' as TypeofReturn,
       '' as LClinicID, 
       '' as SiteNameold, 
       p.Birthday as DaBirth, 
       iif(p.Gender='F',0,1) as Sex, 
       '-1' as Education, 
       '-1' as Rea, 
       '-1' as Write, 
       iif(b.placetest is not null, cast(b.placetest as varchar), '-1') as Referred, 
       '' as Orefferred, 
       b.seroco_d as DaHIV,
       '' as Vcctcode, 
       '' as VcctID, 
       '' as PclinicID, 
       0 as OffIn, 
       '' as SiteName,
       '1900-01-01' as DaART, 
       i.[National ART number] as Artnum, 
       iif(tb.TbPast is not null, 1, 0) as TbPast, 
       '-1' as TPT, 
       null as DaStartTPT, 
       null as DaEndTPT, 
       '-1' as TypeTB, 
       '-1' as ResultTB,
       '1900-01-01' as Daonset, 
       '-1' as Tbtreat, 
       '1900-01-01' as Datreat, 
       '-1' as ResultTreat, 
       '1900-01-01' as DaResultTreat, 
       '-1' as ARVTreatHis,
       'False' as Diabete, 
       'False' as Hyper, 
       'False' as Abnormal,
       'False' as Renal, 
       'False' as Anemia, 
       'False' as Liver,
       'False' as HepBC, 
       'False' as MedOther, 
       '-1' as Allergy, 
       '-1' as Nationality
from tblPATIENT p
left outer join tblPATIENTINFO i on p.ID=i.ID
left outer join tblBAS b on p.ID=b.ID
left outer join (
  select distinct ID, 1 as TbPast from tblDIS where DIS like '%TB%'
) tb on tb.ID=p.ID
left outer join tblCodeID ci on ci.PtCode=p.ID 
where ci.ClinicId is not null
order by p.Enrol_d;
