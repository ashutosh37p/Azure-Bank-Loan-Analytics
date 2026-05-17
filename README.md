# Azure Bank Loan Analytics Dashboard

## Project Overview

This project is an end-to-end Azure Data Analytics and Power BI solution built to analyze bank loan data and generate business insights related to loan applications, funding, repayments, borrower risk, and regional lending trends.

The project demonstrates a complete analytics workflow including:

* Data ingestion
* Azure cloud integration
* SQL-based data transformation
* Star schema modeling
* KPI development
* Interactive Power BI dashboard creation

---

# Problem Statement

The objective of this project is to help financial institutions monitor and analyze loan performance using interactive dashboards and business KPIs.

The dashboards provide insights into:

* Loan applications
* Funded amount
* Amount received
* Good vs Bad loans
* Interest rate trends
* Debt-to-Income ratio (DTI)
* Regional lending analysis
* Borrower segmentation

---

# Architecture

CSV Dataset
↓
Azure Data Lake Storage
↓
Azure Data Factory
↓
Azure SQL Database
↓
Power BI Dashboard

---

# Tools & Technologies Used

* Azure Data Lake Storage
* Azure Data Factory
* Azure SQL Database
* Microsoft SQL Server
* Power BI
* DAX
* Power Query
* SQL
* Data Modeling

---

# Data Modeling

The raw loan dataset was transformed into a Star Schema model for better analytical performance and scalability.

## Fact Table

* fact_loans

## Dimension Tables

* dim_customers
* dim_grade

Relationships were created between fact and dimension tables inside Power BI.

---

# Key KPIs

* Total Loan Applications
* Total Funded Amount
* Total Amount Received
* Average Interest Rate
* Average DTI
* Good Loan Percentage
* Bad Loan Percentage
* MTD Metrics
* PMTD Metrics
* MoM Analysis

---

# Dashboard Pages

## 1. Summary Dashboard

* KPI Cards
* Good Loan vs Bad Loan Analysis
* Loan Status Analysis

## 2. Overview Dashboard

* Monthly Trends
* State-wise Loan Analysis
* Loan Term Analysis
* Employee Length Analysis
* Loan Purpose Breakdown
* Home Ownership Analysis

## 3. Details Dashboard

* Detailed loan-level transaction view
* Interactive filtering and drill analysis

---

# SQL Analysis Performed

* KPI Analysis
* Loan Status Analysis
* Monthly Trend Analysis
* State-wise Analysis
* Grade-wise Analysis
* Purpose Analysis
* Home Ownership Analysis
* Employee Length Analysis
* Loan Term Analysis

---

# Power BI Features Used

* DAX Measures
* Time Intelligence Functions
* MTD / PMTD / MoM Analysis
* Slicers & Filters
* Filled Map Visual
* Donut Charts
* Bar Charts
* Line Charts
* Data Modeling
* Interactive Dashboards

---

# Project Workflow

1. Imported raw CSV dataset into Azure Data Lake Storage.
2. Used Azure Data Factory for data movement and orchestration.
3. Loaded and transformed data in Azure SQL Database.
4. Created Star Schema model using fact and dimension tables.
5. Connected Azure SQL Database to Power BI.
6. Built interactive dashboards and KPIs using DAX.

---

# Files Included

* Power BI Dashboard (.pbix)
* SQL Query File
* Dashboard Screenshots
* Architecture Diagram
* README Documentation

---

# Dashboard Screenshots

## Summary Dashboard

![Summary Dashboard](Images/Bank%20Loan%20Summary.png)

## Overview Dashboard

![Loan Report Dashboard](Images/Bank%20Loan%20Report.png)

## Details Dashboard

![Details Dashboard](Images/Bank%20Loan%20Detail.png)

---

# Key Business Insights

* Majority of loans belong to good loan categories.
* Certain states show significantly higher lending activity.
* Borrowers with longer employment history tend to receive higher funded amounts.
* Debt consolidation is one of the most common loan purposes.
* Home ownership status impacts lending patterns and funded amounts.

---

# Author

Developed by Ashu
Azure SQL + Power BI Analytics Project
