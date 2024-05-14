-- Find the title of each film
select Title from movies; 
-- Find the director of each film
select Director from movies; 
-- Find the title and director of each film
select Title,Director from movies; 
-- Find the title and year of each film
select Title, year from movies;
-- Find all the information about each film
select * from movies; 
/*
Operator    Condition   SQL Example
=, !=, < <=, >, >=  Standard numerical operators    col_name != 4
BETWEEN … AND … 
Number is within range of two values (inclusive)    col_name BETWEEN 1.5 AND 10.5
NOT BETWEEN … AND … 
Number is not within range of two values (inclusive)    col_name NOT BETWEEN 1 AND 10
IN (…)    
Number exists in a list col_name IN (2, 4, 6)
NOT IN (…)    
Number does not exist in a list col_name NOT IN (1, 3, 5)*/
-- Find the movie with a row id of 6
select * from movies where id=6;
-- Find the movies title and id with a row id of bigger than 6
select title,id from movies where id>=6;
-- Find the movies title and id with a row id of bigger than 6 and title start with T
select title,id from movies where id>=6 and title like 't%';

-- Find the movies released in the years between 2000 and 2010
select * from movies where Year between 2000 and 2010;  -- between baslangic ve bitis degerlerini kapsar
-- Find the movies released in the years between 2000 and 2010 and director Will be John Lasseter
select * from movies where Year between 2000 and 2010 and  director like 'John%';
select * from movies where Year between 2000 and 2010 and  director between 'A' and 'D';

-- Find the movies not released in the years between 2000 and 2010
select * from movies where Year not between 2000 and 2010;

-- Find the first 5 Pixar movies and their release year
select Title,Year from movies where id between 1 and 5;
select Title,Year from movies where id<6;

-- Find the movie titles in the years 1998,2001,2003
select title from movies where Year in (1998,2001,2003);

-- Find the movie titles out of the years 1998,2001,2003 and released id 4,8,6 
select * from movies where Year not in (1998,2001,2003) and id in(4,8,6);

-- Find all the Toy Story movies
select * from movies where title like 'Toy Story%';

-- Find all the movies directed by John Lasseter
select * from movies where Director like 'John La%';

-- Find all the movies not directed by John Lasseter
select * from movies where Director not like 'John La%';

-- Find all the WALL-* movies
select * from movies where title like '%WALL%';

-- Find id bigger than 6 and title include 'E' and length more than 100
select * from movies 
where id>6 and title like '%e%' and time >100;

-- Find director name length is 9 or title length >9
select * from movies where length(director)=9 or length(title)<9;















