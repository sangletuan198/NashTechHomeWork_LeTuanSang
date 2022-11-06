-- Question 1

-- Way 1:

Select last_name, hire_date
from employees
where department_id in (Select department_id From employees where last_name = 'Zlotkey')
  and last_name <> 'Zlotkey';

--W2:

Select last_name, hire_date
From employees
Where department_id in (Select department_id From employees Where last_name = 'Zlotkey') 
And last_name != 'Zlotkey';

--W3:

Select e1.last_name, e1.hire_date
From employees e1
         Join employees e2
              On e1.department_id = e2.department_id
Where e1.last_name != 'Zlotkey'
And e2.last_name = 'Zlotkey';

--Question 2

Select employee_id, last_name, salary
From employees
Where salary > (Select AVG(salary) From employees)
Order by salary ASC;

--Question 3

Select employee_id, last_name
From employees
Where department_id in (Select department_id From employees Where last_name like '%u%');

--Question 4

--w1:

Select last_name, department_id, job_id
From employees
where department_id in (Select department_id From departments where location_id = 1700);

--w2:

Select last_name, departments.department_id, job_id
From (employees inner join departments on employees.department_id = departments.department_id)
Where location_id = '1700';

--Question 5

-- W1:

Select last_name, salary
From employees
Where manager_id in (Select employee_id From employees where last_name = 'king')

--W2:

select em.last_name, em.salary
from employees em
         inner join employees manager on manager.employee_id = em.manager_id
where manager.last_name = 'King';

--Question 6

Select e.department_id, last_name, job_id
From employees e
         Join departments d on e.department_id = d.department_id
Where department_name like '%Executive%';

--Question 7

Select employee_id, last_name, salary
From employees e
Where salary > (Select AVG(salary) From employees)
  And e.department_id
    In (Select department_id From employees Where last_name like '%u%');

--Question 8

Select ROUND(MAX(salary), 0) AS Maximum,
       ROUND(MIN(salary), 0) AS Minimum,
       ROUND(SUM(salary), 0) AS SUM,
       ROUND(AVG(salary), 0) AS Average
From employees;

--Question 9

Select ((UPPER(substring(last_name, 1, 1))) + (LOWER(substring(last_name, 2, LEN(last_name))))) AS Last_name,
       LEN(last_name)                                                                           AS Length_Name
From employees
Where (substring(last_name, 1, 1))
    Like 'J'
   OR (substring(last_name, 1, 1))
    Like 'A'
   OR (substring(last_name, 1, 1))
    Like 'M'
Order by last_name ASC;

-- Question 10

Select employee_id, last_name, salary, Format(salary + (salary * 15.5 / 100), 'N2') AS New_Salary
From employees;

--Question 11

--Question 12

Select e1.employee_id
From employees e1
         Inner join employees manager on manager.employee_id = e1.manager_id
Where e1.hire_date > manager.hire_date
Union
Select e2.employee_id
From employees e2
         Inner join departments d on e2.department_id = d.department_id
         Inner join locations l on d.location_id = l.location_id
Where city = 'Toronto';