-- Queries

-- Question 1: List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no,last_name,first_name,sex,salary
from employees e
join salaries s on e.emp_no = s.emp_no;

--Question2: List the first name, last name, and hire date for the employees who were hired in 1986. Ordered by hire date ascending for readability.
select first_name,last_name,hire_date
from employees
where hire_date between '1986-01-01' and '1986-12-31'
order by hire_date asc

--Quest 3: List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dm.dept_no,d.dept_name, e.emp_no,e.last_name,e.first_name
from dept_manager dm
join departments d on dm.dept_no = d.dept_no
join employees e on dm.emp_no = e.emp_no

--Question 4:List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select de.dep_no,de.emp_no,e.last_name,e.first_name,d.dept_name
from dept_emp de
join departments d on de.dep_no = d.dept_no
join employees e on de.emp_no = e.emp_no

--Question 5: List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B. Ordered ny last name alphabetically for readability.
select first_name,last_name,sex
from employees
where first_name = 'Hercules' and last_name like 'B%'
order by last_name asc

--Question 6: List each employee in the Sales department, including their employee number, last name, and first name.
select de.emp_no, e.last_name,e.first_name
from dept_emp de
join employees e on de.emp_no = e.emp_no
where de.dep_no = 'd007' --sales department code

--Question 7: List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select de.emp_no, e.last_name,e.first_name,d.dept_name
from dept_emp de
join employees e on de.emp_no = e.emp_no
join departments d on de.dep_no = d.dept_no
where de.dep_no = 'd007' or de.dep_no = 'd005' --sales and development department codes

--Question 8: List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name). Ordered by count descending for readability.
select last_name, count(last_name) as num_count
from employees
group by last_name
order by num_count desc --Baba is most common last name. 
