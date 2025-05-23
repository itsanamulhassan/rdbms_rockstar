-- ✅ Show all data from the table
-- Use this to view table content (not structure)
SELECT * FROM user2;

-- ✅ Add a new column to an existing table
-- Use ALTER to modify table structure without deleting data
ALTER TABLE user2 
ADD COLUMN email VARCHAR(25) DEFAULT ('default@mail.com') NOT NULL;

-- ✅ Insert a new row of data into the table
-- Use this to add new entries
INSERT INTO user2 VALUES (6, 23, 'fanta', 'fanta@gmail.com');

-- ✅ Delete a column from the table
-- Use this when a column is no longer needed
ALTER TABLE user2 
DROP COLUMN email;

-- ✅ Rename a column in the table
-- Use RENAME COLUMN to make names clearer or standardized
ALTER TABLE user2 
RENAME COLUMN age TO user_age;

-- ✅ Change a column's data type
-- Use this when the type is too short or incorrect
ALTER TABLE user2 
ALTER COLUMN user_name TYPE VARCHAR(25);

-- ✅ Add a NOT NULL constraint to a column
-- Ensures that column must always have a value
ALTER TABLE user2 
ALTER COLUMN user_age SET NOT NULL;

-- ✅ Remove the NOT NULL constraint from a column
-- Use this to allow empty values
ALTER TABLE user2 
ALTER COLUMN user_age DROP NOT NULL;

-- ✅ Add a UNIQUE constraint to a column
-- Ensures no duplicate values in that column
ALTER TABLE user2 
ADD CONSTRAINT unique_user2_user_age UNIQUE(user_age);

-- ✅ Add a PRIMARY KEY constraint
-- Sets a column (or columns) as the unique identifier
ALTER TABLE user2 
ADD CONSTRAINT pk_user2 PRIMARY KEY(id);

-- ✅ Delete an entire table from the database
-- Use DROP TABLE to permanently remove the table structure and all data
DROP TABLE "user";

-- ✅ Delete all data but keep the table structure
-- TRUNCATE is faster than DELETE and resets identity counters
TRUNCATE TABLE user2;
