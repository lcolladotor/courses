library(UsingR)
attach(diamond)
plot(carat,price)
fit<-lsfit(carat,price)
abline(fit,col="blue")
res<-lm(diamond, 1/3)
res�

# La predicci�n se hacia as�:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

library(UsingR)
attach(cancer)
boxplot(stomach,bronchus,colon,ovary,breast, col=c("green","pink"),main="boxplot",names=c("stomach","bronchus","colon","ovary","breast"))
//la cola mas larga la tiene breast, la mas corta ovary (NOPE, la m�s corta no es de ovary), y no todos los centros son similares, unos estan muy centrados y otros muy sesgados
plot(density(stomach),col="green")
lines(density(bronchus),col="blue")
lines(density(colon),col="pink")
lines(density(ovary),col="red")
lines(density(breast),col="forestgreen")

# hehe, no ten�as que hacer esa gr�fica :P

Library(lattice)
data(kid.weights, package="UsingR")
head(kid.weights)
xyplot(age ~ weight, data=kid.weights, pch=21) 
xyplot(age ~ weight, data=kid.weights, col=c("violet", "lightblue", "green", "pink")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))])
//y pues la relacion en general se mantiene, conforme aumenta la edad, tiende a aumentar el peso tambi�n, pero observo que especificamente para los que tienen edad mayor de 100 ya varian mas con respecto al peso, no siempre aumentan a tasas similares.
# Cerca ;) En realidad el 4to grupo (9 a 12 a�os) es el que pierde la relaci�n lineal entre las dos variables. Mas bien es cuadr�tica.


Library(lattice)
data(female.inc, package="UsingR")
bwplot(female.inc$race ~ female.inc$income)
// pues no hay diferencia significativa entre las razas de blancos y negros, pero en el caso de los hispanos si la hay.
# Te falt� lo de los outliers en el caso de las blancas
summary(female.inc$income[(unclass(female.inc$race))])
# Esto no es lo que ped� :P Mas bien era un summary por raza



