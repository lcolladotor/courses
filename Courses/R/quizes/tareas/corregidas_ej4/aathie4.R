##Ejercicio 1####
ds=sqrt(1000*0.5*0.5)
media=1000*0.5
resul<-pnorm(549, mean=media, sd=ds, lower.tail=FALSE)
resul
#####[1] 0.0009707699

# Ok, aunque podrias hacer esto tmb:
muestra <- NULL
for (i in 1:10000) muestra[i] <- sum(sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5)))
1-pnorm(550, mean(muestra), sd(muestra)) # Nota que mean(muestra) =~ 500 y sd(muestra) =~ sqrt(250)


##Ejercicio 2####
means <- 1000
res.25 <- c(); res.100 <- c(); res.150 <- c(); res.200 <- c(); res.50 <- c();
f<- function(n) mean(rexp(n))
for(i in 1:means) res.25[i] <- f(25)
for(i in 1:means) res.100[i] <- f(100)
for(i in 1:means) res.150[i] <- f(150)
for(i in 1:means) res.200[i] <- f(200)
for(i in 1:means) res.50[i] <- f(50)
plot(density(res.150), xlim = range(res.25), type="l", main="Distribuciones muestrales para la MEDIA con n=25, 50, 100, 150, 200", xlab="MEDIAS",col="black")
lines(density(res.100), col="blue")
lines(density(res.25), col="forest green")
lines(density(res.200), col="salmon")
lines(density(res.50), col="red")
legend(1.6, 3, c("200","150", "100","50","25"), col=c("salmon", "black", "blue","red", "forest green"), lty=1)

# No se ve tu legenda

# Cual n? 25?
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)


###Ejercicio 3#####
resul3<-cabinet$est.tax.savings
n<-length(resul3)
j<-qbinom(0.05,n,1/2)
sort(resul3)[c(j,n+1-j)] #ok
####[1]   560 32444
 
###Ejercicio 4#####
library(UsingR)
variable<-t.test(babies$dage,babies$age,mu=0, alt="greater") #no necesitabas especificar a mu
###variable
###
#        Welch Two Sample t-test
#
##data:  babies$dage and babies$age 
##t = 11.0671, df = 2301.524, p-value < 2.2e-16
##alternative hypothesis: true difference in means is greater than 0 
##95 percent confidence interval:
## 2.865266      Inf 
##sample estimates:
##mean of x mean of y 
## 30.73706  27.37136 
variable$p.value
###[1] 4.48542e-28
#Con este valor de p-value tan pequeno rechazamos la hipotesis nula Ho que dice que las medias de las edades de los padres
#es igual a la de las madres.

# bien :D

###Ejercicio 5#########
library(UsingR)
y<-table(pi2000)
resul4<-chisq.test(y)
#####        Chi-squared test for given probabilities
#####
#####data:  y 
#####X-squared = 4.42, df = 9, p-value = 0.8817
resul4

# Conclusión???

# Tu tarea se parece a la de Sol....