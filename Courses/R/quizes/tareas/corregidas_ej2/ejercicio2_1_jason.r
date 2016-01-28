# Pregunta 1
library(MASS)
par(mfcol=c(1,2))
hist(DDT, col="lightblue")
boxplot(DDT, main="Boxplot of DDT Pesticide", col=heat.colors(10), ylab="DDT")
# Por la grafica, diria que la media esta alrededor de 3.25 y que una desviacion estandar es alrededor de 0.25
print(c("La media estimada es: 3.25","La desviacion estandar estimada es: 0.25"))
# Pregunta 2
library(UsingR)
pdf("jlomnitz_Pregunta2.pdf")
par(mfrow=c(1,2))
hist(lawsuits, main="Histogram of Lawsuits", xlab="lawsuits", ylab="Frecuencia", col=heat.colors(20), col.lab="green", cex.main=1)
hist(log(lawsuits), main="Histogram of Log(Lawsuits)", xlab="log(lawsuits)", ylab="Frecuencia", col=heat.colors(20), col.lab="darkblue", cex.main=1)
dev.off()
#Pregunta 3
# El url es http://www.cdc.gov/genomics/famhistory/file/images/bc_figure1.gif
par(mfcol=c(1,1))
bins <- c(600000,  190, 2500, 9000, 9300, 6500, 4700, 2900, 1900, 1300, 850,550, 400, 270, 150, 80, 80, 12, 15, 60)  
barplot(log(bins), col="black", axes=FALSE, ylim=c(0,14), xlab="Family history score (midpoint)", ylab="Frequency(log score)")
ival <- 14/6
axis(2, at=c(0,ival,2*ival,3*ival,4*ival,5*ival,6*ival), labels=c(1, 10, 100, 1000, 10000, 100000, 1000000))
box()

# Ningún error :D 