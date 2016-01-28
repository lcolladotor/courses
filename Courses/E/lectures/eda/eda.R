###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
boxplot(rexp(1000))
boxplot(10 - rexp(1000))


###################################################
### chunk number 3: 
###################################################
set.seed(12)
ab <- boxplot(c(rnorm(100), -2.75, 2.5, 3.0), main = "The anatomy of a Boxplot")
arrows(x0 = .75, y0 = ab$out,
       x1 = .95, y1 = ab$out)
text(x = .65, y = ab$out, labels = rep('outlier', length(ab$out)))
arrows(x0 = .6, ab$stats,
       x1 = .75, ab$stats)
text(x = .55, y = ab$stats[1,], labels = "A")
text(x = .55, y = ab$stats[5,], labels = "B")
# quantiles
text(x = .55, y = ab$stats[2,], labels = expression(q[.25]))
text(x = .55, y = ab$stats[3,], labels = expression(q[.5]))
text(x = .55, y = ab$stats[4,], labels = expression(q[.75]))


