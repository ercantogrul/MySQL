create database books;
use books;

create table book_List(
bookId int,
bookName varchar(10),
writerName char(12)
);

select * from book_List;

insert into book_list values(001,'Dune','Writer');
insert into book_list values(002,'Dune2','Writer2');
insert into book_list values(003,'Dune3','Writer3');
create table bookPrice_List(
bookId int(5),
bookPrice double(5,3)
);
insert into bookPrice_list values(004,85);
insert into bookPrice_list values(005,12.5);
insert into bookPrice_list values(006,57.12);


