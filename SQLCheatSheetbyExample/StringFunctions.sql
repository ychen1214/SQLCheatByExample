--String Functions

SELECT LEN('Test') -- Length of string
SELECT CHARINDEX('e','Test') --Character Position
SELECT PATINDEX('%e[a-z]%','Test') --First position of a particular pattern
SELECT REPLACE('Test','est','ester') --String find and replacement
SELECT REPLICATE('T',10) --Replicate a pattern x number of times
SELECT STUFF('Test',1,0,'Test ') -- String Insert and replacement (INSERT POSITION and How many Characters to DELETE)



--SQL SERVER 2016(13.X) or later
DECLARE @tags NVARCHAR(400) = 'clothing,road,,touring,bike'  
  
SELECT value  
FROM STRING_SPLIT(@tags, ',')  
WHERE RTRIM(value) <> '';


IF OBJECT_ID('dbo.TestSplit') IS NOT NULL
  DROP TABLE dbo.TestSplit;

CREATE TABLE dbo.TestSplit(
  StringList NVARCHAR(2000) NULL
)

INSERT INTO dbo.TestSplit (StringList) VALUES('clothing,road,,touring,bike' )
INSERT INTO dbo.TestSplit (StringList) VALUES('mike,john,paul,don,chase' )

  
--Similar to INNER JOIN CHECK
SELECT * 
FROM dbo.TestSplit CROSS APPLY STRING_SPLIT(StringList, ',')  
WHERE RTRIM(value) <> '';

--Like FULL OUTER JOIN--returns everything
SELECT * 
FROM dbo.TestSplit OUTER APPLY STRING_SPLIT(StringList, ',')  
WHERE RTRIM(value) <> '';
