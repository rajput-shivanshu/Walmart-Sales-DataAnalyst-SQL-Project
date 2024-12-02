# Walmart-Sales-DataAnalyst-SQL-Project

### **About**

We are analyzing Walmart's sales data to discover high-performing branches and products, as well as to examine different product sales trends and customer behavior. The main goal is to improve and optimize sales strategies. The dataset used in this experiment comes from the Kaggle Walmart Sales Forecasting Competition.


### **Purposes of the Project**

The primary purpose of this research is to get insight from Walmart's sales data by investigating the numerous factors that influence sales across branches.


### **About Data**

This project's data was acquired via the Kaggle Walmart Sales Forecasting Competition and comprises sales transactions from three Walmart branches in Mandalay, Yangon, and Naypyitaw, respectively. The data consists of 1000 rows and 17 columns:


| Column | Description | Data Type |
| -------|-------------| --------- |
| invoice_id | Invoice of the sales made |	VARCHAR(30) |
|branch|Branch at which sales were made|	VARCHAR(5)|
|city	|The location of the branch	|VARCHAR(30)|
|customer_type|	The type of the customer	|VARCHAR(30)|
|gender|	Gender of the customer making purchase	|VARCHAR(10)|
|product_line|	Product line of the product sold	|VARCHAR(100)|
|unit_price|	The price of each product	|DECIMAL(10, 2)|
|quantity|	The amount of the product sold	|INT|
|VAT	|The amount of tax on the purchase	|FLOAT(6, 4)|
|total	|The total cost of the purchase	| DECIMAL(12, 4)|
|date	|The date on which the purchase was made|	DATETIME|
|time|	The time at which the purchase was made|	TIME|
|payment	|The total amount paid	|DECIMAL(10, 2)|
|cogs|	Cost Of Goods sold	|DECIMAL(10, 2)|
|gross_margin_pct|	Gross margin percentage|	FLOAT(11, 9)|
|gross_income	|Gross Income|	DECIMAL(12, 4)|
|rating	|Rating|	FLOAT(2, 1)|


### **Analysis List:**
1. Product Analysis
   
Analyze the data to acquire insights into various product lines, find the best-performing product lines, and discover areas for improvement in other product lines.

2. Sales Analysis
   
The purpose of this analysis is to respond the request about the product's sales trends. The results of this study can help evaluate the effectiveness of each sales technique used in the firm and determine the necessary changes to enhance sales.

3. Customer Analysis

This analysis focuses on identifying different client categories, assessing purchasing behaviors, and determining the profitability from each of these customer segments.



### **Approach Used**

1. **_Data Wrangling_**
   
  During this initial phase, the data is inspected for NULL or missing values, and data replacement algorithms are applied to efficiently address and substitute these values.

     * Build a database.
     * Create a table and insert the data.
     * Select columns that contain null values. Null values are not present in our database because the tables were created with NOT NULL defined for each field, thereby filtering out any null values.

2. **_Feature Engineering_**

    * Create a new column called time_of_day to provide insight into sales in the morning, afternoon, and evening. This will help to answer the question of when the majority of sales occur.

    * Create a new column called day_name that contains the extracted days of the week on which the transaction occurred (Mon, Tue, Wed, Thur, Fri). This will help you determine which week of the day each branch is busiest.

    * Create a new column called month_name that contains the extracted months of the year in which the transaction occurred (January, February, and March). Help decide which month of the year generates the most sales and profit.
  

3. **_Exploratory Data Analysis (EDA)_**
  
   Conducting exploratory data analysis is essential to address the project's listed questions and objectives.


## Business Questions to Answer

**Generic Questions**

How many distinct cities are present in the dataset?
In which city is each branch situated?

**Product Analysis**

How many distinct product lines are there in the dataset?
What is the most common payment method?
What is the most selling product line?
What is the total revenue by month?
Which month recorded the highest Cost of Goods Sold (COGS)?
Which product line generated the highest revenue?
Which city has the highest revenue?
Which product line incurred the highest VAT?
Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.
Which branch sold more products than average product sold?
What is the most common product line by gender?
What is the average rating of each product line?

**Sales Analysis**

Number of sales made in each time of the day per weekday
Identify the customer type that generates the highest revenue.
Which city has the largest tax percent/ VAT (Value Added Tax)?
Which customer type pays the most VAT?

**Customer Analysis**

How many unique customer types does the data have?
How many unique payment methods does the data have?
Which is the most common customer type?
Which customer type buys the most?
What is the gender of most of the customers?
What is the gender distribution per branch?
Which time of the day do customers give most ratings?
Which time of the day do customers give most ratings per branch?
Which day of the week has the best avg ratings?
Which day of the week has the best average ratings per branch?
