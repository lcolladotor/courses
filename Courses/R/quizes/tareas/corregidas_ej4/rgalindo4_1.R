#Roberto Galindo Ramirez (con acento en la i de Ramirez)
#Cuarto ejercicio

library(UsingR)

# 1

media <- 0.5*1000
desvest <- sqrt(0.5*0.5*1000)
pnorm(549,mean=media,sd=desvest, lower.tail = FALSE)


# 2

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
dev.off() # para que usas dev.off() aqui????

# Porque empezaste tan alto!? Cual es tu n?


# 3

x <- c(cabinet$est.tax.savings)
t.test(x, conf.level = 0.9, alt = "less")

# Solucion:
require(UsingR)
attach(cabinet)
t.test(est.tax.savings,conf.level=0.90) 
qqnorm(est.tax.savings) # Evidentemente no es una normal! Pero puedes usar la t.test porque n es chica (n=19)
wilcox.test(est.tax.savings, conf.int=TRUE,conf.level=0.9) # Te da un intervalo más pequeño
detach(cabinet)

# 4

rob <- mean(babies$dage)
wawa <- t.test(babies$age, mu = rob, alt = "less") # Esto no es lo que pide el ejercicio. Esta mal hecha tu prueba t.
wawa$p.value
#Rechazamos H0

#Solucion:
t.test(dage,age,paired=TRUE,var.equal=FALSE, alternative="greater")$p.value
t.test(dage,age,var.equal=FALSE, alternative="greater")$p.value
detach(babies)

# 5

y <- table(pi2000[pi2000 < 98])
p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1)
chisq.test(y, p = p)
#p-value = 0.8817 ->no es significativo

# Tons? No rechazamos H0.

