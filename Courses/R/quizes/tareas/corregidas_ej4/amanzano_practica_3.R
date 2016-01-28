#Parte 1
1-pnorm(549.9, mean=500, sd=sqrt(250)/sqrt(1000)) # No tenias porque dividir entre la raiz de 1000 :P

# Solución:
muestra <- NULL
for (i in 1:10000) muestra[i] <- sum(sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5)))
1-pnorm(550, mean(muestra), sd(muestra)) # Nota que mean(muestra) =~ 500 y sd(muestra) =~ sqrt(250)

#r dice que ceo pero pues nada mas es muy baja
#Parte 2
for(i in 1:1000) x[i]<-mean(rexp(50,rate=1))
plot(density(x), xlim=range(x), ylim=c(0,10))
for(i in 1:1000) x[i]<-mean(rexp(100,rate=1))
lines(density(x))
for(i in 1:1000) x[i]<-mean(rexp(500,rate=1))
lines(density(x))
for(i in 1:1000) x[i]<-mean(rexp(300,rate=1))
lines(density(x))
#en 300 se parece a la normal

# legenda? n? 25?
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

#Parte 3
require(UsingR)
attach(cabinet)
t.test(est.tax.savings,conf.level=0.90) #ok, aunque podrias usar wilcox.test porque estamos buscando medianas
#        One Sample t-test
#
#data:  est.tax.savings 
#t = 2.2925, df = 18, p-value = 0.03414
#alternative hypothesis: true mean is not equal to 0 
#90 percent confidence interval:
# 10269.50 74045.44 
#sample estimates:
#mean of x 
# 42157.47 

#Parte 4
> t.test(age, dage,paired=TRUE, alt="less")
#        Paired t-test
#
#data:  age and dage 
#t = -17.3922, df = 1235, p-value < 2.2e-16
#alternative hypothesis: true difference in means is less than 0 
#95 percent confidence interval:
#      -Inf -3.047148 
#sample estimates:
#mean of the differences 
#              -3.365696 
#Los padres son mas viejos

# bien

#Parte 5
chisq.test(x, p=rep(1/length(x), length(x))) # Donde definies al objeto x????
#        Chi-squared test for given probabilities
#
#data:  x 
#X-squared = 4.42, df = 9, p-value = 0.8817
# No se rechaza la hipotesis, todas aparecen con la misma probabilidad