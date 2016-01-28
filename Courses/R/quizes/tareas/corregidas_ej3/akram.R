#Akram Sharim Mendez Rangel
require(UsingR)
require(lattice)
#
#         >>>1<<<
# scatter plot
#
plot(diamond$carat ~ diamond$price)
# Regresion lineal
reg <- lm(diamond$carat ~ diamond$price)
abline(reg, col="red", lwd=2)
#El precio de un diamante es:
lines(c(100, 1200), c(0.333, 0.333), col="green")
(1/3 - reg$coefficients[1])/reg$coefficients[2]

# La predicción se hace así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

# Precio Diamante 1/3= 991.2697
#         >>>2<<<
# boxplot
# Tenemos cancer de bronquios y cancer de senos como las colas 
# Las medias entre bronquios y estomago, asi como senos, colon y ovarios son 
similares pero no se comparte la media en ninguno de los #casos.
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, 
cancer$breast, names=c("Stomach", "Bronchus", "Colon", "Ovary", "Breast"))

#         >>>3<<<
xyplot(age ~ weight, data=kid.weights, pch=21)
# b)
xyplot(age ~ weight, data=kid.weights, col=c("red", "blue", "green", 
"yellow")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))])
# 

# Conclusiones????

# >>>4<<<
# Hay una diferencia en el nivel de ingresos, las mujeres, en las #mujeres, por 
ejemplo, las blancas ganan mas que las negras, aunque #entre hispanas y negras 
los ingresos son similares. 

# Hay más outliers de blancas.

bwplot(female.inc$race ~ female.inc$income)

# parte b?