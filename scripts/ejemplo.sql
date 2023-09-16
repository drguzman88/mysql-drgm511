use sakila;

SELECT
   c.customer_id,
   c.first_name,
   c.last_name,
   a.address_id,
   ci.city_id,
   ci.city,
   co.country_id,
   co.country

from customer as c
   inner join address as a using (address_id)
   inner join city as ci using (city_id)
   inner join country as co using(country_id)


limit 5

