

-- the death precentage of each country
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as deathPrecentage
FROM SQLTutorial..covidDeaths 



-- the infection precentage of each country relative to its population at a specific date
SELECT location, date, total_deaths, population, (total_deaths/population)*100 as populationInfectedPrecentage
FROM SQLTutorial..covidDeaths 
WHERE date = '2020-09-18'


-- the infection precentage of United Arab Emirates relative to its population 
SELECT location, date, population, (total_deaths/population)*100 as populationInfectedPrecentage
FROM SQLTutorial..covidDeaths 
WHERE location like '%Emirates%'


-- the highest infection rate per country
SELECT location, population, MAX(total_cases) as theHighestInfectionCount, MAX((total_cases/population))*100 as populationInfectedPrecentage
FROM SQLTutorial..covidDeaths 
GROUP BY location, population
order by 4 desc


--STATS BASED ON CONTINENTS INSTEAD OF COUNTRIES


-- the infection precentage of each continent
SELECT continent, MAX(total_cases / population)*100 AS InfectionPrecentage
FROM SQLTutorial..covidDeaths WHERE continent is NOT NULL
GROUP BY continent
order by InfectionPrecentage desc


-- the death precentage of each continent
SELECT continent, MAX(total_deaths/ population)*100 AS DeathPrecentage
FROM SQLTutorial..covidDeaths WHERE continent is NOT NULL
GROUP BY continent
order by DeathPrecentage desc





--STATS GLOBALLY


-- the globle number of cases and deaths daily
SELECT  date , SUM(new_cases) AS totalCasesInOneDay, SUM(cast(new_deaths as int)) AS totalDeathsInOneDay
FROM SQLTutorial..covidDeaths 
WHERE continent is NOT NULL
Group by date
order by 1





