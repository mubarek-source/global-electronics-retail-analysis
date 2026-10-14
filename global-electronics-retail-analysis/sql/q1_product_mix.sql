-- how many products are in each category and subcategory.
SELECT Category, Subcategory,  count(*) as ProductCount
FROM Products
GROUP BY Category, Subcategory
ORDER BY ProductCount DESC
