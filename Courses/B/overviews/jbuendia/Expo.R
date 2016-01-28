###################################################
### chunk number 1: 
###################################################
library(geneplotter)
data(sample.ExpressionSet)
curWarn <- options(warn=0)
on.exit(options(warn=curWarn$warn), add=TRUE)
if (require("hgu95av2.db")) {
  z <- buildChromLocation("hgu95av2")
  lty <- c(1, 2, 3, 4, 5)
  cols <- c("red", "green", "blue", "orange", "magenta", "black")
  cols <- cols[sample.ExpressionSet$type]
  if (interactive()) {
  par(ask=TRUE)
  }
}
alongChrom(sample.ExpressionSet, "1", z, plotFormat="local", colors=cols, byStrand=st)


###################################################
### chunk number 2: 
###################################################
data(sample.ExpressionSet)
eset = sample.ExpressionSet
mytt <- function(y, cov2) {
 ys <- split(y, cov2)
 t.test(ys[[1]], ys[[2]])
}
ttout <- esApply(eset, 1, mytt, eset$type)
s1means <- sapply(ttout, function(x) x$estimate[1])
s2means <- sapply(ttout, function(x) x$estimate[2])
deciles <- quantile(c(s1means, s2means), probs = seq(0, 1, 0.1))
s1class <- cut(s1means, deciles)
names(s1class) <- names(s1means)
s2class <- cut(s2means, deciles)
names(s2class) <- names(s2means)
cols <- dChip.colors(10)
nf <- layout(matrix(1:3,nr=1), widths=c(5,5,2))
chrObj <- buildChromLocation("hgu95av2")
cPlot(chrObj)
cColor(featureNames(eset), cols[s1class], chrObj)
cPlot(chrObj)
cColor(featureNames(eset), cols[s2class], chrObj)
image(1,1:10,matrix(1:10,nc=10),col=cols, axes=FALSE,
xlab="", ylab="")
axis(2, at=(1:10), labels=levels(s1class), las=1)


