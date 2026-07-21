select ClinicID, Hospitalid as Codes, 'HospitalID' as Typecode, -1 as ARTIss, '1900-01-01' as DaExpiry, GETDATE() as Dacreate from tblcodeid
