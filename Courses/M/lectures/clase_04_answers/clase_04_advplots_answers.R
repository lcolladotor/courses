###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
library(lattice)
t2 <- read.csv("http://www.lcg.unam.mx/~lcollado/B/data/SuppTable06_nsSnp_AK1.csv", header=T)
print(densityplot(~position | chr, data = t2))


###################################################
### chunk number 3: 
###################################################
sub <- subset (t2, chr == "chrY" | chr == "chrX")
print(densityplot(~position | chr + reference.allele, group = AK1.allele, data = sub, auto.key=T, type = c("p", "g")))


###################################################
### chunk number 4: 
###################################################
cuales <- t2$chr %in% c("chrX", "chrY")
print(densityplot(~position | chr + reference.allele, group = AK1.allele, data = t2, subset = cuales, auto.key=T, type = c("p", "g")))


###################################################
### chunk number 5: 
###################################################
library(plotrix)
means <- tapply(t2$position, t2$chr, mean)
err <- tapply(t2$position, t2$chr, std.error)
plotCI(1:24, means, err, col="red", scol="blue", las=2, main="Posición por cromosoma")


###################################################
### chunk number 6: 
###################################################
sessionInfo()


