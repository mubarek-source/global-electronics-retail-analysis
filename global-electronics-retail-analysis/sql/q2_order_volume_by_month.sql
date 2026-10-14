-- How many orders were placed in each month
SELECT  strftime('%Y-%m', "Order Date") As OrderMonth,  count(DISTINCT "Order Number") As OrderCount
FROM sales
GROUP BY OrderMonth 
ORDER BY OrderMonth 