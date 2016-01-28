#Pregunta 1
n <- 1000
p <- 1/2
X <- 549
#podemos sacar la probabilidad exacta usando la binomial
binomial <- pbinom(X, size=n, prob=p, lower.tail=FALSE) # Decía claramente que usaras normal y no binomial
binomial

#pero el problema pide aproximar con la normal, so...
mu <- n*p
sigma <- sqrt(n*p*(1-p))
aprox_normal <- pnorm(X, mean=mu, sd=sigma, lower.tail=FALSE)
#Resultado:
aprox_normal # Ok :)


#Pregunta 2
f <- function(n) mean(rexp(n))
m = 500
res.25 <-c()
res.50 <- c()
res.100 <- c()
res.300 <- c()
res.500 <- c()
res.800 <- c()
res.1000 <- c()
res.1400 <- c()

plot(0,0, type="n", ylim=c(0,18), xlim=c(0,2), ylab="f(x)", xlab="Density")

for(i in 1:m) res.25[i] = f(25)
lines(density(res.25), lwd=2, col="red")  # para que usas lwd=2??? Ni se ven unas líneas
for(i in 1:m) res.50[i] = f(50)
lines(density(res.50), lwd=2, col="blue")
for(i in 1:m) res.100[i] = f(100)
lines(density(res.100), lwd=2, col="violet")
for(i in 1:m) res.300[i] = f(300)
lines(density(res.300), lwd=2, col="yellow")
for(i in 1:m) res.500[i] = f(500)
lines(density(res.500), lwd=2, col="green")
for(i in 1:m) res.800[i] = f(800)
lines(density(res.800), lwd=2, col="brown")
for(i in 1:m) res.1000[i] = f(1000)
lines(density(res.1000), lwd=2, col="orange")
for(i in 1:m) res.1400[i] = f(1400)
lines(density(res.1400), lwd=2, col="dark violet")

# Como yo aprecio la gráfica, empieza a comportarse como normal después de los 300
# En realidad es desde 25
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

#Pregunta 3
library(UsingR)

x <- c(cabinet$est.tax.savings)
n <- length(x)
j <- qbinom(0.05, n, 1/2)
#El intervalo es:
sort(x)[c(j,n+1-j)]

# ok

#Pregunta 4
mom <- babies$age
dad <- babies$dage

plot(density(mom), col="dark violet")
lines(density(dad), col="blue")
# Vemos que están un poco sesgadas, por lo que no usamos un t-test
#Sin embargo, se comportan parecido, así que usamos el Wilcoxon rank-sum test 
wilcox.test(mom,dad, alt="less")
#El p-value es de 2.2e-16, como es muy pequeño rechazamos la hipótesis nula # Menor a, no es lo mismo que igual a :P
#(centros iguales) en favor de la alternativa (padres más viejos)

# ok

#Pregunta 5
p <- c(1:10)
for (i in 1:10) p[i]=1/10 # Puedes simplemente usar rep
y <- table(pi2000)
chisq.test(y, p=p)
#EL p-value es de 0.8817 : no es significativo
