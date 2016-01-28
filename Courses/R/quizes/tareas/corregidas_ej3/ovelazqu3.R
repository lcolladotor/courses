#Ejercicio 1
library(UsingR)
plot((diamond$price~diamond$carat), xlab="Carat", ylab="Price", main="Carat Vs price", col.main="blue", col="green")
fit<- lm(diamond$price~diamond$carat)
abline(fit, col="Black")
predict(fit, .333)
#la prediccion del valor del diamante es 968.3126

# Cerca, pero la predicción se hacia así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))

#Ejercicio 2
colour<-c("blue", "brown", "yellow", "orange", "green")
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast, col=colour, names=c("Stomach", "Bronchus", "Colon", "Ovary", "Breast"), main="Cancer", col.main="orange")
# Usa cex.axis=0.8

#La grafica de breast cancer es la que tiene la cola mas larga.
#la grafica mas compacta es la de bronchus
#no todos los centros son similares

# ok :)

#Ejercicio 3
library(lattice)
xyplot(kid.weights$weight~kid.weights$age, xlab="Age", ylab="Weight", main="Kids Weights", col.main="blue", col="yellow")
fit<- lm(kid.weights$weight~kid.weights$age)
abline(fit, col="green")

# No te sirve de mucho hacer tu abline en este caso.

# Mientras mayor es la edad mayor es el peso, crece directamente proporcional
Age <- equal.count( kid.weights$age, number=4, overlap=0.0)
xyplot(kid.weights$weight~kid.weights$age | Age, data=kid.weights, xlab="Age", ylab="Weight", main="Kids Weights", col.main="blue", col="yellow")
#No se ve que la relacion permanezca entre los 4 grupos.

# Bien :D En realidad desaparece con el 4to grupo.

#Ejercicio 4
boxplot(female.inc$income~female.inc$race, ylab="Income", col=c("red", "blue", "yellow"), main="Income per race", col.main="green")
# La idea era usar lattice aquí, pero esta bien.

table(female.inc$income,female.inc$race)
#la unica diferencia del ingreso entre las razas se puede ver en hispanos.

# Bueno, y los outliers de las mujeres blancas. Las hispanas pues están peor que las otras dos.

i<-1
while(i<4){
	print(summary(female.inc$income[which(unclass(female.inc$race)==i,arr.ind=T)]));
	i=i+1;
}

# Ingenioso con el while :D
