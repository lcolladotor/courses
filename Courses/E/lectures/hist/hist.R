###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
set1 <- rnorm(1000)
set2 <- runif(1000)


###################################################
### chunk number 3: 
###################################################
plot(set1)



###################################################
### chunk number 4:  eval=FALSE
###################################################
## ?hist
## hist(set1)


###################################################
### chunk number 5: 
###################################################
hist(set1)


###################################################
### chunk number 6:  eval=FALSE
###################################################
## hist(faithful$waiting, col="light blue", main="Histograma de faithful$waiting", xlab="Tiempo de espera entre erupciones", ylab="Probabilidad", prob=T)


###################################################
### chunk number 7: 
###################################################
hist(faithful$waiting, col="light blue", main="Histograma de faithful$waiting", xlab="Tiempo de espera entre erupciones", ylab="Probabilidad", prob=T)


###################################################
### chunk number 8:  eval=FALSE
###################################################
## par(mfrow=c(1,2))
## hist(set1, prob=T)
## hist(set2, prob=T)
## par(mfrow=c(1,1))


###################################################
### chunk number 9: 
###################################################
par(mfrow=c(1,2))
hist(set1, prob=T)
hist(set2, prob=T)


###################################################
### chunk number 10:  eval=FALSE
###################################################
## hist(faithful$waiting, prob=TRUE, ylab="Prob", col="light blue")
## lines(density(faithful$waiting), col="red")
## 
## set3 <- runif(100, 40, 70)
## hist(faithful$waiting, prob=TRUE, ylab="Prob", col="light blue")
## lines(density(set3), col="red")


###################################################
### chunk number 11: 
###################################################
hist(faithful$waiting, prob=TRUE, ylab="Prob", col="light blue")
lines(density(faithful$waiting), col="red")


###################################################
### chunk number 12: 
###################################################
set3 <- runif(100, 40, 70)
hist(faithful$waiting, prob=TRUE, ylab="Prob", col="light blue")
lines(density(set3), col="red")


###################################################
### chunk number 13:  eval=FALSE
###################################################
## plot(0, 0, ylim=c(0,1), xlim=c(min(set1), max(set1)))
## lines(density(set1), col="red")
## lines(density(set2), col="blue")


###################################################
### chunk number 14: 
###################################################
plot(0, 0, ylim=c(0,1), xlim=c(min(set1), max(set1)))
lines(density(set1), col="red")
lines(density(set2), col="blue")


###################################################
### chunk number 15:  eval=FALSE
###################################################
## qqplot(set1, set1)
## qqplot(set1, set2)


###################################################
### chunk number 16: 
###################################################
qqplot(set1, set1)


###################################################
### chunk number 17: 
###################################################
qqplot(set1, set2)


###################################################
### chunk number 18:  eval=FALSE
###################################################
## set4 <- rchisq(100, 3)
## qqnorm(set4)
## qqnorm(set1)


###################################################
### chunk number 19: 
###################################################
set4 <- rchisq(100,3)
qqnorm(set4)


###################################################
### chunk number 20: 
###################################################
qqnorm(set1)


