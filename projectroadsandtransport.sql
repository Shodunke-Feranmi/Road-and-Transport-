use projectdb;

SELECT *
FROM `road and tranpsort 2020 to 2024 combined`;

-- People Involved in Transport accident from 2020 - 2024
Select Sum(`PEOPLE INVOLVED`) as `People Involved IN Accident`
From `road and tranpsort 2020 to 2024 combined`;

-- Casualty From 2020 - 2024
Select Sum(`TOTAL CASUALTY`) 
From `road and tranpsort 2020 to 2024 combined`;

-- Poeple Killed From 2020 - 2024
Select Sum(`NUMBER KILLED`)
From `road and tranpsort 2020 to 2024 combined`;

-- People Injured From 2020 - 2024
Select Sum(`NUMBER INJURED`)
From `road and tranpsort 2020 to 2024 combined`;


						--  STATE ANALYSIS --

-- Which State has the most People involved In Transportation Accident
Select STATE, sum(`PEOPLE INVOLVED`) as 'People Involved'
From `road and tranpsort 2020 to 2024 combined`
group by STATE
ORDER BY sum(`PEOPLE INVOLVED`) desc;

-- State with most People Killed
Select STATE, sum(`Number killed`) as 'Number Killed'
From `road and tranpsort 2020 to 2024 combined`
group by STATE
ORDER BY sum(`NUMBER KILLED`) desc;

-- State with the Most Cases
select STATE, SUM(`TOTAL CASES`) AS 'Total Cases'
FROM `road and tranpsort 2020 to 2024 combined`
group by STATE
ORDER BY sum(`TOTAL CASES`);

-- STATE Injury Cases
select STATE, SUM(FATAL) AS FATAL, SUM(SERIOUS) AS SERIOUS, SUM(MINOR) MINOR, SUM(`NUMBER INJURED`) AS INJURED
FROM `road and tranpsort 2020 to 2024 combined`
group by STATE
ORDER BY SUM(FATAL), SUM(SERIOUS), SUM(MINOR), SUM(`NUMBER INJURED`);

-- STATE Accident Rate 
select STATE, `PEOPLE INVOLVED`
from `road and tranpsort 2020 to 2024 combined`
Group by STATE,`PEOPLE INVOLVED`;


						-- YEARLY ANALYSIS--
-- Which Year Has the Most Poeple Involved in Transport Accident
select Year, Sum(`PEOPLE INVOLVED`) AS 'People Involved'
FROM `road and tranpsort 2020 to 2024 combined`
Group by Year
order by Sum(`PEOPLE INVOLVED`) desc;

-- Average Yealy Deaths
select Year, Ceil(AVG(`NUMBER kILLED`)) AS AVG_Yearly_Death
FROM `road and tranpsort 2020 to 2024 combined`
Group by Year
order by ceil(AVG(`NUMBER KILLED`)) desc;

-- In which quarter of the Years do Traffic Accidents happen the most 
select Quater, Year,sum(`People Involved`) as 'Poeple Involved'
FROM `road and tranpsort 2020 to 2024 combined`
Group by  Quater, Year
order by sum(`People Involved`);

Select Quater, sum(`People Involved`) as 'People Involved'
from `road and tranpsort 2020 to 2024 combined`
group by Quater
order by sum(`People Involved`) desc;

Select STATE, sum(`Total Casualty`) AS 'Casualty'

from `road and tranpsort 2020 to 2024 combined`
group by STATE;


Select STATE, sum(`Total Casualty`) AS 'Casualty',
CASE
WHEN sum(`Total Casualty`) <= 4000 THEN 'LOW'
WHEN sum(`Total Casualty`) BETWEEN 4000 AND 8000 THEN 'MID'
WHEN sum(`Total Casualty`) >= 8000 THEN 'HIGH'
END AS `Casualty Rate`
from `road and tranpsort 2020 to 2024 combined`
group by STATE;


CREATE TEMPORARY TABLE Total_Cases_Table
SELECT *
FROM `road and tranpsort 2020 to 2024 combined`
WHERE `TOTAL CASES` > 70;

select *
from Total_Cases_Table;

SELECT STATE, `TOTAL CASES`, `PEOPLE INVOLVED`
FROM Total_Cases_Table
GROUP BY STATE, `TOTAL CASES`, `PEOPLE INVOLVED`;

WITH CTE_RTF AS
(
SELECT *
FROM `road and tranpsort 2020 to 2024 combined` RT
JOIN Total_Cases_Table TC
ON RT.STATE = TC.STATE
)
SELECT *
FROM  CTE_RTF
;



select STATE, `PEOPLE INVOLVED`
from `road and tranpsort 2020 to 2024 combined`
Group by STATE,`PEOPLE INVOLVED`;











