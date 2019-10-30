-- List details of each employee: employee number, last name, first name, gender, salary
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employeepersonalinfo as e
full outer join salaries as s
on e.emp_no = s.emp_no;

-- List employees hired in 1986
select first_name, last_name
from employeepersonalinfo
where '[1986-01-01, 1986-12-31]'::daterange @> hire_date;

-- List the manager of e/department with its: department number, department name, 
-- the manager's employee number, last name, first name, start and employment dates

select man.dept_no,  dep.dept_name, man.emp_no, emp.last_name, emp.first_name, man.from_date, man.to_date
from managerbydepthistory as man
full outer join departments as dep
on man.dept_no = dep.dept_no
inner join employeepersonalinfo as emp
on man.emp_no = emp.emp_no;

-- List the department of each employee with the following:
-- employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employeepersonalinfo as emp
full outer join employeesbydepthistory as empdep
on emp.emp_no = empdep.emp_no
inner join departments as dep
on empdep.dept_no = dep.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name
from employeepersonalinfo
where first_name = 'Hercules' and last_name::text LIKE 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employeepersonalinfo as emp
full outer join employeesbydepthistory as empdep
on emp.emp_no = empdep.emp_no
inner join departments as dep
on empdep.dept_no = dep.dept_no
where dept_name = 'Sales';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

select emp.emp_no, emp.last_name, emp.first_name, dep.dept_name
from employeepersonalinfo as emp
full outer join employeesbydepthistory as empdep
on emp.emp_no = empdep.emp_no
inner join departments as dep
on empdep.dept_no = dep.dept_no
where dept_name = 'Sales' or dept_name = 'Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name)
from employeepersonalinfo
group by last_name
order by COUNT;

