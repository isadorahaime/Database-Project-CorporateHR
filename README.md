_Read this in [Português](README-pt-BR.md)
# 💻 DataBase Project

# Corporate HR Data Governance & Security Project

An enterprise-level SQL Server infrastructure project designed to simulate data migration, access control governance (Principle of Least Privilege), and automated change auditing within a corporate Human Resources database.

## 🛠️ Project Architecture & Phases

### Phase 1: Database Infrastructure & Data Migration
* **Objective:** Establish a clean relational model for corporate HR.
* **Implementation:** Designed a relational structure using `PRIMARY KEY` and `FOREIGN KEY` constraints.
* **Technical Challenge (IDENTITY_INSERT):** Migrated legacy corporate data from the `AdventureWorks2012` database. Handled identity column constraints by toggling `SET IDENTITY_INSERT ON/OFF` to safely preserve original production IDs during transfer.

### Phase 2: Security & Principle of Least Privilege (PoLP)
* **Objective:** Restrict administrative data access to reduce data breach risks.
* **Implementation:** Created a non-sensitive Directory View (`VpublicEmployeeDirectory`) masking internal data.
* **Access Control:** Provisioned a restricted SQL Login/User (`HRAssistant`) with strictly bounded permissions:
  * `GRANT SELECT` allowed on the public directory view.
  * Explicit `DENY` applied for all DML operations (`SELECT`, `INSERT`, `UPDATE`, `DELETE`) on core system tables.

### Phase 3: Automated Auditing & Compliance (Triggers)
* **Objective:** Maintain a strict tamper-proof audit trail for regulatory compliance.
* **Implementation:** Deployed an `AFTER UPDATE` database `TRIGGER` on critical columns.
* **Result:** Any changes made to sensitive information (e.g., job titles/promotions) automatically capture the `SYSTEM_USER`, exact timestamps (`GETDATE()`), and historical state values into a dedicated immutable log table (`AuditSalaryChanges`).

## 💻 Tech Stack
* **Database Engine:** Microsoft SQL Server Express
* **Management Client:** SQL Server Management Studio (SSMS)
* **Version Control:** Git & GitHub
