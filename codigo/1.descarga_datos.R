library(polArverse) # Argentine Politics Packages Collection, [https://tuqmano.r-universe.dev::NA/NA] v0.0.1.0
library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.2


### DEFINO ELECCIONES A DESCARGAR ----


# PRESIDENTE - TOTALES NACIONALES
(elecciones <- show_available_elections(source = "results") %>% # Fuente de datos Andy Tow (tablas de escrutinios totales)
                filter(district == "arg", # Nacionales 
                       category == "presi", # Presidente 
                       round == "gral") # Elecciones Generales
 )


# PRESIDENTE - POR PROVINCIA

(elecciones_prov <- show_available_elections(source = "results") %>% # Fuente de datos Andy Tow (tablas de escrutinios totales)
    filter(district != "arg", # Nacionales 
           category == "presi", # Presidente 
           round == "gral") # Elecciones Generales
)

### DESARGO DATOS ----

# NIVEL NACIONAL
datos <- get_multiple_elections(data = elecciones,
                                source = "results", 
                                unnest = FALSE)
 # NIVEL PROVINCIAL

datos_prov <- get_multiple_elections(data = elecciones_prov,
                                source = "results", 
                                unnest = FALSE)

### GENERO BASE DE TRABAJO

# NIVEL NACIONAL

datos %>% 
  unnest(cols = "election") %>% 
  write_csv("entradas/datos.csv")

# NIVEL PROVINCIAL

datos_prov %>% 
  unnest(cols = "election") %>% 
  write_csv("entradas/datos_prov.csv")
