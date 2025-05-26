-- ✅ Create employees table
CREATE TABLE employees (
    emp_id INT,                     -- Employee ID
    emp_name VARCHAR(50),          -- Employee Name
    dept_id INT                    -- Department ID (foreign key reference)
);

-- ✅ Create departments table
CREATE TABLE departments (
    dept_id INT,                   -- Department ID
    dept_name VARCHAR(50)         -- Department Name
);

-- ✅ Insert sample data into employees table
INSERT INTO employees VALUES (1, 'John Doe', 101);
INSERT INTO employees VALUES (2, 'Jane Smith', 102);

-- ✅ Insert sample data into departments table
INSERT INTO departments VALUES (101, 'Human Resources');
INSERT INTO departments VALUES (102, 'Marketing');

-- ✅ View all data
SELECT * FROM employees;
SELECT * FROM departments;

-- ✅ CROSS JOIN
-- Returns Cartesian product: every employee combined with every department
-- Total rows = (#employees × #departments) = 2 × 2 = 4 rows
SELECT * 
FROM employees
CROSS JOIN departments;

-- ✅ NATURAL JOIN
-- Automatically joins tables using **columns with the same name** (here: dept_id)
-- Make sure both tables have a column with the same name and compatible data types
-- Only rows with matching dept_id will appear
SELECT * 
FROM employees
NATURAL JOIN departments;

-- ⚠️ Note:
-- NATURAL JOIN can be risky if there are unintended matching column names.
-- Safer to use `JOIN ON` for clarity and control.
-- Example safer alternative:
-- SELECT * FROM employees e
-- JOIN departments d ON e.dept_id = d.dept_id;
