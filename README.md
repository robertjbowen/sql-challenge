# sql-challenge

The purpose of this challenge is to create a database, design tables to hold data, import the data from CSV files into the database, design an ERD of the tables, and design sql queries to answer questions about the data.


## -- Data Engineering

This project involved creating a database using pgAdmin4 and creating six tables within the db Schema relating to employee records, titles, salaries, and department affiliation. A Entity Relationship diagram was developed to support the design and order of creation fro the new tables.

### Entity Relationship Diagram
![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/ERD.png)


Each table was created in order and the CSV data imported using the pgAdmin import/export tool. Once imported, the contents of each table was viewed to ensure correct import. 

The SQL script for creating the tables is in the CreateTables.sql file. 

***
## -- Data Analysis

The SQL script for creating the queries is in the DataAnalysis.sql file.
 
### -- Query #1
Question - List the following details of each employee: employee number, last name, first name, sex, and salary. 

Query Design - Simple join of the employees and salaries tables based on employee id numbers.


SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary

FROM employees

INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query1.png)
***
### -- Query #2
Question - List first name, last name, and hire date for employees who were hired in 1986.

Query Design - Simple filter of the employee table by the hire_date column using the first and last days of the year 1986 as the bounds of the filter.

SELECT first_name, last_name, hire_date

FROM employees

WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';  

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query2.png)
***
### -- Query #3
Question - List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

Query Design - Multiple joins: departments table to dept_manager table using the department number, and employees table using the employee id numbers.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name

FROM departments

INNER JOIN dept_manager ON departments.dept_no = dept_manager.dept_no

INNER JOIN employees ON dept_manager.emp_no = employees.emp_no;

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query3.png)
***
### -- Query #4
Question - List the department of each employee with the following information: employee number, last name, first name, and department name.

Query Design - Multiple joins: employees table to dept_emp table using the employee id numbers, and departments table using the department numbers.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name

FROM employees

INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no

INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query4.png)
***
### -- Query #5
Question - List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

Query Design - Filtered the employee table by first_name = 'Hercules, and last_name starts with 'B'.

SELECT first_name, last_name, sex

FROM employees

WHERE first_name = 'Hercules'

AND last_name like 'B%';

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query5.png)
***
### -- Query #6
Question - List all employees in the Sales department, including their employee number, last name, first name, and department name.

Query Design - Used the same query as Query 4 and then filtered the department name column using a where dept_name = 'sales'.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name

FROM employees

INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no

INNER JOIN departments ON dept_emp.dept_no = departments.dept_no

WHERE dept_name = 'Sales';

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query6.png)
***
### -- Query #7
Question - List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

Query Design - Used the same query as Query 4 and then filtered the department name column using a  where dept_name = 'sales' OR 'Development'.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name

FROM employees

INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no

INNER JOIN departments ON dept_emp.dept_no = departments.dept_no

WHERE dept_name = 'Sales'

OR dept_name = 'Development';

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query7.png)
***
### -- Query #8
Question - In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

Query Design - created a new column called name count to count the number of each last_name then grouped the employees table by last_name to get the total counts of each unique last name and then sorted the output table by name count from highest to lowest.

SELECT last_name, COUNT(last_name) AS name_count

FROM employees

GROUP BY last_name

ORDER BY "name_count" DESC;

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query8.png)

***
## -- Bonus

This portion of the challenge involved importing the database created during the data engineering portion of the project. Three tables salaries, employees, and titles were imported and merged based on emp_no and title_id/emp_title to create a combined_data dataframe. The salary data was cleaned to remove the "$" and "," symbols from the data string and then converted to a float type for analysis. 

The python script for creating the merge and the plots is in the sql_bonus.ipynb file.

1. The salary data was plotted in a histogram showing counts in $10,000 increments from $40,000 to $130,000. 

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/bonus_salary.png)

2. A reduced dataframe was created with just title and salary data and grouped by title to display in a bar chart showing average salary by job title.

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/bonus_title.png)

***
### Epilogue

Question - Search Your ID Number = 499942

![alt tag](https://github.com/robertjbowen/sql-challenge/blob/main/images/Query99.png)
