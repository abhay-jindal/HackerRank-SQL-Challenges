-- Author: Abhay Jindal

SELECT W.id, WP.age, W.coins_needed, W.power 
FROM wands W JOIN wands_property WP 
ON W.code = WP.code 
WHERE WP.is_evil = 0 AND W.coins_needed = (SELECT Min(W1.coins_needed) 
                                            FROM wands W1 JOIN wands_property WP1 
                                            ON W1.code = WP1.code 
                                            WHERE WP.age = WP1.age AND W.power = W1.power) 
ORDER BY W.power DESC, WP.age DESC; 