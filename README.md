Read this in [Português](README-pt-BR.md)
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

## 📖 SQL Fundamentals & Reference Guide

To demonstrate the foundational knowledge applied throughout this architecture, here is a breakdown of the core SQL concepts used, including direct links to their practical implementations in this repository:

### 1. Data Querying & Selection (`SELECT`, `AS`)
* **`SELECT`**: The foundational command used to retrieve data from database tables.
* **`AS` (Aliasing)**: Used to give a column or a table a temporary, more readable name.
  * 🔍 **See it in action:** Check out how a basic query is structured to pull data in the scripts:
  *  [01-CreateDBndTables.sql](Scripts/01-CreateDBndTables.sql)
  * [03-SimpleDataValidation.sql](Scripts/03-SimpleDataValidation.sql)

### 2. Data Relationship & Merging (`INNER JOIN`, `ON`)
* **`INNER JOIN`**: A relational operator used to combine rows from two or more tables based on a related column.
* **`ON`**: Specifies the exact conditional matching rule between keys.
  * 🔍 **See it in action:** View the relational join mapping employee data to departments in the script:
  * [02-SecurityNdGovernance.sql](Scripts/02-SecurityNdGovernance.sql)

### 3. Data Aggregation & Metrics (`COUNT`, `GROUP BY`, `ORDER BY`)
* **`COUNT()`**: An aggregate function that returns the total number of rows matching a criteria.
* **`GROUP BY` / `ORDER BY`**: Used together to group results by columns and sort them accordingly.
  * 🔍 **See it in action:** Check the metrics and auditing grouping scripts within:
  * [08-AuditTriggerCreation.sql](Scripts/08-AuditTriggerCreation.sql).

## 💻 Tech Stack
* **Database Engine:** Microsoft SQL Server Express
* **Management Client:** SQL Server Management Studio (SSMS)
* **Version Control:** Git & GitHub
