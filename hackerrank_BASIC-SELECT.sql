/*Query a list of CITY names from STATION For Cities that have even ID number. 
 Print results in any order, but exclude duplicates from the answers*/
SELECT DISTINCT CITY 
FROM STATION
WHERE MOD(ID, 2) = 0;
/*Find the difference between the total number of CITY entries in the table and 
 the number of distinct CITY entries in the table.*/
SELECT (COUNT(CITY) - COUNT(DISTINCT CITY))
FROM STATION;
/*Query the two cities in STATION with the shortest and longest CITY names, as well as their 
 respective lengths (i.e.: number of characters in the name). If there is more than one smallest 
 or largest city, choose the one that comes first when ordered alphabetically.*/
SELECT CITY,
    LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) =(
        SELECT MIN(LENGTH(CITY))
        FROM STATION
    )
ORDER BY CITY ASC
LIMIT 1;
SELECT CITY,
    LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY) =(
        SELECT MAX(LENGTH(CITY))
        FROM STATION
    )
ORDER BY CITY ASC
LIMIT 1;
/*Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
 Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE 'A%'
    OR CITY LIKE 'E%'
    OR CITY LIKE 'I%'
    OR CITY LIKE 'O%'
    OR CITY LIKE 'U%';
/*Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
 Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY LIKE '%a'
    OR CITY LIKE '%e'
    OR CITY LIKE '%i'
    OR CITY LIKE '%o'
    OR CITY LIKE '%u'
ORDER BY CITY;
/*Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as 
 both their first and last characters. Your result cannot contain duplicates*/
SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, 1, 1) IN ('a', 'e', 'i', 'o', 'u')
    AND SUBSTR(CITY, LENGTH(CITY), 1) IN ('a', 'e', 'i', 'o', 'u');
/*Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE CITY NOT LIKE '%a'
    AND CITY NOT LIKE '%e'
    AND CITY NOT LIKE '%i'
    AND CITY NOT LIKE '%o'
    AND CITY NOT LIKE '%u';
/*Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your 
 result cannot contain duplicates.*/
SELECT DISTINCT CITY
FROM STATION
WHERE SUBSTR(CITY, 1, 1) NOT IN ('a', 'e', 'i', 'o', 'u')
    AND SUBSTR(CITY, LENGTH(CITY), 1) NOT IN ('a', 'e', 'i', 'o', 'u');
/*Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three 
 characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), 
 secondary sort them by ascending ID.*/
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME, 3),
    ID;
/*Write a query that prints a list of employee names (i.e.: the name attribute) from the Employee table in alphabetical order..*/

SELECT NAME
FROM EMPLOYEE
ORDER BY NAME;

/*Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a 
salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.*/

SELECT NAME
FROM EMPLOYEE
WHERE SALARY > 2000 AND MONTHS <10;
