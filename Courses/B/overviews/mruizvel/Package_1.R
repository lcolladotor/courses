###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
library(HardyWeinberg)
hardyw <- c(15,24,10)
hwtest <- HWExact(hardyw, verbose=TRUE, singleterms=TRUE)


###################################################
### chunk number 3: 
###################################################
p <- 100
q <- 100
hweq <- HWData(p, q)
xc <- hweq$Xc
plotting <- HWTernaryPlot(Xc,100,region=2,hwcurve=FALSE,vbounds=FALSE,signifcolour=TRUE,curtyp="dashed",ssf="min",main="Hardy Weinberg Equilibrium Test")


###################################################
### chunk number 4: 
###################################################

plots <- HWTernaryPlot(Xc,100,region=2,hwcurve=TRUE,vbounds=TRUE,signifcolour=TRUE,ssf="min",curtyp="solid",curvecols="blue",markerlab="*")


