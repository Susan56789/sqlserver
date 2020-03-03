USE TakeawayAssignment;

CREATE TABLE employee
( emp_id INT  PRIMARY KEY NOT NULL,
emp_name char (20),
dept_id INT NOT NULL,
FOREIGN KEY(dept_id) REFERENCES department(dept_id)
);

INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(001,'Jane Okoth',1);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(002,'Moses Mwangi',2);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(003,'John Karina',3);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(004,'Purity Awiti',4);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(005,'Susan Wairimu',5);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(006,'Janae Mbugua',6);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(007,'Lewis Otieno',7);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(008,'Mark Maina',8);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(009,'Jane Okoth',9);
INSERT INTO employee(emp_id,emp_name,dept_id)
VALUES(010,'John Kariuki',10);

CREATE TABLE department
( dept_id INT PRIMARY KEY NOT NULL ,
dept_name char (20)
);

INSERT INTO department(dept_id,dept_name)
VALUES(01,'COMMUNICATION');
INSERT INTO department(dept_id,dept_name)
VALUES(02,'FINANCE');
INSERT INTO department(dept_id,dept_name)
VALUES(03,'MARKETING');
INSERT INTO department(dept_id,dept_name)
VALUES(04,'SPORTS');
INSERT INTO department(dept_id,dept_name)
VALUES(05,'COMMUNICATION');
INSERT INTO department(dept_id,dept_name)
VALUES(06,'SPORTS');
INSERT INTO department(dept_id,dept_name)
VALUES(07,'FINANCE');
INSERT INTO department(dept_id,dept_name)
VALUES(08,'MARKETING');
INSERT INTO department(dept_id,dept_name)
VALUES(09,'COMMUNICATION');
INSERT INTO department(dept_id,dept_name)
VALUES(10,'COMMUNICATION');

CREATE TABLE paydetails
( dept_id INT NOT NULL,
FOREIGN KEY(dept_id) REFERENCES department(dept_id),
emp_id INT NOT NULL,
FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
basics int ,
deductions int ,
additions int ,
DOJ date
);

INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(10000,500,1000,'2020-01-19',1,01);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(9000,400,1700,'2020-01-19',2,02);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(5000,500,120,'2020-02-29',3,03);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(7000,500,1000,'2020-01-23',4,04);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(7000,500,1510,'2020-01-29',5,05);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(80000,5000,15600,'2020-01-13',6,06);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(25000,5000,15000,'2020-01-12',7,07);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(21000,5000,15000,'2020-03-1',8,08);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(29000,5000,15000,'2020-02-19',9,09);
INSERT INTO paydetails(basics,deductions,additions,DOJ,emp_id,dept_id)
values(29000,5000,15000,'2020-03-19',10,010);


CREATE TABLE payroll
( 
emp_id INT NOT NULL,
FOREIGN KEY(emp_id) REFERENCES employee(emp_id),
pay_date date
);

INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-01-20',01);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-01-29',02);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-02-10',03);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-02-23',04);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-03-02',05);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-01-27',06);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-01-09',07);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-02-21',08);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-03-01',09);
INSERT INTO payroll(pay_date,emp_id)
VALUES('2020-02-29',010);

SELECT * FROM department;

SELECT * FROM employee;

SELECT * FROM paydetails;

SELECT * FROM payroll;

SELECT * FROM department ORDER BY dept_name DESC;

SELECT * FROM paydetails WHERE DOJ='2020-01-19';

SELECT * FROM paydetails WHERE basics >=10000 AND basics<=20000;

SELECT 
COUNT(dept_id)
FROM department WHERE dept_name='SPORTS';

SELECT 
COUNT(dept_id)
FROM department WHERE dept_name='FINANCE';

SELECT 
COUNT(dept_id)
FROM department WHERE dept_name='COMMUNICATION';

SELECT 
COUNT(dept_id)
FROM department WHERE dept_name='MARKETING';

ALTER TABLE paydetails add net_salary INT;

ALTER TABLE paydetails ADD Total INT ;

UPDATE paydetails SET Total=(basics+additions);

UPDATE paydetails SET net_salary=(Total-deductions);
SELECT * FROM paydetails;

SELECT  *      
FROM        department INNER JOIN
              employee ON department.dept_id = employee.dept_id INNER JOIN
                paydetails ON department.dept_id = paydetails.dept_id AND employee.emp_id = paydetails.emp_id INNER JOIN
                payroll ON employee.emp_id = payroll.emp_id;

SELECT  *      
FROM department INNER JOIN
       employee ON department.dept_id = employee.dept_id INNER JOIN
      paydetails ON department.dept_id = paydetails.dept_id AND employee.emp_id = paydetails.emp_id INNER JOIN
      payroll ON employee.emp_id = payroll.emp_id;

	  SELECT * FROM employee WHERE emp_id=5;
	  
	  SELECT emp_name 
	  FROM department INNER JOIN
       employee ON department.dept_id = employee.dept_id INNER JOIN
      paydetails ON department.dept_id = paydetails.dept_id AND employee.emp_id = paydetails.emp_id INNER JOIN
      payroll ON employee.emp_id = payroll.emp_id
	  WHERE net_salary<10000;

	  
	  SELECT * FROM department;

	  SELECT * FROM employee;

	  SELECT * FROM paydetails;

	  SELECT * FROM payroll;

	  
