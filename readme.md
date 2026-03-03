# 📊 Financial Performance & Cash Flow Analysis

## 🔎 Business Problem

Organizations often track revenue and expenses but lack visibility into **cost drivers and delayed payments**, which directly affect profitability and liquidity.
This project aims to analyze transaction-level financial data to answer:

* How is the business performing month over month?
* Which departments and categories contribute most to expenses?
* Are we receiving payments on time?
* How much cash is tied up in delayed settlements?
* Where should management focus to improve financial efficiency?

---

## 📂 Dataset Description

The dataset contains **transaction-level financial records** with key fields such as:

* `transaction_id` – Unique identifier for each transaction
* `transaction_date` – Date when the transaction occurred
* `amount` – Revenue generated from the transaction
* `expense` – Cost associated with the transaction
* `category`, `sub_category` – Type of expense/revenue
* `department`, `cost_center` – Organizational units
* `counterparty` – External entity involved in the transaction
* `due_date` – Expected payment date
* `settlement_date` – Actual payment received date

This structure allows both **performance analysis** and **cash flow monitoring**.

---

## 🛠 Tools Used

| Tool                   | Purpose                                |
| ---------------------- | -------------------------------------- |
| Python (Pandas, NumPy) | Data cleaning and validation           |
| SQL (MySQL)            | Aggregations and business logic        |
| Power BI               | Data modeling and visualization        |
| DAX                    | KPI calculations and financial metrics |

---

## 🧠 Data Model (Star Schema)

A simple **Fact–Dimension model** was implemented in Power BI:

* **Fact Table:** `finance_cleaned` (transaction-level data)
* **Date Dimension:** Custom calendar table for time-based analysis

This structure enables:

* Accurate monthly trends
* Multi-date analysis (transaction, due, settlement)
* Scalable reporting design

---

## ⚙️ Steps Performed

1️⃣ **Data Cleaning (Python)**

* Converted date fields to proper datetime format
* Standardized numeric columns (`amount`, `expense`)
* Handled missing posting dates appropriately
* Validated dataset consistency before analysis

2️⃣ **SQL Analysis**

* Calculated monthly revenue, expenses, and profit
* Identified cost drivers by category and department
* Evaluated delayed transactions using due vs settlement dates
* Generated aggregated outputs for BI consumption

3️⃣ **Power BI Modeling**

* Built Date dimension for time intelligence
* Created relationships using transaction date
* Developed DAX measures for KPIs (Revenue, Profit, Delay Metrics)

4️⃣ **Dashboard Development**

* Designed a 3-page analytical dashboard:

  * Executive Overview
  * Cost Analysis
  * Cash Flow & Risk Monitoring

---

## 📈 Key Insights

* The business remained profitable overall, with fluctuations across months.
* Certain departments consistently contributed higher operational costs.
* A small number of counterparties were responsible for major payment delays.
* Significant revenue was temporarily locked due to late settlements.
* Monitoring receivables can improve liquidity without increasing sales.

---

## ▶️ How to Run This Project

1. Clean the dataset using the provided Python preprocessing steps.
2. Execute SQL queries to generate aggregated financial metrics.
3. Load the dataset into Power BI Desktop.
4. Create the Date table and establish relationships with `transaction_date`.
5. Add DAX measures for KPIs and build visuals as per dashboard design.
6. Use slicers to analyze performance by time, department, and category.

---

## 🎯 Outcome

This project demonstrates how raw transaction data can be transformed into **actionable financial intelligence**, enabling organizations to:

* Monitor profitability trends
* Control operational costs
* Detect cash flow risks early
* Support data-driven financial decisions

---
