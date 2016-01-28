###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
library(HTqPCR)


###################################################
### chunk number 3: 
###################################################
data(qPCRraw)
data(qPCRpros)


###################################################
### chunk number 4: 
###################################################
path <- system.file("exData", package="HTqPCR")
read.delim(file.path(path, "files.txt"))


###################################################
### chunk number 5: 
###################################################
g <- featureNames(raw)[1:10]
plotCtOverview(raw, genes=g, xlim=c(0,50), groups=files$Treatment, conf.int=TRUE, ylim=c(0,55))


###################################################
### chunk number 6: 
###################################################
plotCtCard(raw, col.range=c(10,35))


###################################################
### chunk number 7: 
###################################################
featureClass(raw) <- factor(c("Marker", "TF", "Kinase")[sample(c(1,1,2,2,1,3), 384, replace=TRUE)])
plotCtCard(raw, plot="class")


###################################################
### chunk number 8: 
###################################################
raw.cat <- setCategory(raw, groups=files$Treatment, quantile=0.8)


###################################################
### chunk number 9: 
###################################################
plotCtCategory(raw.cat)


###################################################
### chunk number 10: 
###################################################
q.norm <- normalizeCtData(raw.cat, norm="quantile")
sr.norm <- normalizeCtData(raw.cat, norm="scale.rank")
nr.norm <- normalizeCtData(raw.cat, norm="norm.rank")
d.norm <- normalizeCtData(raw.cat, norm="deltaCt", deltaCt.genes=c("Gene1", "Gene60"))


###################################################
### chunk number 11: 
###################################################
col <- rep(brewer.pal(6, "Spectral"), each=384)
par(mfrow=c(2,2), mar=c(2,2,2,1))
plot(exprs(raw), exprs(q.norm), pch=20, main="Quantile normalisation", col=col)
plot(exprs(raw), exprs(sr.norm), pch=20, main="Rank invariant scaling", col=col)
plot(exprs(raw), exprs(nr.norm), pch=20, main="Rank invariant normalisation", col=col)
plot(exprs(raw), exprs(d.norm), pch=20, main="deltaCt normalisation", col=col)


###################################################
### chunk number 12: 
###################################################
nr.norm[1:10,]


###################################################
### chunk number 13: 
###################################################
qFilt <- filterCtData(nr.norm, remove.type="Endogenous Control")
qFilt <- filterCtData(nr.norm, remove.name=c("Gene1", "Gene20", "Gene30"))
qFilt <- filterCtData(nr.norm, remove.class="Kinase")
qFilt <- filterCtData(nr.norm, remove.type=c("Endogenous Control"), remove.name=c("Gene1", "Gene20", "Gene30"))


###################################################
### chunk number 14: 
###################################################
plotCtCor(raw, main="Ct correlation")


###################################################
### chunk number 15: 
###################################################
summary(raw)


###################################################
### chunk number 16: 
###################################################
par(mfrow=c(1,2))
plotCtDensity(sr.norm)
plotCtHistogram(sr.norm)


###################################################
### chunk number 17: 
###################################################
clusterCt(sr.norm, type="genes", n.cluster=6, cex=0.5)


###################################################
### chunk number 18: 
###################################################
c6 <- cluster.list[[6]]
sr.norm[c6,]


###################################################
### chunk number 19: 
###################################################
cluster.list <- clusterCt(sr.norm, type="genes", n.cluster=6, cex=0.5)


