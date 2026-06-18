-------Write queries using standard aggregate functions:
-------(a) Total number of employees in each department.
SELECT j.job_dept,
       COUNT(e.emp_ID) AS total_employees
FROM JOB_DEPARTMENT j LEFT JOIN EMPLOYEE e
       ON j.job_ID = e.job_ID
GROUP BY j.job_dept
ORDER BY j.job_dept;
-------(b) Minimum, maximum, and average salary (amount) across all salary records.
SELECT MIN(amount) AS minimum_salary,
       MAX(amount) AS maximum_salary,
       AVG(amount) AS average_salary
FROM SALARY_BONUS;
-------(c) Total bonus paid out across the entire company.
SELECT SUM(bonus) AS total_bonus_paid
FROM SALARY_BONUS;
------Write GROUP BY queries with HAVING filters:
------(a) List departments where the average employee age exceeds 30.
SELECT j.job_dept,
 AVG(e.age) AS average_age
FROM JOB_DEPARTMENT j
JOIN EMPLOYEE e
 ON j.job_ID = e.job_ID
GROUP BY j.job_dept
HAVING AVG(e.age) > 30;
------(b) Show all job titles where more than 2 employees share that qualification position.
SELECT q.position,
       COUNT(q.emp_ID) AS total_employees
FROM QUALIFICATION q
GROUP BY q.position
HAVING COUNT(q.emp_ID) > 2;
------(c) Find months (from PAYROLL.date) where the total payroll amount exceeds 20,000
SELECT TO_CHAR(payroll_date, 'Month') AS payroll_month,
       SUM(total_amount) AS total_payroll
FROM PAYROLL
GROUP BY TO_CHAR(payroll_date, 'Month')
HAVING SUM(total_amount) > 20000;
---------------- Aggregation with Multiple Functions
---Write a single query that produces a department summary report. For each department show:
--(a) Department name.(b) Total number of employees (COUNT).(c) Total payroll amount paid out (SUM of total_amount from PAYROLL).(d) Average salary of employees in that department (AVG of SALARY_BONUS.amount).(e) Highest salary in the department (MAX) and lowest salary (MIN).Join the necessary tables and group by department. Order results by total payroll descending
SELECT j.job_dept AS department_name,
       COUNT(DISTINCT e.emp_ID) AS total_employees,
       SUM(p.total_amount) AS total_payroll_amount,
       AVG(sb.amount) AS average_salary,
       MAX(sb.amount) AS highest_salary,
       MIN(sb.amount) AS lowest_salary
FROM JOB_DEPARTMENT j
LEFT JOIN EMPLOYEE e
       ON j.job_ID = e.job_ID
LEFT JOIN PAYROLL p
       ON e.emp_ID = p.emp_ID
LEFT JOIN SALARY_BONUS sb
       ON e.emp_ID = sb.emp_ID
GROUP BY j.job_dept
ORDER BY total_payroll_amount DESC;