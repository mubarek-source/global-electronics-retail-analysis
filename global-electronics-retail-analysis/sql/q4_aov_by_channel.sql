-- Revenue, orders, and average order value by channel
SELECT
	CASE
		WHEN st.StoreKey > 0 THEN 'In-Store'
		ELSE 'Online'
	END AS Channel, 
	
	round( sum(s.Quantity * "UnitPriceClean"), 2) AS TotalRevenue, 
	count(DISTINCT s."Order Number") As OrderCount, 
	sum(s.Quantity * "UnitPriceClean") / count(DISTINCT s."Order Number")  AS AOV
FROM sales s
JOIN Stores st on s.StoreKey = st.StoreKey
JOIN Products p ON s.ProductKey = p.ProductKey
GROUP BY Channel
ORDER BY Channel