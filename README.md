# USA-Salary-Indicator

ASSIGNMENT-3
TOPIC: USA SALARY INDICATOR
Conceptual diagram:

![image](https://user-images.githubusercontent.com/63634756/205785718-88e476ff-9054-4ebd-b47a-8dc80b1f66d3.png)

 
Objective: 
•	Help individuals achieve the optimal job and location.
•	Users would be able to choose variables such as age, sex, and profession.
•	It accounts for salaries, and savings (net_pay).
•	Additional features include taxes on various occupations in different states.


2) 
•	We scrapped the data from bls website for USA and downloaded it into the csv file. 
•	For persons table, we downloaded the data from Kaggle as it contains person_id, age, gender, account_no, etc so there was no real time data but the persons data was already available on Kaggle so we downloaded the csv file. For savings account table we retrieved the data from Kaggle.
•	For taxes table we downloaded and reformatted the data from BLS website. 
Scrappig screenshots:
     

Cleaning screenshots: The scripts to clean the data are in the screenshots.
![image](https://user-images.githubusercontent.com/63634756/205785801-f8e1aa8b-64f5-4940-8031-96b07b5a60f1.png)
![image](https://user-images.githubusercontent.com/63634756/205785831-324a40e1-c55c-4e43-b72a-7c80d8f5c666.png)
![image](https://user-images.githubusercontent.com/63634756/205785864-27e643a9-f3e8-436c-aa72-468a6c741d16.png)
![image](https://user-images.githubusercontent.com/63634756/205785873-3e1ad46c-9550-4b11-a117-871c6797d8cb.png)
![image](https://user-images.githubusercontent.com/63634756/205785886-1218d97c-f2ce-47dc-ab3d-5638a76016a9.png)




Cleaning of person table:

 
![image](https://user-images.githubusercontent.com/63634756/205785922-7b1e14ef-2e60-4d08-9fc2-71287735cd04.png)
![image](https://user-images.githubusercontent.com/63634756/205785937-cad45402-5409-4583-b8ab-cc4013148837.png)
![image](https://user-images.githubusercontent.com/63634756/205785945-d2e2e292-3194-4a55-8b0d-430260bdd1e2.png)
![image](https://user-images.githubusercontent.com/63634756/205785953-26ba6bfd-99cc-4fc2-95f1-389032d038fc.png)
![image](https://user-images.githubusercontent.com/63634756/205785959-a1c715c6-9b40-4b9a-a1b5-9c13db98f2ed.png)
![image](https://user-images.githubusercontent.com/63634756/205785969-af113563-32a7-47a5-8572-735a62b7311c.png)
![image](https://user-images.githubusercontent.com/63634756/205785981-13f5e0de-0e09-48af-8a23-901161bdd6ea.png)
![image](https://user-images.githubusercontent.com/63634756/205785992-c4427575-2b35-403c-b3e7-2795c6f08f89.png)
![image](https://user-images.githubusercontent.com/63634756/205786001-62ca971e-c283-4b71-8884-0fdfc2d15bdc.png)
![image](https://user-images.githubusercontent.com/63634756/205786014-ff526d41-306d-4a40-a39c-ae3c079c3a8f.png)
![image](https://user-images.githubusercontent.com/63634756/205786024-2dce0e36-51ff-4203-a501-e1aeb0158814.png)
![image](https://user-images.githubusercontent.com/63634756/205786038-ef32490e-e29a-4044-9de6-e18d833d01ff.png)


 


 


Data visualization: 
 
 ![image](https://user-images.githubusercontent.com/63634756/205786051-0d490453-d06e-4c9e-aeeb-5b65062c7606.png)
![image](https://user-images.githubusercontent.com/63634756/205786067-cee10399-22bc-4469-a38e-7b1b19048ec8.png)
![image](https://user-images.githubusercontent.com/63634756/205786079-11e6e78e-bbc4-4a54-949d-aa6c31262c7e.png)
  ![image](https://user-images.githubusercontent.com/63634756/205786116-17983b30-e2c1-4150-bd9a-1bf859686138.png)
![image](https://user-images.githubusercontent.com/63634756/205786121-807cfb49-d52a-4e67-8010-4e39d7b11d29.png)
![image](https://user-images.githubusercontent.com/63634756/205786135-b08d9f51-6ea7-4f83-a1cb-c6dcf243be31.png)
![image](https://user-images.githubusercontent.com/63634756/205786144-445fe7e2-f724-4d41-b27e-97106bcb3363.png)


 
 

 


 

 




CREATE TABLE SCRIPTS:

CREATE TABLE person(
person_id bigint ,
name text,
age double,
gender text,
 job_id text,
 account_id text,
 PRIMARY KEY (person_id));

CREATE TABLE job(
job_id int,
job_title text,
emloyement_num text,
employement_per_1000_jobs double,
median_hourly_wage text,
mean_hourly_wage text,
annual_mean_wage text,
job_location VARCHAR(255),
tax_id int,
PRIMARY KEY (job_id)
);



CREATE table taxes(
tax_id int,
location text,
tax_rate text, 

PRIMARY KEY (tax_id)
);




CREATE table savings(
account_no varchar(255), 
savings_amount varchar(255),
PRIMARY KEY (account_no));


Adding foreign key:
ALTER TABLE job
ADD CONSTRAINT fk_job FOREIGN KEY (tax_id)
REFERENCES taxes(tax_id);



ALTER TABLE person
ADD CONSTRAINT fk_person1 FOREIGN KEY (job_id)
REFERENCES job(job_id);

ALTER TABLE person
ADD CONSTRAINT fk4_Person FOREIGN KEY (account_no)
REFERENCES savings_account(account_no);


INSERT INTO :

INSERT INTO person
Values(1000, ‘pramita’, ‘22’, ‘F’, 1000, “A00099”)




USE CASES (NEW 5 PER PERSON)
Use-cases

1.	View the locations that have an average Salary of $50,000 along with name and gender.
SELECT j.job_location, P.name, P.gender, j.avg_salary 
FROM Person P
JOIN Job J
ON P.job_id = j.job_id
WHERE 
j.avg_salary > 50000;

2.	SQL query to find the count of the total occurrences of a particular character – ‘A’ in the Name field and the mean hourly wage.

SELECT j.mean_hourly_wage, P.name
FROM Person P
      JOIN Job J ON P.job_id = j.job_id
WHERE LENGTH(P.name) - LENGTH(REPLACE(P.name, 'A', ''));

3.	SQL query to find the tax rate of each job 
  SELECT J.job_name, T.tax_rate FROM jobs J
      INNER JOIN Taxes T
      ON J.tax_id=T.tax_id
      GROUP BY j.job_name;

4.	SQL Query to find the number of females, name, and savings amount.
SELECT P.name, Count(*), s.savings_amount FROM Person P
JOIN savings_account S
ON P.account_no=S.account_no
WHERE P.gender = ‘Female’;

5.	Display the males where the median hourly wage is NULL.
SELECT J.median_hourly_wage, P.name FROM Jobs J
JOIN Person P
ON P.job_id=J.job_id
WHERE P.gender = ‘male;

6.	SQL Query display all rows from both tables, populating the columns with table value. 
SELECT *
FROM Person
FULL OUTER JOIN Jobs
   ON Jobs.job_id = Person.job_id
ORDER BY Person.name ASC;

7.	SQL Query display all the information whose name start with C and location is either Arizona or Boston. 
   
SELECT Count(*), P.name FROM Person P
JOIN Jobs J
ON P.job_id=J.job_id
WHERE P.name LIKE ‘C%’and J.job_location IN (‘Arizona’ OR Boston’);

8.	SQL Query display all the name and the job name whose tax amount is greater than 1500.
SELECT P.name, J.job_name, T.tax_amount FROM Jobs J
JOIN Person P 
ON P.job_id=J.job_id
JOIN Taxes T
ON J.tax_id=T.tax_id WHERE T.tax_rate > 1500;
9.	Display the Job names and age of the entities who has the least savings amount. 
SELECT P.age, J.job_name, MIN(S.savings_amount) 
FROM Person P 
JOIN Job J 
ON  P.job_id = J.job_id
JOIN Savings_account S 
ON P.account_no = S.account_no;


10.	View the entity who has the highest tax rate.
SELECT COUNT(job_id), MAX(T.tax_rate)
FROM Jobs J 
JOIN Taxes T
ON T.tax_id = J.tax_id;

11.	Which age group has savings more than 1000. 

SELECT P.age, MAX(S.savings_amount)
FROM Person P 
JOIN Savings_account S 
ON P.account_no = S.account_no;

12.	Display names that end with an ‘A’ and have job ids with highest savings amount.
SELECT P.name,j.job_id, MAX(S.savings_amount)
FROM Person P 
JOIN Job J 
ON  P.job_id = J.job_id
      JOIN Savings_account S 
ON P.account_no = S.account_no
WHERE P.name LIKE ‘%A’
ORDER BY S.savings_amount DESC;


13.	Display the job locations that have the highest tax amount and median salary is less than $10,000.
SELECT j.job_location, MAX(T.tax_amount)
FROM Jobs J 
JOIN Taxes T 
ON  T.tax_id = J.tax_id
WHERE J.median_salary_wage > 10000;

14.	Display the number of jobs in each job location (Hint: using job name check which repeats the most and sort in the new table)
Ex: 	New York	5
Boston	8  
Chicago	10
California	25

SELECT job_name, COUNT(*)
FROM Jobs   
GROUP BY job_name;


15.	Display the names of the employees whose Occupation is Police and sort the Names in ascending order.
SELECT P.name, J.job_name
FROM Person P 
JOIN Jobs J
ON  P.job_id = J.job_id
WHERE J.job_name = ‘Police’
ORDER BY J.job_name ASC;



 Relational algebra for the use cases above:




1.	View the locations that have an average Salary of $50,000 along with name and gender.
SELECT j.job_location, P.name, P.gender, j.avg_salary 
FROM Person P
JOIN Job J
ON P.job_id = j.job_id
WHERE 
j.avg_salary > 50000;

2.	SQL query to find the count of the total occurrences of a particular character – ‘A’ in the Name field and the mean hourly wage.

SELECT j.mean_hourly_wage, P.name
FROM Person P
      JOIN Job J ON P.job_id = j.job_id
WHERE LENGTH(P.name) - LENGTH(REPLACE(P.name, 'A', ''));

3.	SQL query to find the tax rate of each job 
  SELECT J.job_name, T.tax_rate FROM jobs J
      INNER JOIN Taxes T
      ON J.tax_id=T.tax_id
      GROUP BY j.job_name;

4.	SQL Query to find the number of females, name, and savings amount.
SELECT P.name, Count(*), s.savings_amount FROM Person P
JOIN savings_account S
ON P.account_no=S.account_no
WHERE P.gender = ‘Female’;

5.	Display the males where the median hourly wage is NULL.
SELECT J.median_hourly_wage, P.name FROM Jobs J
JOIN Person P
ON P.job_id=J.job_id
WHERE P.gender = ‘male;

6.	SQL Query display all rows from both tables, populating the columns with table value. 
SELECT *
FROM Person
FULL OUTER JOIN Jobs
   ON Jobs.job_id = Person.job_id
ORDER BY Person.name ASC;

7.	SQL Query display all the information whose name start with C and location is either Arizona or Boston. 
   
SELECT Count(*), P.name FROM Person P
JOIN Jobs J
ON P.job_id=J.job_id
WHERE P.name LIKE ‘C%’and J.job_location IN (‘Arizona’ OR Boston’);

8.	SQL Query display all the name and the job name whose tax amount is greater than 1500.
SELECT P.name, J.job_name, T.tax_amount FROM Jobs J
JOIN Person P 
ON P.job_id=J.job_id
JOIN Taxes T
ON J.tax_id=T.tax_id WHERE T.tax_rate > 1500;
9.	Display the Job names and age of the entities who has the least savings amount. 
SELECT P.age, J.job_name, MIN(S.savings_amount) 
FROM Person P 
JOIN Job J 
ON  P.job_id = J.job_id
JOIN Savings_account S 
ON P.account_no = S.account_no;


10.	View the entity who has the highest tax rate.
SELECT COUNT(job_id), MAX(T.tax_rate)
FROM Jobs J 
JOIN Taxes T
ON T.tax_id = J.tax_id;

11.	Which age group has savings more than 1000. 

SELECT P.age, MAX(S.savings_amount)
FROM Person P 
JOIN Savings_account S 
ON P.account_no = S.account_no;

12.	Display names that end with an ‘A’ and have job ids with highest savings amount.
SELECT P.name,j.job_id, MAX(S.savings_amount)
FROM Person P 
JOIN Job J 
ON  P.job_id = J.job_id
      JOIN Savings_account S 
ON P.account_no = S.account_no
WHERE P.name LIKE ‘%A’
ORDER BY S.savings_amount DESC;


13.	Display the job locations that have the highest tax amount and median salary is less than $10,000.
SELECT j.job_location, MAX(T.tax_amount)
FROM Jobs J 
JOIN Taxes T 
ON  T.tax_id = J.tax_id
WHERE J.median_salary_wage > 10000;

14.	Display the number of jobs in each job location (Hint: using job name check which repeats the most and sort in the new table)
Ex: 	New York	5
Boston	8  
Chicago	10
California	25

SELECT job_name, COUNT(*)
FROM Jobs   
GROUP BY job_name;




15.	Display the names of the employees whose Occupation is Police and sort the Names in ascending order.
SELECT P.name, J.job_name
FROM Person P 
JOIN Jobs J
ON  P.job_id = J.job_id
WHERE J.job_name = ‘Police’
ORDER BY J.job_name ASC;
















 













