Use DBCorporateHR;

go 

create view VpublicEmployeeDirectory AS 
Select 
	e.EmployeeID,
	e.FirstName + ' ' + e.LastName AS [Employee Name],
	e.JobTitle,
	d.DepartamentName AS [Departament]
From Employees e
Inner Join Departaments d on e.DepartamentID = e.DepartamentID;

go
