#Ejercicio 3

#1. Usen el set de datos diamond del paquete UsingR.
#		(a) Hagan un scatterplot de las variables carat y price.
#		(b) A˜nadenle la l´ınea de regresi´on lineal simple.
#		(c) Haz una predicci´on del valor de un diamante de un tercio de carat con esta regresi´on.


#abrir el paquete Using R
require(UsingR)

#Necesitare lattice :o !!!
require(lattice)


#(a)
plot(diamond$carat ~ diamond$price)
#(b)
regresion_l <- lm(diamond$carat ~ diamond$price)
abline(regresion_l, col="red", lwd=3)
#(c)
(1/3 - regresion_l$coefficients[1]) / regresion_l$coefficients[2]
# El resultado que arroja es: 991.3965 

# Bien, aunque la idea era que usarán predict así:
attach(diamond)
reg <- lm(price ~ carat)
abline(reg, col="blue", lwd=2)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

###########

#2. Usen el set de datos cancer del paquete UsingR.
#		(a) Haz una gr´afica con los boxplots de las variables stomach, bronchus, colon, ovary y breast.
#		(b) Cual tiene la cola m´as larga?
#		(c) Cual es la m´as compacta?
#		(d) Todos los centros son similares?


#exploring los datos

cancer

colores <- c("yellow","orange","red","purple","green")

# a) 
boxplot(cancer,names=c("Estomago", "Bronqueos", "Colon", "Ovarios", "Pecho"), col = "purple")
title(main= "CANCER", col.main = "blue", font.main = 4)


## !!! ## 
## cual cola??? - Supondre que ambas  

# b) Jugando por la grafica, parece que en "Pecho" encontramos una mayor dispersión de los datos. Eso se refleja en la longitud de las "colas" y los valores extremos, bolitas.
# c) La más compacta corresponde a los datos de "Bronqueos"
# d) Juzgando graficamente, estomago y bronqueos parecen tener la misma mediana, igual para el par de colon y ovarios; pero no asi para la mediana de pecho, que no semeja o otra.

#ok

###########

#3. Usa el set de datos kid.weights del paquete UsingR.
#		(a) Explora la relaci´on entre el peso y la edad usando lattice.
#		(b) Particiona a las edades en intervalos de 0-3, 3-6, 6-9 y 9-12. Se mantiene la misma relaci´on en los grupos?

#exploring datos 

kid.weight # te falta una s :P


# a)

histogram(~weight | factor(gender), data=kid.weights)

densityplot(~weight, kid.weights, groups = gender, plot.points= FALSE, auto.key=TRUE)

bwplot( factor(height)~weight | gender, kid.weights)


#En general la correlacion es linear de peso y edad, aqui se muestran tambie  diferencias respecto al genero.


# b)
rangos <-c(0,3*12,6*12,9*12,3*12,6*12,9*12,200)

edad <- rangos

dim(edad)<-c(4,2)

Edadintvs<- shingle(kid.weights$age, intervals=edad)

xyplot(weight~height | edad, data=kid.weights)

#En general los grupos presentan una dispersion de los datos que sugiere que no mantienen la misma relacion lineal.

# Mas bien, la relación se pierde con el 4to grupo, aunque es un poco difícil de ver con los shingles.
# Aquí si se ve: (si quieres busca los archivos de los otros para ver una gráfica similar pero en lattice)
plot(kid.weights$weight, kid.weights$age, col=c("green","blue","red","purple")[unclass(cut(kid.weights$age, breaks=12*seq(0,12,3)))], main="Relación entre edad y peso")



#4. Usa el set de datos female.inc del paquete UsingR. Son datos de mujeres en el 2001 en USA.
#		(a) Hay alguna diferencia del ingreso entre las razas? Usa boxplots con lattice para ayudarte a responder la pregunta.
#		(b) Encuentra el resumen de estad´ısticas para cada grupo racial.

# a)
bwplot(female.inc$race ~ female.inc$income)
#
### La mediana se encuentra razonablemente a la misma medida, con una disminución en "hispanas". Sin embargo, es en los valore extremos donde se observa una gran diferencia
#	entre blancas, ocupando el primer sitio, luego negras y al final, sin puntos extremos tan alejados, las hispanas.

# b)
summary(female.inc$income[(unclass(female.inc$race))]) # Esta mal esto. Quería un summary por raza, no uno general.

 #		Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 #		11100   11100   11100   14440   11100   30930 
