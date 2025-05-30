-- ✅ Create a view to show average salary by department
CREATE VIEW department_avg_salary AS 
SELECT department_name, avg(salary) 
FROM employees 
GROUP BY department_name;

-- ✅ Select all data from the average salary view
SELECT * FROM department_avg_salary;

-- ✅ Create a view to filter employees whose department name contains 'R'
CREATE VIEW test_view AS
SELECT department_name, salary, employee_name
FROM employees
WHERE department_name IN (
    SELECT department_name 
    FROM employees 
    WHERE department_name LIKE '%R%'
);

-- ✅ Select all from the filtered employees view
SELECT * FROM test_view;

-- Notes:
-- LIKE keyword is case sensitive, so only department names with uppercase 'R' will match.
-- Use ILIKE for case-insensitive search: WHERE department_name ILIKE '%r%'
-- Views help save complex queries for easy reuse.
