# Pregunta 1
muestra <- sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5))
pnorm(549.5,mean=500,sd=sqrt(250))
# Casi, era 1 - eso
# Tambien lo puedes hacer asi:
muestra <- NULL
for (i in 1:10000) muestra[i] <- sum(sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5)))
1-pnorm(550, mean(muestra), sd(muestra)) # Nota que mean(muestra) =~ 500 y sd(muestra) =~ sqrt(250)


# Pregunta 2

vector <- matrix(c(rep(25, 500), rep(50, 500), rep(100, 500), rep(250, 500), rep(300, 500)), ncol=500, byrow=TRUE)
Matrix <- apply(vector, c(1,2), function(x) mean(rexp(x, rate=1)))
plot(density(Matrix[1,]), ylim=c(0,10), xlim=range(Matrix[1,]))
Colors <- c("red", "green", "blue", "yellow")
for(i in 2:dim(Matrix)[1]) lines(density(Matrix[i,]), col=Colors[i])

# Bien, y cual es el valor de n? :P Bueno, supongo que lo veo en tus graficas
# En fin, debiste empezar con otro numero y no 50

# Pregunta 3
require(UsingR)
attach(cabinet)

t.test(est.tax.savings,conf.level=0.95) #era de 90%!
# Intervalo de confianza del 95%:
# 3523.285 a 80791.662

# Solucion:
require(UsingR)
attach(cabinet)
t.test(est.tax.savings,conf.level=0.90) 
qqnorm(est.tax.savings) # Evidentemente no es una normal! Pero puedes usar la t.test porque n es chica (n=19)
wilcox.test(est.tax.savings, conf.int=TRUE,conf.level=0.9) # Te da un intervalo más pequeño
detach(cabinet)
#



detach(cabinet)
# Pregunta 4

attach(babies)
t.test(age,dage,mu=0,paired=TRUE,var.equal=FALSE)

# t = -17.3922, p-value < 2.2e-16
# Hipotesis nula: media es menor a 0
# Con un intervalo de confianza del 95%:
#      -Inf -3.047148
# Rechazamos hipotesis nula, 

# Esta bien, aunque no necesitas usar mu=0 y te falto especificar la cola de la distribucion

datos<-table(pi2000)
length(datos)
chisq.test(datos,p=rep(1/length(tab),length(tab))) # nunca definiste el objeto tab!

# Prueba de Chisq:

# X-squared = 4.42, p-value = 0.8817
# No podemos rechazar hipotesis nula.
detach(babies)


# Esta bien el resultado