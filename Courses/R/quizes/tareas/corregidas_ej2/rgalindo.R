#Roberto Galindo Ramírez

library(MASS) 
plot(DDT, main="Plot DDT", col="blue", xlab="Mediciones", ylab="Concentracion de DDT")
hist(DDT, col="green", main="Histograma DDT", ylab="Frecuencia", xlab="Cantidad de DDT")
print(c(mean(DDT), sd(DDT)))

library(UsingR)
pdf(filen="robinson.pdf") # Es file, no filen
par(mfrow=c(1,2))
hist(lawsuits, col="green", main="Lawsuits.rgalindo")
hist(log(lawsuits), col="blue", main="Log(lawsuits).rgalindo")
# Te falto el dev.off()

#http://www.e-biometria.com/g-stat/gstat11_histograma.jpg
robin<-c(19.75, 20, 20.1, 20.7, 20.9, 21, 21.2, 21.3, 21.5, 21.5, 21.6, 21.7, 21.75, 21.75, 21.9, 21.9, 21.95, 22, 22.3, 22.5, 22.6, 22.6, 22.6, 22.75, 22.75,22.8, 22.8, 22.9, 23, 23.2, 23.25, 23.5, 23.75, 24, 24, 24.4, 24.7, 24.9, 25.3, 25.5)
brk<-c(19.5,20.26,21.02,21.79,22.55,23.31,24.04,24.84,25.6)
hist(robin, xlab="Edad", xlim=c(19.5, 25.6), breaks=brk, ylab="Frecuencia", col="red")

