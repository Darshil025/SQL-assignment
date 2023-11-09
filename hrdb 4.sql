use hrdb;

--- 01.Write a query to display the last name, department number, department name for all employees.
select e.last_name,d.department_id,d.department_name from employees e join departments d on e.department_id=d.department_id order by 1;


--- 02.Create a unique list of all jobs that are in department 80 Include the location of the department in the output.
 select distinct e.job_id,d.location_id from employees e join departments d where e.department_id=d.department_id and e.department_id = 80;
  
  
 --- 03. Write a query to display the employee last name, department name, location ID, and city of all employees who earn a commission.
select e.last_name, d.department_name, d.location_id, l.city from employees e, departments d, locations l
where e.department_id = d.department_id and d.location_id = l.location_id and e.commission_pct is not null;


--- 04.Display the employee last name and department name of all employees who have an 'a' in their last name
select e.last_name,d.department_name from employees e join departments d where e.department_id=d.department_id and e.last_name like "%a%";


--- 05.Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA.
select 	e.last_name, e.job_id, e.department_id,d.department_name from employees e join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id where l.city = 'atlanta';


--- 06.Display the employee last name and employee number along with their manager last name and manager number.
select e.last_name 'EMP_Name',e.employee_id 'EMP_id',m.last_name 'Manager_Name',m.employee_id 'Manager_id'
from employees e join employees m on e.employee_id=m.manager_id; 


--- 07.Display the employee last name and employee number along with their manager last name and manager number (including the employees who have no manager). 
select e.last_name 'EMP_Name',e.employee_id 'EMP_id',m.last_name 'Manager_Name',m.employee_id 'Manager_id'
from employees e left outer join employees m on e.employee_id=m.manager_id; 


--- 08.Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee. 
select e.department_id 'Department_number',e.last_name 'Employee',s.last_name 'Other_Emp' from employees e join employees s
on e.department_id=s.department_id  where e.employee_id <> s.employee_id order by 2,1,3;


--- 09.Displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) 
select concat(e.first_name,' ',e.last_name) 'Emp_Name',	e.job_id,d.department_name,e.salary,
case
	when salary>= 50000 then "A"
    when salary>= 30000 then "B"
    else "C"
end "Grade_Level"    
from employees e join departments d on e.department_id=d.department_id;


--- 10.Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date. 
---    Label the columns as Employee name, emp_hire_date,manager name,man_hire_date.
select concat(e.first_name,' ',e.last_name) "Employee Name",e.hire_date "Emp_Hire_Date",concat(m.first_name,' ',m.last_name) "Manager Name",m.hire_date 'Manager_Hire_Date'
from employees e join employees m on e.manager_id=m.employee_id where e.hire_date < m.hire_date;
