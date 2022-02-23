--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, last_name, first_name, sex, salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT dept_name, departments.dept_no, employees.emp_no, last_name, first_name
FROM employees
JOIN dept_manager_junction
ON employees.emp_no = dept_manager_junction.emp_no
JOIN departments
ON departments.dept_no = dept_manager_junction.dept_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp_junction
ON employees.emp_no = dept_emp_junction.emp_no
JOIN departments
ON departments.dept_no = dept_emp_junction.dept_no;

-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp_junction
ON employees.emp_no = dept_emp_junction.emp_no
JOIN departments
ON departments.dept_no = dept_emp_junction.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees.emp_no, last_name, first_name, dept_name
FROM employees
JOIN dept_emp_junction
ON employees.emp_no = dept_emp_junction.emp_no
JOIN departments
ON departments.dept_no = dept_emp_junction.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

--In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS "Count of Name"
FROM employees
GROUP BY last_name
ORDER BY "Count of Name" DESC;