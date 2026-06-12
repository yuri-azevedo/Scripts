# Aula 1 - Parte 2 (Continuação)

## Análise de Conglomerados

### Importação da Base de Dados

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/DataframeClusters.xlsx"

download.file(url, destfile = "DataframeClusters.xlsx", mode = "wb")

DataframeClusters <- read_excel("DataframeClusters.xlsx")

View(DataframeClusters)

### Pacotes

install.packages("FactoMineR")
install.packages("cluster")
install.packages("ggplot2")
install.packages("openxlsx")

library(FactoMineR)
library(cluster)
library(ggplot2)
library(openxlsx)

### Descritiva para separação de grupos pode ser limitada

summary(DataframeClusters)

### Verificação de outliers

boxplot(DataframeClusters$PECLD, main = "Boxplot do PECLD")
boxplot(DataframeClusters$ROE, main = "Boxplot do ROE")
boxplot(DataframeClusters$Endividamento, main = "Boxplot do Endividamento")

### Transformando a primeira coluna em nomes

DataframeClusters <- as.data.frame(DataframeClusters)

rownames(DataframeClusters) <- DataframeClusters[,1]

### Cluster Hierárquico

cluster <- hclust(dist(DataframeClusters[-1]))

plot(cluster)

### Melhorando Apresentação

rect.hclust(cluster,k = 4,  border = c("red", "blue", "green", "purple"))

### Gerando a lista de classificação

cluster <- hclust(dist(DataframeClusters[-1]))

classificacao <- cutree(cluster, k = 4)

write.xlsx(data.frame(Empresa = DataframeClusters[,1], Cluster = classificacao), 
           "Classificacao_Clusters.xlsx")

getwd()
