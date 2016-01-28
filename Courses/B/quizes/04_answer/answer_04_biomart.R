###################################################
### chunk number 1: 
###################################################
library(biomaRt)
library(lattice)
bsub <- useMart("bacterial_mart_54", dataset = "bac_6_gene")
res <- getBM(attributes=c("start_position", "end_position", "strand", "status"), filters= c("start", "end"), values = list("1", "100000"), mart = bsub)
print(xyplot(end_position~start_position | status, group=strand, data=res, auto.key=T, main = "B. subtilus"))


###################################################
### chunk number 2: 
###################################################
coli <- useMart("bacterial_mart_54", dataset = "esc_32471_gene") # Escherichia coli O17:K52:H18 UMN026
res2 <- getBM(attributes=c("start_position", "end_position", "strand", "status"), filters= c("start", "end"), values = list("1", "100000"), mart = coli)
print(xyplot(end_position~start_position | status, group=strand, data=res2, auto.key=T, main = "E. coli 017:K52:H18 UMN026"))


###################################################
### chunk number 3: 
###################################################
anthrax <- useMart("bacterial_mart_54", dataset = "bac_20000_gene") # Bacillus anthracis Sterne
res3 <- getBM(attributes=c("start_position", "end_position", "strand", "status"), filters= c("start", "end"), values = list("1", "100000"), mart = anthrax)
print(xyplot(end_position~start_position | status, group=strand, data=res3, auto.key = T, main = "B. anthracis"))


###################################################
### chunk number 4: 
###################################################
dim(res)
dim(res2)
dim(res3)


