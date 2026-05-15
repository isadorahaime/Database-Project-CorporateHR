Use DBCorporateHR;

Go 

Create Table Departaments ( 
	DepartamentID INT Identity (1,1) Primary key, 
	DepartamentName Varchar (50) NOT NULL, 
	GroupName Varchar (50) NOT NULL, 
	);

	Go 

	Create Table Employees (
		EmployeeID INT Identity (1,1) Primary key,
		FirstName Varchar (50) NOT NULL,
		LastName Varchar (50) NOT NULL, 
		JobTitle Varchar (50) Not NULL,
		DepartamentID INT,
		HireDate Date NOT NULL, 

		Constraint FkEmployee_Departament Foreign key (DepartamentID)
			References Departaments (DepartamentID) 
	);

	Go

	Insert into Departaments (DepartamentID, GroupName)
	Select Name, GroupName
	From AdventureWorks2012.HumanResources.Department;

	Go

	Insert Into Employees (FirstName, LastName, JobTitle, DepartamentID, HireDate)
	Select TOP 50 
		p.FirstName,
		p.LastName,
		e.JobTitle,
		edh.DepartmentID,
		e.HireDate

	from AdventureWorks2012.HumanResources.Employee e 
	Inner Join AdventureWorks2012.Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
	Inner Join AdventureWorks2012.HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
	where edh.EndDate IS NULL; 

	go