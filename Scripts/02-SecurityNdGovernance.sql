Use master; 
go


Create LOGIN HRAssistantLogin 
with Password = 'RHSecurePass123!',
    check_policy = OFF; -- Desativa complexidade local de senha para fins de laboratório

go 

Use DBCorporateHR;
go

Create User HRAssistant FOR LOGIN HRAssistantLogin;
go

-- 1. Garante permissão de leitura (SELECT) APENAS na View de segurança
GRANT Select ON VpublicEmployeeDirectory TO HRAssistent;
go

-- 2. Garante explicitamente que ele NÃO pode ler ou modificar as tabelas originais
DENY SELECT, INSERT, UPDATE, DELETE ON Employees TO HRAssistant;
DENY SELECT, INSERT, UPDATE, DELETE ON Departaments TO HRAssistant;
GO

