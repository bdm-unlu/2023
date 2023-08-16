# Revisión TP00

# Cargo dataframe
iris = read.csv('https://raw.githubusercontent.com/bdm-unlu/2021/main/dockers/r/data/iris.csv', header = TRUE, sep = '|')

# Paleta de colores
install.packages("RColorBrewer")
library(RColorBrewer)

# Separamos valores de etiquetas
valores = table(iris$Species)
print(valores)

# Generamos las etiquetas con nombre y valor para los gráficos
etiquetas = paste(names(valores), valores, sep=" ")
print(etiquetas)

# Realizamos el Gráfico de torta con los parámetros y etiquetas generadas
pie(valores, 
    labels = etiquetas, main="Instancias por especie",
    col=brewer.pal(6,"Set1"), border="white", cex=0.6, radius = 0.8)


# Generamos el gráfico de barras con la misma paleta de colores
x<-barplot(valores,
           cex.names=.7,
           col=brewer.pal(6,"Set1"),border="white",
           ylim=c(0,70),ylab="Cantidad de instancias",
           main="Instancias por especie")

# Generamos los valores para cada barra y los graficamos encima de ellas
y<-as.matrix(valores)
text(x, y+10, labels=as.character(y))

# Histograma
hist(iris$Sepal.Length, main = "Histograma de Sepal Length", xlab = "Sepal Length", ylab = "Frecuencia")

# Boxplot
boxplot(iris[,1:4], labels = names(iris)[1:4], main="Boxplot de atributos")

# Boxplot por especie
boxplot(iris$Sepal.Length~Species, data=iris, main="Boxplot de Sepal.Length por especie", ylab = "Sepal Length")

# Dispersión / Scatterplot
plot(iris[,1:4], labels = names(iris)[1:4], col=as.factor(iris$Species))

# Ayuda con las "leyendas" o etiquetas del gráfico
# https://www.dataanalytics.org.uk/legends-on-graphs-and-charts/
