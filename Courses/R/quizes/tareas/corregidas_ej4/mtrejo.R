
library(UsingR)

# Ejercicio 1

media <- 0.5*1000
desvest <- sqrt(0.5*0.5*1000)
pnorm(549,mean=media,sd=desvest, lower.tail = FALSE)

# Bien :D

# Ejercicio 2

m<-500
res.100 <- c()
res.200 <- c()
res.500 <- c()
f <- function(n) mean(rexp(n))
for (i in 1:m) res.100[i] <- f(100)
for (i in 1:m) res.200[i] <- f(200)
for (i in 1:m) res.500[i] <- f(500)
plot(density(res.500), xlim = range(res.100),type = "l", main = "", xlab = "Mean", col="green")
lines(density(res.200), col="blue")
lines(density(res.100),col="purple")
legend(1, 6, c("500", "200", "100"), col=c("purple", "blue", "green"), lty=1)
dev.off()  # Para que usas dev.off() aquí? Tu gráfica se ve muy parecida a la de alguien más....
# Ehem, a la de Robert. Tienes los mismos problemas que el aquí...


# Ejercio 3

x <- c(cabinet$est.tax.savings)
t.test(x, conf.level = 0.9, alt = "less")
# Solución:
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


# Ejericio 4

media <- mean(babies$dage)
pruebaT <- t.test(babies$age, mu = rob, alt = "less") # Esta mal hecha tu prueba.
pruebaT$p.value
#Rechazamos H0

# Solución:
attach(babies)
t.test(dage,age,paired=TRUE,var.equal=FALSE, alternative="greater")$p.value
t.test(dage,age,var.equal=FALSE, alternative="greater")$p.value
detach(babies)

# Ejericio 5

y <- table(pi2000[pi2000 < 98])
p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1) # Usa rep!
chisq.test(y, p = p)
# pvalue = 0.8817 -> No es significativo
