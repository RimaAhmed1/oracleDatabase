---- JOB_DEPARTMENT create Table #
CREATE TABLE JOB_DEPARTMENT (
    job_ID NUMBER(5) PRIMARY KEY,
    job_dept VARCHAR2(50) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    description VARCHAR2(255),
    salary_range VARCHAR2(20)
);
CREATE SEQUENCE job_department_seq
START WITH 1
INCREMENT BY 1;
---- EMPLOYEE create Table #

CREATE TABLE EMPLOYEE (
    emp_ID NUMBER(5) PRIMARY KEY,
    fname VARCHAR2(50) NOT NULL,
    lname VARCHAR2(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    age NUMBER(2) NOT NULL,
    emp_email VARCHAR2(50) NOT NULL,
    emp_pass VARCHAR2(50) NOT NULL,
    job_ID NUMBER(5),

CONSTRAINT chk_employee_gender
    CHECK (gender IN ('M', 'F')),
    
CONSTRAINT fk_employee_job
    FOREIGN KEY (job_ID)
    REFERENCES JOB_DEPARTMENT(job_ID)
);

CREATE SEQUENCE EMPLOYEE_seq
START WITH 1
INCREMENT BY 1;
---- contact_add create Table #
CREATE TABLE contact_add (
    contact_add VARCHAR2(100),
    emp_ID NUMBER(5),
    
CONSTRAINT pk_contact_add
    PRIMARY KEY (contact_add, emp_ID),
        
CONSTRAINT fk_contact_add_employee
    FOREIGN KEY (emp_ID)
    REFERENCES EMPLOYEE(emp_ID)
    );

----------- SALARY_BONUS create Table #
CREATE TABLE SALARY_BONUS (
    salary_ID NUMBER(5) PRIMARY KEY,
    amount NUMBER(10,2) NOT NULL,
    annual NUMBER(10,2) NOT NULL,
    bonus NUMBER(10,2),
    job_ID NUMBER(5),
    emp_ID NUMBER(5),
    
CONSTRAINT chk_salary_amount
        CHECK (amount > 0),
        
CONSTRAINT fk_salary_bonus_employee
  FOREIGN KEY (emp_ID)
  REFERENCES EMPLOYEE(emp_ID),
  
CONSTRAINT fk_salary_bonus_job
  FOREIGN KEY (job_ID)
  REFERENCES JOB_DEPARTMENT(job_ID)
);
CREATE SEQUENCE SALARY_BONUS_seq
START WITH 1
INCREMENT BY 1;
--------------- QUALIFICATION create Table #
CREATE TABLE QUALIFICATION (
    qual_ID NUMBER(5)PRIMARY KEY,
    position VARCHAR2(50) NOT NULL,
    date_in DATE NOT NULL,
    emp_ID NUMBER(5)NOT NULL,

CONSTRAINT fk_QUALIFICATION_employee
  FOREIGN KEY (emp_ID)
  REFERENCES EMPLOYEE(emp_ID)
  

);
CREATE SEQUENCE qual_ID_seq
START WITH 1
INCREMENT BY 1;
-------------------- requirements create Table #
CREATE TABLE requirements (
    requirement VARCHAR2(100),
    qual_ID NUMBER(5),
    
CONSTRAINT pk_requirements
    PRIMARY KEY (requirement, qual_ID),
        
CONSTRAINT fk_requirements_QUALIFICATION
    FOREIGN KEY (qual_ID)
    REFERENCES QUALIFICATION(qual_ID)
    );
-------------------- PAYROLL create Table #
CREATE TABLE PAYROLL (
    payroll_ID NUMBER(5) PRIMARY KEY,
    report VARCHAR2(50) NOT NULL,
    payroll_date DATE NOT NULL,
    total_amount NUMBER(10,2) NOT NULL,
    emp_ID NUMBER(5) NOT NULL,
    job_ID NUMBER(5) NOT NULL,
    salary_ID NUMBER(5) NOT NULL,

CONSTRAINT fk_payroll_employee
    FOREIGN KEY (emp_ID)
    REFERENCES EMPLOYEE(emp_ID),

CONSTRAINT fk_payroll_job
    FOREIGN KEY (job_ID)
    REFERENCES JOB_DEPARTMENT(job_ID),
    
CONSTRAINT fk_payroll_salary_bonus
    FOREIGN KEY (salary_ID)
    REFERENCES SALARY_BONUS(salary_ID)
);

CREATE SEQUENCE payroll_ID_seq
START WITH 1
INCREMENT BY 1;
-------------------- LEAVE create Table #
CREATE TABLE LEAVE (
  leave_ID NUMBER(5) PRIMARY KEY,
    reason VARCHAR2(50) NOT NULL,
    leave_date DATE NOT NULL,
    emp_ID NUMBER(5) NOT NULL,
    payroll_ID NUMBER(5) NOT NULL,

    CONSTRAINT fk_leave_employee
        FOREIGN KEY (emp_ID)
        REFERENCES EMPLOYEE(emp_ID),

    CONSTRAINT fk_leave_payroll
        FOREIGN KEY (payroll_ID)
        REFERENCES PAYROLL(payroll_ID)
);

CREATE SEQUENCE leave_ID_seq
START WITH 1
INCREMENT BY 1;