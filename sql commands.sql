use mavenmovies;
/* 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
	Primary Keys:
Primary keys uniquely identify each row in a table.
Some examples in the Maven Movies database:

actor.actor_id

film.film_id

customer.customer_id

rental.rental_id

payment.payment_id

	Foreign Keys:
Foreign keys create links between tables by referring to primary keys in other tables.
Some examples:

film_actor.actor_id is a foreign key referencing actor.actor_id

film_actor.film_id is a foreign key referencing film.film_id

inventory.film_id is a foreign key referencing film.film_id

rental.inventory_id is a foreign key referencing inventory.inventory_id

rental.customer_id is a foreign key referencing customer.customer_id

payment.rental_id is a foreign key referencing rental.rental_id

payment.customer_id is a foreign key referencing customer.customer_id

	Differences between primary keys and foreign keys:

A primary key uniquely identifies each record in a table and cannot be NULL.

A foreign key links to a primary key in another table to create a relationship and can contain duplicates or NULLs.

Primary keys ensure uniqueness within their own table.

Foreign keys ensure referential integrity between tables.

2- List all details of actors*/
select*from actor;
-- 3 -List all customer information from DB.
select*from customer;
-- 4 List different countries.
select country from country;
-- 5. Display all active customers.
select*from customer
where active=1;
-- 6 List of all rental IDs for customer with ID 1.
select rental_id from rental
where customer_id=1;
-- 7. Display all the films whose rental duration is greater than 5 
select title,rental_duration from film 
where rental_duration>5;
-- 8. List the total number of films whose replacement cost is greater than $15 and less than $20.
SELECT COUNT(*) AS total
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;
-- 9. Display the count of unique first names of actors.
select count(distinct(first_name))as unique_first_names from actor;
-- 10.  Display the first 10 records from the customer table .
select*from customer
limit 10;
-- 11.  Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer 
where first_name like"b%"
limit 3;
-- 12 -Display the names of the first 5 movies which are rated as ‘G’.
select title from film
where rating='G'
limit 5;
-- 13 - Find all customers whose first name starts with 'a'.
SELECT * FROM customer
WHERE first_name LIKE 'a%';

-- 14 - Find all customers whose first name ends with 'a'.
SELECT * FROM customer
WHERE first_name LIKE '%a';

-- 15 - Display the list of first 4 cities which start and end with 'a'.
SELECT city FROM city
WHERE city LIKE 'a%a'
LIMIT 4;

-- 16 - Find all customers whose first name has 'NI' in any position.
SELECT * FROM customer
WHERE first_name LIKE '%NI%';

-- 17 - Find all customers whose first name has 'r' in the second position.
SELECT * FROM customer
WHERE first_name LIKE '_r%';

-- 18 - Find all customers whose first name starts with 'a' and are at least 5 characters in length.
SELECT * FROM customer
WHERE first_name LIKE "a____%";

-- 19 - Find all customers whose first name starts with 'a' and ends with 'o'.
SELECT * FROM customer
WHERE first_name LIKE 'a%o';
-- 20 - Get the films with PG and PG-13 rating using IN operator.
SELECT * FROM film
WHERE rating IN ('PG', 'PG-13');

-- 21 - Get the films with length between 50 to 100 using BETWEEN operator.
SELECT title,length from film
WHERE length BETWEEN 50 AND 100;

-- 22 - Get the top 50 actors using LIMIT operator.
SELECT * FROM actor
LIMIT 50;

-- 23 - Get the distinct film IDs from inventory table.
SELECT DISTINCT film_id FROM inventory;

