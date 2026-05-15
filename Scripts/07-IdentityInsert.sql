USE DBCorporateHR;
GO

-- Apaga registros antigos para evitar duplicidade
TRUNCATE TABLE Employees;
-- Se o TRUNCATE der erro de Foreign Key, use o DELETE:
DELETE FROM Employees;
DELETE FROM Departaments;
GO


Use DBCorporateHR;

go

Set Identity_Insert Departaments ON;

go 

Insert Into Departaments (DepartamentID, DepartamentName, GroupName)
Select DepartmentID, Name, GroupName
from AdventureWorks2012.HumanResources.Department;

go 

Set Identity_Insert Departaments OFF;

GO
