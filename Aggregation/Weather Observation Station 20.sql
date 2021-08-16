-- Author: Abhay Jindal

Select round(S.lat_n, 4)
FROM station S 
WHERE 
    (SELECT COUNT(lat_n) FROM station WHERE lat_n < S.lat_n ) = 
    (SELECT COUNT(lat_n) FROM station WHERE lat_n > S.lat_n)
