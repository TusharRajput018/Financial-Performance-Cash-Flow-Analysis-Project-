##  DAX Measures Used in This Project

This file documents the measures created inside Power BI for the **Financial Performance & Cash Flow Analysis** project.
All measures are directly derived from the transaction-level table `finance_cleaned`.

The goal of these measures is to track:

* Business performance (Revenue, Expenses, Profit)
* Operational scale (Total Transactions)
* Cash-flow risk (Delayed metrics)

---

## 🔹 Revenue

**Purpose:**
Calculates total incoming value generated from transactions.

```DAX
Revenue = SUM(finance_cleaned[amount])
```

Used in:

* KPI Cards
* Monthly trend analysis
* Department comparisons

---

## 🔹 Expenses

**Purpose:**
Represents total operational cost recorded against transactions.

```DAX
Expenses = SUM(finance_cleaned[expense])
```

Used in:

* Cost analysis visuals
* Profit calculations
* Category and department breakdowns

---

## 🔹 Profit

**Purpose:**
Measures financial outcome after subtracting expenses from revenue.

```DAX
Profit = [Revenue] - [Expenses]
```

Used in:

* Executive performance view
* Department profitability comparison
* Trend analysis

---

## 🔹 Total Transactions

**Purpose:**
Shows overall activity volume — useful to understand whether changes in profit are driven by scale or value.

```DAX
Total_Transaction = COUNT(finance_cleaned[transaction_id])
```

Used in:

* KPI card for operational context

---

## 🔹 Delayed Transactions

**Purpose:**
Counts how many transactions were settled **after the due date**, highlighting payment discipline issues.

```DAX
Delayed Transactions =
CALCULATE(
    COUNT(finance_cleaned[transaction_id]),
    finance_cleaned[settlement_date] > finance_cleaned[due_date]
)
```

Used in:

* Cash-flow risk monitoring
* Delay trend visuals

---

## 🔹 Delayed Amount

**Purpose:**
Calculates how much revenue was received late, representing cash temporarily blocked.

```DAX
Delayed Amount =
CALCULATE(
    SUM(finance_cleaned[amount]),
    finance_cleaned[settlement_date] > finance_cleaned[due_date]
)
```

Used in:

* KPI cards
* Counterparty delay analysis
* Monthly delay trends

---

## 🔹 Avg Delay Days

**Purpose:**
Measures the average number of days payments were delayed for late transactions only.

```DAX
Avg Delay Days =
CALCULATE(
    AVERAGEX(
        finance_cleaned,
        DATEDIFF(
            finance_cleaned[due_date],
            finance_cleaned[settlement_date],
            DAY
        )
    ),
    finance_cleaned[settlement_date] > finance_cleaned[due_date]
)
```

Used in:

* Cash risk evaluation
* Understanding severity of delays

---

##  Notes on Design Choices

* Measures were created instead of calculated columns to keep calculations dynamic with slicers.
* `CALCULATE()` is only used where filtering logic is required (delayed cases).
* Core financial metrics (Revenue, Expenses, Profit) remain simple aggregations for clarity and performance.
* Delay metrics rely on comparing `due_date` and `settlement_date` to isolate late payments.

---

##  Outcome

These measures form the analytical backbone of the dashboard and allow:

* Monitoring of profitability
* Identification of cost drivers
* Detection of delayed cash inflows
* Supporting financial decision-making with real transaction behavior

---
