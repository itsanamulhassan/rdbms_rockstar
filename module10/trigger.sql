/*
A trigger is a database object in PostgreSQL that automatically executes specified actions in response to certain database events.
*/

-- Table-level events supported: INSERT, UPDATE, DELETE, TRUNCATE
-- Syntax: CREATE TRIGGER trigger_name {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE} ON table_name
-- Optional: FOR EACH ROW to execute once per affected row
-- Triggers execute a specified function


-- ✅  Create users table with unique, non-null email column
CREATE TABLE my_users (
    user_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL
);

-- ✅ Insert sample user data
INSERT INTO my_users VALUES ('AB Rahman', 'rahman@gmail.com');
INSERT INTO my_users VALUES ('Dr Rahman', 'drrahman@gmail.com');

-- ✅  View all users
SELECT * FROM my_users;


-- ✅  This will error if audit table does not exist yet
SELECT * FROM deleted_user_audit;  -- Incorrect table name, should be 'deleted_users_audit'


-- ✅  Create audit table to store deleted user info with deletion timestamp
CREATE TABLE deleted_users_audit (
    deleted_user_name VARCHAR(50),
    createdAt TIMESTAMP
);


-- ✅  Create trigger function to log deleted users before delete
CREATE OR REPLACE FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
    -- Insert old user_name and current timestamp into audit table
    INSERT INTO deleted_users_audit VALUES (OLD.user_name, now());

    -- Optional notice for logging purposes
    RAISE NOTICE 'Deleted user log created.';

    -- Must return OLD to allow deletion to continue
    RETURN OLD;
END
$$;


-- ✅  Create trigger on my_users BEFORE DELETE FOR EACH ROW
-- Executes the save_deleted_user function on each row deletion
CREATE OR REPLACE TRIGGER save_deleted_user_trigger
BEFORE DELETE ON my_users
FOR EACH ROW
EXECUTE FUNCTION save_deleted_user();


-- ✅  Delete user 'Dr Rahman', will trigger audit log insertion
DELETE FROM my_users WHERE user_name = 'Dr Rahman';

-- ✅  View audit logs to confirm deletion was logged
SELECT * FROM deleted_users_audit;
