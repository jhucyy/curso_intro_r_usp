
# Review - organizando e limpando base de dados ---------------------------
library(tidyverse)


# Exemplos com o separate: ------------------------------------------------


# Separação por posição:
ex_separate <- tibble(ID=1:3,
                      Mes_Ano=c("jan2013","mar2009","out2015"))


ex_separate %>% 
  separate(Mes_Ano, into = c("Mes", "Ano"), sep = 3)

# Separação por caractere especial:



ex_separate_2 <- tibble(ID=1:3,
                        Mes_Ano=c("janeiro_2013","marco_2009","outobro_2015"))



ex_unite <- ex_separate_2 %>% 
  separate(Mes_Ano, into = c("Mes", "Ano"), sep = "_")




# Exemplos com o unite: ----------------------------------------------------

ex_unite %>% 
  unite(Mes_ano, c("Mes","Ano"), sep = "_")



# Exercícios: -------------------------------------------------------------

library(nycflights13)

# Crie uma data completa numa variável única, com o formato “day-month-year”.


nycflights13::flights %>% 
  unite(data_completa, c("day", "month", "year"), sep = "/")



# Divida a variável time_hour em duas: uma variável de time e a
# outra variável de hour.

flights %>% 
  separate(time_hour, into = c("time", "hour"), sep = " ") %>% 
  select(time, hour)



# Recodificação


 flights %>%
  mutate(dep_delay = case_when(dep_delay > 0 ~ 1, dep_delay <= 0 ~ 0))



# A companhia aérea US Airways (código ‘US’) se fundiu com 
# American Airlines (código ‘AA’). Recodifique voos de US 
# Airways como voos de American Airlines.


flights <- nycflights13::flights


flights %>% 
  mutate(carrier = case_when(carrier == "US"~"AA", TRUE~carrier))


flights %>% 
  rename(carrier, "AA" = US)




# Ordenação: --------------------------------------------------------------

# Ordene o banco de dados da menor à maior duração (air_time), 
# incluindo apenas os voos com destino de Anchorage (ANC).

flights %>% 
  filter(dest == "ANC") %>% 
  arrange(air_time) %>% 
  view()



# Identifique o voo mais atrasado (dep_delay) entre LaGuardia 
# (LGA) e Atlanta (ATL). Quão atrasado foi o voo?

flights %>% 
  filter(origin == "LGA" & dest == "ATL") %>% 
  arrange(desc(dep_delay)) %>% 
  slice(1)


flights %>% 
  filter(origin == "LGA" & dest == "ATL") %>% 
  top_n(1, dep_delay)



flights %>% 
  mutate(velocidade = distance / air_time) %>% 
  top_n(3, velocidade) %>%
  select(velocidade, origin, dest)


# Para os voos com destino em Anchorage (ANC),
# verifique que eles são ordenados cronologicamente
# (por year, month, day, e dep_time) e gera uma nova variável com a
# duração (air_time) do voo anterior. Agora, 
# compare a duração de cada voo com a duração do voo anterior.
 

flights %>% 
  filter(dest == "ANC") %>% 
  arrange(year, month, day, dep_time) %>% 
  mutate(voo_anterior = lag(air_time),
         diferenca_voo_e_voo_ant = air_time - voo_anterior) %>% 
  select(dest, voo_anterior, diferenca_voo_e_voo_ant)

