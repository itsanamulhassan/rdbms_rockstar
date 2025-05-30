SELECT * FROM employees;

SELECT count(*) FROM employees;

CREATE Function employee_count()
RETURNS INT
LANGUAGE SQL
AS
$$
SELECT count(*) from employees;
$$

SELECT employee_count();

CREATE OR REPLACE Function delete_employee()
RETURNS void
LANGUAGE SQL
AS $$
DELETE FROM employees WHERE employee_id = 30;
$$

SELECT delete_employee();

CREATE Function delete_function_by_id(p_employee_id INT)
RETURNS void
LANGUAGE SQL
AS $$
DELETE FROM employees WHERE employee_id = p_employee_id;
$$

SELECT delete_function_by_id(29);

SELECT * FROM employees;




