# Instrucciones #
#################
# Es un examen individual y como tal esperamos un archivo .R por cada uno de ustedes.
# Lo tienen que entregar v�a la p�gina de Cursos de la LCG de acuerdo al tiempo l�mite all� especificado. Recuerden que es hora servidor y no hora local.
# Una vez terminado el tiempo l�mite publicaremos en la p�gina de la parte de R la respuesta esperada. Est� f�cil ;) No se aceptan respuestas tard�as.
# Cada l�nea de su c�digo, sea una llave } o lo que sea, tiene que estar comentado.
# Tienen que incluir como comentario su conclusi�n con respecto al problema.
# El examen no es tiempo de dudas ;) Aunque si no entienden las instrucciones preg�ntenle a Leo.

# Problema a resolver con la ji cuadrada usando R #
###################################################
# Se califica la inteligencia de un delf�n con 6 pruebas diferentes.
# En cada prueba el delf�n puede obtener hasta 100 puntos. 
# Se desea saber con 95% de confianza si la variaci�n de puntajes 
# se debe al azar o si el tipo de prueba y el examinador que la aplica 
# influyen en la calificaci�n.

# Imagen #
##########
# http://www.lcg.unam.mx/~lcollado/E/quizes/ji/delfin.JPG

# C�digo #
##########
datos <- read.table("http://www.lcg.unam.mx/~lcollado/E/quizes/ji/input.txt", header=TRUE) # Leemos el archivo con la informacion. Como tenemos nombres en las columnas y renglones usamos header=TRUE
datos <- as.matrix(datos) # Convertimos el objeto datos al formato de matriz.
# Les recomiendo que vean la tabla simplemente escribiendo: datos
# Si es necesario, usen la ayuda de R.

# Respuesta #
#############
res <- matrix(NA, nrow=5, ncol=6) # Creamos nuestra matriz para almacenar los datos de los valores esperados.
for (i in 1:5) { res[i,] <- rowSums(datos)[i] * colSums(datos) / sum(datos) } # Llenamos la matriz res. Para cada renglon de res, calculamos la suma del renglon de datos * ( la suma de cada columna divida entre el numero total)
ji <- (datos-res) ^2 / res # Creamos el objeto ji, que tiene los valores que usaremos para la sumatoria de ji. La dejamos en este formato para que puedan verlo como tabla, aunque si quieren ya podrian usar la funcion sum.
pchisq(sum(ji), (5-1)*(6-1), lower.tail=F) # Encontramos el valor p. Si es menor a 0.05 entonces sera significativo de acuerdo a la definicion del problema. Adentro de pchisq calculamos la sumatoria y los grados de libertad.
# Da un valor p de 1.883551e-10 por lo cual si es significativo, por lo cual si influye el tipo de prueba y experimentador que la aplica.
# Por si tienen curiosidad, vean las tablas datos, res y ji.