SELECT COUNT(*) AS Employee_count
FROM Employees_cleaned


SELECT COUNT(*) AS Attendance_count
FROM Attendance_cleaned

SELECT COUNT(*) AS Performance_count
FROM Performance_cleaned

SELECT COUNT(*) AS Leave_count
FROM leaves_cleaned

SELECT TOP 10 *
FROM employees_cleaned

SELECT TOP 10 *
FROM attendance_cleaned

SELECT TOP 10 *
FROM performance_cleaned

SELECT TOP 10 *
FROM leaves_cleaned

SELECT DISTINCT a.Employee_ID
FROM attendance_cleaned a
LEFT JOIN employees_cleaned e
ON a.Employee_ID = e.Employee_ID
WHERE e.Employee_ID IS NULL;

SELECT DISTINCT a.Employee_ID
FROM attendance_cleaned a
LEFT JOIN performance_cleaned p
ON a.Employee_ID = p.Employee_ID
WHERE p.Employee_ID IS NULL;

-- Department wise employee count

SELECT Department,
count(*) as Employee_count
from employees_cleaned
GROUP BY Department
ORDER BY Employee_COUNT DESC


-- Location wise employee count
SELECT Location,
count(*) as Employee_count
from employees_cleaned
GROUP BY Location
ORDER BY Employee_COUNT DESC

-- Department wise avg salary
SELECT Department,
AVG(Salary) AS Average_Salary
FROM employees_cleaned
GROUP BY Department
ORDER BY Average_Salary DESC

-- Highest Paid Emplyees

SELECT TOP 10
	Employee_ID,
    Employee_Name,
    Department,
    Designation,
    Salary
FROM employees_cleaned
ORDER BY Salary DESC

-- Department wise salary range

SELECT Department,
MIN(Salary) as Min_Salary,
MAX(Salary) as Max_Salary,
AVG(Salary) as Avg_Salary
FROM employees_cleaned
GROUP BY Department
ORDER BY Avg_Salary DESC

-- Har year company ne kitne employees hire kiye?

SELECT Joining_Year,
COUNT(*) AS Employees_Joined
FROM employees_cleaned
GROUP BY Joining_Year
ORDER BY Joining_Year

-- Designation-wise Headcount

SELECT Designation,
COUNT(*) as Employee_Count
FROM employees_cleaned
GROUP BY Designation
ORDER BY Employee_Count DESC

-- Har attendance record ke saath employee ka name aur department chahiye.

SELECT  
    a.Attendance_ID,
    a.Employee_ID,
    e.Employee_Name,
    e.Department,
    a.Date,
    a.Status,
    a.Working_Hours,
    a.Overtime_Hours
FROM attendance_cleaned as a
INNER JOIN employees_cleaned as e
ON a.Employee_ID = e.Employee_ID

-- Har department mein Present, Absent, Leave aur WFH kitne records hain?

SELECT 
    e.Department,
    a.Status,
    COUNT(*) AS Attendance_count
FROM attendance_cleaned as a
INNER JOIN employees_cleaned as e
    ON a.Employee_ID = e.Employee_ID
GROUP BY e.Department,a.Status
ORDER BY e.Department,Attendance_count DESC

-- Department-wise Attendance %

SELECT
    e.Department,
    COUNT(*) AS Total_Records,
    SUM(CASE
        WHEN a.Status IN('Present','WFH') THEN 1
        ELSE 0
    END) AS Present_Records,

    ROUND(
        100.0 *
        SUM(CASE
            WHEN a.Status IN('Present','WFH') THEN 1
            ELSE 0
        END) / COUNT(*),2) AS Attendance_Percentage
FROM attendance_cleaned AS a
INNER JOIN employees_cleaned AS e
    ON a.Employee_ID = e.Employee_ID
GROUP BY e.Department
ORDER BY Attendance_Percentage DESC

-- Department-wise Average Working Hours

SELECT e.Department,
ROUND(AVG(a.Working_Hours),2) AS Average_Workinghours
FROM attendance_cleaned AS a
INNER JOIN employees_cleaned AS e
    ON a.Employee_ID = e.Employee_ID
GROUP BY e.Department
ORDER BY Average_Workinghours DESC

-- Depratment wise overtime

SELECT e.Department,
    ROUND(SUM(Overtime_Hours),2) AS TotalOvertime_Hours
FROM attendance_cleaned AS a
INNER JOIN employees_cleaned AS e
    ON a.Employee_ID = e.Employee_ID
GROUP BY e.Department
ORDER BY TotalOvertime_Hours DESC

--Employee-wise Attendance

SELECT 
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    SUM(CASE
        WHEN a.Status IN ('Present','WFH') THEN 1
        ELSE 0
        END) as Present_Days,
    SUM(CASE
        WHEN a.Status = 'Absent' THEN 1
        ELSE 0
        END) AS Absent_Days,
    SUM(CASE
        WHEN a.Status = 'Leave' THEN 1
        ELSE 0
        END) AS Leave_Days
FROM attendance_cleaned AS a
INNER JOIN employees_cleaned AS e
    ON a.Employee_ID = e.Employee_ID
GROUP BY e.Employee_ID,
    e.Employee_Name,
    e.Department

--Employees with High Absence

SELECT 
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    SUM(CASE
        WHEN a.Status = 'Absent' THEN 1
        ELSE 0
        END) AS Absent_Days
FROM attendance_cleaned AS a
    INNER JOIN employees_cleaned AS e
        ON a.Employee_ID = e.Employee_ID
GROUP BY e.Employee_ID,
         e.Employee_Name,
         e.Department
HAVING SUM(CASE
           WHEN a.Status = 'Absent' THEN 1
           ELSE 0
           END) > 10
ORDER BY Absent_Days DESC
    
-- Employee-wise Performance

SELECT 
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    e.Designation,
    ROUND(AVG(p.Performance_Score),2) AS Avg_Performance,
    ROUND(AVG(p.Productivity_Score),2) AS Avg_Productivity,
    ROUND(AVG(p.Manager_Rating),2) AS Avg_Manager_Rating
FROM performance_cleaned AS p
INNER JOIN employees_cleaned AS e
    ON p.Employee_ID = e.Employee_ID
GROUP BY e.Employee_ID,
         e.Employee_Name,
         e.Department,
         e.Designation
ORDER BY Avg_Performance DESC

-- Top 10 Performers

SELECT 
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    e.Designation,
    ROUND(AVG(p.Performance_Score),2) AS Avg_Performance
FROM performance_cleaned AS p
    INNER JOIN employees_cleaned AS e
        ON p.Employee_ID = e.Employee_ID
GROUP BY e.Employee_ID,
             e.Employee_Name,
             e.Department,
             e.Designation
ORDER BY Avg_Performance DESC


-- Business question: Which employees have relatively low average performance?

SELECT
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    e.Designation,
    ROUND(AVG(p.Performance_Score), 2) AS Avg_Performance,
    ROUND(AVG(p.Productivity_Score), 2) AS Avg_Productivity,
    ROUND(AVG(p.Manager_Rating), 2) AS Avg_Manager_Rating
FROM performance_cleaned AS p
INNER JOIN employees_cleaned AS e
    ON p.Employee_ID = e.Employee_ID
GROUP BY
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    e.Designation
HAVING AVG(p.Performance_Score) < 60
ORDER BY Avg_Performance

-- Top Productivity Employees

SELECT TOP 10
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    e.Designation,
    ROUND(AVG(p.Productivity_Score), 2) AS Avg_Productivity,
    ROUND(AVG(p.Performance_Score), 2) AS Avg_Performance
FROM performance_cleaned AS p
INNER JOIN employees_cleaned AS e
    ON p.Employee_ID = e.Employee_ID
GROUP BY
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    e.Designation
ORDER BY Avg_Productivity DESC

-- Employee-wise Leave Analysis

SELECT
    e.Employee_ID,
    e.Employee_Name,
    e.Department,
    COUNT(l.Leave_ID) AS Leave_Requests,
    ROUND(SUM(l.Leave_Days), 2) AS Total_Leave_Days
FROM leaves_cleaned l
INNER JOIN employees_cleaned e
    ON l.Employee_ID = e.Employee_ID
GROUP BY
    e.Employee_ID,
    e.Employee_Name,
    e.Department
ORDER BY Total_Leave_Days DESC;


-- Department-wise Leave Analysis

SELECT
    e.Department,
    COUNT(l.Leave_ID) AS Leave_Requests,
    ROUND(SUM(l.Leave_Days), 2) AS Total_Leave_Days,
    ROUND(AVG(l.Leave_Days), 2) AS Avg_Leave_Days
FROM leaves_cleaned l
INNER JOIN employees_cleaned e
    ON l.Employee_ID = e.Employee_ID
GROUP BY e.Department
ORDER BY Total_Leave_Days DESC;

-- Leave Type Analysis

SELECT
    Leave_Type,
    COUNT(*) AS Leave_Requests,
    ROUND(SUM(Leave_Days), 2) AS Total_Leave_Days
FROM leaves_cleaned
GROUP BY Leave_Type
ORDER BY Total_Leave_Days DESC;

--Approval Status Analysis

SELECT
    Approval_Status,
    COUNT(*) AS Leave_Requests,
    ROUND(SUM(Leave_Days), 2) AS Total_Leave_Days
FROM leaves_cleaned
GROUP BY Approval_Status
ORDER BY Leave_Requests DESC;



SELECT
    COUNT(*) AS Total_Leave_Requests,
    SUM(Leave_Days) AS Total_Leave_Days,
    AVG(Leave_Days) AS Average_Leave_Days
FROM leaves_cleaned;


SELECT
    e.Department,
    COUNT(l.Leave_ID) AS Leave_Requests,
    SUM(l.Leave_Days) AS Total_Leave_Days
FROM leaves_cleaned l
INNER JOIN employees_cleaned e
    ON l.Employee_ID = e.Employee_ID
GROUP BY e.Department
ORDER BY Total_Leave_Days DESC;