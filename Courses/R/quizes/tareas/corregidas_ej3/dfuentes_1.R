 # Parte 1
require(UsingR)
require(lattice)
#a)Hagan un scatterplot...
plot(diamond$carat ~ diamond$price)
#b)A�adan linea regresi�n lineal simple
rl <- lm(diamond$carat ~ diamond$price)
abline(rl, col="blue")
#c)Predicci�n: da 991.3965
(1/3 - rl$coefficients[1])/rl$coefficients[2]
lines(c(100, 1200), c(1/3, 1/3), col="cyan")

# La predicci�n se hace as�:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

 # Parte 2
#a)Gr�fica de boxplot
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast, names=c("Est�mago", "Bronquio", "C�lon", "Ovario", "Seno"), main="boxplot 2.a")
#b)La cola m�s larga se encuentra en la inferior de cancer$breast
#c)La cola m�s compacta se encuentra en la superior de cancer$ovary (practicamente no aparece), seguida por la inferior de cancer$stomach # Era mas bien la de bronquios...
#d)No todos los centros son iguales. cancer$stomach y cancer$bronchus se asemejan; cancer$colon y cancer$ovary se asemejan tambi�n

 # Parte 3
#a)Explorando: conforme van creciendo, la correlaci�n disminuye
xyplot(age ~ weight, data=kid.weights, pch=8, main="scatter 3.a")
#b)Con partici�n: conforme los valores del rango de edad aumentan, la correlaci�n disminuye (aunque si se usa log(weight) su dispersi�n disminuye)
xyplot(age ~ weight, data=kid.weights, col=c("cyan", "blue", "magenta", "red")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))])
# En realidad la relaci�n entre las 2 vars con el grupo de 9 a 12 a�os desaparece.

 # Parte 4
#a)Uno de los valores es demasiado alto, si cambio el l�mite de y aprecio mejor la mayor�a de los resultados.Las que m�s ganan son las blancas, las que menos ganan las hispanas.
bwplot(female.inc$income ~ female.inc$race)
bwplot(female.inc$income ~ female.inc$race, ylim=c(-10000,250000))
#b)No se separarlos...
summary(female.inc)

# La parte b era as�:

fem <- female.inc
fem_race <- split(fem, fem$race)
summary(fem_race$black)
summary(fem_race$white)
summary(fem_race$hispanic)