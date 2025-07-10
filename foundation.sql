SELECT 
ps.PatientId
,ps.Hospital
,PS.WARD
,ps.AdmittedDate
,PS.DischargeDate
,datediff(day,ps.AdmittedDate,ps.dischargedate) AS LengthOfStay
,dateadd(week,-2,ps.AdmittedDate) as ReminderDate
,ps.Tariff 
,ps.Ethnicity

FROM PatientStay ps

where Hospital in ('Kingston','PRUH')

AND PS.WARD like '%surgery%'

and ps.AdmittedDate between '20240227' and '20240301'

and ps.tariff > 5

order by ps.AdmittedDate DESC,
ps.patientid DESC
