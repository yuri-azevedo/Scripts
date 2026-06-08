# Aula 1 - Parte 1

## Introdução ao R

### Criando um Dataframe

tickers <- c( "WEGE", "EGIE", "BBAS", "ITUB",  "PETR4", "VALE3", "MGLU3")

cotacoes <- c(49.05, 31.54, 22.40, 41.23, 38.72, 68.45, 2.45)

tickers_df <- data.frame(Ticker = tickers, Cotacao = cotacoes)

tickers_df

### Importando uma Base de Dados

install.packages("readxl")

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/Dataframe1.xlsx"

download.file(url, destfile = "Dataframe1.xlsx", mode = "wb")

Dataframe1 <- read_excel("Dataframe1.xlsx")

View(Dataframe1)

## Estatística Descritiva Univariada

### Importação da Base de Dados

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeAcao.xlsx"

download.file(url, destfile = "DataframeAcao.xlsx", mode = "wb")

DataframeAcao <- read_excel("DataframeAcao.xlsx")

View(DataframeAcao)

### Medidas-resumo para Variáveis Quantitativas

length(DataframeAcao$Preco)

mean(DataframeAcao$Preco)

sd(DataframeAcao$Preco)

median(DataframeAcao$Preco)

min(DataframeAcao$Preco)

max(DataframeAcao$Preco)

### Carregamento dos Pacotes - Estatística Descritiva Agregada

install.packages("psych")

install.packages("dplyr")

library(psych)

library(dplyr)

### Estatística Descritiva Agregada

describe(DataframeAcao) %>% select (n, mean, sd, median, min, max)

### Medidas-resumo para Variáveis Qualitativas (Freqûencia Absoluta e Relativa)

freqabs <- table(DataframeAcao$DirecaoPreco)

freqabs

freqrelat <- 100*prop.table(freqabs)

freqrelat

### Gráfico de Linhas

plot(DataframeAcao$Preco, type = "l", xlab = "Dias", ylab = "Preço")

### Gráfico de Pontos

plot(DataframeAcao$Preco, type = "p", pch = 16, xlab = "Dias", ylab = "Preço")

### Gráfico de Barras

barplot(DataframeAcao$Volume, 
        names.arg = 1:nrow(DataframeAcao),
        xlab = "Dias", 
        ylab = "Preço")

### Histograma

hist(DataframeAcao$Volume,
     main = "Distribuição do Volume",
     xlab = "Volume",
     ylab = "Frequência")

### Boxplot

boxplot(DataframeAcao$Volume)

boxplot(DataframeAcao$Retorno)

### Adicionando Parâmetros

plot(DataframeAcao$Preco, type = "l", xlab = "Dias", ylab = "Preço")

abline(lm(DataframeAcao$Preco ~ seq_along(DataframeAcao$Preco)), 
       col = "red", lwd = 2)

### Alterando Formato do Gráfico

plot(DataframeAcao$Preco, type = "p",       
     col = "blue",                          # cor dos pontos
     pch = 1,                                # círculo vazio
     cex = 1.2,                              # tamanho do ponto
     xlab = "Dias", ylab = "Preço")

