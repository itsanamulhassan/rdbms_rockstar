-- ✅ Basic GROUP BY usage: Group students by country, count how many, and calculate average age
SELECT country, COUNT(*) AS total_students, AVG(age) AS avg_age
FROM students
GROUP BY country;

-- ✅ Using HAVING to filter grouped results: Only show countries with avg age > 20
SELECT country, COUNT(*) AS total_students, AVG(age) AS avg_age
FROM students
GROUP BY country
HAVING AVG(age) > 20;

-- ✅ Extract birth year from dob and group by that year
SELECT EXTRACT(YEAR FROM dob) AS birth_year, COUNT(*) AS total_students
FROM students
GROUP BY birth_year;

-- ✅ Group by blood group and count students in each group
SELECT blood_group, COUNT(*) AS count
FROM students
GROUP BY blood_group;


-- ✅ Find the maximum age in each country
SELECT country, MAX(age) AS oldest_student
FROM students
GROUP BY country;

-- ✅ Find the youngest student per blood group
SELECT blood_group, MIN(age) AS youngest_student
FROM students
GROUP BY blood_group;

-- ✅ Count how many students have the same first name
SELECT first_name, COUNT(*) AS name_count
FROM students
GROUP BY first_name
HAVING COUNT(*) > 1; -- Show only duplicate names

-- ✅ Use GROUP BY with ORDER BY to sort grouped results
SELECT country, COUNT(*) AS total_students
FROM students
GROUP BY country
ORDER BY total_students DESC;

-- ✅ Get country-wise total students, but only if more than 5
SELECT country, COUNT(*) AS total_students
FROM students
GROUP BY country
HAVING COUNT(*) > 5;

-- ✅ Count students by blood group and gender combination
SELECT blood_group, gender, COUNT(*) AS count
FROM students
GROUP BY blood_group, gender
ORDER BY blood_group, gender;
