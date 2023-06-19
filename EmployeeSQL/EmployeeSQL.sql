CREATE TABLE titles (
    title_id varchar(5)   NOT NULL,
    title varchar   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

SELECT * FROM titles;

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id varchar(5)   NOT NULL,
    birth_date varchar   NOT NULL,
    first_name varchar   NOT NULL,
    last_name varchar   NOT NULL,
    sex varchar(1)   NOT NULL,
    hire_date varchar NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM employees;

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM salaries;

CREATE TABLE departments (
    dept_no varchar(4)   NOT NULL,
    dept_name varchar   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

SELECT * FROM departments;

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no varchar(4)   NOT NULL
);

SELECT * FROM dept_emp;

CREATE TABLE dept_manager (
    dept_no varchar(4)   NOT NULL,
    emp_no int   NOT NULL
);

SELECT * FROM dept_manager;

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title FOREIGN KEY(emp_title)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);