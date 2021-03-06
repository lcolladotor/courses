library(UsingR)
attach(diamond)
plot(carat, price, main = "Grafica de diamante")
reg <- lm(price ~ carat)
abline(reg, col="blue", lwd=2)
predict(lm(price ~ carat), data.frame(carat = 1/3))
# 980.7157

# Excelente!

attach(cancer)
boxplot(stomach, bronchus, colon, ovary, breast)
# La cola m�s larga la tiene breast
# La m�s compacta es bronchus
# Podr�a decirse que los centro de las primeras dos son iguales, los de las primeras cuatro parecidos y que el de la quinta casi nada que ver

# Bueno, mas bien las 3 y 4 se parecen entre s� pero no tanto con las primeras 2

library(lattice)
pdf(file = "relacion.pdf", height = 6, width = 6)
par(mfrow = c(1,2))
plot(kid.weights$weight, kid.weights$age, main="Relaci�n entre edad y peso")
plot(kid.weights$weight, kid.weights$age, col=c("green","blue","red","purple")[unclass(cut(kid.weights$age, breaks=12*seq(0,12,3)))], main="Relaci�n entre edad y peso")
dev.off()

# Muy bien! Pero falt� que concluyeras.
# No usaste lattice :(

bwplot( ~income | race, female.inc, layout = c(1,3))
fem <- female.inc
fem_race <- split(fem, fem$race)
summary(fem_race$black)
summary(fem_race$white)
summary(fem_race$hispanic)

# Igual, faltaron tus conclusiones.

