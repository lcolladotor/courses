###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
x <- 1:100
y <- (1:100)^2


###################################################
### chunk number 3:  eval=FALSE
###################################################
## plot(x, y)


###################################################
### chunk number 4: 
###################################################
plot(x, y)


###################################################
### chunk number 5:  eval=FALSE
###################################################
## plot(x, y, main="Una exponencial", ylab="Valores en Y", xlab="Valores en X", col="blue", type="l")


###################################################
### chunk number 6: 
###################################################
plot(x, y, main="Una exponencial", ylab="Valores en Y", xlab="Valores en X", col="blue", type="l")


###################################################
### chunk number 7: 
###################################################
res <- NULL
for (i in 1:10) {
	if (i == 1) {
		res <- c(res, runif(1, 0, 10))
	} else {
		res <- c(res, res[i-1] ^ (1/i))
	}
}


###################################################
### chunk number 8:  eval=FALSE
###################################################
## plot (1:10, res, main="Recordando el for", type="o", ylim=c(0,10), col="forestgreen")


###################################################
### chunk number 9: 
###################################################
plot (1:10, res, main="Recordando el for", type="o", ylim=c(0,10), col="forestgreen")


###################################################
### chunk number 10: 
###################################################
res.k <- NULL
for (k in 2:100) {
	res.h <- NULL
	for (h in 1:1000) {
		no.salir <- NULL
		for (i in 1:k) { no.salir <- c(no.salir, (1- 1/k) ^ h)}
		res.h <- c(res.h, 1- ( sum(no.salir) / (k-1) ) )
	}
	res.k <- c(res.k, which(res.h >= 0.95)[1])
}
head(res.k)


###################################################
### chunk number 11:  eval=FALSE
###################################################
## plot(res.h, lty=2, xlab="H", ylab="Prob.", main="Hs para una K", col="blue") #prob de que salgan todos al menos 1 vez
## plot(res.k, 2:100, xlab="H determinante", ylab="K", main="H determinantes para un barrido de Ks", col="blue")


###################################################
### chunk number 12: 
###################################################
plot(res.h, lty=2, xlab="H", ylab="Prob.", main="Hs para una K", col="blue") #prob de que salgan todos al menos 1 vez


###################################################
### chunk number 13: 
###################################################
plot(res.k, 2:100, xlab="H determinante", ylab="K", main="H determinantes para un barrido de Ks", col="blue")


