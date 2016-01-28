#Parte 1
library(UsingR)
plot((diamond$price~diamond$carat), xlab="Carat", ylab="Price", main="Carat/price", col.main="red", col="pink")
fit<- lm(diamond$price~diamond$carat)
abline(fit, col="blue")
predict(fit, .33)
#968.3123

# La predicción se hace así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))
detach(diamond)

#Parte 2
colour<-c("blue", "green", "yellow", "pink", "brown")
boxplot(cancer$stomach, cancer$bronchus, cancer$colon, cancer$ovary, cancer$breast, col=colour, names=c("Stomach", "Bronchus", "Colon", "Ovary", "Breast"), main="Cancer", col.main="orange")
#Larga=breast
#Corta=bronchus
#no todos los centros son iguales

#Parte 3
library(lattice)
xyplot(kid.weights$weight~kid.weights$age, xlab="Age", ylab="Weight", main="Kids Weights", col.main="green", col="red")
fit<- lm(kid.weights$weight~kid.weights$age)
abline(fit, col="blue")        # No te sirve de mucho hacer tu abline aquí
#de acuerdo a la edad va creciendo el peso
Age <- equal.count( kid.weights$age, number=4, overlap=0.0)
xyplot(kid.weights$weight~kid.weights$age | Age, data=kid.weights, xlab="Age", ylab="Weight", main="Kids Weights", col.main="green", col="red")
#la relacion no se mantiene entre los 4 grupos

# bien ^^, aunque sobre todo no se mantiene en el 4to grupo.

#Parte 4
boxplot(female.inc$income~female.inc$race, ylab="Income", col=c("blue", "green", "red"), main="Income per race", col.main="orange")
table(female.inc$income,female.inc$race)
#no varia muy significativamente entre negros y caucasicas aunque si se puede ver una variacion en hispanas
#sin embargo hay muchos ams datos de caucasicas que de negras eso puede influenciar

# Bien, aunque te faltó esto de los outliers de las blancas.

i<-1
while(i<4){
	print(summary(female.inc$income[which(unclass(female.inc$race)==i,arr.ind=T)]));i=i+1;
}