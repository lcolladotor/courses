"1"
"con normal"
1-pnorm(550, 1000*0.5, sqrt(1000*0.25)) #bien
"con la binomial"
1-pbinom(550, 1000, 0.5)

"2"
m<-1000
colores<-c("yellow", "red", "green", "blue", "black")
res.25<-c()
res.150<-c()
res.500<-c()
res.700<-c()
res.1000<-c()
f<-function(n) mean(rexp(n))
for(i in 1:m) res.25[i]<-f(25)
for(i in 1:m) res.150[i]<-f(150)
for(i in 1:m) res.500[i]<-f(500)
for(i in 1:m) res.700[i]<-f(700)
for(i in 1:m) res.1000[i]<-f(1000)
plot(density(res.1000), xlim=range(res.25), type="l", main="", xlab="Medias")
lines(density(res.150), col="red")
lines(density(res.25), col="yellow")
lines(density(res.500), col="green")
lines(density(res.700), col="blue")
legend(1.4, 10, c("n=25", "n=150", "n=500", "n=700", "n=1000"), cex=1, pch=19, col= colores)
"Parece ser que a 150 ya comienza acomportarse como una normal"

# En realidad con 25 ya funciona.
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

"3 no me convence"
library(UsingR)

m<-qbinom(0.05, length(cabinet$est.tax.savings), 1/2)
sort(cabinet$est.tax.savings)[c(m, length(cabinet$est.tax.savings)+1-m)] #ok

# Soluciones:
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

"4"

bla<-t.test(babies$dage, babies$age, mu=0, alt="greater") #bien, aunque no necesitas a mu=0
bla$p.value
"El p.value es muy pequeno, por lo que podemos rechazar la hipotesis de igualdad de edades en favor de que la media de las edades de los padres es mayor"

"5"
tabla<-table(pi2000)
chisq.test(tabla)
"Dado que el p.value no es significativo (0.8817), no podemos rechazar la hipotesis de que los digitos aparecen con la misma probabilidad"

# bien


