############### INSTALACIÓN DEL PAQUETE arules ####################

# Instalo y cargo la librería arules
install.packages("arules", dependencies = TRUE)
library(arules)

############### CARGA Y EXPLORACIÓN DE DATOS  #####################

# Cargo en memoria el dataset Groceries (comestibles)
data("Groceries")

# Veo las transacciones
inspect(Groceries[1:10])

# Levanto la paleta de colores de Brewer
library(RColorBrewer) 

# Exploramos gráficamente los topN items con mayor frecuencia de aparición
arules::itemFrequencyPlot(Groceries, topN = 20,  
                          col = brewer.pal(8, 'Pastel2'), 
                          main = '% Soporte de los items', 
                          ylab = "Frecuencia del item (%)")

########## Generación de transacciones a partir de CSV o DF ###########

# Cargo como transacciones iris
iris_transacciones = read.transactions("data/iris.csv", sep = "|", header = TRUE)
inspect(iris_transacciones[1:10])
# ¿Cuál es el problema con esto?

# Observemos las reglas
rules = apriori(iris_transacciones, parameter=list(target="rules", confidence=0.0025, support=0.002))
inspect(rules)

# PROBEMOS DISCRETIZANDO

# Cargamos iris en memoria
iris_df = read.csv("data/iris.csv", sep = "|", header = TRUE)

# Exploramos y discretizamos (a ojo)
hist(iris_df$Sepal.Length)
Sepal.Length_d = discretize(iris$Sepal.Length, method = "fixed", breaks = c(-Inf, 5, 7, Inf), labels = c("pequeño", "mediano", "largo"))

hist(iris_df$Sepal.Width)
Sepal.Width_d = discretize(iris$Sepal.Width, method = "fixed", breaks = c(-Inf, 2.8, 3.7, Inf), labels = c("pequeño", "mediano", "largo"))

hist(iris_df$Petal.Length)
Petal.Length_d = discretize(iris$Petal.Length, method = "fixed", breaks = c(-Inf, 3, 6, Inf), labels = c("pequeño", "mediano", "largo"))

hist(iris_df$Petal.Width)
Petal.Width_d = discretize(iris$Petal.Width, method = "fixed", breaks = c(-Inf, 1, 2.2, Inf), labels = c("pequeño", "mediano", "largo"))

iris_discretizado = data.frame(as.factor(Sepal.Length_d), 
                               as.factor(Sepal.Width_d), 
                               as.factor(Petal.Length_d), 
                               as.factor(Petal.Width_d), 
                               as.factor(iris_df$Species))
names(iris_discretizado) = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")
View(iris_discretizado)

# Lo transformo a transacciones
iris_transacciones_dis <- as(iris_discretizado, "transactions")
inspect(iris_transacciones_dis[1:10])

rules_dis = apriori(iris_transacciones_dis, parameter=list(target="rules", confidence=0.1, support=0.1))
inspect(rules_dis)

inspect(head(sort(rules_dis, by="lift", decreasing = TRUE)))

############## GENERACIÓN DE REGLAS CON arules ###################

# Generamos las reglas con arules, estableciendo soporte y confianza mínimos como parámetro
reglas <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"))

# Verifico la cantidad de reglas generadas
print(reglas)

# Listo todas las reglas generadas
inspect(reglas)

# Muestra las 10 primeras reglas
inspect(reglas[1:10])

# Listo todas las reglas generadas ordenando por lift
inspect(sort(reglas, by="lift", decreasing = TRUE))

############# FILTRADO DE REGLAS Y BÚSQUEDA POR ITEM ##################

# Genero reglas que tengan cerveza en el antecedente
reglas_beer <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"), appearance = list(lhs="bottled beer"))
inspect(reglas_beer)

# Genero reglas que tengan mantequilla en el consecuente
reglas_butter <- apriori(Groceries, parameter = list(support=0.01, confidence=0.01, target = "rules"), appearance = list(rhs="butter"))
inspect(reglas_butter)

# Sobre las reglas generadas antes, con subset filtro las que tienen waffles en el antecedente
rules.sub <- subset(reglas, subset = lhs %pin% "waffles")
inspect(rules.sub)
