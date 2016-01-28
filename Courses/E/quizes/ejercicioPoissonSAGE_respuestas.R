#La tecnica SAGE (Serial Analysis of Gene Expression) sirve para hacer un perfil de expresion de genes en
#determinada poblacion de celulas. SAGE te saca el numero de veces que encuentras una etiqueta (tag) que representa
#un cacho de un mRNA de un gen. Entonces, los datos son discretos y se pueden tratar los estados de nivles de expresion de genes como una binomial. Por ejemplo, si una etiqueta x se encuentra 5 veces dentro de mi set de datos
#control de 1000 etiquetas, tenemos que p = 5/1000 = .005 y n = 1000. Como p es muy chica y n es muy grande,
#podemos aproximar la binomial a una distribucion Poisson. En donde lambda = np = .005*1000 = 5.

#En este ejercicio vamos a leer datos de expresion de genes en tejido cerebral normal y en un tumor cerebral
#llamado astrocytoma. Los datos de los genes en tejido cerebral normal van a conformar nuestras distribuciones
#nulas que se comportan como una Poisson con lambda = # de copias de cada etiqueta. Usando los datos del tumor
#cerebral, veremos que etiquetas estan sobrerrepresentadas en este tejido (o sea, que genes estan sobreexpresados
# en el tumor cerebral con respecto al tejido control).

#1# LECTURA DE DATOS
#Vas a sacar los datos de la pagina http://www.ncbi.nlm.nih.gov/geo/ usando los numeros de acceso proporcionados
#a continuacion en el campo "GEO accession"

#a# Lee los datos de tejido cerebral normal: GSM676. Revisa que tu matriz se haya leido bien: dimension,
#   principio, fin (head, tail).

   #leemos tabla. Saltamos primeras 3 lineas con skip. Tomamos primera linea de lectura como nombres de columnas con header
normal <- read.table("GSM676.txt", header = TRUE, skip = 3)
dim(normal)#dimension tabla. Nos da una idea de la cantidad de datos con la que estamos trabajando y aparte revisas que
           #mas o menos concuerde con lo que esperabas de la tabla(numero de filas, numero de columnas)
head(normal)#principio de la tabla, checamos que este bien
tail(normal)#fin de la tabla, checamos que este bien

#b# Lee los datos de tejido tumoral: GSM697. Revisa que tu matriz se haya leido bien: dimension,
#   principio, fin (head, tail).

tumor <- read.table("GSM697.txt", header = TRUE, skip = 3)
dim(normal)
head(normal)
tail(normal)

#2# FILTRO DE DATOS, NORMALIZACION Y FUSION

#a# Para evitar falsos positivos, vas a tomar en cuenta solo aquellas etiquetas que esten presente en al menos
#   2 copias. Filtra de esta forma cada set de datos.

   #filtramos tabla seleccionando (con which) todas las lineas cuyo numero de copias (COUNT) sea mayor a 1
normal.filtro <- normal[which(normal$COUNT > 1), ]
dim(normal.filtro)
head(normal.filtro)
tail(normal.filtro)

tumor.filtro <- tumor[which(tumor$COUNT > 1), ]
dim(tumor.filtro)
head(tumor.filtro)
tail(tumor.filtro)

#b# Un problema es que el numero total de etiquetas del set de datos de tejido cerebral normal no es el mismo
#   que el de etiquetas del set de datos de tumor, y como vamos a trabajar con valores absolutos, tenemos que
#   definir un criterio de normalizacion. En algunos estudio definen n como una cifra entre el # de etiquetas de
#   un set y el # de etiquetas del otro set(saca estos datos). En este caso, definiremos n como 50000. Entonces,
#   para cada valor COUNT de cada set de datos vamos a hacer lo siguiente: COUNT/(# total de eventos) * 50000.
#   Normaliza tus datos de esta forma.

total.normal <- sum(normal.filtro$COUNT)#numero total de eventos en normal
total.normal

total.tumor <- sum(tumor.filtro$COUNT)#numero total de eventos en tumor
total.tumor

normal.norm <- normal.filtro #copiamos matriz a una nueva variable en donde normalizaremos los datos
normal.norm$COUNT <- round(normal.filtro$COUNT / total.normal * 50000)# normalizamos datos de columna COUNT
   #checamos matriz anterior y nueva matriz, se puede hacer  calculando  manualmente algunos datos del head
head(normal.filtro)
head(normal.norm)

tumor.norm <- tumor.filtro
tumor.norm$COUNT <- round(tumor.filtro$COUNT / total.tumor * 50000)
head(tumor.filtro)
head(tumor.norm)

#c# Ahora, como las etiquetas no estan en el mismo orden en ambos sets de datos, puedes fusionar ambas matrices
#   alineandolas por etiqueta. Usa la funcion merge(). De esta forma pordras evaluar la sobreexpresion de cada
#   gen mas facilmente.
   #fusionamos matrices normal.norm y tumor.norm. by.x indica la columna de la primera matriz con la que voy a fusionar,
   #y by.y la de la segunda. Como dijo Jorge, tambien se puede usar by = "TAG"
normal.tumor <- merge(normal.norm, tumor.norm, by.x = "TAG", by.y = "TAG")
head(normal.tumor)

#3# EVALUACION INDIVIDUAL DE UN GEN

#Un gen X tiene la etiqueta: GTGAAACCCC. Queremos saber si esta sobre expresado en tumor.

#a# Cuantas copias (normalizadas) tiene este gen en el tejido cerebral? Cuantas en el tumor?

   #guardo en una variable los datos que quiero de la etiqueta GTGAAACCCC
GTGAAACCCC <- normal.tumor[which(normal.tumor$TAG ==  "GTGAAACCCC"), c("TAG","COUNT.x", "COUNT.y")]
GTGAAACCCC

#b# Cual es la probabilidad de encontrar al menos este numero de copias (de tumor) si asumimos que el estado
#   de expresion del gen se distribuye como una Poisson con lambda = # copias en tejido cerebral?
#   i. Primero haz este calculo manualmente (con la formula que te sabes) puedes usar las funciones exp y factorial.
#      Por que no se pudo sacar?

lambda <- GTGAAACCCC[1,"COUNT.x"]# numero de copias en tejido normal
k <- 0:GTGAAACCCC[1,"COUNT.y"]# vector de 0 a numero de copias en tumor
p <- 1 - sum((lambda^k * exp(-lambda))  / factorial(k))#P(X > k) con formula Poisson

warnings()#nos dice que no se puede calcular factoriales para numero tan grandes

#   ii.Ahora has el calculo con la funcion ppois(). Que puedes concluir?

k <- length(k)# numero de copias en tumor
p <- ppois(k, lambda, lower.tail = FALSE)# calculamos P(X > k) con X~Po(lambda)
                                         # si lower.tail = TRUE, calcula P(X <= k)
p

#Como p << .05 rechazo mi hipotesis nula de que el numero de copias del gen X en tejido normal es igual al de tumor.
#O sea, puedo decir que este gen esta sobreexpresado en tumor.


#4# EVALUACION DE TODOS LOS GENES

# Queremos saber todas las etiquetas  que estan sobre-representadas  en el tumor.
#a#  Con la misma funcion ppois(), identifica las etiquetas  que esten sobre-representadas en tumor con un nivel
#    de error tipo I del 5%.

   #para cada etiqueta, asumo una distribucion X Poisson con lambda = num. copias normal,calculo P(X > num. copias tumor)
ps <- ppois(normal.tumor$COUNT.y, normal.tumor$COUNT.x, lower.tail = FALSE)
   #checo que mis ps se hayan calculado como esperaba (se puede hacer manualmente para valores cuyo factorial si puedas sacar)
head(ps)
head(normal.tumor)
tail(ps)
tail(normal.tumor)

#b#  Cuantos cuatas etiquetas son? Que podrias hacer con esta informacion y que puedes concluir?

length(which(ps < .05))

#Son 1061 etiquetas las que estan sobre-representadas en tumor con p < .05. Puedo decir que los genes que corresponden a estas etiquetas estan sobre-expresados en tumor.(Pero esperariamos que un 5% de ellos sean falsos positivos).
#Estos genes podrían servir como candidatos para marcadores de deteccion de este tipo de tumor, o blancos de farmacos que destruyan este tipo de tumores. Claro que para esto se tienen que hacer muchos otros estudios, con mas muestras de tumor y mas muestras de tejido normal. Y con tumores a distintas etapas de desarrollo (puede que en los inicios del tumor sean pocos los genes expresados anormalmente, y estos pueden ser los verdaderos causantes originales de la formacion del tumor).

#5# MALAS NOTICIAS

#Normalmente este tipo de experimentos se hace con replicas. Esto es, sacan varias muestras de tejido cerebral y de
#tejido tumoral. Por ejemplo, para un gen X tenemos que la etiqueta x lo representa, y esta se encuenta en
#60,85,100,90 y 105 copias en cada una de las 5 replicas.
#a# Saca la media de estos datos.

x <- c(60,85,100,90)
mean(x)

#b# Saca la varianza de estos datos.

var(x)

#c# Cuantas veces es mas grande la varianza que la media? Es correcto usar la Poisson para estos
#   datos? Por que?

var(x)/mean(x)

#En este caso la varianza es 3.45 veces mas grande que la media. Como la distribucion Poisson asume que mean(x) = var(x), no es correcto usar la Poisson para estos datos.

#d# Hechale un ojo al siguiente articulo y explica A GRANDES RASGOS que proponen ellos.
#   Zuyderduyn SD, "Statistical analysis and significance testing of serial analysis of gene expression data
#   using a Poisson mixture model", BMC Bioinformatics, 2007.

#Ellos proponen usar un model mixto de Poisson. Basicamente consideran que distintos componentes independientes estan afectando la varianza tan grande de los datos, entonces particionan sus datos en estos componentes, cada uno de los cuales se  distribuye como una Poisson.

