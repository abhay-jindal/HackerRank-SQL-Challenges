-- Author: Abhay Jindal

SELECT DISTINCT City
FROM Station
WHERE city REGEXP '^[^AEIOU].*[^aeiou]$';