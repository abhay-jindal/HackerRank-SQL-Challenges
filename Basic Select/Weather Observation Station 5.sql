-- Author: Abhay Jindal

SELECT * 
FROM (SELECT city, LENGTH(city) FROM station ORDER BY LENGTH(city), city)
WHERE ROWNUM=1
UNION
SELECT *
FROM (SELECT city, LENGTH(city) FROM station ORDER BY LENGTH(city) DESC, city)
WHERE ROWNUM=1;