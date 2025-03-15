CREATE DATABASE myclass;
USE myclass;

CREATE TABLE employee(
	employee_id INT,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    dob DATE,
    salary DECIMAL(5,2)
);

-- DROP TABLE employee;
-- DROP DATABASE myclass;

INSERT into employee VALUES (1,"Sanket","Kumar","1988-07-19",600.00);
INSERT into employee VALUES (2,"Vishal","K","1988-07-29",500.00); 
INSERT into employee VALUES (3,"Rohit","r","1988-07-09",400.00); 
INSERT into employee VALUES (4,"Yug","ar","1988-07-08",300.00); 
INSERT into employee VALUES (5,"Ali","b","1988-07-07",200.00); 
INSERT into employee VALUES (6,"Arihant","br","1988-07-06",100.00);  

INSERT into employee (employee_id, first_name,last_name) VALUES 
    (1,"Vishal","Rohit"); 


SELECT * FROM employee;


SELECT *  FROM employee where dob = "1988-07-29";

SELECT  distinct first_name from employee;



DELETE FROM employee;

UPDATE employee
SET last_name = "Vijay"
where dob = "1988-07-29";


SET AUTOCOMMIT = OFF;
COMMIT;
DELETE FROM employee;
SELECT * FROM EMPLOYEE;

ROLLBACK;
SELECT * FROM EMPLOYEE;
COMMIT;



select * from employee;

ALTER TABLE employee
ADD COLUMN location VARCHAR(20);

UPDATE employee
SET location = "Canada"
WHERE last_name = "Vijay";
;

ALTER TABLE employee
MODIFY COLUMN location VARCHAR(30)
FIRST; -- FIRST


SELECT first_name as First	, last_name as Last, salary as Payout from employee; -- ALIAS


CREATE TABLE test(
	my_date DATE,
    my_time TIME,
    my_date_time DATETIME,
    trans DATETIME DEFAULT NOW()
);

INSERT INTO test (my_date,my_time,my_date_time) 
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW()); -- null, null +1

select * from test;

CREATE TABLE IF NOT EXISTS temp_employee (
	employee_id INT UNIQUE,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    pay 	  DECIMAL(3,2),
    hire_date DATE
--    CONSTRAINT chk_hour_pay CHECK (pay >= 20)
);


INSERT into temp_employee VALUES(0,"S","jK",2,"2024-08-09");

ALTER TABLE temp_employee
ADD CONSTRAINT chk_hour_pay CHECK (pay <= 1);

ALTER TABLE temp_employee
DROP CONSTRAINT chk_hour_pay;



select * from temp_employee;

SHOW CREATE TABLE temp_employee;


CREATE TABLE transactions(
	tran_id INT PRIMARY KEY auto_increment,
    amount DECIMAL (5,2)
);

INSERT INTO transactions (amount) values (23);

INSERT INTO transactions values (NULL,23);

select * from transactions;
DROP TABLE transactions;



--  DAY 2 ------------
CREATE TABLE t_customers(
	customer_id INT PRIMARY KEY,
    name VARCHAR(30),
    dob DATE 
);

INSERT INTO t_customers VALUES
	(1,"Vishal","2024-01-02"),
	(2,"Vijay","2024-02-02"),
	(3,"Sujay","2024-03-02");

CREATE TABLE t_transactions 
	( trans_id INT PRIMARY KEY ,
	  amount INT,
      transaction_time DATETIME DEFAULT NOW(),
      customer_id INT,
      FOREIGN KEY(customer_id) REFERENCES t_customers(customer_id)
    );

INSERT INTO t_transactions (trans_id,amount, customer_id)
VALUES (21,200,1);

INSERT INTO t_transactions (trans_id,amount, customer_id)
VALUES (22,200,4);




SELECT * FROM transactions INNER JOIN customers
on transactions.customer_id = customers.customer_id;

SELECT  first_name as First , last_name as Last , amount FROM transactions INNER JOIN customers
on transactions.customer_id = customers.customer_id;


select * from customers; 

select * from transactions where customer_id = 5;

SELECT * FROM transactions RIGHT JOIN CUSTOMERS
on
transactions.customer_id = customers.customer_id;


select * from customers;

CREATE VIEW names as 
select first_name , last_name from customers;

-- INSERT A NEW ROW IN customer table and then check if tgets reflected in view 
select * from names;






