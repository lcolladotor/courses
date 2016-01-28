# Ejercicio 1

library(UsingR)

p <- pnorm(q = 550, mean= 500, sd=15.811, lower.tail= FALSE) + dnorm(550, mean=500, sd=15.811) # No entiendo porque le sumas dnorm


# Ejercicio 2 Esta comentada la parte de hacer la grafica como pdf

#pdf(file="jurquiza.pdf")

m <- 700

res.100 <- c()

res.200 <- c()

res.700 <- c()

f <- function(n) mean(rexp(n))

for (i in 1:m) res.100[i] <- f(100)

for (i in 1:m) res.200[i] <- f(200)

for (i in 1:m) res.700[i] <- f(700)

plot(density(res.700), xlim = range(res.100),type = "l", main = "", xlab = "Mean", col="red",bw=0.5)

lines(density(res.200), col="blue", bw=0.5) # No me acepta el arg bw

lines(density(res.100),col="green", bw=0.5)

legend(1, 6, c("700", "200", "100"), col=c("red", "blue", "green"), lty=1)

#dev.off()

# Cual es la n? 25?
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)


# Ejercicio 3  


x <- c(cabinet$est.tax.savings)

t.test(x, conf.level = 0.9, alt = "less")


# Hm...
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

# Ejercicio 4

pa <- mean(babies$dage)

xx <- t.test(babies$age, mu = pa, alt = "less") # No está bien tu prueba.

xx$p.value

# Solución:
attach(babies)
t.test(dage,age,paired=TRUE,var.equal=FALSE, alternative="greater")$p.value
t.test(dage,age,var.equal=FALSE, alternative="greater")$p.value
detach(babies)

# Rechazamos H0 en favor de HA porque nuestro p-value es significativo.  Esto es, al parecer si son menores.

#ok

# Ejercicio 5

vec <- c(pi2000)

freq <- rep(0, 10)

for (i in 1:length(vec)) {

if (vec[i] == 0) {

freq[1] <- freq[1] + 1

}

if (vec[i] == 1) {

frecuencia[2] <- frecuencia[2] + 1

}

if (vec[i] == 2) {

freq[3] <- freq[3] + 1

}

if (vec[i] == 3) {

freq[4] <- freq[4] + 1

}

if (vec[i] == 4) {

freq[5] <- freq[5] + 1

}


if (vec[i] == 5) {

freq[6] <- freq[6] + 1

}

if (vec[i] == 6) {

freq[7] <- freq[7] + 1

}

if (vec[i] == 7) {

freq[8] <- freq[8] + 1

}

if (vec[i] == 8) {

freq[9] <- freq[9] + 1

}

if (vec[i] == 9) {

freq[10] <- freq[10] + 1

}

}

freq[1] = freq[1]/2000

freq[2] = freq[2]/2000

freq[3] = freq[3]/2000

freq[4] = freq[4]/2000

freq[5] = freq[5]/2000

freq[6] = freq[6]/2000

freq[7] = freq[7]/2000

freq[8] = freq[8]/2000

freq[9] = freq[9]/2000

freq[10] = freq[10]/2000

xx <- chisq.test(freq, p = rep(0.1,10))

xx$p.value

# Nuestro p-value es de uno, asi es que si podemos decir que nuestras frecuencias son iguales.



# WOAH! Super complicado. Además, p no es de 1.
#Solución:
chisq.test(table(pi2000),p=rep(0.1,10))
