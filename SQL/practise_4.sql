-- TASK 1 - Aggregate Functions : 3 --


/* 1. The sales management team wants to understand the price range of products sold through customer orders. 
	  Identify the minimum and maximum unit price (priceEach) recorded in the orderdetails table */

select min(priceeach) as MinimumPrice, 
max(priceeach) as MaximumPrice 
from orderdetails;


/* 2. The finance department wants to determine the total amount of payments received from all customers. 
	  Calculate the sum of all payment amounts recorded in the payments table to understand the company's overall cash collections. */

select sum(amount) as totalamount
from payments;


/* 3. The finance team wants to assess the overall credit exposure offered to customers. 
	  Calculate the average credit limit assigned to all customers in the customers table. */ 

select avg(creditlimit) as Average_CL
from customers ;




-- TASK 2 - Aggregate Functions with WHERE : 3 --


/* 1. The finance department wants to review the company's payment collections for the month of May 2026. 
	  Calculate the total payment amount received during May 2026 using the payment records */

select sum(amount) as totalamount_monthmay
from payments 
where paymentdate > '2026-04-30' and paymentdate < '2026-06-01';


/* 2. The sales management team wants to understand the sales volume of high-priced products. 
	  Calculate the total quantity of products ordered from the orderdetails table where the unit price (priceEach) is greater than 5,000 */

select sum(quantityordered)
from orderdetails 
where priceeach > 5000;


/* 3. The finance department wants to assess the total credit limit offered to customers in Maharashtra. 
	  Calculate the sum of credit limits for all customers whose state is Maharashtra using the customers table */

select sum(creditlimit) 
from customers 
where state='Maharashtra';




-- TASK 3 - Aggregate Functions with GROUPBY : 3 --


/* 1. The order management team wants to understand the current distribution of customer orders. 
	  Count the number of orders for each order status from the orders table */

select status, count(ordernumber) as status_count 
from orders
group by status;


/* 2. The sales team wants to identify how frequently different order quantities 
	  occur across customer orders. For each distinct quantityOrdered value in the 
	  orderdetails table, count the number of orders associated with that quantity */

select quantityordered, count(ordernumber) as total_quantity
from orderdetails
group by quantityordered
order by quantityordered asc;


/* 3. The customer analytics team wants to identify geographic regions with a significant customer presence. 
	  Count the number of customers in each state and display only those states that have more than one customer. */

select state, count(customernumber) as state_total
from customers
group by state
having state_total > 1;




-- TASK 4 - Subquery : 1 --


/* The customer service team wants to identify customers whose orders have been cancelled so they can follow up with those customers. 
   Retrieve the customer name and phone number of customers who have cancelled the order */

select customername, phone from customers 
where customernumber in (select customernumber from orders where status='Cancelled');



