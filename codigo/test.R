

test <- dplyr::bind_rows(participacion, participacion_prov) %>% 
  tidyr::separate(col = id, into = c("district", "categroy", "round", "year")) %>% 
  nest_by(year)

year2011 <- dplyr::bind_rows(participacion, participacion_prov) %>% 
  tidyr::separate(col = id, into = c("district", "categroy", "round", "year")) %>% 
  filter(year == "2011")


participacion_prov %>% 
  tidyr::separate(col = id, into = c("district", "categroy", "round", "year")) %>% 
  filter(year == "2011")
  
