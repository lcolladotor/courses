require(UsingR)
require(lattice)
# Pregunta 1
# a) scatter plot
plot(diamond$carat ~ diamond$price, main="Relacion Kilates y Precio")
# b) Regresion lineal
reg <- lm(diamond$carat ~ diamond$price)
abline(reg, col="red", lwd=2)
# Precio de un diamante de 1/3 carat es approximadamente:
lines(c(100, 1200), c(0.333, 0.333), col="blue")
## El precio de un diamante con 1/3 de carat es approximadamente de 950
(1/3 - reg$coefficients[1])/reg$coefficients[2]
# El precio es de 991.2697

# Estas cerca del resultado final, aunque mas bien seria así:
# reg <- lm(diamond$price ~ diamond$carat)
# (1/3)*reg$coefficients[2]+reg$coefficients[1]
# Alternativamente, lo haces así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

# Pregunta 2:
# a) boxplots
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast, names=c("Stomach", "Bronchus", "Colon", "Ovary", "Breast"))

# Usa cex.axis=0.8 en tu boxplot, no se ve el de Bronchus

# La cola mas larga la tiene el de cancer de seno
# La mas compacta es el de cancer de bronqueos
# Diria que media de estomago y Bronqueos son similares, el de colon y ovarios son similares y  finalmente el de Seno; en general no tienen el mismo centro
# Pregunta 3 No la entendi por completo
# a)
xyplot(age ~ weight, data=kid.weights, pch=21)
# b)
xyplot(age ~ weight, data=kid.weights, col=c("red", "blue", "green", "yellow")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], main="Relacion Peso Edad")
# Parece que si se mantiene una relacion entre los diferentes grupos, hasta que llegan a los 9-12 agnos, cuando parece que la relacion se pierde un poco

# MUY bien :D. Aunque no le entendiste, si la lograste hacer hehe.


# Pregunta 4
# Hay una pequegna diferencia en el ingreso entre las razas, tenemos que las mujeres blancasy las negras tienen aproximadamente el mismo perfile de ingresos, la media es muy cercana y el 95% porciento de las mujeres se encuentran en el mismo intervalo, salvo que las mujeres blancas presentan casos de ingreso mucho mayor al de las mujeres negras.  Las mujeres hispanicas tienen, en basicamente todos los sentidos, menor ingreso que las otras dos razas.
bwplot(female.inc$race ~ female.inc$income, main="Income for different races")

# Faltó la parte de obtener las estadísticas por cada grupo racial.