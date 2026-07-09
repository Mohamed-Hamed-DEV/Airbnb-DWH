create schema Silver ;
go 


------------------------------
-- 1. Remove Duplicates
------------------------------

SELECT DISTINCT *
INTO Silver.AirBnB_Stage
FROM Bronze.AirBnB;


------------------------------
-- 2. Create Silver Table
------------------------------

CREATE TABLE Silver.AirBnB
(
    listing_id INT IDENTITY(1,1) PRIMARY KEY,

    price DECIMAL(12,2),
    room_type VARCHAR(50),
    room_shared BIT,
    room_private BIT,
    person_capacity TINYINT,
    superhost BIT,
    multi_listing BIT,
    bis_listing BIT,
    cleanliness_rating TINYINT,
    rating TINYINT,
    bedrooms TINYINT,
    lng DECIMAL(10,6),
    lat DECIMAL(10,6),
    city VARCHAR(50),
    day_type VARCHAR(20)
);


------------------------------
-- 3. Load Clean Data
------------------------------

INSERT INTO Silver.AirBnB
(
    price,
    room_type,
    room_shared,
    room_private,
    person_capacity,
    superhost,
    multi_listing,
    bis_listing,
    cleanliness_rating,
    rating,
    bedrooms,
    lng,
    lat,
    city,
    day_type
)

SELECT
    TRY_CAST(price AS DECIMAL(12,2)),
    NULLIF(LTRIM(RTRIM(room_type)), ''),
    CASE WHEN UPPER(LTRIM(RTRIM(room_shared))) = 'TRUE' THEN 1 ELSE 0 END,
    CASE WHEN UPPER(LTRIM(RTRIM(room_private))) = 'TRUE' THEN 1 ELSE 0 END,
    TRY_CAST(person_capacity AS TINYINT),
    CASE WHEN UPPER(LTRIM(RTRIM(superhost))) = 'TRUE' THEN 1 ELSE 0 END,
    TRY_CAST(multi_listing AS BIT),
    TRY_CAST(bis_listing AS BIT),
    TRY_CAST(cleanliness_rating AS TINYINT),
    TRY_CAST(rating AS TINYINT),
    TRY_CAST(bedrooms AS TINYINT),
    TRY_CAST(lng AS DECIMAL(10,6)),
    TRY_CAST(lat AS DECIMAL(10,6)),
    NULLIF(LTRIM(RTRIM(city)), ''),
    NULLIF(LTRIM(RTRIM(day_type)), '')
FROM Silver.AirBnB_Stage;

------------------------------
-- 4. Drop Stage Table
------------------------------

DROP TABLE Silver.AirBnB_Stage;

