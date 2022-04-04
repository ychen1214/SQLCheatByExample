--Windows Functions Examples --
/*

|--CUME_DIST--|	    , Calculate the cumulative distribution of a value in a set of values
|--DENSE_RANK--|	  , Assign a rank value to each row within a partition of a result, with no gaps in rank values.
|--FIRST_VALUE--|	  , Get the value of the first row in an ordered partition of a result set.
|--LAG	Provide--|  , Access to a row at a given physical offset that comes before the current row.
|--LAST_VALUE--|	  , Get the value of the last row in an ordered partition of a result set.
|--LEAD	Provide--|  , Access to a row at a given physical offset that follows the current row.
|--NTILE--|	        , Distribute rows of an ordered partition into a number of groups or buckets
|--PERCENT_RANK--|	, Calculate the percent rank of a value in a set of values.
|--RANK	Assign--|   , A rank value to each row within a partition of a result set
|--ROW_NUMBER--|	  , Assign a unique sequential integer to rows within a partition of a result set, the first row starts from 1.


*/


--CREATE EXAMPLE DATASET
--Drop employee Table
IF OBJECT_ID('dbo.employee') IS NOT NULL
  DROP TABLE dbo.employee;

--Create Test Table
CREATE TABLE dbo.employee(
   EmployeeID INT NULL,
   EmployeeName NVARCHAR(55) NULL,
   ManagerID INT NULL
);


INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(1,'Mitch',NULL);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(2,'Swan',1);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(3,'Josh',2);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(4,'Cletis',3);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(5,'Yeller',2);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(6,'Bozo',5);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(7,'Ariel',5);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(9,'Lazy',2);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(10,'Paul',9);
INSERT INTO dbo.employee(EmployeeID,EmployeeName,ManagerID)VALUES(11,'April',9);


SELECT *,
    ROW_NUMBER()  OVER(PARTITION BY ManagerID ORDER BY EmployeeID),
    SUM(EmployeeID) OVER(PARTITION BY ManagerID),
    MAX(EmployeeID)  OVER(PARTITION BY ManagerID)
FROM dbo.employee
