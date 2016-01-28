###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
rnas <- read.csv("http://www.lcg.unam.mx/~lcollado/E/data/rnas.csv", header=T, row.names=1)


###################################################
### chunk number 3: 
###################################################
rnas2 <- rnas[c(1, 5, 14, 17, 18, 21, 26, 27, 28, 29),]


###################################################
### chunk number 4:  eval=FALSE
###################################################
## ?pie


###################################################
### chunk number 5:  eval=FALSE
###################################################
## pie(rnas2[,1], labels= rownames(rnas2), col=rainbow(10), cex=0.6, main="Total")


###################################################
### chunk number 6: 
###################################################
pie(rnas2[,1], labels= rownames(rnas2), col=rainbow(10), cex=0.6, main="Total")


###################################################
### chunk number 7:  eval=FALSE
###################################################
## pie(rnas2[,1], labels= NA, col=rainbow(10), main="Total")
## legend("bottom", rownames(rnas2), col=rainbow(10), xpd=T, inset=-0.15, pch=20, cex=0.7, ncol=3)


###################################################
### chunk number 8: 
###################################################
pie(rnas2[,1], labels= NA, col=rainbow(10), main="Total")
legend("bottom", rownames(rnas2), col=rainbow(10), xpd=T, inset=-0.15, pch=20, cex=0.7, ncol=3)


###################################################
### chunk number 9: 
###################################################
mirnas <- read.csv("http://www.lcg.unam.mx/~lcollado/E/data/mirnas.csv", header=T, row.names=1)


###################################################
### chunk number 10: 
###################################################
head(unclass(mirnas[,1]))


###################################################
### chunk number 11: 
###################################################
head(which(unclass(mirnas[,1]) == 1))


###################################################
### chunk number 12: 
###################################################
res <- NULL
for (j in 2:6) {
temp <- NULL
for (i in 1:4) { temp <- c(temp, sum(mirnas[which(unclass(mirnas[,1]) ==i),j])) }
res <- cbind(res, temp/sum(temp))
}


###################################################
### chunk number 13: 
###################################################
dimnames(res)[[1]] <- c("A", "C", "G", "U")
dimnames(res)[[2]] <- colnames(mirnas)[2:6]


###################################################
### chunk number 14:  eval=FALSE
###################################################
## barplot(res, ylim=c(0,1), col=rainbow(4), main="miRNAs")
## legend("bottom", dimnames(res)[[1]], pch=20, col=rainbow(4), inset = -0.2, ncol=4, xpd=T)


###################################################
### chunk number 15: 
###################################################
barplot(res, ylim=c(0,1), col=rainbow(4), main="miRNAs")
legend("bottom", dimnames(res)[[1]], pch=20, col=rainbow(4), inset = -0.2, ncol=4, xpd=T)


###################################################
### chunk number 16:  eval=FALSE
###################################################
## barplot(res, beside=T, ylim=c(0,1), col=rainbow(4), main="miRNAs")
## legend("topright", dimnames(res)[[1]], pch=20, col=rainbow(4))


###################################################
### chunk number 17: 
###################################################
barplot(res, beside=T, ylim=c(0,1), col=rainbow(4), main="miRNAs")
legend("topright", dimnames(res)[[1]], pch=20, col=rainbow(4))


###################################################
### chunk number 18:  eval=FALSE
###################################################
## ?mosaicplot


###################################################
### chunk number 19:  eval=FALSE
###################################################
## mosaicplot(t(res), main="Mosaic plot de miRNAs", col=rainbow(4))
## legend("bottom", dimnames(res)[[1]], pch=20, col=rainbow(4), inset = -0.2, ncol=4, xpd=T)


###################################################
### chunk number 20: 
###################################################
mosaicplot(t(res), main="Mosaic plot de miRNAs", col=rainbow(4))
legend("bottom", dimnames(res)[[1]], pch=20, col=rainbow(4), inset = -0.2, ncol=4, xpd=T)


###################################################
### chunk number 21: 
###################################################
colSums(res)


###################################################
### chunk number 22: 
###################################################
res2 <- NULL
for (j in 3:6) {
temp <- NULL
for (i in 1:4) { temp <- c(temp, sum(mirnas[which(unclass(mirnas[,1]) ==i),j])) }
res2 <- cbind(res2, temp) #  
}
dimnames(res2)[[1]] <- c("A", "C", "G", "U")
dimnames(res2)[[2]] <- colnames(mirnas)[3:6]
colSums(res2)


###################################################
### chunk number 23: 
###################################################
ncol(res) == ncol(res2)


###################################################
### chunk number 24:  eval=FALSE
###################################################
## mosaicplot(t(res2), main="Mosaic plot de miRNAs", col=rainbow(4), las=2)
## legend("bottom", dimnames(res)[[1]], pch=20, col=rainbow(4), inset = -0.2, ncol=4, xpd=T)


###################################################
### chunk number 25: 
###################################################
mosaicplot(t(res2), main="Mosaic plot de miRNAs", col=rainbow(4), las=2)
legend("bottom", dimnames(res)[[1]], pch=20, col=rainbow(4), inset = -0.2, ncol=4, xpd=T)


