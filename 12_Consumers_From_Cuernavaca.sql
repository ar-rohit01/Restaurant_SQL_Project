
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 12_Consumers_From_Cuernavaca.sql
-- Purpose: Answer Section 1, Question 1
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- Question 1: Retrieve all consumer details for Cuernavaca
SELECT *
FROM consumers
WHERE City = 'Cuernavaca';
