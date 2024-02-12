# question one
select film.title, actor.first_name, actor.last_name from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film om film_actor.film_id = film.film_id
where film.title like "Academy Dinosaur";

# question two
select count(*), category.name from film_category 
join category on category.category_id = film_category.category_id 
group by film_category.category_id;

# question three
select avg(film.rental_duration), film.rating from film group by rating;

# question four
select customer.first_name, customer.last_name, count(*) 
from rental 
join customer on customer.customer_id = rental.customer_id 
group by rental.customer_id, customer.first_name, customer.last_name;

# question five
SELECT inventory.store_id, count(*) as rental_count FROM rental
join inventory on rental.inventory_id = inventory.inventory_id 
group by inventory.store_id
order by rental_count desc 
limit 1;

# question six
SELECT category.name, count(*) as rental_count FROM rental 
join inventory on inventory.inventory_id = rental.inventory_id 
join film_category on film_category.film_id = inventory.film_id 
join category on category.category_id = film_category.category_id 
group by category.category_id 
order by rental_count desc limit 1;

# question seven
select avg(rental_rate), category.name from film 
join film_category on film_category.film_id = film.film_id 
join category on category.category_id = film_category.category_id 
group by category.category_id;

#question eight
select film.title, max(rental.rental_date) as last_date_rented from film 
join inventory on inventory.film_id = film.film_id 
join rental on rental.inventory_id = inventory.inventory_id 
where rental.rental_date is null or 
rental.rental_date < DATE_SUB((SELECT MAX(rental_date) FROM rental), INTERVAL 1 MONTH) 
group by film.title;

#question nine
select customer.first_name, customer.last_name, sum(payment.amount) from payment 
join customer on customer.customer_id = payment.customer_id 
group by customer.customer_id;

#question ten
SELECT language.name, avg(film.length) FROM `film` 
join language on language.language_id = film.language_id 
group by language.name;
