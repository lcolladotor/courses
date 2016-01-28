# Ejercicio 1

library(UsingR)
p <- pnorm(q = 550, mean= 500, sd=15.8114, lower.tail= FALSE, log.p = FALSE) + dnorm(550, mean=500, sd=15.8114, log = FALSE)

# Ejercicio 2 

#pdf(file="graficanormal.pdf")

m <- 500

res.100 <- c()

res.200 <- c()

res.500 <- c()

f <- function(n) mean(rexp(n))

for (i in 1:m) res.100[i] <- f(100)

for (i in 1:m) res.200[i] <- f(200)

for (i in 1:m) res.500[i] <- f(500)

plot(density(res.500), xlim = range(res.100),type = "l", main = "", xlab = "Mean", col="green")

lines(density(res.200), col="blue")

lines(density(res.100),col="red")

legend(1, 6, c("500", "200", "100"), col=c("red", "blue", "green"), lty=1) #haha, se encima tu leyenda :P

# Porque empezaste con n =100? Cual es la n? En fin, con 25 funciona.
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

#dev.off()


# Ejercicio 3  

library(UsingR)

x <- c(cabinet$est.tax.savings)

t.test(x, conf.level = 0.9, alt = "less") # porque usas alt?

# Ejercicio 4

pa <- mean(babies$dage)
xx <- t.test(babies$age, mu = pa, alt = "less") # Esta mal tu prueba.
xx$p.value

# Solución:
attach(babies)
t.test(dage,age,paired=TRUE,var.equal=FALSE, alternative="greater")$p.value
t.test(dage,age,var.equal=FALSE, alternative="greater")$p.value
detach(babies)


# Rechazamos H0 porque nuestro pvalue es significativo.  podriamos decir que al parecer si son menores.

# ok


# Ejercicio 5

library(UsingR)

vector <- c(pi2000)

frecuencia <- c(0,0,0,0,0,0,0,0,0,0)

for (i in 1:length(vector)) {

if (vector[i] == 0) {

frecuencia[1] <- frecuencia[1] + 1

}

if (vector[i] == 1) {

frecuencia[2] <- frecuencia[2] + 1

}

if (vector[i] == 2) {

frecuencia[3] <- frecuencia[3] + 1

}

if (vector[i] == 3) {

frecuencia[4] <- frecuencia[4] + 1

}

if (vector[i] == 4) {

frecuencia[5] <- frecuencia[5] + 1

}


if (vector[i] == 5) {

frecuencia[6] <- frecuencia[6] + 1

}

if (vector[i] == 6) {

frecuencia[7] <- frecuencia[7] + 1

}

if (vector[i] == 7) {

frecuencia[8] <- frecuencia[8] + 1

}

if (vector[i] == 8) {

frecuencia[9] <- frecuencia[9] + 1

}

if (vector[i] == 9) {

frecuencia[10] <- frecuencia[10] + 1

}

}

frecuencia[1] = frecuencia[1]/2000

frecuencia[2] = frecuencia[2]/2000

frecuencia[3] = frecuencia[3]/2000

frecuencia[4] = frecuencia[4]/2000

frecuencia[5] = frecuencia[5]/2000

frecuencia[6] = frecuencia[6]/2000

frecuencia[7] = frecuencia[7]/2000

frecuencia[8] = frecuencia[8]/2000

frecuencia[9] = frecuencia[9]/2000

frecuencia[10] = frecuencia[10]/2000

xx <- chisq.test(frecuencia, p = c(0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1))

xx$p.value

# El pvalue es de uno, es decir, si podemos decir que las frecuencias son iguales.

# Esta mal hecho esto. El valor p no es de 1. La solución es así:
chisq.test(table(pi2000),p=rep(0.1,10))


