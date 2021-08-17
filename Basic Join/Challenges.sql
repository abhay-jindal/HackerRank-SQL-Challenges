-- Author: Abhay Jindal

-- Use HAVING instead of WHERE since we have to filter on groups
-- Split the total number of counts into 2 pieces
-- First piece will be the largest number 
-- Second piece will be the number which doesn't repeat (Unique) or is available once

SELECT H.hacker_id, H.name, COUNT(C.challenge_id) AS total_count
FROM Hackers H join Challenges C
ON H.hacker_id = C.hacker_id
GROUP BY H.hacker_id, H.name
HAVING 
    total_count = (
                SELECT COUNT(temp1.challenge_id) AS max_count
                FROM challenges AS temp1
                GROUP BY temp1.hacker_id
                ORDER BY max_count DESC
                LIMIT 1
              )
    OR total_count in
                (SELECT DISTINCT other_counts FROM (
                                            SELECT H2.hacker_id, H2.name, COUNT(C2.challenge_id) as other_counts
                                            FROM Hackers H2 JOIN Challenges C2
                                            ON H2.hacker_id = C2.hacker_id
                                            GROUP BY H2.hacker_id, H2.name
                                            ) AS temp2
                GROUP BY other_counts
                HAVING COUNT(other_counts) =1
                )
ORDER BY total_count DESC, H.hacker_id