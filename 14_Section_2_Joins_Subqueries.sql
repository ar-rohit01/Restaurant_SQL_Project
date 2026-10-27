
-- ============================================================
-- SQL PROJECT: Restaurant & Consumer Data Analysis
-- Section 2: Questions JOINs with Subqueries
-- File: 14_Section_2_Joins_Subqueries.sql
-- Database: restaurant_ratings_db
-- Total Questions: 10
-- ============================================================

USE restaurant_ratings_db;


-- ============================================================
-- Question 1:
-- List the names and cities of all restaurants that have an
-- Overall_Rating of 2 from at least one consumer.
-- ============================================================

SELECT DISTINCT r.Name, r.City
FROM restaurants AS r
JOIN ratings AS rt
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE rt.Overall_Rating = 2;


-- ============================================================
-- Question 2:
-- Find the Consumer_ID and Age of consumers who have rated
-- restaurants located in San Luis Potosi.
-- ============================================================

SELECT DISTINCT c.Consumer_ID, c.Age
FROM consumers AS c
JOIN ratings AS rt
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
JOIN restaurants AS r
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE r.City = 'San Luis Potosi';


-- ============================================================
-- Question 3:
-- List the names of restaurants that serve Mexican cuisine
-- and have been rated by consumer U1001.
-- ============================================================

SELECT DISTINCT r.Name
FROM restaurants AS r
JOIN restaurant_cuisines AS rc
    ON r.`ï»¿Restaurant_ID` = rc.`ï»¿Restaurant_ID`
JOIN ratings AS rt
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE rc.Cuisine = 'Mexican'
  AND rt.`ï»¿Consumer_ID` = 'U1001';


-- ============================================================
-- Question 4:
-- Find all details of consumers who prefer American cuisine
-- AND have a Medium budget.
-- ============================================================

SELECT DISTINCT c.*
FROM consumers AS c
JOIN consumer_preferences AS cp
    ON c.Consumer_ID = cp.Consumer_ID
WHERE cp.Preferred_Cuisine = 'American'
  AND c.Budget = 'Medium';


-- ============================================================
-- Question 5:
-- List restaurants (Name, City) with a Food_Rating lower
-- than the average Food_Rating across all ratings.
-- ============================================================

SELECT DISTINCT r.Name, r.City
FROM restaurants AS r
JOIN ratings AS rt
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE rt.Food_Rating < (
    SELECT AVG(Food_Rating)
    FROM ratings
);


-- ============================================================
-- Question 6:
-- Find consumers (Consumer_ID, Age, Occupation) who have
-- rated at least one restaurant but have NOT rated any
-- restaurant that serves Italian cuisine.
-- ============================================================

SELECT c.Consumer_ID, c.Age, c.Occupation
FROM consumers AS c
WHERE EXISTS (
    SELECT 1
    FROM ratings AS rt
    WHERE rt.`ï»¿Consumer_ID` = c.Consumer_ID
)
AND NOT EXISTS (
    SELECT 1
    FROM ratings AS rt
    JOIN restaurant_cuisines AS rc
        ON rt.Restaurant_ID = rc.`ï»¿Restaurant_ID`
    WHERE rt.`ï»¿Consumer_ID` = c.Consumer_ID
      AND rc.Cuisine = 'Italian'
);


-- ============================================================
-- Question 7:
-- List restaurant names that have received ratings from
-- consumers older than 30.
-- ============================================================

SELECT DISTINCT r.Name
FROM restaurants AS r
JOIN ratings AS rt
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
JOIN consumers AS c
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
WHERE c.Age > 30;


-- ============================================================
-- Question 8:
-- Find Consumer_ID and Occupation of consumers whose
-- preferred cuisine is Mexican and who gave an Overall_Rating
-- of 0 to at least one restaurant.
-- ============================================================

SELECT DISTINCT c.Consumer_ID, c.Occupation
FROM consumers AS c
JOIN consumer_preferences AS cp
    ON c.Consumer_ID = cp.Consumer_ID
JOIN ratings AS rt
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
WHERE cp.Preferred_Cuisine = 'Mexican'
  AND rt.Overall_Rating = 0;


-- ============================================================
-- Question 9:
-- List names and cities of restaurants that serve Pizzeria
-- cuisine and are located in a city where at least one
-- Student consumer lives.
-- ============================================================

SELECT DISTINCT r.Name, r.City
FROM restaurants AS r
JOIN restaurant_cuisines AS rc
    ON r.`ï»¿Restaurant_ID` = rc.`ï»¿Restaurant_ID`
WHERE rc.Cuisine = 'Pizzeria'
  AND EXISTS (
      SELECT 1
      FROM consumers AS c
      WHERE c.City = r.City
        AND c.Occupation = 'Student'
  );


-- ============================================================
-- Question 10:
-- Find consumers (Consumer_ID, Age) who are Social Drinkers
-- and have rated a restaurant that has No parking.
-- ============================================================

SELECT DISTINCT c.Consumer_ID, c.Age
FROM consumers AS c
JOIN ratings AS rt
    ON c.Consumer_ID = rt.`ï»¿Consumer_ID`
JOIN restaurants AS r
    ON r.`ï»¿Restaurant_ID` = rt.Restaurant_ID
WHERE c.Drink_Level = 'Social Drinker'
  AND r.Parking = 'None';

