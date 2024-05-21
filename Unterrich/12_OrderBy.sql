/*================================ ORDER BY  ===================================
   ORDER BY komutu bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
      ORDER BY sutun_adi ASC   -- ARTAN  --> Naturel Ording Default
      ORDER BY sutun_adi DESC  -- AZALAN
==============================================================================*/
CREATE TABLE kisiler 
    (   id int PRIMARY KEY,
        ssn CHAR(9) ,
        isim VARCHAR(50), 
        soyisim VARCHAR(50), 
        maas int,
        adres VARCHAR(50) 
    );
    
    INSERT INTO kisiler VALUES(1,123456789, 'Haluk','Bilgin', 50000,'Istanbul');
    INSERT INTO kisiler VALUES(2,234567890, 'Haluk','Bilir', 40000,'Ankara');
    INSERT INTO kisiler VALUES(3,345678901, 'Haluk','Bil',33000,'Izmir');
    INSERT INTO kisiler VALUES(4,256789012, 'Hasan','Hasmayan',21000,'Adana');
    INSERT INTO kisiler VALUES(5,344678901, 'Halime','Baak', 15000,'Ankara');
    INSERT INTO kisiler VALUES(6,345458901, 'Hanimiş ','Bee',7000,'Istanbul');
    INSERT INTO kisiler VALUES(7,123456711, 'Çin','Li', 23000,'Fizan');
    INSERT INTO kisiler VALUES(8,234567812, 'Kim','TutarSeni',42000,'Gonya');
    INSERT INTO kisiler VALUES(9,345678913, 'Gemi','TutarBeni',38000,'Gayseri');
    INSERT INTO kisiler VALUES(10,256789231, 'Tatar','Irmizan',20000,'Denizli');
    INSERT INTO kisiler VALUES(11,344678134, 'Durmuş','Mu', 17000,'Muş');
    INSERT INTO kisiler VALUES(12,345458752, 'Sultan ','Sülüman',18000,'Cangiri');
  select * from kisiler;
  
  /* ----------------------------------------------------------------------------
  task01-> kisiler tablosunu adres'e göre sıralayarak listeleyen query create ediniz...
 -----------------------------------------------------------------------------*/
 select * from kisiler order by adres asc;  -- asc yazmasak da default olarak natural order siralama yapar-- kücükten büyüge dogru siralama
 select * from kisiler order by adres desc;
 /* ----------------------------------------------------------------------------
   task02-> kisiler tablosunu maas a göre ters sıralayarak listeleyen query create ediniz...
 -----------------------------------------------------------------------------*/ 
 select * from kisiler order by maas desc; -- büyükten kücüge dogru siralama 
 select * from kisiler order by maas asc;  -- kücükten büyüge dogru siralama
 
 /* ----------------------------------------------------------------------------
   task03-> ismi Haluk olanları, ssn a göre AZALAN sırada listeleyen query create ediniz...
-----------------------------------------------------------------------------*/
select * from kisiler where isim='haluk' order by ssn desc ;

/* ----------------------------------------------------------------------------
  task04-> adres ankara olanları maas sıralı olarak listeleyen query create ediniz...
-----------------------------------------------------------------------------*/ 
select * from kisiler where adres='ankara' order by maas asc ;
select * from kisiler order by 4; -- tablodaki sutun sirasini yazarak da siralama yapabiliriz

-- _____________________________
-- task05-> kisiler tablosunda soyisme göre siralayiniz
select * from kisiler order by soyisim ;

-- task06-> kisiler tablosunda soyismleri maasa göre siralayiniz
select soyisim, maas from kisiler order by maas desc;

-- task 07 -> kisiler tablosunda ismi H ile başlayanları sıralayınız
select isim from kisiler where isim like 'H%' order by isim; 





