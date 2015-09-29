###################################################
### chunk number 1: 
###################################################
#line 50 "granges.Rnw"
options(width=40)


###################################################
### chunk number 2: 
###################################################
#line 88 "granges.Rnw"
library(ShortRead)
exptPath <- system.file("extdata", package = "ShortRead")
sp <- SolexaPath(exptPath)
aln <- readAligned(sp, "s_2_export.txt")


###################################################
### chunk number 3: 
###################################################
#line 103 "granges.Rnw"
x <- round(runif(10000))
table(x)
head(x)
tail(x)


###################################################
### chunk number 4: 
###################################################
#line 110 "granges.Rnw"
library(IRanges)
y <- Rle(x)
y


###################################################
### chunk number 5: 
###################################################
#line 116 "granges.Rnw"
print(object.size(x) - object.size(y), units="Kb")


###################################################
### chunk number 6: 
###################################################
#line 120 "granges.Rnw"
x2 <- round(runif(4000000))
y2 <- Rle(x2)
print(object.size(x2) - object.size(y2), units="Kb")


###################################################
### chunk number 7: 
###################################################
#line 132 "granges.Rnw"
x[2:3]
y[2:3]
c(x[2:3], x[10])
c(y[2:3], y[10])
identical( c(y[2:3], y[10]), append(y[2:3], y[10]))


###################################################
### chunk number 8: 
###################################################
#line 140 "granges.Rnw"
as.vector(y[1:10])
identical(x, as.vector(y))


###################################################
### chunk number 9: 
###################################################
#line 145 "granges.Rnw"
z <- y > 0
m <- Rle(sample(c("A", "C", "T", "G"), 10000, replace=TRUE))
n <- Rle(as.factor(sample(1:10, 10000, replace=TRUE)))
o <- Rle(as.integer(x))
identical(y, o)


###################################################
### chunk number 10: 
###################################################
#line 153 "granges.Rnw"
str <- strand(sample(c("+", "-"), 1000, replace=TRUE))
class(str)
levels(str)
head(str)


###################################################
### chunk number 11: 
###################################################
#line 160 "granges.Rnw"
Rle(str)


###################################################
### chunk number 12: 
###################################################
#line 170 "granges.Rnw"
a <- round(runif(100000, min=0, max=10000))
b <- sample(c("+", "-"), 100000, replace=TRUE)


###################################################
### chunk number 13: 
###################################################
#line 181 "granges.Rnw"
e <- Rle(a)
f <- Rle(b)
sapply(unique(f), function(x) {
  set <- as.vector(e[f == x])
  res <- c(mean(set), median(set))
})


###################################################
### chunk number 14: 
###################################################
#line 190 "granges.Rnw"
sapply(unique(f), function(x) {
  set <- e[f == x]
  res <- c(mean(set), median(set))
 })


###################################################
### chunk number 15: 
###################################################
#line 197 "granges.Rnw"
tapply(e, f, mean)
tapply(e, f, median)
tapply(e, f, function(x) { c(mean(x), median(x)) })


###################################################
### chunk number 16: 
###################################################
#line 203 "granges.Rnw"
tapply(a, b, function(x) { c(mean(x), median(x)) })


###################################################
### chunk number 17: 
###################################################
#line 208 "granges.Rnw"
tapply(e, f, function(x) { summary(x)[3:4] })


###################################################
### chunk number 18: 
###################################################
#line 218 "granges.Rnw"
y
rev(y)
window(y, 2, 4)


###################################################
### chunk number 19: 
###################################################
#line 224 "granges.Rnw"
head(runLength(y))
head(runValue(y))


###################################################
### chunk number 20: 
###################################################
#line 229 "granges.Rnw"
mat <- matrix(0, nrow=nrun(y), ncol=2)
mat[,1] <- runLength(y)
mat[,2] <- runValue(y)
head(mat)
y


###################################################
### chunk number 21: 
###################################################
#line 237 "granges.Rnw"
head(start(y))
head(end(y))


###################################################
### chunk number 22: 
###################################################
#line 242 "granges.Rnw"
cor(y, e[1:10000])
range(e)


###################################################
### chunk number 23: 
###################################################
#line 247 "granges.Rnw"
rlelist <- RleList(y, e[1:10000])
rlelist


###################################################
### chunk number 24: 
###################################################
#line 258 "granges.Rnw"
IR <- IRanges(start=1:5, end=6:10)


###################################################
### chunk number 25: 
###################################################
#line 262 "granges.Rnw"
length(IR)
IR[2]
start(IR[5])
end(IR[3])
width(IR)


###################################################
### chunk number 26: 
###################################################
#line 270 "granges.Rnw"
reduce(IR)
disjoin(IR)


###################################################
### chunk number 27: 
###################################################
#line 275 "granges.Rnw"
ov <- findOverlaps(IR, reduce(IR))
as.matrix(ov)


###################################################
### chunk number 28: 
###################################################
#line 287 "granges.Rnw"
aln


###################################################
### chunk number 29: 
###################################################
#line 297 "granges.Rnw"
idx <- which(!is.na(position(aln)))
start <- position(aln[idx])
str <- strand(aln[idx]) == "-"
start[str] <- start[str] - width(aln[idx])[str] + 1
reads <- IRanges(start=start, width=width(aln[idx]))


###################################################
### chunk number 30: 
###################################################
#line 305 "granges.Rnw"
cov <- coverage(reads)
cov


###################################################
### chunk number 31: 
###################################################
#line 310 "granges.Rnw"
shift(IR, 10)
narrow(IR, start=1, width=2)
flank(IR, 1)


###################################################
### chunk number 32: 
###################################################
#line 330 "granges.Rnw"
ovReads <- matchMatrix(findOverlaps(reads, ignoreSelf=TRUE, ignoreRedundant=TRUE))
ovReads


###################################################
### chunk number 33: 
###################################################
#line 342 "granges.Rnw"
ovReadsUp <- matchMatrix(findOverlaps(reads, flank(reads, 100)))
ovReadsUp


###################################################
### chunk number 34: 
###################################################
#line 354 "granges.Rnw"
rd <- RangedData( ranges=IR, space=rep("chr", 5), name=letters[1:5]) 


###################################################
### chunk number 35: 
###################################################
#line 358 "granges.Rnw"
names(rd)
coverage(rd)
rd$name
rd$space
ranges(rd)


###################################################
### chunk number 36: 
###################################################
#line 374 "granges.Rnw"
readsRD <- RangedData( ranges=reads, space=chromosome(aln[idx]) )
names(readsRD)


###################################################
### chunk number 37: 
###################################################
#line 379 "granges.Rnw"
covRD <- lapply(readsRD, coverage)
covRD[["chr5.fa"]]
summary(covRD[["chr5.fa"]][[1]][ covRD[["chr5.fa"]][[1]] > 0])


###################################################
### chunk number 38: 
###################################################
#line 406 "granges.Rnw"
GR <- GRanges(seqnames=rep("chr", 5), ranges=IR, strand=rep("*", 5), someVar=letters[1:5])
GR


###################################################
### chunk number 39: 
###################################################
#line 411 "granges.Rnw"
coverage(GR)
seqlengths(GR) <- 20
coverage(GR)


###################################################
### chunk number 40: 
###################################################
#line 417 "granges.Rnw"
strand(GR)
start(GR)
end(GR)
width(GR)
ranges(GR)
GR[2:3]


###################################################
### chunk number 41: 
###################################################
#line 426 "granges.Rnw"
values(GR)
elementMetadata(GR)
values(GR)$someVar


###################################################
### chunk number 42: 
###################################################
#line 432 "granges.Rnw"
flank(GR[5], 1)
disjoin(GR[4:5])
shift(GR[3], 2)


###################################################
### chunk number 43: 
###################################################
#line 456 "granges.Rnw"
readsGR <- GRanges( seqnames=chromosome(aln[idx]), ranges=reads, strand=Rle(strand(aln[idx])))


###################################################
### chunk number 44:  eval=FALSE
###################################################
## #line 460 "granges.Rnw"
## findOverlaps(readsGR, ignoreSelf=TRUE, ignoreRedundant=FALSE)


###################################################
### chunk number 45: 
###################################################
#line 464 "granges.Rnw"
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
### chunk number 46: 
###################################################
#line 490 "granges.Rnw"
ovReads


###################################################
### chunk number 47: 
###################################################
#line 494 "granges.Rnw"
matchMatrix(findOverlaps(readsGR, flank(readsGR, 100)))
ovReadsUp


###################################################
### chunk number 48: 
###################################################
#line 506 "granges.Rnw"
grList <- split(GR)
class(grList)


###################################################
### chunk number 49: 
###################################################
#line 511 "granges.Rnw"
grList[1:2]


###################################################
### chunk number 50: 
###################################################
#line 515 "granges.Rnw"
coverage(grList)
strand(grList)


###################################################
### chunk number 51: 
###################################################
#line 526 "granges.Rnw"
sessionInfo()


