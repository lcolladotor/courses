###################################################
### chunk number 1: 
###################################################
#line 50 "09_Infra-IO03.Rnw"
options(width=40)


###################################################
### chunk number 2: 
###################################################
#line 109 "09_Infra-IO03.Rnw"
library(ShortRead)
aln <- readAligned(dirPath=".", pattern="R017_8_iterative.map", type="Bowtie")
print(object.size(aln), units="Mb")
alnShort <- readAligned(dirPath=".", pattern="R017_8_iterative_short.map", type="Bowtie")
print(object.size(alnShort), units="Mb")


###################################################
### chunk number 3: 
###################################################
#line 122 "09_Infra-IO03.Rnw"
sessionInfo()


