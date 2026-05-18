-- =======================================================
-- RETAIL SALES PERFORMANCE - DATA CLEANING SCRIPT
-- Database: urban_mart_db
-- Objective: Initial data exploration and cleaning
-- ====================================================

--  1. Verify that the data is loaded

SELECT * FROM urban_mart_db.product_master;
SELECT * FROM urban_mart_db.retail_store_sales;
SHOW TABLES;


-- 2. Initial access and basic counts

SELECT COUNT(*) FROM product_master;
SELECT * FROM product_master LIMIT 5;

SELECT COUNT(*) FROM retail_store_sales;
SELECT * FROM retail_store_sales LIMIT 10;
SELECT COUNT(*) FROM retail_store_sales WHERE `Discount Applied` IS NULL OR `Discount Applied` = "";


-- 3. Table structure

DESCRIBE product_master;
DESCRIBE retail_store_sales;

-- 4. Count of null values ​​per column (text and numeric separately)

SELECT
	SUM(CASE WHEN `Customer ID` IS NULL THEN 1 ELSE 0 END) AS null_values_customer_id,
    SUM(CASE WHEN `Category` IS NULL OR `Category`= "" THEN 1 ELSE 0 END) AS null_values_category,
    SUM(CASE WHEN `Item` IS NULL OR `Item`= "" THEN 1 ELSE 0 END) AS null_values_item,
    SUM(CASE WHEN `Price Per Unit` IS NULL THEN 1 ELSE 0 END) AS null_values_Price_per_unit,
	SUM(CASE WHEN `Quantity` IS NULL THEN 1 ELSE 0 END) AS null_values_quantity,
    SUM(CASE WHEN `Total Spent` IS NULL THEN 1 ELSE 0 END) AS null_values_total_spent,
    SUM(CASE WHEN `Payment Method` IS NULL OR `Payment Method`= "" THEN 1 ELSE 0 END) AS null_values_payment_method,
    SUM(CASE WHEN `Location` IS NULL OR `Location`= "" THEN 1 ELSE 0 END) AS null_values_location,
    SUM(CASE WHEN `Transaction Date` IS NULL OR `Transaction Date`= "" THEN 1 ELSE 0 END) AS null_values_transaction_date,
    SUM(CASE WHEN `Discount Applied` IS NULL OR `Discount Applied`= "" THEN 1 ELSE 0 END) AS null_values_discount_applied
FROM retail_store_sales;

-- 5. Unique values ​​to detect spelling errors

SELECT DISTINCT `Category` FROM retail_store_sales ORDER BY `Category`;
SELECT DISTINCT `Payment Method` FROM retail_store_sales ORDER BY `Payment Method`;
SELECT DISTINCT `Location` FROM retail_store_sales ORDER BY `Location`;
SELECT DISTINCT `Discount Applied` FROM retail_store_sales ORDER BY `Discount Applied`;

-- 6. Look for blank spaces at the beginning or end

SELECT `Category` FROM retail_store_sales WHERE `Category` LIKE "% " OR `Category` LIKE " %";
SELECT `Payment Method` FROM retail_store_sales WHERE `Payment Method` LIKE "% " OR `Payment Method` LIKE " %";
SELECT `Location` FROM retail_store_sales WHERE `Location` LIKE "% " OR `Location` LIKE " %";
SELECT `Discount Applied` FROM retail_store_sales WHERE `Discount Applied` LIKE "% " OR `Discount Applied` LIKE " %";

-- Data cleaning process after this point

