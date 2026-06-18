--Create a stored procedure named SP_ADD_EMPLOYEE with IN parameters for all EMPLOYEE columns (except emp_ID which is auto-generated from a sequence).
--The procedure must:
--• Validate that emp_email is not already in use (raise an exception if duplicate).
--• Insert the new employee record.
--• Print a confirmation message using DBMS_OUTPUT.PUT_LINE.

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE SP_ADD_EMPLOYEE (
    p_fname     IN EMPLOYEE.fname%TYPE,
    p_lname     IN EMPLOYEE.lname%TYPE,
    p_gender    IN EMPLOYEE.gender%TYPE,
    p_age       IN EMPLOYEE.age%TYPE,
    p_emp_email IN EMPLOYEE.emp_email%TYPE,
    p_emp_pass  IN EMPLOYEE.emp_pass%TYPE,
    p_job_ID    IN EMPLOYEE.job_ID%TYPE
)
AS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM EMPLOYEE
    WHERE LOWER(emp_email) = LOWER(p_emp_email);

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Email already exists.');
    END IF;

    INSERT INTO EMPLOYEE (emp_ID, fname, lname, gender, age, emp_email, emp_pass, job_ID)
    VALUES (EMPLOYEE_seq.NEXTVAL, p_fname, p_lname, p_gender, p_age,LOWER(p_emp_email), p_emp_pass, p_job_ID);

    DBMS_OUTPUT.PUT_LINE('Employee added successfully: ' || p_fname || ' ' || p_lname);
END;
/
--Test by calling the procedure twice with the same email to confirm the exception fires
BEGIN
    SP_ADD_EMPLOYEE('Test', 'User', 'F', 28, 'test.user@gmail.com', 'pass123', 1);
END;
/

BEGIN
    SP_ADD_EMPLOYEE('Test2', 'User2', 'F', 30, 'test.user@gmail.com', 'pass456', 1);
END;
/


----# The first procedure call inserted the employee successfully.
----The second procedure call used the same email address, so the procedure raised a custom exception:
----ORA-20001: Email already exists.
----This confirms that the duplicate email validation works correctly.


--------------------------------
----Create a function named FN_NET_SALARY that accepts emp_ID as input and returns the employee's net salary(amount + bonus) as a NUMBER.
--Use it in a SELECT query to display all employees with their calculated net salary, ordered highest to lowest.

CREATE OR REPLACE FUNCTION FN_NET_SALARY (
    p_emp_ID IN NUMBER
)
RETURN NUMBER
IS
    v_net_salary NUMBER;
BEGIN
    SELECT NVL(amount,0) + NVL(bonus,0)
    INTO v_net_salary
    FROM SALARY_BONUS
    WHERE emp_ID = p_emp_ID;

    RETURN v_net_salary;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
END;
/

--SELECT 
SELECT FN_NET_SALARY(1)
FROM DUAL;
---#SELECT salary(amount + bonus)
SELECT e.emp_ID,
       e.fname || ' ' || e.lname AS full_name,
       FN_NET_SALARY(e.emp_ID) AS net_salary
FROM EMPLOYEE e
ORDER BY net_salary DESC;