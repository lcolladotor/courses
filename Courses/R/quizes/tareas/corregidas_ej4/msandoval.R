Ejercicio 4
1)pnorm(549.5,500,sqrt(250)) # Mal hecho. No es la buena cola.

2)media<-function(n)
mean(rexp(n))
var<-c()

for(i in 1:1000)
var[i]<-media(200)
plot(density(var), xlim=range(var))
n25<-c();

for(i in 1:1000)
var[i]<-media(25);
lines(density(var), col="pink");
n50<-c();

for(i in 1:1000)
var[i]<-media(50);
lines(density(var), col="red")
n100<-c()

for(i in 1:1000)
var[i]<-media(100)
lines(density(vars), col="blue") # Cual es el objeto vars???
n150<-c()

for(i in 1:1000)
var[i]<-media(150)
lines(density(var), col="green")


##con n=100 se observa una distribución normal bastante decente.
# Ok, pero con 25 tmb funciona.
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)


3)
library(UsingR)
x<-cabinet$est.tax.savings
n<-length(est.tax.savings)
m<-qbinom(0.05, n, 1/2)
sort(x)[c(m, n+1-m)]

#con signed rank statistic del log:

wilcox.test(log(x), conf.int=TRUE, conf.level=.9) # No tenias que usar log y luego exp
exp(c(7.240808, 9.736620))

## 7.240808, 9.736620 son los valores de wilcox.test


4)
attach(babies)
shapiro.test(dage)
shapiro.test(age)

#Esto nos muestra  que los datos no están distribuidos normalmente por lo
tanto:

wilcox.test(dage, age, PAIRED=TRUE, alt="greater")

#Obtenemos que los padres son mas viejos con un p-value de 2.2e-16 # Es menor a, no igual a
# bien :)



5) x<-rep(.1,10)
tabla<-table(pi2000)
chisq.test(tabla,p= x)

#no rechazamos # No rechazas que? Supongo que no rechazas H0
