"Ejercicio 3"

"Paso 1"
library (UsingR)
plot (diamond$carat, diamond$price)
res<-coef(lm(diamond$price ~ diamond$carat))
abline(res)
predict(lm(diamond$price ~ diamond$carat), data.frame(carat=1/3))

# La predicción se hacia así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

"2"
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast) # Medio simple pero bueno...
"la cola más larga es de breast, la más compacta es de stomach, no todos los centros son similares, el de breast esta muuy diferente a los anteriores, colon y ovary son más similares entre sí, mientras stomach y bronchus son similares entre ellos"

"3"
library(lattice)
data(kid.weights, package="UsingR")
dotplot(age ~ weight, data = kid.weights)

# Está incompleto tu ejercicio 3.

"4"
data(female.inc, package="UsingR")
bwplot(race~income, data=female.inc)
"Parece que no hay cambio, salvo que el bwplot de las mujeres de raza blanca presenta una cola más larga"

"resumen de estadística, la neta no sé qué es eso, es un summary??"
summary(female.inc$race)

# Sip, es un summary pero por cada raza, no todas juntas.
