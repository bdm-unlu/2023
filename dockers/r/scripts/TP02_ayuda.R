#######################################################################
#########################   DATOS FALTANTES   #########################
#######################################################################

library(readr)
encuesta_universitaria <- read_csv("data/encuesta_universitaria.csv")

# Quito las comillas de los nombres de atributos
names(encuesta_universitaria) = gsub("'", "", names(encuesta_universitaria))

# Me guardo el atributo original
original = encuesta_universitaria$Tiempo_Traslado

# Verifico faltantes
faltantes = sum(is.na(encuesta_universitaria$Tiempo_Traslado))
cat("El atributo tiempo de traslado posee", faltantes, "NA.")

cat('Proporción NA (%):', mean(is.na(encuesta_universitaria$Tiempo_Traslado))*100)

original = encuesta_universitaria$Tiempo_Traslado

reg_completos <- na.omit(original)
length(reg_completos)

# inicializamos el atributo media_imp con "original"
media_imp = original

# Y a continuación sustituimos los faltantes por la media
media_imp[is.na(original)]<-mean(original, na.rm = TRUE)

library(VIM) # Cargamos la librería

# Definimos un dataframe auxiliar
hot.deck_imp<-hotdeck(encuesta_universitaria, variable="Tiempo_Traslado")$Tiempo_Traslado

# Se genera un nuevo atributo booleando con las imputaciones
original_imp<-hotdeck(iris, variable="Petal.Length")$Petal.Length_imp

# Analisis grafico de los resultados
plot(density(original, na.rm=TRUE), type = "l", col="red", ylab = "Original", xlim=c(0, 100), ylim=c(0, 0.04), main="Análisis de métodos de imputación")
lines(density(media_imp, na.rm=TRUE), type = "l", col="blue")
lines(density(hot.deck_imp, na.rm=TRUE), type = "l", col="yellow")
legend(80, 0.04, legend=c("Original", "Media", 'Hotdeck'), col=c("red", "blue", 'yellow', "black"), lty=1, cex=0.8)

#######################################################################
#########################   MANEJO DE RUIDO   #########################
#######################################################################

library("infotheo")

# Piso tiempo de traslado con la mejor imputación
encuesta_universitaria$Tiempo_Traslado = hot.deck_imp

# Binning por igual frecuencia
encuesta_universitaria$bin_eq_freq <- discretize(encuesta_universitaria$Tiempo_Traslado, "equalfreq", 5)
encuesta_universitaria$E.Freq.Suav = 0

for(bin in 1:5){
  # Calculo de media
  media_bin = mean(encuesta_universitaria$Tiempo_Traslado[encuesta_universitaria$bin_eq_freq==bin])
  encuesta_universitaria$E.Freq.Suav[encuesta_universitaria$bin_eq_freq==bin] = media_bin
}

# Binning por igual ancho
encuesta_universitaria$bin_eq_width <- discretize(encuesta_universitaria$Tiempo_Traslado,"equalwidth", 5)
encuesta_universitaria$E.Width.Suav = 0

for(bin in 1:5){
  # Calculo de media
  media_bin = mean(encuesta_universitaria$Tiempo_Traslado[encuesta_universitaria$bin_eq_width==bin])
  encuesta_universitaria$E.Width.Suav[encuesta_universitaria$bin_eq_width==bin] = media_bin
}

# grafico las distribuciones ordenadas de menor a mayor
plot(sort(encuesta_universitaria$Tiempo_Traslado) , type = "l", col="red", ylab = "Tiempo de traslado", xlab = "Observaciones", main = "Dato original vs suavizado", ylim=c(0, 220))
lines(sort(encuesta_universitaria$E.Freq.Suav), type = "l", col="blue")
lines(sort(encuesta_universitaria$E.Width.Suav), type = "l", col="green")
legend(0, 210, legend=c("Original", "Equal Freq", "Equal Width"), col=c("red", "blue", "green"), lty=1, cex = 0.7)

#######################################################################
######################   DETECCIÓN DE OUTLIERS   ######################
#######################################################################

# Análisis de outliers por IRQ
boxplot(encuesta_universitaria$Tiempo_Traslado)
data.riq<-IQR(encuesta_universitaria$Tiempo_Traslado)
print(data.riq)

cuantiles<-quantile(encuesta_universitaria$Tiempo_Traslado, c(0.25, 0.5, 0.75), type = 7)
print(cuantiles)

outliers_min<-as.numeric(cuantiles[1])-1.5*data.riq
print(outliers_min)

outliers_max_irq<-as.numeric(cuantiles[3])+1.5*data.riq
print(outliers_max_irq)

# Grafico sin outliers
boxplot(encuesta_universitaria$Tiempo_Traslado[encuesta_universitaria$Tiempo_Traslado<outliers_max_irq])

# Análisis de outliers por SD
N = 3
desvio <- sd(encuesta_universitaria$Tiempo_Traslado)
print(desvio)

outliers_max_sd<-mean(encuesta_universitaria$Tiempo_Traslado)+N*desvio
print(outliers_max_sd)

# Grafico sin outliers
boxplot(encuesta_universitaria$Tiempo_Traslado[encuesta_universitaria$Tiempo_Traslado<outliers_max_sd])
