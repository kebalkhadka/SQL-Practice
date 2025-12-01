-- Pracrtice Questions 

-- Select all patients from table
select * from patients;

-- Retrieve all doctors with specialty = 'Cardiology'.

Select * from doctors where specialty = 'Cardiology';

-- Get all appointments scheduled for today
Select * from appointments 
where appointment_date >= curdate() and appointment_date < curdate()+ interval 1 day;

-- List distinct medical test names.
Select distinct test_name from medicaltests;

-- Show the latest 5 registered patients.

SELECT full_name AS patient_name, registration_date
FROM patients
ORDER BY registration_date DESC
LIMIT 5;

-- Find all approved insurance claims.
select * from insuranceclaims
where status = 'Approved';

-- Find count of approved and pending and rejected in insurance claims
select 
sum(case when status = 'Approved' then 1 else 0 end) as app_count,
sum(case when status = 'Pending' then 1 else 0 end) as pen_count,
sum(case when status = 'Rejected' then 1 else 0 end) as rej_count
from 
insuranceclaims;

-- Get all prescriptions for a specific appointment.
select * from prescriptions;

-- Find patients older than 60 years.
select full_name from patients where
timestampdiff(Year,date_of_birth,current_date())>60;

