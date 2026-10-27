
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 01_Database_Overview.sql
-- Purpose: Initial database verification and schema inspection
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;


-- 1. Preview the first five consumer records
SELECT *
FROM consumers
LIMIT 5;


-- 2. Verify the number of records in all six tables
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


-- 3. Display column names and data types for all tables
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
ORDER BY TABLE_NAME, ORDINAL_POSITION;


-- 4. Display a compact list of columns for each table
SELECT
    TABLE_NAME,
    GROUP_CONCAT(
        COLUMN_NAME
        ORDER BY ORDINAL_POSITION
        SEPARATOR ', '
    ) AS column_names
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
GROUP BY TABLE_NAME
ORDER BY TABLE_NAME;


-- 5. Investigate unusual characters in selected column names
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    HEX(COLUMN_NAME) AS column_hex
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'restaurant_ratings_db'
  AND (
      COLUMN_NAME LIKE '%Consumer_ID'
      OR COLUMN_NAME LIKE '%Restaurant_ID'
      OR COLUMN_NAME LIKE '%Table'
  )
ORDER BY TABLE_NAME, ORDINAL_POSITION;
