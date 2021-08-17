-- Author: Abhay Jindal

SELECT IF(grade<8, NULL, name), grade, marks
FROM students JOIN grades
WHERE marks BETWEEN min_marks AND max_marks
ORDER BY grade DESC, name;
