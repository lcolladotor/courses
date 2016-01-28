###################################################
### chunk number 1: 
###################################################
library(Biostrings)


###################################################
### chunk number 2: 
###################################################
library("BSgenome.Hsapiens.UCSC.hg18")


###################################################
### chunk number 3:  eval=FALSE
###################################################
## Hsapiens


###################################################
### chunk number 4: 
###################################################
chr18NoN<-mask(Hsapiens$chr18,"N")
alphabetFrequency(Hsapiens$chr18,as.prob=TRUE)["N"] 
#
matchPattern("GAGCCATGTTCATGCCACTG",chr18NoN)
xsw<-reverseComplement(DNAString("CAAACCCGACTACCAGCAAC"))
matchPattern(xsw,chr18NoN)
#
GAAA<-paste(rep("GAAA", 21), collapse="")
mT<-matchPattern(GAAA,chr18NoN)
countPattern(GAAA,chr18NoN) 
length(mT)
mT
#
GAAA.x<-paste(rep("GAAA", 18), collapse="")
mT<-matchPattern(GAAA.x,chr18NoN)
countPattern(GAAA.x,chr18NoN) 
length(mT)
mT


###################################################
### chunk number 5: 
###################################################
seqR1<-RNAString("UCUUCCGAGACGAUGCUAGCAGCUAGCUAG")
seqD1<-cDNA(seqR1)
seqD1
reverse(seqD1)
translate(seqD1)


###################################################
### chunk number 6:  eval=FALSE
###################################################
## f1 <- system.file("extdata", "someORF.fa", package="Biostrings")
## file.info(f1)
## f1
## ff <- readFASTA(f1, strip.descs=TRUE)
## writeFASTA(ff, file="", append=FALSE, width=80)


###################################################
### chunk number 7: 
###################################################
pairwiseAlignment(pattern = c("superman"), subject = "supercalifragilisticexpialidocious")
pairwiseAlignment(pattern = c("batman"), subject = "supercalifragilisticexpialidocious")
pairwiseAlignment("spiderman", "humptydumpty", type = "overlap", gapOpening = -2, gapExtension = -1)


###################################################
### chunk number 8: 
###################################################
data(BLOSUM62)
pairwiseAlignment(AAString("RRLCYDRRSI"), AAString("HAQTYVALKYDRRSIERWW"), substitutionMatrix = BLOSUM62, gapOpening = -12, gapExtension = -4)


###################################################
### chunk number 9: 
###################################################
N <- as.integer(seq(500, 5000, by = 500))
timings <- rep(0, length(N))
names(timings) <- as.character(N)
for (i in seq_len(length(N))) {
string1 <- DNAString(paste(sample(DNA_ALPHABET[1:4],
N[i], replace = TRUE), collapse = ""))
string2 <- DNAString(paste(sample(DNA_ALPHABET[1:4],
N[i], replace = TRUE), collapse = ""))
timings[i] <- system.time(pairwiseAlignment(string1,
string2, type = "global"))[["user.self"]]
}
timings
coef(summary(lm(timings ~ poly(N, 2))))
plot(N, timings, xlab = "String Size, Both Strings", ylab = "Timing (sec.)",
type = "l", main = "Global Pairwise Sequence Alignment Timings")



###################################################
### chunk number 10:  eval=FALSE
###################################################
## source("http://bioconductor.org/biocLite.R")
## biocLite("Biostrings")


###################################################
### chunk number 11: 
###################################################
sessionInfo()


