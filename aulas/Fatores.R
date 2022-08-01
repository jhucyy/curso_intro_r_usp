
# Factors -----------------------------------------------------------------


# No R. fatores são utilizados para dispor dados categóricos. Ou seja, dados
# com um número fixado de valores.


# Pacote ------------------------------------------------------------------

# para trabalhar com fatores utilizamos o pacote forcats, também parte do 
# meta pacote tidyverse

library(tidyverse)


# Criando um fator --------------------------------------------------------

# para criar uma variável de fator é necessário estabelecer todos os níveis
# disponíveis.

# Imagine que você precisa criar um vetor de meses com um fator.
# Para isto, é necessário, primeiro, criar um vetor com todos os meses do ano.

meses_do_ano <- c("Janeiro", "Fevereiro", "Março", "Abril", "Maio",
                  "Junho", "Julho", "Agosto", "Setembro", "Outubro",
                  "Novembro", "Dezembro")


x1 <- c("Fevereiro", "Janeiro", "Junho")


fator <- factor(x1, levels = meses_do_ano)
fator



# Exercícios --------------------------------------------------------------


# Ordenando fatores para uma melhor visualização em gráficos
# Religião que passa mais tempo assistindo televisão

gss_cat %>% 
  group_by(relig) %>% 
  summarise(tvhours_mean = mean(tvhours, na.rm = T)) %>% 
  mutate(relig = fct_reorder(relig, tvhours_mean)) %>% 
  ggplot(aes(relig, tvhours_mean))+
  geom_point()+
  coord_flip()
  
  

# What if we create a similar plot looking at how
# average age varies across reported income level?

gss_cat %>% 
  group_by(rincome) %>% 
  summarise(mean_age = mean(age, na.rm = T)) %>% 
  mutate(rincome = fct_reorder(rincome, mean_age)) %>% 
  ggplot(aes(x = rincome, y = mean_age))+
  geom_col()+
  coord_flip()+
  theme_classic()

