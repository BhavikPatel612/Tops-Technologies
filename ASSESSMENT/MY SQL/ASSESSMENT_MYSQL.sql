# ASSESSMENT MYSQL
# Question 1. DA - SQL - Introduction and Getting started with sql 
USE SAMPLE_TABLE_WORKER;
select * from worker;    #show the worker table information.

/*(1). Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
Ascending and DEPARTMENT Descending. */
select * from worker order by first_name asc ,department desc;
--  Print all Worker details ordered by FIRST_NAME (ascending) and DEPARTMENT (descending)

/*(2).Write an SQL query to print details for Workers with the first names      
from the Worker table “Vipul” and “Satish”. */
select * from worker where first_name in ("vipul","satish");
--  Print details for Workers with FIRST_NAME “Vipul” or “Satish”

/*(3). Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets. */
select * from worker where first_name like "_____h" ;
--  Print details of Workers whose FIRST_NAME ends with ‘h’ and is exactly 6 characters long

/*(4). Write an SQL query to print details of the Workers whose SALARY lakh between 1.*/
select * from worker where salary between  1 and 100000;
--  Print details of Workers whose SALARY is between 1 and 100000

/*(5). Write an SQL query to fetch duplicate records having matching data in some fields of a table.*/
select salary, count(worker_id) from worker group by salary having count(worker_id) > 1
order by salary;
--  Fetch duplicate salary records

/*(6). Write an SQL query to show the top 6 records of a table.*/ 
 select * from worker order by worker_id limit 6;
 --  Show top 6 records from the Worker table
 
 
 /*(7). Write an SQL query to fetch the departments that have less than five people in them.*/ 
select  department,count(worker_id) from worker group by department having count(worker_id)< 5 order by department;
--  Fetch departments that have fewer than five workers

/*(8). Write an SQL query to show all departments along with the number of people in there.*/
select  department,count(worker_id) from worker group by department;
--  Show all departments with number of workers in each 

/*(9). Write an SQL query to print the name of employees having the highest salary in each department.*/
 select first_name,salary,department  from worker where (department,salary) in (select department,max(salary) from worker group by department);
 -- Print names of employees with the highest salary in each department

# Question 2: Open school database, then select student table and use following SQL statements. 
# TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT  
create database school;
use school;

/*(1) To display all the records form STUDENT table.*/
select * from student;
--  Display all records from STUDENT table

/*(2) To display any name and date of birth from the table STUDENT.*/
SELECT Std_Name, DOB FROM student ; 
--  Display student names and dates of birth

/*(3)To display all students record where percentage is greater of equal to 80 FROM student table.*/
SELECT * FROM student WHERE percentage >= 80;  
--  Display students with percentage >= 80

/*(4)To display student name, stream and percentage where percentage of student is more than 80.*/ 
SELECT  Std_Name, Stream, Percentage from student WHERE percentage > 80;
--  Display names, streams, and percentages of students with percentage > 80

/*(5) To display all records of science students whose percentage is more than 75 form student table.*/ 
SELECT * From student WHERE stream = "Science" AND percentage > 75;
--  Display science students with percentage > 75











