USE DBCorporateHR;
GO

-- 1. Garante o encerramento de qualquer simulação de usuário anterior
REVERT;
GO

UPDATE Employees
SET JobTitle = 'Senior Infrastructure Analyst'
WHERE EmployeeID = 1;
GO

-- 3. Validamos se a nossa automação de auditoria registrou o histórico
SELECT * FROM AuditSalaryChanges;
GO
