###################################################
### chunk number 1: 
###################################################
#line 50 "reg.Rnw"
options(width=40)


###################################################
### chunk number 2: 
###################################################
#line 126 "reg.Rnw"
library(ISwR)
attach(thuesen)
lm(short.velocity ~ blood.glucose)


###################################################
### chunk number 3: 
###################################################
#line 138 "reg.Rnw"
lm1 <- lm(short.velocity ~ blood.glucose)
class(lm1)
names(lm1)
summary(lm1)


###################################################
### chunk number 4: 
###################################################
#line 150 "reg.Rnw"
plot(blood.glucose, short.velocity)
abline(lm1, col="blue")


###################################################
### chunk number 5: 
###################################################
#line 163 "reg.Rnw"
thu2 <- thuesen[ complete.cases(thuesen), ]
lm2 <- lm(short.velocity ~ blood.glucose, data= thu2)


###################################################
### chunk number 6: 
###################################################
#line 172 "reg.Rnw"
plot( fitted(lm2), resid(lm2) )


###################################################
### chunk number 7: 
###################################################
#line 179 "reg.Rnw"
qqnorm( resid(lm2) )


###################################################
### chunk number 8: 
###################################################
#line 203 "reg.Rnw"
predict(lm2, interval = "confidence")
predict(lm2, interval = "prediction")


###################################################
### chunk number 9: 
###################################################
#line 212 "reg.Rnw"
mat1 <- predict(lm2, int = "c")
mat2 <- predict(lm2, int = "p")
mat <- cbind(mat1, mat2)
matplot(mat, type="l")
points( blood.glucose, short.velocity)


###################################################
### chunk number 10: 
###################################################
#line 225 "reg.Rnw"
new <- data.frame(blood.glucose=4:20)
pp <- predict(lm2, int="p", newdata=new)
pc <- predict(lm2, int="c", newdata=new)


###################################################
### chunk number 11: 
###################################################
#line 235 "reg.Rnw"
plot( blood.glucose, short.velocity, ylim=range(short.velocity, pp, na.rm=T), pch=19, col="forest green" )
pred.gluc <- new$blood.glucose
matlines(pred.gluc, pc, lty=c(1, 2, 2), col=c("black", "red", "red"), lwd=2)
matlines(pred.gluc, pp, lty=c(1, 3, 3), col=c("black", "blue", "blue"), lwd=2)


###################################################
### chunk number 12: 
###################################################
#line 251 "reg.Rnw"
library(ISwR)
fit <- lm(metabolic.rate ~ body.weight, data=rmr)
summary(fit)
811.2267 + 7.0595 * 70
predict(fit, newdata=data.frame(body.weight = 70))
qt(.975, 42)
7.0595 + c(1, -1) * 2.018 * 0.9776
confint(fit)


###################################################
### chunk number 13: 
###################################################
#line 268 "reg.Rnw"
summary(lm(sqrt(igf1) ~ age, data = juul, subset=age>25))


###################################################
### chunk number 14: 
###################################################
#line 278 "reg.Rnw"
lmal <- lm(log(ab) ~ age, data = malaria)
summary(lmal)


###################################################
### chunk number 15: 
###################################################
#line 287 "reg.Rnw"
new <- data.frame(age=2:16)
pp <- predict(lmal, int="p", newdata=new)
pc <- predict(lmal, int="c", newdata=new)
pred <- new$age

plot(log(ab) ~ age, data = malaria, col="light blue", pch=19)
matlines(pred, pc, lty=c(1, 2, 2), col=c("black", "red", "red"), lwd=2)
matlines(pred, pp, lty=c(1, 3, 3), col=c("black", "blue", "blue"), lwd=2)


###################################################
### chunk number 16: 
###################################################
#line 302 "reg.Rnw"
sessionInfo()


