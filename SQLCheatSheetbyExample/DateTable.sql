IF OBJECT_ID('dbo.DateList') IS NOT NULL
  DROP TABLE dbo.DateList 

CREATE TABLE dbo.DateList 
(
	 Id INT IDENTITY(1,1)
	,CurrentDate DATE 	
	,WeekStartDate DATE
	,WeekEndDate DATE
	,WeekStartDateTime DATETIME
	,WeekEndDateTime  DATETIME 
	,DateStart DATETIME
	,DateEnd DATETIME 

)

--SELECT  @date  
--		  , DATEADD(dd, -(DATEPART(dw, @date)-1), @date)	
--		  , DATEADD(dd, 7-(DATEPART(dw, @date)), @date)
--		  , DATEADD(dd, -(DATEPART(dw, @date)-1), @date)
--		  , DATEADD(ms, -3,DATEADD(dd, 7-(DATEPART(dw, @date)), @date)+1)

DECLARE @date DATETIME = '12/31/2019'
WHILE @date < '1/1/2026'
BEGIN
	INSERT INTO DateList(CurrentDate, WeekStartDate, WeekEndDate, WeekStartDateTime, WeekEndDateTime,DateStart, DateEnd)
	SELECT  @date  
		  , DATEADD(dd, -(DATEPART(dw, @date)-1), @date)	
		  , DATEADD(dd, 7-(DATEPART(dw, @date)), @date)
		  , DATEADD(dd, -(DATEPART(dw, @date)-1), @date)
		  , DATEADD(ms, -3,DATEADD(dd, 7-(DATEPART(dw, @date)), @date)+1) 
		  , @date
		  , DATEADD(ms,-3,@date + 1)
	SET @date = DATEADD(dd,1,@date)
END

SELECT * FROM  DateList WHERE CurrentDate ='5/6/2017'
