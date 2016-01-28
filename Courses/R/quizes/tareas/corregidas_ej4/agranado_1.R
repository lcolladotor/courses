1 - pnorm(549.5,mean=500,sd=sqrt(250)) #bien

#####################################################
var<-c()
size<-500

for(i in 1:size) var[i]<-mean(rexp(50,rate=1))
plot(density(var),ylim=c(0,10),xlim=range(var))

for(i in 1:size) var[i]<-mean(rexp(100,rate=1))
lines(density(var))

for(i in 1:size) var[i]<-mean(rexp(300,rate=1))

lines(density(var))

# legenda? colores?

#desde 100 ya se ve chido
# 25 funciona tmb
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

###################################################

require(UsingR)

attach(cabinet)
t.test(est.tax.savings,conf.level=0.95) # era de 90%

#95 percent confidence interval:
# 3523.285 80791.662 

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

###################################################


attach(babies)

t.test(age,dage,mu=0,paired=TRUE,var.equal=FALSE)
#igual queda sacando directamente la distribucion de las diferencias
t.test(age-dage,alt="less")

#t = -17.3922, df = 1235, p-value < 2.2e-16
#alternative hypothesis: true mean is less than 0 
#95 percent confidence interval:
#      -Inf -3.047148 
#los papas son mas viejos,

# bien

  ***

pero como la prueba de normalidad no rifo : 

# mejor :D

 wilcox.test(age,dage,paired=TRUE)

#        Wilcoxon signed rank test with continuity correction

#data:  age and dage 
#V = 42217.5, p-value < 2.2e-16
#alternative hypothesis: true location shift is not equal to 0 

#otra vez los padres son mas viejos, aunque esos p value no me convencen.
> 




####################################################


tab<-table(pi2000)
tab
#pi2000
#  0   1   2   3   4   5   6   7   8   9 
#181 213 207 189 195 205 200 197 202 211 

 length(tab)          
#[1] 10
 chisq.test(tab,p=rep(1/length(tab),length(tab)))  # muy bien :D

#        Chi-squared test for given probabilities

#data:  tab 
#X-squared = 4.42, df = 9, p-value = 0.8817

no se rechaza, Ho:los digitos aparecen con igual frecuencia. 








