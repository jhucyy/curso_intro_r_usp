
# Review - manipulações mais simples no R ---------------------------------

# Renomeando variáveis:


library(tidyverse)
library(nycflights13)
flights %>% 
  rename("departure_time" = dep_time)


## Filtrar com base em mês e dia


flights %>% 
  filter(month == 1 & day ==2)


## Abrindo bancos de dados:


mortalidade_infantil <- read_csv("./mortalidade-infantil-óbitos-a-cada-mil-nascidos-vivos.csv")

