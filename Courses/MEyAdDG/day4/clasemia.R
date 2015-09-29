###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite(c("ShortRead", "Genominator"))


###################################################
### chunk number 3: 
###################################################
library(ShortRead)


###################################################
### chunk number 4: 
###################################################
library(BSgenome.Ecoli.NCBI.20080805)
Ecoli
matchPattern("GAAC", Ecoli[["NC_008253"]])


###################################################
### chunk number 5: 
###################################################
reads <- readFastq("..", pattern="typhi")
abc <- alphabetByCycle(sread(reads), alphabet=c("A","T","G","C","N"))
abc<- abc/colSums(abc)
dataabc <- as.data.frame(abc)


###################################################
### chunk number 6: 
###################################################
A <- dataabc["A",]
T <- dataabc["T",]
G <- dataabc["G",]
C <- dataabc["C",]


###################################################
### chunk number 7: 
###################################################
print(xyplot(A+T+C+G~1:ncol(dataabc), dataabc, type="l", xlab="Cycle", main="Frequency per cycle", auto.key=list(x=.75, y=.95, points=FALSE, lines=TRUE)))


###################################################
### chunk number 8: 
###################################################
seq<-tables(reads, n=15)
topReads<-data.frame(read=names(seq[["top"]]), count=unname(seq[["top"]]))
topReads


###################################################
### chunk number 9: 
###################################################
qualitymatrix<-as(quality(reads), "matrix")
head(qualitymatrix[,1:7])
meanquality <- apply(qualitymatrix, 2, mean)


###################################################
### chunk number 10: 
###################################################
plot(meanquality, type="l", main="Quality per cycle", ylab="Quality", xlab="Cycle")


###################################################
### chunk number 11: 
###################################################
reads
shortreads<-narrow(reads, start=1, end=25)
shortreads


###################################################
### chunk number 12: 
###################################################
distance1 <- srdistance(shortreads, "AAAAAAAAAAAAAAAAAAAAAAAAA")[[1]]
distance2 <- srdistance(shortreads, "GATCGGAAGAGCTCGTATGCCGTCT")[[1]]


###################################################
### chunk number 13: 
###################################################
print(histogram(distance1, main="Distribution of distances to AAAAAAAAAAAAAAAAAAAAAAAAA"))


###################################################
### chunk number 14: 
###################################################
print(histogram(distance2, main="Distribution of distances to GATCGGAAGAGCTCGTATGCCGTCT"))


###################################################
### chunk number 15: 
###################################################
length(shortreads)
cleanreads<-reads[distance1>5 & distance2>5]
length(cleanreads)


###################################################
### chunk number 16: 
###################################################
writeFastq(cleanreads, "cleanthypi.fastq")


###################################################
### chunk number 17: 
###################################################
filter <- srFilter(function(x) {apply(as(quality(x), "matrix"), 1, sum) > 1000}, name="GoodQualityBases")
reads[filter(reads)]


###################################################
### chunk number 18: 
###################################################
exptPath <- system.file("extdata", package = "ShortRead")
sp <- SolexaPath(exptPath)


###################################################
### chunk number 19: 
###################################################
aln <- readAligned(sp, "s_2_export.txt")
aln


###################################################
### chunk number 20: 
###################################################
head(position(aln), 3)
table(strand(aln))


###################################################
### chunk number 21: 
###################################################
head(quality(alignQuality(aln)))


###################################################
### chunk number 22: 
###################################################
filtered <- alignData(aln)[["filtering"]] == "Y"
mapped <- !is.na(position(aln))
filteredmapped<-aln[filtered&mapped]
filteredmapped


###################################################
### chunk number 23: 
###################################################
qual<-qa(sp)
rpt<-report(qual, dest=".")


###################################################
### chunk number 24: 
###################################################
library(Genominator)
aln <- readAligned("..", pattern="andale.txt", type="Bowtie")
aln2 <- readAligned("..", pattern="andale.txt", type="Bowtie")
chrMap <- levels(chromosome(aln))
lista <- NULL
lista <- list("Ecoli"=aln, "otro"=aln2)
eData <- importFromAlignedReads(lista, chrMap = chrMap,
                                dbFilename = "my.db", tablename = "raw", 
                                overwrite = TRUE, 
                                deleteIntermediates = FALSE)
head(eData)


###################################################
### chunk number 25: 
###################################################
getRegion(eData, chr = 1, strand = 0, start = 10000,end = 12000)
laneCounts <- summarizeExpData(eData)
laneCounts


###################################################
### chunk number 26: 
###################################################
sessionInfo()


