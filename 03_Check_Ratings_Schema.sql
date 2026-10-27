
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 03_Check_Ratings_Schema.sql
-- Purpose: Inspect the ratings table structure
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- 1. Display column names, data types, and key information
SHOW COLUMNS FROM ratings;

-- 2. Display exact column names from database metadata
SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND TABLE_NAME = 'ratings'
ORDER BY ORDINAL_POSITION;
