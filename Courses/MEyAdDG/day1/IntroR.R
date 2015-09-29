###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## quit()


###################################################
### chunk number 3:  eval=FALSE
###################################################
## ?sample


###################################################
### chunk number 4: 
###################################################
apropos("norm")


###################################################
### chunk number 5:  eval=FALSE
###################################################
## help.start()


###################################################
### chunk number 6: 
###################################################
3+5
6*3/9
V<-33
V<-c(33, 55)
M<-c(33,77,53,27,21)
M*V


###################################################
### chunk number 7: 
###################################################
text<-c("Esto", "es", "character")
mode(V)
mode(text)
v<-as.character(V)
mode(v)
logical<-c(rep(1, 5), rep(0, 5))
as.logical(logical)


###################################################
### chunk number 8: 
###################################################
mat<-matrix(1:25, 5, 5)
mat
mat[,1]
mat[1,]
mat[4,4]
type<-factor(c(rep("a", 5), rep("b", 5)))
vals<-1:10
df<-data.frame(vals, type)
df
df$vals
lista<-list(mat=mat, df=df)
lista[[1]]
lista$mat
lista[[1]][1,1]


###################################################
### chunk number 9: 
###################################################
lista2<-list(lista1=lista, lista1_1=lista)
lista2[[2]]$mat[1,2]


###################################################
### chunk number 10:  eval=FALSE
###################################################
## install.packages("lattice")


###################################################
### chunk number 11: 
###################################################
library(lattice)


###################################################
### chunk number 12: 
###################################################
source("http://bioconductor.org/biocLite.R")


###################################################
### chunk number 13:  eval=FALSE
###################################################
## biocLite()


###################################################
### chunk number 14:  eval=FALSE
###################################################
## biocLite("affy")


###################################################
### chunk number 15: 
###################################################
library(affy)


###################################################
### chunk number 16: 
###################################################
freqs<-read.table(file="freqmatrix", header=T, sep="\t")
class(freqs)
head(freqs)


###################################################
### chunk number 17: 
###################################################
sample(1:10, 30, replace=T, prob=seq(from=.05, to=.95,by=.1))
sample(c(rep("A", 10), rep("T", 10), rep("G", 15), rep("C", 15)), 50, replace=F)


###################################################
### chunk number 18:  eval=FALSE
###################################################
## rnorm(100, 0, 1)
## runif(100, 0, 1)
## rgamma(100, 2, 4)


###################################################
### chunk number 19: 
###################################################
x<-seq(0, 50, .5)
y<-rnorm(length(x), 0, 1)
z<-rnorm(length(x), 0, 1)
w<-rnorm(length(x), 0, 1)
cor(x, y)
cor(x, y, method="spearman")


###################################################
### chunk number 20: 
###################################################
xy<-data.frame(x=x, y=y)
head(xy)
reg<-lm(y~x, data=xy)
reg


###################################################
### chunk number 21: 
###################################################
dist<-rnorm(100, 0, 1)
distmov<-rnorm(100, 10, 1)
dist2<-rnorm(100, .01, 1)
distunif<-runif(100, 0, 10)
shapiro.test(distunif)
shapiro.test(dist)
t.test(dist, mu=50)
t.test(dist, mu=1)
t.test(dist, distmov)
t.test(dist, dist2)
ks.test(dist, dist2)
ks.test(dist, distmov)


###################################################
### chunk number 22: 
###################################################
leg<-c("y~x","z~x", "w~x", "lm(y~x)")
cols<-c("red", "purple", "orange", "blue")
plot(y~x, type="l", col="red", main="X vs. Y")
lines(z~x, col="purple")
points(w~x, col="orange")
abline(reg, col="blue")
legend("bottomright", leg, col=cols, lty=1)


###################################################
### chunk number 23: 
###################################################
hist(dist, col="red", main="Distribucion de Frecuencias", breaks=20)


###################################################
### chunk number 24: 
###################################################
plot(density(dist), col="red", main="Distribucion de Frecuencias")


###################################################
### chunk number 25: 
###################################################
barplot(freqs[1:20,2], col=rainbow(20), names.arg=freqs[1:20,5], las=2, cex.names=.5, ylim=c(0, 1500), main="Frecuencias")


###################################################
### chunk number 26: 
###################################################
boxplot(dist, dist2, distmov, distunif, col=rainbow(4), names=c("dist", "dist2", "distmov", "distunif"), ylim=c(-5, 20))


###################################################
### chunk number 27: 
###################################################
qqplot(dist, dist2, col="red", main="dist vs dist2")


###################################################
### chunk number 28: 
###################################################
qqplot(dist, distunif, col="purple", main="dist vs distunif")


###################################################
### chunk number 29: 
###################################################
qqnorm(dist, col="red", main="qqnorm de dist")


###################################################
### chunk number 30: 
###################################################
qqnorm(distunif, col="purple", main="qqnorm de distunif")


###################################################
### chunk number 31: 
###################################################
curve(log(x^2), from=-100, to=100, col="red")


###################################################
### chunk number 32: 
###################################################
dataset<-data.frame(x=x, y=y, nat=sample(c("MX", "DK", "UK", "AR"), length(x), replace=T), gen=sample(c("M", "F"), length(x), replace=T))
head(dataset)
library(lattice)
print(xyplot(y~x|nat, groups=gen, data=dataset, auto.key=T))


###################################################
### chunk number 33: 
###################################################
library(plotrix)
test.df<-data.frame(Age=rnorm(100,25,10),
Sex=sample(c("M","F"),100,TRUE),
Marital=sample(c("D","M","S","W"),100,TRUE),
Employ=sample(c("Full Time","Part Time","Unemployed"),100,TRUE))
test.col<-list(Overall="green",Employ=c("purple","orange","brown"),
Marital=c("#1affd8","#caeecc","#f7b3cc","#94ebff"),Sex=c(2,4))
hierobarp(formula=Age~Sex+Marital+Employ,data=test.df,ylab="Mean age (years)",
main="Show only the final breakdown",errbars=F,col=test.col$Sex)


###################################################
### chunk number 34:  eval=FALSE
###################################################
## # Load the R MPI package if it is not already loaded. 
## if (!is.loaded("mpi_initialize")) { 
## 	library("Rmpi") 
## } 
## 
## # Spawn as many slaves as possible 
## mpi.spawn.Rslaves() 
## 
## # In case R exits unexpectedly, have it automatically clean up 
## # resources taken up by Rmpi (slaves, memory, etc...) 
## .Last <- function(){ 
## 	if (is.loaded("mpi_initialize")){ 
## 		if (mpi.comm.size(1) > 0){ 
## 			print("Please use mpi.close.Rslaves() to close slaves.") 
## 			mpi.close.Rslaves() 
## 		} 
## 		print("Please use mpi.quit() to quit R") 
## 		.Call("mpi_finalize") 
## 	} 
## } 
## 
## # Tell all slaves to return a message identifying themselves 
## mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size())) 
## 
## # Tell all slaves to close down, and exit the program mpi.close.Rslaves() 
## mpi.quit()


###################################################
### chunk number 35: 
###################################################
sessionInfo()

