-- BOOK SHOP --
create database bookShop;



create table books(
	bookid int primary key,
	authorname varchar(100),
	aboutbook varchar(500)
);

create table bookinfo(
	bookid int primary key, 
	genre varchar(50), 
	pages int, 
	soldout int,
	
	foreign key(bookid) references books(bookid)
);

create table sales(
	personid int,
	personname varchar(100),
	bookid int,
	bookname varchar(100),
	price int,
	
	primary key(personid, bookid),
	foreign key(bookid) references books(bookid)
);

create table customers(
	personid int,
	phonenumber varchar(20),
	bookid int,
	
	primary key(personid, bookid),
	foreign key(bookid) references books(bookid)
);



insert into books(bookid, authorname, aboutbook) values
	(501,'Anurag Mathur','A humorous story about Gopal, an Indian student in America, exploring cultural differences, college life, identity, and amusing misunderstandings.'),
	(502,'Stephen King','A psychological horror novel about Jack Torrance and his family trapped in an isolated hotel, where supernatural forces threaten their safety and sanity.'),
	(503,'Amish Tripathi','Shiva discovers the true evil threatening his world and declares war against powerful rulers controlled by the sage Bhrigu.'),
	(504,'Darius Foroux','A practical self-help book explaining how to control overthinking, improve mental clarity, and make better decisions through disciplined thinking.'),
	(505,'Renuka Gavrani','A reflective guide that encourages readers to embrace solitude, build self-awareness, and develop a healthier, independent relationship with themselves.'),
	(506,'Ravinder Singh','An emotional romance about love, destiny, and loss, based on a young couple whose relationship faces an unexpected and heartbreaking tragedy.'),
	(507,'Gaur Gopal Das','A motivational conversation about balancing relationships, work, happiness, and personal growth while finding meaning in everyday life.'),
	(508,'John Green','Hazel and Augustus meet in a cancer support group and develop a touching relationship while confronting love, illness, mortality, and hope.'),
	(509,'David Sedaris','A witty collection of autobiographical essays describing family life, language struggles, travel, education, and the author’s sharp observations of society.'),
	(510,'Chetan Bhagat','A romantic story about Krish and Ananya, whose relationship must overcome cultural differences and family opposition before marriage.');

insert into bookinfo(bookid, genre, pages, soldout) values
	(501,'Comic',256,90),
	(502,'Horror',512,70),
	(503,'Horror',575,NULL),
	(504,'Self-Help',NULL,100),
	(505,'Self-Help',NULL,150),
	(506,'Romance',208,NULL),
	(507,'Self-Help',224,NULL),
	(509,'Comic',272,NULL),
	(510,'Romance',269,125);

insert into sales(personid, personname, bookid, bookname, price) values
	(3013,'Ramya',501,'The Inscrutable Americans',300),
	(3024,'Aravind',502,'The Shining',500),
	(3056,'Shuba',503,'The Oath of the Vayuputras',350),
	(3007,'Ravi',504,'Think Straight',250),
	(3078,'Balan',505,'The Art of Being Alone',300),
	(3081,'Keerthi',506,'I Too Had a Love Story',220),
	(3002,'Suriya',507,'Life’s Amazing Secrets',270),
	(3062,'David',508,'The Fault in Our Stars',350),
	(3028,'Meena',509,'Me Talk Pretty One Day',480),
	(3080,'Priya',510,'2 States: The Story of My Marriage',250);

insert into customers(personid, phonenumber, bookid) values
	(3002,'91-7846532260',507),
	(3013,'91-9461583872',501),
	(3024,'91-9477661355',502),
	(3056,'91-6445721359',503),
	(3078,'91-9477851101',505),
	(3080,'91-8587946244',510),
	(3081,'91-8965664122',506);





-- changes --

SELECT *
FROM bookinfo
WHERE bookid in (
    SELECT bookid
    FROM bookinfo
    WHERE soldout IS NULL OR pages IS NULL
);



select personid, personname, price from sales
where price = (select max(price) from sales);

select max(price) from sales;