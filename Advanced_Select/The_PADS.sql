-- Solution 1:
SELECT 
    CONCAT(name,'(',LEFT(occupation, 1),')')
FROM Occupations
ORDER BY name;
SELECT
    CASE
        WHEN occupation = 'Doctor'  
            THEN CONCAT('There are a total of ', COUNT(*), ' doctors.')
        WHEN occupation = 'Singer'  
            THEN CONCAT('There are a total of ', COUNT(*), ' singers.')
        WHEN occupation = 'Actor'  
            THEN CONCAT('There are a total of ', COUNT(*), ' actors.')
        WHEN occupation = 'Professor'  
            THEN CONCAT('There are a total of ', COUNT(*), ' professors.')
    END
FROM Occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;


-- Solution 2 (better in my opinion):
SELECT 
    CONCAT(name,'(',LEFT(occupation, 1),')')
FROM Occupations
ORDER BY name;
SELECT
    CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.')
FROM Occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;

/* However, the above solution doesn't make it clear if there's only one occupation.
It would print out as 'There are a total of 1 doctors.', for example.
The following query should take care of that situation.*/

SELECT 
    CONCAT(name,'(',LEFT(occupation, 1),')')
FROM Occupations
ORDER BY name;
SELECT
    CASE
        WHEN COUNT(*) > 1
            THEN CONCAT('There are a total of ', COUNT(*), ' ', LOWER(occupation), 's.')
        ELSE CONCAT('There is a total of ', COUNT(*), ' ', LOWER(occupation), '.')
    END
FROM Occupations
GROUP BY occupation
ORDER BY COUNT(*), occupation;