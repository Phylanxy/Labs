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

# Display the first and last names, as well as the address, of each staff member.
select distinct staff_id, first_name, last_name, address, district, city, postal_code
from staff
inner join address a on staff.address_id = a.address_id
inner join city c on a.city_id = c.city_id;

# get films titles where the film language is either English or italian,
# and whose titles starts with letter "M" , sorted by title descending.
select
    title, l.name as language
from
    film
inner join language l on film.language_id = l.language_id
where l.name = "English" and title regexp "^M.*"
    or l.name = "Italian" and title regexp "^M.*"
order by title;

# Display the total amount rung up by each staff member in August of 2005.
select distinct
    first_name, last_name, sum(p.amount)
from
    staff
inner join
        payment p on staff.staff_id = p.staff_id
where
    month(p.payment_date) = 8
group by
    first_name, last_name
order by
    sum(p.amount)
desc;

# List each film and the number of actors who are listed for that film.
select distinct
    title, count(actor_id)
from
    film_actor
inner join film f
using(film_id)
group by
    title
order by
    count(actor_id)
desc;

# Using the tables payment and customer and the JOIN command, list the total paid by each customer.
# List the customers alphabetically by last name.
select
    last_name, sum(amount)
from
    customer
join
    payment p
using(customer_id)
group by
    last_name;

# Write sql statement to check if you can find any actor who never particiapted in any film.
select distinct
    actor_id
from
    film_actor
left outer join actor a
using(actor_id)
where actor_id = NULL
order by
    actor_id;

# get the addresses that have NO customers, and end with the letter "e"
select
    address, customer_id
from
    address
left outer join customer c
using(address_id)
where address regexp "e$" and c.customer_id is null;

# Optional: what is the most rented film?
select
    title, count(film_id)
from
    film
left join
    inventory
using(film_id)
right join rental r
using(inventory_id)
group by
    film_id
order by
    count(film_id)
desc limit 1
