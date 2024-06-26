-- UPDATE - SET
-- SYNTAX
-- UPDATE tablo_adı SET sutun1 = yeni_deger1, sutun2 = yeni_deger2,... WHERE koşul;

CREATE TABLE tedarikciler -- parent table
(
vergi_no int PRIMARY KEY,-- PK 
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO tedarikciler VALUES (101, 'IBM', 'Java CAN');
INSERT INTO tedarikciler VALUES (102, 'Clarus', 'Ebik Gabik');
INSERT INTO tedarikciler VALUES (103, 'Google', 'Java NAZ');
INSERT INTO tedarikciler VALUES (104, 'Apple', 'Java SU');
INSERT INTO tedarikciler VALUES (105, 'Micro Soft', 'Javva NUR');

select * from tedarikciler;
    
CREATE TABLE urunler -- child table
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim  VARCHAR(50),
CONSTRAINT urun_fk FOREIGN KEY(ted_vergino ) REFERENCES tedarikciler(vergi_no)
on delete cascade
);    
    
INSERT INTO urunler VALUES(101, 1001,'Laptop', 'Haluk Bilgin');
INSERT INTO urunler VALUES(102, 1002,'Phone', 'Ipek Bilir');
INSERT INTO urunler VALUES(102, 1003,'TV', 'Harun Bil');
INSERT INTO urunler VALUES(102, 1004,'Laptop', 'Hasan Bilmiş');
INSERT INTO urunler VALUES(103, 1005,'Phone', 'Halime Bak');
INSERT INTO urunler VALUES(104, 1006,'TV', 'Merve Bilmiş');
INSERT INTO urunler VALUES(104, 1007,'Phone', 'Aslan Gibi');
INSERT INTO urunler VALUES(106, 1007,'Tetris', 'Jet Lee'); -- parent table de olmayan Id child table'a eklemez
select * from urunler;
select * from tedarikciler, urunler where tedarikciler.vergi_no=urunler.ted_vergino;

-- task01-> vergi_no’su 102 olan tedarikcinin (firma) ismini 'Istanbul' olarak güncelleyeniz.
update tedarikciler set firma_ismi='Istanbul' where vergi_no=102;
--  task02-> Tedarikciler tablosundaki tüm firma isimlerini 'Ankara' olarak güncelleyeniz.
update tedarikciler set firma_ismi='Ankara';

-- task03-> vergi_no’su 101 olan tedarikcinin ismini 'Gamze' ve irtibat_ismi’ni 'Okan' olarak güncelleyiniz.
update tedarikciler set firma_ismi='Gamze', tedarikciler.irtibat_ismi='Okan' where vergi_no=101;

-- task04-> urunler tablosundaki urun_id değeri 1004'ten büyük olanların urun_id 1 arttrn.
update urunler set urunler.urun_id= urun_id+1 where urunler.urun_id>1004;

-- task05-> urunler tablosundaki 'Phone' değerlerini 'Telefon' olarak güncelleyiniz.
update urunler set urunler.urun_isim= 'Telefon' where urunler.urun_isim='Phone';

-- task06-> urunler tablosundaki tüm ürünlerin urun_id değerini ted_vergino sutun değerleri ile toplayarak güncelleyiniz.
update urunler set urunler.urun_id= urun_id+urunler.ted_vergino;

-- task07-> Laptop satin alan musterilerin ismini, tedarikciler toblosundaki firma_ismi Gamze’nin irtibat_isim'i ile degistirin.
update urunler 
set musteri_isim=(select irtibat_ismi from tedarikciler where firma_ismi='Gamze')
where urun_isim='Laptop';
select * from urunler;

select * from urunler;
select * from tedarikciler;

-- _________________________________
-- task 08-> irtibat ismi Java Su olan firma ismini Rize olarak  değiştiriniz
update tedarikciler
set irtibat_ismi='Rize'
where irtibat_ismi='Java Su';
-- task09-> urun ismi, ve urun ıd toplam değerini yazdırın
select urun_isim, sum(urun_id)  as id_toplam from urunler where urun_isim='Laptop' ;

-- task10-> Her tedarikçi müşterinin ismini, ted_verginosunu ve o ürüne ait urun_id'sini ve irtibat ismini listeyeniz (edited) 
select musteri_isim, ted_vergino, urun_id, 
(select irtibat_ismi from tedarikciler where ted_vergino=vergi_no) as irtibat_ismi 
from urunler ;

select musteri_isim, ted_vergino, urun_id,irtibat_ismi
from urunler ,tedarikciler
where ted_vergino=vergi_no;

-- task11-> Tedarikçi tablosunda vergi numarası en yüksek olan urun bilgilerini yazdırın
select min(vergi_no) as min_vergiNo from tedarikciler;
select max(vergi_no) as max_vergiNo from tedarikciler;
select * from tedarikciler where vergi_no=(select max(vergi_no) from tedarikciler);

-- task12->ted_verginosu 102 olan ürünlerin urun id numaralarının ortalamasını bulunuz
select round(avg(urunler.urun_id)) as urun_Id_ortalama from urunler where urunler.ted_vergino=102;






















