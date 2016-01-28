library(annotate)
inf <- getSEQ("CY045495.1")
library(Biostrings)
DNAString(inf)

help.start()
help(package=annotate)

?pm.abstGrep
?pm.getabst
?pmidQuery
pmidQuery("19617889")
?pmid2MIAME
pmid2MIAME("19617889")
?buildPubMedAbst

#19679224 #19617889
x <- pubmed("19679224")
a <- xmlRoot(x)
abs <- buildPubMedAbst(a[[1]])
attributes(abs)
abstText(abs)
authors(abs)

?getPMInfo

demo <- pubmed("19679224")
b <- getPMInfo(demo)
b[[1]]$authors

?genbank
g <- genbank("CY045495.1")

xmlNativeTreeParse(g)
xmlSchemaParse(g)

head(g)
xmlTreeParse(g)]
xmlChildren(g)


?UniGeneQuery
?accessionToUID
accessionToUID("CY045495.1")


?entrezGeneQuery
#entrezGeneQuery("257127071")
#entrezGeneQuery("CY045495.1")

?entrezGeneByID

entrezGeneByID("257127071")

?getQueryLink

getQueryLink("CY045495.1", repository = "gb")


library(biomaRt)
listMarts()

a <- useMart("intermart-1")
listDatasets(a)

b <- useDataset("protein", mart = a)

listFilters(b)
listAttributes(b)

library(biomaRt)
listMarts()

mart <- useMart("bacterial_mart_54")
listDatasets(mart)
bsub <- useDataset("bac_6_gene", mart = mart)
bsub <- useMart("bacterial_mart_54", dataset = "bac_6_gene")
head(listAttributes(bsub))

a <- listAttributes(bsub)
dim(a)
head(a, n=25)

head(listFilters(bsub))

res <- getBM(attributes=c("start_position", "end_position", "strand", "source", "status"), filters= c("start", "end"), values = list("1", "100000"), mart = bsub)
res

library(lattice)
xyplot(end_position~start_position | status, group=strand, data=res, auto.key=T)

?getGene

library(annotate)
seq <- getSEQ("CY045495.1")

library(biomaRt)
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

go=c("GO:0051330","GO:0000080","GO:0000114")
chrom=c(1,2,"Y")
getBM(attributes= "hgnc_symbol", filters=c("go","chromosome_name"), values=list(go,chrom), mart=ensembl)
listAttributes(ensembl)


refseqids = c("NM_005359", "NM_000546")
ipro = getBM(attributes = c("refseq_dna", "interpro", "interpro_description"), filters= values = refseqids, mart = ensembl)

entrez = c("673", "7157", "837")
entrez <- c("999", "1000", "1001")
a <- getSequence(id = entrez, type = "entrezgene", seqType = "coding_gene_flank", upstream = 100, mart = ensembl)
?getSequence
?gsub


library(GEOquery)
?getGEO
help(package=GEOquery)
gds <- getGEO("GDS10")
     gds

pr <- getGEO("GSM447608")
pr <- getGEO("GSM377792")

apropos("GSM")
?GSMList
