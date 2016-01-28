#
#prectica 4
#

library(UsingR)
media <- 0.5*1000
desvest <- sqrt(0.5*0.5*1000)
pnorm(549,mean=media,sd=desvest, lower.tail = FALSE)
#
# =0.0009707699 
#
m <- 500
#
res.6 <- c()
res.25 <- c()
res.100 <- c()
res.400 <- c()
res.1600 <- c()
#
f <- function(n) mean(rexp(n))
for(i in 1:m) res.6[i] <- f(6)
for(i in 1:m) res.25[i] <- f(25)
for(i in 1:m) res.100[i] <- f(100)
for(i in 1:m) res.400[i] <- f(400)
for(i in 1:m) res.1600[i] <- f(1600)
#
plot(density(res.1600), xlim = range(res.6), type = "l", main = "Xi Distrib.", xlab = "Distribuciones Par", col = "red")
lines(density(res.400), col = "green")
lines(density(res.100), col = "blue")
lines(density(res.25), col = "light blue")
lines(density(res.6), col = "yellow")
#
legend(2, 6, c("1600", "400", "100", "25", "6"), col = c("green", "light blue", "blue", "yellow", "red"), lty = 1)

# No leo tu legenda

#
# n = 100 aprox.

# Funciona desde 25.
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

#
x <- c(cabinet$est.tax.savings)
n <- length(x)
j <- qbinom(0.05, n, 1/2)
sort(x)[c(j,n+1-j)] # Ok, pero usa wilcox.test
#
x <- c(bebes$edad) # Es babies, no bebes :P
y <- c(bebes$dedad)
#
plot(density(x))
lines(density(y), lty = 2)
t.test(x, y, alt = "less", var.equal = TRUE)
#
#
# 	>>>Two Sample t-test<<<
#
#
# datos:  x,y 
# t = -11.0671, df = 2470, p-value < 2.2e-16
# H1:La diferencia entre medias es <0
# Intervalos de confianza (95%)
#       -Inf -2.865266 
#
# Estimados:
#
# Medias (x,y)= 27.37136,30.73706 
# 
# Pvalue= 2.2e-16  Es significativo, por lo que rechazamos H0:Edades Iguales # El p value es menor a 2.2e-16, no es igual a ese valor
#
y <- table(pi2000[pi2000 < 98])
y
p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1) # Usa rep
chisq.test(y, p = p)
# Xi square de las probabilidades proporcionadas
#
# datos:  y 
# X-squared = 4.42, df = 9, p-value = 0.8817 no es significativo
