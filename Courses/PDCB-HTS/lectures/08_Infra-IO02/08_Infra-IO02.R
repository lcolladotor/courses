###################################################
### chunk number 1: 
###################################################
#line 50 "08_Infra-IO02.Rnw"
options(width=40)


###################################################
### chunk number 2: 
###################################################
#line 78 "08_Infra-IO02.Rnw"
library(ShortRead)
exptPath <- system.file("extdata", package = "ShortRead")
sp <- SolexaPath(exptPath)
aln <- readAligned(sp, "s_2_export.txt")
di <- colSums(dinucleotideFrequency(sread(narrow(aln, start=34, width=2))))
di


###################################################
### chunk number 3: 
###################################################
#line 88 "08_Infra-IO02.Rnw"
gc <- alphabetByCycle(sread(aln))
gc <- colSums(gc[c("C", "G"), ]) / colSums(gc)

diGC <- unlist(lapply(strsplit(names(di), ""), function(x) {
  sum( x %in% c("C", "G"))
}))
diGC

expected <- lapply(gc, function(x) {
  res <- (x * diGC) + ((1-x) * (2-diGC))
  res <- res / sum(res) * length(aln)
  return(res)
})
expected[[1]]

res <- unlist(lapply(expected, function(x) {
  t.test(di, round(x), paired=TRUE)$p.value
}))

sum(res < 0.05)


###################################################
### chunk number 4: 
###################################################
#line 111 "08_Infra-IO02.Rnw"
sum(di)
table(as.character(sread(narrow(aln, start=34, width=2))))
i <- which(as.character(sread(narrow(aln, start=34, width=2))) == "NN")
i
sread(aln[i])


###################################################
### chunk number 5: 
###################################################
#line 119 "08_Infra-IO02.Rnw"
res[15:16]
res[15:16] < 0.05


###################################################
### chunk number 6: 
###################################################
#line 131 "08_Infra-IO02.Rnw"
library(Rsamtools)
load("na19240.Rda")


###################################################
### chunk number 7: 
###################################################
#line 136 "08_Infra-IO02.Rnw"
unlist(lapply(na19240bam[[1]], class))
l.seqs <- width(na19240bam[[1]]$seq)
t.seqs <- table(l.seqs)
t.seqs
table(na19240bam[[1]]$qwidth)
plot(x=as.numeric(names(t.seqs)), y=cumsum(t.seqs)/sum(t.seqs)*100, type="o", col="blue", xlab="Width", ylab="Percent of Reads", main="Cumulative Distribution of Read Width")


###################################################
### chunk number 8:  eval=FALSE
###################################################
## #line 151 "08_Infra-IO02.Rnw"
## as(na19240bam[[1]]$qual, "matrix")


###################################################
### chunk number 9:  eval=FALSE
###################################################
## #line 154 "08_Infra-IO02.Rnw"
## qual <- lapply(na19240bam[[1]]$qual, as.integer)


###################################################
### chunk number 10: 
###################################################
#line 157 "08_Infra-IO02.Rnw"
load("qual.Rdata")


###################################################
### chunk number 11: 
###################################################
#line 160 "08_Infra-IO02.Rnw"
mat <- matrix(NA, nrow=length(qual), ncol=max(unlist(lapply(qual, length))))
for(i in 1:length(qual)) mat[i, 1:length(qual[[i]]) ] <- qual[[i]] - 33
mat2 <- mat
for(i in 1:nrow(mat2)) mat2[i, is.na(mat2[i, ])] <- 0
medians <- apply(mat, 2, median, na.rm=TRUE)
medians2 <- apply(mat2, 2, median)
plot(1:length(medians), medians, type="o", xlab="Cycle", ylab="Median quality", col="blue", ylim=c(min(medians, medians2), max(medians, medians2)))
lines(medians2, type="o", col="red", lty=2)


###################################################
### chunk number 12: 
###################################################
#line 177 "08_Infra-IO02.Rnw"
abc <- alphabetByCycle(na19240bam[[1]]$seq)
abc <- t(abc[rowSums(abc) > 0, ])
abc <- abc / rowSums(abc) * 100
abc <- as.data.frame(abc)
library(lattice)
print(xyplot(A + C + G + T + N ~ 1:nrow(abc), data=abc, auto.key=TRUE, type=c("o", "g"), xlab="Cycle", ylab="Nucleotide Frequency (in %)"))


###################################################
### chunk number 13: 
###################################################
#line 207 "08_Infra-IO02.Rnw"
x <- round(runif(10000))
table(x)
head(x)
tail(x)


###################################################
### chunk number 14: 
###################################################
#line 214 "08_Infra-IO02.Rnw"
library(IRanges)
y <- Rle(x)
y


###################################################
### chunk number 15: 
###################################################
#line 220 "08_Infra-IO02.Rnw"
print(object.size(x) - object.size(y), units="Kb")


###################################################
### chunk number 16: 
###################################################
#line 224 "08_Infra-IO02.Rnw"
x2 <- round(runif(4000000))
y2 <- Rle(x2)
print(object.size(x2) - object.size(y2), units="Kb")


###################################################
### chunk number 17: 
###################################################
#line 236 "08_Infra-IO02.Rnw"
x[2:3]
y[2:3]
c(x[2:3], x[10])
c(y[2:3], y[10])
identical( c(y[2:3], y[10]), append(y[2:3], y[10]))


###################################################
### chunk number 18: 
###################################################
#line 244 "08_Infra-IO02.Rnw"
as.vector(y[1:10])
identical(x, as.vector(y))


###################################################
### chunk number 19: 
###################################################
#line 249 "08_Infra-IO02.Rnw"
z <- y > 0
m <- Rle(sample(c("A", "C", "T", "G"), 10000, replace=TRUE))
n <- Rle(as.factor(sample(1:10, 10000, replace=TRUE)))
o <- Rle(as.integer(x))
identical(y, o)


###################################################
### chunk number 20: 
###################################################
#line 257 "08_Infra-IO02.Rnw"
str <- strand(sample(c("+", "-"), 1000, replace=TRUE))
class(str)
levels(str)
head(str)


###################################################
### chunk number 21: 
###################################################
#line 264 "08_Infra-IO02.Rnw"
Rle(str)


###################################################
### chunk number 22: 
###################################################
#line 274 "08_Infra-IO02.Rnw"
a <- round(runif(100000, min=0, max=10000))
b <- sample(c("+", "-"), 100000, replace=TRUE)


###################################################
### chunk number 23: 
###################################################
#line 285 "08_Infra-IO02.Rnw"
e <- Rle(a)
f <- Rle(b)
sapply(unique(f), function(x) {
  set <- as.vector(e[f == x])
  res <- c(mean(set), median(set))
})


###################################################
### chunk number 24: 
###################################################
#line 294 "08_Infra-IO02.Rnw"
sapply(unique(f), function(x) {
  set <- e[f == x]
  res <- c(mean(set), median(set))
 })


###################################################
### chunk number 25: 
###################################################
#line 301 "08_Infra-IO02.Rnw"
tapply(e, f, mean)
tapply(e, f, median)
tapply(e, f, function(x) { c(mean(x), median(x)) })


###################################################
### chunk number 26: 
###################################################
#line 307 "08_Infra-IO02.Rnw"
tapply(a, b, function(x) { c(mean(x), median(x)) })


###################################################
### chunk number 27: 
###################################################
#line 312 "08_Infra-IO02.Rnw"
tapply(e, f, function(x) { summary(x)[3:4] })


###################################################
### chunk number 28: 
###################################################
#line 322 "08_Infra-IO02.Rnw"
y
rev(y)
window(y, 2, 4)


###################################################
### chunk number 29: 
###################################################
#line 328 "08_Infra-IO02.Rnw"
head(runLength(y))
head(runValue(y))


###################################################
### chunk number 30: 
###################################################
#line 333 "08_Infra-IO02.Rnw"
mat <- matrix(0, nrow=nrun(y), ncol=2)
mat[,1] <- runLength(y)
mat[,2] <- runValue(y)
head(mat)
y


###################################################
### chunk number 31: 
###################################################
#line 341 "08_Infra-IO02.Rnw"
head(start(y))
head(end(y))


###################################################
### chunk number 32: 
###################################################
#line 346 "08_Infra-IO02.Rnw"
cor(y, e[1:10000])
range(e)


###################################################
### chunk number 33: 
###################################################
#line 351 "08_Infra-IO02.Rnw"
rlelist <- RleList(y, e[1:10000])
rlelist


###################################################
### chunk number 34: 
###################################################
#line 362 "08_Infra-IO02.Rnw"
IR <- IRanges(start=1:5, end=6:10)


###################################################
### chunk number 35: 
###################################################
#line 366 "08_Infra-IO02.Rnw"
length(IR)
IR[2]
start(IR[5])
end(IR[3])
width(IR)


###################################################
### chunk number 36: 
###################################################
#line 374 "08_Infra-IO02.Rnw"
reduce(IR)
disjoin(IR)


###################################################
### chunk number 37: 
###################################################
#line 379 "08_Infra-IO02.Rnw"
ov <- findOverlaps(IR, reduce(IR))
as.matrix(ov)


###################################################
### chunk number 38: 
###################################################
#line 391 "08_Infra-IO02.Rnw"
aln


###################################################
### chunk number 39: 
###################################################
#line 401 "08_Infra-IO02.Rnw"
idx <- which(!is.na(position(aln)))
start <- position(aln[idx])
str <- strand(aln[idx]) == "-"
start[str] <- start[str] - width(aln[idx])[str] + 1
reads <- IRanges(start=start, width=width(aln[idx]))


###################################################
### chunk number 40: 
###################################################
#line 409 "08_Infra-IO02.Rnw"
cov <- coverage(reads)
cov


###################################################
### chunk number 41: 
###################################################
#line 414 "08_Infra-IO02.Rnw"
shift(IR, 10)
narrow(IR, start=1, width=2)
flank(IR, 1)


###################################################
### chunk number 42: 
###################################################
#line 434 "08_Infra-IO02.Rnw"
ovReads <- matchMatrix(findOverlaps(reads, ignoreSelf=TRUE, ignoreRedundant=TRUE))
ovReads


###################################################
### chunk number 43: 
###################################################
#line 446 "08_Infra-IO02.Rnw"
ovReadsUp <- matchMatrix(findOverlaps(reads, flank(reads, 100)))
ovReadsUp


###################################################
### chunk number 44: 
###################################################
#line 458 "08_Infra-IO02.Rnw"
rd <- RangedData( ranges=IR, space=rep("chr", 5), name=letters[1:5]) 


###################################################
### chunk number 45: 
###################################################
#line 462 "08_Infra-IO02.Rnw"
names(rd)
coverage(rd)
rd$name
rd$space
ranges(rd)


###################################################
### chunk number 46: 
###################################################
#line 478 "08_Infra-IO02.Rnw"
readsRD <- RangedData( ranges=reads, space=chromosome(aln[idx]) )
names(readsRD)


###################################################
### chunk number 47: 
###################################################
#line 483 "08_Infra-IO02.Rnw"
covRD <- lapply(readsRD, coverage)
covRD[["chr5.fa"]]
summary(covRD[["chr5.fa"]][[1]][ covRD[["chr5.fa"]][[1]] > 0])


###################################################
### chunk number 48: 
###################################################
#line 510 "08_Infra-IO02.Rnw"
GR <- GRanges(seqnames=rep("chr", 5), ranges=IR, strand=rep("*", 5), someVar=letters[1:5])
GR


###################################################
### chunk number 49: 
###################################################
#line 515 "08_Infra-IO02.Rnw"
coverage(GR)
seqlengths(GR) <- 20
coverage(GR)


###################################################
### chunk number 50: 
###################################################
#line 521 "08_Infra-IO02.Rnw"
strand(GR)
start(GR)
end(GR)
width(GR)
ranges(GR)
GR[2:3]


###################################################
### chunk number 51: 
###################################################
#line 530 "08_Infra-IO02.Rnw"
values(GR)
elementMetadata(GR)
values(GR)$someVar


###################################################
### chunk number 52: 
###################################################
#line 536 "08_Infra-IO02.Rnw"
flank(GR[5], 1)
disjoin(GR[4:5])
shift(GR[3], 2)


###################################################
### chunk number 53: 
###################################################
#line 560 "08_Infra-IO02.Rnw"
readsGR <- GRanges( seqnames=chromosome(aln[idx]), ranges=reads, strand=Rle(strand(aln[idx])))


###################################################
### chunk number 54:  eval=FALSE
###################################################
## #line 564 "08_Infra-IO02.Rnw"
## findOverlaps(readsGR, ignoreSelf=TRUE, ignoreRedundant=FALSE)


###################################################
### chunk number 55: 
###################################################
#line 568 "08_Infra-IO02.Rnw"
ov <- matchMatrix(findOverlaps(readsGR, readsGR))
removeSelf <- function(ov) {
  ov2 <- NULL
  for(i in 1:nrow(ov)) if(ov[i, 1] != ov[i, 2]) ov2 <- rbind(ov2, ov[i, ])
  return(ov2)
}
removeRedundant <- function(ov) {
  index <- apply(ov, 1, function(x) {
    res <- TRUE
    x <- as.vector(x)
    for(j in 1:nrow(ov)) {
      y <- as.vector(ov[j, ])
      if(identical(y, x))
        break
      if(identical(y, rev(x) ))
        res <- FALSE
    }
    return(res)
  })
  return(ov[index, ])
}
ov <- removeRedundant(removeSelf(ov))
ov


###################################################
### chunk number 56: 
###################################################
#line 594 "08_Infra-IO02.Rnw"
ovReads


###################################################
### chunk number 57: 
###################################################
#line 598 "08_Infra-IO02.Rnw"
matchMatrix(findOverlaps(readsGR, flank(readsGR, 100)))
ovReadsUp


###################################################
### chunk number 58: 
###################################################
#line 610 "08_Infra-IO02.Rnw"
grList <- split(GR)
class(grList)


###################################################
### chunk number 59: 
###################################################
#line 615 "08_Infra-IO02.Rnw"
grList[1:2]


###################################################
### chunk number 60: 
###################################################
#line 619 "08_Infra-IO02.Rnw"
coverage(grList)
strand(grList)


###################################################
### chunk number 61: 
###################################################
#line 630 "08_Infra-IO02.Rnw"
sessionInfo()


