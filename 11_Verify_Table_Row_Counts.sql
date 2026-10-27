
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 11_Verify_Table_Row_Counts.sql
-- Purpose: Count records in all six project tables
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- Display the total number of records in each table
SELECT 'consumers' AS table_name, COUNT(*) AS total_rows
FROM consumers

UNION ALL

SELECT 'consumer_preferences', COUNT(*)
FROM consumer_preferences

UNION ALL

SELECT 'restaurants', COUNT(*)
FROM restaurants

UNION ALL

SELECT 'restaurant_cuisines', COUNT(*)
FROM restaurant_cuisines

UNION ALL

SELECT 'ratings', COUNT(*)
FROM ratings

UNION ALL

SELECT 'data_dictionary', COUNT(*)
FROM data_dictionary;
