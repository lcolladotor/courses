library(UsingR)
attach(diamond)
##1##
##a)##
plot(carat, price, main="", col="rainbow(10)", sub="1 carat = 200 mg") # Esta mal tu argumento col, es sin las "
title(main=list("Price vs Weight", col="rainbow(10)", font=3))
##b)##
plot(price~carat, main="Price vs Weight", sub="lineal regression")
res <- lm(price ~ carat)
abline(res, col="rainbow(1)", lwd=2) # De nuevo con el col
##c)## 
querry<-data.fram(carat = 1/3) # Te faltó una e en el data.frame
prediction<-predict(lm(price ~ carat), querry)
answer <- c(0.333,prediction)
names(answer) <- c("carat","precio") 
answer

# Esta bien :)

##2##
library(UsingR)
attach(cancer)
##a)##
nombres=c("stomach","bronchus","colon","ovary","breast")
boxplot(stomach, bronchus, colon, ovary, breast, 
	col="gray", 
	main="CANCER", 
	border="red",
	col.axis="red",
	xlab="Types of Cancer",
	names=nombres)
##b)Breast##
##c)Bronchus##
##d)No##
##3##
library(UsingR)
library(lattice)
data(kid.weights, package="UsingR")
## a)##
xyplot(age~weight, data=kid.weights, groups=gender)
##Gráfica para explorar los datos en general##
cloud(weight~height*age, data=kid.weights)
##b)##
table(cut(kid.weights$age, breaks=3*(0:4)))
attach(kid.weights)
plot(weight, height, main="Weight vs Height",pch=21, bg=c("red","green","blue","grey")[cut(age, breaks=3*(0:4))])

# Está mal. Los datos están en meses, así que tienes unos puntos sin colores. Además no usaste lattice al final en esta gráfica.
# Conclusión???


##Ejercicio 4##
library(UsingR)
library(lattice)
attach(female.inc)
##a)##
densityplot(~income, groups=race, main="Income of women of different ethnic groups") 
bwplot(race~income,female.inc, main="Income of women of different ethnic groups")
##b)##
razas <-split (female.inc$income, female.inc$race)
summary(razas$black)
sd(razas$black)
summary(razas$hispanic)
sd(razas$hispanic)
summary(razas$white)
sd(razas$white)

# Conclusiones????