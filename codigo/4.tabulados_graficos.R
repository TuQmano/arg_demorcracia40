#### TABULADOS Y GRAFICOS

library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.2
library(sf) # Simple Features for R, CRAN v1.0-9
library(geoAr)
library(geofacet) # 'ggplot2' Faceting Utilities for Geographical Data, CRAN v0.2.0

# GENERO INDICADORES
source("codigo/2.genero_indicadores.R")


# DATOS AGREGADOS NACIONALES

nep <- nep$nep

concentracion <- concentracion$nep %>% 
  mutate(value = concentration  )

competitividad <- competitividad$nep %>% 
  mutate(value = competitividad )

participacion <- participacion %>% 
  separate(col = id, into = c("district", "category", 
                              "round", "year")) %>% 
  mutate(value = turnour, 
         year = as.integer(year))

participacion_prov <- participacion_prov %>% 
  separate(col = id, into = c("district", "category", 
                              "round", "year")) %>% 
  mutate(value = turnour, 
         year = as.integer(year))


### PLOTS

#### NEP ----

nep_prov <- nep_prov$nep


plot_nep <- ggplot(nep, aes(x = year, y =  value)) + 
  geom_line(data = nep_prov, 
            aes(x = year, y =  value, group = codprov),
            color = "grey", size = 1) +
  geom_path(linejoin = "round", color = "blue",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "red") +
#  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "blue") +
  geom_text(aes(year, value, label = year),nudge_y = .5, color = "blue") +
  labs(title = "Número Efectivo de Partidos (NEP)", 
       #subtitle = "Categoría Presidente - Elecciones 1946 - 2019", 
       caption = "Indice Laakso-Taagepera", 
       y = "NEP", x = "") + 
  theme_minimal() +
  theme(axis.text.y = element_text(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor.x  = element_blank())






#### PARTICIPACION ----

plot_participacion <- ggplot(participacion, aes(x = year, y =  value)) + 
  geom_line(data = participacion_prov, 
            aes(x = year, y =  value, group = district),
            color = "grey", size = 1) +
  geom_path(linejoin = "round", color = "blue",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "red") +
  #  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "blue") +
  geom_text(aes(year, value, label = year),nudge_y = 3, color = "blue") +
  labs(title = "Participación", 
       #subtitle = "Categoría Presidente - Elecciones 1946 - 2019", 
       caption = "Votantes / Electores", 
       y = "%", x = "") + 
  theme_minimal() +
  theme(axis.text.y = element_text(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor.x  = element_blank())




competitividad_prov <- competitividad_prov$nep


#### COMPETITIVIDAD ----

plot_competitividad <- ggplot(competitividad, aes(x = year, y =  value)) + 
  geom_line(data = competitividad_prov %>% rename(value = competitividad), 
            aes(x = year, y =  value, group = codprov),
            color = "grey", size = 1) +
  geom_path(linejoin = "round", color = "blue",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "red") +
  #  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "blue") +
  geom_text(aes(year, value, label = year),nudge_y = .05, color = "blue") +
  labs(title = "Competitividad", 
       #subtitle = "Categoría Presidente - Elecciones 1946 - 2019", 
       caption = "Mide la diferencia porcentual de votos válidos obtenidos por los dos partidos más votados 𝑎
 y 𝑏. Puede tomar valores entre [0,1]. Competitividad =1−(𝑎−𝑏)", 
       y = "", x = "") + 
  theme_minimal() +
  theme(axis.text.y = element_text(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor.x  = element_blank())


concentracion_prov <- concentracion_prov$nep


#### CONCENTRACION ----

plot_concentracion <- ggplot(concentracion, aes(x = year, y =  value)) + 
  geom_line(data = concentracion_prov %>% rename(value = concentration), 
            aes(x = year, y =  value, group = codprov),
            color = "grey", size = 1) +
  geom_path(linejoin = "round", color = "blue",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "red") +
  #  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "blue") +
  geom_text(aes(year, value, label = year),nudge_y = .05, color = "blue") +
  labs(title = "Concentración", 
       #subtitle = "Categoría Presidente - Elecciones 1946 - 2019", 
       caption = "Porecentaje acumulado de las dos listas más votadas", 
       y = "", x = "") + 
  theme_minimal() +
  theme(axis.text.y = element_text(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor.x  = element_blank())



library(patchwork)



(plot_competitividad + plot_concentracion) / 
  (plot_participacion + plot_nep)+
  plot_annotation(title = "Elecciones Presidenciales en Argentina", 
                  subtitle = "Principales Indicadores (1946 - 2019)", 
                  tag_levels = "i", 
                  caption = "Las lineas grises muestran los valores de cada indicador para las elecciones para
                  cada una de las provincias y las azules en el agregado nacional")















