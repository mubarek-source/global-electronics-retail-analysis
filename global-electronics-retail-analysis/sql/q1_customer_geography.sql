-- Customers by country
SELECT Country, count(*) as CustomerCount
FROM customers
GROUP BY Country
ORDER BY CustomerCount DESC;