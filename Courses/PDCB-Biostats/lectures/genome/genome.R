###################################################
### chunk number 1: 
###################################################
#line 50 "genome.Rnw"
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## #line 80 "genome.Rnw"
## source("http://bioconductor.org/biocLite.R")
## biocLite()


###################################################
### chunk number 3:  eval=FALSE
###################################################
## #line 85 "genome.Rnw"
## source("http://bioconductor.org/biocLite.R")
## biocLite("PkgName")


###################################################
### chunk number 4:  eval=FALSE
###################################################
## #line 90 "genome.Rnw"
## browseVignettes(package = "PkgName")


###################################################
### chunk number 5:  eval=FALSE
###################################################
## #line 101 "genome.Rnw"
## browseVignettes()


###################################################
### chunk number 6:  eval=FALSE
###################################################
## #line 121 "genome.Rnw"
## source("http://bioconductor.org/biocLite.R")
## biocLite("GenomeGraphs")


###################################################
### chunk number 7: 
###################################################
#line 146 "genome.Rnw"
library(GenomeGraphs)


###################################################
### chunk number 8:  eval=FALSE
###################################################
## #line 149 "genome.Rnw"
## ?gdPlot


###################################################
### chunk number 9:  eval=FALSE
###################################################
## #line 170 "genome.Rnw"
## help(package = GenomeGraphs)


###################################################
### chunk number 10:  eval=FALSE
###################################################
## #line 174 "genome.Rnw"
## apropos("make")


###################################################
### chunk number 11: 
###################################################
#line 184 "genome.Rnw"
args(makeBaseTrack)


###################################################
### chunk number 12: 
###################################################
#line 195 "genome.Rnw"
makeBaseTrack(1:100, rlnorm(100))


###################################################
### chunk number 13: 
###################################################
#line 206 "genome.Rnw"
a <- makeBaseTrack(1:100, rlnorm(100), strand="+")


###################################################
### chunk number 14: 
###################################################
#line 215 "genome.Rnw"
gdPlot(a)


###################################################
### chunk number 15: 
###################################################
#line 230 "genome.Rnw"
info <- list(makeBaseTrack(1:100, rlnorm(100), strand="+"), makeBaseTrack(1:100, rnorm(100), strand="-"))
gdPlot(info)


###################################################
### chunk number 16: 
###################################################
#line 238 "genome.Rnw"
info2 <- list(makeBaseTrack(1:100, rlnorm(100), strand="+"), makeBaseTrack(1:100, rnorm(100), strand="-"), makeGenomeAxis())
gdPlot(info2)


###################################################
### chunk number 17: 
###################################################
#line 250 "genome.Rnw"
b <- makeBaseTrack(1:100, rnorm(100), strand="-", dp = DisplayPars(color="blue"))


###################################################
### chunk number 18: 
###################################################
#line 258 "genome.Rnw"
gdPlot(list(a, b, makeGenomeAxis()))


###################################################
### chunk number 19: 
###################################################
#line 268 "genome.Rnw"
showDisplayOptions("BaseTrack")


###################################################
### chunk number 20: 
###################################################
#line 285 "genome.Rnw"
gdPlot(list("+" = a, "-" = b, Base = makeGenomeAxis()))


###################################################
### chunk number 21: 
###################################################
#line 295 "genome.Rnw"
args(makeGeneRegion)


###################################################
### chunk number 22: 
###################################################
#line 300 "genome.Rnw"
bsub <- useMart("bacterial_mart_8", dataset = "bac_6_gene")


###################################################
### chunk number 23: 
###################################################
#line 321 "genome.Rnw"
head(listAttributes(bsub))


###################################################
### chunk number 24: 
###################################################
#line 326 "genome.Rnw"
res <- getBM(attributes=c("chromosome_name"), filters= c("start", "end"), values = list("1", "1000"), mart = bsub)
res


###################################################
### chunk number 25: 
###################################################
#line 331 "genome.Rnw"
c <- makeGeneRegion(12000, 20000, chromosome="Chromosome", strand = "+", biomart=bsub)


###################################################
### chunk number 26: 
###################################################
#line 335 "genome.Rnw"
d <- makeGeneRegion(12000, 20000, chromosome="Chromosome", strand = "-", biomart=bsub)


###################################################
### chunk number 27: 
###################################################
#line 343 "genome.Rnw"
gdPlot(list("+"=c, "-"=d, Bsub=makeGenomeAxis()))


###################################################
### chunk number 28: 
###################################################
#line 353 "genome.Rnw"
mart <- useMart("ensembl", "scerevisiae_gene_ensembl")
data("seqDataEx")
head(seqDataEx$david)


###################################################
### chunk number 29: 
###################################################
#line 364 "genome.Rnw"
gdPlot(makeGeneRegion(10000, 50000, chr = "IV", strand = "+", biomart = mart), 10000, 50000)


###################################################
### chunk number 30:  eval=FALSE
###################################################
## #line 373 "genome.Rnw"
## showDisplayOptions("GeneRegion")


###################################################
### chunk number 31: 
###################################################
#line 389 "genome.Rnw"
gdPlot(makeGeneRegion(10000, 50000, chr = "IV", strand = "+", biomart = mart, dp = DisplayPars( plotId=TRUE, idRotation=0, cex=0.5, idColor = "black")), 10000, 50000)


###################################################
### chunk number 32: 
###################################################
#line 400 "genome.Rnw"
args(makeGenericArray)


###################################################
### chunk number 33: 
###################################################
#line 405 "genome.Rnw"
david <- seqDataEx$david


###################################################
### chunk number 34: 
###################################################
#line 410 "genome.Rnw"
head(david[,"expr", drop=FALSE])
head(david[,"expr", drop=TRUE])


###################################################
### chunk number 35: 
###################################################
#line 415 "genome.Rnw"
e <- makeGenericArray(david[, "expr",drop = FALSE], david[, "location"])


###################################################
### chunk number 36: 
###################################################
#line 423 "genome.Rnw"
gdPlot(list(e, makeGenomeAxis()))


###################################################
### chunk number 37: 
###################################################
#line 439 "genome.Rnw"
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
### chunk number 38: 
###################################################
#line 456 "genome.Rnw"
gdPlot(yeastLst)


###################################################
### chunk number 39: 
###################################################
#line 466 "genome.Rnw"
args(makeRectangleOverlay)
args(makeTextOverlay)


###################################################
### chunk number 40: 
###################################################
#line 479 "genome.Rnw"
showDisplayOptions("RectangleOverlay")


###################################################
### chunk number 41: 
###################################################
#line 488 "genome.Rnw"
ovlay <- makeRectangleOverlay(1301500, 1302500, region = c(1, 2), dp = DisplayPars(alpha = 0.5))
gdPlot(yeastLst, overlays = c(ovlay))


###################################################
### chunk number 42: 
###################################################
#line 498 "genome.Rnw"
tovlay <- makeTextOverlay("SpecialRegion", 1303500, 0.75, region = c(1, 1), dp = DisplayPars(color = "black"))


###################################################
### chunk number 43: 
###################################################
#line 506 "genome.Rnw"
gdPlot(yeastLst, overlays = c(ovlay, tovlay))


###################################################
### chunk number 44: 
###################################################
#line 516 "genome.Rnw"
args(makeTranscript)
hMart <- useMart("ensembl", "hsapiens_gene_ensembl")
trans <- makeTranscript("ENSG00000168309", biomart = hMart)


###################################################
### chunk number 45: 
###################################################
#line 527 "genome.Rnw"
gdPlot(list(trans, makeGenomeAxis()))


###################################################
### chunk number 46: 
###################################################
#line 538 "genome.Rnw"
args(makeExonArray)
args(makeGeneModel)


###################################################
### chunk number 47: 
###################################################
#line 544 "genome.Rnw"
data("unrData", package = "GenomeGraphs")
class(unrData)
dim(unrData)
head(unrPositions)


###################################################
### chunk number 48: 
###################################################
#line 551 "genome.Rnw"
exon <- makeExonArray(intensity = unrData, probeStart = unrPositions[,3], 
                      probeEnd = unrPositions[,4], probeId = as.character(unrPositions[,1]), 
                      nProbes = unrNProbes, 
                      dp = DisplayPars(color = "blue", mapColor = "dodgerblue2"), 
                      displayProbesets = FALSE)
geneModel <- makeGeneModel(start = unrPositions[,3], end = unrPositions[,4])


###################################################
### chunk number 49: 
###################################################
#line 564 "genome.Rnw"
gdPlot(list(exon, geneModel, makeGenomeAxis()))


###################################################
### chunk number 50: 
###################################################
#line 587 "genome.Rnw"
sessionInfo()


