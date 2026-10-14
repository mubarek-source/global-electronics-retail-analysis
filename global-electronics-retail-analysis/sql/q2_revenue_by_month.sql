-- Calculate total revenue for each month
SELECT strftime('%Y-%m', "Order Date") AS OrderMonth, round(sum(s.Quantity * "UnitPriceClean"),2) AS Revenue
FROM sales s 
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY OrderMonth
ORDER BY OrderMonth 