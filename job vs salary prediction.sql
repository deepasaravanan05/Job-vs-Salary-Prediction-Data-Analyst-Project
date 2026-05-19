#Crete a database
CREATE DATABASE my_database;
SHOW DATABASES;

#Use the same datbase 
USE my_database;


#Create Table
CREATE TABLE mytable(
   id INT PRIMARY KEY AUTO_INCREMENT,
   job_title VARCHAR(100),
   experience INT,
   salary float
   );
   
#Check Table
SHOW TABLES;

SELECT * FROM mytable;

#1.Find employees with more than 5 years of experience
SELECT *
FROM mytable
WHERE experience_years > 5;

#2.Find employees earning more than 100000
SELECT *
FROM mytable
WHERE salary > 100000;

#3.Display employees working remotely
SELECT *
FROM mytable
WHERE remote_work = 'Yes';

#4.Find employees with Bachelor's degree
SELECT *
FROM mytable
WHERE education_level = 'Bachelor';

#5.Sort employees by highest salary
SELECT *
FROM mytable
ORDER BY salary DESC;

#6.Find the maximum salary
SELECT MAX(salary) AS highest_salary
FROM mytable;

#7.Find employees from Bangalore
SELECT *
FROM mytable
WHERE location = 'Bangalore';

#8.Count employees based on company size
SELECT company_size, COUNT(*) AS total
FROM mytable
GROUP BY company_size;

#9.Find employees earning above average salary
SELECT *
FROM mytable
WHERE salary > (
    SELECT AVG(salary)
    FROM mytable
);

#10.Find industries with average salary greater than 80000
SELECT industry, AVG(salary) AS avg_salary
FROM mytable
GROUP BY industry
HAVING AVG(salary) > 80000;

#11.Find remote employees earning more than 90000
SELECT *
FROM mytable
WHERE remote_work = 'Yes'
AND salary > 90000;

#12.Find the industry with highest average salary
SELECT industry, AVG(salary) AS avg_salary
FROM mytable
GROUP BY industry
ORDER BY avg_salary DESC
LIMIT 1;

#13.Find the second highest salary
SELECT MAX(salary) AS second_highest_salary
FROM mytable
WHERE salary < (
    SELECT MAX(salary)
    FROM mytable
);

#14.Find employees with both remote work and certifications
SELECT *
FROM mytable
WHERE remote_work = 'Yes'
AND certifications > 0;

#15.Find industries having more than 10 employees
SELECT industry, COUNT(*) AS total_employees
FROM mytable
GROUP BY industry
HAVING COUNT(*) > 10;

#16.Use CASE statement to categorize salary
SELECT 
    job_title,
    salary,
    CASE
        WHEN salary >= 120000 THEN 'High Salary'
        WHEN salary >= 70000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM mytable;

