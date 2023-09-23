# Creación del esquema de la bodega de datos

create database if not exists sakila_dwh;
use sakila_dwh;

-- Dimension de tiempo
create table if not exists dim_time(
    date_key         int(8)     not null,
    date_value       date       not null,
    month_number     int(3)     not null,
    year4            int(5)     not null,
    day_of_week      int(5)     not null,
    day_of_week_name char(12)   not null,
 
    primary key(date_key),
    unique index date_value (date_value)
);

-- Dimension Tienda
create table if not exists dim_store(
    store_key int not null AUTO_INCREMENT,
    store_id  tinyint(8) not null, 
    store     varchar(20) not null,
    district  varchar(50) not null,
    city      varchar(50) not null,
    country      varchar(50) not null,
    last_update timestamp not null default CURRENT_TIMESTAMP,

    primary key (store_key),
    unique index (store_id)

);

-- Dimension cliente
create table if not exists dim_customer(
    customer_key int not null AUTO_INCREMENT,
    customer_id  smallint(8) not null, 
    customer     varchar(90) not null,
    district     varchar(50) not null,
    city         varchar(50) not null,
    country      varchar(50) not null,
    last_update timestamp not null default CURRENT_TIMESTAMP,

    primary key (customer_key),
    unique index (customer_id)

);

-- Hechos del alquiler
create table if not exists fact_rental(
    -- llaves
    rental_key       int(8)     not null AUTO_INCREMENT,
    rental_id        int(11)    not null,
    
    -- foreign keys
    date_key         int(8)     not null,
    store_key        int(8)     not null,
    customer_key     int(8)     not null,

    -- datos
    count_rental     int(11)    not null, 

    primary key (rental_key),
    unique index rental_id(rental_id),

    index date_key (date_key),
    foreign key(date_key) references dim_time(date_key),
    index store_key (store_key),
    foreign key (store_key) references dim_store(store_key),
    index customer_key (customer_key),
    foreign key (customer_key) references dim_customer(customer_key)
);



