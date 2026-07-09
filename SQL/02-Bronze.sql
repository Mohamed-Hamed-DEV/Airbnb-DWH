SELECT * FROM [Bronze].[AirBnB];



------------------------------
-- 1. Check Nulls
------------------------------

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price,
    SUM(CASE WHEN room_type IS NULL OR LTRIM(RTRIM(room_type)) = '' THEN 1 ELSE 0 END) AS room_type,
    SUM(CASE WHEN room_shared IS NULL OR LTRIM(RTRIM(room_shared)) = '' THEN 1 ELSE 0 END) AS room_shared,
    SUM(CASE WHEN room_private IS NULL OR LTRIM(RTRIM(room_private)) = '' THEN 1 ELSE 0 END) AS room_private,
    SUM(CASE WHEN person_capacity IS NULL THEN 1 ELSE 0 END) AS person_capacity,
    SUM(CASE WHEN superhost IS NULL OR LTRIM(RTRIM(superhost)) = '' THEN 1 ELSE 0 END) AS superhost,
    SUM(CASE WHEN multi_listing IS NULL THEN 1 ELSE 0 END) AS multi_listing,
    SUM(CASE WHEN bis_listing IS NULL THEN 1 ELSE 0 END) AS bis_listing,
    SUM(CASE WHEN cleanliness_rating IS NULL THEN 1 ELSE 0 END) AS cleanliness_rating,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS rating,
    SUM(CASE WHEN bedrooms IS NULL THEN 1 ELSE 0 END) AS bedrooms,
    SUM(CASE WHEN lng IS NULL THEN 1 ELSE 0 END) AS lng,
    SUM(CASE WHEN lat IS NULL THEN 1 ELSE 0 END) AS lat,
    SUM(CASE WHEN city IS NULL OR LTRIM(RTRIM(city)) = '' THEN 1 ELSE 0 END) AS city,
    SUM(CASE WHEN day_type IS NULL OR LTRIM(RTRIM(day_type)) = '' THEN 1 ELSE 0 END) AS day_type
FROM Bronze.AirBnB;

------------------------------
-- 2. Data Type
------------------------------

SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(price AS DECIMAL(12,2)) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE UPPER(room_shared) NOT IN ('TRUE','FALSE');
SELECT * FROM Bronze.AirBnB WHERE UPPER(room_private) NOT IN ('TRUE','FALSE');
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(person_capacity AS INT) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE UPPER(superhost) NOT IN ('TRUE','FALSE');
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(multi_listing AS BIT) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(bis_listing AS BIT) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(cleanliness_rating AS TINYINT) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(rating AS TINYINT) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(bedrooms AS TINYINT) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(lng AS DECIMAL(10,6)) IS NULL;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(lat AS DECIMAL(10,6)) IS NULL;


------------------------------
-- 3. Domain Validation
------------------------------

SELECT DISTINCT room_type FROM Bronze.AirBnB;
SELECT DISTINCT room_shared FROM Bronze.AirBnB;
SELECT DISTINCT room_private FROM Bronze.AirBnB;
SELECT DISTINCT superhost FROM Bronze.AirBnB;
SELECT DISTINCT multi_listing FROM Bronze.AirBnB;
SELECT DISTINCT bis_listing FROM Bronze.AirBnB;
SELECT DISTINCT day_type FROM Bronze.AirBnB;
SELECT DISTINCT city FROM Bronze.AirBnB ORDER BY city;

SELECT
    MIN(TRY_CAST(cleanliness_rating AS TINYINT)) AS Min_Cleanliness_Rating,
    MAX(TRY_CAST(cleanliness_rating AS TINYINT)) AS Max_Cleanliness_Rating
FROM Bronze.AirBnB;

SELECT
    MIN(TRY_CAST(rating AS TINYINT)) AS Min_Rating,
    MAX(TRY_CAST(rating AS TINYINT)) AS Max_Rating
FROM Bronze.AirBnB;

SELECT
    MIN(TRY_CAST(bedrooms AS TINYINT)) AS Min_Bedrooms,
    MAX(TRY_CAST(bedrooms AS TINYINT)) AS Max_Bedrooms
FROM Bronze.AirBnB;

SELECT
    MIN(TRY_CAST(person_capacity AS INT)) AS Min_Person_Capacity,
    MAX(TRY_CAST(person_capacity AS INT)) AS Max_Person_Capacity
FROM Bronze.AirBnB;

SELECT
    MIN(TRY_CAST(price AS DECIMAL(12,2))) AS Min_Price,
    MAX(TRY_CAST(price AS DECIMAL(12,2))) AS Max_Price
FROM Bronze.AirBnB;

SELECT
    MIN(TRY_CAST(lng AS DECIMAL(10,6))) AS Min_Longitude,
    MAX(TRY_CAST(lng AS DECIMAL(10,6))) AS Max_Longitude
FROM Bronze.AirBnB;

SELECT
    MIN(TRY_CAST(lat AS DECIMAL(10,6))) AS Min_Latitude,
    MAX(TRY_CAST(lat AS DECIMAL(10,6))) AS Max_Latitude
FROM Bronze.AirBnB;



------------------------------
-- 4. Check Duplicates 
------------------------------

SELECT
    price, room_type, room_shared, room_private, person_capacity,
    superhost, multi_listing, bis_listing, cleanliness_rating,
    rating, bedrooms, lng, lat, city, day_type,
    COUNT(*) AS duplicate_count
FROM Bronze.AirBnB
GROUP BY
    price, room_type, room_shared, room_private, person_capacity,
    superhost, multi_listing, bis_listing, cleanliness_rating,
    rating, bedrooms, lng, lat, city, day_type
HAVING COUNT(*) > 1;




------------------------------
-- 5. Out of range
------------------------------

SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(price AS DECIMAL(12,2)) <= 0;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(person_capacity AS INT) < 1;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(bedrooms AS INT) < 2;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(cleanliness_rating AS INT) NOT BETWEEN 0 AND 10;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(rating AS INT) NOT BETWEEN 0 AND 100;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(lat AS DECIMAL(10,6)) NOT BETWEEN -90 AND 90;
SELECT * FROM Bronze.AirBnB WHERE TRY_CAST(lng AS DECIMAL(10,6)) NOT BETWEEN -180 AND 180;





