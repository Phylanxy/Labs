use sakila;

# Which actor has appeared in the most films?
# Hint: group by actor_id
select actor.first_name, actor.last_name, count(fa.actor_id)
from actor
    join film_actor fa on actor.actor_id = fa.actor_id
group by fa.actor_id
order by count(fa.actor_id)
desc
limit 1;

# Most active customer (the customer that has rented the most number of films)
select customer_id, count(r.customer_id) as number_of_rentals
from customer
inner join rental r
using(customer_id)
group by r.customer_id
order by count(r.customer_id)
desc
limit 1;

# List number of films per category.
select `name`, count(fc.category_id)
from category
inner join film_category fc on category.category_id = fc.category_id
group by fc.category_id
order by `name`;

