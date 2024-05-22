create  table talebeler(
id char(3) primary key,
isim varchar(50),
veli_isim varchar(50),
yazili_notu int
);
insert into talebeler values(123,'Haluk Bilgin','Hasan',99);
insert into talebeler values(124,'Harun Bil','Ahmet',91);
insert into talebeler values(125,'Halime Bak','Ipek',77);
insert into talebeler values(126,'Hasan  Hasmayan','Mehmet',83);
insert into talebeler values(127,'Hanimiş Beee','Merve',63);
select * from talebeler;

CREATE TABLE personel
(
id int primary key, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);

INSERT INTO personel VALUES(123456789, 'Haluk Bilgin', 'Istanbul', 50000, 'IBM');
INSERT INTO personel VALUES(234567890, 'Ipek Bilir', 'Istanbul', 25000, 'Google');
INSERT INTO personel VALUES(345678901, 'Harun Bilmiş', 'Ankara', 13000, 'IBM');
INSERT INTO personel VALUES(456789012, 'Harun Bilmiş', 'Izmir', 10000, 'Microsoft');
INSERT INTO personel VALUES(567890123, 'Harun Bilmiş', 'Ankara', 17000, 'Amazon');
INSERT INTO personel VALUES(456789013, 'Ipek Bilir', 'Ankara', 15000, 'Microsoft');
INSERT INTO personel VALUES(123456710, 'Halime Bak', 'Bursa', 25000, 'IBM');
select * from personel;


CREATE TABLE calisanlar
(
id CHAR(5),
isim VARCHAR(50),
maas int,
CONSTRAINT calisanlar_id_pk PRIMARY KEY (id)
);
INSERT INTO calisanlar VALUES('1001', 'Haluk Bilgin', 70000); 
INSERT INTO calisanlar VALUES('1002', 'Ipek Bilir' ,63000);
INSERT INTO calisanlar VALUES('1003', 'Hasan Hasmayan ', 45000);
INSERT INTO calisanlar VALUES('1004', 'Halime Baak', 15000);
select * from calisanlar;











