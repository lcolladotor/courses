#install.package("UsingR")

#Ejercicio 1

attach(diamond)

library(package="UsingR")
plot(price ~ carat)
regresion <- lm(price ~ carat)
abline(regresion,col="red",type="l") # No necesitabas el type aquí

detach(diamond) # bien :D

#Sustituyendo en la eq y=mx+b a x=1/3 m=3721 b=-259.6 tenemos que 
#un tercio de carat costara 980.733333

# Bien, aunque se hacia en R así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

#Ejercicio 2

boxplot(cancer)

##b)La cola mas laraga a la izquiera la tiene breast, y cola mas larga a la 
#derecha la tiene stomach.

##c)bronchus

##d)los centros no son extremadamente variables pero no son similares

##Ejericio 3

library(lattice)


xyplot(kid.weights$height ~ kid.weights$age) 
##parce que hay una relacion
##entre la edad y el peso del niño

# Pregunta 3 No la entendi por completo
# a)
xyplot(weight ~age, data=kid.weights, pch=21)
# b)
xyplot(weight ~ age, data=kid.weights, col=c("red", "blue", "green", "yellow")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], main="Relacion Peso Edad")
# Parece que si se mantiene una relacion entre los diferentes grupos, hasta que llegan a los 9-12 años, cuando parece que la relacion se pierde un poco

# Eso era lo que quería que hicieran :) Al final si entendiste la pregunta hehe.

# Pregunta 4
# Hay una pequegna diferencia en el ingreso entre las razas, tenemos que las mujeres blancasy las negras tienen aproximadamente el mismo perfile de ingresos, la media es muy cercana y el 95% porciento de las mujeres se encuentran en el mismo intervalo, salvo que las mujeres blancas presentan casos de ingreso mucho mayor al de las mujeres negras.  Las mujeres hispanicas tienen, en basicamente todos los sentidos, menor ingreso que las otras dos razas.
bwplot(female.inc$income ~ female.inc$race, main="Income for differentraces")

# Bien, pero te faltaron las estadísticas por raza.
