                      /*  ASSIGNMENT QUESTIONS AND SOLUTIONS */              
-----------------------------------------------------------------------------------------------

-- 1)Write a SQL query to count the number of characters except the spaces for each actor.
-- Return first 10 actors name length along with their name.

select concat(first_name,' ',last_name) as final_name,
length(replace(concat(first_name,' ',last_name),' ','')) as name 
from actor
order by actor_id limit 10;

## or ##

select concat(first_name,' ',last_name) as final_name,
(select length(replace(final_name,' ',''))) as name from actor 
order by actor_id limit 10;

-- 2)List all Oscar awardees(Actors who received Oscar award) with their full names 
-- and length of their names.

select concat(first_name,' ',last_name) as full_names, 
(select length(full_names)) as names_length
from actor_award where awards like '%Oscar%';

-- 3)Find the actors who have acted in the film ‘Frost Head’.

select first_name,last_name from actor 
inner join film_actor on 
actor.actor_id=film_actor.actor_id
inner join film on 
film_actor.film_id=film.film_id
where title='Frost Head';

## or ##

select concat(first_name,' ',last_name) as full_name from actor 
inner join film_actor on 
actor.actor_id=film_actor.actor_id
inner join film on 
film_actor.film_id=film.film_id
where title='Frost Head';

-- 4)Pull all the films acted by the actor ‘Will Wilson’.

select title as films from film
inner join film_actor on 
film.film_id=film_actor.film_id
inner join actor on 
film_actor.actor_id=actor.actor_id
where concat(first_name,' ',last_name)='Will Wilson';

-- 5)Pull all the films which were rented and return in the month of May.

select title as films from film 
inner join inventory on 
film.film_id=inventory.film_id
inner join rental on 
inventory.inventory_id=rental.inventory_id 
where month(return_date)=5 group by films;

-- 6)Pull all the films with ‘Comedy’ category.

select title as films,name from film 
inner join film_category on 
film.film_id=film_category.film_id
inner join category on 
film_category.category_id=category.category_id
where name='Comedy';
 