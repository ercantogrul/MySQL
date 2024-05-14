create table personel 
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Haluk Bilgin', 70000);
insert into personel values('1002', 'Java Han', 85000);
insert into personel values('1003', 'Ipek Bilir', 65000);
insert into personel values('1004', 'Java Tar', 95000);
insert into personel values('1005', 'Javva Nur', 80000);
insert into personel values('1006', 'Java Naz', 100000);
insert into personel values('1006', 'Java Su', 333000);
insert into personel values('1006', 'Java Can', 222000);
select * from personel;

-- Task01 -> Java Han ile Ipek Bilir  arasındaki personel bilgilerini listeleyen query create ediniz.
select * from personel where id between'1002' and '1003';
select * from personel where id>='1002' and id<='1003';

-- Task02 -> Maaşı sadece 70000 veya 100000 olan personeli listeleyen query create ediniz.
select * from personel where maas= '70000' or maas='100000';

-- Task03 -> İsminin 2. harfi E olan personeli listeleyen query create ediniz.
select * from personel where isim like '_e%';

-- Task04 -> Maaşı 6 haneli olan personeli listeleyen query create ediniz.
select * from personel where maas like '______';

-- Task05 -> id'si 1006 olan öğrencilerin tüm bilgilerini listeleyen query create ediniz.
select * from personel where id='1006';