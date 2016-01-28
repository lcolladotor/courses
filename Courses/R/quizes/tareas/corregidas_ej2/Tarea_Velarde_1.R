##Para installar el package de UsingR

#install.packages("UsingR")

#Carga la libreria de MASS

library(MASS)

#Ejericio 1

hist(DDT,col=rainbow(2),ylab="Absolute frequency",xlab="ppm",main="Measurements of the pesticide DDT in kale")
print(mean(DDT))
print(sd(DDT))
boxplot(DDT,ylab="ppm",main="dvelarde",col="blue")
print(mean(DDT))
print(sd(DDT))

#Ejericio 2 

library(UsingR)

#pdf(file="dvelarde_hist.pdf")
par(mfrow=c(1,2))
hist(lawsuits,col="purple",xlab="Values of lawsuits", main="dvelarde")
hist(log(lawsuits),col="green",xlab="Logarithmic values of lowsuits",main="dvelarde")
#dev.off()

#pdf(file="dvelarde_boxplot.pdf")
par(mfrow=c(1,2))
boxplot(lawsuits,col="purple",ylab="Values of lawsuits", main="dvelarde")
boxplot(log(lawsuits),col="green",ylab="Logarithmic values of lowsuits",main="dvelarde")
#dev.off()
par(mfrow=c(1,1))

#Ejercicio 3
#http://www.seas.harvard.edu/ekaxiras/images/mcint_gauss.png

#El grafico muestra un ejemplo de integracion de Monte Carlo de una 
#integral gaussiana con limites finitos.


plot(runif(10000,min=-4,max=4),runif(10000,min=0,max=0.4),pch=20,xlim=c(-4,4),ylim=c(0,0.4),col="red",main="Ejemplo grafico de integracion Monte Carlo en una Normal",ylab="Probabilidad",xlab="Desviaciones de la media",type="p")
lines(density(rnorm(100000),bw=0.5),type="l")


# Muy bien, sin errores. Me sorprendio tu gráfica para la pregunta 3 :)