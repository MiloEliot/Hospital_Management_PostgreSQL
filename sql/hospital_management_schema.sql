-- create a new domain for email address
create extension if not exists CITEXT;

drop domain if exists email_address; 

create domain email_address as CITEXT
	check (value~'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');


-- import patients.csv
drop table if exists patients;

create table patients (
	patient_id text check (patient_id~'^P[0-9]+$') primary key,
	first_name text,
	last_name text,
	gender text,
	date_of_birth date,
	contact_number bigint,
	address text,
	registration_date date,
	insurance_provider text,
	insurance_number text,
	email email_address
);

copy patients(patient_id, first_name, last_name, gender, date_of_birth, contact_number, address, registration_date, insurance_provider, insurance_number, email)
from './data/patients.csv'
delimiter ','
csv header;



-- import doctors.csv
drop table if exists doctors;

create table doctors (
	doctor_id text check(doctor_id~'^D[0-9]+$') primary key,
	first_name text,
	last_name text,
	specialization text,
	phone_number bigint,
	years_experience int,
	hospital_branch text,
	email email_address
);

copy doctors(doctor_id, first_name, last_name, specialization, phone_number, years_experience, hospital_branch, email)
from './data/doctors.csv'
delimiter ','
csv header;



-- import appointments.csv
drop table if exists appointments;

create table appointments (
	appointment_id text check(appointment_id~'^A[0-9]+$') primary key,
	patient_id text references patients(patient_id)
		on delete no action
		on update cascade,
	doctor_id text references doctors(doctor_id)
		on delete no action
		on update cascade,
	appointment_date date,
	appointment_time time,
	reason_for_visit text,
	status text
);

copy appointments(appointment_id, patient_id, doctor_id, appointment_date, appointment_time, reason_for_visit, status)
from './appointments.csv'
delimiter ','
csv header;


-- import treatments.csv
drop table if exists treatments;

create table treatments (
	treatment_id text check (treatment_id~'^T[0-9]+$') primary key,
	appointment_id text references appointments(appointment_id)
		on delete cascade
		on update cascade,
	treatment_type text,
	description text,
	cost numeric,
	treatment_date date
);

copy treatments(treatment_id, appointment_id, treatment_type, description, cost, treatment_date)
from './data/treatments.csv'
delimiter ','
csv header;



-- import billing.csv
drop table if exists billing;

create table billing(
	bill_id text check(bill_id~'^B[0-9]+$') primary key,
	patient_id text references patients(patient_id)
		on delete no action 
		on update cascade,
	treatment_id text references treatments(treatment_id)
		on delete no action
		on update cascade,
	bill_date date,
	amount numeric,
	payment_method text,
	payment_status text
);

copy billing(bill_id, patient_id, treatment_id, bill_date, amount, payment_method, payment_status)
from './data/billing.csv'
delimiter ','
csv header;















