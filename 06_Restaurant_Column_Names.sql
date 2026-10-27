
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 06_Restaurant_Column_Names.sql
-- Purpose: List restaurant column names in their table order
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- Display all column names from the restaurants table
SELECT
    ORDINAL_POSITION,
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND TABLE_NAME = 'restaurants'
ORDER BY ORDINAL_POSITION;
