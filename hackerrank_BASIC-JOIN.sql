/*Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.*/
SELECT SUM(CITY.POPULATION)
FROM CITY
    JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT = 'Asia'
    /*Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa''.*/
SELECT CITY.NAME
FROM CITY
    JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
WHERE CONTINENT = 'Africa'
    /*Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their 
     respective average city populations (CITY.Population) rounded down to the nearest integer.*/
SELECT COUNTRY.CONTINENT,
    FLOOR(AVG(CITY.POPULATION))
FROM CITY
    JOIN COUNTRY ON CITY.COUNTRYCODE = COUNTRY.CODE
GROUP BY COUNTRY.CONTINENT;
/*
 you are given two tables: Students and Grades. Students contains three columns ID, Name and Marks.
 
 Grades contains the following data: Grade, Min_Mark, Max_Mark.
 
 Ketty gives Eve a task to generate a report containing three columns: Name, Grade and Mark. Ketty doesn't want the NAMES of 
 those students who received a grade lower than 8. The report must be in descending order by grade -- i.e. higher grades are 
 entered first. If there is more than one student with the same grade (8-10) assigned to them, order those particular students 
 by their name alphabetically. Finally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in
 descending order. If there is more than one student with the same grade (1-7) assigned to them, order those particular students 
 by their marks in ascending order.
 
 Write a query to help Eve.*/
SELECT IF(grade >= 8, name, NULL) AS name,
    grade,
    marks
FROM Students s
    JOIN Grades g ON s.marks >= g.Min_Mark
    AND s.marks <= g.Max_Mark
ORDER BY grade DESC,
    name;
/*
 Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query
 to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output
 in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received
 full scores in same number of challenges, then sort them by ascending hacker_id.
 
 The following tables contain contest data
 Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker.
 
 Difficulty: The difficult_level is the level of difficulty of the challenge, and score is the score of 
 the challenge for the difficulty level.
 
 Challenges: The challenge_id is the id of the challenge, the hacker_id is the id of the hacker who created the challenge, 
 and difficulty_level is the level of difficulty of the challenge.
 
 Submissions: The submission_id is the id of the submission, hacker_id is the id of the hacker who made the submission, challenge_id 
 is the id of the challenge that the submission belongs to, and score is the score of the submission.
 */
SELECT t.hacker_id,
    t.name
FROM(
        SELECT h.hacker_id,
            h.name,
            d.score fullscore,
            s.score score
        FROM submissions s
            JOIN challenges c ON s.challenge_id = c.challenge_id
            JOIN difficulty d on d.difficulty_level = c.difficulty_level
            JOIN hackers h on h.hacker_id = s.hacker_id
    ) AS t
WHERE t.fullscore = t.score
GROUP by t.hacker_id,
    t.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC,
    t.hacker_id;