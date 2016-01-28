
##
## Class Code for 23/1/08 : see the slides.R for more details.
##
vL <- read.table("../../data/viral-load.dta")
genotype <- read.table("../../data/genotypes.dta")

summary(vL)

splitVL <- split(vL, vL$meds)

groupStats <- lapply(splitVL, function(df) {
  lvl <- log(df$viral.load)
  c(mean = mean(lvl),
    median = median(lvl),
    cor = cor(lvl, df$infected))
})
groupStats

x <- rnorm(100)
y <- 2 + 3*x + rnorm(100)
plot(x,y)
abline(2,3)

x1 <- rnorm(100, 0, 1)
x2 <- rnorm(100, 0, 1)
x3 <- runif(100)

##
## qqplots by hand. It is better to use qqplot because
## if you have data sets of different size qqplot handle
## this. 
plot(sort(x1), sort(x2))
plot(sort(x1), sort(x3))
abline(0,1)

qqplot(x1, x2[1:50])
qqplot(x1, x2)
abline(0,1)

par(mfrow=c(2,1))
qqnorm(log(vL$viral.load))
qqline(log(vL$viral.load), col = "blue")
plot(x1, x2)
abline(0, 1, col = "purple")
points(0,0, pch = 16, cex = 3)

##
## the curve function.
curve(x^3 -  x^2)

## SpikIn Data and matplot
data(SpikeIn)
matplot(pm(SpikeIn))

## expand grid makes all combinations
expand.grid(c(1,2,3), c(1,2,3))



