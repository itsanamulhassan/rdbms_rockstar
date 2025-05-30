-- ✅ View all employees
SELECT * FROM employees;

-- ✅ Count total number of employees
SELECT count(*) FROM employees;

-- ✅ Create a function to return total employee count
CREATE Function employee_count()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT count(*) from employees;
$$

-- ✅ Call the employee_count() function
SELECT employee_count();

-- ✅ Create a function to delete a specific employee (hardcoded: ID = 30)
CREATE OR REPLACE Function delete_employee()
RETURNS void
LANGUAGE SQL
AS $$
    DELETE FROM employees WHERE employee_id = 30;
$$

-- ✅ Call the delete_employee() function
SELECT delete_employee();

-- ✅ Create a parameterized function to delete an employee by ID
CREATE Function delete_function_by_id(p_employee_id INT)
RETURNS void
LANGUAGE SQL
AS $$
    DELETE FROM employees WHERE employee_id = p_employee_id;
$$

-- ✅ Call the parameterized delete function
SELECT delete_function_by_id(29);

-- ✅ View all employees after deletions
SELECT * FROM employees;

-- ✅ Create a stored procedure to delete employee by ID using PL/pgSQL
CREATE Procedure delete_employee_by_id(p_employee_id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM employees WHERE employee_id = p_employee_id;
END
$$

-- ✅ Call the stored procedure
CALL delete_employee_by_id(13);

-- ✅ Create a stored procedure with a variable and notification
CREATE Procedure remove_employee_by_id(p_employee_id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    test_var INT;
BEGIN
    SELECT employee_id INTO test_var FROM employees WHERE employee_id = p_employee_id;
    DELETE FROM employees WHERE employee_id = test_var;
    RAISE NOTICE 'Employee removed successfully';
END
$$

-- ✅ Drop the procedure if needed
DROP Procedure remove_employee_by_id;

-- ✅ Call the notification-based procedure
CALL remove_employee_by_id(11);

-- Notes:
-- ✅ Use functions for returning values (like counts), and procedures for actions (like deletions).
-- ✅ Use `RAISE NOTICE` to give user feedback in procedures.
-- ✅ Prefer `parameterized functions` to avoid hardcoding values.
-- ✅ Use `PL/pgSQL` when you need variables, control flow, or multiple steps.
