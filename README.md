# Walmart-Sales-Data-Analysis-with-MySQL

# Project Overview
This project involves the analysis of Walmart sales data using MySQL. The aim is to gain insights into various aspects of Walmart's operations, including product performance, sales trends, customer behavior, and branch performance. This analysis is conducted using SQL queries to extract and interpret the data.

# Objectives
Understand Top Performing Branches: Identify which branches perform best in terms of sales.
Analyze Product Performance: Determine which product lines are selling the most and which are least popular.
Customer Behavior Insights: Investigate how customer types and payment methods affect sales.
Gender Distribution: Analyze the distribution of customers by gender and their purchasing behavior.
Time-of-Day Sales Analysis: Understand the sales patterns throughout different times of the day and week.
Value Added Tax (VAT) Analysis: Evaluate how VAT and other taxes impact sales.

# Data Source
The data used in this project is from the Walmart Sales Forecasting Competition available at Kaggle.

# Approach Used
--Data Wrangling: This is the first step where inspection of data is done to make sure NULL values and missing values are detected and data replacement methods are used to replace, missing or NULL values.
Build a database
Create table and insert the data.
Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.
--Feature Engineering: This will help use generate some new columns from existing ones.
Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.
Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.
--Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.
# Insights
General Insights
Unique Cities: The dataset includes sales data from three distinct cities.
Branch Locations: There are three branches (A, B, C) distributed across these cities.
# Product Insights
Product Lines: The dataset includes six distinct product lines.
Most Common Product Line: Fashion accessories are the most commonly sold product line, followed by food and beverages.
Least Common Product Line: Health and beauty products are the least commonly sold.
Average Ratings: Food and beverages have the highest average rating, followed by fashion accessories.
# Sales Insights
Sales by Time of Day: Sales are highest during the evening hours and lowest in the morning.
Customer Types: Members generate slightly more revenue than normal customers, but the difference is not significant.
Value Added Tax (VAT): There is no significant difference in VAT paid by members and normal customers.
# Customer Insights
Gender Distribution: The gender distribution is almost equal between males and females.
Gender Distribution by Branch: Branch C has more female customers, while Branches A and B have more male customers.
Ratings by Time of Day: Customers tend to give higher ratings during the afternoon, but the difference is minimal across the day.
Ratings by Day of the Week: Monday has the highest ratings, followed by Thursday and then Wednesday.
# Branch Insights
Best Performing Branch: Branch C has the highest total revenue, followed by Branch A and then Branch B.
Customer Ratings by Branch: Branch A has the highest ratings on Fridays, Branch B on Mondays, and Branch C on Saturdays.

# Recommendations
Focus on Evening Sales: Given that sales are highest during the evening, consider running promotions or offering discounts during this time to further boost sales.
Improve Branch B Performance: Branch B lags behind in both sales and customer ratings. Investigate and address the underlying issues to improve its performance.
Target Gender-Specific Marketing: Since the gender distribution varies by branch, tailor marketing strategies to better appeal to the predominant gender at each branch.
Enhance Customer Experience on Mondays: Given that Monday has the highest ratings, ensure that the quality of service remains high throughout the week to maintain customer satisfaction.
Optimize Product Mix: Focus on promoting and stocking more of the top-performing product lines (fashion accessories, food and beverages) to drive sales.
