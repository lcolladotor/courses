#Practica No3
#Isaac Rodríguez


#Ejercicio 1
stdesv <- sqrt(0.5*0.5*1000)
media <- (0.5*1000)
ans <- 1-(pnorm(549, mean=media, sd=stdesv, lower.tail=TRUE)) #bien :D

#Ejercicio 2
m<-1000
res1 <- c()
res2 <- c()
res3 <- c()
res4 <- c()
colors <- c("black", "green", "blue", "red")
f <- function(n) mean(rexp(n))
for (i in 1:m) res1[i] <- f(10)
for (i in 1:m) res2[i] <- f(200)
for (i in 1:m) res3[i] <- f(500)
for (i in 1:m) res4[i] <- f(1000)
plot(density(res4), xlim = range(res.100),type = "l", main = "Hasta cando normal?", xlab = "Media", col=colors[4])
lines(density(res1), col=colors[1])
lines(density(res2), col=colors[2])
lines(density(res3), col=colors[3])
legend(1.10, 9, c("10", "200", "500", "1000"), col=colors, lty=1) #orale con el brinco de 10 a 200

# Cual n? 25?
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)


#Ejercicio 3
xconf <- c(cabinet$est.tax.savings)
t.test(xconf, conf.level = 0.9, alt = "less") #ok

#Ejercicio 4
media <- mean(babies$dage)
x <- t.test(babies$age, mu = media, alt = "less") # Esta mal tu prueba!
x$p.value
#Obtenemos un P value de 7.671015e-67 por lo que rechazamos nuestra hipótesis nula (H0)

#Solución:
attach(babies)
t.test(dage,age,paired=TRUE,var.equal=FALSE, alternative="greater")$p.value
t.test(dage,age,var.equal=FALSE, alternative="greater")$p.value
detach(babies)

#Ejercicio 5
y <- table(pi2000[pi2000 < 98])
p = c(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1) #usa rep :P
#suponemos igual probabilidad de los numeros
chisq.test(y, p = p)
#Obtenemos un P value de  0.8817, por lo tanto no rechazamos la hipótesis nula

# bien :)

