Ejercicio 3
1)
require(UsingR)

plot(diamond$price, diamond$carat,  xlab="Price", ylab="Carat", col="pink")
regresion<-lm(diamond$price~diamond$carat)

# falta el abline

predict(res)
        1         2         3         4         5         6         7
   8
 372.9483  335.7381  372.9483  410.1586  670.6303  335.7381  298.5278
447.3688
        9        10        q11        12        13        14        15
   16
 521.7893  298.5278  410.1586  782.2611  335.7381  484.5791  596.2098
819.4713
       17        18        19        20        21        22        23
  24
 186.8971  707.8406  670.6303  745.0508  410.1586  335.7381  372.9483
335.7381
       25        26        27        28        29        30        31
  32
 372.9483  410.1586  372.9483  410.1586  372.9483  298.5278  372.9483
931.1020
       33        34        35        36        37        38        39
  40
 931.1020  298.5278  335.7381  335.7381  596.2098  596.2098  372.9483
968.3123
       41        42        43        44        45        46        47
  48
 670.6303 1042.7328  410.1586  670.6303  670.6303  298.5278  707.8406
298.5278


El valor 40, corresponde a un carat de 0.33, y la predicción del costo es
968.3123

# La predicción se hacia así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)


2)
attach(cancer)
boxplot(stomach,bronchus,colon,ovary,breast)


#La cola mas larga corresponde a breast cancer
#La mas compacta corresponde a stomach cancer # bronquios
#Los centros para stomach y para bronchus son similares, colon y ovary
cancer tambien, pero el breast cancer es diferente


3)
require(lattice)
attach(kid.weight)

dotplot(weight~age | gender,groups=gender)

# Conclusiones?
# Gráfica por grupos?

4)
attach(female.inc)
bwplot(income~race)
bwplot(income~race,ylim=c(0,200000))
boxplot(income~race,ylim=c(0,200000))

#Se nota una diferencia, el centro de la distribucion de hispanos esta por
debajo de las otras 2
#Las otras dos distribuciones son muy similares
#Podemos decir que la distribucion de white es confiable. No podemos decir
lo mismo de la black porque son muy pocos datos.

# Faltó lo de los outliers en las blancas

i=1;
while(1<4){ # una trampa :P
summary(female.inc$income[which(unclass(female.inc$race)==i,arr.ind=TRUE)])
i<-1+i;
}

