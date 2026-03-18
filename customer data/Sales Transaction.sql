select * from cleaned_dataset;

# What are the top 5 products by total revenue in last 6 months of 2024
select Item, sum(`Total Spent`) as total_revenue 
from cleaned_dataset 
where `Transaction Date` >= date_sub('2024-12-31', Interval 6 Month) and Item <> 'Unknown Item'
group by Item 
order by total_revenue desc 
limit 5;

# Category generated highest revenue
select Category, sum(`Total Spent`) as category_revenue
from cleaned_dataset 
group by Category
order by category_revenue desc;

# Monthly revenue trend in 2024
select Month, Year, sum(`Total Spent`) as monthly_revenue
from cleaned_dataset
where Year = 2024
group by Month, Year
order by Month, Year;

# Customer contribution towards revenue
select `Customer ID`,sum(`Total Spent`) as total_spent
from cleaned_dataset
group by `Customer ID`
order by total_spent desc
limit 5;
 
# Popular payment method in terms of total revenue
select `Payment Method`, count(*) as transaction_count, sum(`Total Spent`) as total_revenue
from cleaned_dataset
group by `Payment Method`
order by transaction_count desc;

# which location has highest sales
select Location, sum(`Total Spent`) as location_revenue
from cleaned_dataset
group by Location
order by location_revenue desc;

# Monthly user acquisition trend over the past 2 year
select Year, Month, count(distinct `Customer ID`) as new_user
from cleaned_dataset
where `Transaction Date`>=date_sub(curdate(), interval 2 Year)
group by Year, Month
order by Year, Month desc;

# Top 10 customers in last 5 months
select `Customer ID`, sum(`Total Spent`)as total_revenue 
from cleaned_dataset 
where `Transaction Date`>=date_sub(curdate(),Interval 2 Year) 
group by `Customer ID` 
order by total_revenue desc
limit 10;