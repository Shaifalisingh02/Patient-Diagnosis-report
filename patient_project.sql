create database patients;
use patients;

# QUERY 1
create table patients_table(
p_date date,
patient_id varchar(20),
patient_name char,
age int,
weight float,
gender char,
location char,
phone_number int,
disease char,
doctor_name char,
doctor_id int);

# QUERY 2 INSERTING VALUES IN TABLE

alter table patients_table modify p_date datetime;
alter table patients_table modify patient_name char(100); 
alter table patients_table modify gender char(100),modify location char(100),modify disease char(100),modify doctor_name char(100);

insert into patients_table (p_date,patient_id,patient_name,age,weight,gender,location,phone_number,disease,doctor_name,doctor_id)
values
('2019-06-15','AP2021','Sarath','67','76','Male','chennai','5462829','Cardiac','Mohan','21'),
('2019-02-13','AP2022','John','62','80','Male','banglore','1234731','Cancer','Suraj','22'),
('2018-01-08','AP2023','Henry','43','65','Male','Kerala','9028320','Liver','Mehta','23'),
('2020-02-4','AP2024','Carl','56','72','Female','Mumbai','9293829','Asthma','Karthik','24'),
('2017-09-15','AP2025','Shikar','55','71','Male','Delhi','7821281','Cardiac','Mohan','21'),
('2018-07-22','AP2026','Piysuh','47','59','Male','Haryana','8912819','Cancer','Suraj','22'),
('2017-03-25','AP2027','Stephen','69','55','Male','Gujarat','8888211','Liver','Mehta','23'),
('2019-04-22','AP2028','Aaron','75','53','Male','Banglore','9012192','Asthma','Karthik','24');

select * from patients_table;
alter table patients_table modify p_date date;

# QUERY 3
select patient_name from patients_table
where  length(patient_name);

#QUERY 4
SELECT  patient_id, patient_name, gender,disease, MAX(age)
from patients_table;

# query 5
SELECT patient_id,patient_name,p_date from patients_table;

# Query 6
select patient_name as old_patient_name, upper(patient_name) as new_patient_name
from patients_table;

# Query 7
select patient_name , length(patient_name) as length_of_name from patients_table;

# QUERY 8
SELECT patient_name,
case when gender='Male' then 'M' when gender='Female' then 'F' end
from patients_table;

#Query 9
select patient_name,doctor_name, concat(patient_name,doctor_name) as new_column 
from patients_table;

# Query 10
select age,log10(age) as log_val
from patients_table;

# QUERY 11
select * , extract(year from p_date) as Years
from patients_table;

# QUERY 12
select patient_name,doctor_name, case when patient_name=doctor_name then 'NULL' else patient_name end as newcol 
from patients_table;

# QUERY 13
select patient_name,age, case when age>50 then 'YES' else 'NO' end as OLDER
from patients_table;

# QUERY 14
select doctor_name,count(*) as duplicates 
from patients_table
group by doctor_name
having count(*)>1;
