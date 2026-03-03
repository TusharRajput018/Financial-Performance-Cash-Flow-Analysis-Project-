##  Overview

This data dictionary describes the structure and meaning of fields used in the **Financial Performance & Cash Flow Analysis** project.
The dataset represents transaction-level financial activity and is used as the primary fact table (`finance_cleaned`) in the Power BI model.

Each row corresponds to a single financial transaction.

---

##  Table: `finance_cleaned`

| Column Name        | Data Type | Description                                             | Business Usage                                  |
| ------------------ | --------- | ------------------------------------------------------- | ----------------------------------------------- |
| transaction_id     | Integer   | Unique identifier for each transaction                  | Used for counting transactions                  |
| transaction_date   | Date      | Date when the transaction occurred                      | Primary timeline for performance analysis       |
| posting_date       | Date      | Date when transaction was recorded in the system        | Not used in core analysis due to missing values |
| currency           | Text      | Currency in which transaction was recorded              | Assumed standardized                            |
| amount             | Decimal   | Monetary value generated from the transaction (Revenue) | Used to calculate Revenue and Profit            |
| transaction_type   | Text      | Type of financial activity                              | Contextual classification                       |
| category           | Text      | High-level classification of revenue/expense            | Used for cost analysis                          |
| sub_category       | Text      | Detailed classification within category                 | Used for drill-down analysis                    |
| counterparty       | Text      | External entity involved in the transaction             | Used in delay-risk analysis                     |
| payment_method     | Text      | Mode of payment                                         | Operational reference only                      |
| department         | Text      | Internal business unit responsible                      | Used for profitability comparison               |
| cost_center        | Text      | Accounting unit tracking cost allocation                | Used for detailed expense breakdown             |
| transaction_status | Text      | Status of the transaction                               | Informational                                   |
| invoice_id         | Text      | Identifier for billing reference                        | Used to identify delayed invoices               |
| due_date           | Date      | Expected payment date                                   | Used to detect delays                           |
| settlement_date    | Date      | Actual payment realization date                         | Used in cash-flow analysis                      |
| expense            | Decimal   | Cost associated with the transaction                    | Used to calculate Expenses and Profit           |

---

##  Derived Fields Used in Analysis

The following values are not stored directly in the dataset but are calculated during analysis.

| Derived Metric       | Logic                                      | Purpose                       |
| -------------------- | ------------------------------------------ | ----------------------------- |
| Revenue              | SUM(amount)                                | Measures total incoming value |
| Expenses             | SUM(expense)                               | Measures operational cost     |
| Profit               | Revenue − Expenses                         | Shows financial outcome       |
| Total Transactions   | COUNT(transaction_id)                      | Measures activity volume      |
| Delayed Transactions | settlement_date > due_date                 | Identifies late payments      |
| Delayed Amount       | SUM(amount where delayed)                  | Quantifies blocked cash       |
| Avg Delay Days       | Difference between settlement and due date | Measures severity of delay    |

---

##  Role in Data Model

* `finance_cleaned` functions as the **Fact Table**
* Connected to a **Date Dimension Table** created in Power BI
* Enables time-based aggregation across transaction, due, and settlement timelines

---

##  Notes

* Each record is treated as an independent financial event.
* Delay-related calculations rely strictly on date comparisons.
* No additional enrichment or external joins were applied to the dataset.

---

This structure supports both **performance reporting** and **cash-flow risk analysis** within the dashboard.

---
