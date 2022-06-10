--QUSTION 1

SELECT first_name, last_name, district
FROM customer
JOIN address
ON address.address_id = customer.address_id
WHERE address.district = 'Texas'

--QUSTION 2

SELECT CONCAT(first_name, ' ', last_name), amount
FROM customer
JOIN payment
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99

--QUSTION 3

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) >=175
    ORDER BY SUM(amount)
     )

--QUSTION 4

SELECT first_name, last_name, email, country
FROM customer
JOIN address
ON address.address_id = customer.address_id
JOIN city 
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

--QUSTION 5

SELECT staff.first_name, staff.last_name, COUNT(payment.rental_id) as rentals
FROM staff
JOIN payment
ON payment.staff_id = staff.staff_id
GROUP BY staff.first_name, staff.last_name
ORDER BY rentals

--QUESTION 6

SELECT *
FROM (SELECT COUNT(rating) as cnt_rate, rating
from film
GROUP BY rating) as cnts

--QUSTION 7

SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
     )

--QUSTION 8

SELECT COUNT(rental_id)
FROM payment
WHERE amount = 0
