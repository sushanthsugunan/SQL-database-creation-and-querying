use ord_handle;

# Check the tables of the database
# Commission table
SELECT 
    *
FROM
    commission;
# Customer table
SELECT 
    *
FROM
    customer;    

# employee table
SELECT 
    *
FROM
    employee;

# order table
SELECT 
    *
FROM
    order_t;

# Product table
SELECT 
    *
FROM
    product;

# Vendor table
SELECT 
    *
FROM
    vendor;

# Vendor Product  table:

SELECT 
    *
FROM
    vendor_prod;

/* Query-1 : Insert a record in employee table ? */ 
insert into employee values	(107, 'Kumar','Sahoo', 'Bangalore', 'M','Manager');

SELECT 
    *
FROM
    employee;

/* Query-2: Delete the new record inserted into employee table */

DELETE FROM employee 
WHERE
    emp_ID = 107;
    
SELECT 
    *
FROM
    employee;

/* Query-3 : Update order date for any record in the order table */
   
UPDATE order_t
SET 
   order_date = '2022-06-17'
WHERE
    order_ID = 2007 ;

SELECT 
    *
FROM
    order_t;

/* Query-4 : Give total orders taken by each employee in descending order */
select * from employee;
select * from order_t;

SELECT 
    e.emp_ID,
    e.emp_fname,
    e.emp_lname,
    e.role_type,
    COUNT(o.order_ID) Order_taken
FROM
    employee e
        JOIN
    order_t o ON e.emp_ID = o.emp_ID
GROUP BY
	e.emp_ID
ORDER BY
	Order_taken DESC;
	
/* Query-5 : Get the name of employee who has not taken any order till date */
SELECT 
    e.emp_ID,
    e.emp_fname,
    e.emp_lname,
    e.role_type,
    COUNT(o.order_ID)  as Order_taken
FROM
    employee e
        LEFT JOIN
    order_t o ON e.emp_ID = o.emp_ID
GROUP BY
	e.emp_ID
HAVING
	Order_taken = 0
ORDER BY
	Order_taken DESC;

/* Query-6 : Arrange the product in descending order of lead time to delivery */
SELECT 
    *
FROM
    vendor_prod
ORDER BY lead_time DESC;

/* Query-7 : Display the total sales for each customer in descending order - SUB Query */
SELECT 
    c.cust_fname,
    c.cust_lname,
    c.city,
    o.total_order,
    o.total_sale    
FROM
     (SELECT 
    o.cust_ID,
    o.prod_ID,
    COUNT(o.order_ID) total_order,
    (SUM(o.Ord_qty) * p.sell_price) total_sale
FROM
    Order_t O
        JOIN
    product p ON o.prod_ID = p.prod_ID
GROUP BY prod_ID) o
        JOIN
    customer c  ON
    o.cust_ID = c.cust_ID
GROUP BY
	o.cust_ID
ORDER BY
	o.total_sale DESC;

/* Query-8: Display commission earned by each employee in descending order */
SELECT 
    em.emp_ID,
    em.emp_fname,
    em.emp_lname,
    em.role_type,
    round((om.total_sale * em.sale_comm)) total_commission 
FROM (SELECT 
    o.emp_ID,
    o.prod_ID,
    COUNT(o.order_ID) total_order,
    (SUM(o.Ord_qty) * p.sell_price) total_sale
FROM
    Order_t O
        JOIN
    product p ON o.prod_ID = p.prod_ID
GROUP BY o.prod_ID) om JOIN (SELECT 
    e.emp_ID,
    e.emp_fname,
    e.emp_lname,
    e.location,
    e.role_type,
    c.sale_comm
FROM
    employee e
        JOIN
    commission c ON e.role_type = c.role_type) em ON om.emp_ID = em.emp_ID
group by
	om.emp_ID
ORDER BY
	total_commission DESC;
