Use DBCorporateHR;

go

Select 

e.EmployeeID,
e.FirstName + ' ' + e.LastName AS [Full Name],
e.JobTitle,
d.DepartamentName As [Departament],
d.GroupName,
e.HireDate
From Employees e 
Inner Join Departaments d on e.DepartamentID = d.DepartamentID;

go
