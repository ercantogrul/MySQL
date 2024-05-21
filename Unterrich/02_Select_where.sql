/***************************
SELECT - WHERE -> filtreleme
****************************/
/*
verileri select komutu ile  db'den çekerken filtreleme yapmak için WHERE komutu SELECT ile kullanilir.
syntax -> SELECT column1,column2.... FROM tablo_Name WHERE koşul;
*/
create table ogrenciler
(
id int,
isim varchar(45),
adres varchar(100),
sinav_not double(4,2)
);
insert into ogrenciler values(101,'Rasit','samsun',55.75);
insert into ogrenciler values(102,'Ercan','Agri',80.75);
insert into ogrenciler values(103,'Mahmut','Kayseri',38.75);
insert into ogrenciler values(104,'Nuray','Trabzon',61.75);
insert into ogrenciler values(105,'Ebru','Mus',49.75);
insert into ogrenciler values(105,'Yasin','Ankara',82.75);
insert into ogrenciler values(106,'Beyza','Bursa',16.75);
select * from ogrenciler;

-- Task01-> sinav notu 80'den büyük öğrencileri listeleyen query create ediniz...
-- select * from ogrenciler where sinav_not<>80.75; -- <> esit degil anlaminda, 80.75 bu notun haricindaki notlari getir
select * from ogrenciler where sinav_not>=80;
-- Task02-> sinav notu 80'den büyük öğrencilerin id'lerini listeleyen query create ediniz...
select id from ogrenciler where sinav_not>=80;
-- Task03-> adresi Ankara olan öğrencilerin isim ve adreslerini listeleyen query create ediniz...
select isim,adres from ogrenciler where adres='Ankara';
-- select isim,adres from ogrenciler where adres='ANKARA';-- incase sensitive

/*********************************
              SELECT - BETWEEN
**********************************/
-- BETWEEN 2 mantıksal ifade ile belirtilen veriler arasındaki dataları  listeler
-- ahan da TRICK -> BETWEEN de; belirttigini sınır degerleri de, listelemeye dahildir.

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

-- Task04 -> id'si 1002 ile 1005 arasında olan personel bilgilerini listeleyen query create ediniz.
-- 1.yol
select * from personel where id between '1002' and '1005';

/*********************************
              AND - OR
**********************************/ 
/*
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
En az bir tanesi gerçekleşmez ise listelemez.kaynana gibi kötümser

SELECT * FROM matematik sinav1 > 50 AND sinav2 > 50
Hem sinav1 hemde sinav2 alanı, 50'de büyük olan kayıtları listeler.

OR (veya): Belirtilen şartlardan en az biri gerçekleşirse, kayıt listelenir. ANA gibi iyimser

SELECT * FROM matematik sinav1 > 50 OR sinav2 > 50
Hem sinav1 veya sinav2 alanı, 50'de büyük olan kayıtları listeler.
*/

-- 2.yol
select * from personel where id>='1002' and id<='1005';

-- Task05 ->  Maaşı 70000 veya ismi Java Naz  olan personeli listeleyen query create ediniz.
select * from personel where maas=70000 or isim='Java Naz';
-- select * from personel where maas='70000' or isim='Java Naz'; --  int data type tirnakli veya tirnaksiz olarak da kullanilabilinir.

/*********************************
                       IN
**********************************/ 
/*
IN: Birden fazla mantıksal ifade ile tanımlabilen durumları tek komutla
sorgu yazabilme imkanı verir.
 
Syntax->  SELECT sutun1, sutun2 ....
 FROM tablo_adı
 WHERE sutun_adı IN (deger1, deger2)
*/

-- Task06 -> id'si 1001,1002 ve 1004 olan personel bilgilerini listeleyen query create ediniz.
-- 1.yol
select * from personel where id in(1001,1002,1004);
-- 2.yol
select * from personel where id='1001' or id='1002' or id='1004';
-- select * from personel where id='1001' or id='1002' or id='1007'; --  1007 id olmadigi icin record gozükmedi

-- Task06.5 -> Maaşı sadece 70000 veya ismi javva Nur olan personeli listeleyen query create ediniz. ->
select * from personel where maas in(70000,'javva Nur');  -- ....****farkli kolonlarda in kullanmiyoruz********************
select * from personel where maas=70000 or isim='javva Nur';
-- Ahan da Trick-> 'in' için sabit bir column ama 'or' için birden farkli colum sorgulanabilir. 
-- 'in' oldugu zaman farkli colonlardan cagirma islemi yapilamaz. sadece ayni colondan cagirma islemi yapilabilinir

/*********************************
              SELECT - LIKE
**********************************/ 
/*
SELECT - LIKE
LIKE: Sorgulama yaparken belirli patternleri kullanabilmesini  sağlar

Syntax –> SELECT sutun1, sutun2, ...FROM tablo_adı WHERE sutünN LIKE pattern

PATTERN İÇİN
% -> 0 veya daha fazla karakteri belirtir.
_ -> Tek bir karakteri belirtir.  _ : karakter sayısı kadar kullanılır.
*/

-- Task07 -> İsmi J harfi ile başlayan personeli listeleyen query create ediniz.
select * from personel where isim like 'J%';
-- Task07.5 -> İsmi J harfi ile başlayan 8 harfli personeli listeleyen query create ediniz.
select * from personel where isim like 'j_______'; 
-- % kendisinden sonra varchar da belirtilen sinira kadar karakter anlamina gelir

-- Task08 -> İsmi N harfi ile biten personeli listeleyen query create ediniz.
select * from personel where isim like '%n';

-- Task09 -> İsminin 2. harfi a olup diğer harflerinde u olan personel listeleyen query create ediniz.
select * from personel where isim like '_a%u%';

-- Task10-> ismi 1. harfi j ve 7. harfi A olan personeli listeleyen query create ediniz.
select * from personel where isim like 'J_____a%';

-- Task11 -> İsminde A harfi olmayan personeli listeleyen query create ediniz.
select * from personel where isim like '%a%';     -- *****icinde a bulunan isimleri getir****
select * from personel where isim not like '%a%'; -- *****icinde a bulunmayan isimleri getir****



























































































