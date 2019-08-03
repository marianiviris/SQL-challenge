--Data Analysis
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--List the following details of each employee: employee number, last name, first name, gender, and salary.
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees e, salaries s
	where e.emp_no = s.emp_no;

--List employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date
from employees
	where hire_date > '1985-12-31' and
          hire_date < '1987-01-01';

--List the manager of each department with the following information: department number, department name, 
--    the manager's employee number, last name, first name, and start and end employment dates.
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
from departments d, employees e, manager m
	where d.dept_no = m.dept_no and
      	  e.emp_no = m.emp_no;

--List the department of each employee with the following information: employee number, last name, 
--    first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
	where e.emp_no = de.emp_no and
      	  d.dept_no = de.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
select emp_no, last_name, first_name
from employees
where first_name = 'Hercules' and
      last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
	where e.emp_no = de.emp_no and
          d.dept_no = de.dept_no
	group by e.emp_no, d.dept_name
	having d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, 
--    last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
	where e.emp_no = de.emp_no and
      	  d.dept_no = de.dept_no
	group by e.emp_no, d.dept_name
	having d.dept_name = 'Sales'
union all
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e, dept_emp de, departments d
	where e.emp_no = de.emp_no and
      	  d.dept_no = de.dept_no
	group by e.emp_no, d.dept_name
	having d.dept_name = 'Development';
	
		--ANOTHER SOLUTION
			select de.emp_no, e.last_name, e.first_name, d.dept_name
			from dept_emp de
				join employees e on de.emp_no = e.emp_no
				join departments d on de.dept_no = d.dept_no
				where d.dept_name = 'Sales' or d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name) as same_last_name
from employees
	group by last_name
order by same_last_name desc;

--Search your ID number.
select emp_no, last_name, first_name
from employees
	where emp_no = 499942
	--APRIL FOOLSDAY
