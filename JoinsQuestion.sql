-- Retrieve the total number of appointments for each doctor.

Select 
d.doctor_id,full_name,
count(a.appointment_id) as total_appointment
from
 doctors d
 join 
 appointments a 
 on 
 d.doctor_id = a.doctor_id
 group by d.doctor_id,full_name;
 
 
 -- List all patients who have completed an appointment but have no insurance claim approved yet.
 -- Using join 
 select p.full_name 
 from
 patients p 
 join 
 appointments a 
 on 
 p.patient_id = a.patient_id
 left join insuranceclaims ic 
 on 
 p.patient_id = ic.patient_id and ic.status = 'Approved'
 where a.status = 'Completed'
 and 
 ic.claim_id is null;
  
  
  --  Using corrleated Subquery
  
  select p.full_name
  from 
  patients p
  join 
  appointments a 
on p.patient_id = a.patient_id
  where a.status = 'Completed'
 and not exists( 
  select 1 
  from 
  insuranceclaims ic
  where ic.patient_id = p.patient_id
  and status = 'Approved'
);
 
 -- Display patient names and the total cost of all tests they have taken.
 select p.full_name,
 sum(m.cost)
 from 
 patients p 
 join 
 patienttests pt
 on p.patient_id = pt.patient_id
 join 
 medicaltests m
 on 
 m.test_id = pt.test_id
 group by pt.patient_id,p.full_name;
 
 -- Find all appointments scheduled for the next 7 days.
 select * from 
 appointments
 where appointment_date >= current_date()
 and appointment_date <
 date_add(current_date(),interval 7 day);
 
-- find age of patient

Select full_name,
timestampdiff(Year,date_of_birth,current_date()) as age 
from patients;
 
 -- List doctors who have never had a cancelled appointment.

 select 
 d.doctor_id,d.full_name as doctor_name, a.appointment_id
 from 
 doctors d 
 left join 
 appointments a
 on 
 d.doctor_id = a.doctor_id
 and a.status = 'Cancelled'
where a.appointment_id is null;
-- Here we can even go with join as we use condition != 'Cancelled' But if a same doctor id has 2 appointemnt where one is fail and other is complted so in this case this wil fail as it will include this doctor  so we go for left join with is null
 
 
 