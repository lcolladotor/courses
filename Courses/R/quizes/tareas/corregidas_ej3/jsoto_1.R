library(UsingR)
plot(diamond, main="Diamante", xlab="Carat", ylab="Precio", pch=23, col="blue")
attach(diamond)
lm.diamond<-lm(price ~ carat)
lm.diamond 
elco<-coef(lm.diamond)
elco
abline(coef=elco, col="red", lwd=2)
predict.lm(lm.diamond, data.frame(carat=.33333333))
#Prediccion para carat=.3333333 ---> price=980.7157 
detach(diamond)

# Muy bien :D

attach(cancer)
boxplot(cancer[1:5], main="Cancer", col=c("darkblue", "red", "gray", "yellow", "violet"))
detach(cancer) 
#cola mas larga --> seno
#mas compacta --> bronquios
#NO tienen centros iguales, sobre todo el cancer de pecho tiene una media(tiempo) mucho más alta que el resto

library(lattice)
data(kid.weights, package = "UsingR")
xyplot(age ~ weight, data=kid.weights)
meses<-c(0, 36, 72, 108, 144)
xyplot(age ~ weight, data=kid.weights, col=rainbow(4)[unclass(cut(kid.weights$age, breaks=meses))])
#A medida que la edad aumenta, la correlacion entre ambas variables se hace menos fuerte. A partir de los 72 meses (6 anios) parece que la correlacion edad~peso tiende a desaparecer.

# Esta bien, aunque la relación desaparece hasta los 9-12 años.

library(lattice)
data(female.inc, package = "UsingR")
bwplot( ~income | race, layout = c(1,3), female.inc)
# El ingreso de las mujeres blancas es el que tiene la mayor varianza. La media de sueldos de blancas es mayor que la de mujeres negras, que a su vez es mayor que la de mujeres hispanas

# Faltaron las estadísticas por raza.