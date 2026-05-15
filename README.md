# Welcome to my project for my personal data analyst portfolio.

This project, called "Retail Sales Performance," was created using data obtained from the website www.kaglle.com, specifically from the repository "Retail Store Sales: Dirty for Data Cleaning." This project aims to simulate a controlled data analysis environment in which I seek to establish certain parameters, processes, and other elements that will demonstrate proficiency in the use of relevant tools and knowledge in this field.

## Case Study

The main objective of a "Retail Sales Performance" project using SQL, Python, and Power BI is to measure, optimize, and improve a company's ability to sell more and better within a given period.

In this case, the problem presented is as follows: The retail company "UrbanMart" has experienced growth in gross sales, but profit margins have decreased in recent quarters. The management team does not understand which products, categories, or customer segments are affecting profitability. Furthermore, there is no clear understanding of purchasing patterns by season, day of the week, or geographic location.

*Key question:* Which products, categories, and customer segments generate the highest profitability, and how can discount and promotional strategies be optimized to improve overall margin without affecting sales volume?

### Initial hypothesis:

*Discounts do not always translate into higher volume for high-margin products.*

*There are categories with high turnover but low profitability (such as certain accessories or low-cost electronics).*

*Weekends and specific days show sales peaks that could be leveraged with targeted promotions.*

*Recurring customers (high loyalty) generate higher value per transaction than new customers.*

## Key Phases or Steps to Implement

### Phase 1: Extraction and Cleaning in SQL (MySQL Workbench)

Load raw dataset into MySQL
Detect and handle null values (fields such as Discount Applied, Customer ID)
Validate data types (dates, amounts, quantities)
Remove explicit duplicates
Create date_dimension table using date functions
Export clean dataset to CSV for Python

### Phase 2: Transformation and Metrics in Python (Jupyter Notebook)

Connect to MySQL and read clean data (using pandas, mysql-connector)
Advanced Cleaning:
Detect outliers in Total Spent and Quantity
Create Net_Revenue column (subtracting the discount effect, if any)
Estimate Unit_Cost by category (to calculate Profit_Margin)
Feature Engineering:
Weekend (if date is Saturday/Sunday)
Sales_Range (Low, Medium, High) High
Customer_Tier (based on frequency/value)
Generate defined metrics and KPIs
Save final dataset in clean_data.csv

### Phase 3: Dashboard in Power BI

Import clean_data.csv
Create DAX measures for KPIs
Build interactive visuals:
Cards (Total Sales, Profit, Margin %)
Line (sales per month)
Bars (Top/Bottom products)
Map (sales by location)
Matrix (category vs. segment)
Add filters (date, category, payment method)

## Challenges encountered

*Null values in Discount Applied:* Decide whether to impute with FALSE or analyze separately.
*No actual Unit_Cost:* Estimate based on categories using percentiles from the same dataset.
*Inconsistent Customer ID:* Validate format and create frequency table.
*Limited geographic granularity:* Create regions by grouping similar locations.
*Dates without time:* Sufficient for daily/monthly analysis.

## Metrics and KPIs to consider:

*Total Sales = SUM(sales)*
*Total Profit = SUM(profit)*
*Profit Margin = SUM(profit) / SUM(sales)*
*Average Order Value (AOV) = total_sales / COUNT(order_id)*
*Top 5 Products = SUM(sales) GROUP BY sub_category*
*Bottom 5 Products = SUM(sales) GROUP BY sub_category DESC*
*Sales by Month = SUM(sales) GROUP BY MONTH(order_date)*
*Sales by Day of Week = SUM(sales) GROUP BY WEEKDAY*