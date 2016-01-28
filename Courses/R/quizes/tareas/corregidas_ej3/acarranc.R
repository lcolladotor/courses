#1
 library(UsingR)
 attach(diamond)
 regresion <- lm( price~carat)
 plot(diamond$carat, diamond$price, main = "Relacion entre los quilates y el precio en Diamantes", col.main = "purple", font.main = 4, xlab = "Quilates", ylab = "Precio", col.lab = "blue", pch = 21, bg = rainbow(10))
 abline(regresion, col="red",lwd=3)
 predict.lm(regresion, data.frame(carat = 1/3))
#La prediccion para el valor del diamante si tiene 0.3333 quilates es de 980.7157 

# Bien! Y con muchos colores haha

#2
 library(UsingR)
 attach(cancer)
 boxplot(cancer, main = "Cancer", col.main = "purple", font.main = 4, xlab = "Tipo", col.lab = "blue", pch = 21, bg = "purple", col=rainbow(10))
# La cola mas larga es la de cancer de seno, es la cola de abajo. La más compacta corresponde a bronquio y es la de abajo.  En relacion a los centros, estos tienen valores relativamente cercanos pero no son tan similares, difieren.


#3
 library(lattice)
 library(UsingR)
 xyplot(kid.weights$weight ~ kid.weights$age,  main = "Relacion entre peso y edad" , font.main = 4, xlab = "peso", ylab = "edad", col = rainbow(10))
#De a cuerdo a la grafica, hay una relacion (o al menos es lo que yo infiero)entre el peso y la edad pero solo entre los valores entre 0 y 75 de peso (mas o menos)

 xyplot(weight ~ age, data=kid.weights, col=c("purple", "blue", "green", "red")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], main = "Relacion entre peso y edad" , font.main = 4, xlab = "peso", ylab = "edad")
# La relacion solo se mantiene en los primeros 2 grupos

# Se mantiene en los primeros 3, y se vuelve cuadrática en el 4to. Claro, en el 3ro es menos fuerte que en los grupos 1 y 2.



#4
 library(lattice)
 library(UsingR)
 bwplot(female.inc$income ~ female.inc$race, main = "Relacion entre la raza y salario en mujeres", font.main = 4, xlab = "Raza", ylab = "Salario", col="red")
#A pesar de que las medianas de los tres tipos de razas, estan cerca de un mismo valor, se puede apreciar en la grafica que la media de las mujeres hispanas presenta un valor un poco mas bajo, por lo que se puede inferir que su salario es menor al de las mujeres negras y blnacas. Tambien se puede observar que los valores para los salarios tienen a variar mas en las mujeres blancas y menos en las mujeres negras e hispanas.

# Faltó lo de los outliers de las blancas


 razasubclase <- unclass(female.inc$race)
 summary(razasubclase)
 
 # esta mal, era 1 por raza, no un summary por los 3

#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  1.000   3.000   3.000   2.663   3.000   3.000 