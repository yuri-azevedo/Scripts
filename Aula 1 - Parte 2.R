# Aula 1 - Parte 2

## Estatística Descritiva Bivariada

### Importação da Base de Dados

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeContingencia.xlsx"

download.file(url, destfile = "DataframeContingencia.xlsx", mode = "wb")

DataframeContingencia <- read_excel("DataframeContingencia.xlsx")

View(DataframeContingencia)

### Tabela de Contingência

tabelacont <- table(DataframeContingencia$Nivel_de_Renda, DataframeContingencia$Situacao_Pagamento)

tabelacont

### Gráfico de Análise Bivariada

install.packages("ggplot2")

library(ggplot2)

# Gráfico
ggplot(DataframeContingencia, aes(Nivel_de_Renda, fill = Situacao_Pagamento)) +
  geom_bar(position = "dodge")

### Importação da Base de Dados

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeAcoes.xlsx"

download.file(url, destfile = "DataframeAcoes.xlsx", mode = "wb")

DataframeAcoes <- read_excel("DataframeAcoes.xlsx")

View(DataframeAcoes)

### Exemplo Gráfico para Análise de Variáveis Quantitativas

library(ggplot2)

ggplot(DataframeAcoes, aes(Dia)) +
  geom_point(aes(y = Acao_A, color = "Ação A")) +
  geom_point(aes(y = Acao_B, color = "Ação B")) +
  labs(x = "Dia", y = "Preço")

## Testes Paramétricos - T-Student

### Importando uma Base de Dados

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeFundos.xlsx"

download.file(url, destfile = "DataframeFundos.xlsx", mode = "wb")

DataframeFundos <- read_excel("DataframeFundos.xlsx")

View(DataframeFundos)

### Testando Normalidade dos Dados

hist(DataframeFundos$AlaskaBlack)

hist(DataframeFundos$DynamoCougar)

shapiro.test(DataframeFundos$AlaskaBlack)

shapiro.test(DataframeFundos$DynamoCougar)

### Teste T de Student 

options(scipen = 999)

t.test(DataframeFundos$AlaskaBlack, DataframeFundos$DynamoCougar, paired = TRUE)

summary(DataframeFundos)

## Testes Não Paramétricos

### Teste de McNemar

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeMcnemar.xlsx"

download.file(url, destfile = "DataframeMcnemar.xlsx", mode = "wb")

DataframeMcnemar <- read_excel("DataframeMcnemar.xlsx")

View(DataframeMcnemar)

install.packages("pacman")

install.packages("exact2x2")

install.packages("dplyr")

library(pacman)

library(exact2x2)

library(dplyr)

DataframeMcnemar$AntesPandemia <- factor(DataframeMcnemar$AntesPandemia,
                                label = c("Não", "Sim"),
                                levels = 0:1, order = T)

DataframeMcnemar$AposPandemia <- factor(DataframeMcnemar$AposPandemia,
                                         label = c("Não", "Sim"),
                                         levels = 0:1, order = T)

View(DataframeMcnemar)

tabelacruzada <- table(Antes = DataframeMcnemar$AntesPandemia, Apos = DataframeMcnemar$AposPandemia)

tabelacruzada

mcnemar.test(tabelacruzada)

### Teste de Wilcoxon

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeWilcoxon.xlsx"

download.file(url, destfile = "DataframeWilcoxon.xlsx", mode = "wb")

DataframeWilcoxon <- read_excel("DataframeWilcoxon.xlsx")

View(DataframeWilcoxon)

install.packages("rstatix")

install.packages("dplyr")

library(rstatix)

library(dplyr)

options(scipen = 999)

shapiro.test(DataframeWilcoxon$AntesPandemia)

shapiro.test(DataframeWilcoxon$AposPandemia)

wilcox.test(DataframeWilcoxon$AntesPandemia, DataframeWilcoxon$AposPandemia, paired = TRUE)

summary(DataframeWilcoxon)

### Teste U de Mann-Whitney

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeMannWhitney.xlsx"

download.file(url, destfile = "DataframeMannWhitney.xlsx", mode = "wb")

DataframeMannWhitney <- read_excel("DataframeMannWhitney.xlsx")

View(DataframeMannWhitney)

DataframeMannWhitney$ADR <- factor(DataframeMannWhitney$ADR,
                                   label = c("Não", "Sim"),
                                   levels = 0:1, order = T)

View(DataframeMannWhitney)

wilcox.test(ROE ~ ADR, data = DataframeMannWhitney) 

# Obs: Categoria (fator) sempre na segunda variável

### Teste Qui-quadrado

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeContingencia.xlsx"

download.file(url, destfile = "DataframeContingencia.xlsx", mode = "wb")

DataframeQuiquadrado <- read_excel("DataframeContingencia.xlsx")

View(DataframeQuiquadrado)

install.packages("dplyr")

install.packages("lsr")

library(dplyr)

library(lsr)

tabelacruzada <- table(DataframeQuiquadrado$Nivel_de_Renda, DataframeQuiquadrado$Situacao_Pagamento)
tabelacruzada

options (scipen=999)

quiqua2 <- chisq.test(tabelacruzada)
quiqua2

library(lsr)

cramersV(tabelacruzada)

