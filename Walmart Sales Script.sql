------------------------Feature Engineering----------------------
-- 1. Time_of_day --

Select Time,
(Case
   when time between "00:00:00" and "12:00:00" Then "Morning"
   when time between "12:01:00" and "16:00:00" Then "Afternoon"
   else "Evening"
   End ) as Time_of_Day
   from walmart.sales;
   
alter table walmart.sales ADD column Time_of_Day varchar(20);
 
 update walmart.sales
 Set time_of_day = (
            Case
                  When time between "00:00:00" and "12:00:00" Then "Morning"
                  When time between "12:01:00" and "16:00:00" Then "Afternoon"
                  else "Evening"
                  end);
 
-- 2. Day_name --
   
   Select Date,
   Dayname(Date) as Day_name
   from walmart.sales;
   
Alter table Walmart.sales ADD column Day_name Varchar(20);
   
 Update Walmart.sales
 Set Day_name = DAYNAME(date);
 
 -- 3. Month_name --
 
 Select date,
 MonthName(date)
 from walmart.sales;

Alter table walmart.sales Add column Month_name varchar(20);
 
 update Walmart.sales
 set Month_name = monthname(date);
 
 ---------------- Exploratory Data Analysis (EDA) ---------------------
 -- Generic Questions --
 
 -- 1. How many distinct cities are present in the dataset?--
 Select distinct(city) from Walmart.sales;
 
 -- 2. In which city is each branch situated?--
Select distinct(city), branch from Walmart.sales;
 
 
 -- Product Analysis --
 
-- 1. How many distinct product lines are there in the dataset?--
Select Count(distinct(product_line))
   from walmart.sales;

 
-- 2. What is the most common payment method? --
Select payment, Count(payment) as common_payment_method
from walmart.sales
group by 1
order by common_payment_method desc 
limit 1;

-- 3. What is the most selling product line? -- 
Select product_line, Count(product_line) as most_selling_product
from walmart.sales
group by 1
order by most_selling_product desc
limit 1;

-- 4. What is the total revenue by month? --
Select Month_name, Sum(total) AS Total_Revenue
from walmart.sales
group by 1
order by Total_Revenue Desc;

-- 5. Which month recorded the highest Cost of Goods Sold (COGS)? --
Select Month_name, sum(cogs) AS Highest_COGS
from walmart.sales
group by month_name
order by Highest_COGS Desc;

-- 6. Which product line generated the highest revenue? --
select product_line, Sum(total) as  highest_revenue
from walmart.sales
group by product_line
order by highest_revenue desc
limit 1;

-- 7. Which city has the highest revenue? --
Select city, sum(total) as highest_revenue
from walmart.sales
group by city
order by highest_revenue desc
limit 1;

-- 8. Which product line incurred the highest VAT? --
Select product_line, sum(vat) as highest_vat
from walmart.sales
group by product_line
order by highest_vat desc
limit 1;

-- 9. Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average. --
Alter table walmart.sales add column product_category varchar(20);
		
UPDATE walmart.sales s
JOIN (
    SELECT AVG(total) AS avg_total
    FROM walmart.sales
) avg_table
SET s.product_category = 
    CASE 
        WHEN s.total >= avg_table.avg_total THEN 'Good'
        ELSE 'Bad'
    END;

-- 10. Which branch sold more products than average product sold? --
Select Branch, Sum(quantity) as Total_Qty
from walmart.sales
group by Branch
Having   Sum(quantity) > Avg(quantity)
order by Total_Qty Desc
limit 1;

-- 11. What is the most common product line by gender? --
select Gender, product_line, Count(gender) AS total_count
from walmart.sales
group by Gender, product_line
order by total_count Desc;

-- 12. What is the average rating of each product line? --
select product_line , Round(Avg(rating),2) as AVG_Rating
from walmart.sales
group by product_line
order by AVG_Rating Desc;


-- Sales Analysis --

-- 1.Number of sales made in each time of the day per weekday --
select Day_name, Time_of_Day, Count(invoice_id) as Total_Sales
from walmart.sales
where Day_name not in ("Saturday", "Sunday")
group by Day_name, Time_of_Day;

-- 2. Identify the customer type that generates the highest revenue. --
Select customer_type, sum(total) as Highest_revenue
from walmart.sales
group by customer_type
order by Highest_revenue desc
limit 1;

-- 3. Which city has the largest tax percent/ VAT (Value Added Tax)? --
select City, sum(vat) as Total_Vat
from walmart.sales
group by City
order by Total_Vat Desc
limit 1;

-- 4. Which customer type pays the most VAT? --
Select customer_type, Sum(vat) as Total_Vat
from walmart.sales
group by customer_type
order by Total_Vat Desc
limit 1; 


-- Customer Analysis --
-- 1. How many unique customer types does the data have? --
select count(distinct(customer_type)) 
from walmart.sales;

-- 2. How many unique payment methods does the data have? --
select count(distinct(payment))
from walmart.sales;

-- 3. Which is the most common customer type? --
Select customer_type, Count(customer_type) AS Common_Customer
from walmart.sales
group by customer_type
order by Common_Customer desc
limit 1;

-- 4. Which customer type buys the most? --
Select customer_type, Count(*) as Most_Buyer
from walmart.sales
group by customer_type
order by Most_Buyer Desc
limit 1; 

Select customer_type, Sum(total) as Most_Buyer
from walmart.sales
group by customer_type
order by Most_Buyer Desc
limit 1; 

-- 5. What is the gender of most of the customers? --
Select Gender, Count(*) as All_gender
from walmart.sales
group by gender
order by All_gender Desc
limit 1;

-- 6. What is the gender distribution per branch? -- 
Select branch, gender, Count(gender) as Gender_Distribution 
from walmart.sales
group by  branch, gender
order by branch;

-- 7. Which time of the day do customers give most ratings? -- 
Select time_of_day, avg(rating) AS Avg_Day_Rating
from walmart.sales
Group by Time_of_Day
order by Avg_Day_Rating desc
limit 1; 

-- 8. Which time of the day do customers give most ratings per branch? -- 
Select branch, Time_of_Day,  Avg(rating) as Avg_branch_rating 
from walmart.sales
group by branch, Time_of_Day
order by Avg_branch_rating
limit 1; 


-- 9. Which day of the week has the best avg ratings? -- 
Select Day_name, Avg(rating) as Avg_Day_Rating
from walmart.sales
group by Day_name
order by Avg_Day_Rating
limit 1; 

-- 10. Which day of the week has the best average ratings per branch? -- 
Select Branch, Day_name, avg(rating) as Avg_Best_Rating
from walmart.sales
group by Branch, Day_name
order by Avg_Best_Rating Desc;


 
 