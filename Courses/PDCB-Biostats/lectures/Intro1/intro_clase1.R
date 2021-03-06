###################################################
### chunk number 1: 
###################################################
#line 9 "intro_clase1.Rnw"
options(width=40)


###################################################
### chunk number 2: 
###################################################
#line 139 "intro_clase1.Rnw"
2+2


###################################################
### chunk number 3: 
###################################################
#line 143 "intro_clase1.Rnw"
2*3


###################################################
### chunk number 4: 
###################################################
#line 147 "intro_clase1.Rnw"
2/3


###################################################
### chunk number 5: 
###################################################
#line 151 "intro_clase1.Rnw"
2^3


###################################################
### chunk number 6: 
###################################################
#line 155 "intro_clase1.Rnw"
log(3, base=2)


###################################################
### chunk number 7: 
###################################################
#line 159 "intro_clase1.Rnw"
sqrt(2)


###################################################
### chunk number 8: 
###################################################
#line 163 "intro_clase1.Rnw"
pi


###################################################
### chunk number 9:  eval=FALSE
###################################################
## #line 179 "intro_clase1.Rnw"
## save( object1, object2, file = file.path("folder", "file.Rda"))
## load( file = file.path("folder", "file.Rda"))


###################################################
### chunk number 10:  eval=FALSE
###################################################
## #line 184 "intro_clase1.Rnw"
## history()
## savehistory(file = file.path("folder", "file.Rhistory"))
## loadhistory(file = file.path("folder", "file.Rhistory"))


###################################################
### chunk number 11:  eval=FALSE
###################################################
## #line 190 "intro_clase1.Rnw"
## q(save = "yes")
## save.image(file = file.path("folder", "file.Rdata"))
## load(file = file.path("folder", "file.Rdata"))


###################################################
### chunk number 12:  eval=FALSE
###################################################
## #line 231 "intro_clase1.Rnw"
## install.packages("ISwR")


###################################################
### chunk number 13: 
###################################################
#line 235 "intro_clase1.Rnw"
library(ISwR)


###################################################
### chunk number 14: 
###################################################
#line 248 "intro_clase1.Rnw"
z<-"z"
class (z)


###################################################
### chunk number 15: 
###################################################
#line 297 "intro_clase1.Rnw"
A <- c(a=1, b=2)["b"]
A = c(a=1, b=2)["b"]
A


###################################################
### chunk number 16:  eval=FALSE
###################################################
## #line 312 "intro_clase1.Rnw"
## v1 <- c(1:10)
## v2 <- runif(10)
## v3 <- sample(c("A", "C", "G", "T"), size = 10, replace = TRUE)
## v4 <- v3 %in% c("A", "G")
## v5 <- c("foo", 2, TRUE)
## v6 <- c(2, "3")


###################################################
### chunk number 17:  eval=FALSE
###################################################
## #line 328 "intro_clase1.Rnw"
## mode(v5)
## as.numeric(v5)
## as.numeric(v6) 
## help(as.vector)
## help(as)


###################################################
### chunk number 18: 
###################################################
#line 342 "intro_clase1.Rnw"
weight <- c(50,60,57,72,90,95)
height <-c(1.60,1.70,1.65,1.72,1.90,1.85)
bmi <- weight/height^2
bmi


###################################################
### chunk number 19: 
###################################################
#line 368 "intro_clase1.Rnw"
c(2,3) + c(3,4,5)


###################################################
### chunk number 20: 
###################################################
#line 372 "intro_clase1.Rnw"
c(2,3) + c(3,4,5,8)


###################################################
### chunk number 21: 
###################################################
#line 388 "intro_clase1.Rnw"
c(42,57,12,39)
seq(4,9)
seq(4,10,2)
seq(0,1,by=0.1) 


###################################################
### chunk number 22: 
###################################################
#line 396 "intro_clase1.Rnw"
oops <- c(7,9,13)
rep (oops,3)
rep(1:2,c(10,15))
rep("Small",3) 
c(rep("Small",3),rep("Medium",4)) 


###################################################
### chunk number 23: 
###################################################
#line 415 "intro_clase1.Rnw"
x <- 1:12
dim(x) <- c(3,4)
x


###################################################
### chunk number 24: 
###################################################
#line 424 "intro_clase1.Rnw"
matrix (1:12, nrow=3, byrow=T)	
x<-matrix (1:12, nrow=3, byrow=T)	
rownames(x) <- LETTERS[1:3]
x


###################################################
### chunk number 25:  eval=FALSE
###################################################
## #line 431 "intro_clase1.Rnw"
## t(x)
## m2<-matrix(c(1,3,2,5,-1,2,2,3,9),ncol=3,byrow=T)
## m2[-1,-1]


###################################################
### chunk number 26: 
###################################################
#line 440 "intro_clase1.Rnw"
cbind(A=(1:4), B=(5:8),C=(9:12))
rbind(A=(1:4), B=(5:8),C=(9:12))


###################################################
### chunk number 27: 
###################################################
#line 452 "intro_clase1.Rnw"
V <- runif(100)
print(V[1:9])
dim(V)
dim(V) <- c(2,5,10)
print(V[,,1])


###################################################
### chunk number 28: 
###################################################
#line 464 "intro_clase1.Rnw"
m1<-matrix(1:4, ncol=2)
m2<-matrix(c(10,20,30,40),ncol=2) 


###################################################
### chunk number 29: 
###################################################
#line 470 "intro_clase1.Rnw"
2*m1


###################################################
### chunk number 30: 
###################################################
#line 474 "intro_clase1.Rnw"
m1+m2


###################################################
### chunk number 31: 
###################################################
#line 478 "intro_clase1.Rnw"
m1*m2


###################################################
### chunk number 32: 
###################################################
#line 482 "intro_clase1.Rnw"
m1%*%m2


###################################################
### chunk number 33: 
###################################################
#line 486 "intro_clase1.Rnw"
solve(m1)


###################################################
### chunk number 34: 
###################################################
#line 506 "intro_clase1.Rnw"
pain <- c(0,3,2,2,1)
fpain <- factor(pain, levels=0:3)
levels(fpain)<-c("none","mild","medium","severe")
fpain


###################################################
### chunk number 35: 
###################################################
#line 513 "intro_clase1.Rnw"
levels(fpain)
as.numeric(fpain)


###################################################
### chunk number 36: 
###################################################
#line 542 "intro_clase1.Rnw"
Lst <- list(name="Fred", wife="Mary", no.children=3,  child.ages=c(4,7,9))
Lst$name  
Lst[[1]] 
Lst$wife 
Lst$child.ages[1] 
Lst[[4]][1] 
length(Lst)


###################################################
### chunk number 37: 
###################################################
#line 579 "intro_clase1.Rnw"
arch <-  "/Users/amedina/Documents/CCG/Cursos/Compu_Stat_II/2009_2/R_advanced/data/heartatk4R.txt"
heartatk<- read.table(file=arch, header=TRUE)


###################################################
### chunk number 38:  eval=FALSE
###################################################
## #line 605 "intro_clase1.Rnw"
## setwd("/Users/amedina/Documents/CCG/Cursos/Compu_Stat_II/2009_2/R_advanced/data")
## files <- list.files(pattern=".txt") 
## for(i in files) { 
## x <- read.table(i, header=TRUE)
## } 


