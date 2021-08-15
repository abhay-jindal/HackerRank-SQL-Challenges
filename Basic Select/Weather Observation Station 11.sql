-- Author: Abhay Jindal

-- The symbol | is basically the "OR" condition
SELECT DISTINCT city 
FROM station
WHERE city REGEXP '^[^aeiou]|[^aeiou]$';