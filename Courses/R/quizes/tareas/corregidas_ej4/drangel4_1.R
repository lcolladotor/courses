1-pnorm(550,(1000*0.5),(sqrt(1000*0.5*0.5))) # ok
1-pbinom(550,1000,0.5)

a<-1
res.a <- c()
f <- function(n) mean(rexp(n))
while(a<3000){ for(i in 1:500) res.a[i]<-f(a); plot(density(res.a),main="yaaa se normal!!!",xlab=a); a=a+10} # Es super ineficiente tu código. Pues me crea 3000 gráficas.
## pues como a los 500 comienza a verse normal
# con 25 se asemeja a una normal
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

library(UsingR)
data(cabinet, package="UsingR")
cabinet$est.tax.savings
m<-qbinom(0.05, length(cabinet$est.tax.savings), 1/2)
sort(cabinet$est.tax.savings)[c(m, length(cabinet$est.tax.savings)+1-m)] #ok

data(babies, package="UsingR")
 mean(babies$dage)
## la media de los padres es: [1]  30.73706
mean(babies$age)
## la media de las madres es: [1] 27.37136
##H0: mean(age)=mean(page)
##H1: mean(age)<mean(page)
##primero grafico para ver si si se distribuyen normalement
padres<- babies$dage
hist(padres,main="padres")
pdf("padres.pdf",height=3.5, width=10)
hist(padres, col="pink",main="padres")
dev.off()
xx<-t.test(babies$age, mu=30.72706, alt="less")
xx$p.value
##mi valor p fue de [1] 1.683023e-66
##por lo tanto concluyo que si puedo rechazar la hipótesis nula
##ahora que si comparo usando ambos arreglos:
bla<-t.test(babies$dage, babies$age, mu=0, alt="greater")
bla$p.value
##[1] 4.48542e-28 #Esta era la forma de hacerlo...

data(pi2000, package="UsingR")> chisq.test(pi2000) # Truena esta línea por el >
## como quiero comparar con los valore esperados si tienen la misma probabilidad de 1/10 de ocurrir, no pongo p=c(...)
##X-squared = 3633.053, df = 1999, p-value < 2.2e-16
##no aparecen con la misma probabilidad

# Está mal tu prueba ji
# Solución:
chisq.test(table(pi2000),p=rep(0.1,10))

# Ya vi tareas demasiado parecidas a la tuya.... tsk tsk.

