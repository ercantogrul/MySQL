SELECT * FROM books.movies;
INSERT INTO movies (Id, title, director, year, Length_minutes)
VALUES
(16, 'Inside Out', 'Pete Docter ve Ronnie del Carmen', 2015, 120),
(21, 'The Good Dinosaur', 'Peter Sohn', 2015, 105),
(22, 'Finding Dory', 'Andrew Stanton ve Angus MacLane', 2016, 150),
(23, 'Coco', 'Lee Unkrich ve Adrian Molina', 2017, 110),
(24, 'The Incredibles 2', 'Brad Bird', 2018, 135),
(25, 'Toy Story 4', 'Josh Cooley', 2019, 125),
(26, 'Onward', 'Dan Scanlon', 2020, 95),
(27, 'Soul', 'Pete Docter ve Kemp Powers', 2020, 140),
(28, 'Luca', 'Enrico Casarosa', 2021, 112),
(29, 'Turning Red', 'Domee Shi', 2022, 108),
(30, 'Lightyear', 'Angus MacLane', 2022, 170);
select * from movies;
-- task1 Filmim yönetmenlerini tekrar etmeden listeliyiniz
select distinct director from movies;

-- task2 En son yayınlan 4 filmi listeleyin
select * from movies order by year desc limit 4;

-- task3 Filmleri director larına göre , toplam film sürelerini  sıralayınız
select director, sum(Length_minutes) as toplam_film_suresi
from movies
group by director;

select distinct(director),  sum(Length_minutes) as toplam_film_suresi
from movies
group by director;

-- task4 filmlerin directorlerine göre max ve min film surelerini sıralyınız
select distinct(director), max(Length_minutes) as max_film_süresi, min(Length_minutes) as min_film_süresi
from movies
group by director;

-- task5 hangi yılda kaç adet film olduğunu listeleyiniz
select distinct year, count(title) as film_sayisi
from movies
group by year;

-- task film isimlerini yıllara göre gruplayarak yeniden eskiye sıralyınız
SELECT year, GROUP_CONCAT(title SEPARATOR ',- ') AS filmler
FROM movies
GROUP BY year
ORDER BY year DESC;

-- task yillara göre hangi yönetmenlerin film yönettigini siralayiniz
SELECT year, GROUP_CONCAT(Director SEPARATOR ',- ') AS directors
FROM movies
GROUP BY year
ORDER BY year DESC;

-- task yönetmenlerine göre cekilen filimleri siralayiniz
select director, group_concat(title  separator' - ') as movies 
from movies
group by director
order by director desc;

-- task06 -> 2000 yılından önceki filmleri ve director u 'John Lasseter' olan  filmleri sıralayınız

select title year from movies
where year<2000
union 
select Director from movies
where Director='John Lasseter';

select * from movies;
-- task 2005 öncesi filmlerin adı ile 2005 sonrası directorların adlarını  yillara göre yazdırın
select distinct year, group_concat(title separator' , '), group_concat(director separator' , ') 
from movies
where year<2005
group by year
union
select distinct year, group_concat(director separator' , '),group_concat(title separator' , ')  
from movies
where year>2005
group by year;

























