-- ✅ Create table "user"
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,                   -- Unique identifier for each user
    username VARCHAR(25) NOT NULL            -- Username must be provided
);

-- ✅ Create table "post" with foreign key referencing "user"
-- ON DELETE SET DEFAULT: if user is deleted, assign user_id = 2 to related posts
CREATE TABLE post (
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL, 
    user_id INTEGER DEFAULT 2 REFERENCES "user"(id) ON DELETE SET DEFAULT
);

-- ✅ Make sure user_id in post table cannot be NULL
ALTER TABLE post 
ALTER COLUMN user_id SET NOT NULL;

-- ✅ Insert some dummy users
INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

-- ✅ Insert posts with different user_ids
INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with Akash! ☀️', 2),
('Batash just shared an amazing recipe! 🍲', 1),
('Exploring adventures with Sagor.🌟', 4),
('Nodi''s wisdom always leaves me inspired. 📚', 4);

-- ✅ Select all users and posts
SELECT * FROM "user";
SELECT * FROM post;

-- ✅ Join user and post table to show post titles with usernames
SELECT title, username 
FROM post 
JOIN "user" ON post.user_id = "user".id;

-- ✅ Get post and user IDs from joined tables
SELECT "user".id AS "userId", post.id AS "postId" 
FROM post 
JOIN "user" ON post.user_id = "user".id;

-- ❌ The following will FAIL because user_id is NOT NULL
-- INSERT INTO post (id, title, user_id) VALUES (5, 'title with null', NULL);

-- ✅ LEFT OUTER JOIN: includes all posts even if no user (if allowed)
SELECT * 
FROM post 
LEFT OUTER JOIN "user" ON post.user_id = "user".id;

-- ✅ RIGHT OUTER JOIN: includes all users even if no posts
SELECT * 
FROM post 
RIGHT OUTER JOIN "user" ON post.user_id = "user".id;

-- ✅ FULL OUTER JOIN: includes all users and all posts
SELECT * 
FROM post 
FULL OUTER JOIN "user" ON post.user_id = "user".id;

-- ❌ Attempting to insert a post with NULL user_id will fail due to NOT NULL constraint
-- INSERT INTO post (title, user_id) VALUES ('test', NULL);

-- ✅ Deleting user with ID 4
-- Any related posts will be reassigned to user_id = 2 due to ON DELETE SET DEFAULT
DELETE FROM "user" 
WHERE id = 4;

-- ✅ Notes on foreign key behaviors (ON DELETE options):
-- RESTRICT / NO ACTION (default): Prevent deletion if foreign key exists
-- CASCADE: Automatically delete dependent rows (posts)
-- SET NULL: Sets user_id to NULL in post (must allow NULL)
-- SET DEFAULT: Sets user_id to a default value in post
-- ✅ Create table "user"
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,                   -- Unique identifier for each user
    username VARCHAR(25) NOT NULL            -- Username must be provided
);

-- ✅ Create table "post" with foreign key referencing "user"
-- ON DELETE SET DEFAULT: if user is deleted, assign user_id = 2 to related posts
CREATE TABLE post (
    id SERIAL PRIMARY KEY, 
    title TEXT NOT NULL, 
    user_id INTEGER DEFAULT 2 REFERENCES "user"(id) ON DELETE SET DEFAULT
);

-- ✅ Make sure user_id in post table cannot be NULL
ALTER TABLE post 
ALTER COLUMN user_id SET NOT NULL;

-- ✅ Insert some dummy users
INSERT INTO "user" (username) VALUES
('akash'),
('batash'),
('sagor'),
('nodi');

-- ✅ Insert posts with different user_ids
INSERT INTO post (title, user_id) VALUES
('Enjoying a sunny day with Akash! ☀️', 2),
('Batash just shared an amazing recipe! 🍲', 1),
('Exploring adventures with Sagor.🌟', 4),
('Nodi''s wisdom always leaves me inspired. 📚', 4);

-- ✅ Select all users and posts
SELECT * FROM "user";
SELECT * FROM post;

-- ✅ Join user and post table to show post titles with usernames
SELECT title, username 
FROM post 
JOIN "user" ON post.user_id = "user".id;

-- ✅ Get post and user IDs from joined tables
SELECT "user".id AS "userId", post.id AS "postId" 
FROM post 
JOIN "user" ON post.user_id = "user".id;

-- ❌ The following will FAIL because user_id is NOT NULL
-- INSERT INTO post (id, title, user_id) VALUES (5, 'title with null', NULL);

-- ✅ LEFT OUTER JOIN: includes all posts even if no user (if allowed)
SELECT * 
FROM post 
LEFT OUTER JOIN "user" ON post.user_id = "user".id;

-- ✅ RIGHT OUTER JOIN: includes all users even if no posts
SELECT * 
FROM post 
RIGHT OUTER JOIN "user" ON post.user_id = "user".id;

-- ✅ FULL OUTER JOIN: includes all users and all posts
SELECT * 
FROM post 
FULL OUTER JOIN "user" ON post.user_id = "user".id;

-- ❌ Attempting to insert a post with NULL user_id will fail due to NOT NULL constraint
-- INSERT INTO post (title, user_id) VALUES ('test', NULL);

-- ✅ Deleting user with ID 4
-- Any related posts will be reassigned to user_id = 2 due to ON DELETE SET DEFAULT
DELETE FROM "user" 
WHERE id = 4;

-- ✅ Notes on foreign key behaviors (ON DELETE options):
-- RESTRICT / NO ACTION (default): Prevent deletion if foreign key exists
-- CASCADE: Automatically delete dependent rows (posts)
-- SET NULL: Sets user_id to NULL in post (must allow NULL)
-- SET DEFAULT: Sets user_id to a default value in post
