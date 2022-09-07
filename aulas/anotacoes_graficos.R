
# Visualização de dados ---------------------------------------------------

# Para tabalhar com gráficos iremos utilizar o pacote ggplot2 presente no 
# meta pacote tidyverse.



# Carregando o pacote: ----------------------------------------------------

library(tidyverse)

mpg

# Plotando um gráfico: ----------------------------------------------------

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))



# Modelo exemplar de um gráfico no ggplot2 --------------------------------
# 
# ggplot(data = <DATA>) + 
#   <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))



# Plotando outro gráfico --------------------------------------------------

diamonds


ggplot(data = diamonds)+
  geom_col(mapping = aes(x = cut, y = price))+
  coord_flip()



ggplot(data = mpg)+
  geom_point(mapping = aes(x = hwy, y = cyl))
