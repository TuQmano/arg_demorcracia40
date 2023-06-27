#### TABULADOS Y GRAFICOS

library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.2
library(sf) # Simple Features for R, CRAN v1.0-9
library(geoAr)
library(geofacet) # 'ggplot2' Faceting Utilities for Geographical Data, CRAN v0.2.0
library(patchwork)
library(gt)
library(gtExtras)


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
  mutate(value = turnout, 
         year = as.integer(year))

participacion_prov <- participacion_prov %>% 
  separate(col = id, into = c("district", "category", 
                              "round", "year")) %>% 
  mutate(value = turnout, 
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



#### COMPETITIVIDAD ----


competitividad_prov <- competitividad_prov$nep


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




#### CONCENTRACION ----


concentracion_prov <- concentracion_prov$nep

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





##### ggplot + patchwork ----

(plot_competitividad + plot_concentracion) / 
  (plot_participacion + plot_nep)+
  plot_annotation(title = "Elecciones Presidenciales en Argentina", 
                  subtitle = "Principales Indicadores (1946 - 2019)", 
                  tag_levels = "i", 
                  caption = "Las lineas grises muestran los valores de cada indicador para las elecciones para
                  cada una de las provincias y las azules en el agregado nacional")



ggsave(plot = last_plot(), filename = "plots/indicadores_nacional_patchwork.png", 
       width = 15, height = 10 )









### GT / TABLAS -----


  ##### NACIONAL -----


concentracion <- concentracion %>% 
  transmute(year, value = concentration, i = "concentracion")


competitividad <- competitividad %>% 
  transmute(year, value, i = "competitividad")


nep <- nep %>% 
  transmute(year, value, i = "nep")

participacion <- participacion %>% 
  transmute(year, value = value /100, i = "participacion")

bind_rows(competitividad, concentracion, nep, participacion) %>% 
  pivot_wider(id_cols = year, names_from = i, values_from = value) %>%
  filter(year >= 1983) %>% 
  gt() %>% 
  fmt_number(columns = c(2, 3,4), decimals = 2, 
             sep_mark = ".", dec_mark = ",") %>% 
  fmt_percent(columns = c(5), decimals = 1, 
              dec_mark = ",", sep_mark = ".") %>% 
  cols_align(
    align = "center",
    columns = c(competitividad, concentracion, nep, participacion)) %>% 
  cols_label(year = md("**Año**"),
             competitividad = md("Competitividad"),
             concentracion = md("Concentración"),                  
             nep = md("NEP") ,             
             participacion= md("Participación")) %>%
  opt_table_font(
    font = list(
      google_font(name = "Encode Sans")
    )
  ) %>% 
  tab_spanner(label = md("**Indicadores**"), columns = c(2,3,4,5)) %>% 
  tab_header(
    title = md(("**El presidencialismo Argentino (1983 - 2019)**")) #  y acumulado anual (sacado en enero)
    ) %>%
  tab_source_note(
    source_note = md(
      "**{electorAr}**: Datos y herramientas electorales de Argentina usando R https://politicaargentina.github.io/electorAr/")
  )  %>%
  tab_style(
    style = 
      cell_text(weight  = "bold"),
    locations =  cells_body(columns = c(1))) %>% 
  gt_theme_538()  %>%  
  gtsave("plots/indicadores_nacional.png")


##### PROVINCIAL -----
concentracion_p <- concentracion_prov %>% 
  transmute(year, codprov, value = concentration, i = "concentracion")


competitividad_p <- competitividad_prov %>% 
  transmute(year, codprov, value = competitividad  , i = "competitividad")


nep_p <- nep_prov %>% 
  transmute(year, codprov, value, i = "nep")


participacion_p <- participacion_prov %>% 
  transmute(year, codprov, value = value /100, i = "participacion")


### Indicadores x Provincia 



vars_indicadores= c('competitividad',
               'concentracion',
               'nep',
               'participacion')


#### NOMRBES DE PORVINCIAS PARA VIZ
prov_names <- geo_metadata %>% 
  select(codprov, name_prov) %>% 
  distinct()

#### GANADOR PAIS / PROVINCIAS para win-loss plot GT


pais_ganador <- datos %>% 
  group_by(year) %>% 
  slice_max(votos) %>% 
  select(listas, name_prov, year) %>% 
  transmute(ganadorPais = paste(year, listas))


datos_prov %>% 
  group_by(name_prov, year) %>% 
  slice_max(votos) %>% 
  transmute(ganador = paste(year, listas)) %>% 
  left_join(pais_ganador) %>% 
  print(n = Inf)

datos_prov %>% 
  group_by(name_prov, year) %>% 
  slice_max(votos) %>% 
  ungroup() %>% 
  transmute(ganador = paste(year, listas)) %>% 
  distinct() %>% 
  print(n = Inf)



#### TABLA INDICADORES


bind_rows(competitividad_p, concentracion_p, nep_p, participacion_p) %>% # SUMA INDICADORES A NIVEL PROVINCIAL EN UN UNICO DATA.FRAME
  pivot_wider(id_cols = c(year, codprov), names_from = i, values_from = value) %>% #GENERA VARIABLES ESPECIFICAS PARA CADA INDICADOR
  filter(year >= 1983)  %>% # FILTRA ELECCIONES DESDE EL RETORNO DE LA DEMOCRACIA
  left_join(prov_names, by = "codprov") %>%  # AGRUPA POR DISTRITO 
  group_by(name_prov) %>% 
  summarise( # CALCULA MEDIA y DESVIACION DE CADA INDICADOR
    
    mean_competitividad = mean(competitividad), 
    mean_concentracion = mean(concentracion), 
    mean_nep = mean(nep), 
    mean_participacion = mean(participacion),
    
    sd_competitividad = sd(competitividad), 
    sd_concentracion = sd(concentracion), 
    sd_nep = sd(nep), 
    sd_participacion = sd(participacion),
    
    # Lista de cada variable de indicadores para sparkline de cada indicador por provincia
    across(all_of(vars_indicadores), ~ list(.x))) %>% 
  select(name_prov, contains("participacion"), contains("concentracion"), 
         contains("competitividad"), contains("nep")) %>% 
  gt() %>% 
  
   # mini sparklines plots por indicador (`gtExtras`)
  gt_plt_sparkline(type = "ref_mean",
                  column = competitividad, fig_dim = c(8, 20), palette = c( "black", "black", "red", "green", "blue")
  ) %>% 
  
  gt_plt_sparkline(type = "ref_mean",
                   column = nep, fig_dim = c(8, 20) , palette = c( "black", "black", "red", "green", "blue")
  ) %>%
  
  gt_plt_sparkline(type = "ref_mean",
                   column = concentracion, fig_dim = c(8, 20) , palette = c( "black", "black", "red", "green", "blue")
  ) %>% 
  
  gt_plt_sparkline(type = "ref_mean",
                   column = participacion, fig_dim = c(8, 20) , palette = c( "black", "black", "red", "green", "blue")
  ) %>% 
 
  
  ###
  
  cols_align(
    align = "center",
    columns = c(competitividad, concentracion, nep, participacion)) %>% 
  cols_label(name_prov = md(""),
             competitividad = md(""),
             concentracion = md(""),                  
             nep = md("") ,             
             participacion= md(""),
             mean_competitividad = md("Promedio"),
             mean_concentracion = md("Promedio"),                  
             mean_nep = md("Promedio") ,             
             mean_participacion= md("Promedio"),
             sd_competitividad = md("SD"),
             sd_concentracion = md("SD"),                  
             sd_nep = md("SD") ,             
             sd_participacion= md("SD"),
             ) %>%
  opt_table_font(
    font = list(
      google_font(name = "Encode Sans")
    )
  ) %>% 
  tab_spanner(label = md("**Participación**"), columns = c(2,3,4)) %>%  
  tab_spanner(label = md("**Concentración**"), columns = c(5,6,7)) %>% 
  tab_spanner(label = md("**Competitividad**"), columns = c(8,9,10)) %>% 
  tab_spanner(label = md("**NEP**"), columns = c(11,12,13)) %>% 
  tab_header(
    title = md(("**El presidencialismo Argentino (1983 - 2019)**")) #  y acumulado anual (sacado en enero)
  ) %>%
  tab_source_note(
    source_note = md(
      "**{electorAr}**: Datos y herramientas electorales de Argentina usando R https://politicaargentina.github.io/electorAr/")
  )  %>%
  tab_style(
    style = 
      cell_text(weight  = "bold"),
    locations =  cells_body(columns = c(1))) %>% 
  fmt_number(columns = c(2,3,5,6,8,9,11,12), decimals = 2) %>% 
  gt_theme_538()  %>% 
  gtsave("plots/indicadores_provincias.png")



## MAPA ELECTORES------

library(sf)
library(mapsf)
library(geoAr)


arg <- get_geo(geo = "ARGENTINA", level = "provincia")

electores <- datos_prov %>% 
  filter(year == 2019) %>% 
  select(name_prov, electores) %>% 
  distinct() %>% 
  left_join(geo_metadata %>% select(name_prov, codprov_censo) %>% distinct()) %>% 
  left_join(arg) %>% 
  st_as_sf()



mf_map(x = electores)
# Circulos proporcionales 
mf_map(add = TRUE,
  x = electores, 
  var = "electores",
  type = "prop", 
  leg_title = "Total electores\n(2019)",
)
# Titulo
mf_title("Electores habilitados por provincia")


mf_credits(
  txt = "Fuente: {geoAr} + {electorAr} https://politicaargentina.github.io/polarverse/",
  pos = "bottomleft",
  cex = 0.6,
  font = 3,
  bg = NA
)


