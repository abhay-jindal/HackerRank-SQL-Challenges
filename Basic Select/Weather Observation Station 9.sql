-- Author: Abhay Jindal

SELECT DISTINCT city 
FROM station 
WHERE city NOT REGEXP '^[aeiou].*'; 

/*	Putting a ^ inside the closed bracket means something completely 
	different than putting it outside the brackets. Putting it inside 
	the brackets makes it match all characters EXCEPT the ones inside 
	the bracket. So instead of writing [bcdfghjklmnpqrstvwxyz], we can write [^aeiou]
*/
SELECT DISTINCT city 
FROM station
WHERE city REGEXP '^[^aeiou]';