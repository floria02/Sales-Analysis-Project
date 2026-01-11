-- What product people aged 34,female buy the most? 
select oo.age,oo.gender,o.product,sum(o.quantity) as quantity
from orders1 o
left join orders2 oo
on o.customerid = oo.CustomerID
where age = 34 and gender = 'F'
group by oo.age,o.product
order by quantity desc;


-- What ages generated a revenue more than 1000 for the company?
select oo.age,round(sum(o.netrevenue),2) as revenue
from orders1 o
inner join orders2 oo
on o.customerid = oo.CustomerID
group by oo.age
having sum(o.netrevenue) > 4000
order by revenue desc;


-- In which country people tend to pay a higher average price?
select oo.country,round(avg(o.totalprice),2) as avgprice
from orders1 o
left join orders2 oo
on o.customerid = oo.CustomerID
group by oo.country
order by round(avg(o.totalprice),2) desc;

-- Find products that start with C or P where the corresponding age is between 20 and 40. 
select o.product,oo.age
from orders1 o
inner join orders2 oo
on o.customerid = oo.CustomerID
where (o.product like 'C%' or o.product like 'P%')
and oo.age between 20 and 40 ;






















