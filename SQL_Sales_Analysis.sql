-- Which product lines generate the most revenue?
select productline,max(sales)
from salesdata
group by productLine
order by max(sales) desc
limit 5 ;


-- Which product lines are the most cancelled and disputed ?
select productline,
sum(case when status = 'cancelled' then 1 else 0 end) as cancelled,
sum(case when status = 'disputed' then 1 else 0 end) as disputed
from salesdata
group by productline
order by cancelled desc;


-- Which quarter of the year generates the highest revenue? 
select QuarterOfYear,max(sales) as MaxSales
from salesdata
group by QuarterOfYear
order by max(sales) desc;


-- Which countries have the highest number of cancelled and disputed product lines ?
select country,
sum(case when status = 'cancelled' then 1 else 0 end) as cancelled,
sum(case when status = 'disputed' then 1 else 0 end) as disputed
from salesdata
group by country 
order by cancelled desc;


-- What impact does the deal size (Small / Medium / Large) have on the revenue? 
SELECT 
dealsize,
count(*) as num_orders,
sum(sales) as total_sales,
avg(sales) as avg_sales
from salesdata
group by DEALSIZE
order by sum(sales) desc;


-- Which month generates the highest revenue? 
select year,Month,max(sales) as revenue
from salesdata
group by Year,Month
order by max(sales) desc;


-- Do some months usually generate more revenue than others  ?
select  year,month,avg(total_revenue) as avg_revenue from
(select year,month,sum(sales) as total_revenue
from salesdata
group by year,month 
order by year,month)tt
group by year,month
order by avg(total_revenue) desc;
