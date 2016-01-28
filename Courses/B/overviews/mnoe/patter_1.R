###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################

library(splicegear)


###################################################
### chunk number 3: 
###################################################
data(spliceset)
plot(spliceset)


###################################################
### chunk number 4: 
###################################################
data(spsites)
plot(spsites)
data(probes)
plot(probes)


###################################################
### chunk number 5: 
###################################################
data(eset, package="splicegear")
data(probes, package="splicegear")
data(spsites, package="splicegear")
spliset <- new("SpliceExprSet", eset=eset,
probes=probes, spliceSites=spsites)
plot(spliset)


###################################################
### chunk number 6: 
###################################################
seq.length <- as.integer(10)
spsiteIpos <- matrix(c(1, 3.5, 5, 9, 3, 4, 8, 10), nc=2)
variants <- list(a=c(1,2,3,4), b=c(1,2,3), c=c(1,3,4))
spvar <- new("SpliceSitesGenomic", spsiteIpos=spsiteIpos,
variants=variants, seq.length=seq.length)
plot(spvar)


###################################################
### chunk number 7: 
###################################################
n.exons <- nrow(spsiteIpos)
par(mfrow = c(3,1), mar = c(3.1, 2.1, 2.1, 1.1))
plot(spvar, split=TRUE, col.exon=rainbow(n.exons))


###################################################
### chunk number 8: 
###################################################
library(XML)
filename <- system.file("data", "example.xml", package="splicegear")
xml <- xmlTreeParse(filename, asTree=TRUE)
spsites <- buildSpliceSites(xml)


###################################################
### chunk number 9: 
###################################################
data(spliceset)
dataf <- as.data.frame(spliceset)
lm.panel <- function(x, y, ...) {
points(x,y,...)
p.lm <- lm(y~x); abline(p.lm)
}


###################################################
### chunk number 10: 
###################################################
coplot(log(exprs) ~ Material | begin, data=dataf, panel=lm.panel)



