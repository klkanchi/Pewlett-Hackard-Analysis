--checking the table contents in each of the existing tables
SELECT * FROM departments;
SELECT * FROM employee;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM titles;
SELECT * FROM departmentemployee;
--create a retires title table and order	
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employee as e
LEFT JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows based on emp_no

SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title,
rt.from_date,
rt.to_date

INTO Unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

--number of employees by the recent title who retire and the count for each title
SELECT COUNT(title) FROM Unique_titles;

SELECT u.title,
COUNT(u.emp_no)
INTO retiring_titles_count
FROM unique_titles as u
GROUP BY u.title
ORDER BY COUNT(u.emp_no) DESC;

--Mentorship eligibity table
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty
FROM employee as e
LEFT JOIN departmentemployee as de
ON e.emp_no = de.emp_no
LEFT JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;
 

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
--recreateing retirement_info table to include the emp_no
DROP TABLE retirement_info;
SELECT emp_no,first_name, last_name
INTO retirement_info
FROM employee
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
SELECT * FROM retirement_info;


--Joining departments and dept_manager tables
--The SELECT statement selects only the columns we want to view from each table.
--The FROM statement points to the first table to be joined, Departments (Table 1).
--has INNER JOIN points to the second table to be joined, dept_manager (Table 2).
--ON departments.dept_no = managers.dept_no; indicates where Postgres should look for matches
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
    retirement_info.last_name,
    departmentemployee.to_date
FROM retirement_info
LEFT JOIN departmentemployee
ON retirement_info.emp_no = departmentemployee.emp_no;

--alias 
--FROM retirement_info as ri
--LEFT JOIN dept_emp as de

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN departmentemployee as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01')

--using groupby to get the employees retiring by department
SELECT COUNT(ce.emp_no),de.dept_no
INTO retiring_emp_bydept
FROM current_emp as ce
LEFT JOIN departmentemployee as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries
ORDER BY to_date DESC;

--employee with the salary info along with first and last name 
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employee as e
INNER JOIN salaries as s
ON (e.emp_no=s.emp_no)
INNER JOIN departmentemployee as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');
	
--management information
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info

FROM dept_manager as dm
	INNER JOIN departments as d
		ON (dm.dept_no=d.dept_no)
	INNER JOIN current_emp as ce
		ON (dm.emp_no=ce.emp_no);
		
--Department Retirees
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN departmentemployee as de
ON (ce.emp_no =de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no);

--get the retiring emp list from the sales department

SELECT ri.emp_no,
ri.first_name,
ri.last_name,
d.dept_name,
de.dept_no
INTO sales_dept_retirees
FROM retirement_info as ri
INNER JOIN departmentemployee as de
ON (ri.emp_no =de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales');

--get the retiring emp list from the sales and development department

SELECT ri.emp_no,
ri.first_name,
ri.last_name,
d.dept_name,
de.dept_no
INTO sales_develop_dept_retirees
FROM retirement_info as ri
INNER JOIN departmentemployee as de
ON (ri.emp_no =de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales','Development');


	
	
	
	







