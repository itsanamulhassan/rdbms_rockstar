-- ✅ Create employees table with detailed columns
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,         -- Unique employee ID auto-incremented
    employee_name VARCHAR(50) NOT NULL,    -- Employee's full name (required)
    department_name VARCHAR(50),            -- Department employee belongs to
    salary DECIMAL(10, 2),                  -- Employee salary with 2 decimal places
    hire_date DATE                         -- Date when employee was hired
);

-- ✅ Insert multiple employees with various departments, salaries, and hire dates
INSERT INTO employees (employee_name, department_name, salary, hire_date) VALUES 
    ('John Doe', 'HR', 60000.00, '2022-01-10'),
    ('Jane Smith', 'Marketing', 75000.50, '2021-05-22'),
    ('Bob Johnson', 'Finance', 80000.75, '2020-11-15'),
    ('Alice Williams', 'IT', 90000.25, '2019-08-03'),
    ('David Lee', 'Sales', 65000.50, '2020-03-18'),
    ('Sara Brown', 'Engineering', 70000.00, '2021-09-28'),
    ('Mike Miller', 'Customer Support', 55000.75, '2022-02-05'),
    ('Emily Davis', 'Administration', 95000.00, '2018-12-12'),
    ('Chris Wilson', 'Research', 72000.50, '2020-06-30'),
    ('Amy White', 'Quality Assurance', 68000.25, '2021-11-09'),
    ('John Johnson', 'HR', 62000.00, '2022-01-15'),
    ('Jessica Thompson', 'Marketing', 78000.50, '2021-06-05'),
    ('Michael Harris', 'Finance', 85000.75, '2020-11-25'),
    ('Emma Martinez', 'IT', 92000.25, '2019-09-15'),
    ('James Taylor', 'Sales', 67000.50, '2020-04-08'),
    ('Sophia Anderson', 'Engineering', 72000.00, '2021-10-10'),
    ('William Jackson', 'Customer Support', 56000.75, '2022-02-10'),
    ('Olivia Nelson', 'Administration', 97000.00, '2018-12-20'),
    ('Daniel White', 'Research', 73000.50, '2020-07-05'),
    ('Ava Wilson', 'Quality Assurance', 69000.25, '2021-11-15'),
    ('Matthew Brown', 'HR', 63000.00, '2022-01-20'),
    ('Emily Garcia', 'Marketing', 76000.50, '2021-06-15'),
    ('Christopher Allen', 'Finance', 86000.75, '2020-12-05'),
    ('Madison Hall', 'IT', 93000.25, '2019-09-25'),
    ('Andrew Cook', 'Sales', 68000.50, '2020-04-18'),
    ('Abigail Torres', 'Engineering', 73000.00, '2021-10-20'),
    ('Ethan Murphy', 'Customer Support', 57000.75, '2022-02-15'),
    ('Ella King', 'Administration', 98000.00, '2018-12-28'),
    ('Nathan Rivera', 'Research', 74000.50, '2020-07-15'),
    ('Mia Roberts', 'Quality Assurance', 70000.25, '2021-11-20');

-- ✅ Select all employees to verify data insertion
SELECT * FROM employees;

-- ✅ Drop the table (cleanup)
DROP TABLE employees;

--------------------------------------------------------

-- ✅ Find employees whose salary is greater than the highest salary in HR department
-- Subquery (SELECT max(salary) FROM employees WHERE department_name = 'HR') gets max salary in HR
-- Main query selects employees with salary greater than that
SELECT * 
FROM employees 
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_name = 'HR') 
ORDER BY salary DESC;

-- ✅ Calculate total sum of all salaries across all employees
SELECT SUM(salary) FROM employees;

-- ✅ Select all employees along with total salary sum in a separate column (salary_sum)
-- This adds the total salary sum on each row for reference
SELECT *, (SELECT SUM(salary) FROM employees) AS salary_sum FROM employees;

-- ✅ Group employees by department and calculate total salary per department
SELECT department_name, SUM(salary) 
FROM employees 
GROUP BY department_name;

-- ✅ Select subquery returning department_name and total salary grouped by department
SELECT * FROM (
    SELECT department_name, SUM(salary) 
    FROM employees 
    GROUP BY department_name
) AS dept_salaries;

-- ✅ Select only department_name from the above subquery
SELECT department_name FROM (
    SELECT department_name, SUM(salary) 
    FROM employees 
    GROUP BY department_name
) AS dept_salaries;

-- ✅ Select employees whose department name contains letter 'R' (case-sensitive)
-- Uses subquery with LIKE '%R%' to filter department names having 'R'
-- Main query selects employees working in those departments
SELECT employee_name, salary, department_name 
FROM employees 
WHERE department_name IN (
    SELECT department_name FROM employees WHERE department_name LIKE '%R%'
);

-- ✅ Create employees table with detailed columns
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,         -- Unique employee ID auto-incremented
    employee_name VARCHAR(50) NOT NULL,    -- Employee's full name (required)
    department_name VARCHAR(50),            -- Department employee belongs to
    salary DECIMAL(10, 2),                  -- Employee salary with 2 decimal places
    hire_date DATE                         -- Date when employee was hired
);

-- ✅ Insert multiple employees with various departments, salaries, and hire dates
INSERT INTO employees (employee_name, department_name, salary, hire_date) VALUES 
    ('John Doe', 'HR', 60000.00, '2022-01-10'),
    ('Jane Smith', 'Marketing', 75000.50, '2021-05-22'),
    ('Bob Johnson', 'Finance', 80000.75, '2020-11-15'),
    ('Alice Williams', 'IT', 90000.25, '2019-08-03'),
    ('David Lee', 'Sales', 65000.50, '2020-03-18'),
    ('Sara Brown', 'Engineering', 70000.00, '2021-09-28'),
    ('Mike Miller', 'Customer Support', 55000.75, '2022-02-05'),
    ('Emily Davis', 'Administration', 95000.00, '2018-12-12'),
    ('Chris Wilson', 'Research', 72000.50, '2020-06-30'),
    ('Amy White', 'Quality Assurance', 68000.25, '2021-11-09'),
    ('John Johnson', 'HR', 62000.00, '2022-01-15'),
    ('Jessica Thompson', 'Marketing', 78000.50, '2021-06-05'),
    ('Michael Harris', 'Finance', 85000.75, '2020-11-25'),
    ('Emma Martinez', 'IT', 92000.25, '2019-09-15'),
    ('James Taylor', 'Sales', 67000.50, '2020-04-08'),
    ('Sophia Anderson', 'Engineering', 72000.00, '2021-10-10'),
    ('William Jackson', 'Customer Support', 56000.75, '2022-02-10'),
    ('Olivia Nelson', 'Administration', 97000.00, '2018-12-20'),
    ('Daniel White', 'Research', 73000.50, '2020-07-05'),
    ('Ava Wilson', 'Quality Assurance', 69000.25, '2021-11-15'),
    ('Matthew Brown', 'HR', 63000.00, '2022-01-20'),
    ('Emily Garcia', 'Marketing', 76000.50, '2021-06-15'),
    ('Christopher Allen', 'Finance', 86000.75, '2020-12-05'),
    ('Madison Hall', 'IT', 93000.25, '2019-09-25'),
    ('Andrew Cook', 'Sales', 68000.50, '2020-04-18'),
    ('Abigail Torres', 'Engineering', 73000.00, '2021-10-20'),
    ('Ethan Murphy', 'Customer Support', 57000.75, '2022-02-15'),
    ('Ella King', 'Administration', 98000.00, '2018-12-28'),
    ('Nathan Rivera', 'Research', 74000.50, '2020-07-15'),
    ('Mia Roberts', 'Quality Assurance', 70000.25, '2021-11-20');

-- ✅ Select all employees to verify data insertion
SELECT * FROM employees;

-- ✅ Drop the table (cleanup)
DROP TABLE employees;

--------------------------------------------------------

-- ✅ Find employees whose salary is greater than the highest salary in HR department
-- Subquery (SELECT max(salary) FROM employees WHERE department_name = 'HR') gets max salary in HR
-- Main query selects employees with salary greater than that
SELECT * 
FROM employees 
WHERE salary > (SELECT MAX(salary) FROM employees WHERE department_name = 'HR') 
ORDER BY salary DESC;

-- ✅ Calculate total sum of all salaries across all employees
SELECT SUM(salary) FROM employees;

-- ✅ Select all employees along with total salary sum in a separate column (salary_sum)
-- This adds the total salary sum on each row for reference
SELECT *, (SELECT SUM(salary) FROM employees) AS salary_sum FROM employees;

-- ✅ Group employees by department and calculate total salary per department
SELECT department_name, SUM(salary) 
FROM employees 
GROUP BY department_name;

-- ✅ Select subquery returning department_name and total salary grouped by department
SELECT * FROM (
    SELECT department_name, SUM(salary) 
    FROM employees 
    GROUP BY department_name
) AS dept_salaries;

-- ✅ Select only department_name from the above subquery
SELECT department_name FROM (
    SELECT department_name, SUM(salary) 
    FROM employees 
    GROUP BY department_name
) AS dept_salaries;

-- ✅ Select employees whose department name contains letter 'R' (case-sensitive)
-- Uses subquery with LIKE '%R%' to filter department names having 'R'
-- Main query selects employees working in those departments
SELECT employee_name, salary, department_name 
FROM employees 
WHERE department_name IN (
    SELECT department_name FROM employees WHERE department_name LIKE '%R%'
);

