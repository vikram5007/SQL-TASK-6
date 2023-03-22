CREATE DATABASE TASKS1

USE TASKS1

CREATE TABLE SALESMAN(
    salesman_id INT PRIMARY KEY,
    name VARCHAR(20),
    city VARCHAR(10),
    commission DECIMAL(4,2)
  
);
INSERT INTO SALESMAN VALUES( 5001 , 'James Hoog' , 'New York' , 0.15), (5002 , 'Nail Knite ', 'Paris', 0.13),
  ( 5005 , 'Pit Alex '  , 'London'   , 0.11),(5006 , 'Mc Lyon '   ,' Paris '   , 0.14),
       (  5007 , 'Paul Adam ' ,' Rome'     , 0.13),
        ( 5003 ,' Lauson Hen' , 'San Jose ', 0.12)

		SELECT * FROM SALESMAN

create table customers(
 customer_id int primary key,
 cust_name varchar(25),
 city varchar(20),
 grade int,
 salesman_id INT foreign key (salesman_id) references SALESMAN(salesman_id)
 )

 INSERT INTO customers VALUES(3002,'Nick Rimando' ,'New York',100,5001),(3007,'Brad Davis' ,'New York',200,5001),(3005,'Graham Zusi' ,'California',200,5002),(3008,'Julian Green' ,'London',300,5002),(3004,'Fabian Johnson' ,'Paris',300,5006),(3009,'Geoff Cameron' ,'Berlin',300,5003),( 3003,'Jozy Altidor',' Moscow',200,5007), (3001,'Brad Guzan ',' London ',100, 5005)
 
 select * from customers

 create table  orders1(
 ord_no int primary key,
 purch_amt money,
 ord_date date,
 customer_id int foreign key (customer_id) references customers(customer_id),
 salesman_id INT foreign key (salesman_id) references SALESMAN(salesman_id)
 )

 insert into orders1 values
(70001,150.5,'2012-10-05',3005,5002),
(70009, 270.65 ,'2012-09-10' , 3001,5005),
(70002, 65.26 , '2012-10-05', 3002 ,5001),
(70004,110.5 , '2012-08-17 ' ,3009 , 5003),
(70007, 948.5,'2012-09-10'  ,3005 ,5002),
(70005,2400.6,'2012-07-27',3007 , 5001),
(70008,5760, '2012-09-10',3002 ,5001),
(70010 , 1983.43,'2012-10-10',  3004 ,5006),
(70003,2480.4,'2012-10-10' ,3009, 5003),
(70012,250.45,'2012-06-27', 3008 ,5002),
(70011,75.29 ,'2012-08-17' , 3003 , 5007),
(70013, 3045.6 ,'2012-04-25',  3002 , 5001)
select * from orders1

-------------------------------------- OPERATIONS ---------------------------------------------------------------------------

---  1) INNER JOIN SAME CITY VALUES ---

select s.name,c.cust_name,s.city from SALESMAN as s 
inner join
customers as c
on s.city=c.city


---  2)  INNER JOIN WHERE COMMISSION > 12% ---

select s.name,c.cust_name,c.city,s.commission from SALESMAN as s 
inner join
customers as c
on s.salesman_id=c.salesman_id
where s.commission>0.12;

---  3) FULL JOIN WHERE EVERY CUSTOMER PURCHASES ARE JOINED---

select c.cust_name, c.grade,s.name,s.commission,o.ord_no,o.ord_date,o.purch_amt from SALESMAN as s
full join
customers as c
on s.salesman_id=c.salesman_id
full join
orders1 as o
on c.customer_id=o.customer_id


--- 4) PURCHASE AMOUNT BETWEEN 500 AND 2000 ---

select o.ord_no,o.purch_amt,c.cust_name,c.city from orders1 as o
inner join
customers as c
on o.customer_id=c.customer_id
where o.purch_amt>500 and o.purch_amt<2000

--- 5) SORT THE CUSTOMER ID IN ASCENDING ORDER ---

SELECT c.customer_id,c.cust_name,c.city,c.grade,s.name,s.city from customers as c
inner join
SALESMAN as s
on c.salesman_id=s.salesman_id
order by c.customer_id
