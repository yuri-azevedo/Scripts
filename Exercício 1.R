# Exercício 1

### Importando a Base de Dados

install.packages("readxl")

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/Exercicio1.xlsx"

download.file(url, destfile = "Exercicio1.xlsx", mode = "wb")

Exercicio1 <- read_excel("Exercicio1.xlsx")

View(Exercicio1)

### Estatística Descritiva Agregada

install.packages("dplyr")

install.packages("psych")

library(dplyr)

library(psych)

describe(Exercicio1) %>% select (n, mean, sd, median, min, max)
