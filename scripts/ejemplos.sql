use sakila;

-- 1. Unir los datos
with datos_alquiler as (
    SELECT
        film_id
        ,title
        ,category.name AS category
        ,year(rental.rental_date) as rental_year
        ,month(rental.rental_date) as rental_month
        ,dayofmonth(rental.rental_date) as rental_day
    
    FROM inventory
        LEFT JOIN rental USING(inventory_id)
        LEFT JOIN film USING(film_id)
        LEFT JOIN film_category USING(film_id)
        LEFT JOIN category USING(category_id)
-- GROUP BY film_id, title, category
),

-- 2. agrupar por año mes
datos_alquiler_anno_mes as (
    select
        title,
        rental_year,
        rental_month,
        count(*) as conteo
    from datos_alquiler
    group by 
        title,
        rental_year,
        rental_month
),

-- 3. pasar algunas filas a columnas

datos_alquiler_por_mes as (
    select 
        title,
        sum(case when rental_year=2005 and rental_month=5 then conteo else 0 end)  may2005,
        sum(case when rental_year=2005 and rental_month=6 then conteo else 0 end)  jun2005
    from datos_alquiler_anno_mes
    group by title    
),

-- 4. calcular diferencias y porcentajes de crecimiento

datos_alquiler_comparativo_mes as (
    SELECT
        title,
        may2005,
        jun2005,
        (jun2005 - may2005) as difjun2005,
        case when may2005 <> 0 then ((jun2005 - may2005)/may2005) * 100 else 0 end as porcdifjun2005
    from datos_alquiler_por_mes
)
select *
from datos_alquiler_comparativo_mes
limit 10
;