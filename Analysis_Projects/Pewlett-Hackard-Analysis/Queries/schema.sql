--creating tables for PH-EmployeeDB

CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY (dept_no),
	UNIQUE(dept_name)
	
);
SELECT * FROM departments;
-- creating employee table
CREATE TABLE employee(
 	 emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
SELECT * FROM employee;
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
SELECT * FROM dept_manager;
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
    PRIMARY KEY (emp_no)
);
SELECT * FROM salaries;
CREATE TABLE titles(
	emp_no INT NOT NULL,
	title VARCHAR(40) NOT NULL,
	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
  	PRIMARY KEY (emp_no)
);
SELECT * FROM titles;
CREATE TABLE departmentemployee(
	emp_no INT NOT NULL,
    dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  	PRIMARY KEY (emp_no)
);
SELECT * FROM departmentemployee;
--select the employee names whose birthdate is between 1952-1955

SELECT first_name, last_name
FROM employee
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
--select the employee names whose birthdate is in 1952
SELECT first_name, last_name
FROM employee
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31'

--Retirement eligibility
SELECT first_name, last_name
FROM employee
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--Number of employees retiring
SELECT COUNT(first_name)
FROM employee
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
--save the list of employees eligible for retirement into a table
SELECT first_name, last_name
INTO retirement_info
FROM employee
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;
