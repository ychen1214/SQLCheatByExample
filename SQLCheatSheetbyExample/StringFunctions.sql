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



CREATE FUNCTION [dbo].[SplitStringsTally]
(
   @List NVARCHAR(MAX),
   @Delimiter NVARCHAR(255)
)
RETURNS TABLE
WITH SCHEMABINDING AS
RETURN
  WITH E1(N)        AS ( SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 
                         UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1),
       E2(N)        AS (SELECT 1 FROM E1 a, E1 b),
       E4(N)        AS (SELECT 1 FROM E2 a, E2 b),
       E42(N)       AS (SELECT 1 FROM E4 a, E2 b),
       cteTally(N)  AS (SELECT 0 
						UNION ALL 
						SELECT TOP (DATALENGTH(ISNULL(@List,1))) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) FROM E42),
       cteStart(N1) AS (SELECT t.N+1 FROM cteTally t
                         WHERE (SUBSTRING(@List,t.N,1) = @Delimiter OR t.N = 0))
  SELECT	ItemNumber = ROW_NUMBER() OVER (ORDER BY s.N1),
			Item = SUBSTRING(@List, s.N1, ISNULL(NULLIF(CHARINDEX(@Delimiter,@List,s.N1),0)-s.N1,8000))		
  FROM cteStart s;
