##  Assumptions

During this analysis, several practical assumptions were made to ensure the dataset could be interpreted consistently and used for business insights.

1. **Transaction Data is Considered Accurate**
   The dataset is assumed to be system-generated and reliable. No external validation of financial correctness was performed beyond data cleaning.

2. **Amount Represents Revenue Value**
   The `amount` column is treated as incoming value (revenue) associated with each transaction.

3. **Expense is Directly Linked to the Transaction**
   The `expense` column is assumed to reflect operational cost related to that specific transaction.

4. **Due Date Reflects Expected Payment Date**
   `due_date` is considered the contractual or expected settlement date for receivables.

5. **Settlement Date Reflects Actual Payment Realization**
   `settlement_date` is used as the true indicator of when cash was received.

6. **Delay is Calculated Only When Settlement Happens After Due Date**
   If `settlement_date > due_date`, the transaction is treated as delayed.
   Early or on-time payments are not treated as delays.

7. **Missing Posting Dates Were Not Used for Core Analysis**
   Since posting dates had null values and were not critical to performance measurement, analysis focused on transaction, due, and settlement dates.

8. **All Transactions Are Treated Independently**
   No attempt was made to group invoices into larger contracts or customer-level billing cycles.

---

##  Limitations

While the project provides useful financial insights, there are constraints that should be considered when interpreting results.

1. **Dataset Size Represents a Sample, Not Full Operational Scale**
   The analysis is based on a limited number of records (~5,000).
   Trends observed may differ in a full production environment.

2. **No External Context Available**
   The dataset does not include:

   * Budget targets
   * Forecast data
   * Industry benchmarks
     Therefore, insights focus on internal behavior rather than performance against goals.

3. **Profit is Calculated Using Available Fields Only**
   Profit is derived as:

   ```
   Profit = Revenue − Expense
   ```

   Other financial components such as taxes, overhead allocation, or depreciation are not included.

4. **Delay Analysis Does Not Distinguish Between Legitimate and Risk Delays**
   All late payments are treated equally. The data does not indicate whether delays were operational, contractual, or strategic.

5. **No Currency Conversion Applied**
   If multiple currencies exist, they are assumed to be already standardized.

6. **No Predictive or Forecasting Models Used**
   The project focuses on descriptive analytics (what happened), not predictive analysis (what will happen).

7. **Department and Category Structures Are Taken As-Is**
   No restructuring or normalization of business hierarchies was performed.

---

##  Interpretation Guidance

This dashboard should be used as an **operational insight tool**, not a replacement for formal financial reporting.
It is intended to highlight patterns, risks, and cost behavior that support better decision-making rather than produce audited financial statements.

---
