-- Deliverable 1, steps 1-7
SELECT employees.emp_no, employees.first_name, employees.last_name,
	titles.title, titles.from_date, titles.to_date
INTO retirement_titles
FROM employees
INNER JOIN titles ON employees.emp_no=titles.emp_no
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no ASC

-- Use Dictinct with Orderby to remove duplicate rows. Deliverable 1, steps 8-14
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO retirement_titles_unique
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC

-- Write another query in the to retrieve the number of employees by their most recent job title who are about to retire.
-- Deliverable 1, steps 15-20
SELECT COUNT(title) AS "count", title
INTO retiring_titles
FROM retirement_titles_unique
GROUP BY title
ORDER BY "count" DESC

-- Deliverable 2, steps 1-11
-- Write a query to create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program.
SELECT DISTINCT ON (employees.emp_no) employees.emp_no, employees.first_name, employees.last_name, employees.birth_date,
	dept_employee.to_date, dept_employee.from_date,
	titles.title
INTO mentorship_eligibilty
FROM employees
INNER JOIN dept_employee ON employees.emp_no=dept_employee.emp_no
INNER JOIN titles on employees.emp_no=titles.emp_no
WHERE dept_employee.to_date = ('9999-01-01')
AND (employees.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY employees.emp_no ASC

