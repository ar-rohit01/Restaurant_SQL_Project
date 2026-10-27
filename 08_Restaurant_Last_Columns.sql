
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 08_Restaurant_Last_Columns.sql
-- Purpose: Inspect the last four columns of the restaurants table
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- Display the last four columns of the restaurants table
SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND TABLE_NAME = 'restaurants'
ORDER BY ORDINAL_POSITION
LIMIT 10, 4;
