#install.package("UsingR")

#Ejercicio 1

attach(diamond)

library(package="UsingR")
plot(price ~ carat)
regresion <- lm(price ~ carat)
abline(regresion,col="blue",type="l")

detach(diamond)

#En la ecuación y=mx+b así: x=1/3 m=3721 b=-259.6 obtenemos que
#un tercio de carat costara 980.733333

# donde quedó el código de lo que me pones en comentario???

#Ejercicio 2

boxplot(cancer)

##b)La cola más larga a la izquierda es para breast, y 
#a laderecha la tiene stomach.

##c)bronchus

##d)los centros ni son muy variables que digamos pero tampoco son #iguales.

##Ejericio 3

library(lattice)


xyplot(kid.weights$height ~ kid.weights$age)
##Puede que haya una relación, entre la edad y peso del ninio.
##pero no me queda 100% claro que digamos.

# Pregunta 3 Creo que así se hace pero ya no le pude preguntar a #nadie que me dijera como lo habían hecho.
# a)
xyplot(weight ~age, data=kid.weights, pch=21)
# b)
xyplot(weight ~ age, data=kid.weights, col=c("green", "yellow", "pink",
"blue")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))],  # bien :D
main="Relación de Peso y Edad")
# Puede que si haya una relación entre los diferentes grupos.
# Pero a como a los 9 anios parece que se pierde.

# Pregunta 4
# Si hay una diferencia en el ingreso entre las razas (pequenia #pero sí).
#las mujeres blancas y las negras tienen aproximadamente el mismo #ingreso, con la media muy cercana.
#el 95% porciento de las mujeres estan en el mismo intervalo, #Pero sí hay blancas con ingreso mayor que el de las de color.
#Las hispánicas están más fregadas en todo en comparación a las #otras razas.

bwplot(female.inc$income ~ female.inc$race, main="Income for differentraces")

# Y los resumenes??? tsk tsk