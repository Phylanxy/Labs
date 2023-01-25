use sakila;

# List all films whose length is longer than the average of all the films.
select title from film
where length > (select avg(length) from film);

# How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id)
from inventory
where film_id = (select film_id from film
                  where title like "Hunchback Impossible");

# Use subqueries to display all actors who appear in the film Alone Trip.


# 4 Sales have been lagging among young families, and you wish to target all family movies for a promotion.
# Identify all movies categorized as family films.
select title from film
    where film_id in (
        select film_id from film_category
        where category_id = (
            select category_id from category
                where `name` = "Family"));

# Get name and email from customers from Canada using subqueries. Do the same with joins.
# Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys,
# that will help you get the relevant information.
select email, first_name, last_name from customer
where address_id in (
    select address_id from address
        where city_id in (select city_id
                          from city
                          where country_id = (select country_id
                                              from country
                                              where country = "Canada")
                        )
    )

# with joins:
select email, first_name, last_name from customer
join address a on customer.address_id = a.address_id
    join city c on a.city_id = c.city_id
        join country c2 on c2.country_id = c.country_id
where country = "Canada"

# Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films.
# First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select title from film
where film_id in
      (select film_id from film_actor
            where actor_id in
                (select actor_id from actor
                     where actor_id = (
                         select max(actor_id)
                  )));

select first_name, last_name from actor
where actor_id in (
    select actor_id from film_actor
        where 


    )