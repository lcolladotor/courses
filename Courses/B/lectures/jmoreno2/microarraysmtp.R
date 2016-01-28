###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite("affy")
## biocLite("limma")
## biocLite("genefilter")
## biocLite("annaffy")
## biocLite("KEGG.db")
## biocLite("GO.db")
## biocLite("hgu133a2.db")
## biocLite("SpeCond")
## install.packages("multtest")


###################################################
### chunk number 3: 
###################################################
library(affy)
library(ArrayExpress)
Data = ArrayExpress("E-MEXP-1422", save = T)
pd<-read.AnnotatedDataFrame(filename="pdata1422rep.txt", header=T)
pData(pd)
slot(Data, "phenoData")<-pd
pData(slot(Data, "phenoData"))
eset<-rma(Data)


###################################################
### chunk number 4: 
###################################################
e<-exprs(eset)
head(e)


###################################################
### chunk number 5: 
###################################################
Index1<-which(eset$Source.Name=="PROX1_siRNA-1")
Index2<-which(eset$Source.Name=="PROX1_siRNA-2")
Index3<-which(eset$Source.Name=="GFP_siRNA")


###################################################
### chunk number 6:  eval=FALSE
###################################################
## e[, Index1]


###################################################
### chunk number 7: 
###################################################
M<-rowMeans(e[, Index1])-rowMeans(e[, Index3])
A<-rowMeans(e)


###################################################
### chunk number 8:  eval=FALSE
###################################################
## plot(A, M, pch = ".", ylim = c(-3.5, 3.5))


###################################################
### chunk number 9: 
###################################################
plot(A, M, pch = ".", ylim = c(-3.5, 3.5), col="grey")
abline(lm(M~A), col = "blue")
lines(lowess(A,M), col="red")
leg<-c("lm","lowess")
cols<-c("blue","red")
legend("topright", leg, col=cols, lty=1)


###################################################
### chunk number 10: 
###################################################
weset<-eset[,c(Index1, Index3)]
weset$Source.Name<-factor(weset$Source.Name)
library(genefilter)
tt <- rowttests(weset, "Source.Name")
head(tt)


###################################################
### chunk number 11:  eval=FALSE
###################################################
## lod <- -log10(tt$p.value)
## plot(M, lod, cex = 0.25, main = "Volcano plot for t-test", col="purple")
## abline(h = 2, col="red")


###################################################
### chunk number 12: 
###################################################
lod <- -log10(tt$p.value)
plot(M, lod, cex = 0.25, main = "Volcano plot for t-test", col="purple")
abline(h = 2, col="red")


###################################################
### chunk number 13: 
###################################################
library("limma")
design <- model.matrix(~weset$Source.Name)
fit <- lmFit(weset, design)
ebayes <- eBayes(fit)


###################################################
### chunk number 14:  eval=FALSE
###################################################
## plot(M, -log10(ebayes$p.value[, 2]), xlim = c(-1, 1), cex = 0.25, main = "Volcano plot for t-test", col="purple")
## abline(h = 2, col="red")


###################################################
### chunk number 15: 
###################################################
plot(M, -log10(ebayes$p.value[, 2]), xlim = c(-3.5, 3.5), cex = 0.25, main = "Volcano plot for t-test", col="purple")
abline(h = 2, col="red")


###################################################
### chunk number 16:  eval=FALSE
###################################################
## library(affy)
## slot(Data, "annotation")
## library("annotate")
## annotation(weset)


###################################################
### chunk number 17: 
###################################################
tab<-topTable(ebayes, coef=2, adjust.method="BH", n=15)
genenames<-as.character(tab$ID)


###################################################
### chunk number 18: 
###################################################
library("hgu133a2.db")
library("annotate")
ll<-getLL(genenames, "hgu133a2")
sym<-getSYMBOL(genenames, "hgu133a2")
tab<-data.frame(sym, tab[, -1])
htmlpage(as.data.frame(ll), filename = "GeneList1.html", title = "HTML report", othernames = tab, table.head = c("Locus ID", colnames(tab)), table.center = TRUE)


###################################################
### chunk number 19: 
###################################################
library("annaffy")
library("KEGG.db")
library("GO.db")
anntab<-aafTableAnn(genenames, "hgu133a2.db", aaf.handler())
saveHTML(anntab, file = "GeneList2.html")


###################################################
### chunk number 20: 
###################################################
library(multtest)
data(golub)
t.multi.test.golub<-MTP(golub, Y=golub.cl, typeone="fdr", B=50, alpha=.01)
slotNames(t.multi.test.golub)
summary(t.multi.test.golub)


###################################################
### chunk number 21: 
###################################################
head(golub.gnames[,2][slot(t.multi.test.golub, "reject")])


###################################################
### chunk number 22: 
###################################################
library(SpeCond)
data(expressionSpeCondExample)
data(expSetSpeCondExample)
expSetSpeCondExample
Mexp=expressionSpeCondExample
MexpS=getMatrixFromExpressionSet(expSetSpeCondExample, condition.factor=expSetSpeCondExample$Tissue,condition.method="mean")
generalResult=SpeCond(expSetSpeCondExample, param.detection=NULL, multitest.correction.method="BY", prefix.file="E", print.hist.pv=TRUE, fit1=NULL, fit2=NULL, specificOutlierStep1=NULL, condition.factor=expSetSpeCondExample$Tissue, condition.method="mean")
specificResult=generalResult$specificResult
getFullHtmlSpeCondResult(SpeCondResult=generalResult, param.detection=specificResult$param.detection, page.name="Example_SpeCond_results", page.title="Tissue specific results", sort.condition="all", heatmap.profile=TRUE, heatmap.expression=FALSE, heatmap.unique.profile=FALSE, expressionMatrix=Mexp)
genePageInfo=getGeneHtmlPage(Mexp, specificResult, name.index.html="index_example_SpeCond_Results.html", gene.html.ids=c(1:20))


