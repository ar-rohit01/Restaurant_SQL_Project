
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 02_Check_Preferences_Schema.sql
-- Purpose: Verify the consumer_preferences table structure
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- Display the column names of consumer_preferences
SELECT
    COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND TABLE_NAME = 'consumer_preferences'
ORDER BY ORDINAL_POSITION;

-- Verify column names and data types
SHOW COLUMNS FROM consumer_preferences;
