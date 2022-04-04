
--Drop Test Table
IF OBJECT_ID('dbo.test') IS NOT NULL
  DROP TABLE dbo.test;

--Create Test Table
CREATE TABLE dbo.test(
   TestID INT NULL,
   Test NVARCHAR(20) NULL 
);


--Table Constraints
--Add a constraint to check that the TestID Value is always greater than 0
ALTER TABLE dbo.test ADD CONSTRAINT CHK_dbo_test_TestID CHECK(TestID > 0)

--Unit Tests 


--Normal data insert
INSERT INTO dbo.test VALUES(1,'Test1')

--Error
INSERT INTO dbo.test VALUES(0,'Test0')
