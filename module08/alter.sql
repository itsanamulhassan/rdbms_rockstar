-- How to show the table structure
-------------------------------------------------

select * from user2;

-- How to use alter keyword for adding new column
---------------------------------------------------

ALTER table user2 ADD COLUMN email VARCHAR(25) DEFAULT ('default@mail.com') NOT NULL; 

-- How to insert the data to the new table
-----------------------------------------------------------------
insert into user2 values(6, 23, 'fanta', 'fanta@gmail.com');

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


-- How to add a constraint to the existing column with different way (unique)
------------------------------------------------

alter table user2
ADD constraint unique_user2_user_age UNIQUE(user_age);

-- How to add a constraint to the existing column with different way (primary key)
------------------------------------------------
alter table user2 
add constraint pk_user2 PRIMARY KEY(id);

-- How to remove a table
------------------------------------------------
Drop Table "user";

-- How to remove all the data for the table
------------------------------------------------

truncate Table user2;

