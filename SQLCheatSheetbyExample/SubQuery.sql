--Example Table
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



SELECT *
FROM (SELECT * FROM dbo.employee) a

SELECT *
FROM dbo.employee a
INNER JOIN (
  SELECT * FROM dbo.employee
) b ON a.EmployeeId = b.ManagerId
