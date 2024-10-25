create database if not exists salesDataWalmart;
CREATE TABLE IF NOT EXISTS sales(
	invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
    branch VARCHAR(5) NOT NULL,
    city VARCHAR(30) NOT NULL,
    customer_type VARCHAR(30) NOT NULL,
    gender VARCHAR(30) NOT NULL,
    product_line VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    tax_pct FLOAT(6,4) NOT NULL,
    total DECIMAL(12, 4) NOT NULL,
    date DATETIME NOT NULL,
    time TIME NOT NULL,
    payment VARCHAR(15) NOT NULL,
    cogs DECIMAL(10,2) NOT NULL,
    gross_margin_pct FLOAT(11,9),
    gross_income DECIMAL(12, 4),
    rating FLOAT(2, 1)
);
select * from sales;

-- Add the time_of_day column
select time from sales;
select
	time,
	(case
		when `time` between "00:00:00" and "12:00:00" then "Morning"
        when `time` between "12:01:00" and "16:00:00" then "Afternoon"
        else "Evening"
    end) as time_of_day
from sales;
alter table sales add column time_of_day varchar(20);
update sales set time_of_day= (
case
		when `time` between "00:00:00" and "12:00:00" then "Morning"
        when `time` between "12:01:00" and "16:00:00" then "Afternoon"
        else "Evening"
end
);
select * from sales;

-- Add day_name column
select date, dayname(date) from sales;
alter table sales add column day_name varchar(10);
update sales set day_name=dayname(date);
select * from sales;

-- Add month_name column
select date, monthname(date) from sales;
alter table sales add column month_name varchar(10);
update sales set month_name=monthname(date);
select * from sales;

-- How many unique cities does the data have?
select distinct(city) from sales;
-- In which city is each branch?
select distinct(branch),city from sales;

-- --------------------------------------------------------------------
-- ---------------------------- Product -------------------------------
-- --------------------------------------------------------------------

-- How many unique product lines does the data have?
select * from sales;
select count(distinct(product_line)) from sales;
-- What is the most common payment method
select payment,count(payment) from sales group by payment order by count(payment) desc limit 1;
-- What is the most selling product line
select sum(quantity) as qty, product_line from sales group by product_line order by qty desc limit 1;
-- What is the total revenue by month
select month_name, sum(total) from sales group by month_name;	
-- What month had the largest COGS?
select sum(cogs),month_name from sales group by month_name order by sum(cogs) desc limit 1;
-- What product line had the largest revenue?
select product_line,sum(total) from sales group by product_line order by sum(total) desc limit 1;
-- What is the city with the largest revenue?
select city,sum(total) from sales group by city order by sum(total) desc limit 1;
-- What product line had the largest VAT?
select product_line,avg(tax_pct) from sales group by product_line order by avg(tax_pct) desc limit 1;
-- Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
select product_line, case when avg(total)>(select avg(total) from sales) then "Good" else "Bad" 
					end as remark from sales group by product_line;
-- Which branch sold more products than average product sold?
select branch,sum(quantity) from sales group by branch having sum(quantity) > (select avg(quantity) from sales) order by sum(quantity) desc limit 1;
-- What is the most common product line by gender
select product_line,gender,count(gender) from sales group by product_line,gender order by count(gender) desc limit 1;
-- What is the average rating of each product line
select round(avg(rating),2),product_line from sales group by product_line order by avg(rating) desc;

-- --------------------------------------------------------------------
-- -------------------------- Sales -------------------------------
-- --------------------------------------------------------------------

-- Number of sales made in each time of the day per weekday
select time_of_day,count(*) as total_sales from sales where day_name = "Sunday" group by time_of_day order by total_sales desc;
-- Which of the customer types brings the most revenue?
select customer_type,sum(total) from sales group by customer_type order by sum(total) desc;
-- Which city has the largest tax/VAT percent?
select city,round(avg(tax_pct),2) from sales group by city order by avg(tax_pct) desc;
-- Which customer type pays the most in VAT?
select customer_type,avg(tax_pct) from sales group by customer_type order by avg(tax_pct) desc;

-- --------------------------------------------------------------------
-- -------------------------- Customers -------------------------------
-- --------------------------------------------------------------------

-- How many unique customer types does the data have?
select * from sales;
select distinct customer_type from sales;
-- How many unique payment methods does the data have?
select distinct payment from sales;
-- What is the most common customer type?
select customer_type,count(*) from sales group by customer_type order by count(*) desc;
-- Which customer type buys the most?
select customer_type,count(*) from sales group by customer_type;
-- What is the gender of most of the customers?
select gender,count(*) from sales group by gender order by count(*) desc;
-- What is the gender distribution per branch?
select gender,count(*) from sales where branch="C" group by gender order by count(*) desc;
-- Which time of the day do customers give most ratings?
select time_of_day,avg(rating) from sales group by time_of_day order by avg(rating) desc;
-- Which time of the day do customers give most ratings per branch?
select time_of_day,avg(rating) from sales where branch="A" group by time_of_day order by avg(rating) desc;
-- Which day of the week has the best avg ratings?
select day_name,avg(rating) from sales group by day_name order by avg(rating) desc;
-- Which day of the week has the best average ratings per branch?
select day_name,avg(rating) from sales where branch="C" group by day_name order by avg(rating) desc;




