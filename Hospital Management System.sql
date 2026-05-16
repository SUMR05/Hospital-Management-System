drop DATABASE hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;
CREATE TABLE Patients (
patient_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
age INT,
gender VARCHAR(10),
phone VARCHAR(15),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Doctors (
doctor_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100),
specialization VARCHAR(100),
phone VARCHAR(15)
);
CREATE TABLE Appointments (
appointment_id INT PRIMARY KEY AUTO_INCREMENT,
patient_id INT,
doctor_id INT,
appointment_date DATETIME,
status VARCHAR(20) DEFAULT 'Scheduled',
FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Prescriptions (
prescription_id INT PRIMARY KEY AUTO_INCREMENT,
appointment_id INT,
medicine TEXT,
notes TEXT,
FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);
INSERT INTO Patients (name, age, gender, phone) VALUES
('Ravi', 25, 'Male', '9999999999'),
('Anjali', 30, 'Female', '8888888888');
INSERT INTO Doctors (name, specialization, phone) VALUES
('Dr. Kumar', 'Cardiology', '7777777777'),
('Dr. Meena', 'General', '6666666666');
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status) VALUES
(1,1,'2026-04-18 10:00:00','Completed'),
(2,2,'2026-04-18 11:00:00','Scheduled');
INSERT INTO Prescriptions (appointment_id, medicine, notes) VALUES
(1,'Paracetamol','Take twice daily');
-- Doctor schedule
SELECT d.name AS doctor, a.appointment_date, a.status
FROM Appointments a
JOIN Doctors d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;
-- patient history
SELECT p.name, d.name AS doctor, a.appointment_date, pr.medicine
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
LEFT JOIN Prescriptions pr ON a.appointment_id = pr.appointment_id
WHERE p.patient_id = 1;
-- most visited dictors
SELECT d.name, COUNT(a.appointment_id) AS total_visits
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
ORDER BY total_visits DESC;
ALTER TABLE Patients
ADD CONSTRAINT chk_age CHECK (age > 0);