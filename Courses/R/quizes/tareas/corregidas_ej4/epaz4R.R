#Tarea 4

#  UsingR

library(UsingR)

#1. Asume que una poblaci´on est´a dividia en dos sobre alguna decisi´on (p = 1/2). Toman una
#muestra aleatoria de tama˜no 1000. Cual es la probabilidad de que la muestra aleatoria tendr´a
#550 o m´as votos a favor de la decisi´on? Responde usando una aproximaci´on normal.

#la media es igual a 1/2 * (1000)
media <- 0.5*1000
desviacion_est <- sqrt(0.5*0.5*1000)
pnorm(549,mean=media,sd=desviacion_est, lower.tail = FALSE) # bien

## Resultado = [1] 0.0009707699
#  Una probabilidad pequeña

# Sip hehe
# Tmb funciona esto:
muestra <- NULL
for (i in 1:10000) muestra[i] <- sum(sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5)))
1-pnorm(550, mean(muestra), sd(muestra)) # Nota que mean(muestra) =~ 500 y sd(muestra) =~ sqrt(250)

##########


#2. Para qu´e valor de n la distribuci´on X se ve aproximadamente como una normal cuando cada
# Xi es de tipo exponencial (1)^1. Corre varias simulaciones para diferentes ns hasta que decidas
# cuando empieza a verse como normal.


colores <- c("red", "green", "purple", "orange", "gray", "brown", "blue")
simulaciones <- c("500", "400", "300", "250", "200", "150", "100")

m<-500

res.100 <- c()
res.150 <- c()
res.200 <- c()
res.250 <- c()
res.300 <- c()
res.400 <- c()
res.500 <- c()

f <- function(n) mean(rexp(n))
for (i in 1:m) res.100[i] <- f(100)
for (i in 1:m) res.150[i] <- f(150)
for (i in 1:m) res.200[i] <- f(200)
for (i in 1:m) res.250[i] <- f(250)
for (i in 1:m) res.300[i] <- f(300)
for (i in 1:m) res.400[i] <- f(400)
for (i in 1:m) res.500[i] <- f(500)

plot(density(res.500), xlim = range(res.100),type = "l", main = "normal?", xlab = "Mean", col="red")
lines(density(res.400), col="green")
lines(density(res.300),col="purple")
lines(density(res.250), col="orange")
lines(density(res.200),col="gray")
lines(density(res.150), col="brown")
lines(density(res.100),col="blue")



legend(1.15, 6, simulaciones, col= colores, lty=2)

# Bien, y la n? funciona desde 25
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)


dev.off() #Para que pones dev.off() ???

############

#3. Usa el set de datos cabinet del paquete UsingR. Este contiene informaci´on sobre la cantidad
# de dinero que se ahorrar´on los miembros del comit´e de Bush en el 2003 ccuando pasaron una
# nueva ley sobre impuestos. Esta informaci´on est´a almacenada en la variable est.tax.savings.
# Encuentra un intervalo de confianza de 90% para la mediana.


saving <- c(cabinet$est.tax.savings)

# explorar datos
plot (saving)

#una prueba T para encontrar le intervalo de confianza
t.test(saving, conf.level = 0.9, alt = "less") 

#ok, aunque tmb estas tmb eran soluciones:
require(UsingR)
attach(cabinet)
t.test(est.tax.savings,conf.level=0.90) 
qqnorm(est.tax.savings) # Evidentemente no es una normal! Pero puedes usar la t.test porque n es chica (n=19). El problema es que estamos haciendolo para la mediana y no la media.
wilcox.test(est.tax.savings, conf.int=TRUE,conf.level=0.9) # Te da un intervalo más pequeño
n <- length(est.tax.savings) # Estamos buscando un intervalo de confianza para la mediana, por lo cual este tambien funciona.
j <- qbinom(0.05, n, 1/2)
res<-sort(cabinet$est.tax.savings)[c(j,n+1-j)]
res
detach(cabinet)

#Resultado

#	One Sample t-test

#	data:  saving 
# t = 2.2925, df = 18, p-value = 0.983
# alternative hypothesis: true mean is less than 0 
# 90 percent confidence interval:
#    -Inf 66622.24 
# sample estimates:
# mean of x 
#  42157.47 


dev.off() # otro def.off() ¡!¡!

##############

#4. El set de datos babies de UsingR tiene las edades de las madres en la variable age y la de los
# padres en dage. Haz una prueba de significancia de la hip´otesis nula de edades iguales contra
# una de alternativa de un solo lado donde los pap´as est´an m´as viejos. Reporta el valor p y tu
# conclusi´on sobre H0.


# Prueba de normalidad


shapiro.test(babies[,"dage"])

#	Shapiro-Wilk normality test

# data:  babies[, "dage"] 
# W = 0.7798, p-value < 2.2e-16

# Se rechaza la normalidad de los datos... :o !! 

boxplot(babies$age, babies$dage)
#solo para ver


# Se tienen que hacer pruebas no parametricas



media_dage <- mean(babies$dage)
# media_dage
#[1] 30.73706

## prueba <- t.test(babies$age, mu = media_dage, alt = "less")
# No se usaria porque no tenemos normalidad de los datos 

prueba <- wilcox.test(babies$age, mu = media_dage, alt = "less")

prueba
# Resultado
	
#	Wilcoxon signed rank test with continuity correction
#
# data:  babies$age 
# V = 154804, p-value < 2.2e-16
# alternative hypothesis: true location is less than 30.73706 

prueba$p.value
[1] 9.905945e-74

# Se rechaza la hipotesis nula

# Sip, pero tu prueba está mal. Era mas bien así (o con una wilcox ya que viste que no son normales.... pero no usas mu!!):
attach(babies)
t.test(dage,age,paired=TRUE,var.equal=FALSE, alternative="greater")$p.value
t.test(dage,age,var.equal=FALSE, alternative="greater")$p.value
detach(babies)




################

# 5. El set de datos pi2000 de UsingR tiene los primeros 2000 d´ıgitos de pi. Haz una prueba de
# hip´otesis para ver si los d´ıgitos aparecen con la misma probabilidad. Usa la prueba de la ji^2.

y <- table(pi2000[pi2000 < 98])

p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1) #haha, usa rep :P

chisq.test(y, p = p)

# p-value = 0.8817 
## no es significativo

