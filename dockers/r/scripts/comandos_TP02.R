library(readr)
encuesta_universitaria <- read_csv("data/encuesta_universitaria.csv")
names(encuesta_universitaria)
cantidad_faltante <- sum(encuesta_universitaria$"'Tiempo_Traslado'")

names(encuesta_universitaria)[5] = 'tiempo_traslado'

encuesta_universitaria$tiempo_traslado

data=read_table("data/auto-mpg.data-original.txt", col_names = FALSE)
data=read_table("data/auto-mpg.data-original.txt", col_names = c("nombre1","nombre2", "nombre3", "nombre4", "nombre5", "nombre6", "nombre7", "nombre8"))
View(encuesta_universitaria[order(-encuesta_universitaria$tiempo_traslado),])
