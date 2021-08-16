-- Author: Abhay Jindal

SELECT CEIL((AVG(salary)) - (AVG(REPLACE(salary, '0', '')))) AS avg_salary 
FROM employees;