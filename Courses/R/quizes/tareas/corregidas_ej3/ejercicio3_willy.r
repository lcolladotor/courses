library(UsingR)
plot(diamond, main="Diamante", xlab="Quilates", ylab="Precio", pch=23, col="blue")
attach(diamond)
lm.diamond<-lm(price ~ carat)
lm.diamond 
elco<-coef(lm.diamond)
elco
abline(coef=elco, col="red", lwd=2)
predict.lm(lm.diamond, data.frame(carat=.33333333))

attach(cancer)
boxplot(cancer[1:5], main="Cancer", col=c("darkblue", "red", "gray", "yellow", "violet"))
detach(cancer) 

# No respondiste ninguna de las preguntas aquí :(

library(lattice)
data(kid.weights, package = "UsingR")
xyplot(age ~ weight, data=kid.weights)
meses<-c(0, 36, 72, 108, 144)
xyplot(age ~ weight, data=kid.weights, col=rainbow(4)[unclass(cut(kid.weights$age, breaks=meses))])

# Hiciste bien las gráficas... pero la interpretación???

library(lattice)
data(female.inc, package = "UsingR")
bwplot( ~income | race, layout = c(1,3), female.inc)

# Y los resúmenes??