-- Author: Abhay Jindal

SELECT CONCAT(name, '(', SUBSTR(occupation, 1,1) , ')')
FROM occupations
ORDER BY name;

SELECT CONCAT('There are a total of ', COUNT(1), ' ', occupation, 's.')
FROM occupations
GROUP BY occupation
ORDER BY COUNT(1), occupation;
