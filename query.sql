USE AdventureWorks2019


SELECT * FROM HumanResources.Department

SELECT COUNT(DISTINCT DepartmentID) FROM HumanResources.Department
/* USED TO COUNT THE NUMBER OF DEPARTMENTS WE HAVE IN THE COMPANY*/

SELECT* FROM HumanResources.Employee

SELECT COUNT(DISTINCT BusinessEntityID) FROM HumanResources.Employee
/* USED TO COUNT THE TOTAL NUMBER OF EMPLOYEES IN THE COMPANY*/

SELECT NationalIDNumber, JobTitle
FROM HumanResources.Employee
ORDER BY HireDate
/* ShoWs the National ID Number and Job Title of employees and sorts them according to the year of employment */

UPDATE HumanResources.Employee
SET OrganizationNode = '0DHDJ3'
WHERE OrganizationNode = ''

SELECT *FROM HumanResources.EmployeeDepartmentHistory


SELECT * FROM HumanResources.Employee
CROSS JOIN
HumanResources.EmployeeDepartmentHistory
WHERE DepartmentID = 1

SELECT* FROM HumanResources.EmployeePayHistory

SELECT 
SUM(Rate * PayFrequency) AS Total_Pay
FROM HumanResources.EmployeePayHistory
/* Shows the total amount the Human Resource Department is supposed to pay its workers*/


SELECT BusinessEntityID, Rate
FROM HumanResources.EmployeePayHistory
WHERE PayFrequency = 2
/*Shows the number of employees whose pay frequency is 2*/

SELECT BusinessEntityID, Rate
FROM HumanResources.EmployeePayHistory
WHERE PayFrequency = 1

/*Shows the number of employees whose pay frequency is 1*/

SELECT* FROM HumanResources.JobCandidate
ORDER BY ModifiedDate
/* SORTS THE JOB CANDIDATES BASED ON MODIFIED DATE FROM THE LATEST ONE TO THE EARLIEST ONE*/