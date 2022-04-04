--Types of Case

SELECT CASE WHEN 1=0 THEN 'Blank' ELSE 'Test' END


DECLARE @x INT = 1
SELECT CASE @x
          WHEN 2 THEN '2'
          WHEN 1 THEN '1'
          ELSE 'Blank'
       END
