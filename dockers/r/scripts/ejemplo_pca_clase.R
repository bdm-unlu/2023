data("iris")

iris.sin.clase <- iris[,-c(5)]
iris.escalado <- data.frame(scale(iris.sin.clase))
# Ejemplo de escalado con Z-score 
head((iris.sin.clase$Sepal.Length - mean(iris.sin.clase$Sepal.Length)) / sd(iris.sin.clase$Sepal.Length))

cov(iris.escalado)

cor(iris.escalado)

# Corro el analisis en CP
pca.iris <- princomp(iris.escalado, cor=F)
print(pca.iris)
summary(pca.iris)
plot(pca.iris, type="l")
par(mfrow=c(1,2))
biplot(pca.iris)
biplot(pca.iris, choices = c(3,4))
loadings(pca.iris)
