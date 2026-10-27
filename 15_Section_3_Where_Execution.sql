USE restaurant_ratings_db;


-- ==========================================
-- SECTION 3: WHERE CLAUSE AND ORDER OF EXECUTION
-- ==========================================


-- Question 1:
-- List Consumer_IDs and count of restaurants rated,
-- only Students, only more than 2 ratings.

SELECT
    c.Consumer_ID,
    COUNT(rt.Restaurant_ID) AS Restaurant_Count
FROM consumers AS c
JOIN ratings AS rt
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
WHERE c.Occupation = 'Student'
GROUP BY c.Consumer_ID
HAVING COUNT(rt.Restaurant_ID) > 2;

-- Question 2:
-- Engagement_Score = integer Age / 10.
-- List Consumer_ID, Age, score only when score = 2
-- and Transportation_Method = Public.

SELECT
    Consumer_ID,
    Age,
    FLOOR(Age / 10) AS Engagement_Score
FROM consumers
WHERE FLOOR(Age / 10) = 2
  AND Transportation_Method = 'Public';

-- Question 3:
-- For each restaurant calculate average Overall_Rating.
-- List Name, City, average only for Cuernavaca
-- and average greater than 1.0.

SELECT
    r.Name,
    r.City,
    AVG(rt.Overall_Rating) AS Average_Overall_Rating
FROM restaurants AS r
JOIN ratings AS rt
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE r.City = 'Cuernavaca'
GROUP BY
    r.`ï»¿Restaurant_ID`,
    r.Name,
    r.City
HAVING AVG(rt.Overall_Rating) > 1.0;

-- Question 4:
-- Find consumers (Consumer_ID, Age) who are Married
-- and whose Food_Rating = Service_Rating for the same
-- restaurant, only where Overall_Rating = 2.

SELECT DISTINCT
    c.Consumer_ID,
    c.Age
FROM consumers AS c
JOIN ratings AS rt
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
WHERE c.Marital_Status = 'Married'
  AND rt.Food_Rating = rt.Service_Rating
  AND rt.Overall_Rating = 2;


-- Question 5:
-- List Consumer_ID, Age, Name of any restaurant rated
-- by Employed consumers who gave Food_Rating = 0
-- to at least one restaurant in Ciudad Victoria.

SELECT DISTINCT
    c.Consumer_ID,
    c.Age,
    r.Name
FROM consumers AS c
JOIN ratings AS rt
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
JOIN restaurants AS r
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE c.Occupation = 'Employed'
  AND EXISTS (
      SELECT 1
      FROM ratings AS rt2
      JOIN restaurants AS r2
          ON r2.`ï»¿Restaurant_ID` = rt2.Restaurant_ID
      WHERE rt2.`ï»¿Consumer_ID` = c.Consumer_ID
        AND rt2.Food_Rating = 0
        AND r2.City = 'Ciudad Victoria'
  );