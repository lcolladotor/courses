library(UsingR)
mu <- 0.5*1000
sigma <- sqrt(0.5*0.5*1000)
pnorm(549,mean=mu,sd=sigma, lower.tail = FALSE)
# [1] 0.0009707699 

# Bien, aunque puedes hacerlo así:
muestra <- NULL
for (i in 1:10000) muestra[i] <- sum(sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5)))
1-pnorm(550, mean(muestra), sd(muestra)) # Nota que mean(muestra) =~ 500 y sd(muestra) =~ sqrt(250)


m <- 500
res.6 <- c()
res.25 <- c()
res.100 <- c()
res.400 <- c()
res.1600 <- c()
f <- function(n) mean(rexp(n))
for(i in 1:m) res.6[i] <- f(6)
for(i in 1:m) res.25[i] <- f(25)
for(i in 1:m) res.100[i] <- f(100)
for(i in 1:m) res.400[i] <- f(400)
for(i in 1:m) res.1600[i] <- f(1600)
plot(density(res.1600), xlim = range(res.6), type = "l", main = "Distribucion de Xi", xlab = "Simulacion de distribuciones par diferentes ns", col = "purple")
lines(density(res.400), col = "blue")
lines(density(res.100), col = "green")
lines(density(res.25), col = "yellow")
lines(density(res.6), col = "red")
legend(2, 6, c("1600", "400", "100", "25", "6"), col = c("purple", "blue", "green", "yellow", "red"), lty = 1) # mejor usa "topright" para la ubicación de la leyenda

# n = 100 aprox.

# Sip, n =100 en tu gráfica si se ve normal, aunque en realidad, si haces histogramas con n=25 es suficiente.



x <- c(cabinet$est.tax.savings)
n <- length(x)
j <- qbinom(0.05, n, 1/2)
sort(x)[c(j,n+1-j)]
# [1]   560 32444

# Lo hiciste de una forma complicada. El intervalo se acerca, pero no es el mismo que obtenemos con las pruebas t o wilcox.

# Solución:
require(UsingR)
attach(cabinet)
t.test(est.tax.savings,conf.level=0.90) 
qqnorm(est.tax.savings) # Evidentemente no es una normal! Pero puedes usar la t.test porque n es chica (n=19)
wilcox.test(est.tax.savings, conf.int=TRUE,conf.level=0.9) # Te da un intervalo más pequeño
detach(cabinet)


x <- c(babies$age)
y <- c(babies$dage)
plot(density(x))
lines(density(y), lty = 2)
t.test(x, y, alt = "less", var.equal = TRUE)  # Hm.... no estoy seguro de que tengan mismas varianzas, pero bueno, ok.
# Podrias usar paired=TRUE

# 	Welch Two Sample t-test

# data:  x and y 
# t = -11.0671, df = 2470, p-value < 2.2e-16
# alternative hypothesis: true difference in means is less than 0 
# 95 percent confidence interval:
#       -Inf -2.865266 
# sample estimates:
# mean of x mean of y 
# 27.37136  30.73706 
# Dado que el valor de p es pequeño (2.2e-16), lo que lo hace significativo, # Es menor a 2.2e-16 y no igual a esto
# rechazamos la hipótesis nula, lo que nos dice que hay evidencia suficiente de
# que AGE < DAGE

# ok :)


y <- table(pi2000[pi2000 < 98])
y
p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1) # haha, mejor usa rep
chisq.test(y, p = p)
# Chi-squared test for given probabilities

# data:  y 
# X-squared = 4.42, df = 9, p-value = 0.8817 (no es significativo)


