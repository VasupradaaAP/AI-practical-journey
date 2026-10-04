-- WITHOUT PARAMETER --

delimiter $$
create procedure genrelist()
begin
	select genre, count(bookid) as categorycount
	from bookinfo group by genre order by categorycount desc;
end $$
delimiter ;
call genrelist();


delimiter $$
create procedure purchase()
begin
	select personname, bookname from sales;
end $$
delimiter ;
call purchase();


delimiter $$
create procedure book_data()
begin
	select s.bookname, b.aboutbook 
	from sales as s inner join books as b 
	on s.bookid = b.bookid;
end $$
delimiter ;
call book_data();



-- WITH PARAMETER --

delimiter $$
create procedure customerbook(in name varchar(50))
begin
	select personname, bookname 
	from sales
	where personname = name;
end $$
delimiter ;
call customerbook('Ravi');


delimiter $$
create procedure books_variety(in book_type varchar(50))
begin
	select s.bookname 
	from sales as s left join bookinfo as bi 
	on bi.bookid = s.bookid
	where bi.genre = book_type;
end $$
delimiter ;
call books_variety('Comic');


delimiter $$
create procedure customer_contact(in numid int)
begin
	select s.bookid, s.personname, c.phonenumber 
	from sales as s left join customers as c 
	on s.bookid = c.bookid
	where s.bookid = numid;
end $$
delimiter ;
call customer_contact(507);