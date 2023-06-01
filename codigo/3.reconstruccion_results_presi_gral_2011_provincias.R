library(tidyverse)


####  RAW DATA ---- (copy/paste con {datapasta} desde portal Andy Tow)

cordoba_presi_gral_2011 <- tibble::tribble(
              ~`lista`,  ~`votos`, ~`pct`,
              "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)",  "689.271", "37,29",
                         "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",   "432.351",  "23,39",
            "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",   "332.760",  "18,00",
                            "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",   "226.817",  "12,27",
                                   "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",    "84.876",   "4,59",
        "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",    "52.628",   "2,85",
  "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",    "29.588",   "1,60",
                                                                "VOTOS POSITIVOS", "1.848.291",  "97,63",
                                                                "VOTOS EN BLANCO",    "26.198",   "1,38",
                                                                    "VOTOS NULOS",    "18.678",   "0,99"
  )




caba_presi_gral_2011 <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)",  "660.275", "35,11",
                         "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",   "522.979",  "27,81",
                                   "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",   "192.503",  "10,24",
                            "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",   "185.114",   "9,84",
            "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",   "177.720",   "9,45",
  "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",    "80.807",   "4,30",
        "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",    "61.145",   "3,25",
                                                                "VOTOS POSITIVOS", "1.880.543",  "97,22",
                                                                "VOTOS EN BLANCO",    "35.333",   "1,83",
                                                                    "VOTOS NULOS",    "18.354",   "0,95"
  )

catamarca_presi_gral_2011 <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 133.306, "69,79",
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     34.229,  "17,92",
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",      9.819,   "5,14",
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",      5.117,   "2,68",
                                                         "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",      3.343,   "1,75",
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      2.912,   "1,52",
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      2.287,   "1,20",
                                                                                             "VOTOS POSITIVOS",    191.013,  "97,39",
                                                                                             "VOTOS EN BLANCO",       3.68,   "1,88",
                                                                                                 "VOTOS NULOS",      1.446,   "0,74"
                               )
   

corrientes_presi_gral_2011 <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  
                                              "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 342.284, "68,04",
                                          "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     64.889,  "12,90",
                                                       "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     36.209,   "7,20",
                                                                 "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",     23.223,   "4,62",
                                                          "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",     20.305,   "4,04",
                                "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",     11.896,   "2,36",
                                      "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      4.286,   "0,85",
                                                                                              "VOTOS POSITIVOS",    503.092,  "95,61",
                                                                                              "VOTOS EN BLANCO",     18.847,   "3,58",
                                                                                                  "VOTOS NULOS",      4.271,   "0,81"
                                )

chaco_presi_gral_2011  <-  tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 368.884, "65,24",
                                       "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",    100.093,  "17,70",
                                                    "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     40.601,   "7,18",
                                                              "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",     23.475,   "4,15",
                                                       "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",     17.024,   "3,01",
                             "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",     10.949,   "1,94",
                                   "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      4.411,   "0,78",
                                                                                           "VOTOS POSITIVOS",    565.437,  "98,58",
                                                                                           "VOTOS EN BLANCO",      5.257,   "0,92",
                                                                                               "VOTOS NULOS",      2.898,   "0,51"
                             )
   
chubut_presi_gral_2011 <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
                                         "Fernández de Kirchner - Boudou (ALIANZA FRENTE PARA LA VICTORIA)",  165.08,  5982,
                                                             "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",  45.335,  1643,
                                      "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",  26.603,   964,
                                                   "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",  21.231,   769,
                                                      "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",   8.378,   304,
                                  "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",    5.17,   187,
                            "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",   4.186,   152,
                                                                                          "VOTOS POSITIVOS", 275.983,  9694,
                                                                                          "VOTOS EN BLANCO",    3.89,   137,
                                                                                              "VOTOS NULOS",   4.822,   169
                            )

erios_presi_gral_2011     <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 367.427, "54,63",
                                                       "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",    137.351,  "20,42",
                                          "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     97.285,  "14,46",
                                                                 "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",      29.36,   "4,37",
                                                          "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",     27.394,   "4,07",
                                      "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      6.966,   "1,04",
                                "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      6.786,   "1,01",
                                                                                              "VOTOS POSITIVOS",    672.569,  "88,55",
                                                                                              "VOTOS EN BLANCO",     80.139,  "10,55",
                                                                                                  "VOTOS NULOS",      6.854,   "0,90"
                                )
 
formosa_presi_gral_2011   <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 201.036, "79,27",
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     37.189,  "14,66",
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",      6.572,   "2,59",
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",      4.606,   "1,82",
                                                         "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",      2.096,   "0,83",
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      1.081,   "0,43",
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      1.029,   "0,41",
                                                                                             "VOTOS POSITIVOS",    253.609,  "91,55",
                                                                                             "VOTOS EN BLANCO",     21.475,   "7,75",
                                                                                                 "VOTOS NULOS",      1.934,   "0,70"
                               )

jujuy_presi_gral_2011      <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández de Kirchner - Boudou (ALIANZA FRENTE PARA LA VICTORIA)", 207.286,  6443,
                                          "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",  60.623,  1884,
                                                       "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",  25.948,   807,
                                                          "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",  11.538,   359,
                                      "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",   6.408,   199,
                                                                 "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",   6.236,   194,
                                "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",   3.682,   114,
                                                                                              "VOTOS POSITIVOS", 321.721,  8936,
                                                                                              "VOTOS EN BLANCO",  34.437,   956,
                                                                                                  "VOTOS NULOS",   3.876,   108
                                )

pampa_presi_gral_2011   <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
                                           "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 104.905, "58,27",
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     24.468,  "13,59",
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     23.969,  "13,31",
                                                         "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",     15.363,   "8,53",
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",      6.867,   "3,81",
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      2.232,   "1,24",
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      2.223,   "1,23",
                                                                                             "VOTOS POSITIVOS",    180.027,  "86,98",
                                                                                             "VOTOS EN BLANCO",     25.503,  "12,32",
                                                                                                 "VOTOS NULOS",      1.448,   "0,70"
                               )

rioja_presi_gral_2011      <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 77.953, "51,28",
                                                          "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",    31.686,  "20,84",
                                          "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",    26.514,  "17,44",
                                                       "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     9.129,   "6,01",
                                                                 "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",     3.089,   "2,03",
                                      "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",     2.269,   "1,49",
                                "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",     1.379,   "0,91",
                                                                                              "VOTOS POSITIVOS",   152.019,  "84,86",
                                                                                              "VOTOS EN BLANCO",    25.205,  "14,07",
                                                                                                  "VOTOS NULOS",     1.916,   "1,07"
                                )





mendoza_presi_gral_2011 <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández de Kirchner - Boudou (ALIANZA FRENTE PARA LA VICTORIA)",  449.68,  5112,
                                                       "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)", 179.067,  2036,
                                                    "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",  107.71,  1224,
                                       "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",  96.936,  1102,
                             "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",  18.342,   209,
                                                              "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",  14.563,   166,
                                   "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",  13.363,   152,
                                                                                           "VOTOS POSITIVOS", 879.661,  8792,
                                                                                           "VOTOS EN BLANCO",  76.387,   763,
                                                                                               "VOTOS NULOS",   44.49,   445
                             )


misiones_presi_gral_2011  <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 366.727, "67,08",
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     75.077,  "13,73",
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",     44.177,   "8,08",
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     31.156,   "5,70",
                                                         "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",     16.917,   "3,09",
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      7.105,   "1,30",
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      5.512,   "1,01",
                                                                                             "VOTOS POSITIVOS",    546.671,  "97,69",
                                                                                             "VOTOS EN BLANCO",      9.893,   "1,77",
                                                                                                 "VOTOS NULOS",      3.029,   "0,54"
                               )

neuquen_presi_gral_2011   <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández de Kirchner - Boudou (ALIANZA FRENTE PARA LA VICTORIA)", 193.014,  6113,
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",  45.273,  1434,
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",  29.336,   929,
                                                         "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",   20.24,   641,
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",  11.408,   361,
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",  10.224,   324,
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",    6.24,   198,
                                                                                             "VOTOS POSITIVOS", 315.735,  9411,
                                                                                             "VOTOS EN BLANCO",  14.736,   439,
                                                                                                 "VOTOS NULOS",   5.007,   149
                               )

     
rnegro_presi_gral_2011    <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández de Kirchner - Boudou (ALIANZA FRENTE PARA LA VICTORIA)", 225.805,  6807,
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",  39.876,  1202,
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",   30.79,   928,
                                                         "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",  13.261,   400,
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",   9.791,   295,
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",   6.765,   204,
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",   5.446,   164,
                                                                                             "VOTOS POSITIVOS", 331.734,  9617,
                                                                                             "VOTOS EN BLANCO",   8.729,   253,
                                                                                                 "VOTOS NULOS",   4.478,   130
                               )

salta_presi_gral_2011      <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
                                            "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 395.548, "64,55",
                                          "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     89.383,  "14,59",
                                                       "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     50.916,   "8,31",
                                                                 "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",     25.479,   "4,16",
                                      "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",     22.267,   "3,63",
                                                          "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",      19.97,   "3,26",
                                "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      9.227,   "1,51",
                                                                                              "VOTOS POSITIVOS",     612.79,  "97,73",
                                                                                              "VOTOS EN BLANCO",      8.257,   "1,32",
                                                                                                  "VOTOS NULOS",      5.983,   "0,95"
                                )

  
sjuan_presi_gral_2011   <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 222.118, "65,41",
                                                          "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",     57.968,  "17,07",
                                          "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     24.225,   "7,13",
                                                       "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",      21.14,   "6,22",
                                                                 "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",        7.5,   "2,21",
                                      "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      3.624,   "1,07",
                                "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      3.028,   "0,89",
                                                                                              "VOTOS POSITIVOS",    339.603,  "91,82",
                                                                                              "VOTOS EN BLANCO",     27.054,   "7,31",
                                                                                                  "VOTOS NULOS",      3.208,   "0,87"
                                )


   
sluis_presi_gral_2011     <- tibble::tribble(
  
  ~`lista`,  ~`votos`, ~`pct`,
  "Rodríguez.Saa.-.Vernet.(ALIANZA.COMPROMISO.FEDERAL)", 120.924, "51,50",
                                            "Fernández de Kirchner - Boudou (ALIANZA FRENTE PARA LA VICTORIA)",     73.812,  "31,43",
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     21.349,   "9,09",
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     12.005,   "5,11",
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      2.349,   "1,00",
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",      2.294,   "0,98",
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      2.087,   "0,89",
                                                                                             "VOTOS POSITIVOS",     234.82,  "93,12",
                                                                                             "VOTOS EN BLANCO",     14.596,   "5,79",
                                                                                                 "VOTOS NULOS",      2.745,   "1,09"
                               )

    


scruz_presi_gral_2011 <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 107.540, "74,87",
                                     "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     17.028,  "11,86",
                                                  "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     10.543,   "7,34",
                                 "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      2.457,   "1,71",
                                                            "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",      2.161,   "1,50",
                           "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",       2.07,   "1,44",
                                                     "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",      1.831,   "1,27",
                                                                                         "VOTOS POSITIVOS",     143.63,  "93,88",
                                                                                         "VOTOS EN BLANCO",      7.912,   "5,17",
                                                                                             "VOTOS NULOS",      1.449,   "0,95"
                           )


santiago_presi_gral_2011  <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 338.482, "82,11",
                                         "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",     29.197,   "7,08",
                                                      "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     16.942,   "4,11",
                                                                "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",     13.665,   "3,32",
                                                         "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",       6.83,   "1,66",
                                     "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",      4.396,   "1,07",
                               "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      2.705,   "0,66",
                                                                                             "VOTOS POSITIVOS",    412.217,  "98,26",
                                                                                             "VOTOS EN BLANCO",      5.234,   "1,25",
                                                                                                 "VOTOS NULOS",       2.08,   "0,50"
                               )

tucuman_presi_gral_2011 <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,
  "Fernández.de.Kirchner.-.Boudou.(ALIANZA.FRENTE.PARA.LA.VICTORIA)", 526.267, "65,19",
                                       "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",    107.492,  "13,31",
                                                    "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",     87.539,  "10,84",
                                                       "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",     39.367,   "4,88",
                                                              "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",     23.455,   "2,91",
                                   "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",     15.474,   "1,92",
                             "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",      7.738,   "0,96",
                                                                                           "VOTOS POSITIVOS",    807.332,  "98,11",
                                                                                           "VOTOS EN BLANCO",      8.935,   "1,09",
                                                                                               "VOTOS NULOS",      6.647,   "0,81"
                             )


tdf_presi_gral_2011  <- tibble::tribble(
  ~`lista`,  ~`votos`, ~`pct`,                                       "Fernández de Kirchner - Boudou (ALIANZA FRENTE PARA LA VICTORIA)", 48.465,  6843,
                                                 "Binner - Morandini (ALIANZA FRENTE AMPLIO PROGRESISTA)",  7.267,  1026,
                                    "Alfonsin - González Fraga (ALIANZA UNIÓN PARA EL DESARROLLO SOCIAL)",  6.117,   864,
                                                    "Rodríguez Saa - Vernet (ALIANZA COMPROMISO FEDERAL)",  4.032,   569,
                                                           "Duhalde - Das Neves (ALIANZA FRENTE POPULAR)",   2.51,   354,
                                "Altamira - Castillo (ALIANZA FRENTE DE IZQUIERDA Y DE LOS TRABAJADORES)",   1.37,   193,
                          "Carrió - Pérez (COALICIÓN CÍVICA - AFIRMACIÓN PARA UNA REPÚBLICA IGUALITARIA)",  1.063,   150,
                                                                                        "VOTOS POSITIVOS", 70.824,  9655,
                                                                                        "VOTOS EN BLANCO",  1.182,   161,
                                                                                            "VOTOS NULOS",   1.35,   184
                          )

### HARDCODE INPUT ELECTORES x PROVINCIA ----



dfs <- c("caba_presi_gral_2011"       ,"catamarca_presi_gral_2011" , "chaco_presi_gral_2011"    ,  "chubut_presi_gral_2011"  ,   "cordoba_presi_gral_2011" ,  
         "corrientes_presi_gral_2011" ,"erios_presi_gral_2011"     , "formosa_presi_gral_2011"  ,  "jujuy_presi_gral_2011"   ,   "mendoza_presi_gral_2011" ,  
         "misiones_presi_gral_2011"  , "neuquen_presi_gral_2011"  ,  "pampa_presi_gral_2011"   ,   "rioja_presi_gral_2011"  ,    "rnegro_presi_gral_2011" ,   
         "salta_presi_gral_2011"     , "santiago_presi_gral_2011" ,  "scruz_presi_gral_2011"   ,   "sjuan_presi_gral_2011"  ,    "sluis_presi_gral_2011",
         "tucuman_presi_gral_2011", "tdf_presi_gral_2011" )


electores_provincias_2011 <- tibble(dfs) %>% 
  mutate(electores = case_when(
    dfs == "caba_presi_gral_2011" ~   2511197    ,
    dfs == "catamarca_presi_gral_2011" ~ 258405,
    dfs == "chaco_presi_gral_2011" ~    762198 ,
    dfs == "chubut_presi_gral_2011" ~    360769,
    dfs == "cordoba_presi_gral_2011" ~  2505346 ,
    dfs == "corrientes_presi_gral_2011" ~ 699791,
    dfs == "erios_presi_gral_2011" ~     922398,
    dfs == "formosa_presi_gral_2011" ~   360443,
    dfs == "jujuy_presi_gral_2011" ~     444592,
    dfs == "mendoza_presi_gral_2011" ~   1234251,
    dfs == "misiones_presi_gral_2011" ~  723136,
    dfs == "neuquen_presi_gral_2011" ~   407160,
    dfs == "pampa_presi_gral_2011" ~     250334,
    dfs == "rioja_presi_gral_2011" ~    232010 ,
    dfs == "rnegro_presi_gral_2011" ~    439560,
    dfs == "salta_presi_gral_2011" ~     819834,
    dfs == "santiago_presi_gral_2011" ~  601490,
    dfs == "scruz_presi_gral_2011" ~     199870,
    dfs == "sjuan_presi_gral_2011" ~     469231,
    dfs == "sluis_presi_gral_2011" ~ 312226,
    dfs == "tucuman_presi_gral_2011" ~ 1018979,
    dfs == "tdf_presi_gral_2011" ~ 100096,
  )) 




#### WRANGLE DATA ----

# GENERO FUNCION PARA FORMATEAR DATOS NUEVOS SIGUIENDO ESTRUCTURA DE CASOS YA CARGADOS (sfe, arg, pba) AGREGANDO ELECTORES


wrangle_eleccion <- function(eleccion = NULL){
  
  
  deparse(substitute(eleccion)) -> filename
  
  
  eleccion %>% 
    dplyr::select(listas = lista, votos) %>% 
    dplyr::mutate(listas = dplyr::case_when(
      stringr::str_detect(listas, "BLANCO") ~ "Votos En Blanco",
      stringr::str_detect(listas, "NULO") ~ "Votos Nulos",
      TRUE ~ listas
    )) %>% 
  dplyr::filter(stringr::str_detect(listas, "POSITIVOS", negate = TRUE)) %>% 
  dplyr::mutate(votos = as.integer(stringr::str_replace_all(string = votos,
                                                 pattern = "[^[:alnum:] ]", 
                                                 replacement = ""))) %>% 
  dplyr::mutate(electores = electores_provincias_2011$electores[filename == electores_provincias_2011$dfs]) %>% 
  readr::write_csv(glue::glue("salidas/{filename}.csv"))

  
  
  
}


    
  
# TESTEO 
 wrangle_eleccion(tucuman_presi_gral_2011)
