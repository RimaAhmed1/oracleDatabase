---Create a one-time DBMS_SCHEDULER job named JOB_GREET_EMPLOYEES that runs 2 minutes from now and executes an anonymous PL/SQL block that prints 'Payroll System Initialized' to DBMS_OUTPUT and inserts a record into EMPLOYEE_LOG.
BEGIN
DBMS_SCHEDULER.CREATE_JOB(
job_name => 'JOB_GREET_EMPLOYEES',
job_type => 'PLSQL_BLOCK',
job_action => 'BEGIN ... END;',
start_date => SYSTIMESTAMP + INTERVAL ''2'' MINUTE,
enabled => TRUE),
);
END;
--After the job runs, query USER_SCHEDULER_JOB_LOG to confirm execution status
BEGIN
    DBMS_SCHEDULER.CREATE_JOB(
        job_name   => 'JOB_GREET_EMPLOYEES',
        job_type   => 'PLSQL_BLOCK',
        job_action => '
        BEGIN
            INSERT INTO EMPLOYEE_LOG(log_id, emp_ID, action, log_timestamp)
            VALUES(EMPLOYEE_LOG_SEQ.NEXTVAL, NULL, ''Payroll System Initialized'', SYSTIMESTAMP);
            COMMIT;
        END;',
        start_date => SYSTIMESTAMP + NUMTODSINTERVAL(2, 'MINUTE'),
        enabled    => TRUE
    );
END;
/

---
SELECT *
FROM EMPLOYEE_LOG
ORDER BY log_id DESC;
--# The DBMS_SCHEDULER job executed successfully and inserted a log record into EMPLOYEE_LOG with the action "Payroll System Initialized". The execution was verified by querying the EMPLOYEE_LOG table, which showed the new log entry.

--Create a recurring DBMS_SCHEDULER job named JOB_DAILY_LEAVE_REPORT that:
--• Runs every day at 07:00 AM.
--• Calls the procedure SP_PROCESS_PAYROLL or simply counts leave records taken that day and inserts a
--summary into EMPLOYEE_LOG.
--Use a repeat interval: FREQ=DAILY; BYHOUR=7; BYMINUTE=0; BYSECOND=0.
--Show the job definition using: SELECT * FROM USER_SCHEDULER_JOBS WHERE JOB_NAME ='JOB_DAILY_LEAVE_REPORT;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
      job_name   => 'JOB_DAILY_LEAVE_REPORT',
      job_type   => 'PLSQL_BLOCK',
      job_action => '
        DECLARE
            v_count NUMBER;
        BEGIN
            SELECT COUNT(*)
            INTO v_count
            FROM LEAVE
            WHERE TRUNC(leave_date) = TRUNC(SYSDATE);

            INSERT INTO EMPLOYEE_LOG(log_id,emp_ID,action,log_timestamp)
            VALUES(EMPLOYEE_LOG_SEQ.NEXTVAL,NULL,''Daily Leave Count: '' || v_count,SYSTIMESTAMP );

            COMMIT;
        END;',
        start_date      => SYSTIMESTAMP,
        repeat_interval => 'FREQ=DAILY;BYHOUR=7;BYMINUTE=0;BYSECOND=0',
        enabled         => TRUE
    );
END;
/

---
SELECT *
FROM USER_SCHEDULER_JOBS
WHERE JOB_NAME = 'JOB_DAILY_LEAVE_REPORT';

SELECT job_name, enabled, repeat_interval, state
FROM USER_SCHEDULER_JOBS
WHERE JOB_NAME = 'JOB_DAILY_LEAVE_REPORT';