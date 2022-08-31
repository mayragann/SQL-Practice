/*Query a count of the number of cities in CITY having a Population larger than 100000.*/
SELECT COUNT(name)
FROM city
WHERE population > 100000;
/*Query the total population of all cities in CITY where District is California.*/
SELECT SUM(population)
FROM city
WHERE district = 'California';
/*Query the average population of all cities in CITY where District is California.*/
SELECT AVG(population)
FROM city
WHERE district = 'California';
/*Query the average population for all cities in CITY, rounded down to the nearest integer.*/
SELECT ROUND(AVG(POPULATION), 0)
FROM CITY;
/*Query the difference between the maximum and minimum populations in CITY*/
SELECT SUM(population)
FROM city
WHERE countrycode = 'JPN';
/*Query the difference between the maximum and minimum populations in CITY.*/
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY;