/*============================= GROUP BY =====================================
    GROUP BY komutu bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak gruplamak için kullanılır. 
   
    GROUP BY komutu her grup başına bir satır return eder. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
==============================================================================*/
CREATE TABLE javaManav 
    (
        isim varchar(50), 
        urun_adi varchar(50), 
        urun_miktari int 
    );
	 
    
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Elma', 5);
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Elma', 15);
    INSERT INTO javaManav VALUES( 'Ipek', 'Armut', 3);
    INSERT INTO javaManav VALUES( 'Haluk', 'Elma', 2);
    INSERT INTO javaManav VALUES( 'Irecep', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'Irecep', 'Uzum', 23);
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Armut', 2);
    INSERT INTO javaManav VALUES( 'Halime', 'Elma', 3);
    INSERT INTO javaManav VALUES( 'IrmIzan', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'Irecep', 'Armut', 2);
    INSERT INTO javaManav VALUES( 'Irecep', 'Elma', 3);
    INSERT INTO javaManav VALUES( 'Haluk', 'Uzum', 4);
    INSERT INTO javaManav VALUES( 'MIstaaa', null, 2);
    SELECT * FROM javaManav;
    
    /* -----------------------------------------------------------------------------
  task01-> kisi ismine göre satılan toplam meyve miktarlarını listeleyen query create ediniz...
  yazınız.
------------------------------------------------------------------------------*/  
select isim, sum(urun_miktari) from javamanav group by isim;

/* ----------------------------------------------------------------------------
  task02-> satılan meyve türüne (urun_adi) göre urun alan kişi sayısını 
  listeleyen query create ediniz... NULL olarak girilen meyveyi listelemesin.
-----------------------------------------------------------------------------*/ 
select urun_adi, count(isim) as alici_sayisi from javamanav 
where urun_adi is not null
group by urun_adi;

/* ----------------------------------------------------------------------------
  task03-> satılan meyve türüne (urun_adi) için satılan (urun_miktari )MIN ve 
  MAX urun miktarlarini, MAX urun miktarina göre sıralayarak  listeleyen query create ediniz...
-----------------------------------------------------------------------------*/ 
select urun_adi, min(urun_miktari) as min_urun_satis, max(urun_miktari) as max_urun_satis 
from javamanav 
where urun_adi is not null
group by urun_adi
order by max_urun_satis;

/* ----------------------------------------------------------------------------
  task04->  kisi ismine ve urun adına göre satılan ürünlerin toplamını 
  gruplandıran ve isime göre ters sırasıda listeyen  listeleyen query create ediniz...
 -----------------------------------------------------------------------------*/ 
 select isim, urun_adi, sum(urun_miktari) as toplam_satis
 from javamanav
 where urun_adi is not null
 group by isim, urun_adi
 order by isim desc;
 
 /* ----------------------------------------------------------------------------
 task05-> kisi ismine ve urun adına göre (gruplayarak) satılan ürünlerin toplamını bulan ve
  ve bu toplam değeri 3 ve fazlası olan kayıtları toplam urun miktarlarina göre
  ters siralayarak  listeleyen query create ediniz...
 -----------------------------------------------------------------------------*/
  select isim, urun_adi, sum(urun_miktari) as toplam_satis
 from javamanav
 -- where toplam_satis>=3  -- önce gruplama yapip sonra sarti ele almasi gerektigi icin ve where group by dan sonra kullanilamayacagi icin having kullandik
 group by isim, urun_adi
 having toplam_satis>=3
 order by toplam_satis desc;
 
 /* ----------------------------------------------------------------------------
  task06->  satılan urun_adi'na göre (gruplayarak) MAX urun sayılarını sıralayarak listeleyen 
   listeleyen query create ediniz.... NOT: Sorgu, sadece MAKS urun_miktari MIN urun_miktarına 
  eşit olmayan kayıtları listelemelidir.
   
  siralama-> 
  Group By
  Having
  Order By
  
 -----------------------------------------------------------------------------*/
 select urun_adi, max(urun_miktari) as max_satis, min(urun_miktari) as min_satis
 from javamanav
 group by urun_adi
 having max_satis!= min(urun_miktari)
 -- having max_satis <> min(urun_miktari)
 order by max_satis;
 

 
 