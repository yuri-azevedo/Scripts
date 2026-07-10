# Aula 2 - Parte 1

## Correlação

### Importando a Base de Dados

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeCorrel.xlsx"

download.file(url, destfile = "DataframeCorrelacao.xlsx", mode = "wb")

DataframeCorrelacao <- read_excel("DataframeCorrelacao.xlsx")

View(DataframeCorrelacao)

### Testando Normalidade dos Dados

options(scipen = 999)

shapiro.test(DataframeCorrelacao$IBOV)

shapiro.test(DataframeCorrelacao$SELIC)

shapiro.test(DataframeCorrelacao$PETR)

shapiro.test(DataframeCorrelacao$OURO)

### Correlação de Pearson

cor.test(DataframeCorrelacao$IBOV, DataframeCorrelacao$SELIC, method = "pearson")

### Correlação de Spearman

cor.test(DataframeCorrelacao$PETR, DataframeCorrelacao$OURO, method = "spearman")

### Criando uma Matriz de Correlação

matrizcorrel <- round(cor(DataframeCorrelacao[2:5], method = "spearman"), 3)

matrizcorrel

## Regressão Linear Múltipla com Dados Transversais (Cross-Section)

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeRegmultipla.xlsx"

download.file(url, destfile = "DataframeRegmultipla.xlsx", mode = "wb")

DataframeRegmultipla <- read_excel("DataframeRegmultipla.xlsx")

View(DataframeRegmultipla)

### Categorizando as Variáveis Qualitativas

DataframeRegmultipla$PagouDividendos <- factor(DataframeRegmultipla$PagouDividendos,
                                label = c("Não", "Sim"),
                                levels = 0:1, order = T)

### Instalando e Carregando os Pacotes

install.packages("dplyr")
install.packages("rstatix")
install.packages("lmtest")
install.packages("robustbase")
install.packages("car")
install.packages("psych")

library(dplyr)
library(rstatix)
library(lmtest)
library(robustbase)
library(car)
library(psych)

### Estimando a Regressão Linear Múltipla

options(scipen = 999)

regmultipla <- lm(ROA ~ Tamanho + Endividamento + CrescimentoReceita + PagouDividendos, DataframeRegmultipla)

summary(regmultipla)

### Análise de Pressupostos

#### Normalidade dos Resíduos

shapiro.test(regmultipla$residuals)

#### Multicolinearidade

vif(regmultipla)

#### Homocedasticidade dos Resíduos

bptest(regmultipla)

##### Corrigindo problema de Heterocedasticidade

regmultiplarobusta <- lmrob(ROA ~ Tamanho + Endividamento + CrescimentoReceita + PagouDividendos, DataframeRegmultipla)

summary(regmultiplarobusta)

### Exportando para Arquivo Externo

install.packages("texreg")

library(texreg)

htmlreg(regmultiplarobusta,
        file = "regressao_robusta.html",
        digits = 3,
        stars = c(0.01, 0.05, 0.10))

### Descobrindo o diretório onde foi salvo

getwd()



