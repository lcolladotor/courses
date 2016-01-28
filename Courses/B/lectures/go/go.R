###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## library("ALL")
## library("Biobase")
## library("annotate")
## library("hgu95av2.db")
## library("genefilter")
## library("annaffy")
## library("GO.db")
## library("GOstats")
## library("biomaRt")
## library("hgu133a.db")
## library("lattice")


###################################################
### chunk number 3: 
###################################################
library("ALL")
data("ALL")
types <- c("ALL1/AF4", "BCR/ABL")
bcell <- grep("^B", as.character(ALL$BT))
ALL_af4bcr <- ALL[, intersect(bcell,
	which(ALL$mol.biol %in% types))]
ALL_af4bcr$mol.biol <- factor(ALL_af4bcr$mol.biol)


###################################################
### chunk number 4: 
###################################################
table(ALL_af4bcr$mol.biol)


###################################################
### chunk number 5: 
###################################################
qrange <- function(x)
	diff(quantile(x, c(0.1, 0.9)))


###################################################
### chunk number 6: 
###################################################
suppressWarnings(library("genefilter"))
library("hgu95av2.db")
filt_af4bcr <- nsFilter(ALL_af4bcr, require.entrez = TRUE, 
	require.GOBP = TRUE, var.fun = qrange, var.cutoff = 0.5)
ALLfilt_af4bcr <- filt_af4bcr$eset	


###################################################
### chunk number 7: 
###################################################
library("Biobase")
library("annotate")


###################################################
### chunk number 8: 
###################################################
rt <- rowttests(ALLfilt_af4bcr, "mol.biol")
names(rt)


###################################################
### chunk number 9: 
###################################################
hist(rt$statistic, breaks=100, col="skyblue")


###################################################
### chunk number 10: 
###################################################
hist(rt$p.value, breaks=100, col="mistyrose")


###################################################
### chunk number 11: 
###################################################
sel <- order(rt$p.value)[1:400]
ALLsub <- ALLfilt_af4bcr[sel,]


###################################################
### chunk number 12: 
###################################################
EG <- as.character(hgu95av2ENTREZID[featureNames(ALL)])
EGsub <- as.character(hgu95av2ENTREZID[featureNames(ALLsub)])


###################################################
### chunk number 13: 
###################################################
head(table(EG))
table(table(EG))
table(table(EGsub))


###################################################
### chunk number 14: 
###################################################
syms <- as.character(hgu95av2SYMBOL[featureNames(ALLsub)])
whFeat <- names(which(syms == "CD44"))


###################################################
### chunk number 15: 
###################################################
ordSamp <- order(ALLsub$mol.biol)
CD44 <- ALLsub[whFeat, ordSamp]


###################################################
### chunk number 16: 
###################################################
plot(as.vector(exprs(CD44)), main=whFeat, col=c("sienna", "tomato")[CD44$mol.biol], pch=c(15, 16)[CD44$mol.biol], ylab="expression")


###################################################
### chunk number 17: 
###################################################
z <- toTable(hgu95av2CHR[featureNames(ALLsub)])
chrtab <- table(z$chromosome)
chrtab
chridx <- sub("X", "23", names(chrtab))
chridx <- sub("Y", "24", chridx)
barplot(chrtab[order(as.integer(chridx))], cex.names=0.5, col=rainbow(24))


###################################################
### chunk number 18: 
###################################################
library("annaffy")
anncols <- aaf.handler(chip="hgu95av2.db")[c(1:3, 8:9, 11:13)]
anntable <- aafTableAnn(featureNames(ALLsub), 
	"hgu95av2.db", anncols)
saveHTML(anntable, "ALLsub.html", title="The Features in ALLsub")


###################################################
### chunk number 19:  eval=FALSE
###################################################
## localURL = file.path(getwd(), "ALLsub.html")
## browseURL(localURL)


###################################################
### chunk number 20: 
###################################################
probeSetsPerGene <- split(names(EG), EG)
j <- probeSetsPerGene$"7013"
j


###################################################
### chunk number 21: 
###################################################
plot(t(exprs(ALL_af4bcr)[j[c(1,7)], ]), asp=1, pch=16,
	col=ifelse(ALL_af4bcr$mol.biol == "ALL1/AF4", "black", "grey"))


###################################################
### chunk number 22: 
###################################################
library("lattice")
mat <- exprs(ALL_af4bcr)[j,]
mat <- mat - rowMedians(mat)
ro <- order.dendrogram(as.dendrogram(hclust(dist(mat))))
co <- order.dendrogram(as.dendrogram(hclust(dist(t(mat)))))
at <- seq(-1, 1, length=21) * max(abs(mat))
lp <- levelplot(t(mat[ro, co]),
	aspect = "fill", at = at,
	scales = list(x = list(rot=90)),
	colorkey = list(space = "left"))
print(lp)


###################################################
### chunk number 23: 
###################################################
ps_chr <- toTable(hgu95av2CHR)
ps_eg <- toTable(hgu95av2ENTREZID)
chr <- merge(ps_chr, ps_eg)
dim(chr)


###################################################
### chunk number 24: 
###################################################
chr <- unique(chr[, colnames(chr)!="probe_id"])
dim(chr)
head(chr)


###################################################
### chunk number 25: 
###################################################
table(table(chr$gene_id))


###################################################
### chunk number 26: 
###################################################
chr <- chr[!duplicated(chr$gene_id), ]


###################################################
### chunk number 27: 
###################################################
isdiff <- chr$gene_id %in% EGsub
tab <- table(isdiff, chr$chromosome)
tab


###################################################
### chunk number 28: 
###################################################
fisher.test(tab, simulate.p.value=TRUE)


###################################################
### chunk number 29: 
###################################################
chisq.test(tab)


###################################################
### chunk number 30: 
###################################################
chrloc <- toTable(hgu95av2CHRLOC[featureNames(ALLsub)])
head(chrloc)


###################################################
### chunk number 31: 
###################################################
table(table(chrloc$probe_id))


###################################################
### chunk number 32: 
###################################################
strds <- with(chrloc, unique(cbind(probe_id, sign(start_location))))
table(strds[,2])


###################################################
### chunk number 33: 
###################################################
library("GO.db")
as.list(GOMFCHILDREN["GO:0008094"])
as.list(GOMFOFFSPRING["GO:0008094"])


###################################################
### chunk number 34: 
###################################################
library("GOstats")
affyUniverse <- featureNames(ALLfilt_af4bcr)
uniId <- hgu95av2ENTREZID[affyUniverse]
entrezUniverse <- unique(as.character(uniId))
params <- new("GOHyperGParams", 
	geneIds = EGsub, universeGeneIds = entrezUniverse,
	annotation = "hgu95av2", ontology = "BP",
	pvalueCutoff =0.001, conditional = FALSE,
	testDirection = "over")


###################################################
### chunk number 35: 
###################################################
myhyper <- hyperGTest(params)


###################################################
### chunk number 36: 
###################################################
hist(pvalues(myhyper), breaks=50, col="mistyrose")


###################################################
### chunk number 37: 
###################################################
sum <- summary(myhyper, p=0.001)
head(sum)


###################################################
### chunk number 38: 
###################################################
GOTERM[["GO:0032945"]]


###################################################
### chunk number 39: 
###################################################
goCats <- unlist(eapply(GOTERM, Ontology))
old <- table(goCats)[c("BP", "CC", "MF")]


###################################################
### chunk number 40: 
###################################################
query <- "select ontology from go_term"
goCats <- dbGetQuery(GO_dbconn(), query)
new <- table(goCats)[c("BP", "CC", "MF")]


###################################################
### chunk number 41: 
###################################################
identical(old, new)


###################################################
### chunk number 42: 
###################################################
sessionInfo()


