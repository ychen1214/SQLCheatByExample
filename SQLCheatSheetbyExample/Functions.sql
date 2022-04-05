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


-- FUNCTION TYPES ---

IF OBJECT_ID('dbo.GetEmployee') IS NOT NULL
  DROP FUNCTION dbo.GetEmployee
GO

-- Scalar Function --
CREATE FUNCTION dbo.GetEmployee(
  @EmployeeId INT 
)
RETURNS NVARCHAR(50)
AS
BEGIN
  DECLARE @employeename NVARCHAR(50)
  SELECT TOP 1 @employeename =  EmployeeName FROM dbo.employee WHERE EmployeeId = @employeeID
  RETURN @employeename
END
GO
-- Table Value Function --
CREATE FUNCTION dbo.GetEmployeeTVF(
  @EmployeeId INT 
)
RETURNS TABLE
AS
RETURN
  SELECT * FROM Employee WHERE EmployeeId = @EmployeeId
GO

-- Table Multi Value Function --
CREATE FUNCTION dbo.MultiEmployeeTVF()
RETURNS @employee TABLE (
  employeeid INT,
  employeename NVARCHAR(250)
)
AS
BEGIN
  INSERT INTO @employee
  (
      employeeid,
      employeename
  )
  SELECT EmployeeId,EmployeeName
  FROM dbo.employee

  INSERT INTO @employee
  (
      employeeid,
      employeename
  )
  VALUES
  (   15, -- employeeid - int
      'Skip'  -- employeename - nvarchar(250)
      )
  RETURN 
END
GO
SELECT * FROM dbo.MultiEmployeeTVF()
