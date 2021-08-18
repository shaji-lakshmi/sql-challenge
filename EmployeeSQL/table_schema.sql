CREATE TABLE Departments(
	dept_no VARCHAR PRIMARY KEY, 
	dept_name VARCHAR
);

SELECT * FROM departments

CREATE TABLE Titles(
	title_id VARCHAR PRIMARY KEY,
	title VARCHAR 
);

SELECT * FROM titles;

CREATE TABLE Employees(
	emp_no int PRIMARY KEY,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR, 
	hire_date VARCHAR,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

SELECT * FROM employees;

CREATE TABLE Dept_Managers(
	dept_no VARCHAR,
	emp_no int,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_managers;

CREATE TABLE Dept_Employees(
	employee_no int, 
	dept_no VARCHAR,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (employee_no) REFERENCES employees(emp_no)
);

SELECT * FROM dept_employees;

CREATE TABLE Salaries(
	emp_no int, 
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT * FROM salaries;