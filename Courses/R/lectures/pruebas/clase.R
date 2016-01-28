###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
sample(1:20, size=10, replace=TRUE)


###################################################
### chunk number 3: 
###################################################
dunif(x=1, min=0, max=3)
punif(q=2, min=0, max=3)
qunif(p=1/2, min=0, max=3)
runif(n=1, min=0, max=3)


###################################################
### chunk number 4:  eval=FALSE
###################################################
## help.search("distribution", package ="stats")


###################################################
### chunk number 5: 
###################################################
dbinom(5, size=10, prob=1/2)


###################################################
### chunk number 6:  eval=FALSE
###################################################
## m <- 200; p <- 1/2; n <- c(5, 15, 25, 100)
## par(mfrow=c(2,2))
## for (i in 1:4) {
## res <- rbinom(m, n[i],  p)
## hist(res, prob=TRUE, main=n[i])
## }
## par(mfrow=c(1,1))


###################################################
### chunk number 7: 
###################################################
m <- 200; p <- 1/2; n <- c(5, 15, 25, 100)
par(mfrow=c(2,2)) -> xx
for (i in 1:4) {
res <- rbinom(m, n[i],  p)
hist(res, prob=TRUE, main=n[i])
}
par(mfrow=c(1,1)) -> xx


###################################################
### chunk number 8:  eval=FALSE
###################################################
## m <- 500
## res.25 <- c(); res.100 <- c(); res.400 <- c()
## f <- function(n) median(rexp(n))
## for(i in 1:m) res.25[i] <- f(25)
## for(i in 1:m) res.100[i] <- f(100)
## for(i in 1:m) res.400[i] <- f(400)
## plot(density(res.400), xlim = range(res.25), type="l", main="", xlab = "Medianas")
## lines(density(res.100))
## lines(density(res.25))


###################################################
### chunk number 9: 
###################################################
m <- 500
res.25 <- c(); res.100 <- c(); res.400 <- c()
f <- function(n) median(rexp(n))
for(i in 1:m) res.25[i] <- f(25)
for(i in 1:m) res.100[i] <- f(100)
for(i in 1:m) res.400[i] <- f(400)
plot(density(res.400), xlim = range(res.25), type="l", main="", xlab = "Distribuciones muestrales para la mediana con n=25, 100, 400", col="red")
lines(density(res.100), col="blue")
lines(density(res.25), col="forest green")
legend(1, 6, c("400", "100", "25"), col=c("red", "blue", "forest green"), lty=1)


###################################################
### chunk number 10: 
###################################################
library(UsingR)
data(bycatch)
hauls <- rep(bycatch$no.albatross, bycatch$no.hauls)
n <- length(hauls)
xbarstar <- c()
for (i in 1:1000) {
 boot.samp <- sample(hauls, n, replace = TRUE)
 xbarstar[i] <- mean(boot.samp)
}
mean(xbarstar)
sd(xbarstar) 


###################################################
### chunk number 11:  eval=FALSE
###################################################
## pop <- rep(0:1, c(10000 - 5600, 5600))
## res <- c()
## for (i in 1:1000) res[i] <- sum(sample(pop, 100))
## prop.test(mean(res), 100, conf.level = 0.95)


###################################################
### chunk number 12: 
###################################################
x <- c(175, 185, 170, 184, 175)
t.test(x, conf.level = 0.9, alt="less")


###################################################
### chunk number 13:  eval=FALSE
###################################################
## # Para resolverlo
## prop.test(x=c(560, 570), n=c(1000, 1200), conf.level=0.95)


###################################################
### chunk number 14:  eval=FALSE
###################################################
## x <- c(0, 0, 0, 2, 4, 5, 13, 14, 14, 14, 15, 17, 17)
## y <- c(0, 6, 7, 11, 13, 16, 16, 16, 17, 18)
## boxplot(list(placebo=x, medicina=y))
## t.test(x,y, var.equal=TRUE)


###################################################
### chunk number 15: 
###################################################
x <- c(0, 0, 0, 2, 4, 5, 13, 14, 14, 14, 15, 17, 17)
y <- c(0, 6, 7, 11, 13, 16, 16, 16, 17, 18)
boxplot(list(placebo=x, medicina=y), col="gray")
t.test(x,y, var.equal=TRUE) -> xx


###################################################
### chunk number 16: 
###################################################
x <- c(110, 12, 2.5, 98, 1017, 540, 54, 4.3, 150, 432) # Son datos de una muestra al azar de los top 200 CEOs en el 2000 en USA. Los números son 10 000 de USD en bonificaciones que les dieron.
n <- length(x)
j <- qbinom(0.05, n, 1/2)
sort(x)[c(j, n+1-j)] # Es el intervalo de confianza de 95%


###################################################
### chunk number 17:  eval=FALSE
###################################################
## boxplot(scale(x), scale(log(x)), names=c("CEO", "log.CEO"))


###################################################
### chunk number 18: 
###################################################
wilcox.test(log(x), conf.int=TRUE, conf.level = 0.9) -> xx
exp(xx$conf.int)


###################################################
### chunk number 19: 
###################################################
boxplot(scale(x), scale(log(x)), names=c("CEO", "log.CEO"), main="Boxplot de los datos de CEO y su log", col="gray")


###################################################
### chunk number 20: 
###################################################
prop.test(x=0.117*50000, n=50000, p=0.113, alt="greater") -> xx
xx$p.value


###################################################
### chunk number 21: 
###################################################
kpl <- c(11.4, 13.1, 14.7, 15, 15.5, 15.6, 15.9, 16, 16.8)
t.test(kpl, mu = 17, alt="less") -> xx
xx$p.value


###################################################
### chunk number 22: 
###################################################
llamadas <- c(2, 1, 3, 3, 3, 3, 1, 3, 16, 2, 2, 12, 20, 3, 1)
obs <- sum(llamadas > 5)
n <- length(llamadas)
1 - pbinom(n-obs-1, n, 1/2)


###################################################
### chunk number 23: 
###################################################
k <- max(obs, n - obs)
2 * (1 - pbinom(k-1, n, 1/2))


###################################################
### chunk number 24: 
###################################################
wilcox.test(log(salmon.rate), mu=log(0.005), alt="greater") -> xx
xx$p.value


###################################################
### chunk number 25: 
###################################################
phat <- c(.117, .121)
n <- c(50000, 60000)
prop.test(n*phat, n, alt="less") -> xx
xx$p.value


###################################################
### chunk number 26: 
###################################################
y <- table(samhda$amt.smoke[samhda$amt.smoke < 98])
p <- c(.15,.05,.05,.05,.10,.2,.4)
chisq.test(y, p=p) -> xx
xx$p.value


###################################################
### chunk number 27:  eval=FALSE
###################################################
## library(MASS)
## ?fitdistr


###################################################
### chunk number 28: 
###################################################
mayo <- c(2166, 1568, 2233, 1882, 2019)
sep <- c(2279, 2075, 2131, 2009, 1793)
dic <- c(2226, 2154, 2583, 2010, 2190)
d <- stack(list(mayo=mayo, sep=sep, dic=dic))
oneway.test(values ~ ind, data=d, var.equal=TRUE)


