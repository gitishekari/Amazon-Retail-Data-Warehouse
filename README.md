# Amazon Retail Data Warehouse & End-to-End ETL Pipeline

An end-to-end Business Intelligence and Data Warehousing solution built on the Microsoft BI stack (**SQL Server**, **SSIS**, and **Power BI**). The pipeline ingests 10 raw retail CSV datasets spanning **July 1996 to May 1998** into a three-tier architecture (**Staging -> Operational Data Store -> Star Schema Data Warehouse**), complete with automated error-reject tracking, Slowly Changing Dimensions (**SCD Type 1 & Type 2**), and an interactive 8-page Power BI analytics dashboard.

---

## Tech Stack & Standards

* **Database Engine:** Microsoft SQL Server / SSMS 2019 (v20.2)
* **ETL Development & Orchestration:** Visual Studio 2022 (v17.13.5) & SSIS 2022 (v1.5)
* **Analytics & Visualization:** Power BI Desktop (v2.141.1253.0)
* **Collation & Encoding:** `Latin1_General_100_CI_AS_SC_UTF8` with `NVARCHAR` support to preserve European/multilingual characters (e.g., *Suprêmes délices*, *Münster*, *Táchira*)
* **Naming Conventions:** Follows SSIS 2.0 component prefixes (`FF_SRC`, `OLE_SRC`, `OLE_DST`, `DCNV`, `DER`, `LKP`, `CSPL`, `MLT`, `ALL`, `AGG`, `CMD`)

---

## ETL Architecture

The master orchestration package (`AMAZON_Exec.dtsx`) sequentially executes **23 SSIS packages** across three data layers plus a dedicated administration/rejects database:

```text
[10 Raw CSV Files]
       │
       ▼
┌─────────────────────────────────────────┐
│ 1. AMAZON_STA (Staging Area - 10 tables)│  Truncate & full load as VARCHAR(255)
└────────────────────┬────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────┐     ┌───────────────────────────────┐
│ 2. AMAZON_ODS (Operational Data Store)  │────▶│ AMAZON_ADM.TechnicalRejects   │
│    7 cleansed & conformed tables        │     │ (Type / Date conversion logs) │
└────────────────────┬────────────────────┘     └───────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────┐     ┌───────────────────────────────┐
│ 3. AMAZON_DWH (Star Schema - 7 tables)  │────▶│ AMAZON_ADM.FunctionalRejects  │
│    1 Fact + 6 Dims (SCD Type 1 & 2)     │     │ (Aggregated lookup misses)    │
└────────────────────┬────────────────────┘     └───────────────────────────────┘
                     │
                     ▼
        [8-Page Power BI Dashboard]
