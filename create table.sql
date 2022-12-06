 CREATE TABLE person(
 person_id bigint ,
name text,
age double,
gender text,
 job_id text,
 account_id text,
 PRIMARY KEY (person_id));
-- drop table person

select * from jobs


CREATE TABLE jobs(
Job_id int,
Job_title text,
Emloyement_num text,
Employement_per_1000_jobs double,
Median_hourly_wage text,
Mean_hourly_wage text,
Annual_mean_wage text,
Job_Location VARCHAR(255),
PRIMARY KEY (Job_id)
);
 
CREATE table taxes(
tax_id int,
location text,
tax_rate text, 

PRIMARY KEY (tax_id)
);



CREATE table savings_account(
account_no varchar(255), 
savings_amount varchar(255),
PRIMARY KEY (account_no));

drop table savings_account
select * from jobs
-- PREPARE stmt FROM 'INSERT INTO `dmdd_project`.`jobs` (`Job_id`,`Job_title`,`Emloyement_num`,`Employement_per_1000_jobs`,`Median_hourly_wage`,`Mean_hourly_wage`,`Annual_mean_wage`,`Job_Location`) VALUES(?,?,?,?,?,?,?,?)'
