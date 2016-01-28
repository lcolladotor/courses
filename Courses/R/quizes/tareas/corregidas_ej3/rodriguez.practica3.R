#Practica No3
#Isaac Rodríguez

#Ejercicio 1
library(UsingR)
data <- diamond
plot(data$price, data$carat, col=c("black", "orange"))
res1 <- lm(data$carat ~ data$price)
plot(data$price, data$carat, col=c("black", "orange"))
abline(res1, col="red", lwd=2)
predict(reg, newdata=data.frame(carat=1/3)) # Muy bien :D

#Ejercicio 2 
data2 <- cancer
attach(data2)
boxplot(stomach, bronchus, colon, ovary, breast, col=c("blue", "orange"), names=c("stomach", "bronchus", "colon", "ovary", "breast"))
#¿cuál es la cola más larga? la de breast cancer
#¿cuál es la cola más compacta? si por cola es la suma total de las lineas, entonces la de ovary cancer. Si por cola es la linea que sale de abajo 
#de la caja, entonces stomach cancer. 
#¿son todos los centros similares? el de ovary cancer parece mas grande

# ok..

#Ejercicio 3
library(lattice)
xyplot(age ~ weight, data=kid.weights)
densityplot(~weight, kid.weights, groups = gender, plot.points= FALSE, auto.key=TRUE)
bwplot(factor(weight) ~height | gender, kid.weights)

#Particiona a las edades en intervalos de 0-3, 3-6, 6-9 y 9-12. Se mantiene la misma relación
en los grupos?
xyplot(age ~ weight, data=kid.weights, col=c("red", "orange", "green", "purple")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))])  # bien, esta era la que quería :D
inters <-12*c(0, 3, 3, 6, 6, 9, 9, 12)
dim(inters)<-c(4,2)
intersintvs<- shingle(kid.weights$age, intervals=inters)
xyplot(weight~height | inters, data=kid.weights) # también sirve, pero es un poco más dificil de interpretar

# Conclusiones??


#Ejercicio 4
bwplot(race ~factor(income), female.inc)
bwplot(income ~factor(race), data=female.inc, ylim=c(0,250000))
#No alcanzo a notar alguna diferencia significativa, solamente que existen diferencias en los valores extremos, la media de black and white son similares
#así como el Q1 y Q3. Black and White si muestran un poco de diferencia con hispanic. 
tara <-split(female.inc, female.inc$race)
lapply(tara,summary)


# bien :)