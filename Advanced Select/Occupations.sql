-- Author: Abhay Jindal


/* Step 1:
	Create a virtual table in your head of the data given to us. 
	It look like this https://imgur.com/u6DEcNQ
*/
SELECT
	CASE WHEN occupation='Doctor' THEN name END AS Doctor,
	CASE WHEN occupation='Professor' THEN Name END AS Professor,
    CASE WHEN occupation='Singer' THEN Name END AS Singer,
    CASE when occupation='Actor' THEN Name END AS Actor
FROM occupations;

/* Step 2:
	Create an index column with respect to occupation as "RowNumber".
	https://imgur.com/QzVCWFn Notice from the image, under professor column, 
	the first Name is indexed as 1, the next name "Birtney" as 2. 
	The below code will only give the "RowNumber" column, 
	to get the result like in image proceed to step 3.
*/
SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT 
	CASE
		WHEN occupation='Doctor' THEN (@r1:=@r1+1)
		WHEN occupation='Professor' THEN (@r2:=@r2+1)
		WHEN occupation='Singer' THEN (@r3:=@r3+1)
		WHEN occupation='Actor' THEN (@r4:=@r4+1)
	END
FROM occupations;

/* Step 3:
	Combine the result from step 1 and step 2
*/
SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT
	CASE
		WHEN occupation='Doctor' THEN (@r1:=@r1+1)
		WHEN occupation='Professor' THEN (@r2:=@r2+1)
		WHEN occupation='Singer' THEN (@r3:=@r3+1)
		WHEN occupation='Actor' THEN (@r4:=@r4+1)
	END AS RowNumber,
	CASE WHEN occupation='Doctor' THEN name END AS Doctor,
	CASE WHEN occupation='Professor' THEN Name END AS Professor,
    CASE WHEN occupation='Singer' THEN Name END AS Singer,
    CASE when occupation='Actor' THEN Name END AS Actor
FROM occupations;

/* Step 4:
	Now, Order_by name then Group_By RowNumber.
	Using Min/Max, if there is a name, it will return it, if not, return NULL.
*/
SET @r1=0, @r2=0, @r3=0, @r4=0;
SELECT MIN(Doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM (SELECT CASE
			WHEN occupation='Doctor' THEN (@r1:=@r1+1)
			WHEN occupation='Professor' THEN (@r2:=@r2+1)
			WHEN occupation='Singer' THEN (@r3:=@r3+1)
			WHEN occupation='Actor' THEN (@r4:=@r4+1)
			END AS RowNumber,
			CASE WHEN occupation='Doctor' THEN name END AS Doctor,
			CASE WHEN occupation='Professor' THEN Name END AS Professor,
			CASE WHEN occupation='Singer' THEN Name END AS Singer,
			CASE when occupation='Actor' THEN Name END AS Actor
			ORDER BY name) 
AS temp
GROUP BY RowNumber;
