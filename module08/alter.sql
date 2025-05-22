-- How to show the table structure
-------------------------------------------------

select * from user2;

-- How to use alter keyword for adding new column
---------------------------------------------------

ALTER table user2 ADD COLUMN email VARCHAR(25) DEFAULT ('default@mail.com') NOT NULL; 

-- How to insert the data to the new table
-----------------------------------------------------------------
insert into user2 values(6, 23, 'afrin', 'afrin@gmail.com');

-- How to delete a column
-----------------------------------------------

alter table user2
DROP COLUMN email;

-- How to rename the column name
------------------------------------------------

alter table user2
rename COLUMN age to user_age;


-- How to change the column type
------------------------------------------------

alter table user2
alter COLUMN user_name type VARCHAR(25);

-- How to change the constraint of the existing column
------------------------------------------------    
alter table user2
alter COLUMN user_age set NOT NULL;


-- How to remove the constraint of the existing column
------------------------------------------------
alter table user2
alter COLUMN user_age drop NOT NULL;
