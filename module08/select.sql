-- How to make new table
---------------------------------------------
Create Table students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)

)

-- Insert dummy data to the selected table
-------------------------------------------------------

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES 
('Alice', 'Johnson', 20, 'A+', 'Computer Science', 'alice.johnson@example.com', '2004-03-15', 'O+', 'USA'),
('Bob', 'Smith', 22, 'B', 'Mechanical Engineering', 'bob.smith@example.com', '2002-07-22', 'A-', 'UK'),
('Charlie', 'Khan', 19, 'A', 'Business Studies', 'charlie.khan@example.com', '2005-01-10', 'B+', 'Canada'),
('Diana', 'Lee', 21, 'A-', 'Biotechnology', 'diana.lee@example.com', '2003-11-30', 'AB+', 'Australia'),
('Ethan', 'Garcia', 23, 'C+', 'Architecture', 'ethan.garcia@example.com', '2001-09-05', 'O-', 'Spain'),
('Fatima', 'Begum', 20, 'B+', 'Computer Science', 'fatima.begum@example.com', '2004-06-18', 'A+', 'Bangladesh'),
('George', 'Kim', 24, 'B-', 'Mathematics', 'george.kim@example.com', '2000-12-03', 'B-', 'South Korea'),
('Hannah', 'Brown', 22, 'A+', 'Computer Science', 'hannah.brown@example.com', '2002-02-28', 'O+', 'USA'),
('Ivan', 'Petrov', 23, 'A', 'Mechanical Engineering', 'ivan.petrov@example.com', '2001-08-17', 'A-', 'Russia'),
('Jasmine', 'Singh', 21, 'B+', 'Business Studies', 'jasmine.singh@example.com', '2003-05-12', 'B+', 'India'),
('Kyle', 'Martinez', 20, 'C', 'Architecture', 'kyle.martinez@example.com', '2004-09-30', 'O-', 'Spain'),
('Liam', 'Owen', 22, 'A-', 'Mathematics', 'liam.owen@example.com', '2002-11-22', 'AB+', 'UK'),
('Maria', 'Lopez', 19, 'A', 'Biotechnology', 'maria.lopez@example.com', '2005-04-09', 'O+', 'Mexico'),
('Nina', 'Rahman', 20, 'B', 'Computer Science', 'nina.rahman@example.com', '2004-12-15', 'A-', 'Bangladesh'),
('Oscar', 'Chen', 21, 'A+', 'Mathematics', 'oscar.chen@example.com', '2003-06-27', 'B+', 'China'),
('Priya', 'Mehta', 22, 'B-', 'Philosophy', 'priya.mehta@example.com', '2002-01-19', 'A+', 'India'),
('Quentin', 'Nguyen', 24, 'C+', 'Mechanical Engineering', 'quentin.nguyen@example.com', '2000-07-03', 'B-', 'Vietnam'),
('Rania', 'Ali', 21, 'A-', 'Business Studies', 'rania.ali@example.com', '2003-10-10', 'O+', 'Egypt'),
('Steve', 'Johnson', 23, 'B+', 'Computer Science', 'steve.johnson@example.com', '2001-03-03', 'A+', 'USA'),
('Tanya', 'Zhou', 20, 'A', 'Mathematics', 'tanya.zhou@example.com', '2004-08-08', 'O-', 'China');


-- How to use "TRUNCATE" keyword to remove the data without interrupt the table structure
-----------------------------------------------------------------------------------------
TRUNCATE table students;

-- Show the table data
----------------------------------------
Select * FROM students; -- here we used "*" to represent the word of everything, thats why we would get all the data of the selected table. however, if we didn't use the symbol "*", we would get the all the columns with null value other then actual data. 

-- How to get selected column data
--------------------------------------

SELECT first_name, age, country from students;

-- How to use "alias" for changing the actual name
-------------------------------------------------------

SELECT first_name as "Student Name" from students;
SELECT first_name as "firstName" from students;

-- How to use "ORDER BY" keyword for getting the table with "ascending" order "descending" order
-------------------------------------------------------------

SELECT * from students ORDER BY first_name ASC;
SELECT * from students ORDER BY first_name DESC;

-- How to use "DISTINCT" keyword
------------------------------------------------

SELECT DISTINCT  blood_group from students ORDER BY blood_group ASC;

-- How to use "" keyword
-------------------------------------------

SELECT * from students where blood_group = 'AB+'

-- How to use "AND" keyword
------------------------------------

Select * from students where grade = 'A+' AND course = 'Computer Science' AND first_name = 'Alice';

-- How to use "OR" keyword
-------------------------------------------------

Select * from students WHERE  country = 'USA' OR country = 'Canada' ORDER BY country ASC;

-- How to use several "AND", "OR" keywords simultaneously
---------------------------------------------------------------------
Select * from students WHERE (country = 'USA' OR country = 'Canada') AND age >= 20 AND age <= 22;
Select * from students WHERE  age != 20; -- != means "not equal"
Select * from students WHERE  age <> 20; -- <> also works as like !=


-- How to use "upper", "concat", "length" function
--------------------------------------------------------

SELECT upper(first_name) as "firstName", * from students;
SELECT concat(first_name, ' ' , last_name) as "fullName" from students;
SELECT length(first_name) as "firstNameLength" from students;

-- How to use "avg", "max", "min", "sum", "count" function
-------------------------------------

select avg(age) from students;
SELECT max(age) FROM students;
SELECT min(age) FROM students;
SELECT sum(age) FROM students;
SELECT count(*) FROM students;

-- How to use "NOT" keyword

SELECT * from students where not country = 'USA'; -- "NOT" keyword works similar to != or <>