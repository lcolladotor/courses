#Ejercicios 3

#1.-
library(UsingR)
plot(diamond$carat ~ diamond$price, main="Precio de diamante contra su kilataje", col=c("red","blue"), pch=21)
res3 <- lm(diamond$carat ~ diamond$price)
abline(res3, col="purple", lwd=1)
#la predicción del precio de un diamante de un tercio de quilate es de unos 950

# La predicción se hacía así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))

#2.-
library(UsingR)
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast, col=rainbow(5), names=c("Estomago","Bronquios","Colon","Ovario","Mama"))
# usa cex.axis=0.8
#la cola mas larga la tiene el cancer de mama
#la mas compacta es la del cancer de estomago
#los centros de los primeros 4 canceres son mas parecidos, al agregar el quinto ya varian demasiado

#3.-
library(UsingR)
library(lattice)
densityplot(~ weight | factor(age), data=kid.weights)
qqmath(~weight | factor(age), data=kid.weights)
bwplot(factor(age) ~ weight, kid.weights)
#se ve que el peso va aumentando con la edad y que mayor edad tenemos una distribución de pesos mas amplia

# Sip. Aunque bueno, la idea era que hicieras otro tipo de gráfica:
xyplot(age ~ weight, data=kid.weights, pch=21)
xyplot(age ~ weight, data=kid.weights, col=c("red", "blue", "green", "yellow")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], main="Relacion Peso Edad")


#4.-
head(female.inc)
bwplot(factor(race) ~ income, female.inc)
summary(female.inc$race)
# Tenias que usar el summary para los datos de cada raza. No una tablita.

#no se ve ninguna diferencia significativa entre los ingresos, solo que las blancas tienen algunos datos bastante alejados de la media
# Hey, los outliers ^^ y que las hispanas están por debajo de las otras 2.
