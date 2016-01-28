library(MASS)
DDT
hist(DDT,main="* ~ * Histogram  DDT Pesticide in Brassica oleracea * ~ * {jzarco}", xlab="ppm", col=rainbow(5))
boxplot(DDT, main="* ~ * BoxPlot DDT Pesticide in Brassica oleracea * ~ * {jzarco}", col= "red", col.main="black")
mean(DDT)		
sd(DDT)
print("The mean is = ")
print (mean(DDT))
print("The standard deviation is = ")
print(sd(DDT))


library(UsingR)
lawsuits
pdf("jzarco.pdf") 
par(mfrow=c(1,2))
hist(lawsuits, main="* ~ * Histogram of Lawsuits * ~ * {jzarco}", xlab="lawsuits", ylab="Frequency", col=rainbow(3) , col.lab="red", cex.main=1)
hist(log(lawsuits), main="* ~ * Histogram of Log(Lawsuits) * ~ * {jzarco}", xlab="log(lawsuits)", ylab="Frequency", col=heat.colors(7), col.lab="violet", cex.main=1)
dev.off()
# Esta bien, solo que tus títulos están muy grandes en las dos figuras.


HW<- c(7900467, 3906072, 3751298, 1723093, 877908, 327803)
names(HW)<- c('DS', 'Wii', 'PSP', 'PS3', 'PS2', 'Xbox360')
barplot(HW, ylim=c(0,8000000), col=rainbow(6),space=1.3, main="* ~ * Yearly Japanese Hardware Sales * ~ * {jzarco}")
#http://cache.kotaku.com/assets/resources/2008/01/yearly_bar_sales.jpg

# Muy bien!