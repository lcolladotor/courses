# Respuestas al Ejercicio 2 #
#############################

## Pregunta 1 ##
sort(islands, decreasing=TRUE)[c(1:7, length(islands)-1, length(islands))]
# Usamos el sort y de una vez encontramos nuestras islas. Ponemos el 1:7 porque queremos las 7 m�s grandes.
# Luego, usamos length(islands)-1 para encontrar la pen�ltima y length(islands) para encontrar la �ltima (m�s peque�a) isla.

## Pregunta 2 ##
# Leemos la tabla, tal como lo hicimos en la presentaci�n
fagos <- read.table("http://kabah.lcg.unam.mx/~lcollado/E/data/10biggestPhages.txt", header=TRUE)
# Encontramos el porcentaje de Taxid �nicos
length(unique(fagos[,4])) / length(fagos[,4]) * 100
# Como da 100, entonces todos son �nicos :D
min(fagos[,2])
# Me da que 176847 es el tama�o de genoma m�s chico para los fagos de nuestra tabla.
fagos[which(fagos[,2] == min(fagos[,2])), 1]
# Con la anterior l�nea encuentro el nombre del fago (columna 1) cuyo tama�o de genoma corresponde al m�nimo.
as.character( fagos[which(fagos[,2] == min(fagos[,2])), 1] )
# Originalmente, me regresa el nombre pero el modo de la columna 1 es factor. Como solo nos interesa el nombre y no los "levels", simplemente usamos as.character()

## Pregunta 3 ##
# Bueno, solo hay 3 combinaciones diferentes posibles de parejas cuando tienes 3 elementos.
combn(c("Fer", "Sur", "Mariana"), 2)
# Con la anterior l�nea lo comprobamos.

## Pregunta 4 ##
# Parte a
# Las dos fiestas son eventos independientes, as� que la probabilidad de que alguien termine 'Happy' en una
#  y 'Pedo' en la otra es simplemente igual a la m�ltiplicaci�n de la probabilidad de terminar 'Happy' y la de 
# terminar 'Pedo'. As� que la respuesta es 0.4 * 0.3 = 0.12
0.4 * 0.3
# Parte b
# Como son independientes las dos fiestas, en realidad no importa como termin� alguien en la 1era para la 2nda fiesta.
# As� que la respuesta es simplemente 0.1, que es la probabilidad de terminar 'Muerto'.