###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
library(Biostrings)
library(BSgenome)
library(biomaRt)
library(GenomeGraphs)


###################################################
### chunk number 3: 
###################################################
DNA_ALPHABET


###################################################
### chunk number 4: 
###################################################
seq <- sample(DNA_ALPHABET[1:4], size = 24, replace = TRUE)
seq <- DNAString(paste(seq, collapse = ""))
seq


###################################################
### chunk number 5: 
###################################################
alphabetFrequency(seq, baseOnly = T, as.prob = T)


###################################################
### chunk number 6: 
###################################################
reverseComplement(seq)


###################################################
### chunk number 7: 
###################################################
translate(seq)


###################################################
### chunk number 8: 
###################################################
seq[3:10]


###################################################
### chunk number 9: 
###################################################
subseq(seq, start = 3, end = 10)
subseq(seq, start = 3, width = 8)
subseq(seq, end = 10, width = 8)


###################################################
### chunk number 10: 
###################################################
subseq(seq, start = 1, end = -4)


###################################################
### chunk number 11: 
###################################################
set <- NULL
for(i in c(1:4)) 
	set <- c(set, paste(sample(DNA_ALPHABET[1:4], 30, replace = T), collapse = ""))
set
set <- DNAStringSet(set)
set


###################################################
### chunk number 12: 
###################################################
names(set) <- seq(4)
set


###################################################
### chunk number 13:  eval=FALSE
###################################################
## available.genomes()


###################################################
### chunk number 14: 
###################################################
require(BSgenome.Ecoli.NCBI.20080805)


###################################################
### chunk number 15: 
###################################################
Views(Ecoli$NC_008563, start = c(10, 20, 30, 40), end = c(50, 60, 70, 80))
Views(Ecoli$NC_008563, start = c(10, 20, 30, 40), end = c(50, 60))
Views(Ecoli$NC_008563, start = c(10, 20, 30, 40), width = c(100))


###################################################
### chunk number 16: 
###################################################
v1 <- Views(Ecoli$NC_008563, start = sample(seq(length(Ecoli$NC_008563)), size = 1000, replace = TRUE), width = sample(50:500, size = 1000, replace = TRUE))
v2 <- Views(Ecoli$NC_008563, start = sample(seq(length(Ecoli$NC_008563)), size = 100, replace = TRUE), width = sample(50:500, size = 100, replace = TRUE))
alphabetFrequency(v1, baseOnly = T, as.prob = T, collapse = T)
alphabetFrequency(v2, baseOnly = T, as.prob = T, collapse = T)
alphabetFrequency(Ecoli$NC_008563, baseOnly = T, as.prob = T)


###################################################
### chunk number 17: 
###################################################
v1 <- Views(Ecoli$NC_008563, start = seq(from = 1, to = 9901, by = 10), width = 100)
v2 <- successiveViews(Ecoli$NC_008563, from = 1, width = rep(100, 991), gapwidth = -90)
head(v1)
tail(v2)


###################################################
### chunk number 18: 
###################################################
fragment <- Ecoli$NC_008563
motif <- DNAString("GAATTC")
tail(matchPattern(motif, fragment))


###################################################
### chunk number 19: 
###################################################
m1 <- DNAStringSet("GAATTC")
m2 <- DNAStringSet("GGATCC")
dict <- PDict(append(m1, m2))
restrict <- matchPDict(dict, fragment)
restrict
tail(restrict[[1]])


