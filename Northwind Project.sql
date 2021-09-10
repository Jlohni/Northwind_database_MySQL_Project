/*  My Name Jagdish Kumar
	this is my SQL Northwind Database Exercises Project
    Mob. 8449030780
    Email Jlohni05@gmail.com
*/

use northwind;
SELECT*FROM northwind.products;


/*
1. Write a query to get Product name and quantity/unit
*/

SELECT 
	ProductName, 
	QuantityPerUnit 
FROM 
	Products;

/*
2. Write a query to get current Product list (Product ID and name)
*/   

SELECT
	ProductID,
    ProductName
FROM
	Products;
	
/*
3. Write a query to get discontinued Product list (Product ID and name)
*/

SELECT 
	ProductID, 
    ProductName
FROM 
	Products
WHERE 
	Discontinued = 1 
	ORDER BY ProductName;

/*
4. Write a query to get most expense and least expensive Product list (name and unit price)
*/

SELECT 
	ProductName, 
    UnitPrice 
FROM 
	Products 
	ORDER BY UnitPrice DESC; 


    
/*
5. Write a query to get Product list (id, name, unit price) where current products cost less than $20
*/ 
SELECT
	productID,
    ProductName,
    UnitPrice
from
	Products
where
	UnitPrice<20
    order by unitprice desc;
    
-- II Way    
SELECT
	ProductID, 
    ProductName, 
    UnitPrice
FROM 
	Products
WHERE (((UnitPrice)<20) AND ((Discontinued)=False))
ORDER BY UnitPrice DESC; 


/*
6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25
*/
select
	ProductID, 
    ProductName, 
    UnitPrice
from
	Products
where 
	UnitPrice between 15 and 25
	ORDER BY UnitPrice DESC;

SELECT 
	ProductName, 
    UnitPrice
FROM 
	Products
WHERE (((UnitPrice)>=15 And (UnitPrice)<=25)
AND ((Products.Discontinued)=False))
ORDER BY Products.UnitPrice DESC;


/*
7. Write a query to get Product list (name, unit price) of above average price
*/

SELECT 
	DISTINCT ProductName, 
	UnitPrice
FROM 
	Products

WHERE 
	UnitPrice > ( SELECT 
						avg(UnitPrice) 
					FROM 
						Products)
ORDER BY UnitPrice desc;
/*
8. Write a query to get Product list (name, unit price) of ten most expensive products
*/

SELECT 
	DISTINCT ProductName as 'Top10_Expensive_Product', 
    UnitPrice
FROM 
	Products AS a
WHERE 10 >= (SELECT COUNT(DISTINCT UnitPrice)
                    FROM Products AS b
                    WHERE b.UnitPrice >= a.UnitPrice)
ORDER BY UnitPrice desc;


/*
9. Write a query to count current and discontinued products
*/

SELECT 
	Count(ProductName)
FROM 
	Products
GROUP BY Discontinued;

/*
10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity 
on order
*/
SELECT 
	ProductName,  
    UnitsOnOrder, 
    UnitsInStock
FROM 
	Products
WHERE (((Discontinued)=False) AND ((UnitsInStock)<UnitsOnOrder));
