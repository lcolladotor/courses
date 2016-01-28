###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
library(limma)
targets <- readTargets("SwirlSample.txt")
targets


###################################################
### chunk number 3: 
###################################################
RG <- read.maimages(targets$FileName, source="spot")


###################################################
### chunk number 4:  eval=FALSE
###################################################
## RG


###################################################
### chunk number 5: 
###################################################
RG$genes <- readGAL("fish.gal")


###################################################
### chunk number 6: 
###################################################
RG$printer <- getLayout(RG$genes)


###################################################
### chunk number 7:  eval=FALSE
###################################################
## imageplot(log2(RG$Rb[,1]), RG$printer, low="white", high="red")
## imageplot(log2(RG$Gb[,1]), RG$printer, low="white", high="green")


###################################################
### chunk number 8: 
###################################################
imageplot(log2(RG$Rb[,1]), RG$printer, low="white", high="red")


###################################################
### chunk number 9: 
###################################################
imageplot(log2(RG$Gb[,1]), RG$printer, low="white", high="green")


###################################################
### chunk number 10: 
###################################################
MA <- normalizeWithinArrays(RG, method="none")


###################################################
### chunk number 11:  eval=FALSE
###################################################
## imageplot(MA$M[,1], RG$printer, zlim=c(-3,3))


###################################################
### chunk number 12: 
###################################################
imageplot(MA$M[,1], RG$printer, zlim=c(-3,3))


###################################################
### chunk number 13:  eval=FALSE
###################################################
## plotMA(MA)


###################################################
### chunk number 14: 
###################################################
plotMA(MA)


###################################################
### chunk number 15:  eval=FALSE
###################################################
## plotPrintTipLoess(MA)


###################################################
### chunk number 16: 
###################################################
plotPrintTipLoess(MA)


###################################################
### chunk number 17: 
###################################################
MA <- normalizeWithinArrays(RG)


###################################################
### chunk number 18:  eval=FALSE
###################################################
## plotPrintTipLoess(MA)


###################################################
### chunk number 19: 
###################################################
plotPrintTipLoess(MA)


###################################################
### chunk number 20:  eval=FALSE
###################################################
## boxplot(MA$M~col(MA$M),names = colnames(MA$M))


###################################################
### chunk number 21: 
###################################################
boxplot(MA$M~col(MA$M),names = colnames(MA$M))


###################################################
### chunk number 22: 
###################################################
MA <- normalizeBetweenArrays(MA,method="scale")


###################################################
### chunk number 23:  eval=FALSE
###################################################
## boxplot(MA$M~col(MA$M),names=colnames(MA$M))


###################################################
### chunk number 24: 
###################################################
boxplot(MA$M~col(MA$M),names=colnames(MA$M))


###################################################
### chunk number 25: 
###################################################
design <- c(-1,1,-1,1)


###################################################
### chunk number 26: 
###################################################
fit <- lmFit(MA,design)


###################################################
### chunk number 27:  eval=FALSE
###################################################
## fit


###################################################
### chunk number 28: 
###################################################
ordinary.t <- fit$coef / fit$stdev.unscaled / fit$sigma


###################################################
### chunk number 29:  eval=FALSE
###################################################
## plotMA(fit)
## abline(0,0,col="blue")


###################################################
### chunk number 30: 
###################################################
plotMA(fit)
abline(0,0,col="blue")


###################################################
### chunk number 31: 
###################################################
fit <- eBayes(fit)


###################################################
### chunk number 32:  eval=FALSE
###################################################
## qqt(fit$t,df=fit$df.prior+fit$df.residual,pch=16,cex=0.2)
## abline(0,1)


###################################################
### chunk number 33: 
###################################################
qqt(fit$t,df=fit$df.prior+fit$df.residual,pch=16,cex=0.2)
abline(0,1)


###################################################
### chunk number 34:  eval=FALSE
###################################################
## options(digits=3) #para no tener tantos decimales. Es de R basico.
## topTable(fit,number=30,adjust="BH")


###################################################
### chunk number 35: 
###################################################
topTable(fit,number=1,adjust="BH")


###################################################
### chunk number 36:  eval=FALSE
###################################################
## plotMA(fit)
## ord <- order(fit$lods,decreasing=TRUE)
## top30 <- ord[1:30]
## text(fit$Amean[top30],fit$coef[top30],labels=fit$genes[top30,"Name"],cex=0.8,col="blue")


###################################################
### chunk number 37: 
###################################################
plotMA(fit)
ord <- order(fit$lods,decreasing=TRUE)
top30 <- ord[1:30]
text(fit$Amean[top30],fit$coef[top30],labels=fit$genes[top30,"Name"],cex=0.8,col="blue")


###################################################
### chunk number 38: 
###################################################
library(affy); library(limma); library(gcrma) # Loads required libraries.
targets <- readTargets("targets.txt") # Import targets information.
data <- ReadAffy(filenames=targets$FileName) # Import expression raw data and stores them as AffyBatch object.


###################################################
### chunk number 39: 
###################################################
eset_rma <- rma(data)


###################################################
### chunk number 40:  eval=FALSE
###################################################
## boxplot(data, col="red", main="Raw Data")
## boxplot(data.frame(exprs(eset_rma)), col="blue", main="RMA Normalized Data")


###################################################
### chunk number 41: 
###################################################
boxplot(data, col="red", main="Raw Data")


###################################################
### chunk number 42: 
###################################################
boxplot(data.frame(exprs(eset_rma)), col="blue", main="RMA Normalized Data")


###################################################
### chunk number 43: 
###################################################
design <- model.matrix(~ -1+factor(c(1,1,1,2,2,2,3,3,3)))
colnames(design) <- c("S1", "S2", "S3")


###################################################
### chunk number 44: 
###################################################
contrast.matrix <- makeContrasts(S2-S1, S3-S2, S3-S1, levels=design)
fit <- lmFit(eset_rma, design)


###################################################
### chunk number 45: 
###################################################
fit2 <- contrasts.fit(fit, contrast.matrix) 
fit2 <- eBayes(fit2)


###################################################
### chunk number 46: 
###################################################
rma_deg_result <- topTable(fit2, coef=1, adjust="fdr", sort.by="B", number=50000)
rma_deg_result <- rma_deg_result[rma_deg_result$adj.P.Val<=0.05,]
write.table(rma_deg_result, "rma_deg_result.xls", quote=FALSE, row.names=FALSE, sep="\t")


###################################################
### chunk number 47: 
###################################################
rma_venn <- decideTests(fit2, p.value=0.05)


###################################################
### chunk number 48:  eval=FALSE
###################################################
## vennDiagram(rma_venn)


###################################################
### chunk number 49: 
###################################################
vennDiagram(rma_venn)


###################################################
### chunk number 50: 
###################################################
## (A) Normalization: GCRMA
eset_gcrma <- gcrma(data) # Normalizes the data with 'gcrma' function and assigns them to exprSet object.
## (B) DEG Analysis for GCRMA Data
fit <- lmFit(eset_gcrma, design) # Fits a linear model for each gene based on the given series of arrays.
fit2 <- contrasts.fit(fit, contrast.matrix) # Computes estimated coefficients and standard errors for a given set of contrasts.
fit2 <- eBayes(fit2) # Computes moderated t-statistics and log-odds of differential expression by empirical Bayes shrinkage of the standard errors towards a common value.
gcrma_deg_result <- topTable(fit2, coef=1, adjust="fdr", sort.by="B", number=50000)
gcrma_deg_result <- gcrma_deg_result[gcrma_deg_result$adj.P.Val<=0.05,]
write.table(gcrma_deg_result, "gcrma_deg_result.xls", quote=FALSE, row.names=FALSE, sep="\t")
## (C) Create Venn Diagram for GCRMA Data
gcrma_venn <- decideTests(fit2, p.value=0.05)


###################################################
### chunk number 51: 
###################################################
eset_mas5 <- mas5(data)
exprs(eset_mas5) <- log2(exprs(eset_mas5))


###################################################
### chunk number 52: 
###################################################
fit <- lmFit(eset_mas5, design) # Fits a linear model for each gene based on the given series of arrays.
fit2 <- contrasts.fit(fit, contrast.matrix) # Computes estimated coefficients and standard errors for a given set of contrasts.
fit2 <- eBayes(fit2) # Computes moderated t-statistics and log-odds of differential expression by empirical Bayes shrinkage of the standard errors towards a common value.
mas5_deg_result <- topTable(fit2, coef=1, adjust="fdr", sort.by="B", number=50000)
mas5_deg_result <- mas5_deg_result[mas5_deg_result$adj.P.Val<=0.05,]
write.table(mas5_deg_result, "mas5_deg_result.xls", quote=FALSE, row.names=FALSE, sep="\t")
## (C) Create Venn Diagram for MAS5 Data
mas5_venn <- decideTests(fit2, p.value=0.05)


###################################################
### chunk number 53: 
###################################################
vennDiagram(gcrma_venn)


###################################################
### chunk number 54: 
###################################################
vennDiagram(mas5_venn)


###################################################
### chunk number 55: 
###################################################
overlap2 <-(merge(rma_deg_result, gcrma_deg_result, by.x = "ID", by.y = "ID", all = FALSE))
overlap3 <-(merge(overlap2, mas5_deg_result, by.x = "ID", by.y = "ID", all = FALSE))
write.table(overlap3, "overlap.xls", quote=FALSE, row.names=FALSE, sep="\t")


###################################################
### chunk number 56: 
###################################################
library(mcmc)
h <- function(x) if (all(x >= 0) && sum(x) <= 1) return(1) else return(-Inf)


###################################################
### chunk number 57: 
###################################################
out <- metrop(h, rep(0, 5), 1000)


###################################################
### chunk number 58: 
###################################################
out$accept


###################################################
### chunk number 59: 
###################################################
out <- metrop(out, scale = 0.1)
out$accept


###################################################
### chunk number 60:  eval=FALSE
###################################################
## plot(out$batch[ , 1])


###################################################
### chunk number 61: 
###################################################
plot(out$batch[ , 1])


###################################################
### chunk number 62: 
###################################################
out <- metrop(out, nbatch = 1e4)
out$accept


###################################################
### chunk number 63:  eval=FALSE
###################################################
## plot(out$batch[ , 1])
## hist(out$batch[ , 1])


###################################################
### chunk number 64: 
###################################################
hist(out$batch[ , 1])


###################################################
### chunk number 65:  eval=FALSE
###################################################
## help(package = "RMySQL")


###################################################
### chunk number 66: 
###################################################
library(RMySQL)


###################################################
### chunk number 67:  eval=FALSE
###################################################
## con <- dbConnect(MySQL(), user="lcollado", password="LOL", dbname="BPdB", host="kabah.lcg.unam.mx")


###################################################
### chunk number 68:  eval=FALSE
###################################################
## dbDisconnect(con)


###################################################
### chunk number 69: 
###################################################
con <- dbConnect(MySQL(), user="lcollado", password="LOL", dbname="BPdB", host="kabah.lcg.unam.mx")


###################################################
### chunk number 70: 
###################################################
dbListTables(con)
d <- dbReadTable(con, "phage")


###################################################
### chunk number 71: 
###################################################
library(lattice)
table(factor(d$phage_topology))


###################################################
### chunk number 72:  eval=FALSE
###################################################
## densityplot( ~d$phage_gc_content | factor(d$phage_topology))
## qqmath( ~d$phage_gc_content | factor(d$phage_topology))


###################################################
### chunk number 73: 
###################################################
pdf(file="lattice1.pdf", height=5.7)
densityplot( ~d$phage_gc_content | factor(d$phage_topology))
dev.off()-> xx


###################################################
### chunk number 74: 
###################################################
pdf(file="lattice2.pdf", height=5.7)
qqmath( ~d$phage_gc_content | factor(d$phage_topology))
dev.off()-> xx


###################################################
### chunk number 75:  eval=FALSE
###################################################
## bwplot( d$phage_gc_content ~ factor(d$phage_topology))


###################################################
### chunk number 76: 
###################################################
dbDisconnect(con)


