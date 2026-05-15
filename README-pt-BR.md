_Leia isto em [English](README.md)_
# 💻 DataBase Project 

# Projeto de Governança de Dados e Segurança de RH Corporativo

Um projeto de infraestrutura de banco de dados em nível empresarial projetado para simular migração de dados, governança de controle de acesso (Princípio do Privilégio Mínimo) e auditoria automatizada de alterações em um banco de dados de Recursos Humanos.

## 🛠️ Arquitetura do Projeto & Fases

### Fase 1: Infraestrutura do Banco de Dados & Migração de Dados
* **Objetivo:** Estabelecer um modelo relacional limpo para o setor de RH corporativo.
* **Implementação:** Desenhada uma estrutura relacional utilizando restrições de `PRIMARY KEY` e `FOREIGN KEY`.
* **Desafio Técnico (IDENTITY_INSERT):** Migração de dados legados corporativos a partir do banco de dados `AdventureWorks2012`. Contornou-se as restrições de colunas de identidade alternando a configuração `SET IDENTITY_INSERT ON/OFF` para preservar com segurança os IDs originais de produção durante a transferência.

### Fase 2: Segurança & Princípio do Privilégio Mínimo (PoLP)
* **Objetivo:** Restringir o acesso a dados administrativos para reduzir riscos de vazamento de informações.
* **Implementação:** Criada uma View de Diretório não-sensível (`VpublicEmployeeDirectory`) mascarando os dados estruturais internos.
* **Controle de Acesso:** Provisionado um Login/Usuário restrito no SQL (`HRAssistant`) com permissões estritamente limitadas:
  * `GRANT SELECT` permitido apenas na view de diretório público.
  * `DENY` explícito aplicado para todas as operações DML (`SELECT`, `INSERT`, `UPDATE`, `DELETE`) nas tabelas centrais do sistema.

### Fase 3: Auditoria Automatizada & Compliance (Triggers)
* **Objetivo:** Manter uma trilha de auditoria rígida e inviolável para conformidade regulatória.
* **Implementação:** Implantada uma `TRIGGER` de banco de dados do tipo `AFTER UPDATE` em colunas críticas.
* **Resultado:** Qualquer alteração feita em informações sensíveis (ex: cargos/promoções) captura automaticamente o `SYSTEM_USER`, marcações de tempo exatas (`GETDATE()`) e os valores históricos anteriores em uma tabela de logs dedicada e imutável (`AuditSalaryChanges`).

## 💻 Tecnologias Utilizadas
* **SGBD:** Microsoft SQL Server Express
* **Cliente de Gerenciamento:** SQL Server Management Studio (SSMS)
* **Controle de Versão:** Git & GitHub
