###################################################
### chunk number 1:  eval=FALSE
###################################################
## combn(c("Fer", "Sur", "Mariana"), 2)


###################################################
### chunk number 2: 
###################################################
fiesta.1 <- c(0.2, 0.4, 0.3, 0.1)
names(fiesta.1) <- c("Sobrio", "Happy", "Pedo", "Muerto")
fiesta.2 <- NULL
for (i in 1:4) fiesta.2 <- rbind(fiesta.2, fiesta.1 * fiesta.1[i])
rownames(fiesta.2) <- names(fiesta.1)
fiesta.2


