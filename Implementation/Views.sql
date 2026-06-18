---Create a view named VW_EMPLOYEE_SUMMARY that returns:
--emp_ID, full name, gender, age, department name, and job title (from QUALIFICATION).
CREATE OR REPLACE VIEW VW_EMPLOYEE_SUMMARY AS
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       e.gender, e.age,
       j.job_dept AS department_name,
       q.position AS job_title
FROM EMPLOYEE e
JOIN JOB_DEPARTMENT j
     ON e.job_ID = j.job_ID
LEFT JOIN QUALIFICATION q
     ON e.emp_ID = q.emp_ID;
--After creating it:
--(a) Query the view to list all female employees over 30.
SELECT *
FROM VW_EMPLOYEE_SUMMARY
WHERE gender = 'F'
  AND age > 30;
--(b) Try to INSERT a row through this view and document the Oracle error message you receive
INSERT INTO VW_EMPLOYEE_SUMMARY (emp_ID, full_name, gender, age, department_name, job_title)VALUES (999, 'Test User', 'F', 31, 'IT', 'Test Position');
------# SHOWIN ERROR : The view is based on multiple tables using JOIN operations. Oracle cannot determine which base table should receive the inserted data, so the INSERT operation is not allowed and returns ORA-01776.

---Create a view named VW_PAYROLL_DASHBOARD that returns for each payroll record:
--payroll_ID, employee full name, department, salary amount, bonus, leave reason, payroll date, and total_amount.
CREATE OR REPLACE VIEW VW_PAYROLL_DASHBOARD AS
SELECT p.payroll_ID,
       e.fname || ' ' || e.lname AS full_name,
       j.job_dept AS department,
       sb.amount AS salary_amount,
       sb.bonus,
       l.reason AS leave_reason,
       p.payroll_date,
       p.total_amount
FROM PAYROLL p
JOIN EMPLOYEE e
     ON p.emp_ID = e.emp_ID
JOIN JOB_DEPARTMENT j
     ON p.job_ID = j.job_ID
JOIN SALARY_BONUS sb
     ON p.salary_ID = sb.salary_ID
LEFT JOIN LEAVE l
     ON p.emp_ID = l.emp_ID;
--Query the view to find the top 5 payroll records by total_amount
SELECT *
FROM VW_PAYROLL_DASHBOARD
ORDER BY total_amount DESC
FETCH FIRST 5 ROWS ONLY;