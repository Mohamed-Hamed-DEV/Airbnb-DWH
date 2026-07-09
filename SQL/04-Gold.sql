create schema Gold ;
go  


------------------------------
-- 1. Create Dim_Location
------------------------------

CREATE TABLE Gold.Dim_Location
(
    location_id INT IDENTITY(1,1) PRIMARY KEY,
    city VARCHAR(50),
    lat DECIMAL(10,6),
    lng DECIMAL(10,6)
);

------------------------------
-- 2. Load Dim_Location
------------------------------

INSERT INTO Gold.Dim_Location
(
    city,
    lat,
    lng
)
SELECT DISTINCT
    city,
    lat,
    lng
FROM Silver.AirBnB;


------------------------------
-- 3. Create Dim_Room
------------------------------

CREATE TABLE Gold.Dim_Room
(
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    room_type VARCHAR(50),
    bedrooms TINYINT,
    person_capacity TINYINT,
    room_shared BIT,
    room_private BIT
);

------------------------------
-- 4. Load Dim_Room
------------------------------

INSERT INTO Gold.Dim_Room
(
    room_type,
    bedrooms,
    person_capacity,
    room_shared,
    room_private
)

SELECT DISTINCT
    room_type,
    bedrooms,
    person_capacity,
    room_shared,
    room_private
FROM Silver.AirBnB;


------------------------------
-- 5. Create Dim_DayType
------------------------------

CREATE TABLE Gold.Dim_DayType
(
    day_type_id INT IDENTITY(1,1) PRIMARY KEY,
    day_type VARCHAR(20)
);

------------------------------
-- 6. Load Dim_DayType
------------------------------

INSERT INTO Gold.Dim_DayType
(
    day_type
)

SELECT DISTINCT
    day_type
FROM Silver.AirBnB;


------------------------------
-- 7. Create Fact_AirBnB
------------------------------

CREATE TABLE Gold.Fact_AirBnB
(
    listing_id INT PRIMARY KEY,

    location_id INT,
    room_id INT,
    day_type_id INT,

    price DECIMAL(12,2),
    rating TINYINT,
    cleanliness_rating TINYINT,
    superhost BIT,
    multi_listing BIT,
    bis_listing BIT,

    CONSTRAINT FK_Fact_Location FOREIGN KEY (location_id)
        REFERENCES Gold.Dim_Location(location_id),

    CONSTRAINT FK_Fact_Room FOREIGN KEY (room_id)
        REFERENCES Gold.Dim_Room(room_id),

    CONSTRAINT FK_Fact_DayType FOREIGN KEY (day_type_id)
        REFERENCES Gold.Dim_DayType(day_type_id)
);


------------------------------
-- 8. Load Fact_AirBnB
------------------------------

INSERT INTO Gold.Fact_AirBnB
(
    listing_id,
    location_id,
    room_id,
    day_type_id,
    price,
    rating,
    cleanliness_rating,
    superhost,
    multi_listing,
    bis_listing
)

SELECT
    Silver.AirBnB.listing_id,
    Gold.Dim_Location.location_id,
    Gold.Dim_Room.room_id,
    Gold.Dim_DayType.day_type_id,
    Silver.AirBnB.price,
    Silver.AirBnB.rating,
    Silver.AirBnB.cleanliness_rating,
    Silver.AirBnB.superhost,
    Silver.AirBnB.multi_listing,
    Silver.AirBnB.bis_listing

FROM Silver.AirBnB

INNER JOIN Gold.Dim_Location
ON Silver.AirBnB.city = Gold.Dim_Location.city
AND Silver.AirBnB.lat = Gold.Dim_Location.lat
AND Silver.AirBnB.lng = Gold.Dim_Location.lng

INNER JOIN Gold.Dim_Room
ON Silver.AirBnB.room_type = Gold.Dim_Room.room_type
AND Silver.AirBnB.bedrooms = Gold.Dim_Room.bedrooms
AND Silver.AirBnB.person_capacity = Gold.Dim_Room.person_capacity
AND Silver.AirBnB.room_shared = Gold.Dim_Room.room_shared
AND Silver.AirBnB.room_private = Gold.Dim_Room.room_private

INNER JOIN Gold.Dim_DayType
ON Silver.AirBnB.day_type = Gold.Dim_DayType.day_type;



------------------------------
-- 10. Check Row Counts
------------------------------

SELECT COUNT(*) AS Silver_Count
FROM Silver.AirBnB;

SELECT COUNT(*) AS Fact_Count
FROM Gold.Fact_AirBnB;


------------------------------
-- 11. Check Missing Keys
------------------------------

SELECT *
FROM Gold.Fact_AirBnB
WHERE location_id IS NULL
   OR room_id IS NULL
   OR day_type_id IS NULL;