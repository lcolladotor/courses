que onda, si subi mi script a cursos, pero me falto agregar algo y se me
cerro la pagina. perdon por llenar tu correo de basura que tal vez no leas
saludos
############################################################################
require(UsingR)

plot(diamond$price~diamond$carat)
regresion<-lm(diamond$price~diamond$carat)
summary(regresion)

#  968.3123
#####################################################
attach(cancer)
boxplot(stomach,bronchus,colon,ovary,breast)

#breast;bronchus;no.
######################################################
require(lattice)
attach(kid.weight)

dotplot(weight~age | gender,groups=gender)

######################################################

attach(female.inc)
bwplot(income~race)
bwplot(income~race,ylim=c(0,200000))
boxplot(income~race,ylim=c(0,200000))
#pues si se nota una diferencia, el centro de la distribucion de hispanos
esta por debajo de las otras 2
#las otras dos distribuciones se parecen mucho
#aunque hay muchos datos de white,  esa dist es confiable.  la de black no
tanto, porque son muy pocos datos.

i=1;
while(1<4){
summary(female.inc$income[which(unclass(female.inc$race)==i,arr.ind=TRUE)])
i<-1+i;
}
##############para graficar en particiones de 3

pesos<-c(1:50)
i=0;j=1;while(j<=50){pesos[j]<-mean(weight[which(age>i&
age<=(i+3))]);i=i+3;j=j+1;}

class.age<-c(1:50)
> i=0;j=1;while(j<=50){class.age[j]<-paste(i,'-',i+3);i=i+3;j=j+1;}

plot(pesos,ylim=c(0,150),axes=FALSE)
axis(1,at=c(1:50),lab=class.age)
axis(2,las=1)

