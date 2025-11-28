CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    gender VARCHAR(10),
    date_of_birth DATE,
    contact_number VARCHAR(20),
    registration_date DATE
);
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    specialty VARCHAR(50),
    joining_date DATE
);

CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status VARCHAR(20),   -- Scheduled, Completed, Cancelled
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Prescriptions (
    prescription_id INT PRIMARY KEY,
    appointment_id INT,
    medicine_name VARCHAR(100),
    dosage VARCHAR(50),
    duration_days INT,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
CREATE TABLE MedicalTests (
    test_id INT PRIMARY KEY,
    test_name VARCHAR(100),
    cost DECIMAL(10,2)
);
CREATE TABLE PatientTests (
    patient_test_id INT PRIMARY KEY,
    patient_id INT,
    test_id INT,
    test_date DATE,
    result VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (test_id) REFERENCES MedicalTests(test_id)
);
CREATE TABLE InsuranceClaims (
    claim_id INT PRIMARY KEY,
    patient_id INT,
    claim_amount DECIMAL(10,2),
    claim_date DATE,
    status VARCHAR(20),   -- Approved, Pending, Rejected
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- 1. INSERT DATA FOR Patients
INSERT INTO Patients (patient_id, full_name, gender, date_of_birth, contact_number, registration_date)
VALUES
(1, 'John Doe', 'Male', '1980-05-14', '9876543210', '2023-01-12'),
(2, 'Aisha Khan', 'Female', '1992-11-22', '9988776655', '2023-03-05'),
(3, 'Michael Smith', 'Male', '1975-02-10', '9123456780', '2022-12-20'),
(4, 'Rita Sharma', 'Female', '1988-07-09', '9876001122', '2023-04-18'),
(5, 'Arjun Mehta', 'Male', '2000-06-18', '9001234567', '2023-05-11');

-- INSERT DATA FOR Doctors

INSERT INTO Doctors (doctor_id, full_name, specialty, joining_date)
VALUES
(1, 'Dr. Priya Menon', 'Cardiology', '2021-01-10'),
(2, 'Dr. Rahul Gupta', 'Dermatology', '2020-05-15'),
(3, 'Dr. Sarah Lee', 'Endocrinology', '2022-02-20'),
(4, 'Dr. David Clark', 'Orthopedics', '2019-11-11'),
(5, 'Dr. Meera Singh', 'General Medicine', '2023-01-05');

-- INSERT DATA FOR Appointments
INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, status)
VALUES
(1, 1, 1, '2024-01-10 10:30:00', 'Completed'),
(2, 1, 3, '2024-02-12 14:00:00', 'Completed'),
(3, 2, 5, '2024-03-01 09:00:00', 'Scheduled'),
(4, 3, 2, '2024-01-25 15:45:00', 'Cancelled'),
(5, 4, 4, '2024-02-05 11:00:00', 'Completed'),
(6, 5, 5, '2024-02-20 16:30:00', 'Completed');

-- INSERT DATA FOR Prescriptions
INSERT INTO Prescriptions (prescription_id, appointment_id, medicine_name, dosage, duration_days)
VALUES
(1, 1, 'Aspirin', '75mg', 30),
(2, 1, 'Atorvastatin', '10mg', 60),
(3, 2, 'Metformin', '500mg', 90),
(4, 5, 'Ibuprofen', '400mg', 10),
(5, 6, 'Vitamin B12', '500mcg', 45);

--  insert Data for prescription
INSERT INTO Prescriptions (prescription_id, appointment_id, medicine_name, dosage, duration_days)
VALUES
(1, 1, 'Aspirin', '75mg', 30),
(2, 1, 'Atorvastatin', '10mg', 60),
(3, 2, 'Metformin', '500mg', 90),
(4, 5, 'Ibuprofen', '400mg', 10),
(5, 6, 'Vitamin B12', '500mcg', 45);

-- INSERT DATA FOR MedicalTests
INSERT INTO MedicalTests (test_id, test_name, cost)
VALUES
(1, 'Blood Sugar Test', 250.00),
(2, 'Lipid Profile', 900.00),
(3, 'Thyroid Panel', 650.00),
(4, 'X-Ray', 500.00),
(5, 'MRI Scan', 4500.00);

-- 
INSERT INTO PatientTests (patient_test_id, patient_id, test_id, test_date, result)
VALUES
(1, 1, 1, '2024-01-10', 'Normal'),
(2, 1, 2, '2024-02-12', 'High Cholesterol'),
(3, 2, 3, '2024-03-01', 'TSH Slightly High'),
(4, 3, 4, '2024-01-25', 'No Fracture Detected'),
(5, 4, 1, '2024-02-05', 'Slightly High'),
(6, 5, 5, '2024-02-20', 'Normal MRI');

 -- INSERT DATA FOR InsuranceClaims
 INSERT INTO InsuranceClaims (claim_id, patient_id, claim_amount, claim_date, status)
VALUES
(1, 1, 5000.00, '2024-02-15', 'Approved'),
(2, 2, 12000.00, '2024-03-05', 'Pending'),
(3, 3, 8000.00, '2024-01-30', 'Rejected'),
(4, 4, 9500.00, '2024-02-10', 'Approved'),
(5, 5, 4000.00, '2024-02-25', 'Pending');

