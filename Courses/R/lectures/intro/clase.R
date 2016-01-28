###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## 2+2
## 2^2
## r <- c(1:3, 4.5, 109)
## pi*r^2
## sqrt(36)
## sin(2*pi)
## exp(1) # es exp(x) = e^x
## log(10) # log base e
## log(10, base = 10)


###################################################
### chunk number 3: 
###################################################
A <- c(a=1, b=2)["b"]
A = c(a=1, b=2)["b"]
A


###################################################
### chunk number 4:  eval=FALSE
###################################################
## v1 <- c(1:10)
## v2 <- runif(10)
## v3 <- sample(c("A", "C", "G", "T"), size = 10, replace = TRUE)
## v4 <- v3 %in% c("A", "G")
## v5 <- c("foo", 2, TRUE)
## v6 <- c(2, "3")


###################################################
### chunk number 5:  eval=FALSE
###################################################
## as.numeric(v5)
## as.numeric(v6)


###################################################
### chunk number 6: 
###################################################
fagos <- c(233.2, 180.5, 280.3, 244.8, 252.4, 178.2, 211.2, 196.2, 176.8, 185.7)
sum(fagos)
length(fagos)
sum(fagos)/length(fagos)
mean(fagos)


###################################################
### chunk number 7: 
###################################################
x <- c(2,3,5,7,11)
xbar <- mean(x)
n<- length(x)
sum((x-xbar)^2) / (n-1)
var(x)


###################################################
### chunk number 8:  eval=FALSE
###################################################
## simpsons <- c("Homer", "Marge", "Bart", "Lisa", "Maggie")
## names(simpsons) <- c("dad", "mom", "son", "daughter 1", "daughter 2")
## data.entry(simpsons)
## names(simpsons) <- c("dad", "mom", "son", "daughter 1", "daughter 2", "friend 1", "friend 2")
## simpsons


###################################################
### chunk number 9:  eval=FALSE
###################################################
## x <- c(-2:2)
## y <- x/x
## z <- y[!is.na(y)]
## z2 <- y[!is.na(y) & x>0]


###################################################
### chunk number 10:  eval=FALSE
###################################################
## x <- c(1:5)
## x < 5
## x > 1
## x > 1 & x < 5
## x > 1 && x < 5
## x > 1 | x < 5
## x > 1 || x < 5
## x == 3
## x != 3
## ! x == 3
## x == c(2,4)
## x %in% c(2,4)


###################################################
### chunk number 11:  eval=FALSE
###################################################
## c("A", "T", "C", "G")[rep(c(1,2,2,4,3), times=2)]


###################################################
### chunk number 12: 
###################################################
x <- c("inicio", rep(c("A", "T", "C", "G"), times=2), "fin")
y <- x[-c(2:6, 9)]
y


###################################################
### chunk number 13:  eval=FALSE
###################################################
## fagos <- c(233.2, 180.5, 280.3)
## names(fagos) <- c("Aeromonas phage Aeh1", "Enterobacteria phage RB43", "Pseudomonas phage phiKZ")
## fagos["Aeromonas phage Aeh1"]
## fagos[grep("Aeh1", names(fagos))]


###################################################
### chunk number 14: 
###################################################
if (1==0) {print(1)} else {print(2)}
x <- 1:10 
ifelse(x<5 | x>8, x, 0)


###################################################
### chunk number 15: 
###################################################
x <- 1:10; z <- NULL
for (i in 1:length(x)) { if (x[i]<5) { z <- c(z,x[i]-1)  } else { z <- c(z,x[i]/x[i])  } }
z


###################################################
### chunk number 16: 
###################################################
V <- runif(100)
print(V[1:9])
dim(V)
dim(V) <- c(2,5,10)
print(V[,,1])


###################################################
### chunk number 17:  eval=FALSE
###################################################
## X <- 1:16
## dim(X) <- c(4,4)
## X
## X * X
## X %*% X
## sum(X[,1] * X[1,])
## sum(X[,1] * X[2,])


###################################################
### chunk number 18: 
###################################################
arch <- "../../data/10biggestPhages.txt"
fagos.gr <- read.table(file=arch, header=TRUE)


###################################################
### chunk number 19: 
###################################################
sitio <- "http://kabah.lcg.unam.mx/~lcollado/R/"
sitio <- paste(c(sitio, "data/10biggestPhages.txt"), collapse="")
fagos.gr <- read.table(file=url(sitio), header=TRUE)
fagos.gr <- read.table(file=sitio, header=TRUE)
fagos.gr[c(2:4)]
fagos.gr$Taxid[2:3]


###################################################
### chunk number 20: 
###################################################
setwd("../../data")
files <- list.files(pattern="s.txt$") 
for(i in files) { 
x <- read.table(i, header=TRUE)
assign(i, x)
print(i)
}


###################################################
### chunk number 21: 
###################################################
setwd("../lectures/intro")


###################################################
### chunk number 22:  eval=FALSE
###################################################
## mifun <- function(arg1, arg2, ...) { lo_que_sea }
## mifun(arg1=..., arg2=...)


###################################################
### chunk number 23: 
###################################################
fact <- function(x=1) {
ret <- 1
for(i in 1:x) {ret = ret *i}
return(c(x,ret))}
fact()
fact(x=5)
fact(6)


###################################################
### chunk number 24: 
###################################################
mifun2 <- function(x1=5, arg.op) {
if(missing(arg.op)) { z1 <- 1:5 } else {z1 <- arg.op }   
return(z1/x1)
}  
mifun2(x1=5)
mifun2(x1=5, arg.op=30:25)


###################################################
### chunk number 25:  eval=FALSE
###################################################
## mifun3 <- function(x1) {
## if (x1>0) {print(x1)}
## else if (x1==0) { warning("El valor debe ser > 0") }
## else {stop("Hay un error porque x1 < 0")}
## }
## mifun3(x1=0)
## mifun3(x1=-2)


###################################################
### chunk number 26:  eval=FALSE
###################################################
## "%nombre%" <- function (x,y) { lo_que_sea }
## datos1 %nombre% datos2


###################################################
### chunk number 27:  eval=FALSE
###################################################
## help(package = nombre.paquete)


###################################################
### chunk number 28:  eval=FALSE
###################################################
## help(package = base)


###################################################
### chunk number 29:  eval=FALSE
###################################################
## install.package("mcmc")
## source("http://bioconductor.org/biocLite.R")
## biocLite("GeneR")


###################################################
### chunk number 30:  eval=FALSE
###################################################
## library(GeneR)
## s<-"atuuutututu"  
## placeString(s)  
## dnaToRna()        
## getSeq()             
## rnaToDna()  
## getSeq() 


