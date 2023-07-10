create database Healthcare;

-- Creating and using a Database 
use Healthcare;

-- Creating Patient Table 

create table patient ( 
p_id int primary key ,
name varchar(30),
address varchar(100),
DOB varchar(20),
contact_info int 
);

-- Creating Medical History Table 

create table medicalHistory (
record_id int primary key ,
diagnosis varchar(100),
p_id int ,
treatment varchar(200),
surgeries varchar(50),
medications varchar(100)
);


-- Creating Prescriptions Table 

create table prescription (
p_id int ,
medication_name varchar(20),
dosage varchar(10),
frequency varchar(10)
);

-- creating Outcome Table 

create table outcome (
p_id int ,
readmission_rates_percentage int ,
medical_adherance int 
);

-- creating Lab Results Table 

create table lab_results (
blood_tests int ,
urine_test int , 
imaging_test int 
);

-- Querying the Database


alter table patient modify column contact_info varchar(25);
 
alter table medicalHistory add constraint foreign key(p_id) references patient(p_id);
 
ALTER TABLE lab_results
MODIFY COLUMN blood_tests varchar(200) ;

create table Outcomes (
p_id int,
readmission_rates int ,
medical_adherance int 
);

INSERT INTO patient (p_id, name, address, DOB, contact_info) 
VALUES 
(1, 'John Doe', '123 Main Street', '1990-05-15', 1234567890),
(2, 'Jane Smith', '456 Park Avenue', '1985-09-22', 2345678901),
(3, 'Michael Johnson', '789 Elm Road', '1982-11-30', 3456789012),
(4, 'Emily Williams', '567 Oak Lane', '1992-03-12', 4567890123),
(5, 'David Brown', '901 Pine Court', '1988-07-08', 5678901234);

INSERT INTO medicalHistory (record_id, diagnosis, p_id, treatment, surgeries, medications) 
VALUES 
(1, 'Flu', 1, 'Rest and fluids', 'None', 'Ibuprofen'),
(2, 'Fractured Arm', 2, 'Cast', 'Arm cast', 'Painkillers'),
(3, 'Pneumonia', 3, 'Antibiotics', 'None', 'Amoxicillin'),
(4, 'Migraine', 4, 'Dark room rest', 'None', 'Acetaminophen'),
(5, 'Appendicitis', 5, 'Surgery', 'Appendectomy', 'Antibiotics');

ALTER TABLE prescription MODIFY COLUMN frequency varchar(20);




INSERT INTO prescription (p_id, medication_name, dosage, frequency) 
VALUES 
(1, 'Ibuprofen', '200mg', 'As needed'),
(2, 'Painkillers', '10mg', 'Every 4 hours'),
(3, 'Amoxicillin', '500mg', 'Twice a day'),
(4, 'Acetaminophen', '500mg', 'Every 6 hours'),
(5, 'Antibiotics', '250mg', 'Three times a day');

insert into Outcomes(p_id, readmission_rates, medical_adherance)
values
(1, 5, 90),
(2, 10, 80),
(3, 8, 95),
(4, 15, 70),
(5, 3, 98);

INSERT INTO lab_results (blood_tests, urine_test, imaging_test) 
VALUES 
(120, 8, 2),
(110, 5, 1),
(100, 6, 3),
(140, 7, 4),
(115, 9, 2);

