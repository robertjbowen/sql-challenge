-- Drop table if exists
DROP TABLE titles, employees, dept_emp, departments, dept_manager, salaries;

-- Create new tables
CREATE TABLE titles (
	title_id VARCHAR (10) PRIMARY KEY NOT NULL,
	title VARCHAR (30)
);

CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title VARCHAR (10),
	birth_date DATE,
	first_name VARCHAR (30),
	last_name VARCHAR (30),
	sex VARCHAR,
	hire_date DATE,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id)
);

CREATE TABLE departments (
	dept_no VARCHAR (5) PRIMARY KEY NOT NULL,
	dept_name VARCHAR (30)
);

CREATE TABLE dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR (5) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR (5) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE salaries (
	emp_no INT NOT NULL,
	salary MONEY,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- View new tables
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
