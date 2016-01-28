#Ejercicio 4

#1.-
n <- 1000
p <- 0.5		#la probabilidad
q <- (1-p)     
m <- (n*p) 			#la media por distribución binomial
s <- sqrt(n*p*q)	#la desviación estandar por una distribución binomial
pnorm(q=549, mean=m, sd=s, lower.tail=FALSE)    #ya que queremos que sea la probabilidad mayor a 550 ponemos que q=549 y la lower.tail es False para que nos de P[X>x]
#vemos que la probabilidad que nos da es muy baja pero no es inesperado ya que 550 se encuentra mas alla de dos desviaciones estandar de la media

# Bien :)

#2.- 
m <- 100
res.10 <- c(); res.50 <- c(); res.100 <- c(); res.150 <- c(); res.200 <- c(); res.250 <- c();
f <- function(n) mean(rexp(n))
for(i in 1:m) res.10[i] <- f(10)
for(i in 1:m) res.50[i] <- f(50)
for(i in 1:m) res.100[i] <- f(100)
for(i in 1:m) res.150[i] <- f(150)
for(i in 1:m) res.200[i] <- f(200)
for(i in 1:m) res.250[i] <- f(250)
plot(density(res.250), type="l", main="", xlab = "Distribucion para las medias de una exp con diferentes ns", col="red")
lines(density(res.10), col="blue")
lines(density(res.50), col="green")
lines(density(res.100), col="yellow")
lines(density(res.150), col="orange")
lines(density(res.200), col="purple")
legend(1.15, 6, c("250", "10", "50", "100", "150", "200"), col=c("red", "blue", "green", "yellow", "orange", "purple"), lty=1) # Solo veo las líneas en tu legenda y no los nombres.
#ya que son variable aleatorias cadavez que se corre cambia un poco la distribucion, pero se puede ver que las que normalmente
#se acercan a una distribución normal son con n=100 o n=150
#la legend fue ajustada para que saliera en la esquina y no estorbara en la grafica, pero a veces sale muy afuera #hey, ya veo hehe

# En fin, con n=25 tmb funciona:
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

#3.-
library(UsingR)
x <- cabinet$est.tax.savings
t.test(x, mu=median(x), conf.level=0.9)
#use t.test por que para los otros tests que habia son para muestras de exito y fracaso y aqui no aplica
#pense que tambien podria utilizar el sort, pero no supe que probabilidad utilizar 

# Está bien, aunque aquí te muestro las diferentes soluciones:

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

#4.-
library(UsingR)
age <- babies$age # Puedes evitar esto usando los attach y detach
dage <- babies$dage
xx <- t.test(x=dage, y=age, mu=0, alt="greater")
xx$p.value
#vemos con el resultado de t.test que la media de las edades de los padres es significativamente mayor a la media de la edad de las madres
#por lo que podemos descartar que las dos medias son iguales con un pvalue de 4.4 e-28 que es muy bueno
xx2 <- t.test(x=dage, y=age, alt="greater", mu=0, paired=TRUE)
xx2$p.value
#aun haciendolo con una prueba t pareada vemos un valor de p significativo

# Osea, que rechazas ^^.

#5.- 
library(UsingR)
x <- pi2000
datos <- table(x, deparse.level=2)
p <- c(rep(0.1, 10))
xx <- chisq.test(datos, p=p)
xx$p.value
#no se puede descartar que los digitos de p no se presenten con la misma probabilidad con un p value de 0.88


# Bien