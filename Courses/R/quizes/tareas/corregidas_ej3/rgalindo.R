#Roberto Galindo Ramirez (con acento en la i de Ramirez)

require(UsingR)
require(lattice)

# 1

plot(diamond$carat ~ diamond$price)
reg <- lm(diamond$carat ~ diamond$price)
abline(reg, col="blue", lwd=2)
lines(c(100, 1200), c(0.333, 0.333), col="green")
(1/3 - reg$coefficients[1])/reg$coefficients[2]
# El precio es de 991.2697

# La predicción se hacia así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))

# 2

# a) 
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast, names=c("Stomach", "Bronchus", "Colon", "Ovary", "Breast"))
# b) Al parecer la que tiene la cola mas larga es la de seno
# c) La cola que es mas compacta es la de bronqueos
# d) Pues la media de estomago y bronqueos parece ser la misma, las de ovarios y colon igual se parecen, pero la de seno no es igual a las otras

# Bien

# 3

# a)
xyplot(age ~ weight, data=kid.weights, pch=21)
# b)
xyplot(age ~ weight, data=kid.weights, col=c("red", "yellow", "green", "blue")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))])
# Hay una correlacion entre las edades y peso hasta aproximadamente los 6 de edad, despues, se pierde, pero de los 9 a los 12 ya no parece haber correlacion
# Bien :D

# 4

# a)
bwplot(female.inc$race ~ female.inc$income)
# La diferencia de medias entre las mujeres blancas y las mujeres de color es casi nula, al igual que la mayor parte de ellas se encuentra en el mismo intervalo, la unica diferencia entre estos dos grupos, es que algunas mujeres blancas son puntos extremos, es decir, ganan mucho mas, aunque claro, son pocos casos; las hispanic (que no se si sean latinas) tienen una media mas baja, el intervalo de la mayoria de ellas, se encuentra desfavorecidamente desfasado, y no hay puntos extremos, es decir, les va peor que a los otros dos grupos.

# Bien :D
#b)
summary(female.inc$income[(unclass(female.inc$race))])

# Esto no me da información por cada grupo.