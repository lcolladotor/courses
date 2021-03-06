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