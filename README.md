
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Los partidos políticos argentinos y sus sistemas desde 1983 a la actualidad

Este proyecto se corresponde con la sección **Una democracia en datos**
del artículo en colaboración entre Juan Manuel Abal Medina y Juan Pablo
Ruiz Nicolini.

![](plots/indicadores_nacional_patchwork.png)<!-- -->

## CONTENIDO

- En este repositorio se incluye el código fuente para el acceso a datos
  y generación de insumos incluidos en el análisis.

- La mayor parte del procesamiento se realizo a través del proyecto
  [`electorAr`](https://politicaargentina.github.io/electorAr/): una
  librería de `R` que brinda herramientas que facilitan el acceso y el
  trabajo con datos electorales de Argentina.

- La fuente original (detrás de `electorAr`) es el [Atla Electoral de
  Andy Tow](https://www.andytow.com/atlas/totalpais/)

## Indicadores relevados

- El análisis se concentra principalmente en datos relativos a las
  elecciones presidenciales desde el retorno de la democracia (1983
  -2019)

- Se comparten datos e indicadores tales como:

- Núnero Efectivo de Partidos (NEP)

- Particiación electoral

- Competitividad

- Concentración

## La estructura de los archivos se organiza del siguiente modo:

1.  En [codigo](%22/codigo%22) se encuentran los *scripts* para:

- Descarga de datos
- Genración de indicadores
- Tabulados y Gráficos

2.  En [plots](%22/plots%22) se guardan las salidas (gráficos y tablas)
    que ilustran los indicadores
