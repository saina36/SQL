use pw;
/* 1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints.*/
create table emp
	(emp_id int not null primary key,
    emp_name char(30) not null,
    age int check(age>=18),
    email varchar(50) unique,
    salary decimal(10,2) default 30000);
/*2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.

Ans:Constraints are rules applied to table columns to make sure the data in a database is correct and reliable. They help prevent invalid or inconsistent data from being stored.

Examples of common constraints:

PRIMARY KEY: Makes sure each record is unique and not null.
Example: emp_id INT PRIMARY KEY

NOT NULL: Ensures a column cannot have empty values.
Example: emp_name VARCHAR(100) NOT NULL

UNIQUE: Makes sure all values in a column are different.
Example: email VARCHAR(255) UNIQUE

CHECK: Limits the values that can be stored in a column.
Example: age INT CHECK (age >= 18)

DEFAULT: Sets a default value if none is provided.
Example: salary DECIMAL(10,2) DEFAULT 30000.00

FOREIGN KEY: Links a column to a column in another table to keep relationships valid.

These constraints help keep the data accurate, consistent, and follow business rules.

3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
your answer.

Ans:The NOT NULL constraint is used to make sure a column always has a value and cannot be left empty. This is important when the data is required for each record. For example, an employee name should never be blank.

A primary key cannot contain NULL values. This is because the primary key uniquely identifies each row in the table, and NULL means “unknown,” so it cannot be used to identify something. Every row must have a unique and known primary key value.

4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.

Ans:To add a constraint, use ALTER TABLE with ADD.
Example (add UNIQUE constraint):


ALTER TABLE employees
ADD CONSTRAINT unique_email UNIQUE (email);
To remove a constraint, use ALTER TABLE with DROP.
 Example (remove UNIQUE constraint):


ALTER TABLE employees
DROP INDEX unique_email;
These commands change the rules on the table.

5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.

Ans: If you try to insert, update, or delete data that breaks a constraint, the database will reject the operation and show an error message. This protects the data from becoming incorrect or inconsistent.

Example:
If you try to insert a duplicate email into a column with a UNIQUE constraint, you might get an error like:


ERROR 1062 (23000): Duplicate entry 'test@example.com' for key 'unique_email'
This means the operation failed because it would have violated the UNIQUE rule.

6. You created a products table without constraints as follows:

CREATE TABLE products (

    product_id INT,

    product_name VARCHAR(50),

    price DECIMAL(10, 2));
Now, you realise that?
: The product_id should be a primary key
: The price should have a default value of 50.00

Ans: we just have to ass the constraints that satosfy in both the cases.
a. ALTER TABLE products
	ADD PRIMARY KEY (product_id);
b. ALTER TABLE products
	ALTER COLUMN price SET DEFAULT 50.00;
 
 7. You have two tables:


Write a query to fetch the student_name and class_name for each student using an INNER JOIN.

Ans: select s.student_name,c.class_name 
from students as s 
inner join classes as c 
on s.class_id=c.class_id; 

8. Consider the following three tables:
Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order 

Hint: (use INNER JOIN and LEFT JOIN)

Ans:  
SELECT
  p.order_id,
  c.customer_name,
  p.product_name
FROM
  products p
LEFT JOIN orders o
  ON p.order_id = o.order_id
LEFT JOIN customers c
  ON o.customer_id = c.customer_id;

9. Given the following tables:

Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.

Ans: 
SELECT
  p.product_name,
  SUM(s.amount) AS tot_sales_amt
FROM
  sales s
INNER JOIN products p
  ON s.product_id = p.product_id
GROUP BY
  p.product_name;

10. You are given three tables:
Write a query to display the order_id, customer_name, and the quantity of products ordered by each
customer using an INNER JOIN between all three tables.

Ans: 
SELECT
  o.order_id,
  c.customer_name,
  oi.quantity
FROM
  orders o
INNER JOIN customers c
  ON o.customer_id = c.customer_id
INNER JOIN order_items oi
  ON o.order_id = oi.order_id;
  







*/


