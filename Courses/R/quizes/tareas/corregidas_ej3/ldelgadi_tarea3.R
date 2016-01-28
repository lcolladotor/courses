#######Para el 1 ##########
####Usar diamond
library(UsingR)
plot(diamond$carat, diamond$price)
reg<-lm(price ~carat , data=diamond)
predict(reg, newdata=data.frame(carat=1/3))
summary(regresion) # No existe el objeto regresion!

#######Para el 2 ##########
####Usar cancer
boxplot(cancer)
#b)la cola mas grande es la del breast cancer.
#c)la cola mas compacta es la del bronchus cancer.
#d)centro de breast es mucho mayor

#######Para el 3 ##########
####Usar kid.weights
library(lattice)
histogram(~weight | factor(gender), data=kid.weights)
densityplot(~weight, kid.weights, groups = gender, plot.points= FALSE, auto.key=TRUE)
bwplot( factor(height)~weight | gender, kid.weights)

attach(kid.weight) # Te faltó una s en kid.weights
dotplot(weight~age | gender,groups=gender)

#
####Los ninios tienen apenas una ligera tendencia a ser mas pesados que las ninias,
####la varianza en la altura de los ninios es mayor que en las ninias.

print(splom(~kid.weights[1:3]|gender, data = kid.weights, layout=c(2,2), pscales =0,
            varnames = c("edad", "altura", "peso"),
            page = function(...)
            {  ltext(x =seq(.6, .8, len = 1), y = seq(.9, .1, len = 1),
            lab = c("Pesos de los Ninios"), cex = 2) }))


##En esta grafica vemos como, al parecer si aumenta la edad, disminuye la co_
##correlacion entre altura y peso.
Edad <- equal.count(kid.weights$age, number=4)
xyplot(weight~height | Edad, data=kid.weights)


###Particionar las edades de los ninios
Edad <-c(0,3*12,6*12,9*12,3*12,6*12,9*12,200)
dim(Edad)<-c(4,2)
Edadotra<- shingle(kid.weights$age, intervals=Edad)
xyplot(weight~height | Edad, data=kid.weights)

####Se rompe la relacion conforme a los grupos

# Bien :) Es sobre todo en el último grupo donde se rompe la relación.


#######Para el 4 ##########
####Usar female.inc
####a) diferencia de razas
bwplot(income~factor(race), data=female.inc, ylim=c(0,250000))
####Las mujeres blancas tienen valores un tanto extremos en la parte superoir

####b) Resumen por grupo racial
GrupRacial<-split(female.inc, female.inc$race)
sapply(GrupRacial,summary)

# Bien :)