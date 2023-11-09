use hrdb;

--- 01.Write a query to display the last name and hire date of any employee in the same department as SALES. 
select last_name,hire_date,department_name from employees join departments where department_name = 'sales';

--- 02.Display the employee numbers and lastname of all employees who earn more than the average salary.Sort the results in ascending order of salary.
select employee_id,last_name,salary from employees where salary > (select avg(salary) from employees) order by salary;

--- 03.Displays the employee numbers and last names of all employees who work in a department with any employee whose lastname contains a 'u'. 
select employee_id,last_name from employees where department_id in (select department_id from employees where last_name like '%u%');

--- 04.Display the last name, department number, and job ID of all employees whose department location id is 1700.
select last_name,department_id,job_id from employees where department_id in (select department_id from departments where location_id=1700);

--- 05.Display the last name and salary of every employee who reports to FILLMORE. 
select last_name,salary from employees where manager_id in (select employee_id from employees where last_name ="fillmore");

--- 06.Display the department number, last name, and job ID for every employee in the OPERATIONS department.
select department_id,last_name,job_id from employees where department_id in (select department_id from departments where department_name = "operations");

--- 07.Display the employee numbers, last names, and salaries of all employees who earn more than the average salary and
---    who work in a department with any employee with a 'u'in their name.
select employee_id,last_name,salary from employees
where department_id in (select department_id from employees where last_name like "%u%") and salary > (select avg(salary) from employees);

--- 08.Display the names of all employees whose job title is the same as anyone in the sales dept.                      
select concat(first_name,' ',last_name) "Emp_Name" from employees 
where department_id in (select department_id from departments  where department_name = 'sales');

--- 09. Write a compound query to produce a list of employees showing raise percentages, employee IDs, and salaries. Employees in department 1 and 3
--- are given a 5% raise, employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise, and employees in department 6 are not given a raise
select employee_id,salary,(salary*0.05) "pay raise" from employees where department_id in (10,30)
union all
select employee_id,salary,(salary*0.1) "pay raise" from employees where department_id=20
union all
select employee_id,salary,(salary*0.15) "pay raise" from employees where department_id in (40,50);


--- 10.Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.
select distinct salary,last_name from employees order by salary desc limit 4; 

--- 11.Display the names of all employees with their salary and commission earned.Employees with a null commission should have O in the commission column
select concat(first_name,' ',last_name) "Full Name",salary,coalesce(commission_pct,0) from employees;

--- 12.Display the Managers (name) with top three salaries along with their salaries and department information
select distinct e.salary,concat(e.first_name,' ',e.last_name) "Manager Name",e.department_id,d.department_name,d.manager_id 
from employees e join employees m join departments d on d.manager_id = e.manager_id
where m.manager_id=e.employee_id order by salary desc limit 4;