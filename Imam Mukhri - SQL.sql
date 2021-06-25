--Q1
SELECT COUNT(title) 
FROM film 
WHERE LOWER(description) 
LIKE '%astronaut%';

--Q2
SELECT COUNT(film_id) 
FROM film 
WHERE rating = 'R' AND replacement_cost BETWEEN 5 AND 15;

--Q3
SELECT staff_id, COUNT(payment_id) AS num_of_payments, SUM(amount) AS total_payments 
FROM payment
GROUP BY staff_id
ORDER BY total_payments DESC;

--Q4
SELECT rating, AVG(replacement_cost) AS avg_replacement_cost 
FROM film
GROUP BY rating;

--Q5
SELECT CONCAT(c.first_name,' ', c.last_name) AS customer_name, c.email, SUM(p.amount) as total_spent
FROM customer c
INNER JOIN payment p 
ON c.customer_id = p.customer_id 
GROUP BY c.customer_id 
ORDER BY total_spent DESC 
limit 5;

--Q6
SELECT store_id, film_id, COUNT(film_id) AS number_copies_movies
FROM inventory 
GROUP BY store_id, film_id 
ORDER BY store_id; 

--Q7
SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_name, c.email 
FROM customer AS c
JOIN payment AS p
ON c.customer_id = p.customer_id
GROUP BY customer_name, c.email
HAVING COUNT(payment_id)>= 40
