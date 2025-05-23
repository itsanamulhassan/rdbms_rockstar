-- ✅ Create a new table to store student records
-- Use this when setting up your database schema
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,      -- Auto-incrementing unique ID for each student
    first_name VARCHAR(50) NOT NULL,    -- First name, cannot be null
    last_name VARCHAR(50) NOT NULL,     -- Last name, cannot be null
    age INT,                            -- Student's age
    grade CHAR(2),                      -- Grade (e.g., A+, B)
    course VARCHAR(50),                 -- Name of the course
    email VARCHAR(100),                 -- Email address
    dob DATE,                           -- Date of birth
    blood_group VARCHAR(5),             -- Blood group
    country VARCHAR(50)                 -- Country of origin
);

-- ✅ Insert data into the table
-- Use this to add student records
INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES 
('Alice', 'Johnson', 20, 'A+', 'Computer Science', 'alice.johnson@example.com', '2004-03-15', 'O+', 'USA'),
('Bob', 'Smith', 22, 'B', 'Mechanical Engineering', 'bob.smith@example.com', '2002-07-22', 'A-', 'UK'),
-- (more records below)...

-- ✅ Remove all rows from the table but keep its structure
-- Use this to quickly clear a table during testing
TRUNCATE TABLE students;

-- ✅ Select all columns and rows from the table
-- Use SELECT * to view complete data
SELECT * FROM students;

-- ✅ Select specific columns
-- Use when you only need particular columns
SELECT first_name, age, country FROM students;

-- ✅ Rename column in output using alias
-- Helps make results more readable
SELECT first_name AS "Student Name" FROM students;
SELECT first_name AS "firstName" FROM students;

-- ✅ Sort results alphabetically (ascending or descending)
-- Use ORDER BY to control row order
SELECT * FROM students ORDER BY first_name ASC;  -- A to Z
SELECT * FROM students ORDER BY first_name DESC; -- Z to A

-- ✅ Get unique values from a column
-- Use DISTINCT to avoid duplicates in results
SELECT DISTINCT blood_group FROM students ORDER BY blood_group ASC;

-- ✅ Filter rows using WHERE
-- Use WHERE to apply conditions to your query
SELECT * FROM students WHERE blood_group = 'AB+';

-- ✅ Use multiple conditions with AND
-- All conditions must be true
SELECT * FROM students 
WHERE grade = 'A+' AND course = 'Computer Science' AND first_name = 'Alice';

-- ✅ Use OR to match any condition
-- At least one condition must be true
SELECT * FROM students 
WHERE country = 'USA' OR country = 'Canada' 
ORDER BY country ASC;

-- ✅ Combine AND & OR with parentheses
-- Helps to group logic and avoid confusion
SELECT * FROM students 
WHERE (country = 'USA' OR country = 'Canada') 
AND age >= 20 AND age <= 22;

-- ✅ Check for NOT EQUAL
-- Use != or <> to exclude values
SELECT * FROM students WHERE age != 20;
SELECT * FROM students WHERE age <> 20;

-- ✅ Use string functions
-- Format or process text values
SELECT UPPER(first_name) AS "firstName", * FROM students;      -- Converts to uppercase
SELECT CONCAT(first_name, ' ', last_name) AS "fullName" FROM students; -- Joins first & last name
SELECT LENGTH(first_name) AS "firstNameLength" FROM students;  -- Counts characters

-- ✅ Use aggregate functions
-- Useful for statistics or summaries
SELECT AVG(age) FROM students;   -- Average value
SELECT MAX(age) FROM students;   -- Largest value
SELECT MIN(age) FROM students;   -- Smallest value
SELECT SUM(age) FROM students;   -- Total value
SELECT COUNT(*) FROM students;   -- Count of rows

-- ✅ Use NOT to reverse a condition
-- Helpful for excluding specific data
SELECT * FROM students WHERE NOT country = 'USA';

-- ✅ Filter based on NULL values
-- NULL means missing or unknown value
SELECT * FROM students WHERE email IS NULL;     -- Finds missing emails
SELECT * FROM students WHERE email IS NOT NULL; -- Finds valid emails

-- ✅ Replace NULL values with a default using COALESCE
-- COALESCE picks the first non-null value
SELECT COALESCE(email, 'not valid') AS "Email" FROM students;


-- ✅ Filter with multiple columns with "IN" keyword
-- "IN" works like multiple "OR" but syntax is more precise

SELECT * from students where country IN('USA', 'Canada');
SELECT * from students where country NOT IN('USA', 'Canada');

-- ✅ Filter with multiple columns with "BETWEEN" keyword
-- "BETWEEN" works like multiple "AND" but syntax is more precise

SELECT * FROM students where age BETWEEN 19 AND 20;
SELECT * FROM students where age NOT BETWEEN 19 AND 20;

-- ✅ Filter table using the "LIKE" keyword
-- Use "LIKE" to search for specific patterns in string columns (case-sensitive in some DBMS like PostgreSQL)
-- "%" matches any sequence of characters (including none)
-- "_" matches a single character

SELECT * FROM students 
WHERE first_name LIKE 'A%'; 
-- Finds names starting with 'A', e.g., 'Alice'

SELECT * FROM students 
WHERE first_name LIKE '%A'; 
-- Finds names ending with 'A', e.g., 'Nina'

SELECT * FROM students 
WHERE first_name LIKE '__a%'; 
-- Finds names where the third letter is 'A', e.g., 'Charlie' (3rd character is A)
