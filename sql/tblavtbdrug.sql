SELECT 'Isoniazid' as Drugname, '' as Dose, '0' as Quantity, '' as Freq, 'tab or cap' as Form, 
       '2' as Status, v.vis_d as Da, '' as Reason, '' as Remark,
       ci.ClinicID + right('0'+cast(day(v.vis_d) as varchar(2)),2) + right('0'+cast(Month(v.vis_d) as varchar(2)),2) + right(cast(year(v.vis_d) as varchar(4)),2) as Vid
FROM tblVIS v
INNER JOIN tblCodeID ci ON ci.PtCode=v.ID 
WHERE 1=0;