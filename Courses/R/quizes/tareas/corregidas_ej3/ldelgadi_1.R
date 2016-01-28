require(UsingR)
plot(diamond$price~diamond$carat)
regresion<-lm(diamond$price~diamond$carat)
summary(regresion)
##me dio 968.3123

# Ajá, y como la hiciste? En fin, se hace así:
library(UsingR)
attach(diamond)
predict(lm(price ~ carat), data.frame(carat = 1/3))

##segundo paso
attach(cancer)
boxplot(stomach,bronchus,colon,ovary,breast)
# Esta extremadamente simple tu boxplot, pero bueno, lograste sacar la info.

# aqui tengo el: breast;bronchus;no.


require(lattice)
# tercer paso
attach(kid.weight) # Tienes un error aquí

dotplot(weight~age | gender,groups=gender)
# Y las conclusiones???? Nunca hiciste lo de los grupos.


attach(female.inc)
bwplot(income~race)
bwplot(income~race,ylim=c(0,200000))
boxplot(income~race,ylim=c(0,200000)) #hay una diferencia de los hispanos en el centro que esta debajo de las otras dos

#las oatras dos pues se parecen bastante
#lo unico malo es que hay bastante datos blancos, esa distrubucion parece confiable puesto que no son muy pocos datos como para verse muy adfectada

# Faltó lo de los outliers en las blancas.


i=1;
while(1<4){ # MATASTE mi R :P Tu while esta MAL hecho!!!
summary(female.inc$income[which(unclass(female.inc$race)==i,arr.ind=TRUE)])
i<-1+i;
}

