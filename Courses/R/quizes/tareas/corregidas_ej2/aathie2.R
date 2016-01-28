library(MASS)
DDT
stat<-summary(DDT)
stat2<-stat[-c(3)]
hist(DDT, xlab="DDT", ylab="Frecuencia", col=rainbow(6), main="CONCENTRACION DDT")
boxplot(DDT, col="light blue", xlab="DDT", ylab="Frecuencia", main="DDT")
text(rep(1.3,5),stat2,labels=c(print(stat2)))

library(UsingR)
pdf(file="aathie.pdf", height=3.5, width=5)
par(mfrow=c(1,2))
hist(logaritmo, main="LOGARITMOS", col=rainbow(8), ylab="frecuencia") # Nunca definiste el objeto logaritmo :(
hist(lawsuits, main="LAWSUITS", col=rainbow(16), ylab="frecuencia")
dev.off()

epidemia<-c(70,60,23,16,40,35,40,38,35,33,34,22,20,21,30,21,22,10,19,16,17,18,14,10,12)
pais<-c("Botswana","Rwanda","Papua New Guines","Burkina Faso","Zambia","Haiti","Gabon","Kenya","Malawi","Swaziland","Cote d'Ivore","Lesotho","South Africa","Ethiopia","Cameroon","Burundi","Guinea","Mozambique","Togo","Guinea-Bissau","Central African Rep","Zimbabwe","Congo","Ghana","Chad")
pdf(file="aathie2.pdf", height=6, width=8)
barplot(epidemia, col="light salmon", ylab="Percent Coverage (%)", las=2, ylim=c(0,100), cex.axis=1, names=pais)
dev.off()
                                                        
# Y la referenica de la imagen???? Así no puedo comprobar que hiciste algo parecido a la gráfica real.