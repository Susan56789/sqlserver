CREATE VIEW [Payment] AS
	  SELECT emp_name,net_salary
	  FROM
	  department INNER JOIN
       employee ON department.dept_id = employee.dept_id INNER JOIN
      paydetails ON department.dept_id = paydetails.dept_id AND employee.emp_id = paydetails.emp_id INNER JOIN
      payroll ON employee.emp_id = payroll.emp_id;
