### Exercício 3 - Correlação

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/Exercicio3.xlsx"

download.file(url, destfile = "Exercicio3.xlsx", mode = "wb")

Exercicio3 <- read_excel("Exercicio3.xlsx")

View(Exercicio3)

options(scipen = 999)

#### Teste de normalidade

shapiro.test(Exercicio3$LiquidezCorrente)
shapiro.test(Exercicio3$ROA)
shapiro.test(Exercicio3$Endividamento)
shapiro.test(Exercicio3$Risco)

#### Correlações

cor.test(Exercicio3$LiquidezCorrente,Exercicio3$ROA, method = "spearman")

cor.test(Exercicio3$Endividamento,Exercicio3$Risco, method = "spearman")

