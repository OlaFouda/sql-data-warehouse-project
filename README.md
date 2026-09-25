
# SQL Data Warehouse

A modern **SQL Data Warehouse** built with Microsoft SQL Server and T-SQL, following a **Medallion Architecture** to transform raw CRM and ERP sales data into a business-ready **Star Schema** for analytics and reporting.

## Project Overview

This project demonstrates an end-to-end data warehouse pipeline that integrates raw CSV data from CRM and ERP source systems, applies data quality and transformation rules, and delivers a centralized analytical data model.

The warehouse is organized into three layers:

* **Bronze:** Raw data ingestion from CRM and ERP CSV files with minimal transformation.
* **Silver:** Data cleansing, standardization, deduplication, validation, and technical metadata enrichment.
* **Gold:** Business-ready dimensional models using a Star Schema with customer and product dimensions and a sales fact table.

## Architecture

**CRM & ERP CSV Files → Bronze → Silver → Gold → Analytics**

The Gold layer consists of:

* `dim_customers`
* `dim_products`
* `fact_sales`

Master data from the different source systems is integrated and standardized before being exposed for analytical use.

## Key Implementations

* Designed a **Medallion Architecture** with Bronze, Silver, and Gold layers.
* Created SQL Server databases, schemas, tables, views, and stored procedures.
* Loaded raw CSV data using `BULK INSERT`.
* Built automated Bronze and Silver loading procedures with `TRY...CATCH` error handling and execution-time logging.
* Applied data cleansing and standardization using `TRIM`, `ISNULL`, `CASE`, and conditional casting.
* Handled duplicates using `ROW_NUMBER()` and corrected historical date ranges using `LEAD()`.
* Applied business rules to validate and recalculate sales metrics.
* Designed a **Star Schema** using fact and dimension tables.
* Generated surrogate keys and performed lookups to establish fact-to-dimension relationships.
* Integrated and reconciled customer data from multiple source systems.
* Created SQL-based data quality tests for uniqueness, referential integrity, and value validation.
* Documented the architecture, data lineage, data model, and data catalog.

## Technology Stack

* **Database:** Microsoft SQL Server
* **Language:** T-SQL
* **Database Management:** SQL Server Management Studio (SSMS)
* **Version Control:** Git & GitHub
* **Architecture & Data Modeling:** Draw.io
* **Project Planning:** Notion

## Repository Structure

```text
├── datasets/       # Source CRM and ERP CSV files
├── documents/      # Architecture, data lineage, and data catalog
├── scripts/        # Database, Bronze, Silver, and Gold SQL scripts
├── tests/          # Data quality and validation tests
└── README.md
```


## Credits

This project was built by following 'Full Hands-On Data Engineering Project' by Data With Baraa, with the implementation serving as hands-on practice of SQL data warehousing, ETL, data quality, and dimensional modeling.



