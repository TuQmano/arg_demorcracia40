#### TABULADOS Y GRAFICOS

library(tidyverse) # Easily Install and Load the 'Tidyverse', CRAN v1.3.2
library(sf) # Simple Features for R, CRAN v1.0-9
library(geoAr)
library(geofacet) # 'ggplot2' Faceting Utilities for Geographical Data, CRAN v0.2.0
library(patchwork)
library(gt)
library(gtExtras)
library(ggparliament)
library(ggplot2)


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
  geom_path(linejoin = "round", color = "black",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "black",  linetype = 'dashed') +
#  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "black") +
  geom_text(aes(year, value, label = year),nudge_y = .5, color = "black") +
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
  geom_path(linejoin = "round", color = "black",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "black",  linetype = 'dashed', linetype = "dashed") +
  #  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "black") +
  geom_text(aes(year, value, label = year),nudge_y = 3, color = "black") +
  labs(title = "Participación", 
       #subtitle = "Categoría Presidente - Elecciones 1946 - 2019", 
       caption = "Votantes / Electores", 
       y = "%", x = "") + 
  theme_minimal() +
  theme(axis.text.y = element_text(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor.x  = element_blank(), 
        axis.text = element_blank())



#### COMPETITIVIDAD ----


competitividad_prov <- competitividad_prov$nep


plot_competitividad <- ggplot(competitividad, aes(x = year, y =  value)) + 
  geom_line(data = competitividad_prov %>% rename(value = competitividad), 
            aes(x = year, y =  value, group = codprov),
            color = "grey", size = 1) +
  geom_path(linejoin = "round", color = "black",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "black",  linetype = 'dashed') +
  #  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "black") +
  geom_text(aes(year, value, label = year),nudge_y = .05, color = "black") +
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
  geom_path(linejoin = "round", color = "black",
            lineend = "round", size = 2, alpha = .4)+
  geom_vline(xintercept = nep$year, alpha = .3, color = "black",  linetype = 'dashed') +
  #  ggthemes::theme_fivethirtyeight() +
  geom_point(aes(year, value),nudge_y = 3, color = "black") +
  geom_text(aes(year, value, label = year),nudge_y = .05, color = "black") +
  labs(title = "Concentración", 
       #subtitle = "Categoría Presidente - Elecciones 1946 - 2019", 
       caption = "Porecentaje acumulado de las dos listas más votadas", 
       y = "", x = "") + 
  theme_minimal() +
  theme(axis.text.y = element_text(color = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor.x  = element_blank(), 
        axis.text = element_blank())





##### ggplot + patchwork ----

(plot_participacion + plot_concentracion) / 
  ( plot_competitividad + plot_nep ) +
  plot_annotation(title = "Principales Indicadores (1946 - 2019)", 
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
  select(year, participacion, concentracion, competitividad, nep) %>% 
  summarise(year = c(year, 'Promedio'),
            across(where(is.numeric), ~ c(., mean(.))))%>% 
  gt() %>% 
  fmt_number(columns = c(3,4,5), decimals = 2, 
             sep_mark = ".", dec_mark = ",") %>% 
  fmt_percent(columns = c(2), decimals = 1, 
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
    title = md(("**Gráfico 3.** El presidencialismo Argentino (1983 - 2019)")) #  y acumulado anual (sacado en enero)
    ) %>%
  tab_source_note(
    source_note = md(
      "**{electorAr}**: Datos y herramientas electorales de Argentina usando R https://politicaargentina.github.io/electorAr/")
  )  %>%
  tab_style(
    style = 
      cell_text(weight  = "bold"),
    locations =  cells_body(columns = c(1))) %>% 
  gt_theme_538() %>% 
  tab_style(
    style = list(
      cell_fill(color = "#d6d2d2")
    ),
    locations = cells_body( # not needed if coloring all columns
      rows = 10)
  ) %>% 
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
                  column = competitividad, fig_dim = c(8, 20), palette = c( "black", "black", "black", "black", "black")
  ) %>% 
  
  gt_plt_sparkline(type = "ref_mean",
                   column = nep, fig_dim = c(8, 20) , palette = c( "black", "black", "black", "black", "black")
  ) %>%
  
  gt_plt_sparkline(type = "ref_mean",
                   column = concentracion, fig_dim = c(8, 20) , palette = c( "black", "black", "black", "black", "black")
  ) %>% 
  
  gt_plt_sparkline(type = "ref_mean",
                   column = participacion, fig_dim = c(8, 20) , palette = c( "black", "black", "black", "black", "black")
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
    title = md(("**Gráfico 5. Comportamiento Electoral en las Provincias**")) #  y acumulado anual (sacado en enero)
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
       col = "black",
  x = electores, 
  var = "electores",
  type = "prop", 
  leg_title = "Total electores\n(2019)",
)

mf_credits(
  txt = "Fuente: {geoAr} + {electorAr} https://politicaargentina.github.io/polarverse/",
  pos = "bottomleft",
  cex = 0.6,
  font = 3,
  bg = NA
)

## Electores y bancas



### BANCAS POR CICLO ELECTORAL
url  <- "https://raw.githubusercontent.com/electorArg/PolAr_Data/master/geo/seats_province_election_type.csv"


bancas <- read_csv(url) %>%  # CALCULA BANCAS TOTALES POR PROVINCIA
  group_by(codprov) %>% 
  summarise(seats = sum(seats)) %>% 
  left_join(geo_metadata %>% select(contains("codprov")) %>% distinct())


 electores %>% 
  left_join(bancas) %>%
  group_by(name_prov) %>% 
  st_drop_geometry() %>% 
  rename(seats_diputados = seats) %>% 
  ungroup() %>% 
  mutate(pct_electores = electores/sum(electores), 
         pct_dip = seats_diputados/sum(seats_diputados)) %>% 
   arrange(desc(pct_electores)) %>%
  select(- contains("codprov")) %>% 
  mutate(electores_acumulados = cumsum(electores/sum(electores))) %>% 
  select(name_prov, seats_diputados, pct_dip, electores, pct_electores, electores_acumulados) %>% 
  mutate(representacion = round(100 * (pct_dip - pct_electores), 2)) %>% 
  gt()  %>% 
   
   cols_align(
     align = "center",
     columns = c(electores, seats_diputados, pct_electores, pct_dip, electores_acumulados, representacion)) %>% 
   cols_label(name_prov = md(""),
              seats_diputados = md("Bancas"),
              electores = "N",
              pct_electores = md("%"),                  
              pct_dip = md("%") ,             
              electores_acumulados= md("% Acumulado"), 
              representacion = "Puntos porcentuales"
   ) %>%
   opt_table_font(
     font = list(
       google_font(name = "Encode Sans")
     )
   ) %>% 
   tab_spanner(label = md("**Diputados**"), columns = c(2,3)) %>%  
   tab_spanner(label = md("**Electores 2019**"), columns = c(4,5,6)) %>% 
   tab_spanner(label = md("**Diputados - Electores**"), columns = c(7)) %>% 
   tab_header(
     title = md(("**Gráfico 2**: Peso político y Electoral de la Cámara de Diputados")) #  y acumulado anual (sacado en enero)
   ) %>%
   tab_source_note(
     source_note = md(
       "**{electorAr}**: Datos y herramientas electorales de Argentina usando R https://politicaargentina.github.io/electorAr/")
   )  %>%
   tab_style(
     style = 
       cell_text(weight  = "bold"),
     locations =  cells_body(columns = c(1))) %>% 
   fmt_number(columns = c(2, 4), decimals = 0) %>% 
   fmt_percent(columns = c(3, 5, 6), decimals = 1) %>% 
   gt_theme_538()  %>% 
   gtsave("plots/peso_diputados.png")
 


### Win - Loss GT PLOTS
 
 
 ganadores <- read_csv("entradas/ganador-data.csv") %>%
   select(-1) %>% 
   mutate(match = ifelse(is.na(match), 0, match)) %>% 
   select(name_prov, year ,match)

ganadores %>% 
  group_by(name_prov) %>% 
  summarise(wins = list(match), .groups = "drop") %>% 
  gt() %>%
  gt_plt_winloss(wins,
                 max_wins = 9,
                 palette = c("#000000", "#AAAAAA", "gray"),
                 type = "pill")  %>% 
  cols_label(name_prov = md(""),
             wins = md("Nacional = Provincial")) %>% 
  gt_theme_538()  %>% 
  tab_header(
    title = md(("**Gráfico 6.** Congruencia de Resultados")), 
    subtitle = "Resultado Ganador en Elecciones Generales a Presidente (1983 - 2019)"#  y acumulado anual (sacado en enero)
  ) %>%
  tab_source_note(
    source_note = md(
      "**{electorAr}**: Datos y herramientas electorales de Argentina usando R https://politicaargentina.github.io/electorAr/")
  )  %>%
  tab_footnote(footnote = "*Notar que al tratarse de la elección general, para los años 2003 y 2015 la lista más votada a nivel nacional no fue la que terminó ganando la presidencia.") %>% 
  tab_style(
    style = 
      cell_text(weight  = "bold"),
    locations =  cells_body(columns = c(1))) %>%
  cols_width(
    everything() ~ px(180)
  )  %>% 
  gtsave("plots/win_loss.png")



### GOBERNADORES HEATMAP ----

gobers_years <- tibble::tribble(
                             ~Provincia, ~`1983`, ~`1984`, ~`1985`, ~`1986`, ~`1987`, ~`1988`, ~`1989`, ~`1990`, ~`1991`, ~`1992`, ~`1993`, ~`1994`, ~`1995`, ~`1996`, ~`1997`, ~`1998`,   ~`1999`,   ~`2000`,   ~`2001`,   ~`2002`,   ~`2003`,   ~`2004`,   ~`2005`,   ~`2006`, ~`2007`, ~`2008`, ~`2009`, ~`2010`, ~`2011`, ~`2012`, ~`2013`, ~`2014`, ~`2015`, ~`2016`, ~`2017`, ~`2018`, ~`2019`, ~`2020`, ~`2021`, ~`2022`, ~`2023`,
                         "Buenos Aires",   "UCR",   "UCR",   "UCR",   "UCR",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",   "PRO",   "PRO",   "PRO",   "PRO",    "PJ",    "PJ",    "PJ",    "PJ",
                              "Córdoba",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                             "Santa Fe",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PS",    "PS",    "PS",    "PS",    "PS",    "PS",    "PS",    "PS",    "PS",    "PS",    "PS",    "PS",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                      "Capital Federal",      NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,   "UCR",   "UCR",   "UCR",     "UCR", "Alianza", "Alianza", "Alianza", "Frepaso", "Frepaso", "Frepaso", "Frepaso",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",   "PRO",
                              "Mendoza",   "UCR",   "UCR",   "UCR",   "UCR",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ", "Alianza", "Alianza", "Alianza", "Alianza",     "UCR",     "UCR",     "UCR",     "UCR",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",
                              "Tucumán",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "IF",    "PJ",    "PJ",    "PJ",    "FR",    "FR",    "FR",    "FR",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                           "Entre Ríos",   "UCR",   "UCR",   "UCR",   "UCR",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ", "Alianza", "Alianza", "Alianza", "Alianza",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                                "Salta",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",   "PRS",   "PRS",   "PRS",   "PRS",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                             "Misiones",   "UCR",   "UCR",   "UCR",   "UCR",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",     "FRC",     "FRC",     "FRC",     "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",   "FRC",
                                "Chaco",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",  "PACH",  "PACH",  "PACH",  "PACH",   "UCR",   "UCR",   "UCR",   "UCR", "Alianza", "Alianza", "Alianza", "Alianza",     "UCR",     "UCR",     "UCR",     "UCR",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                           "Corrientes",   "PAL",   "PAL",   "PAL",   "PAL",   "PAL",   "PAL",   "PAL",   "PAL",    "IF",    "IF",   "PAL",   "PAL",   "PAL",   "PAL",    "PN",    "PN",      "IF",      "IF", "Alianza", "Alianza", "Alianza", "Alianza",     "UCR",     "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",      NA,      NA,
                  "Santiago del Estero",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "IF",    "IF",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "IF",     "UCR",     "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "FCS",   "FCS",   "FCS",   "FCS",   "FCS",   "FCS",   "FCS",   "FCS",   "FCS",      NA,      NA,
                             "San Juan",  "PBSJ",  "PBSJ",  "PBSJ",  "PBSJ",  "PBSJ",  "PBSJ",  "PBSJ",  "PBSJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ", "Alianza", "Alianza", "Alianza", "Alianza",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                                "Jujuy",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",
                            "Río Negro",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR", "Alianza", "Alianza", "Alianza", "Alianza",     "UCR",     "UCR",     "UCR",     "UCR",   "UCR",   "UCR",   "UCR",   "UCR",    "PJ",    "PJ",    "PJ",    "PJ",  "JSRN",  "JSRN",  "JSRN",  "JSRN",  "JSRN",  "JSRN",  "JSRN",  "JSRN",  "JSRN",
                              "Formosa",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                              "Neuquén",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",     "MPN",     "MPN",     "MPN",     "MPN",     "MPN",     "MPN",     "MPN",     "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",   "MPN",
                               "Chubut",   "UCR",   "UCR",   "UCR",   "UCR",    "PJ",    "PJ",    "PJ",    "PJ",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR", "Alianza", "Alianza", "Alianza", "Alianza",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                             "San Luis",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                            "Catamarca",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "IF",    "IF",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",   "UCR",     "UCR",     "UCR",     "UCR",     "UCR", "Alianza",  "Alianza","Alianza", "Alianza",   "UCR",   "UCR",   "UCR",   "UCR",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                             "La Rioja",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                             "La Pampa",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                           "Santa Cruz",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",      "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",
                     "Tierra del Fuego",      NA,      NA,      NA,      NA,      NA,      NA,      NA,      NA,   "MPF",   "MPF",   "MPF",   "MPF",   "MPF",   "MPF",   "MPF",   "MPF",      "PJ",      "PJ",      "PJ",      "PJ",     "UCR",     "UCR",     "UCR",     "UCR",   "ARI",   "ARI",   "ARI",   "ARI",   "PSP",   "PSP",   "PSP",   "PSP",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ",    "PJ"
                  )

gobers_years %>% 
  pivot_longer(cols = c(2:42),
               names_to = "years",
               values_to = "party") %>% 
  mutate(party_color = case_when(
    party == "PJ" ~ party,
    party == "PRO" ~ party,
    party == "UCR" ~ party,
    party == "IF" ~ party, 
    is.na(party) ~ NA, TRUE ~ "Otros"
  ))  %>% 
  ggplot() +
  geom_tile(aes(x = years, y = reorder(Provincia, desc(Provincia), label = party), fill = party_color), color = "black") +
hrbrthemes::theme_ipsum() +
  theme(axis.text.x = element_text(angle = 90), legend.position = 'top', 
        axis.title.x = element_blank(), 
        axis.title.y = element_blank()) +
  scale_fill_manual(values = c("PJ" = "#000000", 
                               "UCR" = "#4d4c4c", 
                               "PRO" = "#858383", 
                               "IF" = "#e6d3d3", 
                               "Otros" = '#bfbbbb'), na.value = "white") +
  scale_x_discrete(position = 'top', breaks = c('1983','1987','1991','1995','1999',
                                                '2003','2007','2011','2015','2019','2023')) +
  labs(fill = '', 
       title = '', 
       caption = 'Fuente: Elaboración propia, actualización y adaptación a partir de Malamud y De Luca (2016)') 
  
dev.off()

ggsave(filename = 'plots/gobers_heatmap_blanco_negro.png')

 
