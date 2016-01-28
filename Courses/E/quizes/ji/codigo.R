# Instrucciones #
#################
# Es un examen individual y como tal esperamos un archivo .R por cada uno de ustedes.
# Lo tienen que entregar vía la página de Cursos de la LCG de acuerdo al tiempo límite allí especificado. Recuerden que es hora servidor y no hora local.
# Una vez terminado el tiempo límite publicaremos en la página de la parte de R la respuesta esperada. Está fácil ;) No se aceptan respuestas tardías.
# Cada línea de su código, sea una llave } o lo que sea, tiene que estar comentado.
# Tienen que incluir como comentario su conclusión con respecto al problema.
# El examen no es tiempo de dudas ;) Aunque si no entienden las instrucciones pregúntenle a Leo.

# Problema a resolver con la ji cuadrada usando R #
###################################################
# Se califica la inteligencia de un delfín con 6 pruebas diferentes.
# En cada prueba el delfín puede obtener hasta 100 puntos. 
# Se desea saber con 95% de confianza si la variación de puntajes 
# se debe al azar o si el tipo de prueba y el examinador que la aplica 
# influyen en la calificación.

# Imagen #
##########
# http://www.lcg.unam.mx/~lcollado/E/quizes/ji/delfin.JPG

# Código #
##########
datos <- read.table("http://www.lcg.unam.mx/~lcollado/E/quizes/ji/input.txt", header=TRUE) # Leemos el archivo con la informacion. Como tenemos nombres en las columnas y renglones usamos header=TRUE
datos <- as.matrix(datos) # Convertimos el objeto datos al formato de matriz.
# Les recomiendo que vean la tabla simplemente escribiendo: datos
# Si es necesario, usen la ayuda de R.