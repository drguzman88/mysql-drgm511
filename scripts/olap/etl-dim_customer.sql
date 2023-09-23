use sakila;

insert into sakila_dwh.dim_customer (
    customer_id,
    customer,
    district,
    city,
    country
)
select
    cm.customer_id,
    CONCAT(cm.first_name,' ',cm.last_name) AS customer,
    ad.district,
    ct.city,
    co.country
from customer as cm
    join address as ad using(address_id)
    join city as ct using(city_id)
    join country as co using(country_id)
;