USE restaurant_ratings_db;


-- =========================================================
-- SECTION 4: ADVANCED SQL CONCEPTS
-- CTEs, DERIVED TABLES, WINDOW FUNCTIONS, VIEWS,
-- AND STORED PROCEDURES
-- =========================================================


-- Question 1:
-- CTE consumers in San Luis Potosi; list ID, Age,
-- Mexican restaurant they rated with Overall_Rating = 2.

USE restaurant_ratings_db;

WITH SanLuisConsumers AS (
    SELECT
        Consumer_ID,
        Age
    FROM consumers
    WHERE City = 'San Luis Potosi'
)
SELECT DISTINCT
    c.Consumer_ID,
    c.Age,
    r.Name AS Restaurant_Name
FROM SanLuisConsumers AS c
JOIN ratings AS rt
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
JOIN restaurants AS r
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
JOIN restaurant_cuisines AS rc
    ON rc.`ï»¿Restaurant_ID` = r.`ï»¿Restaurant_ID`
WHERE rc.Cuisine = 'Mexican'
  AND rt.Overall_Rating = 2;

-- Question 2:
-- Average age per occupation, considering only consumers
-- who have made at least one rating.

SELECT
    occupation_data.Occupation,
    AVG(occupation_data.Age) AS Average_Age
FROM (
    SELECT DISTINCT
        c.Consumer_ID,
        c.Occupation,
        c.Age
    FROM consumers AS c
    JOIN ratings AS rt
        ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
) AS occupation_data
GROUP BY occupation_data.Occupation;

-- Question 3:
-- Rank ratings for Cuernavaca restaurants by
-- Overall_Rating in descending order, per restaurant.

WITH CuernavacaRatings AS (
    SELECT
        r.Name AS Restaurant_Name,
        r.City,
        rt.`ï»¿Consumer_ID` AS Consumer_ID,
        rt.Overall_Rating
    FROM restaurants AS r
    JOIN ratings AS rt
        ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
    WHERE r.City = 'Cuernavaca'
)
SELECT
    Restaurant_Name,
    City,
    Consumer_ID,
    Overall_Rating,
    RANK() OVER (
        PARTITION BY Restaurant_Name
        ORDER BY Overall_Rating DESC
    ) AS Rating_Rank
FROM CuernavacaRatings;

-- Question 4:
-- Show each rating alongside the consumer's average
-- Overall_Rating across all their ratings.

SELECT
    rt.`ï»¿Consumer_ID` AS Consumer_ID,
    rt.Restaurant_ID,
    rt.Overall_Rating,
    AVG(rt.Overall_Rating) OVER (
        PARTITION BY rt.`ï»¿Consumer_ID`
    ) AS Consumer_Average_Rating
FROM ratings AS rt;

-- Question 5:
-- Find the top 3 preferred cuisine rows for Students
-- with Low budget, ordered by Consumer_ID and cuisine.

WITH StudentLowBudgetCuisines AS (
    SELECT
        c.Consumer_ID,
        cp.Preferred_Cuisine
    FROM consumers AS c
    JOIN consumer_preferences AS cp
        ON c.Consumer_ID = cp.Consumer_ID
    WHERE c.Occupation = 'Student'
      AND c.Budget = 'Low'
),
RankedCuisines AS (
    SELECT
        Consumer_ID,
        Preferred_Cuisine,
        ROW_NUMBER() OVER (
            ORDER BY Consumer_ID, Preferred_Cuisine
        ) AS Row_Num
    FROM StudentLowBudgetCuisines
)
SELECT
    Consumer_ID,
    Preferred_Cuisine,
    Row_Num
FROM RankedCuisines
WHERE Row_Num <= 3;

-- Question 6:
-- For consumer U1008, show each Restaurant_ID,
-- Overall_Rating, and the next Overall_Rating
-- ordered by Restaurant_ID.

SELECT
    rating_data.Restaurant_ID,
    rating_data.Overall_Rating,
    LEAD(rating_data.Overall_Rating) OVER (
        ORDER BY rating_data.Restaurant_ID
    ) AS Next_Overall_Rating
FROM (
    SELECT
        Restaurant_ID,
        Overall_Rating
    FROM ratings
    WHERE `ï»¿Consumer_ID` = 'U1008'
) AS rating_data;

-- Question 7:
-- Create a view of Mexican restaurants with
-- average Overall_Rating greater than 1.5.

CREATE OR REPLACE VIEW HighlyRatedMexicanRestaurants AS
SELECT
    r.`ï»¿Restaurant_ID` AS Restaurant_ID,
    r.Name,
    r.City
FROM restaurants AS r
JOIN restaurant_cuisines AS rc
    ON r.`ï»¿Restaurant_ID` = rc.`ï»¿Restaurant_ID`
JOIN ratings AS rt
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE rc.Cuisine = 'Mexican'
GROUP BY
    r.`ï»¿Restaurant_ID`,
    r.Name,
    r.City
HAVING AVG(rt.Overall_Rating) > 1.5;

SELECT *
FROM HighlyRatedMexicanRestaurants;

-- Question 8
-- Find consumers who prefer Mexican cuisine but have not rated
-- any restaurant in the HighlyRatedMexicanRestaurants view.

WITH MexicanPreferenceConsumers AS (
    SELECT DISTINCT
        c.Consumer_ID
    FROM consumers AS c
    JOIN consumer_preferences AS cp
        ON c.Consumer_ID = cp.Consumer_ID
    WHERE cp.Preferred_Cuisine = 'Mexican'
)
SELECT
    mpc.Consumer_ID
FROM MexicanPreferenceConsumers AS mpc
WHERE NOT EXISTS (
    SELECT 1
    FROM ratings AS rt
    JOIN HighlyRatedMexicanRestaurants AS hm
        ON hm.Restaurant_ID = rt.Restaurant_ID
    WHERE rt.`ï»¿Consumer_ID` = mpc.Consumer_ID
)
ORDER BY mpc.Consumer_ID;

-- Question 9
-- Stored procedure to get ratings above a specified threshold.

DROP PROCEDURE IF EXISTS GetRestaurantRatingsAboveThreshold;

DELIMITER $$

CREATE PROCEDURE GetRestaurantRatingsAboveThreshold(
    IN p_Restaurant_ID VARCHAR(20),
    IN p_Min_Overall_Rating INT
)
BEGIN
    SELECT
        rt.`ï»¿Consumer_ID` AS Consumer_ID,
        rt.Overall_Rating,
        rt.Food_Rating,
        rt.Service_Rating
    FROM ratings AS rt
    WHERE rt.Restaurant_ID = p_Restaurant_ID
      AND rt.Overall_Rating >= p_Min_Overall_Rating;
END $$

DELIMITER ;

CALL GetRestaurantRatingsAboveThreshold('135028', 1);

--  Question 10
-- Find the top 2 highest-rated restaurants per cuisine.
-- DENSE_RANK includes ties in the rankings.

WITH RestaurantCuisineRatings AS (
    SELECT
        rc.Cuisine,
        r.`ï»¿Restaurant_ID` AS Restaurant_ID,
        r.Name AS Restaurant_Name,
        r.City,
        AVG(rt.Overall_Rating) AS Overall_Rating
    FROM restaurant_cuisines AS rc
    JOIN restaurants AS r
        ON r.`ï»¿Restaurant_ID` = rc.`ï»¿Restaurant_ID`
    JOIN ratings AS rt
        ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
    GROUP BY
        rc.Cuisine,
        r.`ï»¿Restaurant_ID`,
        r.Name,
        r.City
),
RankedRestaurants AS (
    SELECT
        Cuisine,
        Restaurant_Name,
        City,
        Overall_Rating,
        DENSE_RANK() OVER (
            PARTITION BY Cuisine
            ORDER BY Overall_Rating DESC
        ) AS Cuisine_Rank
    FROM RestaurantCuisineRatings
)
SELECT
    Cuisine,
    Restaurant_Name,
    City,
    Overall_Rating
FROM RankedRestaurants
WHERE Cuisine_Rank <= 2
ORDER BY Cuisine, Cuisine_Rank, Restaurant_Name;

--  Question 11
-- Create a view of consumer average ratings,
-- then find the top 5 consumers and count Mexican restaurants rated.

CREATE OR REPLACE VIEW ConsumerAverageRatings AS
SELECT
    rt.`ï»¿Consumer_ID` AS Consumer_ID,
    AVG(rt.Overall_Rating) AS Average_Rating
FROM ratings AS rt
GROUP BY rt.`ï»¿Consumer_ID`;

WITH TopConsumers AS (
    SELECT
        Consumer_ID,
        Average_Rating
    FROM ConsumerAverageRatings
    ORDER BY Average_Rating DESC
    LIMIT 5
)
SELECT
    tc.Consumer_ID,
    tc.Average_Rating,
    COUNT(
        DISTINCT CASE
            WHEN rc.Cuisine = 'Mexican' THEN rt.Restaurant_ID
        END
    ) AS Mexican_Restaurants_Rated
FROM TopConsumers AS tc
LEFT JOIN ratings AS rt
    ON tc.Consumer_ID = rt.`ï»¿Consumer_ID`
LEFT JOIN restaurant_cuisines AS rc
    ON rc.`ï»¿Restaurant_ID` = rt.Restaurant_ID
GROUP BY
    tc.Consumer_ID,
    tc.Average_Rating
ORDER BY tc.Average_Rating DESC;

-- Question 12
-- Identify the consumer's spending segment and evaluate
-- their ratings against each restaurant's average rating.

DROP PROCEDURE IF EXISTS GetConsumerSegmentAndRestaurantPerformance;

DELIMITER $$

CREATE PROCEDURE GetConsumerSegmentAndRestaurantPerformance(
    IN p_Consumer_ID VARCHAR(20)
)
BEGIN
    SELECT
        c.Consumer_ID,

        CASE
            WHEN c.Budget = 'Low' THEN 'Budget Conscious'
            WHEN c.Budget = 'Medium' THEN 'Moderate Spender'
            WHEN c.Budget = 'High' THEN 'Premium Spender'
            ELSE 'Unknown Budget'
        END AS Consumer_Segment,

        r.Name AS Restaurant_Name,
        rt.Overall_Rating AS Consumer_Overall_Rating,
        restaurant_avg.Restaurant_Average_Rating,

        CASE
            WHEN rt.Overall_Rating > restaurant_avg.Restaurant_Average_Rating
                THEN 'Above Average'
            WHEN rt.Overall_Rating = restaurant_avg.Restaurant_Average_Rating
                THEN 'At Average'
            ELSE 'Below Average'
        END AS Performance_Flag,

        RANK() OVER (
            ORDER BY rt.Overall_Rating DESC
        ) AS Consumer_Rating_Rank

    FROM consumers AS c

    JOIN ratings AS rt
        ON c.Consumer_ID = rt.`ï»¿Consumer_ID`

    JOIN restaurants AS r
        ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID

    JOIN (
        SELECT
            Restaurant_ID,
            AVG(Overall_Rating) AS Restaurant_Average_Rating
        FROM ratings
        GROUP BY Restaurant_ID
    ) AS restaurant_avg
        ON restaurant_avg.Restaurant_ID = rt.Restaurant_ID

    WHERE c.Consumer_ID = p_Consumer_ID

    ORDER BY rt.Overall_Rating DESC;
END $$

DELIMITER ;

CALL GetConsumerSegmentAndRestaurantPerformance('U1001');