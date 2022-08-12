
# Estatísticas resumidas --------------------------------------------------

# Estatísticas resumidas simplificam os resultados das operações matemáticas.

# O argumento que utilizamos para estatísticas resumidas é o summarize(), 
# esta função colapsa toda uma cadeia de números em um único número.



library(tidyverse)
library(nycflights13)
# Ex: ---------------------------------------------------------------------

flights %>% 
  summarize(media_distance = mean(distance))



# Ex mediana:

flights %>% 
  summarize(mediana_distance = median(distance))


# desvio padrão distance:

library(stats)

flights %>% 
  summarise(desvio_p_dist = sd(distance))


# máximo distance


flights %>% 
  summarize(max_distance = max(distance))



# min distance:

flights %>% 
  summarize(min_distance = min(distance))



# Ex, várias estatísticas em um mesmo código:

flights %>% 
  summarize(mean_distance = mean(distance),
            mediana_distance = median(distance),
            sd_distance = sd(distance))



# Retirando os NAS:

flights %>% 
  summarize(dep_delay = mean(dep_delay, na.rm = T))


# argumento na.rm = T retira os NAS dos cálculos, como já bem atestado no R
# os NA's (dados indisponíveis ou ausentes) são "contagiosos" de modo que 
# contaminam o resultado sempre como NA, quando presentes. 



# Criando uma função ------------------------------------------------------


mult_ao_quadr <- function(x){
  calculo <- x ^ 2
  
  return(calculo)
}

mult_ao_quadr(5)

# para a função é necessário, primeiro, nomeiar a função, depois estabelecer
# os argumentos padrão, depois realizar a operação e plotar o resultado 
# da operação. 



# Função 2 ----------------------------------------------------------------

# esta função irá se chamar mais 2, pois soma sempre mais dois números
# na variável:


mais_dois <- function(x){
  calculo <- x + 2
  return(calculo)
}


mais_dois(5)



# group_by ----------------------------------------------------------------

# o argumento group_by agrupa um conjunto  de dados de um mesmo tipo na
# tabela, isto facilita para realizar as operações estatísticas.


# O group_by é mais útil quando o utilizamos combinado com outras funções:

# operação: calcular a distância média dos voos de origem:


flights %>% 
  group_by(origin) %>% 
  summarize(mean_distance = mean(distance, na.rm = T))


# voos mais atrasados dos aeroportos de origem:

flights %>% 
  group_by(origin) %>% 
  top_n(1, dep_delay)


# parei aqui

# Número de observações por Grupo (tally)
# https://jonnyphillips.github.io/Ciencia_de_Dados/Estatisticas_Resumidas.html







