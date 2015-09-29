###################################################
### chunk number 1: 
###################################################
#line 9 "intro_clase2.Rnw"
options(width=45)


###################################################
### chunk number 2: 
###################################################
#line 46 "intro_clase2.Rnw"
z<-"z"
class (z)


###################################################
### chunk number 3:  eval=FALSE
###################################################
## #line 93 "intro_clase2.Rnw"
## v1 <- c(1:10)
## v2 <- runif(10)
## v3 <- sample(c("A", "C", "G", "T"), size = 10, replace = TRUE)
## v4 <- v3 %in% c("A", "G")
## v5 <- c("foo", 2, TRUE)
## v6 <- c(2, "3")


###################################################
### chunk number 4:  eval=FALSE
###################################################
## #line 108 "intro_clase2.Rnw"
## mode(v5)
## as.numeric(v5)
## as.numeric(v6) 
## help(as.vector)
## help(as)


###################################################
### chunk number 5: 
###################################################
#line 131 "intro_clase2.Rnw"
c(2,3) + c(3,4,5)


###################################################
### chunk number 6: 
###################################################
#line 135 "intro_clase2.Rnw"
c(2,3) + c(3,4,5,8)


###################################################
### chunk number 7: 
###################################################
#line 148 "intro_clase2.Rnw"
pain <- c(0,3,2,2,1)
fpain <- factor(pain, levels=0:3)
levels(fpain)<-c("none","mild","medium","severe")
fpain


###################################################
### chunk number 8: 
###################################################
#line 155 "intro_clase2.Rnw"
levels(fpain)
as.numeric(fpain)


###################################################
### chunk number 9: 
###################################################
#line 184 "intro_clase2.Rnw"
Lst <- list(name="Fred", wife="Mary", no.children=3,  child.ages=c(4,7,9))
Lst$name  
Lst[[1]] 
Lst$wife 
Lst$child.ages[1] 
Lst[[4]][1] 
length(Lst)


###################################################
### chunk number 10: 
###################################################
#line 221 "intro_clase2.Rnw"
arch <-  "/Users/amedina/Documents/CCG/Cursos/Compu_Stat_II/2009_2/R_advanced/data/heartatk4R.txt"
heartatk<- read.table(file=arch, header=TRUE)


###################################################
### chunk number 11:  eval=FALSE
###################################################
## #line 247 "intro_clase2.Rnw"
## setwd("/Users/amedina/Documents/CCG/Cursos/Compu_Stat_II/2009_2/R_advanced/data")
## files <- list.files(pattern=".txt") 
## for(i in files) { 
## x <- read.table(i, header=TRUE)
## } 


###################################################
### chunk number 12: 
###################################################
#line 270 "intro_clase2.Rnw"
arch <-  "/Users/amedina/Documents/CCG/Cursos/Compu_Stat_II/2009_2/R_advanced/data/heartatk4R.txt"
heartatk<- read.table(file=arch, header=TRUE)


###################################################
### chunk number 13:  eval=FALSE
###################################################
## #line 297 "intro_clase2.Rnw"
## setwd("/Users/amedina/Documents/CCG/Cursos/Compu_Stat_II/2009_2/R_advanced/data")
## files <- list.files(pattern=".txt") 
## for(i in files) { 
## x <- read.table(i, header=TRUE)
## } 


###################################################
### chunk number 14:  eval=FALSE
###################################################
## #line 315 "intro_clase2.Rnw"
## x <- c(1:5)
## x < 5
## x > 1 & x < 5
## x > 1 && x < 5
## x > 1 || x < 5
## x == 3
## x != 3
## ! x == 3
## x == c(2,4)


###################################################
### chunk number 15: 
###################################################
#line 338 "intro_clase2.Rnw"
x <- c(2,7,9,2,NA,5)       
x[1:3]
x[-1]
OddNum <- seq(1,6,2)
x[OddNum]
x[seq(1,6,2)]


###################################################
### chunk number 16: 
###################################################
#line 352 "intro_clase2.Rnw"
requireLogic <- c(TRUE,TRUE,FALSE,FALSE,FALSE,FALSE)
x[requireLogic]
x[x<5]


###################################################
### chunk number 17: 
###################################################
#line 364 "intro_clase2.Rnw"
y <- matrix(c(2,7,9,2,NA,5), nrow=2)
y
y[,c(1,3)]


###################################################
### chunk number 18: 
###################################################
#line 376 "intro_clase2.Rnw"
is.na(x)
x[is.na(x)] <- 0
x


###################################################
### chunk number 19: 
###################################################
#line 383 "intro_clase2.Rnw"
is.na(y)
str(is.na(y))
y[is.na(y)] <- -1
y


###################################################
### chunk number 20: 
###################################################
#line 410 "intro_clase2.Rnw"
names(heartatk)


###################################################
### chunk number 21: 
###################################################
#line 414 "intro_clase2.Rnw"
heartatk[2,]
mode(heartatk[2,])
heartatk[2,3]
heartatk[2,][3]
heartatk[2,"AGE"]
heartatk$AGE[1:5]
grep(pattern="F",as.vector(heartatk$SEX[][1:6]))
grp <- grep(pattern="F",as.vector(heartatk$SEX[][1:6])) 
heartatk[grp, ]


###################################################
### chunk number 22: 
###################################################
#line 435 "intro_clase2.Rnw"
library(ISwR)
data(thuesen)
ls()
head(thuesen)


###################################################
### chunk number 23: 
###################################################
#line 442 "intro_clase2.Rnw"
thue2 <- subset (thuesen,blood.glucose<7)
thue2


###################################################
### chunk number 24: 
###################################################
#line 451 "intro_clase2.Rnw"
thuesen [(thuesen[,1] <7), ]


###################################################
### chunk number 25: 
###################################################
#line 460 "intro_clase2.Rnw"
thue3 <- transform(thuesen, 
log.gluc=log(blood.glucose))


###################################################
### chunk number 26: 
###################################################
#line 474 "intro_clase2.Rnw"
log_blood<- log(thuesen$blood.glucose)
thue3$log_blood2 <-log_blood
head(thue3)


###################################################
### chunk number 27: 
###################################################
#line 484 "intro_clase2.Rnw"
data(energy)
head(energy)
class(energy)
class(energy[,1])
class(energy[,2])


###################################################
### chunk number 28: 
###################################################
#line 492 "intro_clase2.Rnw"
exp.lean <- energy$expend[energy$stature=="lean"]
exp.obese <- energy$expend[energy$stature=="obese"]


###################################################
### chunk number 29: 
###################################################
#line 498 "intro_clase2.Rnw"
list <- split( energy$expend, energy$stature)
list


###################################################
### chunk number 30: 
###################################################
#line 508 "intro_clase2.Rnw"
head(heartatk)


###################################################
### chunk number 31: 
###################################################
#line 516 "intro_clase2.Rnw"
age<-heartatk[,8]
head(age)
head(sort(age))


###################################################
### chunk number 32: 
###################################################
#line 524 "intro_clase2.Rnw"
dim(heartatk)
order_age<-order(heartatk[,8])
head(order_age)
head(heartatk[order_age,])
order_age_charge<-order(heartatk[,8],heartatk[,6])
head(order_age_charge)
head(heartatk[order_age_charge,])


