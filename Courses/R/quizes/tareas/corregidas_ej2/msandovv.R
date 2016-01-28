library(MASS)
DDT
hist(DDT, col=rainbow(10), xlab="Cantidad DDT", ylab="Frecuencia", main="DDT") 

boxplot(DDT, col="light pink", xlab="DDT", ylab="Frecuencia", main="DDT BOXPLOT")
summary(DDT)
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  2.790   3.075   3.220   3.328   3.360   4.640 
stat<-summary(DDT)
stat2<-stat[-c(3)]  
boxplot(DDT, col="light pink", xlab="DDT", ylab="Frecuencia", main="DDT BOXPLOT")
text(rep(1.3,5),stat2,labels=c(print(stat2)))
# Hehe bien, aunque no pedí los valoes en la gráfica ^^

library(UsingR)
pdf(file="histogramas.pdf", height=3.5, width=5) > par(mfrow=c(1,2))
hist(logaritmo, col=rainbow(16), ylab="Frequency", main="Histogram of Logaritmo") 
hist(lawsuits, col=rainbow(16), ylab="Frequency", main="Histogram of Lawsuits") 
dev.off()
# Nunca creaste tu objeto logaritmo!

http://www.immaculata.edu/bioinformatics/Summer_2001/Students/shuang/GroupP1.gif

datos<-c(7, 4, 4, 3, 3, 3, 3, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1)
names(datos)<-c("Arg", "Val", "Gly", "Leu", "Ser", "Asp", "Trp", "Met", "Asn", "Ile", "Pro", "Tyr", "Lys", "His", "Phe", "Cys", "Glu")
barplot(datos, main="Incidencia mutacional en AA´s en el gen HEXA", xlab="Aminoacido", ylab="# de Mutaciones", names.arg=c("Arg", "Val", "Gly", "Leu", "Ser", "Asp", "Trp", "Met", "Asn", "Ile", "Pro", "Tyr", "Lys", "His", "Phe", "Cys", "Glu"))

# Esta bien, aunque puedes usar el argumento las=2 en tu barplot para que se vea mucho mejor --- aka, para que se parezca a la gráfica que imitaste