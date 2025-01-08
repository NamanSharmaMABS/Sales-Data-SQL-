create database sales;
use sales;
-- Question: What is the structure of the sales dataset?
DESC sales;

-- Question: What does the entire sales dataset look like?
SELECT * FROM sales;

-- Question: What are the first 10 records in the dataset?
SELECT * FROM sales LIMIT 10;

-- Question: How many total sales records are present in the dataset?
SELECT COUNT(*) AS total_sales_records FROM sales;

-- Question: What is the total revenue generated?
SELECT ROUND(SUM(Sales), 2) AS total_revenue FROM sales;

-- Question: Which customer has made the highest total purchase?
SELECT 
    Customer_Name, 
    ROUND(SUM(Sales), 2) AS total_purchase
FROM sales
GROUP BY Customer_Name
ORDER BY total_purchase DESC
LIMIT 1;

-- Question: What is the average discount provided across all transactions?
SELECT ROUND(AVG(Discount), 2) AS avg_discount FROM sales;

-- Question: Which product category generated the highest total revenue?
SELECT 
    Category, 
    ROUND(SUM(Sales), 2) AS total_revenue
FROM sales
GROUP BY Category
ORDER BY total_revenue DESC
LIMIT 1;

-- Question: What is the distribution of sales across regions?
SELECT 
    Region, 
    ROUND(SUM(Sales), 2) AS total_sales
FROM sales
GROUP BY Region
ORDER BY total_sales DESC;

-- Question: What are the top 5 most profitable products?
SELECT 
    Product_Name, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 5;

-- Question: Which city has the highest number of sales transactions?
SELECT 
    City, 
    COUNT(*) AS num_transactions
FROM sales
GROUP BY City
ORDER BY num_transactions DESC
LIMIT 1;

-- Question: What is the average profit margin (profit as a percentage of sales) across all transactions?
SELECT ROUND(AVG(Profit / Sales) * 100, 2) AS avg_profit_margin FROM sales WHERE Sales > 0;

-- Question: What is the trend of total monthly sales over time?
SELECT 
    DATE_FORMAT(Order_Date, '%Y-%m') AS month, 
    ROUND(SUM(Sales), 2) AS total_monthly_sales
FROM sales
GROUP BY month
ORDER BY month;

-- Question: Which sub-category of products has the lowest profit?
SELECT 
    Sub_Category, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Sub_Category
ORDER BY total_profit ASC
LIMIT 1;

-- Question: What is the total revenue and profit for each shipping mode?
SELECT 
    Ship_Mode, 
    ROUND(SUM(Sales), 2) AS total_revenue, 
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales
GROUP BY Ship_Mode;

-- Question: How many unique customers are present in the dataset?
SELECT COUNT(DISTINCT Customer_ID) AS unique_customers FROM sales;

-- Question: What is the total quantity of products sold by category?
SELECT 
    Category, 
    SUM(Quantity) AS total_quantity
FROM sales
GROUP BY Category;

-- Question: What is the total revenue generated in each state?
SELECT 
    State, 
    ROUND(SUM(Sales), 2) AS total_revenue
FROM sales
GROUP BY State
ORDER BY total_revenue DESC;

-- Question: What is the percentage of transactions that include a discount?
SELECT 
    ROUND((SUM(CASE WHEN Discount > 0 THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS discount_percentage
FROM sales;

-- Question: Which order generated the highest profit?
SELECT 
    Order_ID, 
    ROUND(MAX(Profit), 2) AS highest_profit
FROM sales
GROUP BY Order_ID
ORDER BY highest_profit DESC
LIMIT 1;
