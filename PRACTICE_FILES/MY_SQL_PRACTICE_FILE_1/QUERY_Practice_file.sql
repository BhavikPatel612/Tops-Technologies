# 1) How do you create a new database in MySQL?
create database practice;
#This command creates a new database named practice.

# 2) How do you switch to a specific database?
use practice;
#Switching to the 'practice' database for all further operations.

# 3) How do you create a table with specific column data types?
create table student(s_id int,s_name varchar(30),s_age int);
# Creating a table 'student' with ID, name, and age fields.

# 4) How do you insert multiple records into a table?
insert into student values (1,"bhavik",29),(2,"arvind",60),(3,"nayna",56);
# Inserting 3 student records into 'student'.

# 5) How do you duplicate a table with data in SQL?
create table student1 select * from student;
# Creating a new table 'student1' by copying data from 'student'.

# 6) How to delete a specific row from a table?
delete from student1 where s_id=3; 
# Deleting the record with s_id=3 from 'student1'.

# 7) Remove only data from table?  
truncate table student1; 
# Removing all data from 'student1' (faster, no rollback).

# 8) How do you add a primary key to an existing table?
alter table student add primary key(s_id);
#  Adding primary key constraint on 's_id' in 'student'.

# 9) How do you update a record in SQL?
update student set s_name="neeta" where s_id=3;
#  Updating student name to 'neeta' where s_id is 3.

# 10) How do you use GROUP BY in SQL?
select age,count(pclass) from titanic group by age;
#  Counting passengers per age from Titanic data.

# 11) How do you sort grouped SQL data?
select age,count(pclass) from titanic group by age order by age;
# Counting passengers per age, sorted ascending.

# 12) How do you apply LIMIT with GROUP BY?
select age,count(pclass) from titanic group by age order by age limit 7;
#  Top 7 youngest age groups with passenger counts.

# 13) How do you fetch top N highest values?
select age,count(pclass) from titanic group by age order by age desc limit 7;
#  Top 7 oldest age groups with passenger counts.

# 14) How do you get unique combinations of columns in SQL?
select distinct age,pclass from titanic;
# Getting unique age and class combinations.

# 15) What does SELECT DISTINCT * do?
select distinct * from titanic order by age ;
# Getting unique rows from Titanic table sorted by age.

# 16) How do you sort distinct data in descending order?
select distinct * from titanic order by age desc;
#  Fetching unique records sorted by age descending.

# 17) How to apply LIMIT on distinct sorted data?
select distinct * from titanic order by age limit 7;
#  Fetching 7 unique youngest passengers.

# 18) How to filter records using AND condition?
select * from titanic where age =35 and pclass=3;
# Finding passengers aged 35 in 3rd class.

# 19) How to apply NOT with AND in SQL?
select * from titanic where not(age =35 and pclass=3);
#  Excluding passengers who are 35 and in 3rd class.

# 20) How to filter data with OR condition?
select * from titanic where age =35 or age=22;
#  Finding passengers who are either 35 or 22 years old.

# 21) How to use NOT with OR?
select * from titanic where not(age =35 or age=22);
#  Excluding passengers aged 35 or 22.

# 22) What is the use of IN clause in SQL?
select * from titanic where age in(5,10,15,20,25,30);
#  Filtering passengers of specific ages.

# 23) How to exclude multiple values using NOT IN?
select * from titanic where age not in(5,10,15,20,25,30);
#  Excluding passengers of certain ages.

# 24) Can we do arithmetic operations in SELECT?
SELECT  
    survived, 
    Pclass,  
    (survived + Pclass) AS addition,  
    (survived * Pclass) AS multiplication,  
    (survived - Pclass) AS subtraction,  
    (survived / Pclass) AS division  
FROM titanic; 
#  Performing arithmetic between survived and pclass.

# 25) How do you describe the structure of a table in SQL?
describe titanic;
#  Describing columns and data types of Titanic table.

# 26)  How to add an ENUM column?
alter table student add column gender enum("f","m","o");
# Adding gender ENUM column to student.

# 27) How to extract parts from a date in SQL?
SELECT 
    start_date,
    YEAR(start_date) AS year,
    MONTH(start_date) AS month,
    DAY(start_date) AS day
FROM project;
#  Extracting year, month, day from project start date.

# 28) How to use CONCAT with date?
SELECT 
    start_date,
    CONCAT(
        YEAR(start_date), "/", 
        MONTH(start_date), "/", 
        DAY(start_date)
    ) AS day
FROM project;
#  Concatenating date parts with slashes.

# 29)  What is CONCAT_WS used for?
SELECT 
    start_date,
    CONCAT_WS("-", YEAR(start_date), MONTH(start_date), DAY(start_date)) AS day
FROM project;
# Concatenating date parts using dash as separator.

# 30) How to split date using string functions?
SELECT 
    start_date,
    LOCATE("-", start_date) AS first_dash_position,
    LEFT(start_date, 4) AS year,
    REPLACE(MID(start_date, 6, 2), " ", "-") AS month,
    RIGHT(start_date, 2) AS day
FROM project;
#  Breaking down start_date using locate, left, mid, right.

# 31) How to reconstruct a date string?
SELECT 
    start_date,
    CONCAT(
        LEFT(start_date, 4), "-", 
        REPLACE(MID(start_date, 6, 2), " ", "-"), "-", 
        RIGHT(start_date, 2)
    ) AS s_date
FROM project;
#  Creating a formatted date string using parts.

# 32) How to add auto-increment column to an existing table?
alter table student add column s_index int primary key auto_increment first;
#  Adding 's_index' as primary key with auto-increment at first position.

# 33)  How to define primary key during table creation?
create table parent (p_id int primary key,p_name text,p_age int);
#  Creating parent table with p_id as primary key.

# 34) How to create foreign key with primary key?
CREATE TABLE child (
    c_id INT PRIMARY KEY,
    c_name TEXT,
    c_age INT,
    p_id INT,
    FOREIGN KEY (c_id) REFERENCES parent(p_id)
);
#  Creating child table with foreign key on c_id referencing parent.

# 35) write a inner jion query in my sql?
select * from parent inner join child on child.c_id=parent.p_id;
# Returning matching rows from both parent and child tables.

# 36) write a left jion query in my sql?
select * from parent left join child on child.c_id=parent.p_id;
#  Returning all rows from parent, matched rows from child

# 37) write a right jion query in my sql?
select * from parent right join child on child.c_id=parent.p_id;
#  Returning all rows from child, matched rows from parent.

# 38)  How to use CASE WHEN THEN in SQL?
select *,
case 
when age>18 then "allow voting"
when age=18 then  "welcome to 18"
else "not allowed for voting" end
as voting_for_permition from titanic;
# Using CASE to create a column for voting permission.

# 39) How to delete records based on condition?
delete from titanic where age>18;
#  Deleting all Titanic records with age > 18.

# 40)  What is the use of CHECK constraint?
alter table titanic  add check(age<=18);
#  Adding condition that age must be less than or equal to 18.

# 41) How to get length of string in SQL?
select name,length(name) from titanic;
# Fetching name and its length.

# 42) What does TRIM function do?
select trim(name),length(trim(name)) from titanic;
#  Removing leading/trailing spaces and measuring length.

# 43) How to create a user in MySQL?
create user bhavik123 identified by "bhavik@123";
#  Creating user with username and password.

# 44) How to grant permissions to a user?
grant select,delete on practice.* to bhavik123;
#  Granting SELECT and DELETE privileges to user.

# 45) How to revoke user permissions in MySQL?
revoke select,delete on practice.* from bhavik123;
# Revoking SELECT and DELETE from user.

# 46)  How to add interval to date in SQL?
SELECT 
    start_date, 
    ADDDATE(start_date, INTERVAL 2 MONTH) AS extend2month
FROM project;
#  Extending date by 2 months.

# 47) How to calculate date difference in months?
SELECT 
    start_date,
    ADDDATE(start_date, INTERVAL 2 MONTH) AS extend2month,
    DATEDIFF(
        ADDDATE(start_date, INTERVAL 2 MONTH), 
        start_date
    ) / 30 AS s_month
FROM project;
#  Finding months between start date and extended date.

# 48) How to add years to date?
SELECT 
    start_date, 
    ADDDATE(start_date, INTERVAL 2 YEAR) AS extend2month 
FROM project;
#  Extending date by 2 years.

# 49) How to calculate year difference between two dates?
SELECT 
    start_date,
    ADDDATE(start_date, INTERVAL 2 YEAR) AS extend2year,
    TIMESTAMPDIFF(
        YEAR,
        start_date,
        ADDDATE(start_date, INTERVAL 2 YEAR)
    ) AS s_year
FROM project;
#  Getting year difference using TIMESTAMPDIFF.

# 50) Which rows will be shown in the view titan?
create view titan as select * from titanic where age<15;
# All passengers from the titanic table whose age < 15 will be shown in the view.

# 51) How to create table with custom column names?
create table student1(r_id int,r_name text,r_age int);
#  Creating table student1 with r_id, r_name, r_age.

# 52) How to create second table with different naming?
create table student2 (t_id int ,t_name text,t_age int);
#  Creating table student2.

# 53) What does this store procedure do?
delimiter //
create procedure stud  (in id int,in name text,in age int)
begin
insert into student1 (s_id,s_name,s_age)
values (id,name,age);
insert into student2 (t_id,t_name,t_age)
values (id,name,age);
end //
delimiter ;
# Procedure to insert data into student1 and student2.

# 54) What does this trigger do?
delimiter //
create trigger study5
after insert on student1
for each row
begin
insert into student2 (t_id,t_name,t_age)
values(new.r_id,new.r_name,new.r_age);
end //
delimiter ;
# Whenever a new row is inserted into student1, this trigger automatically inserts the same data into student2.








