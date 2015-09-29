###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## install.packages(c("lattice", "plotrix", "car"))


###################################################
### chunk number 3:  eval=FALSE
###################################################
## install.packages(c("mlmRev", "DAAG"))


###################################################
### chunk number 4: 
###################################################
mirnas <- read.csv("http://www.lcg.unam.mx/~lcollado/E/data/mirnas.csv", header=T)
datos <- mirnas$Total[rep(c(TRUE, FALSE), nrow(mirnas)/2)]
hist(datos, col="light blue", main="Histograma de mirnas$Total (l impares)", ylab="Densidad", xlab="miRNAs del set Total", prob=T)
lines(density(datos), col="red")


###################################################
### chunk number 5: 
###################################################
boxplot(datos, main="Boxplot de mirnas$Total (l impares)", xlab="miRNAs del set Total", ylab="Frecuencia", col="light blue")


###################################################
### chunk number 6: 
###################################################
qqnorm(datos, main="QQnorm de mirnas$Total (l impares)", xlab="Cuantiles teóricos (dist norm)", ylab="Cuantiles de miRNAs del set Total")
qqline(datos, col="red")


###################################################
### chunk number 7:  eval=FALSE
###################################################
## install.packages("NombrePqt")


###################################################
### chunk number 8:  eval=FALSE
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite()
## biocLite("NombrePqt")


###################################################
### chunk number 9:  eval=FALSE
###################################################
## help.start()
## help(package = NombrePaquete)


###################################################
### chunk number 10: 
###################################################
library(lattice)


###################################################
### chunk number 11:  eval=FALSE
###################################################
## ?Lattice


###################################################
### chunk number 12: 
###################################################
data(Chem97, package = "mlmRev")


###################################################
### chunk number 13: 
###################################################
class(Chem97)
dim(Chem97)
Chem97[1,]


###################################################
### chunk number 14: 
###################################################
hist(Chem97$gcsescore) #$


###################################################
### chunk number 15: 
###################################################
print(histogram(~gcsescore, data=Chem97))


###################################################
### chunk number 16: 
###################################################
print(histogram(~ gcsescore | factor(score), data = Chem97))


###################################################
### chunk number 17: 
###################################################
class(Chem97$score) #$


###################################################
### chunk number 18: 
###################################################
class(Chem97$gender) #$


###################################################
### chunk number 19: 
###################################################
print(densityplot(~ gcsescore | factor(score), Chem97, groups = gender,
plot.points = FALSE, auto.key = TRUE))


###################################################
### chunk number 20: 
###################################################
print(qqmath(~ gcsescore | factor(score), Chem97, groups = gender,auto.key = TRUE, aspect = "xy", f.value = ppoints(1000)))


###################################################
### chunk number 21: 
###################################################
print(qqmath(~ gcsescore | factor(score), Chem97, groups = gender,auto.key = TRUE, aspect = "xy", f.value = ppoints(100), type = c("p", "g")))


###################################################
### chunk number 22: 
###################################################
print(bwplot(factor(score) ~ gcsescore | gender, Chem97))


###################################################
### chunk number 23: 
###################################################
print(bwplot(gcsescore ~ gender | factor(score), Chem97, layout = c(6, 1)))


###################################################
### chunk number 24: 
###################################################
library(DAAG)
ais[1,]
print(stripplot( ht ~ factor(sport), data = ais))


###################################################
### chunk number 25: 
###################################################
print(stripplot( ht ~ factor(sport), data = ais, jitter=T))


###################################################
### chunk number 26: 
###################################################
subset <- ais$sport %in% c("Netball", "Tennis") #$
print(xyplot(ht ~ wt | sport, groups=sex, pch=c(4,1), aspect=1, subset=subset, data=ais))


###################################################
### chunk number 27: 
###################################################
print(xyplot(ht ~ wt | sport, groups=sex, pch=c(4,1), aspect=1, auto.key=list(columns=2), subset=subset, data=ais))


###################################################
### chunk number 28: 
###################################################
data(Earthquake, package = "nlme")
print(xyplot(accel ~ distance, data = Earthquake))


###################################################
### chunk number 29: 
###################################################
print(xyplot(accel ~ distance, data = Earthquake, scales = list(log = TRUE),
type = c("p", "g", "smooth"), xlab = "Distancia al Epicentro (km)",
ylab = "Máxima Aceleración Horizontal (g)"))


###################################################
### chunk number 30: 
###################################################
print(cloud(depth ~ lat * long, data = quakes,
zlim = rev(range(quakes$depth)),
screen = list(z = 115, x = -60), panel.aspect = 0.75,
xlab = "Longitud", ylab = "Latitud", zlab = "Profundidad")) #$


###################################################
### chunk number 31:  eval=FALSE
###################################################
## library(tools)
## testInstalledPackage(NombrePqt)


###################################################
### chunk number 32: 
###################################################
set.seed(123)
df<-data.frame(T0=runif(3), T1 = rnorm(3), T2 = rlnorm(3))
df<- round(df, digits=2)
rownames(df)<-c("G1","G2","G3")
df
library(plotrix)
barp(df,ylab="Nivel de Expresión vs Control",
names.arg=colnames(df),col=1:3)
addtable2plot(.45, -1,df,bty="o",display.rownames=TRUE,hlines=TRUE,
title="Barras y tabla")


###################################################
### chunk number 33: 
###################################################
data<-c(rnorm(8)+3,rnorm(8)+21,rnorm(8)+4.5,rnorm(8)+20)
color <- c(rep(2,8), rep(3, 8), rep(4, 8), rep(1,8))
gap.plot(data,gap=c(8,16),xlab="Index",ylab="Valores",
main="Salto en el eje Y",col=color)


###################################################
### chunk number 34: 
###################################################
data<-c(rnorm(10),rnorm(10)+30)
barplot(data, col=rainbow(20))


###################################################
### chunk number 35: 
###################################################
gap.barplot(data,gap=c(6,25),xlab="Índice",ytics=c(1:30),
ylab="Valores de los Grupos", las=2)


###################################################
### chunk number 36: 
###################################################
data <- matrix(rnorm(100), 10, 10)
a <- colMeans(data)
b <- std.error(data)
plot(a, ylim=c(min(a-b), max(a+b)), xlab="Muestras o Condiciones", ylab="Valores", col=4, type="o")
dispersion(1:10, colMeans(data), b)


###################################################
### chunk number 37: 
###################################################
t1 <- read.csv("http://www.lcg.unam.mx/~lcollado/B/data/SuppTable01_kogenome6_double_end-clone_1132_742.csv", header=T)
t2 <- read.csv("http://www.lcg.unam.mx/~lcollado/B/data/SuppTable06_nsSnp_AK1.csv", header=T)


###################################################
### chunk number 38: 
###################################################
means <- tapply(t1$bac_size, t1$chrNo, mean)
err <- tapply(t1$bac_size, t1$chrNo, std.error)
plotCI(1:24, means, err, col="red", scol="blue", las=2, main="Tamaño de BACs por cromosoma")


###################################################
### chunk number 39: 
###################################################
mat<- matrix(rnorm(100, 0, 2), 10, 10)
color2D.matplot(mat, show.legend=T)


###################################################
### chunk number 40: 
###################################################
twoord.plot(2:10,seq(3,7,by=0.5)+rnorm(9),
1:15,rev(60:74)+rnorm(15),xlab="Muestras",
ylab="Valores Var 1",rylab="Valores Var 2",
main="Gráfica con dos escalas (puntos y líneas)")


###################################################
### chunk number 41: 
###################################################
zoomInPlot(rnorm(100),rnorm(100),rxlim=c(-1,1),rylim=c(-1,1))


###################################################
### chunk number 42: 
###################################################
x <-sample(1:15, 300, TRUE)
hist(x, col="light blue")


###################################################
### chunk number 43: 
###################################################
peso <-sample(1:100, 300, TRUE)
hist(peso, col="light blue")


###################################################
### chunk number 44: 
###################################################
weighted.hist(x, peso, breaks=1:15, main="Histograma de x calibrado con peso", col="light blue")


###################################################
### chunk number 45: 
###################################################
library(car)
scatterplot.matrix(~income + education + prestige | type, data=Duncan)


###################################################
### chunk number 46: 
###################################################
scatterplot(prestige ~ income|type, data=Prestige, span=1)


###################################################
### chunk number 47: 
###################################################
sessionInfo()


