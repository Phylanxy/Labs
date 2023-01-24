use sakila;

select * from actor, address, category, city, country, customer, film, film_actor, film_category, film_text;

select title from film;

# Select one column from a table and alias it.
# Get unique list of film languages under the alias language.
# Note that we are not asking you to obtain the language per each film,
# but this is a good time to think about how you might get that information in the future.

select distinct
    name
from
    film
JOIN
        language ON film.language_id = language.language_id;


# 5.1 Find out how many stores does the company have?
select distinct count(store_id) from store;

# 5.2 Find out how many employees staff does the company have?
select count(staff_id) from staff;

# 5.3 Return a list of employee first names only?
select first_name from staff;
