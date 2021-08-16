-- Author: Abhay Jindal

SELECT (salary*months) as earnings, COUNT(*) 
FROM employee 
GROUP BY 1 
ORDER BY earnings DESC 
LIMIT 1;