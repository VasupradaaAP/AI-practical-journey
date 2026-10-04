/* 1. The finance team wants to track how each customer's payments accumulate over time. 
	  For every payment record, display the payment details along with the running total of payments, made by the customers */

select *, 
sum(amount) over (partition by customernumber 
				  order by paymentdate) as payment
from payments;



/* 2. The procurement team wants to identify the company's most expensive products to purchase from suppliers. 
	  Retrieve each product's name, quantity in stock, and purchase price, and assign a rank based on buyPrice */

select productname, quantityinstock, buyprice,
rank() over (order by buyprice desc) as priorityproduct
from products;



/* 3. The sales analytics team wants to understand how product prices accumulate across different order quantities. 
	  For each order detail, display running total of unit prices for products having the same quantity ordered. */

select productcode, quantityordered, priceeach, 
sum(priceeach) over (partition by quantityordered 
					 order by priceeach) as quantity
from orderdetails;




/* 4. The finance team wants to compare each customer's payment with their next recorded payment. 
	  For every payment transaction, display all payment details along with the amount of the customer's subsequent payment */

select *, 
lead(amount) over (partition by customernumber 
				  order by paymentdate) as payment
from payments;



/* 5. The inventory management team wants to identify which products currently have the highest stock availability. 
	  Retrieve the product name and quantity in stock, and assign a dense rank based on quantityInStock in descending order */

select productname, quantityinstock, 
dense_rank() over (order by quantityinstock desc) 
from products;
