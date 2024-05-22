create table product_group (
g_code 	  char(7) primary key not null,
g_name 	  varchar(45),
p_manager varchar(45) default 'tanımlanmadı' );

create table products (
p_code varchar(20) unique not null,
p_name varchar(45),
g_code char(7) ,
g_renk varchar(10),
fiyat int,
CONSTRAINT group_fk FOREIGN KEY (g_code) REFERENCES product_group(g_code) );

insert into product_group (g_code,g_name) values 
('DT','DeskTop'),('LT','LapTop'),('MP','MobilePhone'),('PR','Printer');  

insert into products(p_code,p_name,g_code,fiyat) values 
('AS01', 'Asus 14" Notebook', 	'LT',450),('AS15', 'Asus 15" Notebook', 	'LT',650),
('D151', 'Dell 15" Notebook',  	'LT',550),('DT01','Asus Desktop Computer',	'DT',480),
('AP70', 'Asus Mobile phone ',  'MP',300),('DT02','Asus Desktop Computer',	'DT',460),
('AP20', 'Asus MMobile Phone',	'MP',290),('DT03','HP Desktop Computer',	'DT',440),
('HP05', 'HP 17" Notebook',    	'LT',600),('DT04','Dell Desktop Computer',	'DT',390),
('AS05', 'Asus 15" Notebook',  	'LT',570),('DT05','Dell Desktop Computer',	'DT',395),
('BL13', 'Brother Lazer Printr','PR',120),('DT06','Zenon Desktop Computer',	'DT',475),
('IJ10', 'HP InkJet Printer',  	'PR', 70),('DT07','Dell Desktop Computer',	'DT',495),
('LZ30', 'HP Lazer Printer',   	'PR', 99),('DT08','HP Desktop Computer',	'DT',500);

select * from product_group;
select * from products;


-- Soru 1) Her ürün grubundan 400 den pahalı kaç adet ürün vardır listeleyen query create ediniz.

select g_name, count(p_name) as urun_grubu_adet_sayisi
from product_group
left join products
on product_group.g_code=products.g_code
where fiyat>400
group by g_name;


-- Soru 2) 400 den pahalı ürünü olan ürün gruplarında, kaç adet ürün vardır listeleyen query create ediniz.
select g_name, count(products.g_code) as dortyuzden_pahali_urun_sayilari, group_concat(fiyat separator ' , ') as fiyatlar
from product_group
left join products
on product_group.g_code=products.g_code
where fiyat>400
group by g_name;


select g_name, count(p_name) as urun_grubu_adet_sayisi
from product_group
left join products
on product_group.g_code=products.g_code
where fiyat>400
group by g_name;


-- Soru 3) 3 den fazla ürüne sahip ürün gruplarının en ucuz ürünlerini listeleyen query create ediniz.
select g_name, count(products.g_code) as adet, min(fiyat) as en_dusuk 
from product_group
left join products
on product_group.g_code=products.g_code
group by g_name
having count(p_name)>3;





