Select * from sheet1;
Select * from sheet2;
select distinct * from sheet2;
select distinct * from sheet1;

-- 1)Group the customers based on their income type and find the average of their annual income.

select Ind_ID,Type_Income,avg(annual_income) as AverageAnnualIncome from sheet1 group by Ind_ID order by Type_Income;

-- 2)Find the female owners of cars and property.

select Ind_ID from sheet1 where GENDER="F";

-- 3)Find the male customers who are staying with their families.

select Ind_ID from sheet1 where marital_status="Married" and GENDER="M" and Family_Members>1;

-- 4)Please list the top five people having the highest income.

select Ind_ID,Annual_income from sheet1 order by Annual_income desc limit 5 ;

-- 5)How many married people are having bad credit?

SELECT COUNT(*) AS Bad_Credit_Count
FROM sheet1 c
JOIN sheet2 l ON c.Ind_ID = l.Ind_ID
WHERE Marital_status = 'Married' AND l.Label = 1;

-- 6)What is the highest education level and what is the total count?

SELECT Education, COUNT(*) AS Total_Count
FROM sheet1
GROUP BY Education
ORDER BY Total_Count DESC;

-- 7)Between married males and females, who is having more bad credit? 

SELECT Gender, COUNT(*) AS Bad_Credit_Count
FROM sheet1 c
JOIN sheet2 l ON c.Ind_ID = l.Ind_ID
WHERE Marital_status = 'Married' AND l.Label = 1
GROUP BY Gender
ORDER BY Bad_Credit_Count DESC limit 1;
