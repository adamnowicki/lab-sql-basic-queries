USE sakila;
# SHOW TABLES
SHOW TABLES;

SELECT * FROM actor, film, customer;

SELECT  title from film;

-- -- 3.2 List of languages used in films, with the column aliased as language from the language table

SELECT name as language from language ;

-- 3.3 List of first names of all employees from the staff table

SELECT first_name from staff;


SELECT * FROM STAFF;

-- Retrieve unique release years.
SELECT DISTINCT release_year
FROM film;

-- Determine the number of stores that the company has.--
SELECT COUNT(store_id)
from store;

-- 5.2 Determine the number of employees that the company has.

select count(staff_id)
from staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
-- number of titles available
select count(film_id) from film;

-- number of available movies including all copies in different stores
select  count( distinct inventory_id) from inventory;

select count(rental_id) from rental;

-- extra: how many times each film was rented in all stores grouped by title
select  film.title, count(rental_id) as times_rented
from rental
left join inventory on
inventory.inventory_id = rental.inventory_id
left join film on
film.film_id = inventory.film_id
group by film.title
order by times_rented desc;

-- Determine the number of distinct last names of the actors in the database.
select distinct count(last_name) from actor;

-- Retrieve the 10 longest films.
select title, length 
from film
order by length desc
limit 10;

-- Retrieve all actors with the first name "SCARLETT"

select first_name 
from actor 
where first_name = "Scarlett";

-- Bonus
-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

select title, length from film
where title like '%Armageddon%'
and length > 100;

-- 7.3 Determine the number of films that include Behind the Scenes content

select count(title) as films_with_bs from film
where special_features like '%Behind the Scenes%'




