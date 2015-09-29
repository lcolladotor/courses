###################################################
### chunk number 1: 
###################################################
#line 50 "tests.Rnw"
options(width=40)


###################################################
### chunk number 2: 
###################################################
#line 165 "tests.Rnw"
daily <- c(5260, 5470, 5640, 6180, 6390, 6515, 6805, 7515, 7515, 8320, 8770)


###################################################
### chunk number 3: 
###################################################
#line 178 "tests.Rnw"
t.test(daily, mu=7725)


###################################################
### chunk number 4:  eval=FALSE
###################################################
## #line 253 "tests.Rnw"
## install.packages("ISwR")


###################################################
### chunk number 5: 
###################################################
#line 257 "tests.Rnw"
library(ISwR)
attach(energy)
head(energy)
class(energy)
dim(energy)


###################################################
### chunk number 6: 
###################################################
#line 272 "tests.Rnw"
t.test( energy$expend[ energy$stature == "lean" ], energy$expend[ energy$stature == "obese" ])


###################################################
### chunk number 7: 
###################################################
#line 276 "tests.Rnw"
t.test(expend~stature)


###################################################
### chunk number 8: 
###################################################
#line 288 "tests.Rnw"
library(lattice)
print(bwplot(expend~stature, data=energy))


###################################################
### chunk number 9: 
###################################################
#line 305 "tests.Rnw"
t.test(expend~stature, var.equal=TRUE)
t.test(expend~stature, var.equal=FALSE)


###################################################
### chunk number 10: 
###################################################
#line 316 "tests.Rnw"
var.test(expend~stature)


###################################################
### chunk number 11: 
###################################################
#line 339 "tests.Rnw"
library(ISwR)
attach(intake)
intake


###################################################
### chunk number 12: 
###################################################
#line 350 "tests.Rnw"
print(xyplot(pre~post, data=intake, type=c("o", "g"), pch=16))


###################################################
### chunk number 13: 
###################################################
#line 359 "tests.Rnw"


###################################################
### chunk number 14: 
###################################################
#line 368 "tests.Rnw"
t.test(pre, post)
t.test(pre, post, paired=TRUE)


###################################################
### chunk number 15: 
###################################################
#line 379 "tests.Rnw"
res <- t.test(pre, post, paired=TRUE)
class(res)
names(res)
res$p.value


###################################################
### chunk number 16: 
###################################################
#line 397 "tests.Rnw"


###################################################
### chunk number 17: 
###################################################
#line 406 "tests.Rnw"
apropos("test")


###################################################
### chunk number 18: 
###################################################
#line 418 "tests.Rnw"
qqnorm(react, main="reasonably normal")


###################################################
### chunk number 19: 
###################################################
#line 425 "tests.Rnw"
t.test(react)
t.test(react)$p.value < 0.05


###################################################
### chunk number 20: 
###################################################
#line 434 "tests.Rnw"
var.test(vital.capacity~group, data=vitcap)
t.test(vital.capacity~group, conf=0.99, data=vitcap)


###################################################
### chunk number 21: 
###################################################
#line 443 "tests.Rnw"
qqnorm(intake$post-intake$pre)


###################################################
### chunk number 22: 
###################################################
#line 450 "tests.Rnw"
boxplot(intake$pre, intake$post)


###################################################
### chunk number 23: 
###################################################
#line 457 "tests.Rnw"
hist(intake$post-intake$pre, prob=TRUE, col="light blue")
lines(density(intake$post-intake$pre), col="red")


###################################################
### chunk number 24: 
###################################################
#line 466 "tests.Rnw"
shapiro.test(react)
shapiro.test(react[-c(1, 334)])
qqnorm(react[-c(1, 334)])


###################################################
### chunk number 25: 
###################################################
#line 476 "tests.Rnw"
attach(ashina)
t.test(vas.active, vas.plac, paired=TRUE)
t.test((vas.active-vas.plac)[grp == 1], (vas.plac-vas.active)[grp == 2])


###################################################
### chunk number 26: 
###################################################
#line 486 "tests.Rnw"
t.test(rnorm(25))$p.value
t.test(rt(25, df=2))$p.value
t.test(rexp(25), mu=1)$p.value
x <- replicate(10000, t.test(rexp(25), mu=1)$p.value)
qqplot(sort(x), ppoints(10000), type="l", log="xy")


###################################################
### chunk number 27: 
###################################################
#line 498 "tests.Rnw"
t.test(daily, mu=7725)$p.value
tvalue <- tvalue <- (mean(daily) - 7725) / (sd(daily) / sqrt(length(daily)))
pt(tvalue, df=length(daily)-1) * 2


###################################################
### chunk number 28: 
###################################################
#line 508 "tests.Rnw"
sessionInfo()


