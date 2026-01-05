-- Which product lines generate the most revenue?
select productline,sum(sales) as revenue
from salesdata
group by productLine
order by sum(sales) desc
limit 5 ;


-- Which product lines are the most cancelled and disputed ?
select productline,
sum(case when status = 'cancelled' then 1 else 0 end) as cancelled,
sum(case when status = 'disputed' then 1 else 0 end) as disputed
from salesdata
group by productline
order by cancelled desc;


-- Which quarter of the year generates the highest revenue? 
select QuarterOfYear,sum(sales) as MaxSales
from salesdata
group by QuarterOfYear
order by sum(sales) desc;


-- Which countries have the highest number of cancelled and disputed product lines ?
select country,
sum(case when status = 'cancelled' then 1 else 0 end) as cancelled,
sum(case when status = 'disputed' then 1 else 0 end) as disputed
from salesdata
group by country 
HAVING cancelled > 0 OR disputed > 0
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


-- Do some months usually generate more revenue than others  ?
select  year,month,avg(total_revenue) as avg_revenue from
(select year,month,sum(sales) as total_revenue
from salesdata
group by year,month 
order by year,month)tt
group by year,month
order by year desc,avg(total_revenue) desc;
