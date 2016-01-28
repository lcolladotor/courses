##Ejercicio 1##

n<-1000
p<-0.5
q<-0.5
mu<-n*p
sigma<-sqrt(p*q*n)
xnorm<-(550-mu)/sigma
1-pnorm(xnorm)

# :D

##Ejercicio 2##

n<-1000
xexp<-c()

par(mfrow=c(1,3)) -> xx

for(i in 1:5) xexp[i]<-mean(rexp(n))
hist (xexp, main="n=5")
for(i in 1:50) xexp[i]<-mean(rexp(n))
hist (xexp, main="n=50")
for(i in 1:500) xexp[i]<-mean(rexp(n))
hist (xexp, main="n=500")

par(mfrow=c(1,1)) -> xx

##para 500 ya se ve como una bonita normal##

# Hehe sip, pero 500 es un buen. Con 25 ya funciona:
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)


##Ejercicio 3##
library(UsingR)
attach(cabinet)

##con el método de la binomial##
summary(est.tax.savings)
n<-length(est.tax.savings)
j<-qbinom(0.1,n,1/2) # Es 0.05 y no 0.1
sort(est.tax.savings)[c(j,n+1-j)]


##con la prueba de signo ordenada de Wilcoxon##
wilcox.test(est.tax.savings, conf.int=TRUE, conf.level=0.9)

# Bien :)


##Ejercicio 4##

library(UsingR)
attach(babies)

boxplot(list(mamás=age, papás=dage), main="Diferencia de edades de papás y mamás", ylab="Edades en años")
mm<-t.test(dage,age,var.equal=FALSE, alternative="greater") # Bien por el boxplot :D Eres la única que lo hizo hasta donde voy.
mm
mm$p.value




##Ejercicio 5##
library(UsingR)

y<-table(pi2000)
p<-c(0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1)
chisq.test(y, p=p)

# Conclusión?