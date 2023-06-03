

test <- dplyr::bind_rows(participacion, participacion_prov) %>% 
  tidyr::separate(col = id, into = c("district", "categroy", "round", "year")) %>% 
  nest_by(year)

year2011 <- dplyr::bind_rows(participacion, participacion_prov) %>% 
  tidyr::separate(col = id, into = c("district", "categroy", "round", "year")) %>% 
  filter(year == "2019")


participacion_prov %>% 
  tidyr::separate(col = id, into = c("district", "categroy", "round", "year")) %>% 
  filter(year == "2011")
  


elecciones_filtrado <- dplyr::bind_rows(participacion, participacion_prov) %>% 
  separate(col = id, into = c("distrito", "cat", "ronda", "anio"))


provincias25 <- elecciones_filtrado %>% 
  filter(anio == 2015) %>% 
  pull(distrito)


provincias2019 <- elecciones_filtrado %>% 
  filter(anio == 2019) %>% 
  pull(distrito)

  anti_join(as.tibble(provincias25), as.tibble(provincias2019))
