---Create a BEFORE INSERT trigger named TRG_EMP_ID on the EMPLOYEE table.
CREATE SEQUENCE EMP_SEQ
START WITH 1
INCREMENT BY 1;
--If the inserted emp_ID is NULL, the trigger should populate it from a sequence (EMP_SEQ.NEXTVAL).
CREATE OR REPLACE TRIGGER TRG_EMP_ID
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF :NEW.emp_ID IS NULL THEN
        :NEW.emp_ID := EMP_SEQ.NEXTVAL;
    END IF;
END;
/

--Test: INSERT an employee without specifying emp_ID and verify it was auto-assigned
INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID)
VALUES ('Lina', 'Alharthy', 'F', 27, 'lina@gmail.com', 'pass123', 1);
COMMIT;
SELECT emp_ID, fname, lname, emp_email
FROM EMPLOYEE
WHERE emp_email = 'lina@gmail.com';

--- HANDLE ERROR: ORA-00001: unique constraint
SELECT MAX(emp_ID) FROM EMPLOYEE;
DROP SEQUENCE EMP_SEQ;

CREATE SEQUENCE EMP_SEQ
START WITH 12
INCREMENT BY 1;

-----Create a table EMPLOYEE_LOG(log_id, emp_id, action, log_timestamp).
CREATE TABLE EMPLOYEE_LOG (
    log_id NUMBER(5) PRIMARY KEY,
    emp_ID NUMBER(5),
    action VARCHAR2(50),
    log_timestamp TIMESTAMP
);
--Create an AFTER INSERT trigger named TRG_EMP_WELCOME_LOG on EMPLOYEE that inserts a log row with action = 'NEW HIRE' whenever a new employee is added.
CREATE SEQUENCE EMPLOYEE_LOG_SEQ
START WITH 1
INCREMENT BY 1;
--
CREATE OR REPLACE TRIGGER TRG_EMP_WELCOME_LOG
AFTER INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO EMPLOYEE_LOG (
        log_id,
        emp_ID,
        action,
        log_timestamp
    )
    VALUES (
        EMPLOYEE_LOG_SEQ.NEXTVAL,
        :NEW.emp_ID,
        'NEW HIRE',
        SYSTIMESTAMP
    );
END;
/
--Test by inserting 2 employees and querying EMPLOYEE_LOG
INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID)
VALUES ('Mona', 'Alharthi', 'F', 25,'mona@gmail.com', 'pass123', 1);

INSERT INTO EMPLOYEE (fname, lname, gender, age, emp_email, emp_pass, job_ID)
VALUES ('Salim', 'Albalushi', 'M', 30,'salim@gmail.com', 'pass123', 2);

COMMIT;
---
SELECT *
FROM EMPLOYEE_LOG
ORDER BY log_id;