# Cargo dataframe
iris = read.csv('https://raw.githubusercontent.com/bdm-unlu/2021/main/dockers/r/data/iris.csv', header = TRUE, sep = '|')

# Nombres de variables
names(iris)

# Caracteristicas de las variables
str(iris)

# Calculo la Media
apply(iris[,1:4], 2, mean, na.rm=TRUE)

# Calculo la Mediana
apply(iris[,1:4], 2, median, na.rm=TRUE)

# Calculo de moda
install.packages("modeest")
library(modeest)
apply(iris[,1:4], 2, mfv, na.rm=TRUE)

# Agrupando por especie
aggregate(Sepal.Length ~ Species, data=iris, FUN=mean)

# Ordenando de mayor a menor
iris_x_especie=aggregate(Sepal.Length ~ Species, data=iris, FUN=mean)
iris_x_especie[order(-iris_x_especie$Sepal.Length),]

# Desvío estandar
apply(iris[,1:4], 2, sd, na.rm=TRUE)

# Varianza
apply(iris[,1:4], 2, var, na.rm=TRUE)

# Rango
apply(iris[,1:4], 2, range, na.rm=TRUE)

# Cálculo de la matriz de correlaciones
matriz.correlaciones = cor(iris[,1:4], use = "complete.obs")
print(matriz.correlaciones)
