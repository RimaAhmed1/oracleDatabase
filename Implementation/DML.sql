-- JOB_DEPARTMENT
INSERT INTO JOB_DEPARTMENT VALUES (job_department_seq.NEXTVAL, 'IT', 'Software Developer', 'Develops and maintains applications', '800-1200');
INSERT INTO JOB_DEPARTMENT VALUES (job_department_seq.NEXTVAL, 'HR', 'HR Officer', 'Manages recruitment and employee records', '600-900');
INSERT INTO JOB_DEPARTMENT VALUES (job_department_seq.NEXTVAL, 'Finance', 'Accountant', 'Handles payroll and financial reports', '700-1100');
INSERT INTO JOB_DEPARTMENT VALUES (job_department_seq.NEXTVAL, 'Admin', 'Admin Assistant', 'Supports office administration tasks', '500-800');
INSERT INTO JOB_DEPARTMENT VALUES (job_department_seq.NEXTVAL, 'Operations', 'Operations Coordinator', 'Coordinates daily business operations', '650-1000');

-- EMPLOYEE
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Rima', 'Altarshi', 'F', 23, 'rima@gmail.com', 'pass123', 1);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Ali', 'Albalushi', 'M', 28, 'ali@gmail.com', 'pass123', 1);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Sara', 'Alharthy', 'F', 26, 'sara@gmail.com', 'pass123', 2);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Ahmed', 'Alamri', 'M', 31, 'ahmed@gmail.com', 'pass123', 3);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Maha', 'Alriyami', 'F', 29, 'maha@gmail.com', 'pass123', 4);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Khalid', 'Alnabhani', 'M', 35, 'khalid@gmail.com', 'pass123', 5);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Noor', 'Alfarsi', 'F', 24, 'noor@gmail.com', 'pass123', 1);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Said', 'Alkindi', 'M', 32, 'said@gmail.com', 'pass123', 3);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Huda', 'Almaamari', 'F', 27, 'huda@gmail.com', 'pass123', 2);
INSERT INTO EMPLOYEE VALUES (EMPLOYEE_seq.NEXTVAL, 'Omar', 'Alhabsi', 'M', 30, 'omar@gmail.com', 'pass123', 5);

-- CONTACT_ADD
INSERT INTO contact_add VALUES ('Muscat - Al Khuwair', 1);
INSERT INTO contact_add VALUES ('Muscat - Seeb', 2);
INSERT INTO contact_add VALUES ('Sur - Al Aija', 3);
INSERT INTO contact_add VALUES ('Nizwa - City Center', 4);
INSERT INTO contact_add VALUES ('Sohar - Falaj Al Qabail', 5);
INSERT INTO contact_add VALUES ('Muscat - Bousher', 6);
INSERT INTO contact_add VALUES ('Ibri - Main Road', 7);
INSERT INTO contact_add VALUES ('Salalah - New Salalah', 8);
INSERT INTO contact_add VALUES ('Barka - Al Rumais', 9);
INSERT INTO contact_add VALUES ('Rustaq - Souq Area', 10);

-- SALARY_BONUS
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_seq.NEXTVAL, 950, 11400, 300, 1, 1);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_seq.NEXTVAL, 750, 9000, 200, 2, 3);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_seq.NEXTVAL, 850, 10200, 250, 3, 4);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_seq.NEXTVAL, 650, 7800, 150, 4, 5);
INSERT INTO SALARY_BONUS VALUES (SALARY_BONUS_seq.NEXTVAL, 900, 10800, 280, 5, 6);

-- QUALIFICATION
INSERT INTO QUALIFICATION VALUES (qual_ID_seq.NEXTVAL, 'Bachelor in IT', DATE '2024-06-15', 1);
INSERT INTO QUALIFICATION VALUES (qual_ID_seq.NEXTVAL, 'Diploma in HR', DATE '2022-09-10', 3);
INSERT INTO QUALIFICATION VALUES (qual_ID_seq.NEXTVAL, 'Bachelor in Accounting', DATE '2021-05-20', 4);
INSERT INTO QUALIFICATION VALUES (qual_ID_seq.NEXTVAL, 'Business Administration', DATE '2020-11-01', 5);
INSERT INTO QUALIFICATION VALUES (qual_ID_seq.NEXTVAL, 'Operations Management', DATE '2019-08-25', 6);

-- REQUIREMENTS
INSERT INTO requirements VALUES ('Programming skills', 1);
INSERT INTO requirements VALUES ('Database knowledge', 1);
INSERT INTO requirements VALUES ('Recruitment knowledge', 2);
INSERT INTO requirements VALUES ('Payroll experience', 3);
INSERT INTO requirements VALUES ('Office management skills', 4);
INSERT INTO requirements VALUES ('Operations planning', 5);

-- PAYROLL
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'January payroll', DATE '2026-01-31', 1250, 1, 1, 1);
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'February payroll', DATE '2026-02-28', 1250, 1, 1, 1);
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'January payroll', DATE '2026-01-31', 950, 3, 2, 2);
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'February payroll', DATE '2026-02-28', 950, 3, 2, 2);
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'January payroll', DATE '2026-01-31', 1100, 4, 3, 3);
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'February payroll', DATE '2026-02-28', 1100, 4, 3, 3);
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'January payroll', DATE '2026-01-31', 800, 5, 4, 4);
INSERT INTO PAYROLL VALUES (payroll_ID_seq.NEXTVAL, 'January payroll', DATE '2026-01-31', 1180, 6, 5, 5);

-- LEAVE
INSERT INTO LEAVE VALUES (leave_ID_seq.NEXTVAL, 'Medical leave', DATE '2026-02-05', 1, 1);
INSERT INTO LEAVE VALUES (leave_ID_seq.NEXTVAL, 'Annual leave', DATE '2026-02-12', 3, 3);
INSERT INTO LEAVE VALUES (leave_ID_seq.NEXTVAL, 'Emergency leave', DATE '2026-03-01', 4, 5);
INSERT INTO LEAVE VALUES (leave_ID_seq.NEXTVAL, 'Family reason', DATE '2026-03-08', 5, 7);
INSERT INTO LEAVE VALUES (leave_ID_seq.NEXTVAL, 'Annual leave', DATE '2026-03-15', 6, 8);

COMMIT;

------------------------------- # (a) List all employees whose age is between 25 and 40, ordered by last name ascending.
SELECT emp_ID, fname, lname, age
FROM EMPLOYEE
WHERE age BETWEEN 25 AND 40
ORDER BY lname ASC;
------------------------------- #(b) Retrieve all payroll records where total_amount exceeds 5000, showing employee name and department.
SELECT e.fname, e.lname, j.job_dept, p.total_amount
FROM PAYROLL p
JOIN EMPLOYEE e
    ON p.emp_ID = e.emp_ID
JOIN JOB_DEPARTMENT j
    ON p.job_ID = j.job_ID
WHERE p.total_amount > 5000;
------------------------------- #(c) Find all employees who have taken leave with reason containing the word 'sick' (case-insensitive). I have change to emrgency because there is no sick reson.
SELECT DISTINCT e.emp_ID, e.fname, e.lname, l.reason
FROM EMPLOYEE e
JOIN LEAVE l
    ON e.emp_ID = l.emp_ID
WHERE UPPER(l.reason) LIKE '%EMERGENCY%';
------------------------------- #(d) List all departments that have no employees assigned. (Use outer join or NOT EXISTS.) USING LEFT JOIN
SELECT j.job_ID, j.job_dept, j.name
FROM JOB_DEPARTMENT j LEFT JOIN EMPLOYEE e
    ON j.job_ID = e.job_ID
WHERE e.emp_ID IS NULL;
--------------------------------#Write UPDATE statements for the following business scenarios:
-----#Give a 10% salary increase to all employees in the 'Engineering' department.
UPDATE SALARY_BONUS
SET amount = amount * 1.10,
    annual = annual * 1.10
WHERE job_ID IN (
    SELECT job_ID
    FROM JOB_DEPARTMENT
    WHERE job_dept = 'IT'
);
----#Update the emp_email of all employees to lowercase using Oracle's LOWER() function.
UPDATE EMPLOYEE
SET emp_email = LOWER(emp_email);
----#Set the salary_range in JOB_DEPARTMENT to 'REVISED' for any department whose average total payroll exceeds 8000.
UPDATE JOB_DEPARTMENT
SET salary_range = 'REVISED'
WHERE job_ID IN (
    SELECT job_ID
    FROM PAYROLL
    GROUP BY job_ID
    HAVING AVG(total_amount) > 8000
);
COMMIT;

--------#Write DELETE statements for the following:
----# Delete all LEAVE records older than 2 years from today.
SELECT *
FROM LEAVE
WHERE leave_date < ADD_MONTHS(SYSDATE, -24);
---
DELETE FROM LEAVE
WHERE leave_date < ADD_MONTHS(SYSDATE, -24);
---
SELECT COUNT(*) AS remaining_leave_records
FROM LEAVE;
----# Delete QUALIFICATION records for employees who no longer exist in the EMPLOYEE table.
SELECT *
FROM QUALIFICATION q
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE e
    WHERE e.emp_ID = q.emp_ID
);
---
DELETE FROM QUALIFICATION q
WHERE NOT EXISTS (
    SELECT 1
    FROM EMPLOYEE e
    WHERE e.emp_ID = q.emp_ID
);
---
SELECT COUNT(*) AS remaining_qualifications
FROM QUALIFICATION;
COMMIT;