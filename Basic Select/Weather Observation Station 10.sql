-- Author: Abhay Jindal

SELECT DISTINCT city 
FROM station
WHERE city REGEXP '.*[^aeiou]$';