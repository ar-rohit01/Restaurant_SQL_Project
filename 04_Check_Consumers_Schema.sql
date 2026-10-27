
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 04_Check_Consumers_Schema.sql
-- Purpose: Inspect the consumers table structure
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- 1. Display column names, data types, and key information
SHOW COLUMNS FROM consumers;

-- 2. Display column positions, names, and data types
SELECT
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND TABLE_NAME = 'consumers'
ORDER BY ORDINAL_POSITION;
