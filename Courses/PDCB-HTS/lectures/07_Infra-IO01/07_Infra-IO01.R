###################################################
### chunk number 1: 
###################################################
#line 50 "07_Infra-IO01.Rnw"
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## #line 87 "07_Infra-IO01.Rnw"
## source("http://bioconductor.org/biocLite.R")
## biocLite(c("ShortRead", "Rsamtools"))


###################################################
### chunk number 3: 
###################################################
#line 246 "07_Infra-IO01.Rnw"
library(ShortRead)
exptPath <- system.file("extdata", package = "ShortRead")


###################################################
### chunk number 4: 
###################################################
#line 251 "07_Infra-IO01.Rnw"
sp <- SolexaPath(exptPath)
sp


###################################################
### chunk number 5: 
###################################################
#line 256 "07_Infra-IO01.Rnw"
imageAnalysisPath(sp)
analysisPath(sp)


###################################################
### chunk number 6: 
###################################################
#line 261 "07_Infra-IO01.Rnw"
aln <- readAligned(sp, "s_2_export.txt")
aln
class(aln)


###################################################
### chunk number 7: 
###################################################
#line 275 "07_Infra-IO01.Rnw"
summary(position(aln))


###################################################
### chunk number 8: 
###################################################
#line 280 "07_Infra-IO01.Rnw"
table(strand(aln))
unique(width(aln))
alignQuality(aln)
summary(quality(alignQuality(aln)))
length(aln)
head(table(chromosome(aln)))
head(id(aln))


###################################################
### chunk number 9: 
###################################################
#line 299 "07_Infra-IO01.Rnw"
summary(position(aln))[7]


###################################################
### chunk number 10: 
###################################################
#line 309 "07_Infra-IO01.Rnw"
idx <- which(is.na(position(aln)) == FALSE)
neg <- which(strand(aln)[idx] == "-")
tss <- position(aln)[idx]
tss[neg] <- tss[neg] + width(aln)[idx][neg] - 1


###################################################
### chunk number 11: 
###################################################
#line 316 "07_Infra-IO01.Rnw"
tenth <- head(position(aln), 10)
tenth
tenth <- length(which(is.na(tenth) == FALSE))
tenth
tss[tenth]


###################################################
### chunk number 12: 
###################################################
#line 324 "07_Infra-IO01.Rnw"
aln[10]
tss[tenth] == 80537786 + 35 - 1


###################################################
### chunk number 13: 
###################################################
#line 336 "07_Infra-IO01.Rnw"
args(readFastq)
sread <- readFastq( analysisPath(sp), pattern="sequence.txt")
class(sread)


###################################################
### chunk number 14: 
###################################################
#line 349 "07_Infra-IO01.Rnw"
sread


###################################################
### chunk number 15: 
###################################################
#line 353 "07_Infra-IO01.Rnw"
head(id(sread))
head(quality(sread))
length(sread)
table(width(sread))
head(sread(sread))
narrow(sread, start=1, end=10)


###################################################
### chunk number 16:  eval=FALSE
###################################################
## #line 370 "07_Infra-IO01.Rnw"
## ?BStringSet


###################################################
### chunk number 17: 
###################################################
#line 380 "07_Infra-IO01.Rnw"
first2 <- sread(narrow(sread, start=1,width=2))
head(first2)
first2 <- as.character(first2)
table(first2)


###################################################
### chunk number 18: 
###################################################
#line 394 "07_Infra-IO01.Rnw"
dinuc <- dinucleotideFrequency( sread(narrow(sread, start=1, width=2)) )
dinuc[1,]
dinuc <- colSums(dinuc)
dinuc[dinuc > 0]


###################################################
### chunk number 19: 
###################################################
#line 416 "07_Infra-IO01.Rnw"
apropos("alphabet")


###################################################
### chunk number 20: 
###################################################
#line 420 "07_Infra-IO01.Rnw"
alph <- alphabetByCycle( sread(sread) )
dim(alph)


###################################################
### chunk number 21: 
###################################################
#line 434 "07_Infra-IO01.Rnw"
library(lattice)
alph2 <- as.data.frame(t(alph[rowSums(alph)>0,]))
head(alph2)
alph2 <- alph2 / rowSums(alph2) * 100
head(alph2)


###################################################
### chunk number 22: 
###################################################
#line 446 "07_Infra-IO01.Rnw"
print(xyplot( A+C+G+T ~ 1:nrow(alph2), data=alph2, type=c("o", "g"), auto.key=TRUE, xlab="Cycle", ylab="Nucleotide Frequency"))


###################################################
### chunk number 23: 
###################################################
#line 456 "07_Infra-IO01.Rnw"
args(qa)
qa <- qa(sp)
dir <- tempfile()


###################################################
### chunk number 24:  eval=FALSE
###################################################
## #line 461 "07_Infra-IO01.Rnw"
## report(qa, dest=dir)
## dir( paste(dir, "image", sep="/"))


###################################################
### chunk number 25: 
###################################################
#line 466 "07_Infra-IO01.Rnw"
qa[["baseCalls"]]


###################################################
### chunk number 26: 
###################################################
#line 477 "07_Infra-IO01.Rnw"
apropos("filter")


###################################################
### chunk number 27: 
###################################################
#line 481 "07_Infra-IO01.Rnw"
nfilt <- nFilter()
cfilt <- chromosomeFilter("chr5.fa")
sfilt <- strandFilter("+")


###################################################
### chunk number 28: 
###################################################
#line 488 "07_Infra-IO01.Rnw"
chr5 <- readAligned(sp, "s_2_export.txt", filter = cfilt)
filt <- compose(cfilt, sfilt)
chr5plus <- readAligned(sp, "s_2_export.txt", filter = filt)
length(chr5plus) == length(aln[filt(aln)])


###################################################
### chunk number 29: 
###################################################
#line 533 "07_Infra-IO01.Rnw"
library(Rsamtools)
which <- RangesList(seq1 = IRanges(1000, 2000), seq2 = IRanges(c(100, 1000), c(1000, 2000)))
which
what <- c("rname", "strand", "pos", "qwidth", "seq")
what
param <- ScanBamParam(which = which, what = what)
param
bamFile <- system.file("extdata", "ex1.bam", package="Rsamtools")
bam <- scanBam(bamFile, param=param)


###################################################
### chunk number 30: 
###################################################
#line 551 "07_Infra-IO01.Rnw"
class(bam)
names(bam)
lapply(bam, class)
names(bam[[1]])
sapply(bam[[1]], class)


###################################################
### chunk number 31: 
###################################################
#line 565 "07_Infra-IO01.Rnw"
lst <- lapply(names(bam[[1]]), function(elt) { 
  do.call(c, unname(lapply(bam, "[[", elt)))
})
names(lst) <- names(bam[[1]])
head(do.call("DataFrame", lst))


###################################################
### chunk number 32:  eval=FALSE
###################################################
## #line 583 "07_Infra-IO01.Rnw"
## which <- RangesList(`6` = IRanges(100000L, 110000L))
## param <- ScanBamParam(which = which)
## na19240url <- "ftp://ftp-trace.ncbi.nih.gov/1000genomes/ftp/pilot_data/data/NA19240/alignment/NA19240.chrom6.SLX.maq.SRP000032.2009_07.bam"
## na19240bam <- scanBam(na19240url, param = param)


###################################################
### chunk number 33: 
###################################################
#line 589 "07_Infra-IO01.Rnw"
load("na19240.Rda")


###################################################
### chunk number 34: 
###################################################
#line 592 "07_Infra-IO01.Rnw"
print(object.size(na19240bam), units="Mb")


###################################################
### chunk number 35: 
###################################################
#line 603 "07_Infra-IO01.Rnw"
aln1_file <- system.file("extdata", "ex1.bam", package="Rsamtools")
aln1 <- readBamGappedAlignments(aln1_file)
head(aln1)


###################################################
### chunk number 36: 
###################################################
#line 637 "07_Infra-IO01.Rnw"
sessionInfo()


