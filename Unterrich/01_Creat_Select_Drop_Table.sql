/*
'multible yorum satiri' 
burda olan burda kalir asla derlenmez
*/
-- single yorum satiri ...

create database fsae03;
use fsae03;
create table javaCAN
(
id varchar(4),
javaCan_name varchar(50),
yas int
);
/***************************
      VERI GIRISI
****************************/
insert into javacan values('101','Ercan Bey',45);
insert into javacan values('102','Mahmut Bey',35);
insert into javacan values('103','Yasin Bey',40);
insert into javacan values('104','Nuray Hanim',42);
insert into javacan values('105','Ebru Hanim',37);
insert into javacan values('106','Beyza Hanim',37);
insert into javacan values('107','Rasit Bey',39);

/***************************
      TABLODAN VERI SORGULAMA
****************************/
-- syntax -> select * from table_name

select * from javacan; -- * tüm veriler anlamina gelir
select id,yas from javacan;  -- javaCan tablodan sadece id ve yas field record edildi 

/***************************
      PARCALI VERI GIRISI
****************************/
insert into javacan(id,javaCAN_Name) values('108','Selim Bey');

/***************************
      TABLOYU DB (databaseden) DEN SILME
****************************/
-- syntax -> drop table table_name;
drop table javacan;


