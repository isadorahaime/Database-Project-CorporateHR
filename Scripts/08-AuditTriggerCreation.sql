Use DBCorporateHR;
go

Create Table AuditSalaryChanges (
	AuditID INT Identity (1,1) Primary Key,
	EmployeeID INT NOT NULL,
	OldJobTitle Varchar(50),
	NewJobTitle Varchar(50), 
	ChangedBy Varchar(100) NOT NUll, 
	ChangeDate DATETIME DEFAULT GETDATE()
);
go

Use DBCorporateHR;
go

Create Trigger trgAuditEmployee_Updates
on Employees
After Update 
AS
Begin 

Set NOCOUNT ON;

If Update(JobTitle)
Begin 
	Insert Into AuditSalaryChanges (EmployeeID, OldJobTitle, NewJobTitle, ChangedBy)
	Select 
	i.EmployeeID,
	d.JobTitle, -- Dado novo
	i.JobTitle, -- Dado antigo
	SYSTEM_USER -- Captura a conta de quem logou no banco 
from inserted i 
Inner Join deleted d ON i.EmployeeID = d.EmployeeID;

end

end;

go
