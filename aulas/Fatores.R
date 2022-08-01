
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



# fct_recode --------------------------------------------------------------

# Enquanto fct_reorder serve para fazer o reordenamento de fatores, fct_recode
# serve para mudar o valor dos fatores. 

# ex:

gss_cat %>%
  mutate(partyid = fct_recode(partyid,  "Republican, strong"    = "Strong republican",
                              "Republican, weak"      = "Not str republican",
                              "Independent, near rep" = "Ind,near rep",
                              "Independent, near dem" = "Ind,near dem",
                              "Democrat, weak"        = "Not str democrat",
                              "Democrat, strong"      = "Strong democrat")) %>% 
  count(partyid)






# fct_collapse ------------------------------------------------------------

# Por outro lado, o verbo fcr_collpse, serve para colpsar, ou seja, agrupar
# vários valores em um mesmo denominador comum. 

# ex:

gss_cat %>%
  mutate(partyid = fct_collapse(partyid,
                                other = c("No answer", "Don't know", "Other party"),
                                rep = c("Strong republican", "Not str republican"),
                                ind = c("Ind,near rep", "Independent", "Ind,near dem"),
                                dem = c("Not str democrat", "Strong democrat")
  )) %>%
  count(partyid)



# fct_lump ----------------------------------------------------------------


gss_cat %>% 
  mutate(relig = fct_lump(relig)) %>% 
  count(relig)



gss_cat %>% 
  group_by(relig) %>% 
  count(relig)


gss_cat %>% 
  mutate(relig = fct_lump(relig, n = 10)) %>% 
  count(relig)


# fct_lump faz o mesmo que a função group_by. A diferença é que você
# pode escolher quantos grupos quer que seja colpsado com o parâmetro 
# n = x



# Exercício ---------------------------------------------------------------

# How have the proportions of people identifying as Democrat, 
# Republican, and Independent changed over time?


gss_cat %>% 
  group_by(partyid) %>% 
  count(partyid)


parties_col <- gss_cat %>% 
  mutate(partyid = fct_collapse(partyid, Other = c("No answer", "Don't know",
                                                   "Other party"), 
                                Republican = c("Strong republican", "Not str republican",
                                               "Not str republican"),
                                Independent = c("Ind,near rep", "Independent", 
                                                "Ind,near dem"),
                                Democrat = c("Not str democrat", "Strong democrat")))



parties_col %>% 
  ggplot(aes(x = partyid, y = year)) + 
  geom_line()+
  coord_polar()




# 

gss_cat %>% 
  mutate(rincome = fct_lump(rincome)) %>% 
  count(rincome)
  



