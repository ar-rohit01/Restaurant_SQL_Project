
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 05_Check_Restaurants_Schema.sql
-- Purpose: Inspect the restaurants table structure
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- 1. Display restaurant column names and data types
SHOW COLUMNS FROM restaurants;


-- 2. Generate a comma-separated list of restaurant column names
SELECT
    GROUP_CONCAT(
        CONCAT('`', COLUMN_NAME, '`')
        ORDER BY ORDINAL_POSITION
        SEPARATOR ', '
    ) AS restaurant_columns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND TABLE_NAME = 'restaurants';
