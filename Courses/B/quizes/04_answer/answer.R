library(biomaRt)
listDatabases()
help(package=biomaRt)
listMarts()

mart <- useMart("uniprot_mart")
listDatasets(mart)

uni <- useMart("uniprot_mart", dataset="UNIPROT")

listFilters(uni, what = c("name", "description", "options"))
?listFilters

info <- getBM(attributes=c("ec_number"), filters = "superregnum_name", values = "Viruses", mart = uni, checkFilters = FALSE)
dim(info)
listAttributes(uni)
?getBM

virus <- getBM(attributes = c("ec_number","organism"), filters = "superregnum_name", values = "Viruses",mart=uni)
dim(virus)
