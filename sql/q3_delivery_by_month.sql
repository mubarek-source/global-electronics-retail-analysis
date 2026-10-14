-- Average delivery time for online orders
SELECT strftime('%Y-%m' , "Order Date") AS OrderMonth,  avg(  julianday("Delivery Date") - julianday("Order Date"))AS AvgDeliveryDays
FROM sales
WHERE "Delivery Date" IS NOT NULL
GROUP BY OrderMonth
ORDER BY OrderMonth 