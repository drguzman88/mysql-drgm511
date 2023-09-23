use sakila;

insert into sakila_dwh.dim_store (
    store_id,
    store,
    district,
    city,
    country
)
select
    st.store_id,
    CONCAT(ad.address) AS store,
    ad.district,
    ct.city,
    co.country
from store as st
    join address as ad using(address_id)
    join city as ct using(city_id)
    join country as co using(country_id)
limit 5;