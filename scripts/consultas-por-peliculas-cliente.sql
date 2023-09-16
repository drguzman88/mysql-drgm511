use sakila;

with datos_renta as(
    SELECT
        film_id
        ,title
        ,category.name AS category,
        concat(first_name,' ',last_name) as customer,
        rental_date
    FROM inventory
        LEFT JOIN rental USING(inventory_id)
        LEFT JOIN film USING(film_id)
        LEFT JOIN film_category USING(film_id)
        LEFT JOIN category USING(category_id)
        LEFT JOIN customer USING(customer_id)
),

-- 2. AGRUPA CLIENTE Y MESES
datos_por_mes as (
    select 
        customer,
        year(rental_date) as r_year,
        month(rental_date) as r_month,
        count(*) as conteos
    from datos_renta
    group by customer,r_year,r_month
),

-- 3. TRANSPONE INFORMACION
datos_por_cliente as (
    select
        customer,
        sum(case when r_year=2005 and r_month=5 then conteos else 0 end) as may2005,
        sum(case when r_year=2005 and r_month=6 then conteos else 0 end) as jun2005

    from datos_por_mes
    group by customer
),

-- 4. CALCULA DIFERENCIAS Y CRECIMIENTOS
datos_diferencias_cliente as (
    select
        customer,
        may2005,
        jun2005,
        (jun2005 - may2005) as difjun2005,
        case when may2005 <> 0 then (jun2005 - may2005)/may2005 *100 else 0 end as varjun2005
    from datos_por_cliente
)
select *
from datos_diferencias_cliente
limit 10;