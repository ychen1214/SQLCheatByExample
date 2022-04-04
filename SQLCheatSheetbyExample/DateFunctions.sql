--Date Functions

SELECT GETDATE() -- Current TimeStamp of SQL Server
SELECT DATEADD(YEAR,1,GETDATE())  -- ADD 1 Year
SELECT DATEADD(MONTH,1,GETDATE()) -- ADD 1 Month
SELECT DATEADD(DAY, 1, GETDATE()) -- ADD 1 Day

SELECT DATEDIFF(YEAR, '20130101', '20131024') -- Year difference between two dates
SELECT DATEDIFF(MONTH, '20130101', '20131024') -- Month difference between dates
SELECT DATEDIFF(DAY, '20130101', '20131024') -- Number of days

SELECT DATEPART(YEAR,GETDATE()) -- GRAB current date year
SELECT DATEPART(MONTH,GETDATE()) -- GRAB current month
SELECT DATEPART(DAY, GETDATE()) -- GRAB Day

SELECT YEAR(GETDATE()) -- GRAB YEAR
SELECT MONTH(GETDATE()) -- GRAB MONTH
SELECT DAY(GETDATE()) -- GRAB DAY

SELECT DATENAME(MONTH,GETDATE()) -- GET TEXT VALUE of Month
SELECT DATENAME(WEEKDAY,GETDATE()) -- GET TEXT VALUE of Month
SELECT DATENAME(DAY,GETDATE()) -- GET DAY OF Week

SELECT ISDATE('2013-01-01') -- TRUE / FALSE date check
SELECT ISDATE('2013-01-99')