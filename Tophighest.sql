-- Find the top 3 patients who have spent the most on medical tests.
select 
p.patient_id,p.full_name,
sum(m.cost) as total_sales
from 
patients p 
join 
patienttests pt
on p.patient_id  = pt.patient_id
join 
medicaltests m 
on pt.test_id = m.test_id
group by p.patient_id, p.full_name
order by total_sales desc
limit 3;

-- List all patients along with the medicines prescribed to them in the last 6  month.

select 
p.patient_id,p.full_name,pr.appointment_id,a.appointment_date,
pr.medicine_name
from 
patients p 
join 
appointments a on p.patient_id = a.patient_id
left join 
prescriptions pr on pr.appointment_id = a.appointment_id
where a.appointment_date >= date_sub(curdate(),interval 6 month);
