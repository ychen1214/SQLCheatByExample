--https://stackoverflow.com/questions/25296228/t-sql-recursive-cte-to-find-highest-parentid

--Example CTEs
IF OBJECT_ID('dbo.employee') IS NOT NULL
  DROP TABLE dbo.employee;

CREATE TABLE dbo.employee
(
  EmployeeId INT NOT NULL,
  EmployeeName NVARCHAR(50) NOT NULL,
  ManagerId INT NULL
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


SELECT * FROM dbo.employee

--CTE

;WITH cte
AS (SELECT *
    FROM dbo.employee)
SELECT *
FROM cte;


--CTE with Colums
;WITH cte (employeeid, employeename, managerid)
AS
(
  SELECT EmployeeId,
         EmployeeName,
         ManagerId
  FROM dbo.employee
)
SELECT * FROM cte

--Recursive CTE with Columns
;WITH cte (employeeid, employeename, managerid, employeelevel )
AS
(
  SELECT EmployeeId,
         EmployeeName,
         ManagerId,
         0 AS Employeelevel
  FROM dbo.employee
  UNION ALL
  SELECT e.EmployeeId,
         e.EmployeeName,
         e.ManagerId,
         c.Employeelevel + 1
  FROM dbo.employee e
    INNER JOIN cte c ON e.ManagerId = c.employeeid

)
SELECT *
FROM cte



