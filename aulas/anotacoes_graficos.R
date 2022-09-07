
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



# Adicionando mais propriedades estéticas ---------------------------------

# cor conforme variável class:
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, color = class))


# transparência conforme variável class:
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))


# tamanho conforme a variável class:
ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy, size = class))


# formato conforme variável class:
ggplot(data = mpg)+
  geom_point(mapping = aes(x  = displ, y = hwy, shape = class))



# facet_wrap --------------------------------------------------------------

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))+
  facet_wrap(~class, nrow = 2)



# facet_grid

ggplot(data = mpg)+
  geom_point(aes(x = displ, y = hwy))+
  facet_grid(drv ~ cyl)



# facet com variável contínua:
ggplot(data = mpg)+
  geom_point(aes(x = class, y = hwy))+
  facet_wrap(~displ)]




# geom_smooth:

ggplot(mpg)+
  geom_smooth(aes(x = displ, y = hwy))


# combinando mais de um geom:

ggplot(mpg, aes(x = displ, y = hwy))+
  geom_point() + geom_smooth(se = FALSE)




# Exercício de recriação dos gráficos: ------------------------------------

ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point() + geom_smooth(se = FALSE)



ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point(size = 2) + geom_smooth(se = FALSE, aes(line = drv))



ggplot(data = mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point(size = 2) + geom_smooth(se = FALSE)



ggplot(data = mpg, aes(x = displ, y = hwy, color = drv))+
 geom_point() + geom_smooth(aes(linetype = drv),se=FALSE, show.legend = FALSE)



ggplot(data = mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point() + geom_smooth(aes(linetype = drv), se = F)


ggplot(data = mpg, aes(x = displ, y = hwy, color = drv))+
  geom_point(size = 2)





ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy, color = drv),stroke = 3) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy), size=3,se=FALSE, show.legend = FALSE)


ggplot(data = mpg, aes(x = displ, y = hwy))+
  geom_point(aes(color = drv)) + geom_smooth(se = FALSE, show.legend = FALSE)
