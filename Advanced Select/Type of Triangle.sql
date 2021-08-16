-- Author: Abhay Jindal

SELECT (
	CASE 
		WHEN a+b<=c OR b+c<=a OR a+c<=b THEN 'NOT A Triangle'
		WHEN a=b AND b=c THEN 'Equilateral'
		WHEN a=b OR a=c OR b=c THEN 'Isosceles'
		ELSE 'Scalene'
    END)
FROM triangles;
