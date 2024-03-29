library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.2
library(electorAr)
# ELECCIONES PRESIDENCIALES (1983 - 2019) NIVEL NACIONAL -----

datos <- read_csv("entradas/datos.csv") %>% 
  filter(year >= 1983)


## PARTICIPACION ----

participacion <- datos %>% 
  group_by(id, electores) %>% 
  summarise(votos = sum(votos)) %>% 
  mutate(turnout = votos/electores*100)

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

# ELECCIONES PRESIDENCIALES (1983 - 2019) NIVEL PROVINCIAL -----

datos_prov <- read_csv("entradas/datos_prov.csv") %>% 
  filter(!is.na(votos), 
         year >= 1983) %>% 
  left_join(geoAr::geo_metadata %>% 
              select(codprov, name_iso) %>%
              distinct())


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




