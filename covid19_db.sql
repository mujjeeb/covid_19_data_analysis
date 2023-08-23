/* Create the DB*/
CREATE DATABASE covid_19_data
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


/* Create the Table */ 
CREATE TABLE [IF NOT EXISTS] covid_19_data (
    SNo INT PRIMARY KEY,
	ObservationDate DATE NOT NULL,
	Province VARCHAR ( 50 ) ,
    Country VARCHAR ( 50 ) ,
    LastUpdate VARCHAR ( 25 ) NOT NULL,
    Confirmed INT, 
    Deaths INT,
    Recovered INT
	
);


/* Query to Retrieve the cumulative counts of confirmed, deceased, and recovered cases.*/
SELECT
    SUM("Confirmed") AS cumulative_confirmed,
    SUM("Deaths") AS cumulative_deceased,
    SUM("Recovered") AS cumulative_recovered
FROM
    covid_19_data;


/* Query to Extract the aggregate counts of confirmed, deceased, and recovered cases for
the first quarter of each observation year.*/
SELECT
    EXTRACT(YEAR FROM "ObservationDate") AS year,
    SUM("Confirmed") AS first_quarter_confirmed,
    SUM("Deaths") AS first_quarter_deceased,
    SUM("Recovered") AS first_quarter_recovered
FROM
    covid_19_data
WHERE
    EXTRACT(MONTH FROM "ObservationDate") BETWEEN 1 AND 3
GROUP BY
    year
ORDER BY
    year;



/* Query to Formulate a comprehensive summary encompassing the following for each
country:
Total confirmed cases
Total deaths
Total recoveries*/

SELECT
    "Country",
    SUM("Confirmed") AS total_confirmed_cases,
    SUM("Deaths") AS total_deaths,
    SUM("Recovered") AS total_recoveries
FROM
    covid_19_data
GROUP BY
    "Country"
ORDER BY
    total_confirmed_cases DESC;


/* Query to Determine the percentage increase in the number of death cases from 2019
to 2020.*/

WITH deaths_2019 AS (
    SELECT SUM("Deaths") AS total_deaths_2019
    FROM covid_19_data
    WHERE EXTRACT(YEAR FROM "ObservationDate") = 2019
),
deaths_2020 AS (
    SELECT SUM("Deaths") AS total_deaths_2020
    FROM covid_19_data
    WHERE EXTRACT(YEAR FROM "ObservationDate") = 2020
)
SELECT
    (total_deaths_2020 - total_deaths_2019) / total_deaths_2019::float * 100 AS percentage_increase
FROM
    deaths_2019, deaths_2020;



/* Query to Compile data for the top 5 countries with the highest confirmed cases.*/

SELECT "Country",
       SUM("Confirmed") AS total_confirmed_cases,
       SUM("Deaths") AS total_deaths,
       SUM("Recovered") AS total_recoveries
FROM covid_19_data
GROUP BY "Country"
ORDER BY total_confirmed_cases DESC;


/* Query to Calculate the net change (increase or decrease) in confirmed cases on a
monthly basis over the two-year period.*/
WITH MonthlyCases AS (
    SELECT DATE_TRUNC('month', "ObservationDate") AS month,
           SUM("Confirmed") AS total_confirmed_cases
    FROM covid_19_data
    GROUP BY month
    ORDER BY month
)
SELECT month,
       total_confirmed_cases - LAG(total_confirmed_cases, 1, 0) OVER (ORDER BY month) AS net_change
FROM MonthlyCases;
