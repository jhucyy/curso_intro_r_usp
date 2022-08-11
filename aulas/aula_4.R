
# Estatísticas resumidas --------------------------------------------------

# Estatísticas resumidas simplificam os resultados das operações matemáticas.

# O argumento que utilizamos para estatísticas resumidas é o summarize(), 
# esta função colapsa toda uma cadeia de números em um único número.


# Ex: ---------------------------------------------------------------------

library(tidyverse)
library(nycflights13)

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











