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


/* declare variables */
DECLARE @empid INT

DECLARE cursor_emp
CURSOR
FAST_FORWARD
READ_ONLY
FOR SELECT EmployeeID FROM dbo.employee

OPEN cursor_emp

FETCH NEXT FROM cursor_emp INTO @empid

WHILE @@FETCH_STATUS = 0
BEGIN
    SELECT * FROM dbo.employee WHERE EmployeeID = @empid    

    FETCH NEXT FROM cursor_emp INTO @empid
END

CLOSE cursor_emp
DEALLOCATE cursor_emp
