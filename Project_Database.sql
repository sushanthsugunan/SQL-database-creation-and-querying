Create database Ord_handle;
Use Ord_handle;

CREATE TABLE customer (
    cust_fname VARCHAR(30) NOT NULL,
    cust_lname VARCHAR(30) NOT NULL,
    city VARCHAR(30),
    cust_ID INT NOT NULL UNIQUE,
    PRIMARY KEY (cust_ID),
    INDEX (cust_ID)
    
);

CREATE TABLE product (
    prod_ID INT UNIQUE,
    prod_class ENUM('hardware','software','misc'),
    sell_price float,
    qty_avlb int,
    PRIMARY KEY (prod_ID)
);

CREATE TABLE employee (
	emp_ID INT UNIQUE,
    emp_fname VARCHAR(50),
    emp_lname VARCHAR(50),
    location VARCHAR(30),
    gender ENUM ('M','F'),
    role_type ENUM ('Manager', 'Consultant'),
    PRIMARY KEY (emp_ID)
); 

CREATE TABLE order_t(
    order_ID INT NOT NULL UNIQUE,
    cust_ID int NOT NULL,
    emp_ID int NOT NULL,
    Ord_qty INT NOT NULL,
    ord_type ENUM ('credit','full','emi') NOT NULL,
    prod_ID INT NOT NULL,
    order_date DATE NOT NULL,
    PRIMARY KEY (order_ID),
    FOREIGN KEY (prod_ID)
        REFERENCES product (prod_ID),
	FOREIGN KEY (cust_ID)
        REFERENCES customer (cust_ID),
	FOREIGN KEY (emp_ID)
        REFERENCES employee(emp_ID)
);
CREATE TABLE vendor (
    vendor_ID INT UNIQUE,
    vendor_name varchar(20),
    location varchar(20),
    contact_no int,
    email_ID varchar(20),
    PRIMARY KEY (vendor_ID)
);
CREATE TABLE vendor_prod (
    prod_ID int,
    vendor_ID INT,
    unit_price float,
    lead_time INT,
    FOREIGN KEY (prod_ID)
    REFERENCES product (prod_ID),
    FOREIGN KEY (vendor_ID)
    REFERENCES vendor(vendor_ID)
);

CREATE TABLE commission (
    role_type ENUM ('Manager', 'Consultant'),
    sale_comm float,
    PRIMARY KEY (role_type)
   );

use Ord_handle;
insert into customer values('Rahul','Shah','Chennai',1);
insert into customer values('Parul','Preet','Chennai',2);
insert into customer values('Modi','Makro','Kerala',3);
insert into customer values('Veera','Pandy','Pondi',4);
insert into customer values('Lissa','Asel','Maharastra',5);


insert into product values(1000,'hardware',2250,150);
insert into product values(1001,'hardware',1250,50);
insert into product values(1003,'hardware',21660,65);
insert into product values(1004,'hardware',8913,53);
insert into product values(1005,'software',5562,10);
insert into product values(1006,'software',5635,86);
insert into product values(1007,'software',510,1533);
insert into product values(1008,'misc',816,116);
insert into product values(1009,'misc',653,863);
insert into product values(1010,'misc',5946,101);


insert into employee values(101, 'Houston','Kill','Pune','M','Manager'); 
insert into employee values(102, 'Daicy','Brown','Pune','F','Manager'); 
insert into employee values(103, 'Mathew','Paul','Pune','M','Consultant'); 
insert into employee values(104, 'Pual','Bar','Pune','M','Manager');
insert into employee values(105, 'Kareena','Carol','Pune','F','Consultant'); 
insert into employee values(106, 'Manu','Puliyoor','Pune','M','Manager');


insert into order_t values(2000,1,101, 5,'credit',1000,'2022-04-04');
insert into order_t values(2001,1,103, 10,'full',1003,'2022-06-03');
insert into order_t values(2003,2,104, 2,'full',1004,'2022-01-03');
insert into order_t values(2004,1,106, 5,'credit',1006,'2021-02-04');
insert into order_t values(2005,3,104, 6,'emi',1007,'2021-05-04');
insert into order_t values(2006,3,103, 34,'emi',1007,'2022-07-15');
insert into order_t values(2007,4,102, 51,'emi',1009,'2021-12-04');
insert into order_t values(2008,5,102, 6,'full',1010,'2022-06-18');


insert into vendor values(3000,'AKA Traders','Pune',78952145,'aka@gmail.com');
insert into vendor values(3001,'BKA Traders','Mumbai',78952146,'bka@gmail.com');
insert into vendor values(3002,'CKA Traders','Delhi',78952147,'cka@gmail.com');
insert into vendor values(3003,'DKA Traders','Ranchi',78952148,'dka@gmail.com');
insert into vendor values(3004,'EKA Traders','Patiala',78952149,'eka@gmail.com');
insert into vendor values(3005,'FKA Traders','Kolapur',78952150,'fka@gmail.com');


insert into vendor_prod values(1000, 3000,2000, 25);
insert into vendor_prod values(1001, 3002,1000, 15);
insert into vendor_prod values(1001, 3003,980, 5);
insert into vendor_prod values(1007, 3004,400, 30);
insert into vendor_prod values(1003, 3003,20950, 22);
insert into vendor_prod values(1004, 3004,7500, 18);
insert into vendor_prod values(1003, 3005,19800, 14);
insert into vendor_prod values(1006, 3000,4500, 45);


insert into commission values('Manager',0.10);
insert into commission values('Consultant',0.12);
