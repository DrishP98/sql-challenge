--- Remove table, create each one, composite keys in one bracket for both columns, adjust columns, display tables

Drop table employees CASCADE;
Drop table departments CASCADE;
Drop table titles CASCADE;
Drop table dept_emp CASCADE;
Drop table salaries CASCADE;
Drop table dept_manager CASCADE;
--------------------------------------------------------------
--------------------------------------------------------------
CREATE TABLE departments(
	dept_no VARCHAR(5) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY (dept_no)
);

--------------------------------------------------------------
CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY (title_id)
);

--------------------------------------------------------------
CREATE TABLE employees(
	emp_no INT, 
	emp_title_id VARCHAR(5) NOT NULL, 
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL, 
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(2) NOT NULL, 
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);
------change datesyle as having datestyle error when importing csv to sql
SHOW datestyle;
ALTER DATABASE "sqlchallenege" SET datestyle TO "ISO, MDY";
-------------------------------------------------
CREATE TABLE dept_emp (
	emp_no INT NOT NULL, 
	dept_no VARCHAR(5) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

------------------------------------------------------------------
CREATE TABLE dept_manager(
	dept_no VARCHAR(5) NOT NULL, 
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no), 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

----------------------------------------------------------------------------
CREATE TABLE salaries(
	emp_no INT,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
---display the tables
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;	
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;------------------------

