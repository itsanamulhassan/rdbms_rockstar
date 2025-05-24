-- ✅ Show current database time zone setting
SHOW TIMEZONE;

-- ✅ Get current timestamp (date + time + time zone)
SELECT now(); -- same as CURRENT_TIMESTAMP

-- ✅ Get only current date
SELECT CURRENT_DATE;

-- ✅ Get only current time
SELECT CURRENT_TIME;

-- ✅ Create a table with timestamp columns
CREATE TABLE timez (
    tm TIMESTAMP without time zone, -- local date-time only
    tmz TIMESTAMP with time zone    -- UTC-aware date-time
);

-- ✅ Insert datetime into the table
INSERT INTO timez VALUES('2025-01-25 12:45:00', '2025-01-25 12:45:00');

-- ✅ View data in timez table
SELECT * FROM timez;

-- ✅ Format timestamp as string using to_char
SELECT to_char(now(), 'yyyy/mm/dd');       -- 2025/05/23
SELECT to_char(now(), 'dd/mm/yyyy');       -- 23/05/2025
SELECT to_char(now(), 'dd-mm-yyyy');       -- 23-05-2025
SELECT to_char(now(), 'dd Month, yyyy');   -- 23 May, 2025
SELECT to_char(now(), 'Day, dd Month yyyy'); -- Thursday, 23 May 2025

-- ✅ Cast now() to date and time separately
SELECT now()::date; -- Only date part
SELECT now()::time; -- Only time part

-- ✅ Get yesterday and future dates
SELECT CURRENT_DATE - INTERVAL '1 day' AS "Yesterday";
SELECT CURRENT_DATE + INTERVAL '3 days' AS "In 3 Days";

-- ✅ Subtract months or years
SELECT CURRENT_DATE - INTERVAL '1 month';
SELECT CURRENT_DATE - INTERVAL '2 years';

-- ✅ Get age (difference between two dates in years, months, days)
SELECT age(CURRENT_DATE, '1999-05-15'); -- human readable interval
SELECT age(CURRENT_DATE, dob) FROM students;

-- ✅ Extract specific parts from a date
SELECT extract(year FROM now());    -- e.g., 2025
SELECT extract(month FROM now());   -- e.g., 5
SELECT extract(day FROM now());     -- e.g., 23
SELECT extract(hour FROM now());    -- current hour
SELECT extract(minute FROM now());  -- current minute

-- ✅ Time arithmetic examples
SELECT now() + INTERVAL '2 hours';  -- add 2 hours to current time
SELECT now() - INTERVAL '30 minutes'; -- subtract 30 minutes

-- ✅ Convert to another time zone (PostgreSQL only)
SELECT now() AT TIME ZONE 'UTC';         -- convert current time to UTC
SELECT now() AT TIME ZONE 'Asia/Dhaka';  -- convert current time to Dhaka time
SELECT '2025-05-23 12:00:00+00'::timestamptz AT TIME ZONE 'Asia/Tokyo'; -- show Tokyo local time

-- ✅ Boolean casts
SELECT 1::BOOLEAN;   -- true
SELECT 0::BOOLEAN;   -- false
SELECT 'yes'::BOOLEAN; -- true
SELECT 'n'::BOOLEAN;   -- false
