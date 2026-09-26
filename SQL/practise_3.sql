-- 1. Identify all orders that are currently In Process, along with their order number, customer number, and order date. --
select customernumber, ordernumber, orderdate, status 
from orders
where status='In Process';

-- 2. Find order details where the quantity ordered is greater than 1, and display the highest-priced items first. --
select ordernumber, productcode, quantityordered, priceeach 
from orderdetails
where quantityordered > 1
order by priceeach desc;

-- 3. Identify products with less than 70 units in stock --
select productcode, productline, productname, productdescription, quantityinstock 
from products 
where quantityinstock < 70;

-- 4. Find customers whose credit limit is between ₹1.5 lakh and ₹2 lakh, sorted by credit limit --
select customername, contactfirstname, city, state, country, phone, creditlimit
from customers 
where creditlimit > 150000 and creditlimit < 200000
order by creditlimit;

-- 5. Retrieve orders that were shipped from March 1, 2026 onwards to monitor recent shipments --
SELECT *
FROM orders
WHERE orderdate >= '2026-03-01' and status = 'Shipped';

-- 6. Identify payment transactions with an amount below ₹10,000 for payment analysis. --
SELECT *
FROM payments 
where amount < 10000;

-- 7. Retrieve employee details for specific employees --
select * 
from employees 
where firstname in ('Neha','Karan','Ananya','Vishnu')

-- 8. Update order number 30001 to Shipped, record the shipping date as May 18, 2026, and add a delivery comment. --
update orders 
set status = 'Shipped', shippeddate='2026-05-18', comments='Delayed delivery' 
where ordernumber = 30001;

-- 9. Remove the extension column from the employees table as part of database structure maintenance. --
alter table employees 
drop column extension;

-- 10. Add an average price column to the productlines table to support productline pricing analysis. --
alter table productlines 
add averageprice int;











