# Respuestas al ejercicio 1 #
#############################

## Pregunta 1 ##
# Fracciones
1/c(1:10)
# Años
1964:2008
# Múltiplos de 25
rev(seq(25, 1000, by=25))
# Serie de nts
nts <- rep(c("A", "T", "C", "G"), c(2, 4, 1, 1))
nts # Con los espacios originales
nts <- paste(nts, collapse="")
nts # Ahora todo pegado
# Fibonnaci
fib <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)

## Pregunta 2 ##
# Parte a
ej1.2 <- c(2, 5, 4, 10, 8)
# b
ej1.2^2
# c
ej1.2 - 3
# d
sqrt(ej1.2 -5) # Este como tal genera errores porque le estás sacando la raíz a números negativos.
sqrt(abs(ej1.2 -5)) # Por eso usamos abs para obtener la raíz de los valores absolutos.


## Pregunta 3 ##
x <- c(1,3,5,7,9)
y <- c(2,3,5,7,11,13)
x+1
y*2
length(x)
length(y)
x+y # Como hay reciclaje, sale un warning.
sum(x>5)
sum(x[x>5])
sum(x>5 | x<3)
y[3]
y[-3]
y[x] # NA es "Not Available", osea, un dato que no existe
y[y>=7]
