# Respuestas al Ejercicio 2 #
#############################

## Pregunta 1 ##
sort(islands, decreasing=TRUE)[c(1:7, length(islands)-1, length(islands))]
# Usamos el sort y de una vez encontramos nuestras islas. Ponemos el 1:7 porque queremos las 7 más grandes.
# Luego, usamos length(islands)-1 para encontrar la penúltima y length(islands) para encontrar la última (más pequeña) isla.

## Pregunta 2 ##
# Leemos la tabla, tal como lo hicimos en la presentación
fagos <- read.table("http://kabah.lcg.unam.mx/~lcollado/E/data/10biggestPhages.txt", header=TRUE)
# Encontramos el porcentaje de Taxid únicos
length(unique(fagos[,4])) / length(fagos[,4]) * 100
# Como da 100, entonces todos son únicos :D
min(fagos[,2])
# Me da que 176847 es el tamaño de genoma más chico para los fagos de nuestra tabla.
fagos[which(fagos[,2] == min(fagos[,2])), 1]
# Con la anterior línea encuentro el nombre del fago (columna 1) cuyo tamaño de genoma corresponde al mínimo.
as.character( fagos[which(fagos[,2] == min(fagos[,2])), 1] )
# Originalmente, me regresa el nombre pero el modo de la columna 1 es factor. Como solo nos interesa el nombre y no los "levels", simplemente usamos as.character()

## Pregunta 3 ##
# Bueno, solo hay 3 combinaciones diferentes posibles de parejas cuando tienes 3 elementos.
combn(c("Fer", "Sur", "Mariana"), 2)
# Con la anterior línea lo comprobamos.

## Pregunta 4 ##
# Parte a
# Las dos fiestas son eventos independientes, así que la probabilidad de que alguien termine 'Happy' en una
#  y 'Pedo' en la otra es simplemente igual a la múltiplicación de la probabilidad de terminar 'Happy' y la de 
# terminar 'Pedo'. Así que la respuesta es 0.4 * 0.3 = 0.12
0.4 * 0.3
# Parte b
# Como son independientes las dos fiestas, en realidad no importa como terminó alguien en la 1era para la 2nda fiesta.
# Así que la respuesta es simplemente 0.1, que es la probabilidad de terminar 'Muerto'.