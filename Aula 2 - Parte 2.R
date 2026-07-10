# Aula 2 - Parte 2

## Regressão com Dados em Painel

### Importando a Base de Dados

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframePainel.xlsx"

download.file(url, destfile = "DataframePainel.xlsx", mode = "wb")

DataframePainel <- read_excel("DataframePainel.xlsx")

View(DataframePainel)

### Instalando e Carregando os Pacotes

install.packages("plm")
install.packages("stargazer")
install.packages("lmtest")
install.packages("tseries")

library(plm)
library(stargazer)
library(lmtest)
library(tseries)

### Rodando os Modelos para Comparação (Efeitos Aleatórios, Fixos e Pooled)

options (scipen = 999)

painelaleatorio <- plm(ROA ~ Tamanho + Alavancagem + OportunidadeCrescimento + Tangibilidade, 
                       DataframePainel, 
                       index = c("ID", "ANO"),
                       model = "random")

summary(painelaleatorio)

painelfixo <- plm(ROA ~ Tamanho + Alavancagem + OportunidadeCrescimento + Tangibilidade, 
                  DataframePainel, 
                  index = c("ID", "ANO"),
                  model = "within")

summary(painelfixo)

regresspooled <- plm(ROA ~ Tamanho + Alavancagem + OportunidadeCrescimento + Tangibilidade, 
                     DataframePainel,
                     model = "pooling")

summary(regresspooled)

## Comparação de Modelos

### Comparação: Efeitos aleatórios ou pooled

plmtest(regresspooled, type = c("bp"))

### Comparação: Efeitos fixos ou pooled

pFtest(painelfixo, regresspooled)

### Comparação: Efeitos fixos ou aleatórios

phtest(painelfixo, painelaleatorio)

## Testando os Pressupostos

### Autocorrelação serial

pbgtest(painelfixo)

### Heterocedasticidade

bptest(painelfixo)

## Corrigindo p problema de Heterocedasticidade

painelfixo_robusto <- coeftest(painelfixo, vcovHC)

painelfixo_robusto

## Exportando Estimação

library(stargazer)

stargazer(painelfixo_robusto, type = "html", out = "painelfixo_robusto.html")

### Descobrindo o diretório onde foi salvo

getwd()


