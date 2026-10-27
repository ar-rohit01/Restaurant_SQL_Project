
-- ============================================================
-- Project: Restaurant & Consumer Data Analysis Using SQL
-- File: 10_Check_Data_Dictionary_Schema.sql
-- Purpose: Inspect the data_dictionary table structure
-- Database: restaurant_ratings_db
-- ============================================================

USE restaurant_ratings_db;

-- Display column names, data types, and key information
SHOW COLUMNS FROM data_dictionary;
