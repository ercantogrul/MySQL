drop database codechallenge;
create database codechallenge;
use codechallenge;
CREATE TABLE calisanlar
(
id CHAR(4),
isim VARCHAR(50),
maas int(5),
CONSTRAINT id_pk PRIMARY KEY (id)
);
INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000); 
INSERT INTO calisanlar VALUES('1002', 'Mehmet Yılmaz' ,12000);
INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);
CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int(5),
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
);
INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500); 
INSERT INTO aileler VALUES('1003', 1, 2200);
INSERT INTO aileler VALUES('1004', 3, 2400);
select * from calisanlar;
select * from aileler;

-- Task01 -> Veli Han'ın maaşına %20 zam yapınız.
update calisanlar set maas=maas*1.2 where isim='Veli Han';

-- Task02 -> Maaşı ortalamanın altında olanlara %20 zam yapınız.
update calisanlar set maas=maas*1.2 where maas < (select avg(maas));

-- Task03 -> calisanların isim ve cocuk_sayisi'ni listeyen sorguyu yazınız.
select isim , (select cocuk_sayisi from aileler where calisanlar.id=aileler.id  )as cocuksayisi from calisanlar;

-- Task04 -> calisanlar' ın  isim ve toplam_gelir'lerini gösteren bir sorgu yazınız.
-- toplam_gelir = calisanlar.maas + aileler.ek_gelir
select isim , maas+(select ek_gelir from aileler where calisanlar.id=aileler.id  ) as top_gelir from calisanlar;

select isim, (calisanlar.maas+aileler.ek_gelir) as toplam_gelir
from calisanlar
left join aileler
on calisanlar.id = aileler.id;

 SELECT id, isim,
		(SELECT sum(maas+ek_gelir) FROM aileler WHERE calisanlar.id=aileler.id) as toplam_gelir
 FROM calisanlar;

-- Task05 -> eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın  maaşına ek %10 aile yardım zammı yapınız. 
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
update calisanlar set maas= maas*1.1 
where maas+(select ek_gelir from aileler where calisanlar.id=aileler.id)/((select cocuk_sayisi from aileler where calisanlar.id=aileler.id)+2)<2000;

UPDATE  calisanlar
SET maas=maas*1.1
WHERE ( SELECT (maas+ek_gelir)/(cocuk_sayisi+2)   as kisiBasi_gelir FROM aileler WHERE calisanlar.id=aileler.id )<2000;

UPDATE calisanlar 
JOIN aileler  
ON calisanlar.id = aileler.id
SET calisanlar.maas = calisanlar.maas * 1.1
WHERE (calisanlar.maas + aileler.ek_gelir) / (aileler.cocuk_sayisi + 2) < 2000;


select * from calisanlar;
select * from aileler;

-- ______________________________________________________________________________

drop table ogrenci;
drop table bolum;
drop table ders;

create table ogrenci(
    ogrenci_id   int auto_increment PRIMARY KEY,
    ogrenci_isim        varchar(30) not null,
    ogrenci_soyisim   varchar(30) not null,
    ogrenci_eMail    varchar(50) DEFAULT'',
    ogrenci_telefon    varchar(10) DEFAULT'',
    bolum_id   int not null ,
    FOREIGN KEY (bolum_id) REFERENCES bolum(bolum_id)  -- Foreign key constraint
    );

create table bolum(
   bolum_id   int PRIMARY KEY auto_increment ,
   bolum_isim   varchar(50) 
    
);

create table ders(
    ders_id   int PRIMARY KEY,
    ders_isim   VARCHAR(50),
    ders_saat int
);


-- 

INSERT INTO ogrenci(ogrenci_isim, ogrenci_soyisim, ogrenci_eMail, bolum_id)
VALUES
  ('Ahmet', 'Yildiz', 'ahmet.yildiz@example.com', 1),
  ('Ayse', 'Can', 'ayse.can@example.com', 2),
  ('Burak', 'Deniz', 'burak.deniz@example.com', 3),
  ('Cansu', 'Ozcan', 'cansu.ozcan@example.com', 1),
  ('Deniz', 'Coskun', 'deniz.coskun@example.com', 2),
  ('Elif', 'Yilmaz', 'elif.yilmaz@example.com', 3),
  ('Fatih', 'Arslan', 'fatih.arslan@example.com', 1),
  ('Gul', 'Cam', 'gul.cam@example.com', 2),
  ('Hasan', 'Dogan', 'hasan.dogan@example.com', 3),
  ('Irem', 'Kurt', 'irem.kurt@example.com', 1);
  
INSERT INTO bolum(bolum_isim)
VALUES
  ('Bilgisayar Mühendisliği'),
  ('Elektrik Mühendisliği'),
  ('Makine Mühendisliği'),
  ('Ekonomi'),
  ('İşletme'),
  ('Matematik'),
  ('Fizik'),
  ('Kimya'),
  ('Biyoloji'),
  ('Tarih');

INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (2,'müzik', '1');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (1,'matematik', '3');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (3,'fizik', '2');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (4,'kimya', '2');
INSERT INTO ders(ders_id,ders_isim, ders_saat) VALUES (5,'geometri', '3');
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (6,'biyoloji', '5'); 
INSERT INTO ders (ders_id,ders_isim, ders_saat) VALUES (7,'sanat', '4'); 

 SELECT * from  ders;
 select * from ogrenci;
 select * from bolum;
 
-- Task01->  öğrencilerin bölümlerini listeleyiniz.
select ogrenci.*, bolum.bolum_isim 
from ogrenci
left join bolum
on ogrenci.bolum_id=bolum.bolum_id;

-- Task02->  hangi bölümden kaç ders kaydi olduğunu bulunuz.

select bolum.bolum_isim, count(ogrenci.bolum_id)
from bolum
left join ogrenci
on ogrenci.bolum_id=bolum.bolum_id
group by bolum.bolum_isim;

-- Task03->  Ogrenci tablosuna ders_id adında bir sutun ekleyiniz ve bu sutun ders tablosundaki id için foreign key olsun
alter table ogrenci add column ders_id int,
add constraint fk_ders foreign key (ders_id) references ders(ders_id);

-- Task04->  Ogrenci tablosundaki telefon sutununu siliniz
alter table ogrenci
drop ogrenci_telefon;

-- Task05->  Ogrenci tablosundaki ogrenci_emaili sutun adını sadece mail olarak değiştiriniz
alter table ogrenci
rename column ogrenci_eMail to mail;

-- Task06->  ogrenci tablosundaki ders_id değerlerine 1'den /'ye kadar rastgele bir değer atayınız
update ogrenci
set ders_id = (select floor(rand() *7) + 1)
where ders_id is null;

-- Task07->  herhangi bir derse kayitli olmayan öğrenci listesini yazdiriniz






-- Task08->  hangi derse kac öğrencinin  kayit yaptirdiğini ve bu ögrencilerin isimlerini yazdiriniz.
select ders_isim, count(ogrenci_isim) as kayitli_ogrenci_sayisi, group_concat(ogrenci_isim separator ' , ')
from ders
left join ogrenci
on ogrenci.ders_id=ders.ders_id
group by ders.ders_isim;

-- Task08.5->  ogrencilerin kayit yaptirdiklari derslerin isimlerine göre kac ögrencinin kayit yaptirdigini ve ögrencilerin isimlerini yaziniz 
select ders_isim, count(ogrenci_isim) as kayitli_ogrenci_sayisi, group_concat(ogrenci_isim separator ' , ')
from ogrenci
left join ders
on ogrenci.ders_id=ders.ders_id
group by ders.ders_isim;


-- Task09->  her bölümün kayitli olan toplam ders saatini bulunuz.
select bolum_isim, sum(ders_saat) as toplam_ders_saati
from ogrenci
left join bolum on ogrenci.bolum_id=bolum.bolum_id
left join ders on ogrenci.ders_id=ders.ders_id
group by bolum_isim;

-- baska yol
select bolum_isim, sum(ders_saat) as toplam_ders_saati, group_concat(ders_isim separator ' , ') as dersler, group_concat(ders_saat separator ' , '), group_concat(ogrenci_isim separator ' , ')
from ogrenci
right join bolum on ogrenci.bolum_id=bolum.bolum_id
right join ders on ogrenci.ders_id=ders.ders_id
group by bolum_isim;

-- Task010->  en yüksek ders saatine sahip bölümü bulunuz.
select bolum_isim, sum(ders_saat) as toplam_ders_saati
from ogrenci
left join ders on ders.ders_id=ogrenci.ders_id
left join bolum on ogrenci.bolum_id = bolum.bolum_id
group by bolum_isim
order by toplam_ders_saati desc
limit 1;

--  Task11->  matematik ve kimya dersini alan ogrenci isim ve soy isimlerini birleştirerek yazdırın
select ders_isim, concat(ogrenci_isim,' ',ogrenci_soyisim) as ogrenciler 
from ogrenci
left join ders 
on ders.ders_id=ogrenci.ders_id
where ders_isim= 'matematik' or ders_isim='kimya'
order by ders_isim;

 SELECT * from  ders;
 select * from ogrenci;
 select * from bolum;