###################################################
### chunk number 1: 
###################################################
#line 9 "plots.Rnw"
options(width=45)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## #line 28 "plots.Rnw"
## demo(graphics)


###################################################
### chunk number 3:  eval=FALSE
###################################################
## #line 59 "plots.Rnw"
## x11(); x11(); pdf()


###################################################
### chunk number 4:  eval=FALSE
###################################################
## #line 63 "plots.Rnw"
## dev.list()


###################################################
### chunk number 5:  eval=FALSE
###################################################
## #line 67 "plots.Rnw"
## dev.cur()
## dev.set(3)


###################################################
### chunk number 6:  eval=FALSE
###################################################
## #line 72 "plots.Rnw"
## dev.off(2)
## dev.off()


###################################################
### chunk number 7:  eval=FALSE
###################################################
## #line 84 "plots.Rnw"
## x11();
## split.screen(c(1, 2)) 


###################################################
### chunk number 8:  eval=FALSE
###################################################
## #line 89 "plots.Rnw"
## screen(1)
## screen(2)


###################################################
### chunk number 9:  eval=FALSE
###################################################
## #line 94 "plots.Rnw"
## layout(matrix(1:4, 2, 2)) 
## mat <- matrix(1:4, 2, 2)
## mat
## layout(mat)


###################################################
### chunk number 10:  eval=FALSE
###################################################
## #line 101 "plots.Rnw"
## layout.show(4)


###################################################
### chunk number 11:  eval=FALSE
###################################################
## #line 115 "plots.Rnw"
## layout(matrix(1:6, 3, 2))
## layout.show(6)


###################################################
### chunk number 12:  eval=FALSE
###################################################
## #line 120 "plots.Rnw"
## layout(matrix(1:6, 2, 3))
## layout.show(6)


###################################################
### chunk number 13:  eval=FALSE
###################################################
## #line 125 "plots.Rnw"
## m <- matrix(c(1:3, 3), 2, 2)
## layout(m)
## layout.show(3)


###################################################
### chunk number 14:  eval=FALSE
###################################################
## #line 140 "plots.Rnw"
## m <- matrix(1:4, 2, 2)
## layout(m, widths=c(1, 3),
##          heights=c(3, 1))
## layout.show(4)
## 
## m <- matrix(1:4, 2, 2)
## layout(m, widths=c(1, 3),
##          heights=c(3, 1))
## layout.show(4)
## 


###################################################
### chunk number 15: 
###################################################
#line 180 "plots.Rnw"
fagos <- c(33.2, 180.5, 280.3, 244.8, 252.4, 178.2, 211.2, 196.2, 176.8, 185.7)


###################################################
### chunk number 16: 
###################################################
#line 184 "plots.Rnw"
plot(fagos)


###################################################
### chunk number 17: 
###################################################
#line 188 "plots.Rnw"
plot(sort(fagos))


###################################################
### chunk number 18:  eval=FALSE
###################################################
## #line 199 "plots.Rnw"
## help(plot)


###################################################
### chunk number 19: 
###################################################
#line 203 "plots.Rnw"
plot(fagos, col="blue")


###################################################
### chunk number 20: 
###################################################
#line 211 "plots.Rnw"
plot(fagos, col="blue",type="l")


###################################################
### chunk number 21: 
###################################################
#line 219 "plots.Rnw"
plot(fagos, col="blue",type="o")


###################################################
### chunk number 22: 
###################################################
#line 227 "plots.Rnw"
plot(fagos, ylab="Fagos (en kb)", main="Grafica de fagos", xlab="Los 10 fagos más grandes", col="blue", type="o")


###################################################
### chunk number 23: 
###################################################
#line 237 "plots.Rnw"
plot(fagos, ylab="Fagos (en kb)", main="Grafica de fagos", xlab="Los 10 fagos más grandes", col="blue", type="o", lty=2, lwd=2)


###################################################
### chunk number 24: 
###################################################
#line 245 "plots.Rnw"
plot(fagos, ylab="Fagos (en kb)", main="Grafica de fagos", xlab="Los 10 fagos más grandes", col="blue", type="o", lty=2, lwd=2, col.main="red")


###################################################
### chunk number 25:  eval=FALSE
###################################################
## #line 273 "plots.Rnw"
## x<-seq(0,1,.05)
## plot(x,x, ylab="y", type= "l" )
## for(j in 2:8) {       lines ( x, x^j) }


###################################################
### chunk number 26: 
###################################################
#line 280 "plots.Rnw"
x<-seq(0,1,.05)
plot(x,x, ylab="y", type= "l")
for(j in 2:8) {lines ( x, x^j)}


###################################################
### chunk number 27: 
###################################################
#line 293 "plots.Rnw"
fagos2 <- seq(25, 250, by=25)


###################################################
### chunk number 28: 
###################################################
#line 297 "plots.Rnw"
plot(fagos, ylab="Fagos (en kb)", main="Grafica de fagos", xlab="Los 10 fagos más grandes", col="blue", type="o", lty=2, lwd=2, col.main="red")
lines(fagos2, col="forest green", type="o", lty=2, lwd=1.5, pch=18)


###################################################
### chunk number 29: 
###################################################
#line 307 "plots.Rnw"
plot(fagos, ylab="Fagos (en kb)", main="Grafica de fagos", xlab="Los 10 fagos más grandes", col="blue", type="o", lty=2, lwd=2, col.main="red")
lines(fagos2, col="forest green", type="o", lty=2, lwd=1.5, pch=18)
abline(a = 200, b = 0, col="red")


###################################################
### chunk number 30:  eval=FALSE
###################################################
## #line 319 "plots.Rnw"
## par(bg="yellow")
## ?par


###################################################
### chunk number 31: 
###################################################
#line 329 "plots.Rnw"
x <- rnorm(10)
y <- rnorm(10)
plot(x, y)


###################################################
### chunk number 32: 
###################################################
#line 336 "plots.Rnw"
plot(x, y, xlab="Diez numeros al azar", ylab="Otros diez numeros",
     xlim=c(-2, 2), ylim=c(-2, 2), 
     main="Como personalizar un grafico en R", las=1, cex=1.5)


###################################################
### chunk number 33: 
###################################################
#line 343 "plots.Rnw"
plot(x, y, xlab="Diez numeros al azar", ylab="Otros diez numeros",
     xlim=c(-2, 2), ylim=c(-2, 2), pch=22, col="red",
     bg="yellow",
     main="Como personalizar un grafico en R", las=1, cex=1.5)


###################################################
### chunk number 34: 
###################################################
#line 351 "plots.Rnw"
plot(x, y, xlab="Diez numeros al azar", ylab="Otros diez numeros",
     xlim=c(-2, 2), ylim=c(-2, 2), pch=22, col="red",
     bg="yellow", bty="l", tcl=0.4,
     main="Como personalizar un grafico en R", las=1, cex=1.5)


###################################################
### chunk number 35: 
###################################################
#line 374 "plots.Rnw"
opar <- par()
par(bg="lightgray", mar=c(2.5, 1.5, 2.5, 0.25)) ## direccione del margen South, West, North, East
plot(x, y, type="n", xlab="", ylab="", xlim=c(-2, 2),
     ylim=c(-2, 2), xaxt="n", yaxt="n")
rect(-3, -3, 3, 3, col="cornsilk") # dibuja un rectangulo xleft, ybottom, xright, ytop
points(x, y, pch=10, col="red", cex=2)
axis(side=1, c(-2, 0, 2), tcl=-0.2, labels=FALSE)
axis(side=2, -1:1, tcl=-0.2, labels=FALSE)
title("Como personalizar un grafico en R (ter)",
      font.main=4, adj=1, cex.main=1)
mtext("Diez numeros al azar", side=1, line=1, at=1, cex=0.9, font=3)
mtext("Otros diez numeros", line=0.5, at=-1.8, cex=0.9, font=3)
mtext(c(-2, 0, 2), side=1, las=1, at=c(-2, 0, 2), line=0.3,
      col="blue", cex=0.9)
mtext(-1:1, side=2, las=1, at=-1:1, line=0.2, col="blue", cex=0.9)
par(opar)


###################################################
### chunk number 36: 
###################################################
#line 402 "plots.Rnw"
workingDir <- "/Users/amedina/Documents/PHD/Sem7/CursoR/data"
w1 <- read.csv(file=paste(sep='',workingDir,"/w1.dat"),sep=',',head=TRUE)
names(w1)
len <- length(as.vector(w1[,1]) )
barplot(as.vector(w1[,1]), main="Leaves", ylab="Grow", col=rainbow(len))



###################################################
### chunk number 37: 
###################################################
#line 419 "plots.Rnw"
hist(w1$vals)


###################################################
### chunk number 38: 
###################################################
#line 425 "plots.Rnw"
hist(w1$vals,breaks=4)


###################################################
### chunk number 39: 
###################################################
#line 428 "plots.Rnw"
hist(w1$vals,breaks=12,xlim=c(1,1.3))


###################################################
### chunk number 40: 
###################################################
#line 440 "plots.Rnw"
boxplot(w1)


###################################################
### chunk number 41: 
###################################################
#line 446 "plots.Rnw"
boxplot(w1$vals,
          main='Leaf BioMass in High CO2 Environment',
	  ylab='BioMass of Leaves')


###################################################
### chunk number 42: 
###################################################
#line 452 "plots.Rnw"
boxplot(w1$vals,
          main='Leaf BioMass in High CO2 Environment',
          xlab='BioMass of Leaves',
	  horizontal=TRUE)	  


###################################################
### chunk number 43: 
###################################################
#line 461 "plots.Rnw"
tree <- read.csv(file=paste(sep='',workingDir,"/trees91.csv"),sep=",",head=TRUE)
boxplot(tree$STBM,
          main='Stem BioMass in Different CO2 Environments',
	  ylab='BioMass of Stems')


###################################################
### chunk number 44:  eval=FALSE
###################################################
## #line 476 "plots.Rnw"
##   install.packages("lattice")
##   install.packages("mlmRev")


###################################################
### chunk number 45: 
###################################################
#line 510 "plots.Rnw"
  library(lattice)


###################################################
### chunk number 46: 
###################################################
#line 514 "plots.Rnw"
  data(Chem97, package = "mlmRev")
  #class(Chem97)


###################################################
### chunk number 47: 
###################################################
#line 527 "plots.Rnw"
hist(Chem97$gcsescore)


###################################################
### chunk number 48: 
###################################################
#line 531 "plots.Rnw"
print(histogram(~gcsescore, data = Chem97))


###################################################
### chunk number 49: 
###################################################
#line 539 "plots.Rnw"
print(histogram(~gcsescore | factor(score),  data = Chem97))


###################################################
### chunk number 50: 
###################################################
#line 544 "plots.Rnw"
print(densityplot(~gcsescore | factor(score), Chem97, groups = gender,  plot.points = FALSE, auto.key = TRUE))


###################################################
### chunk number 51: 
###################################################
#line 556 "plots.Rnw"
  print(qq(gender ~ gcsescore | factor(score),  Chem97, f.value = ppoints(100),  type = c("p", "g"), aspect = 1))


