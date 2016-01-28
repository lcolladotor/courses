

require(UsingR)
require(lattice)

# Ejercicio 1

plot(diamond$carat ~ diamond$price)
reg <- lm(diamond$carat ~ diamond$price)
abline(reg, col="blue", lwd=2)
lines(c(100, 1200), c(0.333, 0.333), col="green")
(1/3 - reg$coefficients[1])/reg$coefficients[2]
# Precio: 991.2697

# La predicción se hace así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

# Ejericio 2

# a) 
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast, names=c("Stomach", "Bronchus", "Colon", "Ovary", "Breast"))
# b) El sesgo más pronunciado corresponde a cáncer de seno
# c) El sesgo más pronunciado corresponde a cáncer de bronqueos
# d) Son similares la media correspondiente a estomago y bronqueos, también la de ovarios y colon. La de seno es distinta al resto

# Ejercicio 3

# a)
xyplot(age ~ weight, data=kid.weights, pch=21)
# b)
xyplot(age ~ weight, data=kid.weights, col=c("red", "yellow", "green", "blue")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))])
# La correlación edade y peso se conserva hasta aproximadamente los 6 de edad. De los 9 a los 12 no se observa correlación.

# Bien :D

# Ejercicio 4

# a)
bwplot(female.inc$race ~ female.inc$income)
# La diferencia de medias entre las mujeres blancas y las mujeres de color es casi nula. La mayoría está en el mismo intervalo, siendo algunas mujeres blancas puntos extremos; las hispanicas presentan una media mas baja

# b)
summary(female.inc$income[(unclass(female.inc$race))])

# Aquí era por raza, no todo de golpe. Hay varias formas de hacerlo, una es la de jmiranda:
l<-split(female.inc, female.inc$race)
sapply(l,summary)

