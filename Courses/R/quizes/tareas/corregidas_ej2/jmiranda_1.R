library(MASS)
hist(DDT, col="green", main="Histograma DDT", breaks=10, xlim = c(2.5, 5))
boxplot(DDT, ylab="Pesticida", main="DDT en Brassica oleracea") 
# Faltó usar colores en el boxplot
print(mean(DDT))
print(sd(DDT))

library(UsingR)
logsuits <- log(lawsuits)
pdf( file = "archivo.pdf", height = 5, width =  7, bg = "green")
par(mfrow= c(1,2))
hist(lawsuits, main ="jmiranda, lawsuits", ylab="Demandas", col=heat.colors(5))
hist(logsuits, main ="jmiranda, logsuits", ylab="Demandas", col=heat.colors(5), breaks = 11)
dev.off()
# Orale con el fondo! :P

arch <- "http://xibalba.lcg.unam.mx/~jmiranda/datoscherry.txt"
arboles <- read.table(file = arch, header = T)
hist(arboles$Height, col= topo.colors(7), xlab = "Altura en pies", main ="Cherry trees(un poco tramposillo)")

###################################################
### url gráfica original: http://en.wikipedia.org/wiki/Image:Black_cherry_tree_histogram.svg


# HAHA super tramposillo :P
# En fin, te salió bien :)