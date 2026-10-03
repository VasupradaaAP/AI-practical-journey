-- INNER JOIN --

/* Find the book name, author name, selling price, and book description for all sold books. 
   Display the books from the lowest selling price to the highest */

select s.bookname, b.authorname, s.price, b.aboutbook
from books as b inner join sales as s
on s.bookid = b.bookid order by price;



-- OUTER JOIN --

/* The bookstore wants to identify mismatches between its customer records, 
   book inventory information, and sales records */

select c.bookid, s.bookname, bi.genre
from customers as c full outer join bookinfo as bi
on c.bookid = bi.bookid
full outer join sales as s
on s.bookid = bi.bookid order by s.bookid;



-- LEFT JOIN --

/* The bookstore manager wants to identify books that are currently listed in the inventory 
   but may not have been sold yet */

select s.bookname, bi.genre, bi.pages
from bookinfo as bi left join sales as s
on bi.bookid = s.bookid order by genre;



-- RIGHT JOIN --

/* The bookstore wants to contact all registered customers regarding upcoming offers */

select s.personname, s.bookname, c.phonenumber 
from sales as s right join customers as c 
on s.personid = c.personid;



-- CROSS JOIN --

/* Create possible customer/genre combinations for campaign planning. */

select s.personname, bi.genre 
from sales as s cross join bookinfo as bi;



-- SELF JOIN --

/* The bookstore manager wants to identify different customers who purchased different books at the same price. 
   Find pairs of customers, along with their respective books and the price */

select 
    s1.personname as person1, s1.bookname as book1,
    s2.personname as person2, s2.bookname as book2, s1.price
from sales as s1 join sales as s2
on s1.price = s2.price and s1.personid > s2.personid
order by price desc;
