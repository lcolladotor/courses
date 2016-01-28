###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
args(sample)


###################################################
### chunk number 3: 
###################################################
x <- sample(x=0:10, size=20, replace=T)
y <- sample(x=0:10, size=20, replace=T, prob=c(.005, .008, .012, .015, .05, .1, .126, .129, .25, .18, .125))


###################################################
### chunk number 4:  eval=FALSE
###################################################
## table(x)
## table(y)


###################################################
### chunk number 5: 
###################################################
xx <- require(xtable)
xtable(t(table(x)), caption="Califs 1er caso")
xtable(t(table(y)), caption="Califs 2ndo caso")


###################################################
### chunk number 6: 
###################################################
mean(x)
mean(y)


###################################################
### chunk number 7: 
###################################################
pob <- 1:50
res <- NULL
for (i in 1:1000) {
	muestra <- sample(pob, size=i, replace=T)
	prueba <- length(unique(muestra)) / length(pob)
	if (prueba >= 1) {
		res <- c(res, 1)
	} else {
		res <- c(res, 0)
	}
}


###################################################
### chunk number 8:  eval=FALSE
###################################################
## plot(1:1000, res, col="blue", main="Una simulación", xlab="Tamaño de la muestra")
## lines(x=1:1000, y=rep(0.95,1000), col="red")


###################################################
### chunk number 9: 
###################################################
plot(1:1000, res, col="blue", main="Una simulación", xlab="Tamaño de la muestra")
lines(x=1:1000, y=rep(0.95,1000), col="red")


###################################################
### chunk number 10: 
###################################################
pob <- 1:10
res <- matrix(0, 100, 100)
for (i in 1:100) {
for (j in 1:100) {
	muestra <- sample(pob, size=j, replace=T)
	prueba <- length(unique(muestra)) / length(pob)
	if (prueba >= 1) {
		res[i,j] <- 1
	} 
}
}


###################################################
### chunk number 11:  eval=FALSE
###################################################
## plot(1:100, colMeans(res), col="blue", main="100 simulaciones", xlab="Tamaño de la muestra", ylab="Media de las 100 simulaciones")
## lines(x=1:100, y=rep(0.95,100), col="red")


###################################################
### chunk number 12: 
###################################################
plot(1:100, colMeans(res), col="blue", main="100 simulaciones", xlab="Tamaño de la muestra", ylab="Media de las 100 simulaciones")
lines(x=1:100, y=rep(0.95,100), col="red")


