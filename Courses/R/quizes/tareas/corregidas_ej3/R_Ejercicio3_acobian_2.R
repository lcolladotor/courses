##Ejercicio 1##

library(UsingR)
attach(diamond)

##a)##
plot(carat, price, main="", col="sky blue3", sub="1 carat = 200 miligramos")
title(main=list("Precio vs Peso de Diamantes", cex=1, col="blue", font=3))

##b)##

plot(price~carat, main="Precio vs Peso de Diamantes", sub="linea morada= regresion lineal simple")  ##Gráfica con regresion lineal simple##
res <- lm(price ~ carat)
abline(res, col="purple", lwd=2)

 cor(carat, price) ##La correlacion simple##
 cor(carat, price, method="s") ##La correlacion de Spearman##
 
 # Hehe, no te pedí correlaciones :P
 
 res <- lm(carat ~ price) ##Regresion simple##
 res
 
##c) No supe como usar predict asi que usé esto:## 

res <- lm(price ~ carat)  ##Haces la regresion lineal simple
infores<- coef(res) ##guardas la info de la regresion en infores
infores <- as.data.frame(infores) ##solo guardas los numeros 
numres<-infores$infores ##los hacees vector
0.33*numres[2]+numres[1] ##del vector tomas los valores para poder hacer y=aX + b

# Estas bien la idea, y estas cerca. Pero así se hacía:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))

##Ejercicio 2##

library(UsingR)
attach(cancer)

##a)##
nombres=c("stomach","bronchus","colon","ovary","breast")
boxplot(stomach, bronchus, colon, ovary, breast, 
	col="gray", 
	main="CANCER", 
	border="purple",
	col.axis="purple",
	xlab="Tipo de Cancer",
	names=nombres)
	
	# Hehe, te encanta el morado

##b)¿Cuál tiene la cola más larga? Breast##
##c)¿Cuál es la más compacta? Bronchus##
##d)¿Todos los centros son similares? NO, aunque stomach y bronchus si estan cercanos, colon y ovary también, pero breast está muy alejado ##

# Bien :D

##Ejercicio 3##

library(UsingR)
library(lattice)
data(kid.weights, package="UsingR")

## a) Gráfica para explorar la relación entre peso y edad, diferenciando el género##
xyplot(age~weight, data=kid.weights, groups=gender)
# Orale! Con todo y gender :D

##Gráfica para explorar los datos en general##
cloud(weight~height*age, data=kid.weights)
# Eres la única que hizo esto (hasta ahorita) :)

## b) Graficando por clases de edad##

table(cut(kid.weights$age, breaks=3*(0:4)))

attach(kid.weights)
plot(weight, height, main="Relación pero vs altura",sub="Los puntos de colores son las clases por edad",pch=21, bg=c("turquoise2","springgreen","violet","yellowgreen")[cut(age, breaks=3*(0:4))])

##asi se ve bonita, esta separada en clasea de 10 en 10 todas las edades##
##plot(weight, height, main="Relación pero vs altura",sub="Los puntos de colores son las clases por edad",pch=21, bg=rainbow(15)[cut(age, breaks=10*(0:15))])

# Faltaron tus conclusiones!
# Esta mejor con la segunda gráfica, aunque se hacía así:
xyplot(age ~ weight, data=kid.weights, col=c("red", "blue", "green", "yellow")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], main="Relacion Peso Edad")


##Ejercicio 4##

library(UsingR)
library(lattice)
attach(female.inc)

##a)##
densityplot(~income, groups=race, main="Ingresos de mujeres de diferentes razas") ##con esta gráfica pensarioamos que si existe una diferencia en los ingresos dependiendo de la raza##

##Graficando con boxplots observamos qeu no es significativa la diferencia de ingresos entre mujeres de distintas razas##
bwplot(race~income,female.inc, main="Ingresos mujeres de diferentes razas") ##boxplot de ingresos segun cada raza##

# Fijate en los outliers de las mujeres blancas!

##b)##

razas <-split (female.inc$income, female.inc$race) ## estadisticas generales de cada raza##
summary(razas$black)
sd(razas$black)
summary(razas$hispanic)
sd(razas$hispanic)
summary(razas$white)
sd(razas$white)
