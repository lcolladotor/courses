#ALEJANDRO ATHIE CUERVO
#EJERCICIO 1
library(UsingR)
plot(diamond$carat ~ diamond$price, main="EL VALOR DE UN DIAMANTE CONTRA EL KILATAJE", col=c("salmon","red"), pch=21)
resul <- lm(diamond$carat ~ diamond$price)
abline(resul, col="light blue", lwd=1)

# La predicción se hace así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

#c) LA PREDICCION RESULTANTE DE LA REGRESION ES DE: EL VALOR DE UN DIAMANTE DE UN TERCIO DEL KILATAJE ES DE 950.

#EJERCICIO 2
library(UsingR)
boxplot(cancer$breast, cancer$bronchus, cancer$colon, cancer$ovary, cancer$stomach, col=rainbow(10), names=c("BREAST","BRONCHUS","COLON","OVARY","STOMACH"))
#B) CANCER DE MAMA
#C) CANCER DE ESTÓMAGO # nope, de bronquios .... es el que tiene menor dispersión
#D) NO, SIN CONSIDERAR EL CANCER DE MAMA LOS CENTROS SON PARECIDOS, AL AGREGAR CANCER DE MAMA LOS CENTROS VARIAN.

#EJERCICIO 3
library(UsingR)
library(lattice)
densityplot(~ weight | factor(age), data=kid.weights)

# HAHA, igual que Sol. Bueno, no es el tipo de gráfica que se les pedia.

qqmath(~ weight | factor(age), data=kid.weights)
bwplot(factor(age) ~ weight, kid.weights)
#A) EL PESO VA INCREMENTANDO CONFORME AUMENTA LA EDAD (RELACION DIRECTA).

# Tenian que hacer gráficas como estas:
xyplot(age ~ weight, data=kid.weights, pch=21)
xyplot(age ~ weight, data=kid.weights, col=c("red", "blue", "green", "yellow")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], main="Relacion Peso Edad")

# Tu conclusión está mal/incompleta. Si pasa eso que dices en los primeros grupos, en el 4to no es cierto, pues la relación ya no es lineal.
#B) 

#EJERCICIO 4
library(UsingR)
head(female.inc)
bwplot(factor(race) ~ income, female.inc)
#A) NO DE MANERA SIGNIFICATIVA, LA RAZA BLANCA TIENE VALORES MÁS ALEJADOS DE LA MEDIA.

# Pues por algo son outliers :P Claro que son de forma significativa. En fin, esta medio incompleta tu conclusión.
summary(female.inc$race)
# Era un summary por raza, no uno para todo.

