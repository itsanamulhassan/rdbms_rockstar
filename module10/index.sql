-- ✅  Retrieve all rows and columns from the employees table
SELECT * FROM employees;


-- ✅  Analyze the query plan and execution time for selecting employees named 'Amy White'
EXPLAIN ANALYZE
SELECT * FROM employees WHERE employee_name = 'Amy White';


-- ✅  Create an index on the employee_name column to speed up searches by employee_name
CREATE INDEX idx_employee_last_name ON employees(employee_name);
