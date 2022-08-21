
# Construindo tabelas -----------------------------------------------------

# formatação de tabelas, pacote knitr

install.packages("knitr")
library(knitr)
library(tidyverse)

# printando tabelas estáticas com kable:

library(nycflights13)

flights %>% 
  slice(10) %>% 
  kable()


flights %>% 
  filter(origin == "JFK") %>% 
  kable()


# obs: quando printamos tabelas estáticas com kable, o padrão é que todos os
# dados sejam printados, então, caso a tabela seja muito grande, é recomendado
# limitar o tamanho dos dados, seja filtrando ou selecionando as linhas
# desejadas. 


flights %>% sample_n(5) %>% kable()

# a função sample_n() seleciona um conjunto de linhas aleatórias a cada vez
# que é rodada. 


flights %>% 
  sample_n(10) %>% 
  select(month, day, origin, dest, carrier) %>% 
  kable(caption = "Tabela aleatória")



# a função digits() limita o número de dígitos printados na tabela:

flights %>% 
  sample_n(10) %>% 
  mutate(velocidade = distance/air_time) %>% 
  select(day, month, origin, dest, carrier, velocidade) %>% 
  kable(caption = "Tabela aleatória", digits = 1)

# com o argumento digits é possível arredondar os resultados numéricos
# plotados sem nenhum cálculo prévio.

# kable também permite renomear as colunas da tabela sem alterar a tabela 
# original. 

flights %>% 
  sample_n(10) %>% 
  select(day, month, origin, dest, carrier) %>% 
  kable(col.names = c("Dia", "Mês", "Origem", "Destino", "Companhia aérea"))



 