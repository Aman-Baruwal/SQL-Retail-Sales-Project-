# SQL-Retail-Sales-Project-


## Project Overview

**Database**: `retail_sales_dataset`


## Objectives

1. **Data Cleaning**: Identify and remove any records with missing or null values.
2. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
3. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `retail_sales_dataset`.


### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique customers are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT * FROM retail_sales_dataset

---GETTING NUMBER OF CUSTOMERS
SELECT COUNT(DISTINCT(Customer_ID)) AS CUSTOMER_COUNT FROM retail_sales_dataset
SELECT DISTINCT Product_Category FROM retail_sales_dataset

--- CHECKING FOR NULL VALUES
SELECT * FROM retail_sales_dataset
WHERE Transaction_ID IS NULL OR 
Date IS NULL OR 
Customer_ID IS NULL OR 
GENDER IS NULL OR 
AGE IS NULL OR 
Product_Category IS NULL OR 
Quantity IS NULL OR		
Price_per_Unit IS NULL OR 
Total_Amount IS NULL

--- CHECKING FOR DUPLICATES
SELECT Transaction_ID, COUNT(*) AS COUNTS 
FROM retail_sales_dataset
GROUP BY Transaction_ID
HAVING COUNT(*)>1
```

### 3. Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

1. ** Write a SQL query to retrieve all sales where the quantity sold is greater than 3 and the sale occurred after '2023-05-01'.**:
```sql
SELECT * FROM retail_sales_dataset 
WHERE 
	Quantity > 3 
	AND
	Date > '2023-05-01'
ORDER BY Date
```

2. **Write a SQL query to calculate the TOTAL AMOUNT for each product CATEGORY. Sort the result in descending order of TOTAL AMOUNT.**:
```sql
SELECT Product_Category , SUM(Total_Amount) AS TOTAL_AMOUNT_CAT
FROM retail_sales_dataset
GROUP BY Product_Category
ORDER BY SUM(Total_Amount) DESC
```

3. **Write a SQL query to find the maximum and minimum purchase amount made by customers in the 'Electronics' category.**:
```sql
SELECT MAX(Total_Amount) AS MAXIMUM_AMOUNT,MIN(Total_Amount) AS MINIMUM_AMOUNT FROM retail_sales_dataset
WHERE Product_Category = 'Electronics'
```

4. **Write a SQL query to list all customers who have not made any purchase in the 'Clothing' category.**:
```sql
SELECT DISTINCT(Customer_ID) FROM retail_sales_dataset
WHERE Customer_ID NOT IN(
	SELECT Customer_ID
	FROM retail_sales_dataset
	WHERE Product_Category = 'Clothing'
)

```

5. **Write a SQL query to find the top 3 CUSTOMERS with the highest AMOUNT.**:
```sql

SELECT TOP 3 Customer_ID,SUM(Total_Amount) AS AMT
FROM retail_sales_dataset
GROUP BY Customer_ID
ORDER BY AMT DESC 
```

6. **Write a SQL query to calculate the total number of distinct customers who made purchases each month in 2023..**:
```sql
SELECT COUNT(DISTINCT(Customer_ID)) AS NUM_CUS, MONTH(Date) AS MONTHS
FROM retail_sales_dataset
WHERE YEAR(Date) = '2023'
GROUP BY MONTH(Date)
ORDER BY MONTHS ASC
```

7. **Write a SQL query to find the total number of male and female customers who made purchases above 1500 in total.**:
```sql
SELECT GENDER , COUNT(*) AS COUNTS
FROM retail_sales_dataset
WHERE Total_Amount > '1500'
GROUP BY GENDER
```

8. **Write a SQL query to identify customers who have made purchases in every category.**:
```sql
SELECT Customer_ID
FROM retail_sales_dataset
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Product_Category) = (
    SELECT COUNT(DISTINCT Product_Category)
    FROM retail_sales_dataset
)
```



