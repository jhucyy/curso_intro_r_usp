
# Introdução --------------------------------------------------------------

# O curso tem como objetivo auxiliar estudantes da
# pós a desenvolver habilidades computacionais, que
# permitam a elobaração de um projeto, desde a fase de
# criação do primeiro script para a extração dos dados
# até a limpeza dos dados, data wrangling, para se
# se chegar ao ideal tidy
# e por fim a estruturação de gráficos
# e fomentação de análises claras e objetivas sobre os dados.



# Objetivos a serem alcançados --------------------------------------------

# O curso se estrutura em 4 princípios
# 1 - Transparência:
# toda a análise pode ser inspecionada, 
# e as origens dos erros podem ser identificados.

# 2 - Simplicidade:
# digitar os códigos da forma mais simples e 
# clara possível, para que seja 
# de fácil leitura e compreensão.

# 3 - Reprodutibilidade:
# Outras pessoas devem ser capaz de 
# reproduzir aquilo que fizemos no nosso código.

# 4 - Entender os dados:
# nada disto terá sentido, se ao final do processo
# não for possível despreender análises a partir 
# da base de dados extraída.



# Na análise --------------------------------------------------------------

# comumente, nossos objetivos podem ser
# criar gráficos, tabelas e relatórios 
# a partir do código.



# Rmarkdown ---------------------------------------------------------------

# rmarkdown é o output ideal para a análise empreendida dentro do R
# nos arquivos rmardown é possível combinar textos explicativos
# com código de programação e salvar este conteúdo em um output em formato
# html, word, pdf, ideal para relatórios ou artigos. 

# No rmardown há dois campos, o campo para o texto normal e o campo
# chunck para o código/tabelas/gráficos - fundo cinza


# Formatação de texto no Rmarkdown ----------------------------------------



*Itálico*
  
  **Bold**
  
  # Cabeçalho de seção
  
  
  ## Sub-cabeçalho
  `

### Sub-Sub-cabeçalho

# [link](http://www.google.com)
# 
# * Bullets
# [quatro espaços]    * Sub-Bullets
# 
# 1. Lista numerada
# [quatro espaços]    1. Sub-Lista numerada
# 
# Itálico
# 
# Bold
# Cabeçalho de seção
# Sub-cabeçalho
# Sub-Sub-cabeçalho
# 
# link
# 
# Bullets
# Sub-Bullets
# 
# Lista numerada


# Explorando pacotes ------------------------------------------------------

library(nycflights13)

flights <- nycflights13::flights

rm(list = ls())




# Parei aqui

# https://jonnyphillips.github.io/Ciencia_de_Dados/introducao.html

# Exercício 2: Aprender juntos