-- ✅ Create a table named "user" with a primary key and a NOT NULL constraint on user_name
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,                    -- Auto-incremented primary key
    user_name VARCHAR(25) NOT NULL           -- User name must be provided
);

-- ✅ Create a table named "post" that references the "user" table
CREATE TABLE post (
    id SERIAL PRIMARY KEY,                   -- Auto-incremented primary key
    title TEXT NOT NULL,                     -- Post title must be provided
    user_id INTEGER REFERENCES "user"(id)    -- Foreign key linking post to user
);

-- ✅ Enforce that user_id in post table cannot be NULL
ALTER TABLE post 
ALTER COLUMN user_id SET NOT NULL;

-- ✅ View all users
SELECT * FROM "user";

-- ✅ View all posts
SELECT * FROM post;

-- ✅ Insert dummy users
INSERT INTO "user" (user_name) VALUES
('akash'), 
('batahs'), 
('sagor'), 
('nodi');

-- ✅ Insert dummy posts into the "post" table with user_id 1, 2, 3, 4
INSERT INTO post (title, user_id) VALUES
('Introduction to PostgreSQL', 1),
('Understanding Joins', 2),
('SQL Performance Tuning Tips', 3),
('Working with Constraints in SQL', 4);

-- ✅ Join post with user to get user_name along with post titles
SELECT 
    post.id AS post_id,
    post.title,
    "user".user_name
FROM post
JOIN "user" ON post.user_id = "user".id;

-- ✅ Count how many posts each user has made
SELECT 
    user_id,
    COUNT(*) AS total_posts
FROM post
GROUP BY user_id;

-- ✅ Get posts for a specific user by name
SELECT 
    post.title
FROM post
JOIN "user" ON post.user_id = "user".id
WHERE "user".user_name = 'akash';

-- ✅ Delete all posts of a specific user (e.g., user_id = 2)
DELETE FROM post 
WHERE user_id = 2;

-- ✅ Update a post's title by ID
UPDATE post 
SET title = 'Updated Post Title' 
WHERE id = 1;

-- ✅ Drop the post table (if needed)
-- DROP TABLE post;

-- ✅ Drop the user table (if needed)
-- DROP TABLE "user";
