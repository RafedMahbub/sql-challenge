--Analysis 1:  Perform an INNER JOIN on employee and salaries to 
--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s ON
s.emp_no = e.emp_no;

--Analysis 2: List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date FROM employees WHERE hire_date LIKE '%1986';

-- Analysis 3: Perform an INNER JOIN on dept_manager, department and employees to
-- List the manager of each department along with 
-- their department number, department name, employee number, last name, and first name.
SELECT d.emp_no, d.dept_no, dp.dept_name, e.last_name, e.first_name
FROM dept_manager as d
INNER JOIN departments as dp ON
d.dept_no = dp.dept_no
INNER JOIN employees as e ON
d.emp_no = e.emp_no;

--Analysis 4: Perform an INNER JOIN on dept_emp, employees and department to
--List the department number for each employee along with 
--that employee’s employee number, last name, first name, and department name.
SELECT de.emp_no, de.dept_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no;

--Analysis 5: List first name, last name, and sex of each employee
--whose first name is Hercules and whose last name begins with the letter B
SELECT first_name, last_name, sex FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Analysis 6: List each employee in the Sales department,
--including their employee number, last name, and first name.
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--Analysis 7:List each employee in the Sales and Development departments,
--including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
INNER JOIN employees as e ON
de.emp_no = e.emp_no
INNER JOIN departments as d ON
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

--Analysis 8: List the frequency counts, in descending order, of all the employee last names.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;