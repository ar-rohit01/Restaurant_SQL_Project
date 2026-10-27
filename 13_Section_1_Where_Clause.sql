
-- ============================================================
-- SQL PROJECT: Restaurant & Consumer Data Analysis
-- Section 1: Using the WHERE Clause
-- File: 13_Section_1_Where_Clause.sql
-- Database: restaurant_ratings_db
-- Total Questions: 5
-- ============================================================

USE restaurant_ratings_db;


-- ============================================================
-- Question 1:
-- List all details of consumers who live in Cuernavaca.
-- ============================================================

SELECT *
FROM consumers
WHERE City = 'Cuernavaca';


-- ============================================================
-- Question 2:
-- Find Consumer_ID, Age, and Occupation of consumers who
-- are Students AND Smokers.
-- ============================================================

SELECT Consumer_ID, Age, Occupation
FROM consumers
WHERE Occupation = 'Student'
  AND Smoker = 'Yes';


-- ============================================================
-- Question 3:
-- List Name, City, Alcohol_Service, and Price of restaurants
-- that serve Wine & Beer and have a Medium price level.
-- ============================================================

SELECT Name, City, Alcohol_Service, Price
FROM restaurants
WHERE Alcohol_Service = 'Wine & Beer'
  AND Price = 'Medium';


-- ============================================================
-- Question 4:
-- Find the names and cities of restaurants that are franchises.
-- ============================================================

SELECT Name, City
FROM restaurants
WHERE Franchise = 'Yes';


-- ============================================================
-- Question 5:
-- Show Consumer_ID, Restaurant_ID, and Overall_Rating where
-- Overall_Rating is 2 (Highly Satisfactory).
-- ============================================================

SELECT `ï»¿Consumer_ID`, Restaurant_ID, Overall_Rating
FROM ratings
WHERE Overall_Rating = 2;
