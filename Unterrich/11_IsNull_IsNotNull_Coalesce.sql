/*===================== IS NULL, IS NOT NULL, COALESCE ========================
    IS NULL, ve IS NOT NULL, BOOLEAN operatörleridir. Bir ifadenin NULL olup 
    olmadığını kontrol ederler.  
    COALESCE ise bir fonksiyondur ve içerisindeki parameterelerden NULL olmayan
    ilk ifadeyi döndürür. Eğer aldığı tüm ifadeler NULL ise NULL döndürürür.
    syntax->     sutun_adi = COALESCE(column,value)
    ==============================================================================*/
    
        CREATE TABLE insanlar 
    (
        ssn CHAR(9), -- Social Security Number
        isim VARCHAR(50), 
        adres VARCHAR(50) 
    );

    INSERT INTO insanlar VALUES('123456789', 'Ali Can', 'Istanbul');
    INSERT INTO insanlar VALUES('234567890', 'Veli Cem', 'Ankara');
    INSERT INTO insanlar VALUES('345678901', 'Mine Bulut', 'Izmir');
    -- INSERT INTO insanlar  VALUES('456789012', 'Bursa');
	INSERT INTO insanlar VALUES('', 'Çin Li', 'Fizan');
    INSERT INTO insanlar (ssn, adres) VALUES('456789012', 'Bursa');
    INSERT INTO insanlar (ssn, adres) VALUES('567890123', 'Denizli');
    INSERT INTO insanlar (adres) VALUES('Sakarya');
    INSERT INTO insanlar (ssn) VALUES('999111222');
    select * from insanlar;
    
/*----------------------------------------------------------------------------
    -- task01-> isimi null olanlari listeleyen query create ediniz...
  ----------------------------------------------------------------------------*/
select * from insanlar
where isim is null;
select * from insanlar where isim=null;-- null bir data olmadigi icin = ile sorgu yaparsak sonuc bos gelir    
    
/*---------------------------------------------------------------------------- 
-- task02-> isim null olmayanlari listeleyen query create ediniz...
----------------------------------------------------------------------------*/  
select * from insanlar
where isim is not null;  
    
/* ----------------------------------------------------------------------------
-- task03-> isim 'i NULL olan kişilerin isim'ine NO NAME atayınız. 
-------------------------------------------------------------------------- */ 
update insanlar set isim='NO NAME' where isim is null;
-- taskcik -> insanlar table  task03 öncesine update ediniz.
update insanlar set isim=null where isim='NO NAME';
-- set isim is null --> is null boolean return ettiği için set komutuna kullanilamzzz

select * from insanlar; 
   
   
   /* ----------------------------------------------------------------------------
 task04->    isim 'i NULL olanlara 'Henuz isim girilmedi'
            adres 'i NULL olanlara 'Henuz adres girilmedi'
            ssn 'i NULL olanlara ' no ssn' atayiniz..
            çoklu değişimde ve  WHERE isim IS NULL or adres is null....; 
            gibi ifade yazmamak için. coalesce=birleşmek
-----------------------------------------------------------------------------*/

update insanlar
set isim= coalesce(isim,'Henuz isim girilmedi'),
	adres= coalesce(adres,'Henuz adres girilmedi'),
	ssn= coalesce(ssn,'No SNN');
select * from insanlar;

update insanlar 
set isim='Henuz isim girilmedi', adres='Henuz adres girilmedi',ssn='No SNN' 
where isim is null or adres is null or ssn is null; 
select * from insanlar;
-- _________________________________
-- task ssn si bos olan tabloya 4586932 degerini atayiniz
update insanlar set ssn='4586932' where ssn = '';
select * from insanlar;

-- adresi null olan degerlere "Mugla" atayiniz 
update insanlar
set adres= 'Mugla' where adres is null;


 
