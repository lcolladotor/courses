###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
library(ShortRead)
library(chipseq)
library(GenomicFeatures)
library(BSgenome.Mmusculus.UCSC.mm9)


###################################################
### chunk number 3: 
###################################################
reads<-readFastq(".", pattern="Typhi_solexa.fastq.aa")
head(reads, 1)
head(id(reads), 1)
head(sread(reads), 1)


###################################################
### chunk number 4: 
###################################################
abc <- alphabetByCycle(sread(reads), alphabet=c("A","T","G","C","N"))
abc<- abc/colSums(abc)
dataabc <- as.data.frame(abc)


###################################################
### chunk number 5: 
###################################################
A <- dataabc["A",]
T <- dataabc["T",]
G <- dataabc["G",]
C <- dataabc["C",]


###################################################
### chunk number 6: 
###################################################
print(xyplot(A+T+C+G~1:ncol(dataabc), dataabc, type="l", xlab="Cycle", main="Frequency per cycle", auto.key=list(x=.75, y=.95, points=FALSE, lines=TRUE)))


###################################################
### chunk number 7: 
###################################################
qualitymatrix<-as(quality(reads), "matrix")
head(qualitymatrix[,1:7])
meanquality <- apply(qualitymatrix, 2, mean)


###################################################
### chunk number 8: 
###################################################
plot(meanquality, type="l", main="Quality per cycle", ylab="Quality", xlab="Cycle")


###################################################
### chunk number 9: 
###################################################
reads
shortreads<-narrow(reads, start=1, end=25)
shortreads


###################################################
### chunk number 10: 
###################################################
distance1 <- srdistance(shortreads, "AAAAAAAAAAAAAAAAAAAAAAAAA")[[1]]
distance2 <- srdistance(shortreads, "GATCGGAAGAGCTCGTATGCCGTCT")[[1]]


###################################################
### chunk number 11: 
###################################################
print(histogram(distance1, main="Distribution of distances to AAAAAAAAAAAAAAAAAAAAAAAAA"))


###################################################
### chunk number 12: 
###################################################
print(histogram(distance2, main="Distribution of distances to GATCGGAAGAGCTCGTATGCCGTCT"))


###################################################
### chunk number 13: 
###################################################
length(shortreads)
cleanreads<-reads[distance1>5 & distance2>5]
length(cleanreads)


###################################################
### chunk number 14: 
###################################################
writeFastq(cleanreads, "cleanthypi.fastq")


###################################################
### chunk number 15: 
###################################################
exptPath <- system.file("extdata", package = "ShortRead")
sp <- SolexaPath(exptPath)


###################################################
### chunk number 16: 
###################################################
aln <- readAligned(sp, "s_2_export.txt")
aln


###################################################
### chunk number 17: 
###################################################
head(position(aln), 3)
table(strand(aln))


###################################################
### chunk number 18: 
###################################################
head(quality(alignQuality(aln)))


###################################################
### chunk number 19: 
###################################################
filtered <- alignData(aln)[["filtering"]] == "Y"
mapped <- !is.na(position(aln))
filteredmapped<-aln[filtered&mapped]
filteredmapped


###################################################
### chunk number 20: 
###################################################
qual<-qa(sp)
rpt<-report(qual, dest=".")


###################################################
### chunk number 21: 
###################################################
data(cstest)
cstest
str(cstest$ctcf$chr10)


###################################################
### chunk number 22: 
###################################################
bc <- basesCovered(cstest$ctcf$chr10, shift = 1:250, seqLen = 24)
ext <- extendReads(cstest$ctcf$chr10, seqLen = 150)
head(ext)


###################################################
### chunk number 23: 
###################################################
musculuschrlen <- seqlengths(Mmusculus)
cov <- coverage(ext, width = musculuschrlen["chr10"])
islands <- slice(cov, lower = 1)


###################################################
### chunk number 24: 
###################################################
peaks <- slice(cov, lower = 8)
cov.pos <- coverage(extendReads(cstest$ctcf$chr10, strand = "+", seqLen = 150), width = musculuschrlen["chr10"])
cov.neg <- coverage(extendReads(cstest$ctcf$chr10, strand = "-", seqLen = 150), width = musculuschrlen["chr10"])
peaks.pos <- copyIRanges(peaks, cov.pos)
peaks.neg <- copyIRanges(peaks, cov.neg)


###################################################
### chunk number 25: 
###################################################
print(coverageplot(peaks.pos[1], peaks.neg[1]))


###################################################
### chunk number 26: 
###################################################
sessionInfo()


