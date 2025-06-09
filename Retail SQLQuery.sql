SELECT * FROM retail_sales_dataset

---GETTING NUMBER OF CUSTOMERS
SELECT COUNT(DISTINCT(Customer_ID)) AS CUSTOMER_COUNT FROM retail_sales_dataset

--- CHEKING FOR NULL VALUES
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

--- Write a SQL query to retrieve all sales where the quantity sold is greater than 3 and the sale occurred after '2023-05-01'.
SELECT * FROM retail_sales_dataset 
WHERE 
	Quantity > 3 
	AND
	Date > '2023-05-01'
ORDER BY Date

---Write a SQL query to calculate the TOTAL AMOUNT for each product CATEGORY. Sort the result in descending order of TOTAL AMOUNT.

SELECT Product_Category , SUM(Total_Amount) AS TOTAL_AMOUNT_CAT
FROM retail_sales_dataset
GROUP BY Product_Category
ORDER BY SUM(Total_Amount) DESC

---Write a SQL query to find the maximum and minimum purchase amount made by customers in the 'Electronics' category.

SELECT MAX(Total_Amount) AS MAXIMUM_AMOUNT,MIN(Total_Amount) AS MINIMUM_AMOUNT FROM retail_sales_dataset
WHERE Product_Category = 'Electronics'

---Write a SQL query to list all customers who have not made any purchase in the 'Clothing' category.

SELECT DISTINCT(Customer_ID) FROM retail_sales_dataset
WHERE Customer_ID NOT IN(
	SELECT Customer_ID
	FROM retail_sales_dataset
	WHERE Product_Category = 'Clothing'
)


---Write a SQL query to find the top 3 CUTOMER with the highest AMOUNT.

SELECT TOP 3 Customer_ID,SUM(Total_Amount) AS AMT
FROM retail_sales_dataset
GROUP BY Customer_ID
ORDER BY AMT DESC 

---Write a SQL query to calculate the total number of distinct customers who made purchases each month in 2023.

SELECT COUNT(DISTINCT(Customer_ID)) AS NUM_CUS, MONTH(Date) AS MONTHS
FROM retail_sales_dataset
WHERE YEAR(Date) = '2023'
GROUP BY MONTH(Date)
ORDER BY MONTHS ASC

---Write a SQL query to find the total number of male and female customers who made purchases above 1500 in total.

SELECT GENDER , COUNT(*) AS COUNTS
FROM retail_sales_dataset
WHERE Total_Amount > '1500'
GROUP BY GENDER


---Write a SQL query to identify customers who have made purchases in every category.
SELECT Customer_ID
FROM retail_sales_dataset
GROUP BY Customer_ID
HAVING COUNT(DISTINCT Product_Category) = (
    SELECT COUNT(DISTINCT Product_Category)
    FROM retail_sales_dataset
)

