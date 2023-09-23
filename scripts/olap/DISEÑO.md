# Diseño de la bodega de datos

## Alquiler

**nota** llave subrogada es una llave diseñada para ser lo mas rapida posible.
- un numero pequeño, con cierto orden
- no va a cambiar a pesar que la llave del negocio cambie.


**Dim_Tiempo**

|Columna          |Tipo     |Restricciones|
|-----------------|---------|-------------|
|date_key         |int      | PK, NN      |
|date_value       |date     | UK, NN      |
|month_number     |int      | NN          |
|month_name       |char(12) | NN          |
|year4            |int      | NN          |
|day_of_week      |int      | NN          |
|day_of_week_name |char(123)| NN          |

**Dim_Store**
|Columna          |Tipo                  |Restricciones                     |
|-----------------|----------------------|----------------------------------|
|store_key        |int                   | PK, NN, auto_increment           |
|store_id         |tinyint unsigned      | UK, NN                           |
|store            |char(20)              |     NN                           |
|district         |vachar(20)            |     NN                           |
|city             |vachar(50)            |     NN                           |
|country          |vachar(50)            |     NN                           |
|last_update      |timestamp             |     NN, default CURRENT_TIMESTAMP|

**Dim_Customer**
|Columna          |Tipo                  |Restricciones                     |
|-----------------|----------------------|----------------------------------|
|customer_key     |int                   | PK, NN,auto_increment            |
|customer_id      |tinyint unsigned      | UK, NN                           |
|customer         |char(80)              |     NN                           |
|district         |vachar(20)            |     NN                           |
|city             |vachar(50)            |     NN                           |
|country          |vachar(50)            |     NN                           |
|last_update      |timestamp             |     NN, default CURRENT_TIMESTAMP|



**Fact_Alquiler**

|Columna          |Tipo     |Restricciones            |         
|-----------------|---------|-------------------------|
|rental_key       |int(8)   | PK, NN                  |
|rental_id        |date     | UK, NN                  |
|date_key         |int      | FK(dim_tiempo), NN      |
|store_key        |int      | FK(dim_store),  NN      |
|customer_key     |int      | FK(dim_customer),  NN   |
|count_rental     |int      | NN                      |

