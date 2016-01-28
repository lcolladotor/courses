
##1

library(UsingR)
plot(diamond$carat,diamond$price,main="Tamaño del diamante vs precio en dólares de Singapore",xlab="Tamaño diamante",ylab="Precio en dólares",col=c("red"))

res<-lm(diamond$price ~ diamond$carat)
res

abline(res,col="blue",lwd=2)
predict(res)

#para el caso de 0.33 el valor es 968.3123

# Cerca, pero la predicción exacta se hacía así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))

##2

attach(cancer)

boxplot(stomach,bronchus,colon,ovary,breast,main="Cancer survival times",col="yellow")

##(b) Cual tiene la cola más larga?

##La cola mas larga, corresponde a breast cancer

##(c) Cual es la más compacta?

##La mas compacta corresponde a stomach cancer

##(d) Todos los centros son similares?

##No, al menos para stomach y bronchus son similares, lo mismo aplica para colon y ovary cancer, pero en el 
##caso de  breast el centro si difiere de los otros cuatros tipos
##de cáncer.

# Bien!

##3

library(lattice)
data(kid.weights, package = "UsingR")
xyplot(weight ~ age,data=kid.weights,main="Relación entre peso y edad(meses)",ylab="Peso",xlab="Edad(meses)",type=c("p","g","smooth"))

# Chido! Con todo y línea :D

xyplot(age ~ weight, data=kid.weights,main="Relación entre peso y edad(meses)",ylab="Peso",xlab="Edad(meses)", [unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], pch=5)
#si se mantiene la relacion 

# Tu segundo xyplot no corre. Se hacía así:
xyplot(age ~ weight, data=kid.weights, col=c("red", "blue", "green", "yellow")[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], main="Relacion Peso Edad")
# Tu conclusión está mal. En el último grupo no se mantiene la relación.

##4
library(lattice)
library(lattice)
data(female.inc, package = "UsingR")
bwplot( ~income | race, female.inc, layout = c(1,3))
##Si hay diferencia en los ingresos

# Explica más!
# Faltó lo de las estadísticas por grupo.





