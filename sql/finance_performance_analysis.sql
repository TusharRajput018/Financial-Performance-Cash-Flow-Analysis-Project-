select round(sum(amount),2 )as total_amount , round(sum(expense),2) as total_expense,
round(sum(amount)- sum(expense),2)as total_profit
from finance_cleaned;

select round(sum(amount),2) - round(sum(expense),2)  as total_profit ,
 MONTH(transaction_date) as month from finance_cleaned
group by month(transaction_date)
order by month asc;

select round(sum(amount),2) - round(sum(expense),2)  as total_profit ,
 MONTH(transaction_date) as month from finance_cleaned
group by month(transaction_date)
order by total_profit desc;

select    ROUND(SUM(expense), 2) AS total_expense ,
 MONTH(transaction_date) as month
from finance_cleaned
group by month (transaction_date)
order by total_expense  desc;

select    ROUND(SUM(expense), 2) AS total_expense ,year(transaction_date) as year,
 MONTH(transaction_date) as month 
from finance_cleaned
group by month (transaction_date) , year(transaction_date)
order by year desc, month desc;

select category as category  ,  sum(expense) as total_expense from finance_cleaned
group by category 
order by total_expense desc;

select  sum(expense) as total_expense , department as department , cost_center as CostCenter from finance_cleaned
group by department, cost_center
order by total_expense Desc;

select 
year(transaction_date) as Year ,
month(transaction_date ) as month , 
round(sum(expense),2) as total_expense , 
department ,
category
from finance_cleaned
group by category , department , year(transaction_date) ,month(transaction_date)  
order by Year , month ,total_expense desc;

select count(*) as delayed_transaction ,
round(avg(datediff(settlement_date, due_date)),2) as avg_delay_days,
round(sum(amount),2) as delayed_amount
from finance_cleaned
where settlement_date>due_date;

select
    category,
    ROUND(SUM(amount), 2) as total_revenue
from finance_cleaned
group by category
order by  total_revenue desc;

select
    department,
    round(sum(amount), 2) as revenue,
    round(sum(expense), 2) as expense,
    round(sum(amount) - sum(expense), 2) as profit
from finance_cleaned
group by department
order by profit desc;

select
    year(due_date) as year,
    month(due_date) as month,
    count(*) as delayed_txns,
    round(sum(amount), 2) as delayed_amount
from finance_cleaned
where settlement_date > due_date
group by year(due_date), month(due_date)
order by year, month;
