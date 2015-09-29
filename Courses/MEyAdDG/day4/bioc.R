###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
start <- c(3, 7, 100)
end <- c(5, 20, 200)
chr <- c("chr1", "chr1", "chr2")
strand <- c("+", "-", "+")
df <- data.frame(chr = chr,
strand = strand, start = start,
end = end)
df


###################################################
### chunk number 3: 
###################################################
library(IRanges)
RD <- RangedData(ranges = IRanges(start = start,
end = end), strand = strand, space = chr)
RD


###################################################
### chunk number 4: 
###################################################
range(ranges(RD))


###################################################
### chunk number 5: 
###################################################
ir <- IRanges(c(1, 8, 14, 15, 19, 34,
40), width = c(12, 6, 6, 15, 6,
2, 7))
strand <- rep(c("+", "-"), c(4, 3))
rd <- RangedData(ranges = ir, strand = strand,
space = "chr1")


###################################################
### chunk number 6: 
###################################################
start(rd)
end(rd)
width(rd)


###################################################
### chunk number 7: 
###################################################
rd[2:5,]
ranges(rd[2:5,])


###################################################
### chunk number 8: 
###################################################
rd2 <- rd
ranges(rd2) <- shift(ranges(rd2), 2)
rd2[2:5, ]


###################################################
### chunk number 9: 
###################################################
rd3 <- rd
pos <- values(rd3)[, "strand"] == "+"
ranges(rd3)[pos] <- resize(ranges(rd)[pos],
120)
ranges(rd3)[!pos] <- resize(ranges(rd)[!pos],
120, start = FALSE)
rd3[2:5,]


###################################################
### chunk number 10: 
###################################################
ranges(rd3) <- restrict(ranges(rd3),
1)
rd3[2:5,]


###################################################
### chunk number 11: 
###################################################
reduce(ranges(rd))
gaps(ranges(rd))
disjoin(ranges(rd))


###################################################
### chunk number 12: 
###################################################
ol <- findOverlaps(ranges(rd), reduce(ranges(rd)))
as.matrix(ol)[1:3,]
cover <- coverage(ranges(rd))
cover


###################################################
### chunk number 13:  eval=FALSE
###################################################
## bsub <- useMart("bacterial_mart_3", dataset = "bac_6_gene")
## head(listAttributes(bsub))


###################################################
### chunk number 14:  eval=FALSE
###################################################
## pos <- makeGeneRegion(12000, 20000, chromosome="Chromosome", strand = "+", biomart=bsub)


###################################################
### chunk number 15:  eval=FALSE
###################################################
## neg <- makeGeneRegion(12000, 20000, chromosome="Chromosome", strand = "-", biomart=bsub)
## gdPlot(list("+"=pos, "-"=neg, Bsub=makeGenomeAxis()))


###################################################
### chunk number 16: 
###################################################
sessionInfo()


