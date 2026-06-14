### Exercício 2

library(readxl)

url <- "https://raw.githubusercontent.com/yuri-azevedo/Dataframes/main/Exercicio2.xlsx"

download.file(url, destfile = "DataframeExercicio2.xlsx", mode = "wb")

DataframeExercicio2 <- read_excel("DataframeExercicio2.xlsx")

View(DataframeExercicio2)

summary(DataframeExercicio2)

library(rstatix)

library(dplyr)

options(scipen = 999)

shapiro.test(DataframeExercicio2$AZUL4)

shapiro.test(DataframeExercicio2$GOLL4)

wilcox.test(DataframeExercicio2$AZUL4, DataframeExercicio2$GOLL4, paired = TRUE)
