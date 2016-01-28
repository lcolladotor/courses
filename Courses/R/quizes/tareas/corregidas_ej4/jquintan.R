##1##
pnorm(550,(1000*0.5),(sqrt(1000*0.5*0.5))) # Mal hecho. Es 1- eso
1-pbinom(550,1000,0.5) # nah, pedí normal :P



##2##


a<-1
res.a <- c()
f <- function(n) mean(rexp(n))
for(i in 1:1000) res.a[i]<-f(a); plot(density(res.a),main="normal",xlab=a); 

# Hm... no veo mas que una linea de densidad para tus 1000 repeticiones. Como diferencías entre las n aquí?
# n=25 es una solución:
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

##3##
library(UsingR)
data(cabinet, package="UsingR")
cabinet$est.tax.savings
m<-qbinom(0.05, length(cabinet$est.tax.savings), 1/2)
sort(cabinet$est.tax.savings)[c(m, length(cabinet$est.tax.savings)+1-m)]

#ok


##4##
data(babies, package="UsingR")
 mean(babies$dage)

 mean(babies$age)
 pdf("babies$dage.pdf",height=3.5, width=10)
hist(padres, col="blue",main="red")  # De donde viene el objeto padres?
dev.off() # Al abrir el pdf se queda de un error

# Solución:
attach(babies)
t.test(dage,age,paired=TRUE,var.equal=FALSE, alternative="greater")$p.value
t.test(dage,age,var.equal=FALSE, alternative="greater")$p.value
detach(babies)

##5##
xi<-t.test(babies$age, mu=30.72706, alt="less") # Nah, está mal esto también.
xi$p.value


data(pi2000, package="UsingR")> chisq.test(pi2000) #porque pones un >?????

# LOL, no corrió ninguna sección de tu tarea o no era lo correcto.
# Solo la parte 3 la tienes bien.


