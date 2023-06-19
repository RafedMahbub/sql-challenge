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

--Analysis 1:  Perform an INNER JOIN on employee and salaries
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
s.emp_no = e.emp_no;

--Analysis 2:
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date LIKE '%1986';

----Analysis 3: Perform an INNER JOIN on dept_manager, department and employees
SELECT d.emp_no, d.dept_no, dp.dept_name, e.last_name, e.first_name
FROM dept_manager as d
INNER JOIN departments as dp ON
d.dept_no = dp.dept_no
INNER JOIN employees as e ON
d.emp_no = e.emp_no;

----Analysis 4: Perform an INNER JOIN on dept_emp, employees and department
SELECT de.emp_no, de.dept_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no;

--Analysis 5:
SELECT first_name, last_name, sex FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Analysis 6:
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--Analysis 7:
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

--Analysis 8:
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;