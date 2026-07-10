### Exercício 5 - Regressão

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/Exercicio5.xlsx"

download.file(url, destfile = "Exercicio5.xlsx", mode = "wb")

Exercicio5 <- read_excel("Exercicio5.xlsx")

View(Exercicio5)

options(scipen = 999)

#### Instalação e Carregamento de Pacotes

install.packages("plm")
install.packages("stargazer")
install.packages("lmtest")
install.packages("tseries")

library(plm)
library(stargazer)
library(lmtest)
library(tseries)

#### Estimando os Modelos (EF, EA e pooled)


painelfixo <- plm(ESG ~ Alavancagem + ROE + MTB + Tamanho, 
                  Exercicio5, 
                  index = c("ID", "ANO"),
                  model = "within")


summary(painelfixo)

painelaleatorio <- plm(ESG ~ Alavancagem + ROE + MTB + Tamanho, 
                       Exercicio5, 
                       index = c("ID", "ANO"),
                       model = "random")


summary(painelaleatorio)

modelopooled <- plm(ESG ~ Alavancagem + ROE + MTB + Tamanho, 
                    Exercicio5, 
                    model = "pooling")


summary(modelopooled)

#### Identificando o modelo adequado

### Efeitos aleatórios ou pooled

plmtest(modelopooled, type = c("bp"))

### Efeitos fixos ou pooled

pFtest(painelfixo, modelopooled)

#### Testando os pressupostos -> Modelo OLS

library(dplyr)
library(rstatix)
library(lmtest)
library(robustbase)
library(car)
library(psych)

#### Normalidade dos Resíduos

shapiro.test(modelopooled$residuals)

#### Multicolinearidade

vif(modelopooled)

#### Homocedasticidade dos Resíduos

bptest(modelopooled)

### Verificando novamente o modelo final

summary(modelopooled)

### Exportando para Arquivo Externo

install.packages("texreg")

library(texreg)

htmlreg(modelopooled,
        file = "modelopooled.html",
        digits = 3,
        stars = c(0.01, 0.05, 0.10))

### Descobrindo o diretório onde foi salvo

getwd()

