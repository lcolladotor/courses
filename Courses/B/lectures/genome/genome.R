###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## install.packages("RMySQL")
## source("http://bioconductor.org/biocLite.R")
## biocLite("rtracklayer")
## biocLite("humanStemCell")
## biocLite("GenomeGraphs")


###################################################
### chunk number 3: 
###################################################
library(GenomeGraphs)


###################################################
### chunk number 4:  eval=FALSE
###################################################
## ?gdPlot


###################################################
### chunk number 5:  eval=FALSE
###################################################
## help(package = GenomeGraphs)


###################################################
### chunk number 6:  eval=FALSE
###################################################
## apropos("make")


###################################################
### chunk number 7: 
###################################################
args(makeBaseTrack)


###################################################
### chunk number 8: 
###################################################
makeBaseTrack(1:100, rlnorm(100))


###################################################
### chunk number 9: 
###################################################
a <- makeBaseTrack(1:100, rlnorm(100), strand="+")


###################################################
### chunk number 10: 
###################################################
gdPlot(a)


###################################################
### chunk number 11: 
###################################################
info <- list(makeBaseTrack(1:100, rlnorm(100), strand="+"), makeBaseTrack(1:100, rnorm(100), strand="-"))
gdPlot(info)


###################################################
### chunk number 12: 
###################################################
info2 <- list(makeBaseTrack(1:100, rlnorm(100), strand="+"), makeBaseTrack(1:100, rnorm(100), strand="-"), makeGenomeAxis())
gdPlot(info2)


###################################################
### chunk number 13: 
###################################################
b <- makeBaseTrack(1:100, rnorm(100), strand="-", dp = DisplayPars(color="blue"))


###################################################
### chunk number 14: 
###################################################
gdPlot(list(a, b, makeGenomeAxis()))


###################################################
### chunk number 15: 
###################################################
showDisplayOptions("BaseTrack")


###################################################
### chunk number 16: 
###################################################
gdPlot(list("+" = a, "-" = b, Base = makeGenomeAxis()))


###################################################
### chunk number 17: 
###################################################
args(makeGeneRegion)


###################################################
### chunk number 18: 
###################################################
bsub <- useMart("bacterial_mart_54", dataset = "bac_6_gene")


###################################################
### chunk number 19: 
###################################################
head(listAttributes(bsub))


###################################################
### chunk number 20: 
###################################################
res <- getBM(attributes=c("chromosome_name"), filters= c("start", "end"), values = list("1", "1000"), mart = bsub)
res


###################################################
### chunk number 21: 
###################################################
c <- makeGeneRegion(12000, 20000, chromosome="Chromosome", strand = "+", biomart=bsub)


###################################################
### chunk number 22: 
###################################################
d <- makeGeneRegion(12000, 20000, chromosome="Chromosome", strand = "-", biomart=bsub)


###################################################
### chunk number 23: 
###################################################
gdPlot(list("+"=c, "-"=d, Bsub=makeGenomeAxis()))


###################################################
### chunk number 24: 
###################################################
mart <- useMart("ensembl", "scerevisiae_gene_ensembl")
data("seqDataEx")
head(seqDataEx$david)


###################################################
### chunk number 25: 
###################################################
gdPlot(makeGeneRegion(10000, 50000, chr = "IV", strand = "+", biomart = mart), 10000, 50000)


###################################################
### chunk number 26:  eval=FALSE
###################################################
## showDisplayOptions("GeneRegion")


###################################################
### chunk number 27: 
###################################################
gdPlot(makeGeneRegion(10000, 50000, chr = "IV", strand = "+", biomart = mart, dp = DisplayPars( plotId=TRUE, idRotation=0, cex=0.5, idColor = "black")), 10000, 50000)


###################################################
### chunk number 28: 
###################################################
args(makeGenericArray)


###################################################
### chunk number 29: 
###################################################
david <- seqDataEx$david


###################################################
### chunk number 30: 
###################################################
head(david[,"expr", drop=FALSE])
head(david[,"expr", drop=TRUE])


###################################################
### chunk number 31: 
###################################################
e <- makeGenericArray(david[, "expr",drop = FALSE], david[, "location"])


###################################################
### chunk number 32: 
###################################################
gdPlot(list(e, makeGenomeAxis()))


###################################################
### chunk number 33: 
###################################################
df <- as.data.frame(seqDataEx$david)
lst <- lapply(c("+", "-"), function(s) {
    a <- as.matrix(subset(df, strand == ifelse(s == "+", 1, -1)))
    c(makeGenericArray(a[,"expr", drop = FALSE], a[,"location"]),
      makeGeneRegion(start = min(df[,"location"]),
                     end = max(df[,"location"]),
                     chr = "IV", 
                     strand = s, 
                     biomart = mart, dp = DisplayPars(plotId=TRUE, idRotation = 0, cex = .5, idColor = "black")))
})
yeastLst <- c(unlist(lst), makeGenomeAxis())


###################################################
### chunk number 34: 
###################################################
gdPlot(yeastLst)


###################################################
### chunk number 35: 
###################################################
args(makeRectangleOverlay)
args(makeTextOverlay)


###################################################
### chunk number 36: 
###################################################
showDisplayOptions("RectangleOverlay")


###################################################
### chunk number 37: 
###################################################
ovlay <- makeRectangleOverlay(1301500, 1302500, region = c(1, 2), dp = DisplayPars(alpha = 0.5))
gdPlot(yeastLst, overlays = c(ovlay))


###################################################
### chunk number 38: 
###################################################
tovlay <- makeTextOverlay("SpecialRegion", 1303500, 0.75, region = c(1, 1), dp = DisplayPars(color = "black"))


###################################################
### chunk number 39: 
###################################################
gdPlot(yeastLst, overlays = c(ovlay, tovlay))


###################################################
### chunk number 40: 
###################################################
args(makeTranscript)
hMart <- useMart("ensembl", "hsapiens_gene_ensembl")
trans <- makeTranscript("ENSG00000168309", biomart = hMart)


###################################################
### chunk number 41: 
###################################################
gdPlot(list(trans, makeGenomeAxis()))


###################################################
### chunk number 42: 
###################################################
args(makeExonArray)
args(makeGeneModel)


###################################################
### chunk number 43: 
###################################################
data("unrData", package = "GenomeGraphs")
class(unrData)
dim(unrData)
head(unrPositions)


###################################################
### chunk number 44: 
###################################################
exon <- makeExonArray(intensity = unrData, probeStart = unrPositions[,3], 
                      probeEnd = unrPositions[,4], probeId = as.character(unrPositions[,1]), 
                      nProbes = unrNProbes, 
                      dp = DisplayPars(color = "blue", mapColor = "dodgerblue2"), 
                      displayProbesets = FALSE)
geneModel <- makeGeneModel(start = unrPositions[,3], end = unrPositions[,4])


###################################################
### chunk number 45: 
###################################################
gdPlot(list(exon, geneModel, makeGenomeAxis()))


###################################################
### chunk number 46: 
###################################################
sessionInfo()


