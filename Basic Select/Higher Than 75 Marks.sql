﻿-- Author: Abhay Jindal

SELECT name 
FROM students
WHERE marks>75
ORDER BY SUBSTRING(name, -3), id;
