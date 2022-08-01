
# Tidy data ---------------------------------------------------------------

#"Tidy datasets are all alike, but every messy dataset is messy in it's own way"
# Hardley Wickham.


# Pacote ------------------------------------------------------------------

# Para esta etapa utilizaremos o pacote tidyr, presente no meta pacote
# tidyverse.

library(tidyverse)



# Tidy data ---------------------------------------------------------------

# Os dados podem ser representados de formas diferentes.

# Princípios da organização tidy dos dados:

# 1 - cada variavél deve ter a sua própria coluna;
# 2- cada observação a sua própria linha;
# 3 - cada valor em sua própria célula.

# Obs: estes princípios ajudam a organizar as bases de dados de forma
# que facilitam a sua manipulação e visualização.



# Exercícios --------------------------------------------------------------
# 
# Compute the rate for table2, and table4a +
#   table4b. You will need to perform four operations:

table2_tidy <- table2 %>% 
  pivot_wider(names_from = type, values_from = count)


# atribuindo o rate para table2:

table2_tidy %>% 
  mutate(rate = cases / population * 10000)



# tidying table4a e table4b

table4a_tidy <- table4a %>% 
  pivot_longer(cols =  `1999`:`2000`, names_to = "year", values_to = "cases")


table4b_tidy <- table4b %>% 
  pivot_longer(cols =  `1999`:`2000`, names_to = "year", values_to = "population")


new <- left_join(table4a_tidy, table4b_tidy)

# Rates table new (table4a + table4b - tidy)

new %>% 
  mutate(rate = cases / population *10000)



# Dicas para organizar os dados conforme os princípios tidy ---------------

# Usualmente, a maioria dos dados que você irá entrar em contato não
# estará organizado conforme esses princípios, pelos motivos mais diversos. 
# Portanto, em ordem de adequar essa base, é necessário sempre, identificar
# quais são as colunas e quais são as observações. 



# Mais dois verbos do pacote tidyr - separate() e unite() -----------------

# Separate, separa uma coluna da outra. 

# ex:

table3 %>% 
  separate(rate, into = c("cases", "population"))


# sepate pode ter mais dois verbos adicionais, sep, definição do separador, 
# e convert = T, para converter o conjunto de dados para o formato mais 
# conveniente:

table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/", convert = T)


# outro exemplo com separate

table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)


# Unite

table5 %>% 
  unite(new, century, year, sep = " ")


# Exercícios --------------------------------------------------------------

who_tidy <- who %>% 
  select(-iso2, - iso3) %>% 
  pivot_longer(cols = new_sp_m014:newrel_f65, names_to = "key", values_to = "cases",
               values_drop_na = T) %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))

who_2 <- who_tidy %>% 
  separate(key, into = c("new", "type", "sexage"), sep = "_")

who_final <- who_2 %>% 
  separate(sexage, into = c("sex", "age"), sep = 1) %>% 
  select(-new)
  


