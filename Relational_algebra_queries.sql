Use adventureworks2019

select * from HumanResources.Employee
select * from HumanResources.EmployeeDepartmentHistory


SELECT COUNT(DISTINCT BusinessEntityID) FROM HumanResources.Employee;

/*FIND DUPLICATES*/
SELECT 
	 BusinessEntityID, 
	COUNT(* )
FROM 
	 HumanResources.EmployeeDepartmentHistory
GROUP BY 
	BusinessEntityID 
HAVING 
	COUNT( *) > 1



/*UNION*/
SELECT BusinessEntityID FROM HumanResources.Employee
UNION
SELECT BusinessEntityID  FROM HumanResources.EmployeeDepartmentHistory

/*UNION ALL*/
SELECT BusinessEntityID FROM HumanResources.Employee
UNION ALL
SELECT BusinessEntityID FROM HumanResources.EmployeeDepartmentHistory
ORDER BY BusinessEntityID

/*SET DIFFERENCE*/
SELECT BusinessEntityID FROM HumanResources.Employee
EXCEPT
SELECT BusinessEntityID FROM HumanResources.EmployeeDepartmentHistory
ORDER BY BusinessEntityID

/*INTERSECTION*/
SELECT BusinessEntityID FROM HumanResources.Employee
INTERSECT
SELECT BusinessEntityID FROM HumanResources.EmployeeDepartmentHistory
ORDER BY BusinessEntityID

/*CARTESIAN PRODUCT*/
SELECT * FROM HumanResources.Employee
CROSS JOIN
HumanResources.EmployeeDepartmentHistory


select * from Person.Address
select * from Person.StateProvince
/* Inner Join*/
SELECT DISTINCT A.StateProvinceID,S.Name
FROM Person.Address A
inner join Person.StateProvince S
On A.StateProvinceID=S.StateProvinceID

/*self join*/
SELECT *  FROM HumanResources.Employee

SELECT
    HE1.BusinessEntityID, HE1.JobTitle
FROM
    HumanResources.Employee HE1
INNER JOIN HumanResources.Employee HE2 ON HE1.BusinessEntityID > HE2.BusinessEntityID
AND HE1.JobTitle= HE2.JobTitle
ORDER BY
    HE2.JobTitle

/*equijoin*/
SELECT HE.BusinessEntityID, HD.DepartmentID 
FROM
    HumanResources.Employee HE, HumanResources.EmployeeDepartmentHistory HD
WHERE HE.BusinessEntityID = HD.BusinessEntityID


/*left join---Returns all records from the left table, and the
matched records from the right table
*/
select * from Sales.SalesPerson order by BusinessEntityID
select * from Sales.Store order by BusinessEntityID

SELECT 
   person.[BusinessEntityID],
   store.[Name] as StoreName, 
   [TerritoryID], 
   [SalesQuota], 
   [Bonus], 
   [CommissionPct], 
   [SalesYTD], 
   [SalesLastYear], 
   person.[rowguid], 
   person.[ModifiedDate]
FROM [Sales].[SalesPerson] person
   LEFT JOIN [Sales].[Store] store 
      on person.BusinessEntityID = store.[SalesPersonID]
WHERE store.[SalesPersonID] IS NOT NULL
ORDER BY person.[BusinessEntityID];

/*LEFT JOIN 2*-Return all customerIDs with orders and no orders*/
SELECT
 c.CustomerID
,soh.OrderDate
FROM Sales.Customer c
LEFT OUTER JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
WHERE soh.SalesOrderID IS NULL


/*(INNER) JOIN: Returns records that have matching values in both tables
results below show the Products that sold and the Products that unfortunately did not sell which 
show a NULL value for the SalesOrderID*/

SELECT 
     p.Name
    ,sd.SalesOrderID
    ,m.Name as [Model_Name] 
FROM Production.Product p  
   FULL OUTER JOIN Sales.SalesOrderDetail sd ON p.ProductID = sd.ProductID  
   INNER JOIN [PRODUCTION].ProductModel m ON m.ProductModelID = p.ProductModelID
ORDER BY sd.SalesOrderID; 
GO


/*INNER JOIN 2*/
/*statement returns the product and supplier information for any combination of 
parts supplied by a company for which the company name
starts with the letter F and the price of the product is more than $10.*/

SELECT ProductID, Purchasing.Vendor.BusinessEntityID, Name
FROM Purchasing.ProductVendor INNER JOIN Purchasing.Vendor
    ON (Purchasing.ProductVendor.BusinessEntityID = Purchasing.Vendor.BusinessEntityID)
WHERE StandardPrice > $10
  AND Name LIKE N'F%'
GO

/*RIGHT OUTER JOIN
-- From the product reviews, return the products without product reviews*/

SELECT * FROM Production.Product
SELECT * FROM Production.ProductReview

SELECT
P.Name
FROM Production.ProductReview pr
RIGHT OUTER JOIN Production.Product p ON pr.ProductID = p.ProductID
WHERE pr.ProductReviewID IS NULL 

/*FULL OUTER JOIN*/

SELECT * FROM Person.Person
SELECT * FROM Person.EmailAddress

SELECT P.BusinessEntityID,
		P.FirstName + ' ' + P.LastName AS EmployreName,
		Email.EmailAddress
FROM Person.Person AS P
FULL OUTER JOIN Person.EmailAddress AS Email
ON Email.BusinessEntityID = P.BusinessEntityID