##Para installar el package de UsingR

#install.packages("UsingR")

#Carga la libreria de MASS

library(MASS)

#Ejericio 1

hist(DDT,col=rainbow(7),ylab="Absolute frequency",xlab="ppm",main="Measurements of the pesticide DDT in kale")
print(mean(DDT))
print(sd(DDT))
boxplot(DDT,ylab="ppm",main="",col="green")
print(mean(DDT))
print(sd(DDT))

#Ejericio 2 la parte del codigo para hacer los pdf esta comentada

library(UsingR)

#pdf(file="jurquiza_hist.pdf")
par(mfrow=c(1,2))
hist(lawsuits,col="red",xlab="Values of lawsuits", main="jurquiza")
hist(log(lawsuits),col="blue",xlab="Logarithmic values of lowsuits",main="jurquiza")
#dev.off()

#pdf(file="jurquiza_boxplot.pdf")
par(mfrow=c(1,2))
boxplot(lawsuits,col="red",ylab="Values of lawsuits", main="jurquiza")
boxplot(log(lawsuits),col="blue",ylab="Logarithmic values of lowsuits",main="jurquiza")
#dev.off()
par(mfrow=c(1,1))

#Ejercicio 3
#http://static.twoday.net/mahalanobis/images/randomwalk.gif

#El grafico muestra una simulacion de 1xE5 pasos de 10 random walks
#utilizo una funcion a la que hay que pasarle cuantos quieres que te 
#que haga y de que tamaño son en la parte de abajo esta la muestra 
 
random_walk <- function(num,pasos){
	vec <- vector(length=pasos)
	tiempo <- 1:pasos
	colors  <- rainbow(num)
	
	for(i in 1:num){
		moneda <- sample(c(1,0),pasos,replace=TRUE,prob=c(0.5,0.5))
		vec[1] <- 0
		
		for(j in 2:pasos){
			if(moneda[j] == 1){				
				vec[j] <- vec[j-1]+1	
			}else{
				vec[j] <- vec[j-1]-1							}	
	}
	
	if(i == 1){
		plot(tiempo,vec,type="l",ylim=c(-100,100),ylab="Pasos negativos=derecha, positivos=izquierda",xlab="Numero de pasos")
		lines(tiempo,rep(0, length(tiempo)),type="l")	
		}else{
		lines(tiempo,vec,type="l",col=colors[i])		
			}
	}
}	

num_rwalks <- 10
duracion <- 2000
random_walk(num_rwalks,duracion)

# Muy buena tarea :) Tu grafica (con todo y función) te salió muy bien!


