library(readr)
encuesta_universitaria <- read_csv("data/encuesta_universitaria.csv")
names(encuesta_universitaria)[5] = 'tiempo_traslado'
dato <- encuesta_universitaria$tiempo_traslado

escalado_decimal <- function(atributo) {
  # Calculo el máximo valor absoluto
  valor_maximo <- max(abs(atributo), na.rm = TRUE)
  print(paste("Mayor:", valor_maximo))
  
  # Averiguo la cantidad de dígitos
  exponente <- ceiling(log10(valor_maximo))
  print(paste("Exponente:", exponente))
  
  # Calculo el factor de escala
  factor_escala <- 10^exponente
  print(paste("factor de escala:", factor_escala))
  
  # Escalo el atributo
  atributo_escalado <- atributo/factor_escala
  atributo_escalado
}

a=escalado_decimal(dato)

plot(sort(a))

# Reemplazo el máximo (outlier) por el máximo sin ese outlier
a[a == max(a,na.rm=TRUE)]=max(a[a!=max(a,na.rm=TRUE)])
plot(sort(a))
hist(a)
