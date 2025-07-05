/* 
1. First Normal Form (1NF)
Identify a table that violates 1NF and how to normalize it.
*/
-- Example: Imagine if 'customer' had multiple phone numbers in one field (this is hypothetical).
-- Solution: Create a separate table to store each phone number as a separate row.

/*
2. Second Normal Form (2NF)
Choose a table and check for partial dependencies.
*/
-- Example: film_category with category_name depends only on category_id.
-- Solution: Remove category_name to a separate category table.

/*
3. Third Normal Form (3NF)
Identify a table with transitive dependencies.
*/
-- Example: address table has postal_code and city_name (city_name depends on postal_code).
-- Solution: Split city_name into a postal_codes lookup table.

/*
4. Normalization Process
Guide through normalization steps up to 2NF.
*/
-- Example: Rentals table with multiple payments in columns.
-- Step 1: Convert repeating groups to rows.
-- Step 2: Remove partial dependencies.

/*
5. CTE Basics
Retrieve actor names and number of films.
*/
WITH actor_films AS (
  SELECT
    actor_id,
    COUNT(film_id) AS film_count
  FROM film_actor
  GROUP BY actor_id
)
SELECT
  a.first_name,
  a.last_name,
  af.film_count
FROM actor a
JOIN actor_films af ON a.actor_id = af.actor_id;

/*
6. CTE with Joins
Film title, language name, and rental rate.
*/
WITH film_lang AS (
  SELECT
    film_id,
    title,
    language_id,
    rental_rate
  FROM film
)
SELECT
  f.title,
  l.name AS language,
  f.rental_rate
FROM film_lang f
JOIN language l ON f.language_id = l.language_id;

/*
7. CTE for Aggregation
Total revenue by each customer.
*/
WITH customer_revenue AS (
  SELECT
    customer_id,
    SUM(amount) AS total_revenue
  FROM payment
  GROUP BY customer_id
)
SELECT
  c.first_name,
  c.last_name,
  cr.total_revenue
FROM customer c
JOIN customer_revenue cr ON c.customer_id = cr.customer_id;

/*
8. CTE with Window Functions
Rank films by rental duration.
*/
WITH film_ranks AS (
  SELECT
    film_id,
    title,
    rental_duration,
    RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
  FROM film
)
SELECT * FROM film_ranks;

/*
9. CTE and Filtering
List customers with more than 2 rentals.
*/
WITH rental_counts AS (
  SELECT
    customer_id,
    COUNT(*) AS rentals
  FROM rental
  GROUP BY customer_id
  HAVING COUNT(*) > 2
)
SELECT
  c.customer_id,
  c.first_name,
  c.last_name,
  r.rentals
FROM rental_counts r
JOIN customer c ON c.customer_id = r.customer_id;

/*
10. CTE for Date Calculations
Total rentals per month.
*/
WITH monthly_rentals AS (
  SELECT
    DATE_FORMAT(rental_date, '%Y-%m') AS rental_month,
    COUNT(*) AS total_rentals
  FROM rental
  GROUP BY rental_month
)
SELECT * FROM monthly_rentals;

/*
11. CTE and Self-Join
Pairs of actors who appeared together.
*/
WITH actor_films AS (
  SELECT
    film_id,
    actor_id
  FROM film_actor
)
SELECT
  a1.actor_id AS actor1,
  a2.actor_id AS actor2,
  af1.film_id
FROM actor_films af1
JOIN actor_films af2
  ON af1.film_id = af2.film_id
  AND af1.actor_id < af2.actor_id;

/*
12. CTE for Recursive Search
Find all employees reporting to a manager.
*/
WITH RECURSIVE staff_hierarchy AS (
  SELECT
    staff_id,
    first_name,
    last_name,
    reports_to
  FROM staff
  WHERE reports_to = <manager_id>
  
  UNION ALL

  SELECT
    s.staff_id,
    s.first_name,
    s.last_name,
    s.reports_to
  FROM staff s
  JOIN staff_hierarchy sh ON s.reports_to = sh.staff_id
)
SELECT * FROM staff_hierarchy;
