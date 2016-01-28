###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite("affy")


###################################################
### chunk number 3: 
###################################################
x<-seq(from=0, to=150, by=1)
error<-rnorm(1000,0,1)
error151<-sample(error,151,replace=T)
y<-.02*x+error151
xy<-data.frame(x,y)


###################################################
### chunk number 4: 
###################################################
leg<-c("f=.01", "f=.2", "f=.5", "f=.8", "f=.99", "lm")
cols<-c("lightblue", "purple", "orange", "red", "green", "black")


###################################################
### chunk number 5: 
###################################################
lo.xy.01<-lowess(xy$x, xy$y, f=.01)
lo.xy.2<-lowess(xy$x, xy$y, f=.2)
lo.xy.5<-lowess(xy$x, xy$y, f=.5)
lo.xy.8<-lowess(xy$x, xy$y, f=.8)
lo.xy.99<-lowess(xy$x, xy$y, f=.99)
lr<-lm(y~x, data=xy)


###################################################
### chunk number 6: 
###################################################
plot(y~x, data=xy, col="grey", main="xy")
lines(lo.xy.01, col="lightblue")
lines(lo.xy.2, col="purple")
lines(lo.xy.5, col="orange")
lines(lo.xy.8, col="red")
lines(lo.xy.99, col="green")
abline(lr, col="black")
legend("bottomright", leg, col=cols, lty=1)


###################################################
### chunk number 7: 
###################################################
xy.lo2 <- loess(y ~ x, xy, control = loess.control(surface = "direct"))
pred2<-predict(xy.lo2, data.frame(xs = seq(50, 200, 1)), se = TRUE)


###################################################
### chunk number 8: 
###################################################
plot(y~x, data=xy, main="xy", xlim=c(0, 200), col="purple")
lines(seq(50,200,1), xy.lo2$fit, col="red", type="l")


###################################################
### chunk number 9: 
###################################################
library(affy)
data<-ReadAffy()
data


###################################################
### chunk number 10: 
###################################################
slotNames(data)
slot(data, "nrow")


###################################################
### chunk number 11: 
###################################################
pData(slot(data, "phenoData"))
pd<-read.AnnotatedDataFrame(filename="pdata1422.txt", header=T)
pData(pd)
slot(data, "phenoData")<-pd
pData(slot(data, "phenoData"))


###################################################
### chunk number 12: 
###################################################
library(ArrayExpress)
Data = ArrayExpress("E-MEXP-1422", save=T)


###################################################
### chunk number 13:  eval=FALSE
###################################################
## par(mfrow=c(2,3))
## image(Data)
## par(mfrow=c(1,1))


###################################################
### chunk number 14: 
###################################################
hist(Data)


###################################################
### chunk number 15: 
###################################################
MAplot(Data, pairs = TRUE, plot.method = "smoothScatter")


###################################################
### chunk number 16: 
###################################################
degradation<-AffyRNAdeg(Data)
names(degradation)


###################################################
### chunk number 17: 
###################################################
plotAffyRNAdeg(degradation)


