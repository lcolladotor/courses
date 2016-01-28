###################################################
### chunk number 1: 
###################################################
2 + 3


###################################################
### chunk number 2: 
###################################################
library(ALL)
data(ALL)
ALL
varLabels(ALL)


###################################################
### chunk number 3: 
###################################################
bcell <- grep("^B", as.character(ALL$BT)) #$


###################################################
### chunk number 4: 
###################################################
subset.mol.biol <- ALL$mol.biol %in% c("BCR/ABL", "NEG") #$


###################################################
### chunk number 5: 
###################################################
subset.pos <- intersect(bcell, which(subset.mol.biol == TRUE))
ALL.work <- ALL[,subset.pos]


###################################################
### chunk number 6: 
###################################################
ALL.work$BT <- factor(ALL.work$BT)
ALL.work$mol.biol <- factor(ALL.work$mol.biol)


###################################################
### chunk number 7: 
###################################################
library(genefilter)
library(hgu95av2.db)
filtered <- nsFilter(ALL.work, var.fun=IQR, var.cutoff=0.5, feature.exclude="^AFFX", require.entrez=TRUE, require.GOBP=TRUE, remove.dupEntrez=TRUE)


###################################################
### chunk number 8: 
###################################################
filtered$filter.log$numDupsRemoved


###################################################
### chunk number 9: 
###################################################
filtered$filter.log$feature.exclude


###################################################
### chunk number 10: 
###################################################
filtered$filter.log$numLowVar


###################################################
### chunk number 11: 
###################################################
filtered$filter.log$numNoGO.BP


###################################################
### chunk number 12: 
###################################################
filtered$filter.log$numRemoved.ENTREZID


