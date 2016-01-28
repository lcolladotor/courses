
#####Ej.2 I #######
library(MASS)
par(mfcol=c(1,2))
hist(DDT,col=rainbow(5), xlab="Cant. de DDT", ylab="Frequence", main="DDT")
boxplot(DDT, col="green", xlab="DDT", ylab="Frequence", main="DDT")
mean(DDT)
############[1] 3.328
print("la media es 3.328")
 sd(DDT)
############[1] 0.4371531
print("La desviacion estandar es 0.437")
stat <-summary(DDT)
stat<-stat[-c(3)]
text(rep(1.3,5),stat,labels=c(print(stat)))
print("tarea de emiliano izquierdo")

####Ej.2 II ########
library(UsingR)
pdf("eizquier_ej2_2.pdf")
par(mfrow=c(1,2))
hist(lawsuits, main="Hist. of Lawsuits", xlab="Lawsuits",
ylab="Frequence", col="pink", col.lab="red", cex.main=1)
hist(log(lawsuits), main="Hist. of Log", xlab="log_Lawsuits",
ylab="Frequence", col="pink", col.lab="red", cex.main=1)
dev.off()

###Ej.2 III #########
###URL:
http://drherbie.files.wordpress.com/2007/05/052507-0637-replicates1.png
par(mfcol=c(1,1))
datos <- c(0,3,1,9,21,16,27,30,33,36,39,47,34,31,26,14,10,7,6,6,1,3,3,6,1)
barplot(datos, col="blue", main="Frequency Histogram of time of fixation
for 400 replicates", space=2, ylim=c(0,50))
box()

# Muy bien :D