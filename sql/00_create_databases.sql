-- ============================================================================
-- Script: 00_create_databases.sql
-- Purpose: Initialize the four SQL Server databases required for the
--          Amazon Retail Data Warehouse & ETL pipeline (STA, ODS, DWH, ADM).
-- Collation: Latin1_General_100_CI_AS_SC_UTF8 (UTF-8 / multilingual support)
-- ============================================================================

IF DB_ID(N'AMAZON_STA') IS NULL
BEGIN
    CREATE DATABASE [AMAZON_STA]
    COLLATE Latin1_General_100_CI_AS_SC_UTF8;
END
GO

IF DB_ID(N'AMAZON_ODS') IS NULL
BEGIN
    CREATE DATABASE [AMAZON_ODS]
    COLLATE Latin1_General_100_CI_AS_SC_UTF8;
END
GO

IF DB_ID(N'AMAZON_DWH') IS NULL
BEGIN
    CREATE DATABASE [AMAZON_DWH]
    COLLATE Latin1_General_100_CI_AS_SC_UTF8;
END
GO

IF DB_ID(N'AMAZON_ADM') IS NULL
BEGIN
    CREATE DATABASE [AMAZON_ADM]
    COLLATE Latin1_General_100_CI_AS_SC_UTF8;
END
GO
