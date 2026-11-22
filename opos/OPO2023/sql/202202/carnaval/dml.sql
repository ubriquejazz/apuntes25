REM   Script: Carnaval DML
REM   Exercise for Data Managament

REM   Author: Juan GAGO

REM 

REM   a)  Who won in the category of “Cuarteto” (name of the group)?
    SELECT name FROM "Group" WHERE result = '1st' AND category = 'Cuarteto';

REM   b)  Who was the second  place in the category of “Chirigota”? (author)
    SELECT name FROM "Author" WHERE id = 
    (SELECT author_id FROM "Group" WHERE result = '2nd' AND category = 'Chirigota');

REM   c)  How many “Comparsas”, “Coros”, “Chirigotas” and “Cuartetos” were there?
    SELECT category, COUNT(*) FROM "Group" GROUP BY category;

REM   d) Where did the "Comparsa" winner come from? 
    SELECT city FROM "Author" WHERE id = 
    (SELECT author_id FROM "Group" WHERE result = '1st' AND category = 'Comparsa');

