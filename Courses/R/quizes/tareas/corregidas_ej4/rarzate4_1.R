{\rtf1\ansi\ansicpg1252\deff0\deflang2058{\fonttbl{\f0\froman\fprq2\fcharset0 Times New Roman;}{\f1\froman\fprq2\fcharset162{\*\fname Times New Roman;}Times New Roman TUR;}{\f2\fnil\fcharset0 Courier New;}{\f3\fswiss\fcharset0 Arial;}}
{\*\generator Msftedit 5.41.15.1507;}\viewkind4\uc1\pard\f0\fs24\par
##Rodrigo Arzate\par
#####Pregunta 1\par
#\par
# Asume que una poblaci\'b4on est\'b4a dividia en dos sobre alguna decisi\'b4on (p = 1/2). Toman una\par
#muestra aleatoria de tama\'98no 1000. Cual es la probabilidad de que la muestra aleatoria tendr\'b4a\par
#550 o m\'b4as votos a favor de la decisi\'b4on? Responde usando una aproximaci\'b4on normal.\par
#\par
n<-1000\par
p<-1/2\par
q<-(1-p)\par
media <- n*p\par
desviacion <- sqrt(n*p*q)\par
resultado<-pnorm(549,mean=mu,sd=desviacion, lower.tail = FALSE)\par
resultado\par
\par
# ok\par
\par
#\par
#Resultado 1 = [1] 0.0009707699\par
#\par
#\par
#####Pregunta 2\par
#\par
#Para qu\'b4e valor de n la distribuci\'b4on X se ve aproximadamente como una normal cuando cada\par
#Xi es de tipo exponencial (1)1. Corre varias simulaciones para diferentes ns hasta que decidas\par
#cuando empieza a verse como normal.\par
#\par
m <- 500\par
res.1 <- c()\par
res.10 <- c()\par
res.100 <- c()\par
res.500 <- c()\par
res.1000 <- c()\par
res.10000 <- c()\par
res.100000<-c()\par
f <- function(n) mean(rexp(n))\par
plot(0,0, type="n", ylim=c(0,25), xlim=c(0,3), ylab="f(x)", xlab="Densidad",main="Graficas de Distribuciones")\par
for(i in 1:m) res.1[i] <- f(1)\par
lines(density(res.1), lwd=2, col="red")\par
for(i in 1:m) res.10[i] <- f(10)\par
lines(density(res.10), lwd=2, col="green")\par
for(i in 1:m) res.100[i] <- f(100)\par
lines(density(res.100), lwd=2, col="blue")\par
for(i in 1:m) res.500[i] <- f(500)\par
lines(density(res.500), lwd=2, col="orange")\par
for(i in 1:m) res.1000[i] <- f(1000)\par
lines(density(res.1000), lwd=2, col="black")\par
for(i in 1:m) res.10000[i] <- f(10000)\par
lines(density(res.10000), lwd=2, col="yellow")\par
for(i in 1:m) res.100000[i] <- f(100000)\par
lines(density(res.100000), lwd=2, col="brown")\par
\par
# Para que usas lwd=2? Simplemente dejo de ver lineas en la grafica\par
\par
\par
#\par
#Resultado 2: Se puede observar como a partir del 100 y para el de 500 las distribuciones se comportan como normales. \par
#\par
\par
# En realidad con n=25 ya funciona.\par
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)\par
\par
#\par
#Usa el set de datos cabinet del paquete UsingR. Este contiene informaci\'b4on sobre la cantidad\par
#de dinero que se ahorrar\'b4on los miembros del comit\'b4e de Bush en el 2003 ccuando pasaron una\par
#nueva ley sobre impuestos. Esta informaci\'b4on est\'b4a almacenada en la variable est.tax.savings.\par
#Encuentra un intervalo de confianza de 90% para la mediana.\par
#\par
library(UsingR)\par
cabinet\par
n <- length(cabinet$est.tax.savings)\par
j <- qbinom(0.05, n, 1/2)\par
resultado3<-sort(cabinet$est.tax.savings)[c(j,n+1-j)]\par
resultado3\par
#\par
#Resultado 3=[1]   560 32444\par
#\par
#\par
\par
# Bien hecho! :) En realidad me acabo de dar cuenta de un error mio con tu codigo hehe.\par
\par
#\par
#\par
#El set de datos babies de UsingR tiene las edades de las madres en la variable age y la de los\par
#padres en dage. Haz una prueba de significancia de la hip\'b4otesis nula de edades iguales contra\par
#una de alternativa de un solo lado donde los pap\'b4as est\'b4an m\'b4as viejos. Reporta el valor p y tu\par
#conclusi\'b4on sobre H0.\par
#\par
library(UsingR)\par
mamas<-babies$age\par
papas<-babies$dage\par
plot(density(mamas),col="red",main="Distribuciones) #Esta mal escrita esta linea\par
lines(density(papas),col="blue")\par
#Los datos no tienen una distribuci\'f3n normal, pero como son sim\'e9tricos puedo usar una\par
#prueba Wilcoxon\par
resultado4<-wilcox.test(mamas,papas,alt="less")\par
resultado4\par
#\par
#Resultado 4= p-value < 2.2e-16 por lo tanto al ser menor que 0.05, podemos rechazar la hip\'f3tesis nula y se apoya la hip\'f3tesis alternativa de que los padres son  mas viejos\par
\par
# Bien!\par
\par
\par
#\par
#\par
#El set de datos pi2000 de UsingR tiene los primeros 2000 d\'b4\f1\'fd\f0 gitos de \'19. Haz una prueba de\par
#hip\'b4otesis para ver si los d\'b4\f1\'fd\f0 gitos aparecen con la misma probabilidad. Usa la prueba de la \'1f2.\par
#\par
library(UsingR)\par
pi2000\par
p<- c(1:10)\par
for (i in 1:10) p[i]=1/10\par
y <- table(pi2000)\par
resultado5<-chisq.test(y, p=p)\par
resultado5\par
#\par
#Chi-squared test for given probabilities\par
#data:  y\par
#Resultado 5=X-squared = 4.42, df = 9, p-value = 0.8817\par
#Al ser el p value mayor a 0.05 no se puede rechazar la hipotesis nula. \par
\par
# Excelente!\par
\par
\f2\par
\par
\f3\par
}
 