#######ej.3#########
# I ###################################################################
library(UsingR)
plot(diamond$carat ~ diamond$price)
lm(price ~carat, data=diamond) -> regL
predict(regL, newdata=data.frame(carat=1/3))
##### el precio es 980.7157####
# II ##################################################################
attach(cancer)
boxplot(stomach,bronchus,colon,ovary,breast)
####La cola mas larga esd la del no. 5
####la de breast
####la cola mas compacta es la de stomach, 
####porque ovary no tiene cola o es todavia mas pequenia
#### y no, los centros no son similares
detach(cancer)
# III #################################################################

# En general veo que hiciste cosas que nadie más intento. Por ejemplo, eso de usar page, ltext, etc.
# Muy bien :D


library(lattice)
histogram(~weight | factor(gender), data=kid.weights)
densityplot(~weight, kid.weights, groups = gender, plot.points= FALSE, auto.key=TRUE)
bwplot( factor(height)~weight | gender, kid.weights)
print(splom(~kid.weights[1:3]|gender, data = kid.weights, layout=c(2,2), pscales = 0, varnames = c("age", "height", "weight"), 
page = function(...) {  ltext(x = seq(.6, .8, len = 1), y = seq(.9, .1, len = 1), lab = "age.height.weight", cex = 2) }))
#####Vemos que los ninos tienden a estar un poco mas arriba en peso que las ninas,
#####y que ademas las ninas varian mas en peso segun la edad que los hombres
AGES <- equal.count(kid.weights$age, number=6)
xyplot(weight~height | AGES, data=kid.weights) 
#####observamos que confome la edad va a umentando la relacion entre el peso y la altura va siendo un poco mas dificil de ver
AGES <-c(0,3*12,6*12,9*12,3*12,6*12,9*12,200)
dim(AGES)<-c(4,2)
AgeINTVS<- shingle(kid.weights$age, intervals=AGES)
xyplot(weight~height | AGES, data=kid.weights)
#####al parecer en los distintos grupos cambia un poco la relacion, pero
#al final podemos observar que el peso aumenta con la edad y con la altura
# puede ser que tengamos un sesgo hacia algunos valores, ya que no tenemos el
#mismo numeor de individuos para cada edad.
# IV #################################################################
bwplot(income~factor(race), data=female.inc, ylim=c(0,250000))
resumen<-split(female.inc, female.inc$race)
sapply(resumen,summary)
#####podemos observar que si existe una diferencia entre los ingresos para las distintas poblaciones # Faltó ser más específico aquí
##### tal vez no es mucha la diferencia pero definitivamente no son iguales







