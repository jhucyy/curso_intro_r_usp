
# Exploração dos dados ----------------------------------------------------

# A etapa de exploração dos dados consiste na arte de olhar os dados, e rapidamente
# começar a formular hipóteses, e testar essas hipóteses e repetir esse processo
# continuamente. 

# o objetivo da exploração de dados é criar pistas, que mais tarde poderão
# ser analisadas de forma mais profunda no processo de compreensão dos dados.



# Transformação dos dados -------------------------------------------------

library(tidyverse)
library(nycflights13)



# filter , filtra as linhas das variáveis:

flights %>% 
  filter(month == 1, day == 1)


# todos os voos de novembro ou dezembro:

flights %>% 
  filter(month == 11 | month == 12)



flights %>% 
  filter(month %in% c(11, 12))


ar_delay <- flights %>% 
  filter(arr_delay >= 120)


houston <- flights %>% 
  filter(dest %in% c("IAH", "HOU"))

# UA, AA, DL

companies <- flights %>% 
  filter(carrier %in% c("UA", "AA", "DL"))


# July, August, and September

flights %>% 
  filter(month %in% c(7, 8, 9))


# Arrived more than two hours late, but didn’t leave late

times <- flights %>% 
  filter(arr_delay >= 120 & dep_delay <= 0)

View(flights)


# Were delayed by at least an hour, but made up over 30 minutes in flight

flights %>% 
  filter(arr_delay >= 120 & arr_time < 30)




# Arrange -----------------------------------------------------------------

flights %>% 
  arrange(desc(dep_delay))


flights %>% 
  arrange(dep_delay)


flights %>% 
  arrange(!is.na(flights))


# Sort flights to find the most delayed flights. Find the flights that left earliest.
atrasos <- flights %>% 
  arrange(desc(arr_delay))


adiantados <- flights %>% 
  arrange(dep_time)


flights %>% 
  arrange(arr_time)

flights %>% 
  arrange(desc(arr_time))



# Símbolos de comparação --------------------------------------------------
# esses símbolos devem ser utilizados nas filtragens de linhas, para 
# comparar observações.

# < menor que
# <= menor ou igual que
# > maior que
# >= maior ou igual que
# != não igual
# == igual


# transmute(flights,
# dep_time,
# hour = dep_time %/% 100,
# minute = dep_time %% 100
# )


# deep_time and sched_deeptime

# modular arithmetic 
# operações com interger 
# transformar números quebrados em horas e minutos
flights

flights %>% 
  transmute(dep_time,
            hour = dep_time %/% 100,
            minute = dep_time %% 100)

View(flights)


flights %>% 
  transmute(sched_dep_time,
            hour = sched_arr_time %/% 100,
            minute = sched_dep_time %% 100)


# delay rank, most delay flights


min_rank(flights$dep_delay)
flights %>% 
  arrange(desc(dep_delay))



# Summarise ---------------------------------------------------------------

by_day <- flights %>% 
  group_by(year, month, day)


summarise(by_day, delay = mean(dep_delay, na.rm = T))



# Group_by ----------------------------------------------------------------

flights %>% 
  group_by(dest)


# distance

View(flights)


flights %>% 
  summarise(distance_mean = mean(distance, na.rm = T))


flights %>% 
  summarise(average_delay = mean(dep_delay, na.rm = T))


count(flights)



# Continuação 5.6.2 -------------------------------------------------------

library(tidyverse)
library(nycflights13)



flights %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay, na.rm = T))



not_cancelled <- flights %>% 
  filter(!is.na(dep_delay) & !is.na(arr_delay))


delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(delay = mean(arr_delay))


ggplot(data = delays, mapping = aes(x = delay)) +
  geom_freqpoly(binwidth = 10)




delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(delay = mean(arr_delay), n = n())


ggplot(data = delays, mapping = aes(x = n, y = delay))+
  geom_point(alpha = 1/10)
