create database Hr;
use hr;
use hr;



select * from hr_data;

select count(*) from hr_data;


#Average Attrition rate for all Departments#
SELECT 
    Department,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Attrition_Rate_Percentage
FROM hr_data
GROUP BY Department
order by Attrition_Rate_Percentage desc;

#Average Hourly Rate of Male Research Scientist#
SELECT 
    ROUND(AVG(HourlyRate), 2) AS Avg_HourlyRate_Male_RS
FROM hr_data
WHERE Gender = 'Male' AND JobRole = 'Research Scientist';

#Attrition Rate vs Monthly Income Stats#
SELECT 
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_MonthlyIncome,
    ROUND(MIN(MonthlyIncome), 2) AS Min_Income,
    ROUND(MAX(MonthlyIncome), 2) AS Max_Income,
    COUNT(*) AS Employee_Count
FROM hr_data
GROUP BY Attrition;

-- New Query

select 
	case when monthlyIncome > 0 and monthlyIncome <= 10000 then "0 - 10000"
		 when MonthlyIncome > 10000 and monthlyIncome <= 20000 then "10000-20000"
         when MonthlyIncome > 20000 and monthlyIncome <= 30000 then "20000-30000"
		 when MonthlyIncome > 30000 and monthlyIncome <= 40000 then "30000-40000"
		 when MonthlyIncome > 40000 and monthlyIncome <= 50000 then "40000-50000"
		 when MonthlyIncome > 50000 and monthlyIncome <= 60000 then "50000-60000"
	end as income_stats,
    count(*) as total_employee,
    sum(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) as attrited_employee,
    avg(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 as attrition_rate
from hr_data
group by income_stats
order by income_stats;

#Average Working Years for Each Department#
SELECT 
    Department,
    ROUND(AVG(TotalWorkingYears), 2) AS Avg_WorkingYears
FROM hr_data
GROUP BY Department
order by Avg_WorkingYears desc;

#Job Role vs Work-Life Balance#
SELECT 
    JobRole,
    ROUND(AVG(WorkLifeBalance), 2) AS Avg_WorkLife_Balance
FROM hr_data
GROUP BY JobRole
ORDER BY Avg_WorkLife_Balance DESC;

#Attrition Rate vs Years Since Last Promotion#
SELECT 
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Attrition_Rate_Percentage,
    ROUND(AVG(YearsSinceLastPromotion), 2) AS Avg_Years_Since_Last_Promotion
FROM hr_data;

#Average Age of Employees#
SELECT 
    ROUND(AVG(Age), 2) AS Average_Age
FROM hr_data;

# Average Promotion
SELECT 
    ROUND(AVG(YearsSinceLastPromotion), 2) AS Avg_Promotion
FROM hr_data;

select * from hr_data;

# Total Employee
SELECT 
    COUNT(*) AS Total_Employees
FROM hr_data;

# Total Employees by Department#
SELECT 
    Department,
    COUNT(*) AS Total_Employees
FROM hr_data
GROUP BY Department
ORDER BY Total_Employees DESC;

#Education Field by Average Attrition Rate#
SELECT 
    EducationField,
    ROUND(AVG(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100, 2) AS Avg_Attrition_Rate_Percentage
FROM hr_data
GROUP BY EducationField
ORDER BY Avg_Attrition_Rate_Percentage DESC;
