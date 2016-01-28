#1. Asume que una poblaci´on est´a dividia en dos sobre alguna decisi´on (p = 1/2). Toman una
#muestra aleatoria de tama?no 1000. Cual es la probabilidad de que la muestra aleatoria tendr´a
#550 o m´as votos a favor de la decisi´on? Responde usando una aproximaci´on normal.
ds=sqrt(1000*0.5*0.5)
media=1000*0.5
resul<-pnorm(549, mean=media, sd=ds, lower.tail=FALSE)
resul

# ok :)

#Para qu´e valor de n la distribuci´on X se ve aproximadamente como una normal cuando cada
#Xi es de tipo exponencial (1)1. Corre varias simulaciones para diferentes ns hasta que decidas
#cuando empieza a verse como normal.
means <- 1000
res.10 <- c(); res.50 <- c(); res.150 <- c(); res.250 <- c(); res.290 <- c();
f<- function(n) mean(rexp(n))
for(i in 1:means) res.10[i] <- f(10)
for(i in 1:means) res.50[i] <- f(50)
for(i in 1:means) res.150[i] <- f(150)
for(i in 1:means) res.250[i] <- f(250)
for(i in 1:means) res.290[i] <- f(290)
plot(density(res.150), xlim = range(res.10), type="l", main="Distribuciones muestrales para la media con n=10,
50, 150, 150, 250, 290", xlab="Medias",col="limegreen")  # Te faltó usar ylim para que se vieran todos tus datos
lines(density(res.10), col="blue")
lines(density(res.50), col="cyan")
lines(density(res.250), col="yellow")
lines(density(res.290), col="salmon")
legend(1.6, 3, c("250","150", "50","290","10"), col=c("yellow", "limegreen", "blue","salmon", "cyan"), lty=1)

# Cual es la n? 25 ya empieza a servir:
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

#3. Usa el set de datos cabinet del paquete UsingR. Este contiene informaci´on sobre la cantidad
#de dinero que se ahorrar´on los miembros del comit´e de Bush en el 2003 ccuando pasaron una
#nueva ley sobre impuestos. Esta informaci´on est´a almacenada en la variable est.tax.savings.
#Encuentra un intervalo de confianza de 90% para la mediana.
resul3<-cabinet$est.tax.savings
n<-length(resul3)
j<-qbinom(0.05,n,1/2)
sort(resul3)[c(j,n+1-j)]

# Forma complicada y no tan "accurate".
# Solución:
require(UsingR)
attach(cabinet)
t.test(est.tax.savings,conf.level=0.90) 
qqnorm(est.tax.savings) # Evidentemente no es una normal! Pero puedes usar la t.test porque n es chica (n=19)
wilcox.test(est.tax.savings, conf.int=TRUE,conf.level=0.9) # Te da un intervalo más pequeño
detach(cabinet)
 
#4. El set de datos babies de UsingR tiene las edades de las madres en la variable age y la de los
#padres en dage. Haz una prueba de significancia de la hip´otesis nula de edades iguales contra
#una de alternativa de un solo lado donde los pap´as est´an m´as viejos. Reporta el valor p y tu
#conclusi´on sobre Ho

library(UsingR)
variable<-t.test(babies$dage,babies$age,mu=0, alt="greater")

# Te faltó hacer:
variable$p.value

##Con un p-value tan pequeno rechazamos Ho que dice que las media de las edades de los padres
#es igual a la de las madres.

#5. El set de datos pi2000 de UsingR tiene los primeros 2000 d´?gitos de . Haz una prueba de
#hip´otesis para ver si los d´?gitos aparecen con la misma probabilidad. Usa la prueba de la 2.
library(UsingR)
y<-table(pi2000)
resul4<-chisq.test(y)
resul4

# Que concluyes??