##Ejercicio1.
pnorm(549, mean = 500, sd = 15.81139, lower.tail = FALSE, log.p = FALSE)
# Bien, aunque también lo puedes hacer con:
muestra <- NULL
for (i in 1:10000) muestra[i] <- sum(sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5)))
1-pnorm(550, mean(muestra), sd(muestra)) # Nota que mean(muestra) =~ 500 y sd(muestra) =~ sqrt(250)

##Ejercicio2, con n 150 la gr‡fica 
#de las equis barra se parece mas a una normal 
m <- 500
res.25 <- c(); 
res.100 <- c();
res.200 <- c();
res.500 <- c();
res.1000 <- c();
res.150<-c();
f <- function(n) mean(rexp(n))
for(i in 1:m) res.25[i] <- f(25)
for(i in 1:m) res.100[i] <- f(100)
for(i in 1:m) res.200[i] <- f(200)
for(i in 1:m) res.500[i] <- f(500)
for(i in 1:m) res.1000[i] <- f(1000)
for (i in 1:m) res.150[i]<-f(150)
plot(density(res.1000),xlim=range(res.25),  type="l", main="", xlab = "Distribuciones muestrales para la media con n=25, 100, 150, 200, 500, 1000", col="red")
lines(density (res.500),col="black")
lines(density (res.200), col="orange")
lines(density (res.200), col="pink")
lines(density(res.100), col="blue")
lines(density(res.25), col="forest green")
legend(1.1, 10, c("1000","500","200", "150", "100", "25"), col=c("red","black","orange", "pink", "blue", "forest green"), lty=1)

# No se lee tu super título
# Entonces, ¿cual es la n? En realidad con 25 ya funciona.

##Ejercicio3
library(UsingR)
cabinet $est.tax.savings
x<-c(cabinet $est.tax.savings)
n<-lengt(x)  # es length!
j<-qbinom(0.05,n,1/2)
sort(x)[c(j,n+1-j)] # Woah! Usaste la forma complicada de encontrar un intervalo de confianza
# El resultado es un poco diferente pues obtengo [1]   560 32444 con el tuyo vs los siguientes:
require(UsingR)
attach(cabinet)
t.test(est.tax.savings,conf.level=0.90) 
qqnorm(est.tax.savings) # Evidentemente no es una normal! Pero puedes usar la t.test porque n es chica (n=19)
wilcox.test(est.tax.savings, conf.int=TRUE,conf.level=0.9) # Te da un intervalo más pequeño
detach(cabinet)

##Ejercicio4: Rechazamos la Ho por p value pequenio
library(UsingR)
x<-c(babies $age)
y<-c(babies $dage)
xy<-t.test(y,x,mu=0,alt="greater") # no necesitas el mu=0
xy
xy$p.value # bien :)

##Ejercicio5, no podemos rechazar dado el p value
library(UsingR)
pi2000
y=table(pi2000)
Fy<-chisq.test(y)
Fy$p.value # Bien! :)