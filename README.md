<h1 align="center">Sales analysis of products</h1>

<p align="center">
  <img src="https://i.postimg.cc/Rhk4zL2Z/resized2.jpg" alt="Alt text">
</p>
<hr style="border: 1px solid #ddd;">

**Tools used:** Excel | MySQL | PowerBI

<hr style="border: 1px solid #ddd;">

**DATASET**: Questions and Results


•**Which products generate the most revenue?**
```sql
select productline,sum(sales) as revenue
from salesdata
group by productLine
order by sum(sales) desc
limit 5 ;
```

**Result:**
<p>
  <img src="https://i.postimg.cc/YhwKyfQt/Products-Most-Revenue.jpg" alt="Alt text">
</p>

•**Which products are the most cancelled and/or disputed?**
```sql
select productline,
sum(case when status = 'cancelled' then 1 else 0 end) as cancelled,
sum(case when status = 'disputed' then 1 else 0 end) as disputed
from salesdata
group by productline
order by cancelled desc;
```

**Result:**
<p>
  <img src="https://i.postimg.cc/1fchxnrT/Products-Cancelled-Disputed.jpg" alt="Alt text">
</p>


•**Which quarter of the year generates the highest revenue?**
```sql
select QuarterOfYear,sum(sales) as MaxSales
from salesdata
group by QuarterOfYear
order by sum(sales) desc;
```

**Result:**
<p>
  <img src="https://i.postimg.cc/mtGf6N7B/Quarter-Highest.jpg" alt="Alt text">
</p>


•**Which countries have the highest number of cancelled or disputed products?**
```sql
select country,
sum(case when status = 'cancelled' then 1 else 0 end) as cancelled,
sum(case when status = 'disputed' then 1 else 0 end) as disputed
from salesdata
group by country 
HAVING cancelled > 0 OR disputed > 0
order by cancelled desc;
```

**Result:**
<p>
  <img src="https://i.postimg.cc/D8KkYd1h/Countries-Cancelled-Disputed.jpg" alt="Alt text">
</p>


•**What impact does the deal size (Small / Medium / Large) have on the revenue?** 
```sql
SELECT 
dealsize,
count(*) as num_orders,
sum(sales) as total_sales,
avg(sales) as avg_sales
from salesdata
group by DEALSIZE
order by sum(sales) desc;
```

**Result:**
<p>
  <img src=https://i.postimg.cc/N02YfFfZ/Deal-Size.jpg" alt="Alt text">
</p>

Even though on average for each large deal the company had a sale higher than the other sizes, the quantity that was sold was significantly lower compared to small and medium. Medium size contributed the most to the revenue because the quantity that was sold was higher. Large size most likely had a higher price and people were more willing to buy medium sizes. 

•**Do some months usually generate more revenue than others?** 
```sql
select  year,month,avg(total_revenue) as avg_revenue from
(select year,month,sum(sales) as total_revenue
from salesdata
group by year,month 
order by year,month)tt
group by year,month
order by year desc,avg(total_revenue) desc;
```

**Result:**
<p>
  <img src="https://i.postimg.cc/RNQ5r6L2/Years-Months-Revenue.jpg" alt="Alt text">
</p>
Two particular months in a period of 2 years have shown the most contribution to the revenue. On average October and November show the most generated revenue.


<p>
  <img src=https://ibb.co/RkZQ7d43" alt="Alt text">
</p>
