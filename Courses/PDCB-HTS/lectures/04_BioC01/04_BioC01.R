###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite()


###################################################
### chunk number 3:  eval=FALSE
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite("PkgName")


###################################################
### chunk number 4:  eval=FALSE
###################################################
## browseVignettes(package = "PkgName")


###################################################
### chunk number 5:  eval=FALSE
###################################################
## browseVignettes()


###################################################
### chunk number 6: 
###################################################
randomSeq <- function(n, prob = rep(0.25, 4), alphabet = c("A", "C", "T", "G")) {
  res <- sample( alphabet, n, replace = TRUE, prob = prob )
  res <- paste(res, collapse="")
  return(res)
}


###################################################
### chunk number 7: 
###################################################
randomSeq(20)


###################################################
### chunk number 8: 
###################################################
calcGC <- function(x) {
  seq <- toupper(strsplit(x, "")[[1]])
  GC <- length(which( seq == "G")) + length(which(seq == "C"))
  return( GC / length(seq) * 100)
}


###################################################
### chunk number 9: 
###################################################
seq <- randomSeq(10)
seq
calcGC(seq)


###################################################
### chunk number 10: 
###################################################
seqs <- lapply( 1:10000, function(x) randomSeq(n=100))
seqsGC <- unlist( lapply( seqs, calcGC) )


###################################################
### chunk number 11: 
###################################################
hist(seqsGC, col = "light blue")


###################################################
### chunk number 12: 
###################################################
ls()


###################################################
### chunk number 13:  eval=FALSE
###################################################
## package.skeleton( name = "GCcalc", list = c("seqs", "seqsGC", "randomSeq", "calcGC"), path = ".", namespace = TRUE)


###################################################
### chunk number 14:  eval=FALSE
###################################################
## biocLite(c("ShortRead", "Rsamtools", "GenomicRanges", "IRanges", "GenomeGraphs", "biomaRt", "GenomicFeatures", "ChIPpeakAnno", "edgeR", "DESeq", "baySeq", "chipseq", "Biostrings", "SRAdb", "DEGseq", "MotIV", "BayesPeak", "ChIPsim"))


###################################################
### chunk number 15: 
###################################################
sessionInfo()


