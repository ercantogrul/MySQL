drop table personel;
create table personel (
musteri_no int,
ad VARCHAR(22),
soyad VARCHAR(25),
sehir varchar(45),
cinsiyet varchar(15),
puan int
);
INSERT INTO personel VALUES(111,'Haluk', 'Bilgin','Istanbul','errrkek',63);
INSERT INTO personel VALUES(222,'Ipek', 'bilir','Istanbul','kadin',99);
INSERT INTO personel VALUES(333,'Harun','Bilmiş','Izmir','errrkek',43);
INSERT INTO personel VALUES(444, 'Çin','Li','Fizan','errrkek',11);
INSERT INTO personel VALUES(555, 'Tatarrr','IrmIzan','Alcadraz','errrkek',41);

select * from personel;
-- ****************************************  concat ********************************************************

 -- SYNTAX-> concat('character', column,...);
--  column record'larini girilen value ile birleştirip yeni bir column'da return eder... 

-- task01-> ad ve soyadi record'larini 'Adiniz Soyadiniz : Haluk Bilgin ' şeklnde listeleyen query create ediniz...
select musteri_no, concat('Adiniz Soyadiniz : ',ad,' ',soyad) as ad_soyad, sehir, cinsiyet,puan from personel;
select musteri_no, concat(ad,' ',soyad) as ad_soyad, sehir, cinsiyet,puan from personel;
select concat(ad,' ',soyad) as ad_soyad from personel;
-- _________________________________________________________________
-- task film isimlerini yıllara göre gruplayarak yeniden eskiye sıralyınız
SELECT year, GROUP_CONCAT(title SEPARATOR ',- ') AS filmler
FROM movies
GROUP BY year
ORDER BY year DESC;


-- ****************************************  length-left-right ********************************************************
-- SYNTAX-> length(column,);
-- column daki record'larin karakter sayisini(uzunluk) yeni bir column'da return eder.
-- task02-> ad ve soyad record'larinin  karakter sayisini listeleyen query create ediniz...

select ad,length(ad) as ad_uzunluk, soyad,length(soyad) as soyad_uzunluk from personel;

-- ****************************************  left-right ********************************************************
-- SYNTAX-> left-right(column,karakter_sayisi);
-- column daki record'larin sol-sağDan girilen karakter sayisine göre parcasini yeni bir column'da return eder.
-- task03-> ad ve soyad record'larinin  ilk karakterini  listeleyen query create ediniz...
select ad,left(ad,1), soyad,left(soyad,1) from personel;

-- task04-> ad ve soyad record'larinin  ilk harflerini A.B şeklinde   listeleyen query create ediniz...
select ad,left(ad,1), soyad,left(soyad,1), concat( left(ad,1),'.',left(soyad,1)) as ad_soyad from personel;

select ad,soyad, concat(left(ad,1),'.' ,left(soyad,1) ) as birlesim from personel;

-- task05-> ad ve soyad 4 den buyuk harfli record'larinin 1.3 ve 5. harflerini(MORIS -> MRS) listeleyen query create ediniz...
select  concat(left(ad,1),right(left(ad,3),1),right(left(ad,5),1)) 
from personel
where length(ad)>4;

-- task05-> ad uzunlugu 4 den buyuk harfli record'larinin 1.3 ve 5. harflerini(MORIS -> MRS) listeleyen query create ediniz...
select ad, concat(left(ad,1),right(left(ad,3),1),right(left(ad,5),1)) 
from personel
where length(ad)>4;

-- ****************************************  substring ********************************************************
-- SYNTAX-> substr(column,);
-- column daki record'larin girilen değere göre bir paracasini yeni bir column'da return eder.

-- task05.1-> ad'in 3. karakterden sonrasini record eden query yaziniz
select ad, right(ad,3) as son_uc from personel;
select ad, substring(ad,3) as ucuncu_karakterden_sonra from personel;

-- task05.2-> ad'in ilk 3 harflerini record eden query yaziniz
select ad, left(ad,3) from personel;
select ad, substring(ad,1,3) as ilk_üc_karakter from personel;


-- task05.2-> ad'in ilk 2 karakterini atlayip 2 karakterini record eden query yaziniz
 select ad, substring(ad,3,2) as iki_karkter from personel;


-- ****************************************** replace  ******************************************************
-- SYNTAX-> replaca(column,old_value,new_value);
-- column daki record'larin old_value,new_value olarak atayarak yeni bir column'da return eder.

-- task06-> ad ve soyad  record'larinin e harfini * ile değiştirip listeleyen query create ediniz...
select ad, replace(ad,'i','*'), soyad, replace(soyad,'i','*') as yildizli_soyad from personel;
select ad, replace(ad,'Haluk','*'), soyad, replace(soyad,'i','*') as yildizli_soyad from personel; -- replace methodu kücük-büyük harf duyarliligi var

-- task07-> ad ve soyad  record'larinin son 3 harfi *** ile değiştirip listeleyen query create ediniz
select ad, replace(ad,right(ad,3),'***') as yildizli_ad, soyad, replace(soyad,right(soyad,3),'***') as yildizli_soyad 
from personel;

-- ******************************************  repeat  *******************************************************************
-- SYNTAX-> repeat('yeni character',character_sayısi)
-- column daki record'lari girilen karakteri istenen sayi kadar  yeni bir column'da return eder.
 
-- task08-> ad ve soyad  record'larinin ilk harfleri hariç tum harflerini * ile değiştirip listeleyen query create ediniz...
select ad, concat(left(ad,1), repeat('*',length(ad)-1)) as yildizli_ad, 
soyad ,concat(left(ad,1),repeat('*',length(ad)-1)) as yildizli_soyad
from personel;

select ad, concat(substring(ad,1,1), repeat('*',length(ad)-1)) as yildizli_ad,
soyad ,concat(substring(ad,1,1),repeat('*',length(ad)-1)) as yildizli_soyad
from personel;

-- ******************************************  lower - upper  *************************************************************************
-- SYNTAX-> lower/upper(column);
-- column daki record'lari BUYUK-KUCUK harf ile yeni bir column'da return eder.

-- task09-> Personel tablosundan ad'lari kucuk soyad'lari buyuk olarak record eden query yaziniz
select lower(ad), upper(soyad) from personel;


select ad, concat(lower(substring(ad,1,1)),upper(substring(ad,2))) from personel;



































