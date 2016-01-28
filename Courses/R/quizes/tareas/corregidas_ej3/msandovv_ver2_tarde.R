Ejercicio3

1)Usen el set de datos diamond del paquete UsingR.
require(UsingR)
(a) Hagan un scatterplot de las variables carat y price.
(b) Anadenle la linea de regresion lineal simple.
(c) Haz una prediccion del valor de un diamante de un tercio de carat con
esta regresion.

  plot(diamond$carat, diamond$price, col="pink") # Falta la abline con la regresión
  reg<-lm(price~carat, data=diamond)n 
  predict(reg, newdata=data.frame(carat=1/3))

       1
980.7157


2)Usen el set de datos cancer del paquete UsingR.
(a) Haz una grafica con los boxplots de las variables stomach, bronchus,
colon, ovary y
breast.
 require(UsingR)
 boxplot(cancer) # no se lee 1 en el boxplot

(b) Cual tiene la cola mas larga?
La cola mas larga corresponde a breast cancer

(c) Cual es la mas compacta?
La mas compacta corresponde a stomach cancer

(d) Todos los centros son similares?
Los centros para stomach y para bronchus son similares, colon y ovary
cancer tambien, pero el breast cancer es diferente


3)Usa el set de datos kid.weights del paquete UsingR.
(a) Explora la relacion entre el peso y la edad usando lattice.
(b) Particiona a las edades en intervalos de 0-3, 3-6, 6-9 y 9-12.
  library(UsingR)
  library(lattice)
  attach(kid.weights)
  dotplot(weight~age | gender, groups=gender)

Se mantiene la misma relacion en los grupos?
Se observa una ligera tendencia de los niños a ser un poco  mas pesados
que las niñas.

# Nunca hiciste la parte b.

4)Usa el set de datos female.inc del paquete UsingR. Son datos de mujeres
en el 2001 en USA.
(a) Hay alguna diferencia del ingreso entre las razas? Usa boxplots con
lattice para ayudarte a responder la pregunta
  require(UsingR)
  attach(female.inc)
  bwplot(income~factor(race), data=female.inc, ylim=c(0,250000)) #ok

Se observa una diferencia, el centro de la distribucion del grupo hispano
esta por debajo de las otros 2
La distribución de blancos y negros se parece mucho, aunque hay más datos
de blancos.

# Faltó lo de los outliers en la pob blanca


(b) Encuentra el resumen de estad&#305;sticas para cada grupo racial.
  l<-split(female.inc, female.inc$race)
  sapply(l,summary) #ok
      black              hispanic          white
 [1,] "Min.   :   311  " "Min.   :  311  " "Min.   :   311  "
 [2,] "1st Qu.:  4353  " "1st Qu.:  311  " "1st Qu.:  6214  "
 [3,] "Median : 13619  " "Median : 6214  " "Median : 13619  "
 [4,] "Mean   : 19496  " "Mean   :14902  " "Mean   : 22047  "
 [5,] "3rd Qu.: 27899  " "3rd Qu.:20924  " "3rd Qu.: 30930  "
 [6,] "Max.   :116507  " "Max.   :78610  " "Max.   :650512  "
 [7,] "black   :122  "   "black   : 0  "   "black   :  0  "
 [8,] "hispanic:  0  "   "hispanic:93  "   "hispanic:  0  "
 [9,] "white   :  0  "   "white   : 0  "   "white   :785  "
[10,] NA                 NA                NA
[11,] NA                 NA                NA
[12,] NA                 NA                NA





