-- Create 6 tables for employee database

-- Titles table
CREATE TABLE titles (
	title_id VARCHAR(5) NOT NULL PRIMARY KEY,
	title VARCHAR(20)
	);
	
-- Employees table
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(5) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30),  -- Import has missing first names.  Missing names = TRUE.
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1),
	hire_date DATE,
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
	);

-- Salaries table
-- emp_no is unique and so can be a primary key and a foreign key to the employees table
CREATE TABLE salaries (  
	emp_no INT NOT NULL,
	salary MONEY,
	PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);
	
-- Departments table
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(20)
	);
	
-- Department Manager table
-- Emp_no column has only unique values.  will be both primary and foreign key
-- Employee is only manager of 1 department, but departments can have more than one manager.
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL, -- if you are a manager on this list, you are a manager of a department.
	emp_no INT NOT NULL,
	PRIMARY KEY	(emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
	);
	
-- Department Employees table
-- needs primary key, needs a composite because both columns contain duplicate values.
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
	);
	
ALTER TABLE departments ALTER COLUMN dept_name SET NOT NULL;

ALTER TABLE titles ALTER COLUMN title SET NOT NULL;

ALTER TABLE employees ALTER COLUMN hire_date SET NOT NULL;

ALTER TABLE salaries ALTER COLUMN salary SET NOT NULL;