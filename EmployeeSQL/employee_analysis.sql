--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees 
INNER JOIN salaries ON 
employees.emp_no= salaries.emp_no;

SELECT * FROM employees

--List first name, last name, and hire date for employees who were hired in 1986.
--https://www.postgresqltutorial.com/postgresql-split_part/
SELECT first_name, last_name, hire_date
FROM employees
WHERE split_part(hire_date::TEXT,'/',3) = '1986'

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--DROP VIEW manager_info;

CREATE VIEW manager_info AS
SELECT e.emp_no,e.first_name,e.last_name,d.dept_no,d.dept_name
FROM employees e
JOIN dept_managers m
ON(e.emp_no=m.emp_no)
	JOIN departments d
	ON(m.dept_no=d.dept_no);
	
SELECT * FROM manager_info;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
CREATE VIEW employee_info AS 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_employees de
ON (de.employee_no=e.emp_no)
	JOIN departments d
	ON (d.dept_no=de.dept_no);
	
SELECT * FROM employee_info;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE last_name LIKE 'B%'
AND first_name = 'Hercules';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.first_name,e.last_name, d.dept_name 
FROM employees e
JOIN dept_employees de
ON (de.employee_no=e.emp_no)
	JOIN departments d 
	ON(de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.first_name,e.last_name, d.dept_name 
FROM employees e
JOIN dept_employees de
ON (de.employee_no=e.emp_no)
	JOIN departments d 
	ON(de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
OR d.dept_name='Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECt last_name,  COUNT (last_name) as count_ln
FROM employees
GROUP BY last_name
ORDER BY "count_ln" DESC;
	