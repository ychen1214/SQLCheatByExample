
--Check if a table exists
IF OBJECT_ID('dbo.Test') IS NOT NULL
  SELECT * FROM dbo.Test;

--Example Table 
CREATE TABLE dbo.Test
(
  TestID INT NULL
)

INSERT INTO dbo.Test (TestID) VALUES (1)

--Check if data exists in table

SELECT 1
WHERE EXISTS(SELECT 1 FROM dbo.Test WHERE TestID = 2)


SELECT 1
FROM dbo.Test t 
WHERE EXISTS(SELECT 1 FROM dbo.Test t2 WHERE t.TestID = t2.TestID)

