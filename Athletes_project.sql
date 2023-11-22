-- Q1. Show how many medal counts present for entire data.

SELECT COUNT(Medal)
FROM athletes
WHERE Medal != 'NoMedal';

-- class solution
SELECT Medal, COUNT(Medal)
FROM athletes
GROUP BY Medal;

-- Q2. Show count of unique Sports are present in olympics.
SELECT COUNT(DISTINCT Sport)
FROM athletes;

-- Q3. Show how many different medals won by Team India in data.

-- QUERY--
SELECT Team, Medal, COUNT(Medal) AS cnt_medal
FROM athletes
WHERE Team = 'India' AND Medal!='NoMedal'
GROUP BY Medal;

-- Q4. Show event wise medals won by india show from highest to lowest medals won in order.
-- QUERY --
SELECT Event, COUNT(Medal) AS cnt_medal
FROM athletes
WHERE Team = 'India' AND Medal != 'NoMedal'
GROUP BY Event
ORDER BY cnt_medal DESC;

-- Q5. Show event and yearwise medals won by india in order of year.

-- QUERY --
SELECT Team, Event, Year, Medal
FROM athletes
WHERE Team='India' AND Medal != 'NoMedal'
ORDER BY Year;

-- Class Solution
SELECT Team, Event, Year, COUNT(Medal) AS medalcount
FROM athletes
WHERE Team='India' AND Medal != 'NoMedal'
GROUP BY Event, Year
ORDER BY Year DESC;

-- Q6. Show the country with maximum medals won gold, silver, bronze

-- QUERY --
SELECT Team, MAX(Medal)
FROM athletes
WHERE Medal != 'NoMedal'
GROUP BY Medal;

-- Class Solution
SELECT Team, count(Medal) as medalcount
FROM athletes
WHERE Medal != 'NoMedal'
GROUP BY Team
ORDER BY medalcount DESC
LIMIT 1;

-- Q7. Show the top 10 countries with respect to gold medals

-- QUERY --
SELECT Team, Medal, COUNT(Medal) AS cnt
FROM athletes
WHERE Medal = 'Gold'
GROUP BY Team
ORDER BY cnt DESC
LIMIT 10;

-- Q8. Show in which year did United States won most medals
-- QUERY --
SELECT Team, Year, COUNT(Medal) AS cnt
FROM athletes
WHERE Team='United States' AND Medal != 'NoMedal'
GROUP BY Year
ORDER BY cnt desc
LIMIT 1;

-- Q9. In which sports United States has most medals
-- QUERY --
SELECT Team, Sport, COUNT(Medal) AS Medal_cnt
FROM athletes
WHERE Team='United States' AND Medal='NoMedal'
GROUP BY Sport
ORDER BY Medal_cnt DESC
LIMIT 1;

-- Q10. Find top 3 players who have won most medals along with their sports and country.
-- QUERY --
SELECT Name, Sport, Team, COUNT(Medal) AS medal_cnt
FROM athletes
WHERE Medal != 'NoMedal'
GROUP BY Name, Sport, Team
ORDER BY medal_cnt DESC
LIMIT 3;

-- Q11. Find player with most gold medals in cycling along with his country.
-- QUERY --
SELECT Name, Sport, Team, Count(Medal) AS Cnt
FROM athletes
WHERE Medal='Gold' AND Sport='Cycling'
GROUP BY Name
ORDER BY Cnt DESC
LIMIT 2;

-- Q12. Find player with most medals (Gold + Silver + Bronze) in Basketball also show his country.
-- QUERY --
SELECT Name, Sport, Team, Count(Medal) AS medal_cnt
FROM athletes
WHERE Medal != 'NoMedal' AND Sport='Basketball'
GROUP BY Name
ORDER BY medal_cnt DESC
LIMIT 1;

-- Q13. Find out the count of different medals of the top basketball player.
SELECT Name, Sport, Team, Medal, COUNT(Medal)
FROM athletes
WHERE Sport='Basketball' AND Medal != 'NoMedal'
GROUP BY Name
ORDER BY COUNT(Medal) DESC;

-- Class Solution
SELECT Name, Sport, Team, Medal, COUNT(Medal)
FROM athletes
WHERE Sport='Basketball' AND Medal != 'NoMedal' AND Name='Teresa Edwards'
GROUP BY Medal;


-- Q14. Find out medals won by male, female each year.
-- QUERY --
SELECT Year, Sex, COUNT(Medal)
FROM athletes
WHERE Medal != 'NoMedal'
GROUP BY Year, Sex
ORDER BY Year, COUNT(Medal);
