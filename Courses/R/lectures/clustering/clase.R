###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
library("ALL")
data(ALL)


###################################################
### chunk number 3:  eval=FALSE
###################################################
## ALL


###################################################
### chunk number 4: 
###################################################
ALL$mol.biol[1:10]


###################################################
### chunk number 5: 
###################################################
eset <- ALL[, ALL$mol.biol %in% c("BCR/ABL", "ALL1/AF4")]


###################################################
### chunk number 6: 
###################################################
library(limma)
f <- factor(as.character(eset$mol.biol))
design <- model.matrix(~f)
fit <- eBayes(lmFit(eset,design))


###################################################
### chunk number 7: 
###################################################
topTable(fit, coef=2)


###################################################
### chunk number 8: 
###################################################
selected  <- p.adjust(fit$p.value[, 2]) <0.05
esetSel <- eset [selected, ]


###################################################
### chunk number 9:  eval=FALSE
###################################################
## heatmap(exprs(esetSel))


###################################################
### chunk number 10: 
###################################################
heatmap(exprs(esetSel))


###################################################
### chunk number 11:  eval=FALSE
###################################################
## heatmap(exprs(esetSel), col=topo.colors(100))


###################################################
### chunk number 12: 
###################################################
color.map <- function(mol.biol) { if (mol.biol=="ALL1/AF4") "#FF0000" else "#0000FF" }
patientcolors <- unlist(lapply(esetSel$mol.bio, color.map))


###################################################
### chunk number 13: 
###################################################
heatmap(exprs(esetSel), col=topo.colors(100))


###################################################
### chunk number 14:  eval=FALSE
###################################################
## heatmap(exprs(esetSel), col=topo.colors(100), ColSideColors=patientcolors, cexRow=0.5)


###################################################
### chunk number 15: 
###################################################
heatmap(exprs(esetSel), col=topo.colors(100), ColSideColors=patientcolors, cexRow=0.5)


###################################################
### chunk number 16: 
###################################################
mydata <- read.delim("http://www.lcg.unam.mx/~lcollado/R/data/GSE1110/GSE1110clean.txt", header=T, sep="\t")


###################################################
### chunk number 17: 
###################################################
rownames(mydata) <- mydata[,1]
mydata <- as.matrix(mydata[,-1])


###################################################
### chunk number 18: 
###################################################
mydata <- mydata[apply(mydata>100, 1, sum)/length(mydata[1,])>0.5 & apply(log2(mydata), 1, IQR)>1.5,]


###################################################
### chunk number 19: 
###################################################
source("http://faculty.ucr.edu/~tgirke/Documents/R_BioCond/My_R_Scripts/my.colorFct.R")


###################################################
### chunk number 20: 
###################################################
mydatascale <- t(scale(t(mydata)))


###################################################
### chunk number 21: 
###################################################
hr <- hclust(as.dist(1-cor(t(mydatascale), method="pearson")), method="complete") # Cluster rows by Pearson correlation.
hc <- hclust(as.dist(1-cor(mydatascale, method="spearman")), method="complete") # Clusters columns by Spearman correlation.


###################################################
### chunk number 22:  eval=FALSE
###################################################
## plot(as.dendrogram(hr))
## plot(as.dendrogram(hc))
## heatmap(mydata, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=my.colorFct(), scale="row")


###################################################
### chunk number 23:  eval=FALSE
###################################################
## attributes(hr)


###################################################
### chunk number 24: 
###################################################
plot(as.dendrogram(hr))


###################################################
### chunk number 25: 
###################################################
plot(as.dendrogram(hc))


###################################################
### chunk number 26: 
###################################################
heatmap(mydata, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=my.colorFct(), scale="row")


###################################################
### chunk number 27: 
###################################################
mycl <- cutree(hr, h=max(hr$height)/1.5)
mycolhc <- sample(rainbow(256))
mycolhc <- mycolhc[as.vector(mycl)]


###################################################
### chunk number 28:  eval=FALSE
###################################################
## heatmap(mydata, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=my.colorFct(), scale="row", RowSideColors=mycolhc)


###################################################
### chunk number 29: 
###################################################
heatmap(mydata, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc), col=my.colorFct(), scale="row", RowSideColors=mycolhc)


