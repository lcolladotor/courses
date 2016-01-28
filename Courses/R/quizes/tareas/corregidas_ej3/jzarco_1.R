library(UsingR)
attach(diamond)
plot(diamond$carat, diamond$price)
lm(diamond$price ~ diamond$carat) -> lin_reg
abline(lin_reg, col="dark violet", lwd=2)
querry <- data.frame(carat = 1/3)
prediction <-predict(lm(price ~ carat), querry)
respuesta_1 <- c(0.33333, prediction)
names(respuesta_1) <- c("carat", "precio")
respuesta_1

# MUY bien :D

attach(cancer)
boxplot(cancer[1:5], main="cancer", cex.axis=0.5, col=rainbow(5))
respuestas_2 <- c("seno", "bronquios", "no")
names(respuestas_2) <- c("¿Cuál tiene la cola más larga?", "¿Cuál es la más compacta?", "¿Todos los centros son similares?")
respuestas_2
detach(cancer) # Eres la única que usó el detach (y llevo la mitad calificadas)

library(lattice)
data(kid.weights, package = "UsingR")
xyplot(age ~ weight, data=kid.weights)
xyplot(age ~ weight, data=kid.weights, col=rainbow(4)[unclass(cut(kid.weights$age, breaks=12*seq(0, 12, 3)))], pch=8)
respuesta_3 <- "La relación se mantiene en las dos primeras particiones, i.e. hasta antes de los 9"
respuesta_3
# Casi hehe. Se mantiene en los primeros 3 grupos, en el 4to ya no. Claro, pierde fuerza en el tercero.

library(lattice)
data(female.inc, package = "UsingR")
bwplot( ~income | race, female.inc, layout = c(1,3))
respuesta_4 <- "Sí hay diferencia de ingresos, aunque la media es muy cercana para todas los outliers de mayor sueldo se presentan en las mujeres blancas y son las hispanas las que ganan menos que cualesquiera de las otras dos razas" 
respuesta_4

# Faltó la parte de estadísticas por raza :( Casi una tarea perfecta hehe.

# Bien :D