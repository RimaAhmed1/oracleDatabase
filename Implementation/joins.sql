----Write a query using INNER JOINs to retrieve a complete employee profile:
--Columns: emp_ID, full name (fname || ' ' || lname), department name, job title (from QUALIFICATION), salary amount, latest leave date.
--Filter: only employees who have both a payroll record AND a qualification record.
SELECT e.emp_ID,
    e.fname || ' ' || e.lname AS full_name,
    j.job_dept AS department_name,
    q.position AS job_title,
    sb.amount AS salary_amount,
    MAX(l.leave_date) AS latest_leave_date
FROM EMPLOYEE e INNER JOIN JOB_DEPARTMENT j
        ON e.job_ID = j.job_ID
INNER JOIN QUALIFICATION q
        ON e.emp_ID = q.emp_ID
INNER JOIN PAYROLL p
        ON e.emp_ID = p.emp_ID
INNER JOIN SALARY_BONUS sb
        ON e.emp_ID = sb.emp_ID
LEFT JOIN LEAVE l
        ON e.emp_ID = l.emp_ID
GROUP BY e.emp_ID, e.fname, e.lname, j.job_dept, q.position, sb.amount
ORDER BY e.emp_ID;
-----LEFT OUTER JOIN — Missing Records
--Use LEFT OUTER JOINs to find gaps in data:
--(a) List all employees who have never taken any leave (no matching LEAVE record).
SELECT e.emp_ID, e.fname, e.lname
FROM EMPLOYEE e LEFT JOIN LEAVE l
       ON e.emp_ID = l.emp_ID
WHERE l.leave_ID IS NULL;
--(b) List all departments that have no salary/bonus records associated with them.
SELECT j.job_ID, j.job_dept, j.name
FROM JOB_DEPARTMENT j LEFT JOIN SALARY_BONUS sb
  ON j.job_ID = sb.job_ID
WHERE sb.salary_ID IS NULL;
----Write a single query joining all 6 tables to produce a complete payroll report:
--Columns: payroll_ID, employee full name, department, position (from QUALIFICATION), salary amount, bonus,leave reason, total_amount.
--Order by department name, then by total_amount descending.
SELECT p.payroll_ID, e.fname || ' ' || e.lname AS full_name,
       j.job_dept AS department, 
       q.position,
       sb.amount AS salary_amount,
       sb.bonus,
       l.reason AS leave_reason,
       p.total_amount
FROM PAYROLL p
JOIN EMPLOYEE e
     ON p.emp_ID = e.emp_ID
JOIN JOB_DEPARTMENT j
     ON p.job_ID = j.job_ID
JOIN SALARY_BONUS sb
     ON p.salary_ID = sb.salary_ID
LEFT JOIN QUALIFICATION q
     ON e.emp_ID = q.emp_ID
LEFT JOIN LEAVE l
     ON e.emp_ID = l.emp_ID
ORDER BY j.job_dept ASC,
         p.total_amount DESC;