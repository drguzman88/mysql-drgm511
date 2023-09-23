insert into sakila_dwh.fact_rental (
    rental_id,
    date_key,
    store_key,
    customer_key,
    count_rental
)
with datos as (
    select
        rental_id,
        rental_date,
        to_days(rental_date) as date_key,
        customer_id,
        customer_key,
        store_id,
        store_key
    from
        sakila.rental
        join sakila_dwh.dim_customer using(customer_id)
        join sakila.staff using (staff_id)
        join sakila_dwh.dim_store using (store_id)
)
select
    rental_id,
    date_key,
    store_key,
    customer_key,
    1 as count_rental
from datos
;


