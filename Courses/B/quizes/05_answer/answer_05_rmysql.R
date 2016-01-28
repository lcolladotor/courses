###################################################
### chunk number 1: 
###################################################
library(RMySQL)
con <- dbConnect(MySQL(), user = "mnoe",password = "eonm", dbname = "promoterdb", host = "mitla.lcg.unam.mx")
dbListTables(con)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## df <- dbGetQuery(con, "SELECT * FROM Promoter")
## dim(df)
## library(lattice)
## densityplot(~pos_1 | as.factor(promoter_sigma), data=df)
## dbDisconnect(con)


