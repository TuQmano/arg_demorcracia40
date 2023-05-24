library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.2
library(electorAr) # Toolbox for Argentina's Electoral Data, [https://tuqmano.r-universe.dev::NA/NA] v0.0.1.0


# ELECCIONES PRESIDENCIALES (1946 - 2019) NIVEL NACIONAL -----

datos <- read_csv("entradas/datos.csv")


# PARTICIPACION 

datos %>% 
  group_by(id, electores) %>% 
  summarise(votos = sum(votos)) %>% 
  mutate(turnour = votos/electores*100)

# NEP

datos %>% 
  nest_by(id) %>% 
  summarise(nep = compute_nep(data, index = "Laakso-Taagepera"))


# CONCENTRACION

datos %>% 
  nest_by(id) %>% 
  summarise(nep = compute_concentration(data))

# COMPETITIVIDAD

datos %>% 
  nest_by(id) %>% 
  summarise(nep = compute_competitiveness(data))

