###################################################
### chunk number 1: 
###################################################
t1 <- read.csv("http://www.lcg.unam.mx/~lcollado/B/data/SuppTable01_kogenome6_double_end-clone_1132_742.csv", header=T)
t2 <- read.csv("http://www.lcg.unam.mx/~lcollado/B/data/SuppTable06_nsSnp_AK1.csv", header=T)
library(lattice)
library(plotrix)


###################################################
### chunk number 2: 
###################################################
print(histogram(~bac_size | chrNo, data=t1))


###################################################
### chunk number 3: 
###################################################
max <- tapply(t2$position, t2$chr, max)
t2b <- t2
for (i in 1:length(max)) {
pos <- which(t2b$chr %in% names(max[i]))
t2b$position[pos] <- t2b$position[pos] / max[i]
}
print(densityplot(~position | chr, data=t2b))#$


###################################################
### chunk number 4: 
###################################################
pos <- which(t2b$chr %in% c("chrX", "chrY"))
print(densityplot(~position |  chr*AK1.allele, groups=reference.allele, data=t2b, subset=pos, auto.key=T)) #$


###################################################
### chunk number 5: 
###################################################
means <- tapply(t2$position, t2$chr, mean)
err <- tapply(t2$position, t2$chr, std.error)
plotCI(1:24, means, err, col="red", scol="blue", las=2, main="Position per chr with error bars")


###################################################
### chunk number 6: 
###################################################
df <- data.frame(G1=c(25, 5, 20), G2=c(30, 6, 22), G3=c(40, 6, 18))
df


###################################################
### chunk number 7: 
###################################################
barp(df,ylab="Values", names.arg=colnames(df),col=1:3)
addtable2plot(.45, 30,df,bty="o",display.rownames=TRUE,hlines=TRUE,title="Data in table format")


