#Ejercicio 1
#Se obtiene la media, multiplicando los valores de np
(1000)*(1/2)
#La media vale 500
#A continuacion se obtiene la varianza multiplicanto npq
(1000)*(1/2)*(1/2)
#La varianza vale 250
#Se obtiene el valor de la desviacion estándar
sqrt(250)
# La desviacion estandar es de 15.81139
#Con esto ya podemos aplicar la formula que necesitamos
pnorm(549, mean = 500, sd = 15.81139, lower.tail = FALSE, log.p = FALSE)
#La probabilidad de que la muestra aleatoria tenga 550 o mas votos a favor de la decision es de 0.00097077

# bien :D

###########################################################################

#Ejercicio 2

m<- 500
res_de_50 <- c()
res_de_100 <- c()
res_de_150 <- c()
res_de_200 <- c()
res_de_250 <- c()
res_de_300 <- c()
res_de_350 <- c()
res_de_400 <- c()

funcioncita <- function(n) mean(rexp(n))

for (i in 1:m) res_de_50[i] <- funcioncita(50)
for (i in 1:m) res_de_100[i] <- funcioncita(100)
for (i in 1:m) res_de_150[i] <- funcioncita(150)
for (i in 1:m) res_de_200[i] <- funcioncita(200)
for (i in 1:m) res_de_250[i] <- funcioncita(250)
for (i in 1:m) res_de_300[i] <- funcioncita(300)
for (i in 1:m) res_de_350[i] <- funcioncita(350)
for (i in 1:m) res_de_400[i] <- funcioncita(400)

plot(density(res_de_400), xlim = range(res_de_50),type = "l", main = "Valores de medias para exponencial", xlab = "Medias", ylab="Densidad", col.main = "purple", font.main = 4,  col.lab ="green", col="purple")

lines(density(res_de_50), col="black")
lines(density(res_de_100), col="brown")
lines(density(res_de_150), col="red")
lines(density(res_de_200), col="green")
lines(density(res_de_250), col="pink")
lines(density(res_de_300), col="blue")
lines(density(res_de_350), col="yellow")
legend(1.2,6, c("50","100","150","200","250","300","350","400"), col=c("black","brown","red","green","pink","blue","yellow","purple"), lty=1)
# bien :D


#Yo creo que la media que mas se parece a una distribucion normal es cuando n=150.
# Hey, aunque tmb desde 25 funciona:
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)

###########################################################################
#Ejercicio 3

aimpuesto<-cabinet$est.tax.savings
largoim<-length(cabinet$est.tax.savings)
distribucion<-qbinom(0.05, largoim, 1/2)
sort(cabinet$est.tax.savings)[c(distribucion, largoim+1-distribucion)] #ok

#El intervalo de confianza para la mediana es 560 32444



###########################################################################
#Ejercicio 4

edades_madres<-babies$age
edades_padres<-babies$dage
pruebat<-t.test(edades_madres, edades_padres, alternative = "l", mu = 0) # bien :D No necesitas especificar mu
pruebat$p.value

#Entonces el valor que se obtiene para p es de: 4.48542e-28, el cual es muy peque, con lo que podemos rechazar la Ho de que las edades de las madres y los padres son iguales.

###########################################################################

#Ejercicio 5
x<-table(pi2000)
x
# Se imprime pi2000 y se obtiene:
#  0   1   2   3   4   5   6   7   8   9 
#181 213 207 189 195 205 200 197 202 211 

chisq.test(x)

#Con la funcion chisq.test se obtiene:
#Chi-squared test for given probabilities
#data:  x 
#X-squared = 4.42, df = 9, p-value = 0.8817

#Tambien, para obtener el p value se podria hacer:

jicuadrada<-chisq.test(x)
jicuadrada$p.value

#Con lo que se obtiene el valor 0.8816625

#Como el valor obtenido es de 0.8816625, no puedes rechazar que aparecen con la misma probabilidad.

# muy bien :D
