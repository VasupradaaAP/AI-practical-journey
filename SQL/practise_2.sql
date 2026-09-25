-- SELECT --
select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;


-- RELATIONSHIP BETWEEN TABLES --
-- CUSTOMER AND ORDER --
select o.customerNumber, c.customername, c.city, o.status from   
customers as c full outer join orders as o
on c.customernumber = o.customernumber;

-- OFFICE AND EMPLOYEE --
select e.firstname, e.jobtitle, o.phone from   
offices as o right join employees as e
on o.officecode = e.officecode;

-- PRODUCT, ORDER AND ORDERDETAIL --
select od.productcode, pd.productline, od.priceeach, pd.buyprice, o.status from   
orderdetails as od right join 
products as pd
on od.productcode = pd.productcode
left join
orders as o
on od.ordernumber = o.ordernumber;

-- PAYMENT AND CUSTOMER --
select c.contactfirstname, pay.paymentdate, pay.amount, c.creditlimit from   
payments as pay left join customers as c
on pay.customernumber = c.customernumber;
