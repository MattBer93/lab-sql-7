use sakila;

-- 1) In the table actor, which are the actors whose last names are not repeated? 
-- For example if you would sort the data in the table actor by last_name, you would see that there is 
-- Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
-- hence we would want this in our output list.
select * from actor;
select last_name from actor
group by last_name
having count(last_name) = 1;


-- 2) Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include 
-- the last names of the actors where the last name was present more than once.
select last_name from actor
group by last_name
having count(last_name) > 1;


-- 3) Using the rental table, find out how many rentals were processed by each employee.
select * from rental;
select staff_id, count(rental_id) as rentals_count from rental
group by staff_id;


-- 4) Using the film table, find out how many films were released each year.
select * from film;
select release_year, count(film_id) as films_per_year from film
group by release_year;


-- 5) Using the film table, find out for each rating how many films were there.
select rating, count(film_id) as films_per_rating from film
group by rating;


-- 6) What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select rating, round(avg(length), 2) as avg_length from film
group by rating;


-- 7) Which kind of movies (rating) have a mean duration of more than two hours?
select rating, sec_to_time(avg(length)*60) as avg_length from film
group by rating
having cast(substring(avg_length, 1, 2) as unsigned) > 1;
















