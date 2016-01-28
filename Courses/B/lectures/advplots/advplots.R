###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## install.packages("lattice")
## install.packages("mlmRev")
## install.packages("plotrix")
## install.packages("ggplot2")
## install.packages("car")
## install.packages("DAAG")


###################################################
### chunk number 3:  eval=FALSE
###################################################
## library(tools)
## testInstalledPackage(pkgname)


###################################################
### chunk number 4:  eval=FALSE
###################################################
## help.start() # Unless you are using the Windows GUI
## help(package = pkgname)


###################################################
### chunk number 5:  eval=FALSE
###################################################
## ?Lattice


###################################################
### chunk number 6: 
###################################################
library(lattice)
data(Chem97, package = "mlmRev")


###################################################
### chunk number 7: 
###################################################
hist(Chem97$gcsescore)


###################################################
### chunk number 8: 
###################################################
print(histogram(~gcsescore, data=Chem97))


###################################################
### chunk number 9: 
###################################################
head(Chem97$score)
class(Chem97$score)


###################################################
### chunk number 10: 
###################################################
print(histogram(~ gcsescore | factor(score), data = Chem97))


###################################################
### chunk number 11: 
###################################################
class(Chem97$gender)


###################################################
### chunk number 12: 
###################################################
print(densityplot(~ gcsescore | factor(score), Chem97, groups = gender,
plot.points = FALSE, auto.key = TRUE))


###################################################
### chunk number 13: 
###################################################
print(qqmath(~ gcsescore | factor(score), Chem97, groups = gender,auto.key = TRUE, aspect = "xy", f.value = ppoints(1000)))


###################################################
### chunk number 14:  eval=FALSE
###################################################
## f.value = ppoints(100)
## type = c("p", "g")


###################################################
### chunk number 15: 
###################################################
print(qq(gender ~ gcsescore | factor(score), Chem97,
f.value = ppoints(100), type = c("p", "g"), aspect = 1))


###################################################
### chunk number 16: 
###################################################
print(bwplot(factor(score) ~ gcsescore | gender, Chem97))


###################################################
### chunk number 17: 
###################################################
print(bwplot(gcsescore ~ gender | factor(score), Chem97, layout = c(6, 1)))


###################################################
### chunk number 18: 
###################################################
library(DAAG)
print(stripplot( ht ~ factor(sport), data = ais))


###################################################
### chunk number 19: 
###################################################
print(stripplot( ht ~ factor(sport), data = ais, jitter=T))


###################################################
### chunk number 20: 
###################################################
subset <- ais$sport %in% c("Netball", "Tennis")
print(xyplot(ht ~ wt | sport, groups=sex, pch=c(4,1), aspect=1, subset=subset, data=ais))


###################################################
### chunk number 21: 
###################################################
print(xyplot(ht ~ wt | sport, groups=sex, pch=c(4,1), aspect=1, auto.key=list(columns=2), subset=subset, data=ais))


###################################################
### chunk number 22: 
###################################################
data(Earthquake, package = "nlme")
print(xyplot(accel ~ distance, data = Earthquake))


###################################################
### chunk number 23: 
###################################################
print(xyplot(accel ~ distance, data = Earthquake, scales = list(log = TRUE),
type = c("p", "g", "smooth"), xlab = "Distance From Epicenter (km)",
ylab = "Maximum Horizontal Acceleration (g)"))


###################################################
### chunk number 24: 
###################################################
print(cloud(depth ~ lat * long, data = quakes,
zlim = rev(range(quakes$depth)),
screen = list(z = 115, x = -60), panel.aspect = 0.75,
xlab = "Longitude", ylab = "Latitude", zlab = "Depth"))


###################################################
### chunk number 25: 
###################################################
set.seed(123)
df<-data.frame(Time0=runif(3), Time1 = rnorm(3), Time2 = rlnorm(3))
df<- round(df, digits=2)
rownames(df)<-c("Gene1","Gene2","Gene3")
df
library(plotrix)
barp(df,ylab="Expression Lvl vs Control",
names.arg=colnames(df),col=1:3)
addtable2plot(.45, -1,df,bty="o",display.rownames=TRUE,hlines=TRUE,
title="Data in table format")


###################################################
### chunk number 26: 
###################################################
data<-c(rnorm(8)+3,rnorm(8)+21,rnorm(8)+4.5,rnorm(8)+20)
color <- c(rep(2,8), rep(3, 8), rep(4, 8), rep(1,8))
gap.plot(data,gap=c(8,16),xlab="Index",ylab="Values",
main="Gap on Y axis",col=color)


###################################################
### chunk number 27: 
###################################################
data<-c(rnorm(10),rnorm(10)+30)
gap.barplot(data,gap=c(6,25),xlab="Index",ytics=c(1:30),
ylab="Group values", las=2)


###################################################
### chunk number 28: 
###################################################
data <- matrix(rnorm(100), 10, 10)
a <- colMeans(data)
b <- std.error(data)
plot(a, ylim=c(min(a-b), max(a+b)), xlab="Sample", ylab="Value", col=4, type="o")
dispersion(1:10, colMeans(data), b)


###################################################
### chunk number 29: 
###################################################
t1 <- read.csv("http://www.lcg.unam.mx/~lcollado/B/data/SuppTable01_kogenome6_double_end-clone_1132_742.csv", header=T)
t2 <- read.csv("http://www.lcg.unam.mx/~lcollado/B/data/SuppTable06_nsSnp_AK1.csv", header=T)


###################################################
### chunk number 30: 
###################################################
means <- tapply(t1$bac_size, t1$chrNo, mean)
err <- tapply(t1$bac_size, t1$chrNo, std.error)
plotCI(1:24, means, err, col="red", scol="blue", las=2, main="bac_size per chrNo")


###################################################
### chunk number 31: 
###################################################
mat<- matrix(rnorm(100, 0, 2), 10, 10)
color2D.matplot(mat, show.legend=T)


###################################################
### chunk number 32: 
###################################################
test.df<-data.frame(Age=rnorm(100,25,10),
Sex=sample(c("M","F"),100,TRUE),
Marital=sample(c("D","M","S","W"),100,TRUE),
Employ=sample(c("Full Time","Part Time","Unemployed"),100,TRUE))
test.col<-list(Overall="green",Employ=c("purple","orange","brown"),
Marital=c("#1affd8","#caeecc","#f7b3cc","#94ebff"),Sex=c(2,4))
hierobarp(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
main="Show only the final breakdown",errbars=TRUE,col=test.col$Sex)


###################################################
### chunk number 33: 
###################################################
twoord.plot(2:10,seq(3,7,by=0.5)+rnorm(9),
1:15,rev(60:74)+rnorm(15),xlab="Sequence",
ylab="Ascending values",rylab="Descending values",
main="Plot with two ordinates - points and lines")


###################################################
### chunk number 34: 
###################################################
zoomInPlot(rnorm(100),rnorm(100),rxlim=c(-1,1),rylim=c(-1,1),
zoomtitle="Zoom In Plot")


###################################################
### chunk number 35:  eval=FALSE
###################################################
## plotmatrix(iris[,1:4])


###################################################
### chunk number 36:  eval=FALSE
###################################################
## plotmatrix(iris[,1:4]) + geom_smooth(method="lm")


###################################################
### chunk number 37:  eval=FALSE
###################################################
## mod <- lm(mpg ~ wt, data = mtcars)
## qplot(.fitted, .resid, data = mod) + geom_hline() + geom_smooth(se = FALSE)


###################################################
### chunk number 38: 
###################################################
library(car)
scatterplot.matrix(~income + education + prestige | type, data=Duncan)


###################################################
### chunk number 39: 
###################################################
scatterplot(prestige ~ income|type, data=Prestige, span=1)


###################################################
### chunk number 40: 
###################################################
sessionInfo()


