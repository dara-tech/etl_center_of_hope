IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'tblCodeID')
BEGIN
  CREATE TABLE tblCodeID (ClinicId NVARCHAR(20), HospitalID NVARCHAR(20), PtCode INT);
END
IF NOT EXISTS(SELECT * FROM sys.columns WHERE Name = N'ARTnumber' AND Object_ID = Object_ID(N'tblCodeID'))
BEGIN
    ALTER TABLE tblCodeID ADD ARTnumber NVARCHAR(20);
END
TRUNCATE TABLE tblCodeID;

EXEC('INSERT INTO tblCodeID (ClinicId,HospitalID, PtCode, ARTnumber) 
select cast(p.ID as varchar(20)) as ClinicID, 
       cast(i.[Hospital number] as varchar) as code, 
       p.ID as PtCode,
       ''1205'' + right(''00000'' + cast(p.ID as varchar(20)), 5) as ARTnumber
from tblPATIENT p
left join tblPATIENTINFO i on p.ID = i.ID');
