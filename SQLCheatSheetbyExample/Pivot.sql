--Example Pivot
IF OBJECT_ID('dbo.DBSales') IS NOT NULL
  DROP TABLE dbo.DBSales;

CREATE TABLE dbo.DBSales
(
  PartId INT NOT NULL,
  Amount MONEY NULL, 
  DateSold  DATE NULL,
);


INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','20.00','1/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','25.00','2/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','24.00','3/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','26.00','4/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','24.00','5/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','23.00','6/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','22.00','7/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','23.00','8/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','24.00','9/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','23.00','10/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','24.00','11/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('1','55.00','12/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','20.00','1/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','25.00','2/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','24.00','3/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','26.00','4/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','24.00','5/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','26.00','6/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','274.00','7/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','24.00','8/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','254.00','9/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','233.00','10/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','24.00','11/1/2021')
INSERT INTO dbo.DBSales (PartId,Amount,DateSold) VALUES('12','595.00','12/1/2021')
    
   
SELECT PartId, [1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]
FROM (
SELECT PartId,
       Amount,
       MONTH(DateSold) AS SalesMonth
FROM  dbo.DBSales
WHERE YEAR(DateSold) = 2021
) AS SalesYear
PIVOT(SUM(Amount) FOR SalesMonth IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])) AS P 


