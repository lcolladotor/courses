###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2:  eval=FALSE
###################################################
## c(2,3) + c(4,5,7)


###################################################
### chunk number 3: 
###################################################
"Because the 2nd vector's length is not a multiple of the first one"
"and viceversa. Its due to the recycling rule."


###################################################
### chunk number 4: 
###################################################
prime <- c(2, 3, 5, 7)
sqrt(prime)
sum(prime); sum(sqrt(prime))
median(prime); median(sqrt(prime))
mean(prime); mean(sqrt(prime))


###################################################
### chunk number 5: 
###################################################
phage <- read.delim(file.path("ftp://ftp.ebi.ac.uk/pub/databases/genome_reviews/gr2species_phage.txt"), header=F)


###################################################
### chunk number 6: 
###################################################
plot(sort(phage[,2]), type="l", col="blue")


###################################################
### chunk number 7: 
###################################################
plot(sort(log10(phage[,2])), type="l", col="blue")
print("You can say that using log10 does help on this case")


###################################################
### chunk number 8: 
###################################################
hist(phage[,2], col="light blue", prob=T)
lines(density(phage[,2]), col="red")


###################################################
### chunk number 9: 
###################################################
contig <- diff(sort(phage[,2]))
boxplot(contig, col="forest green")


###################################################
### chunk number 10: 
###################################################
contig <- diff(sort(log10(phage[,2])))
boxplot(contig, col="forest green")
print("Boxplot without log10 was more useful")


###################################################
### chunk number 11: 
###################################################
top <- sort(phage[,2], decreasing=T)[1:10]
names <- NULL
for (i in 1:10) {
names <- c(names, phage[which(phage[,2] == top[i]),1])
}
barplot(top, col=rainbow(10), names.arg=phage[names,1], cex.names=0.5, las=2)


###################################################
### chunk number 12: 
###################################################
barplot(log10(top), col=rainbow(10), names.arg=phage[names,1], cex.names=0.5, las=2)
print("Using log10 has almost no effect")


###################################################
### chunk number 13: 
###################################################
tapply(phage[,2], phage[,4], mean)


