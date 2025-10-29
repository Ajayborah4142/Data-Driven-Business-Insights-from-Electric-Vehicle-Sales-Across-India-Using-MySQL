-- Create Database 

DROP DATABASE IF EXISTS Electric_vehicle_sales ;
CREATE DATABASE Electric_vehicle_sales;
USE Electric_vehicle_sales;

DROP TABLE IF EXISTS vehicle_sales;

-- Create Table 

CREATE TABLE vehicle_sales (
vehicle_sales VARCHAR(50) ,
Date DATE ,
State VARCHAR(50) ,
Vehicle_Class VARCHAR(50) ,
Vehicle_Category VARCHAR(50) ,
Vehicle_Type VARCHAR(50) ,
EV_Sales_Quantity INT

);

-- Dataset Load Using MySQL Code 

SET GLOBAL LOCAL_INFILE=ON;
LOAD DATA LOCAL INFILE "C:/Users/Lenovo/OneDrive/Documents/SQL Programming/Electric Vehicle Sales by State in India.csv"  INTO TABLE vehicle_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

---------------------------------------------------------------------------------------------------------------------


-- ********************************** 1. Descriptive Analysis  **************************************************


-- Q.1) What is the total EV sales across all states?

SELECT SUM(EV_Sales_Quantity) AS Total_Sold  
FROM vehicle_sales ;


-- Q.2) How many vehicles were sold per Vehicle_Class (e.g., sedan, SUV)?

SELECT Vehicle_Class, COUNT(*) AS Total_Count
FROM vehicle_sales
GROUP BY Vehicle_Class
ORDER BY Total_Count DESC ;

-- Q.3) Which State had the highest EV sales last year?

SELECT State, 
       SUM(EV_Sales_Quantity) AS Total_Sales
FROM vehicle_sales
WHERE Date > DATE_SUB((SELECT MAX(Date) FROM vehicle_sales), INTERVAL 1 YEAR)
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 1;

-- Q.4) What is the monthly or yearly trend of EV sales?

SELECT 
	   YEAR(Date) AS Yearly_Sales , 
       SUM(EV_Sales_Quantity) AS Total_Sales
FROM vehicle_sales
GROUP BY YEAR(Date)
ORDER BY Total_Sales DESC ;


-- Q.5) How many different Vehicle_Types and Vehicle_Categories exist in the dataset?

SELECT COUNT(DISTINCT Vehicle_Type ) AS Vehicle_Type ,
       COUNT(DISTINCT Vehicle_Category ) AS Vehicle_Category
FROM vehicle_sales ;

-- ********************************** 2. Comparative Analysis  **************************************************

-- Q.6) Compare EV sales between States. Which states are leading and lagging ?

SELECT State, SUM(EV_Sales_Quantity) AS Total_Count 
 FROM vehicle_sales 
GROUP BY State
ORDER BY Total_Count DESC ;


-- Q.7) Compare Vehicle_Class performance over time. Which classes are more popular?

SELECT Vehicle_Class, 
	   SUM(EV_Sales_Quantity) AS Total_Sold
FROM vehicle_sales
GROUP BY Vehicle_Class 
ORDER BY Total_Sold DESC
LIMIT 1 ;


-- Q.8) How do EV sales differ across Vehicle_Category?

SELECT Vehicle_Category, 
       SUM(EV_Sales_Quantity) AS Total 
FROM vehicle_sales
GROUP BY Vehicle_Category
ORDER BY Total DESC ;


SELECT 
   SUM(CASE WHEN Vehicle_Category = '2-Wheelers' THEN 1 ELSE 0 END ) AS Two_Wheelers ,
   SUM(CASE WHEN Vehicle_Category = '3-Wheelers' THEN 1 ELSE 0 END ) AS Three_Wheelers ,
   SUM(CASE WHEN Vehicle_Category = '4-Wheelers' THEN 1 ELSE 0 END ) AS Four_Wheelers ,
   SUM(CASE WHEN Vehicle_Category = 'Others' THEN 1 ELSE 0 END ) AS Others ,
   SUM(CASE WHEN Vehicle_Category = 'Bus' THEN 1 ELSE 0 END ) AS Bus
FROM vehicle_sales ;

   
-- ********************************* 3. Trend & Time Series Analysis ******************************************

-- Q.9) What is the monthly trend of EV sales over the last 5 years?

SELECT DATE_FORMAT(Date,"%m-%Y") AS Date , 
       SUM(EV_Sales_Quantity) AS EV_Sales
FROM vehicle_sales
WHERE DATE > DATE_SUB(
             (SELECT MAX(DATE) FROM vehicle_sales) ,
             INTERVAL 5 YEAR ) 
GROUP BY DATE_FORMAT(Date,"%m-%Y")
ORDER BY Date ;


-- Q.10) Are there seasonal patterns in EV sales (e.g., higher sales during festive months)?

SELECT MONTH(Date), 
	   SUM(EV_Sales_Quantity) AS EV_Sales
FROM vehicle_sales
GROUP BY MONTH(Date) ;

-- Q.11) How has the growth rate of EV sales changed year over year? 

SELECT 
    YEAR(Date) AS Year,
    SUM(EV_Sales_Quantity) AS Total_Sales,
    LAG(SUM(EV_Sales_Quantity)) OVER (ORDER BY YEAR(Date)) AS Prev_Year_Sales,
    ROUND(
        ( (SUM(EV_Sales_Quantity) - 
            LAG(SUM(EV_Sales_Quantity)) OVER (ORDER BY YEAR(Date)) )
          / LAG(SUM(EV_Sales_Quantity)) OVER (ORDER BY YEAR(Date)) ) * 100, 2
    ) AS YoY_Growth_Percent
FROM vehicle_sales
GROUP BY YEAR(Date)
ORDER BY Year;

-- Q.12) Which vehicle classes are showing the fastest adoption rates for EVs?

SELECT Vehicle_Class, SUM(EV_Sales_Quantity) AS Total_EV_Sold
FROM vehicle_sales
WHERE State = 'Andhra Pradesh'
GROUP BY Vehicle_Class
ORDER BY Total_EV_Sold DESC
LIMIT 5;

-- Q.13) What is the market share of EVs versus non-EVs, segmented by vehicle category?

SELECT Vehicle_Category,
       SUM(EV_Sales_Quantity) AS Total_EV_Sold,
       COUNT(*) AS Total_Vehicles,
       SUM(EV_Sales_Quantity)/COUNT(*)*100 AS EV_Market_Share_Percent
FROM vehicle_sales
WHERE State = 'Andhra Pradesh'
GROUP BY Vehicle_Category;

-- Q.14)  Which vehicle types (Bus, Others, Institution Bus) are lagging in EV adoption?

SELECT Vehicle_Type, SUM(EV_Sales_Quantity) AS Total_EV_Sold
FROM vehicle_sales
WHERE State = 'Andhra Pradesh'
GROUP BY Vehicle_Type
HAVING Total_EV_Sold = 0;

-- Q.15) Are there any periods (monthly/quarterly) with spikes or drops in EV sales?

SELECT DATE_FORMAT(Date, '%Y-%m') AS Month, SUM(EV_Sales_Quantity) AS Total_EV_Sold
FROM vehicle_sales
WHERE State = 'Andhra Pradesh'
GROUP BY Month
ORDER BY Month;

-- Q.16) Which specific vehicle class should be targeted for EV conversion, based on consistently high total sales, but low EV penetration?

SELECT Vehicle_Class,
       COUNT(*) AS Total_Sales,
       SUM(EV_Sales_Quantity) AS Total_EV_Sold
FROM vehicle_sales
WHERE State = 'Andhra Pradesh'
GROUP BY Vehicle_Class
HAVING Total_EV_Sold/COUNT(*) < 0.01 -- Less than 1% sales as EV
ORDER BY Total_Sales DESC
LIMIT 5;


-- Q.17)  Are there any vehicle classes with repeated zero EV sales, indicating resistance or unsuitability for EV adoption?

SELECT Vehicle_Class, COUNT(*) AS No_EV_Sales_Count
FROM vehicle_sales
WHERE EV_Sales_Quantity = 0 AND State = 'Andhra Pradesh'
GROUP BY Vehicle_Class
ORDER BY No_EV_Sales_Count DESC
LIMIT 5;


-- Q.18) What is the projected EV adoption rate for the next year if current trends continue?

SELECT YEAR(Date) AS Year, SUM(EV_Sales_Quantity) AS Total_EV_Sold
FROM vehicle_sales
WHERE State = 'Andhra Pradesh'
GROUP BY Year
ORDER BY Year;

Q.19) How does the adoption of EVs differ across vehicle categories (e.g. Others vs. Bus), and what factors might explain gaps?

SELECT Vehicle_Category,
       SUM(EV_Sales_Quantity) AS Total_EV_Sold,
       COUNT(*) AS Total_Entries,
       SUM(EV_Sales_Quantity)/COUNT(*)*100 AS EV_Penetration_Percent
FROM vehicle_sales
WHERE State = 'Andhra Pradesh'
GROUP BY Vehicle_Category;


-- Q.20)  What proportion of total vehicle registrations are currently EVs, and how does this compare to industry targets or policy goals?

SELECT SUM(EV_Sales_Quantity) AS Total_EV_Sold,
       COUNT(*) AS Total_Registrations,
       SUM(EV_Sales_Quantity)/COUNT(*)*100 AS EV_Share_Percent
FROM vehicle_sales
WHERE State = 'Andhra Pradesh';


---------------------------------------------------------------------------------------------------------------
