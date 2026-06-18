----Write queries using single-row subqueries:
--(a) Find all employees whose salary is greater than the average salary of the entire company.
SELECT e.emp_ID, e.fname, e.lname, sb.amount
FROM EMPLOYEE e
JOIN SALARY_BONUS sb
     ON e.emp_ID = sb.emp_ID
WHERE sb.amount >
    (
    SELECT AVG(amount)
    FROM SALARY_BONUS
    );
--(b) Retrieve the department with the highest total payroll amount
SELECT j.job_ID, j.job_dept,
       SUM(p.total_amount) AS total_payroll
FROM JOB_DEPARTMENT j
JOIN PAYROLL p
     ON j.job_ID = p.job_ID
GROUP BY j.job_ID, j.job_dept
HAVING SUM(p.total_amount) =
    (
      SELECT MAX(total_payroll)
      FROM (
       SELECT SUM(total_amount) AS total_payroll
       FROM PAYROLL
       GROUP BY job_ID
           )
    );
    -----Multi-Row Subquery with IN / ANY / ALL Easy 1 pts
--(a) List all employees who work in departments that have at least one salary record with a bonus greater than 500.Use IN.
SELECT emp_ID, fname, lname, job_ID
FROM EMPLOYEE
WHERE job_ID IN (
    SELECT job_ID
    FROM SALARY_BONUS
    WHERE bonus > 500
);
--(b) Find employees whose salary is greater than ALL salaries in the 'Operations' department. Use ALL.
SELECT e.emp_ID, e.fname, e.lname, sb.amount
FROM EMPLOYEE e
JOIN SALARY_BONUS sb
     ON e.emp_ID = sb.emp_ID
WHERE sb.amount > ALL (
    SELECT sb2.amount
    FROM SALARY_BONUS sb2
    JOIN JOB_DEPARTMENT j
         ON sb2.job_ID = j.job_ID
    WHERE j.job_dept = 'Operations'
);
--(c) Find employees whose salary is greater than ANY salary in the 'HR' department. Use ANY
SELECT e.emp_ID, e.fname, e.lname, sb.amount
FROM EMPLOYEE e
JOIN SALARY_BONUS sb
     ON e.emp_ID = sb.emp_ID
WHERE sb.amount > ANY (
    SELECT sb2.amount
    FROM SALARY_BONUS sb2
    JOIN JOB_DEPARTMENT j
         ON sb2.job_ID = j.job_ID
    WHERE j.job_dept = 'HR'
);