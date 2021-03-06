##http://www.lcg.unam.mx/~jmiranda/ej3_jmiranda.R

##1.
library(UsingR)
plot(diamond$carat, diamond$price)
reg<-lm(price ~carat , data=diamond)
#Falt� usar abline
predict(reg, newdata=data.frame(carat=1/3))

##2.
boxplot(cancer)
##################################################
## b)la cola m�s grande es la del c�ncer de pecho.
## c)la cola m�s compacta es la del cancer de ovario
## el centro de breast parece mucho mayor

##3
library(lattice)
histogram(~weight | factor(gender), data=kid.weights)
densityplot(~weight, kid.weights, groups = gender, plot.points= FALSE, auto.key=TRUE)
bwplot( factor(height)~weight | gender, kid.weights) # hehe, no ten�as que hacer tantos boxplots

##los ni�os tienen apenas una ligera tendencia a ser m�s pesados que las ni�as, la varianza en la altura de los ni�os es mayor que en las ni�as
 print(splom(~kid.weights[1:3]|gender, data = kid.weights, layout=c(2,2), pscales = 0, varnames = c("edad", "altura", "peso"), page = function(...) {  ltext(x = seq(.6, .8, len = 1), y = seq(.9, .1, len = 1), lab = c("Pesos de los peque�os marcianos"), cex = 2) }))

Edad <- equal.count(kid.weights$age, number=4)
xyplot(weight~height | Edad, data=kid.weights)
##En esta gr�fica vemos como, con cuando aumenta la edad, disminuye la co_
##rrelaci�n entre altura y peso.

# MUY bien :D Sobre tu �ltima gr�fica, ya que se ve claramente que la relaci�n se vuelve cuadr�tica cuando los ni�os tienen entre 9 y 12 a�os.

#b) 
Edad <-c(0,3*12,6*12,9*12,3*12,6*12,9*12,200)
dim(Edad)<-c(4,2)
Edadintvs<- shingle(kid.weights$age, intervals=Edad)
xyplot(weight~height | Edad, data=kid.weights)
##No se mantiene la misma relaci�n en los grupos
#4.

 bwplot(income~factor(race), data=female.inc, ylim=c(0,250000)) # No uses ylim en este caso :P
##Parece no haber una diferencia significativa. Las mujeres blancas tienen m�s valores extremos en la parte superior.
#b)
l<-split(female.inc, female.inc$race)
sapply(l,summary)

# Una forma ingeniosa para hacer esta parte :D
