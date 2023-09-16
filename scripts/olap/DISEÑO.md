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

**Fact_Alquiler**
|Columna          |Tipo     |Restricciones            |         
|-----------------|---------|-------------------------|
|rental_key       |int(8)   | PK, NN                  |
|rental_id        |date     | UK, NN                  |
|date_key         |int      | FK(dim_tiempo), NN      |
|count_rental     |int      | NN                      |

