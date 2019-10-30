CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (dept_no)
);


-- dept_emp file
CREATE TABLE EmployeesByDeptHistory (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

-- dept_manager file 
CREATE TABLE ManagerByDeptHistory (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

CREATE TABLE EmployeePersonalInfo (
    emp_no INT   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_EmployeePersonalInfo PRIMARY KEY (emp_no)
);

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);


CREATE TABLE JobTitles (
    emp_no INT   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date date   NOT NULL,
    to_date date   NOT NULL
);

ALTER TABLE EmployeesByDeptHistory ADD CONSTRAINT fk_EmployeesByDeptHistory_emp_no FOREIGN KEY(emp_no)
REFERENCES EmployeePersonalInfo (emp_no);

ALTER TABLE EmployeesByDeptHistory ADD CONSTRAINT fk_EmployeesByDeptHistory_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE ManagerByDeptHistory ADD CONSTRAINT fk_ManagerByDeptHistory_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE ManagerByDeptHistory ADD CONSTRAINT fk_ManagerByDeptHistory_emp_no FOREIGN KEY(emp_no)
REFERENCES EmployeePersonalInfo (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES EmployeePersonalInfo (emp_no);

ALTER TABLE JobTitles ADD CONSTRAINT fk_JobTitles_emp_no FOREIGN KEY(emp_no)
REFERENCES EmployeePersonalInfo (emp_no);
