# Revisión TP00

# Cargo dataframe
MPI_subnational = read.csv('https://raw.githubusercontent.com/dmuba/dmuba.github.io/master/Practicos/LAB01/MPI_subnational.csv', header = TRUE, sep = ',')

# Paleta de colores
install.packages("RColorBrewer")
library(RColorBrewer)

# Separamos valores de etiquetas
valores = table(MPI_subnational$World.region)
etiquetas = paste(names(valores), valores, sep=" ")

# Gráfico de torta
pie(valores, 
    labels = etiquetas, main="Ciudades agrupadas por región",
    col=brewer.pal(6,"Set1"), border="white")

x<-barplot(valores,
           legend.text=etiquetas, args.legend = list(bty = "n", 
                                                     x = "top", 
                                                     ncol = 2,  
                                                     text.width=2,
                                                     cex=0.70),
           cex.names=.7,
           col=brewer.pal(6,"Set1"),border="white",
           ylim=c(0,700),ylab="Cantidad de ciudades",
           main="Ciudades por Región")

y<-as.matrix(valores)
text(x,y+30,labels=as.character(y))

# Ayuda con las "leyendas" o etiquetas del gráfico
# https://www.dataanalytics.org.uk/legends-on-graphs-and-charts/
