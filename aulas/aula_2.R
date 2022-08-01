
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



not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(first_dp = first(dep_time),
            last_dp = last(dep_time))



library(readr)

?read_csv


# Parsing a vector  -------------------------------------------------------

parse_integer(c("1", "4", "5" , "a"), na = "a")

parse_date(c("2020-02-14", "2022-05-21"))


# utiliza-se o argumento locale e decimal mark para explicar qual o 
# elemento que separa o número inteiro do resto dos números, nesse 
# caso o padrão é o "." , mas conforme a descrição, o que está separando
# é a vírgula, então o argumento serve para "traduzir" está informação. 

# 1 problema a ser tratado no processo de parsing a number
# os números são descritos de formas diferentes ao redor do mundo, cada 
# país tem um padrão, assim, em alguns países a vírgula "," é utilizada 
# para separar os números inteiros, em outros é o ponto ".", a configuração
# do R é baseada no inglês americano, portanto, a opção mais simples é 
# adequar a descrição número nesse padrão, com o ponto, usando o argumento
# locale e decimal_mark, conforme no exemplo:

parse_double("1,25", locale = locale(decimal_mark = ","))


# parse_number, para tratar do segundo problema,
# os números estão, geralmente, relacionados com símbolos que especificam
# o seu contexto, como % e $

# Assim parse_number ignora os símbolos que aparecem antes ou depois dos
# números, e também serve para extrair números dentro de textos

parse_number("$100")

parse_number("10%")

parse_number("Maria ganhou 10 reais")




# Parsing strings ---------------------------------------------------------

# UTF-8 é o padrão de encoding mais universal, inclusive é o padrão de 
# encoding que suporta o português-br

# entretanto, se algum dia você tiver o azar de se bater com uma codificação
# em uma base de dados que seja anterior a implementação do padrão UTF-8, nesse
# caso será preciso especificar o encoding dos dados, com o argumento
# locale = locale(encoding = "Sistema")

x1 <- "El Ni\xf1o was particularly bad this year"

parse_character(x1)

parse_character(x1, locale = locale(encoding = "Latin1"))


# Como saber qual é o padrão de encoding correto? Caso não esteja 
# na documentação, a função guess_enconding auxilia nesse processo.
# É esperado algumas tentativas até encontrar o padrão correto.

guess_encoding(charToRaw(x1))


parse_character(x1, locale = locale(encoding = "ISO-8859-1"))


# Segundo exemplo:

x2 <- "\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd"

parse_character(x2, locale = locale(encoding = "KOI8-R"))

guess_encoding(charToRaw(x2))


# Parse factor

frutas <- c("abacaxi", "melão", "melancia")

parse_factor(c("abacaxi", "melão"), levels = frutas)



# Parsing dates and times -------------------------------------------------


parse_date("1997-08-18")

library(hms)

install.packages("hms")

parse_time("1:56 am")


date_names_langs()



# Tidy data  --------------------------------------------------------------

# tidyr é um pacote presente no metapacote tidyverse

library(tidyr)

# O processo de tornar uma base de dados "tidy" ou seja, organizada 
# conforme os princípios tidy condizente com a manipulação dos dados a partir
# do tidyverse, consiste em seguir este mantra

# em uma base ou tabela, cada linha (row) é uma observação
# e cada coluna uma variável. 
# cada valor deve ter sua própria coluna. 


# arrumando os datasets 

# Compute the rate for table2, and table4a + table4b. 
# You will need to perform four operations:
library(tidyverse)
table2


?pivot_wider

pivot_wider(table2, names_from = type, values_from = count) %>% 
  mutate(rate = cases / population * 10000)


table4a  

?pivot_longer


table4a <- pivot_longer(table4a, cols = `1999`:`2000`, names_to = "year", 
             values_to = "cases")

table4b <- pivot_longer(table4b, cols = `1999`:`2000`, names_to = "year",
             values_to = "cases")


table4b 

left_join(table4a, table4b) %>% 
  mutate(rate = cases/population * 10000)


# separate

# separar variáveis que estejam juntas em uma mesma coluna:

table3 %>% 
  separate(rate, into = c("cases", "population"))

# especificando o separador

table3 %>% 
  separate(rate, into = c("rate", "population"), sep = "/",
           convert = T)


table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)


# unite, juntar duas colunas que foram separadas

table5 %>% 
  unite(new, century, year, sep = "")
