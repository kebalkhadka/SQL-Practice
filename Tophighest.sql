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

