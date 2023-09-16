-- usar las tablas con el nombre del esquema
-- sakila.rental

insert into sakila_dwh.dim_time (
    date_key,
    date_value,
    month_number,
    year4,
    day_of_week,
    day_of_week_name
)

select 
    TO_DAYS(date) as date_key,
    date as date_value,
    month(date) as month_number,
    year(date) as year4,
    dayofweek(date) as day_of_week,
    dayname(date) as day_of_week_name
from (
    select distinct date(rental_date) as date
    from sakila.rental
) as fechas
;
