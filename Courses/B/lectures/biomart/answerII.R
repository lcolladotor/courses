library(biomaRt)
ensembl <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")
secs <- getSequence(id = c("999", "1000", "1001"), type = "entrezgene", seqType = "coding_gene_flank", upstream=100, mart = ensembl)
gc <- NULL
for (i in 1:3) {
  gc <- c(gc, nchar(gsub("([AT])", "", secs[i,1])))
}
gc
