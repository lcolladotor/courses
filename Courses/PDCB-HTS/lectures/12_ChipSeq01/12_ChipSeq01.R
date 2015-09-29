###################################################
### chunk number 1: 
###################################################
#line 50 "12_ChipSeq01.Rnw"
options(width=40)


###################################################
### chunk number 2: 
###################################################
#line 314 "12_ChipSeq01.Rnw"
library(BayesPeak)


###################################################
### chunk number 3:  eval=FALSE
###################################################
## #line 317 "12_ChipSeq01.Rnw"
## raw.output <- bayespeak("H3K4me3-chr16.bed", "Input-chr16.bed",
## 			chr = "chr16", start = 9.2E7, end = 9.5E7, job.size = 6E6)
## output <- summarize.peaks(raw.output, method = "lowerbound")


###################################################
### chunk number 4:  eval=FALSE
###################################################
## #line 322 "12_ChipSeq01.Rnw"
## save(raw.output, output, file="out.Rdata")


###################################################
### chunk number 5: 
###################################################
#line 325 "12_ChipSeq01.Rnw"
load("out.Rdata")


###################################################
### chunk number 6: 
###################################################
#line 328 "12_ChipSeq01.Rnw"
class(raw.output)
names(raw.output)
head(output)


###################################################
### chunk number 7: 
###################################################
#line 372 "12_ChipSeq01.Rnw"
data(raw.output)


###################################################
### chunk number 8: 
###################################################
#line 380 "12_ChipSeq01.Rnw"
plot.overfitdiag(raw.output, whatX = "calls", whatY = "score",
	logX = TRUE, logY = FALSE)


###################################################
### chunk number 9: 
###################################################
#line 388 "12_ChipSeq01.Rnw"
plot.overfitdiag(raw.output, whatX = "lambda1", whatY = "score",
	logX = TRUE, logY = TRUE)


###################################################
### chunk number 10: 
###################################################
#line 399 "12_ChipSeq01.Rnw"
unreliable.jobs <- log(raw.output$QC$lambda1) < 1.5
output <- summarize.peaks(raw.output, method = "lowerbound",
	exclude.jobs = unreliable.jobs)
unreliable.jobs2 <- log(raw.output$QC$lambda1) < 1.5 | log(raw.output$QC$calls) > 5
output.2 <- summarize.peaks(raw.output, method = "lowerbound",
	exclude.jobs = unreliable.jobs2)
nrow(output)
nrow(output.2)


###################################################
### chunk number 11:  eval=FALSE
###################################################
## #line 417 "12_ChipSeq01.Rnw"
## unreliable.jobs3 <- region.overfitdiag(raw.output, whatX = "lambda1", whatY = "score",
## 	logX = TRUE, logY = TRUE)
## ##user defines a polygon on the resulting plot
## ##left-click to place each vertex, right-click to close polygon
## output.3 <- summarize.peaks(raw.output, method = "lowerbound",
## 	exclude.jobs = unreliable.jobs3)


###################################################
### chunk number 12: 
###################################################
#line 443 "12_ChipSeq01.Rnw"
sessionInfo()


