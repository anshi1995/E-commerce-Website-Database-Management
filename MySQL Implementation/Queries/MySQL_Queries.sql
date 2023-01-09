USE ecommerce_DB;

# No of orders and average sales per week
SELECT YEAR(OrderDate) AS Year, WEEK(OrderDate) AS Week,
COUNT(OrderID) AS Num_of_orders,
AVG(TotalAmount) AS Average_Sales
FROM Orders
GROUP BY Year, Week
ORDER BY Num_of_orders DESC;

# Most popular Category
SELECT ct.CategoryName AS Category, COUNT(oi.OrderID) AS Total_Orders
FROM Category ct
INNER JOIN Product p
ON ct.CategoryID = p.CategoryID
INNER JOIN OrderItems oi
ON p.ProductID = oi.ProductID
GROUP BY p.CategoryID
ORDER BY Total_Orders DESC;

# Different Payment Methods
SELECT
	COUNT(CASE WHEN PaymentType IN ('UPI', 'Bank Transfer', 'Credit Card') THEN 1 ELSE NULL END) AS Online_Payment,
	COUNT(CASE WHEN PaymentType = 'Cash on Delivery' THEN 1 ELSE NULL END) AS Cash_Payment
FROM Payment;

# Customers who placed orders in 2022 and order amount less than or equal to 10000
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customer c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = '2022'
AND o.CustomerID NOT IN
(SELECT CustomerID
FROM Orders
WHERE YEAR(OrderDate) = '2021')
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 10000;

# Products with at least 5 orders
SELECT p.ProductID, p.ProductName
FROM Product p
WHERE (SELECT COUNT(*)
FROM OrderItems oi
WHERE oi.ProductID = p.ProductID
GROUP BY oi.ProductID) >= 5;

# Customers with Order who received discount greater than unit price of any item
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customer c
where c.CustomerID IN (SELECT o.CustomerID
FROM Orders o, OrderItems oi
WHERE o.OrderID = oi.OrderID
AND o.Discount >= ANY (SELECT UnitPrice
FROM OrderItems));

# Customers living in MA with Creditcard expiry more than 2 years
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customer c, CustomerAddress ca
WHERE c.CustomerID = ca.CustomerID
AND ca.State = 'MA'
UNION
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customer c, CustomerBillingInfo cbi
WHERE c.CustomerID = cbi.CustomerID
AND YEAR(cbi.CreditCardExp) - YEAR(CURDATE()) >= 2;

# Top selling products
SELECT p.ProductName AS Product, COUNT(oi.OrderID) AS Total, oi.ProductID
FROM Product p
INNER JOIN OrderItems oi
ON p.ProductID = oi.ProductID
GROUP BY oi.ProductID
ORDER BY Total DESC
limit 5;