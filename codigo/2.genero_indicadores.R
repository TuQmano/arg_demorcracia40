library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.2
library(electorAr)
# ELECCIONES PRESIDENCIALES (1946 - 2019) NIVEL NACIONAL -----

datos <- read_csv("entradas/datos.csv")


## PARTICIPACION ----

participacion <- datos %>% 
  group_by(id, electores) %>% 
  summarise(votos = sum(votos)) %>% 
  mutate(turnour = votos/electores*100)

## NEP ----

nep <- datos %>% 
  nest_by(id) %>% 
  summarise(nep = compute_nep(data, index = "Laakso-Taagepera"))


## CONCENTRACION ----

concentracion <- datos %>% 
  nest_by(id) %>% 
  summarise(nep = compute_concentration(data))

## COMPETITIVIDAD ----

competitividad <- datos %>% 
  nest_by(id) %>% 
  summarise(nep = compute_competitiveness(data))

# ELECCIONES PRESIDENCIALES (1946 - 2019) NIVEL PROVINCIAL -----

datos_prov <- read_csv("entradas/datos_prov.csv")


## PARTICIPACION ----

participacion_prov <- datos_prov %>% 
  group_by(id, electores, codprov) %>% 
  summarise(votos = sum(votos)) %>% 
  mutate(turnout = votos/electores*100)

## NEP ----

nep_prov <- datos_prov %>% 
  nest_by(id) %>% 
  summarise(nep = compute_nep(data, index = "Laakso-Taagepera"))


## CONCENTRACION ----

concentracion_prov <- datos_prov %>% 
  nest_by(id) %>% 
  summarise(nep = compute_concentration(data))

## COMPETITIVIDAD ----

competitividad_prov <- datos_prov %>% 
  nest_by(id) %>% 
  summarise(nep = compute_competitiveness(data))
