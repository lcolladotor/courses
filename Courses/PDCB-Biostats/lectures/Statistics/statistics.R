###################################################
### chunk number 1: 
###################################################
#line 9 "statistics.Rnw"
options(width=45)


###################################################
### chunk number 2: 
###################################################
#line 35 "statistics.Rnw"
x<- rnorm(50)
mean(x)
sd(x)
var(x)
median(x)


###################################################
### chunk number 3: 
###################################################
#line 46 "statistics.Rnw"
quantile(x)


###################################################
### chunk number 4: 
###################################################
#line 55 "statistics.Rnw"
pvec<-seq(0,1,0.1)
quantile(x,pvec)


###################################################
### chunk number 5: 
###################################################
#line 66 "statistics.Rnw"
library(ISwR)
data(juul)
summary(juul)


###################################################
### chunk number 6: 
###################################################
#line 75 "statistics.Rnw"

juul$sex <- factor(juul$sex, labels=c("M","F"))

juul$menarche  <- factor(juul$menarche, labels= c("No","Yes"))

juul$tanner <- factor(juul$tanner, labels=c("I","II","III","IV", "V"))
summary (juul)



###################################################
### chunk number 7: 
###################################################
#line 95 "statistics.Rnw"
hist(x)


###################################################
### chunk number 8: 
###################################################
#line 102 "statistics.Rnw"
mid.age<- c(2.5, 7.5,  13,16.5,17.5,19,22.5,44.5,70.5)
acc.count<- c(28,46,58,20,31,64,149,316,103)
age.acc <- rep(mid.age,acc.count)
brk <- c(0,5,10,16,17,18,20,25,60,80)
hist(age.acc, breaks=brk)


###################################################
### chunk number 9: 
###################################################
#line 120 "statistics.Rnw"
n<- length(x)

plot(sort(x), (1:n)/n, type="s", ylim=c(0,1))


###################################################
### chunk number 10: 
###################################################
#line 138 "statistics.Rnw"
qqnorm(x)


###################################################
### chunk number 11: 
###################################################
#line 152 "statistics.Rnw"
data(IgM)
par(mfrow=c(1,2))
boxplot(IgM)
boxplot(log(IgM))
par(mfrow=c(1,1))



###################################################
### chunk number 12: 
###################################################
#line 169 "statistics.Rnw"
data(red.cell.folate)
tapply(red.cell.folate$folate, red.cell.folate$ventilation, mean)
tapply(red.cell.folate$folate, red.cell.folate$ventilation, sd)
tapply(red.cell.folate$folate, red.cell.folate$ventilation, length)


###################################################
### chunk number 13: 
###################################################
#line 184 "statistics.Rnw"
data(energy)
expend.lean <- energy$expend[energy$stature=="lean"]
expend.obese <- energy$expend[energy$stature=="obese"]

par(mfrow=c(2,1))
hist(expend.lean,breaks=10,xlim=c(5,13), ylim=c(0,4), col="white")
hist(expend.obese,breaks=10,xlim=c(5,13), ylim=c(0,4), col="grey")
par(mfrow=c(1,1))


###################################################
### chunk number 14: 
###################################################
#line 203 "statistics.Rnw"

boxplot (energy$expend~ energy$stature)



###################################################
### chunk number 15: 
###################################################
#line 209 "statistics.Rnw"

boxplot (expend.lean,  expend.obese)



###################################################
### chunk number 16: 
###################################################
#line 225 "statistics.Rnw"

stripchart (energy$expend~ energy$stature)



###################################################
### chunk number 17: 
###################################################
#line 239 "statistics.Rnw"

table(juul$sex)
table(juul$sex,juul$menarche)
table(juul$menarche, juul$tanner)
table(juul$menarche, juul$tanner,juul$sex)


###################################################
### chunk number 18: 
###################################################
#line 253 "statistics.Rnw"

tanner.sex <- table(juul$tanner,juul$sex)
margin.table(tanner.sex,1)
margin.table(tanner.sex,2)


###################################################
### chunk number 19: 
###################################################
#line 262 "statistics.Rnw"
prop.table ( tanner.sex,1)


###################################################
### chunk number 20: 
###################################################
#line 273 "statistics.Rnw"

barplot(table(juul$sex))



###################################################
### chunk number 21: 
###################################################
#line 278 "statistics.Rnw"

barplot(prop.table(tanner.sex,1),ylab="tanner")


###################################################
### chunk number 22: 
###################################################
#line 292 "statistics.Rnw"
pie(table(juul$sex))


###################################################
### chunk number 23: 
###################################################
#line 304 "statistics.Rnw"
data(thuesen)
cor(thuesen$blood.glucose,thuesen$short.velocity,use='complete.obs')


###################################################
### chunk number 24: 
###################################################
#line 319 "statistics.Rnw"
n <- 4
n*n
n^7


###################################################
### chunk number 25: 
###################################################
#line 330 "statistics.Rnw"
n*(n-1)*(n-2)*(n-3)
factorial(n)


###################################################
### chunk number 26: 
###################################################
#line 349 "statistics.Rnw"
choose(6000,15)


###################################################
### chunk number 27:  eval=FALSE
###################################################
## #line 373 "statistics.Rnw"
## install.packages("ROCR")
##   library(ROCR)


###################################################
### chunk number 28: 
###################################################
#line 378 "statistics.Rnw"
 library(ROCR)


###################################################
### chunk number 29: 
###################################################
#line 381 "statistics.Rnw"
data(ROCR.hiv)


###################################################
### chunk number 30: 
###################################################
#line 385 "statistics.Rnw"
pred <- prediction( ROCR.hiv$hiv.svm$predictions, ROCR.hiv$hiv.svm$labels)


###################################################
### chunk number 31: 
###################################################
#line 389 "statistics.Rnw"
perf <- performance(pred, "tpr", "fpr")


###################################################
### chunk number 32: 
###################################################
#line 392 "statistics.Rnw"
 plot(perf, avg="threshold", colorize=TRUE)


