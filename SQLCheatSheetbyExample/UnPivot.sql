--Example UnPivot
IF OBJECT_ID('dbo.UnPhone') IS NOT NULL
  DROP TABLE dbo.UnPhone;

CREATE TABLE dbo.UnPhone
(
  PartId INT NOT NULL,
  Phone1 NVARCHAR(20) NULL, 
  Phone2 NVARCHAR(20) NULL, 
  Phone3 NVARCHAR(20) NULL, 
);

INSERT INTO dbo.UnPhone (PartId,Phone1,Phone2, Phone3) VALUES('1','646-290-2020','718-929-0202','917-002-0202')
INSERT INTO dbo.UnPhone (PartId,Phone1,Phone2, Phone3) VALUES('2','646-290-2021','718-929-0203','917-002-0204')

SELECT PartId, Phone
FROM 
( -- DataSet to Use 
SELECT PartId,
       Phone1,
       Phone2,
       Phone3
FROM dbo.UnPhone
) a 
UNPIVOT
(
  Phone -- Column Name
  FOR Phones -- Make Believe DataSet name
  IN (Phone1,Phone2,Phone3) -- Columns to UNPIVOT
) AS UP;

