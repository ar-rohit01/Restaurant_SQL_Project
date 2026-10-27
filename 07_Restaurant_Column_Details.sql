
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 07_Restaurant_Column_Details.sql
-- Purpose: Inspect restaurant column positions and data types
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- Display the position, name, and data type of every
-- column in the restaurants table
SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND TABLE_NAME = 'restaurants'
ORDER BY ORDINAL_POSITION;
