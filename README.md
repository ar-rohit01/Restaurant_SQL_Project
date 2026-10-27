# Restaurant & Consumer Data Analysis Using SQL

## 📌 Project Overview

This project focuses on analyzing restaurant and consumer data using SQL. It explores consumer preferences, restaurant characteristics, cuisine information, and customer ratings to answer business-related questions and demonstrate practical SQL skills.

The project covers database exploration, data filtering, joins, subqueries, Common Table Expressions (CTEs), window functions, views, and stored procedures.

## 🎯 Project Objectives

- Explore the database structure and understand the available tables.
- Inspect column names, schemas, and table relationships.
- Analyze consumer preferences and restaurant information.
- Filter records using SQL `WHERE` conditions.
- Combine information from multiple tables using joins and subqueries.
- Apply advanced SQL concepts to analyze restaurant ratings.
- Create views and stored procedures for reusable analysis.
- Generate meaningful results from restaurant and consumer data.

## 🗄️ Database Overview

**Database name:** `restaurant_ratings_db`

The project includes the following tables:

| Table Name | Number of Records |
|---|---:|
| `consumers` | 138 |
| `consumer_preferences` | 330 |
| `restaurants` | 130 |
| `restaurant_cuisines` | 112 |
| `ratings` | 1,161 |
| `data_dictionary` | 33 |

**Total records across the six tables:** 1,904

## 🛠️ Tools and Technologies

- **SQL** — Database querying and analysis
- **Relational Database** — Working with structured restaurant and consumer data
- **GitHub** — Project version control and portfolio presentation

## 📂 Project Structure

```text
Restaurant_SQL_Project/
│
├── Dataset/
│
├── 01_Database_Overview.sql
├── 02_Check_Preferences_Schema.sql
├── 03_Check_Ratings_Schema.sql
├── 04_Check_Consumers_Schema.sql
├── 05_Check_Restaurants_Schema.sql
├── 06_Restaurant_Column_Names.sql
├── 07_Restaurant_Column_Details.sql
├── 08_Restaurant_Last_Columns.sql
├── 09_Check_Restaurant_Cuisines_Schema.sql
├── 10_Check_Data_Dictionary_Schema.sql
├── 11_Verify_Table_Row_Counts.sql
├── 12_Consumers_From_Cuernavaca.sql
├── 13_Section_1_Where_Clause.sql
├── 14_Section_2_Joins_Subqueries.sql
├── 15_Section_3_Where_Execution.sql
├── 16_Section_4_Advanced_SQL.sql
│
└── README.md
```

The `Dataset/` folder contains the project's dataset files. The numbered SQL files organize the database exploration and analysis queries into manageable sections.

## 📊 SQL Analysis and Tasks

### 1. Database Exploration

- Examined the database and its tables.
- Inspected table schemas and column names.
- Reviewed restaurant column details.
- Verified the number of records in each table.

### 2. Filtering with WHERE Clauses

Used filtering conditions to answer questions about consumers, restaurant characteristics, and ratings.

Examples of findings:

- Identified **22 consumers** from Cuernavaca.
- Found **23 consumers** matching the Student and Smoker = Yes conditions.
- Identified **15 restaurants** offering Wine & Beer with a Medium price level.
- Found **22 franchise restaurants**.
- Retrieved **486 rating records** with an overall rating of 2.

### 3. Joins and Subqueries

Used joins and subqueries to combine information from related tables and investigate consumer preferences, restaurant details, cuisines, and ratings.

### 4. Advanced SQL

Applied advanced SQL techniques to create reusable analysis and extract insights.

Concepts covered include:

- Common Table Expressions (CTEs)
- Window functions
- `DENSE_RANK()`
- Views
- Stored procedures
- Aggregate functions
- Conditional analysis

Examples of completed tasks include:

- Created a view named `HighlyRatedMexicanRestaurants`, which returned five restaurants.
- Used `DENSE_RANK()` to identify highly rated restaurants within cuisine groups.
- Created a `ConsumerAverageRatings` view and used a CTE to analyze consumer rating averages.
- Developed a stored procedure to retrieve restaurant ratings above a specified threshold.
- Developed a stored procedure to analyze consumer segments and restaurant rating performance.

## 💡 Key Learnings

Through this project, I gained practical experience in:

- Understanding database schemas and table structures.
- Writing structured SQL queries.
- Applying filtering conditions to retrieve specific records.
- Combining data using joins and subqueries.
- Using aggregate functions for analysis.
- Writing CTEs and window-function queries.
- Creating views and stored procedures.
- Validating query outputs and interpreting results.
- Organizing SQL scripts for readability and maintainability.

## ⚠️ Challenges Faced

During the project, I worked on challenges such as:

- Understanding table structures and identifying appropriate columns for joins.
- Handling imported column names containing unexpected encoding characters.
- Writing more complex queries using CTEs and window functions.
- Developing reusable SQL logic with views and stored procedures.
- Checking query results to ensure that they matched the intended conditions.

These challenges helped me improve my SQL problem-solving and database analysis skills.

## 🚀 How to Use This Project

1. Clone or download this repository.
2. Open the SQL files in a compatible SQL database client.
3. Review the database overview and schema-checking scripts.
4. Make sure the database and source tables are available before executing queries that depend on them.
5. Execute the numbered SQL scripts in the appropriate order.
6. Review the query results and compare them with the findings documented in this README.

**Note:** Database setup requirements and SQL syntax may vary depending on the database management system used. Refer to the SQL scripts and dataset files for the exact setup requirements.

## 📌 Conclusion

This project demonstrates my practical SQL skills through restaurant and consumer data analysis, from initial database exploration to advanced queries and reusable database objects.

It strengthened my understanding of relational data, query writing, data analysis, and SQL problem-solving.

## 👨‍💻 Author

**Rohit Rajaram Yadav**

- LinkedIn: [www.linkedin.com/in/rohitryadavgenai]
- GitHub: [https://github.com/ar-rohit01]

---

⭐ If you find this project useful, feel free to explore the SQL scripts and review the analysis.
