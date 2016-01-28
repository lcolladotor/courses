1)
pnorm(549.5,500,sqrt(250)) #Mal. Es 1 - esto.
2)
xbar<-function(n) mean(rexp(n))
xbards<-c()
for(i in 1:1000) xbards[i]<-xbar(200)
plot(density(xbards), xlim=range(xbards))
n25<-c();
for(i in 1:1000) xbards[i]<-xbar(25);
lines(density(xbards), col="pink");
n50<-c();
for(i in 1:1000) xbards[i]<-xbar(50);
lines(density(xbards), col="red")
n100<-c()
for(i in 1:1000) xbards[i]<-xbar(100)
lines(density(xbards), col="blue")
n150<-c()
for(i in 1:1000) xbards[i]<-xbar(150)
lines(density(xbards), col="green")
####con n=100 se ve una normal decente.

#Ok, aunque con 25 tmb.
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

3)
library(UsingR)
x<-cabinet$est.tax.savings
n<-length(est.tax.savings)
m<-qbinom(0.05, n, 1/2)
sort(x)[c(m, n+1-m)]
#con signed rank statistic del log:
wilcox.test(log(x), conf.int=TRUE, conf.level=.9) # no tienes que hacer log y luego exp aquí
exp(c(7.240808, 9.736620))
## 7.240808, 9.736620 son los valores de wilcox.test

4)
attach(babies)
shapiro.test(dage)
shapiro.test(age)
#Evidencia de que los datos no están distribuidos normalmente, por lo tanto:
wilcox.test(dage, age, PAIRED=TRUE, alt="greater")
#Y los padres son más viejos con un p-value de 2.2e-16

# ok

5)
 x<-rep(.1,10)
 tabla<-table(pi2000)
chisq.test(tabla,p= x)
#no rechazamos que al menos i números tengan la probabilidad esperada

# bien

