library(polArverse)
library(tidyverse)


### DEFINO ELECCIONES A DESCARGAR ----

(elecciones <- show_available_elections(source = "results") %>% # Fuente de datos Andy Tow (tablas de escrutinios totales)
                filter(district == "arg", # Nacionales 
                       category == "presi", # Presidente 
                       round == "gral") # Elecciones Generales
 )



### DESARGO DATOS ----



datos <- get_multiple_elections(data = elecciones,
                                source = "results", 
                                unnest = FALSE)
 

### GENERO BASE DE TRABAJO

