#Parte1

pnorm(549, mean = 500, sd = 15.81139, lower.tail = FALSE, log.p = FALSE) #ok

#Parte2: desde n=100 empieza a tomar forma

m <- 500
res.10 <- c()
res.25 <- c()
res.50 <- c()
res.100 <- c()
res.250 <- c()
res.500 <- c()
res.1000 <- c()
f <- function(n) mean(rexp(n))
for(i in 1:m) res.10[i] <- f(10)
for(i in 1:m) res.25[i] <- f(25)
for(i in 1:m) res.50[i] <- f(50)
for(i in 1:m) res.100[i] <- f(100)
for(i in 1:m) res.250[i] <- f(250)
for(i in 1:m) res.500[i] <- f(500)
for(i in 1:m) res.1000[i] <- f(1000)
plot(density(res.1000),xlim=range(res.25),  type="l", main="Ejercicio2", xlab = "Distribuciones muestrales", col="blue")
lines(density (res.500),col="cyan")
lines(density (res.250),col="green")
lines(density (res.100),col="yellow")
lines(density (res.50),col="red")
lines(density (res.25),col="magenta")
lines(density (res.10),col="blue")
lines(density (res.10),col="gray")
lines(density (res.10),col="pink")

# legenda? n? 25?
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

#Parte3: la mediana se encuentra entre 560 y 32444

mediana <- qbinom(0.05,length(cabinet$est.tax.savings),0.5)
sort(cabinet$est.tax.savings)[c(mediana,length(cabinet$est.tax.savings)+1-mediana)] #ok

#Parte4: p.value=4.48542e-28, los padres tienden a ser mayores

xy <- t.test(babies$dage,babies$age,mu=0,alt="greater")
xy$p.value #bien :D

#Parte5: no se rechaza la hipótesis nula

chisq.test(table(pi2000)) #excelente :D