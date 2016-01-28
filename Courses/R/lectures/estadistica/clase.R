###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
x <- matrix(c(56,2,8,16), nrow=2)
dimnames(x) <- list(padre=c("con", "sin"), hijo=c("con", "sin"))
library(xtable)


###################################################
### chunk number 3:  eval=FALSE
###################################################
## table(x)


###################################################
### chunk number 4: 
###################################################
xtable(x, caption="Uso del cinturón en California")


###################################################
### chunk number 5: 
###################################################
xtable(prop.table(x,1), digits=4, caption="Uso del cinturón en California")


###################################################
### chunk number 6: 
###################################################
library(UsingR)
temp <- margin.table(table(grades$prev, grades$grade), 1)
temp <- margin.table(table(grades$prev, grades$grade), 2)
temp <- prop.table(table(grades$prev, grades$grade), 1)


###################################################
### chunk number 7: 
###################################################
par(mfrow=c(1,2))
barplot(prop.table(x,1), beside=TRUE, col=heat.colors(2), main="Uso del cinturón", sub="niños | padre", ylim=c(0,1))
barplot(prop.table(x), beside=TRUE, col=heat.colors(2), main="Uso del cinturón", ylim=c(0,1), legend=TRUE, xlab="Padre")


###################################################
### chunk number 8: 
###################################################
var1 <- rnorm(1000, mean=0.3, sd= 0.8) 
var2 <- rnorm(1000, mean=0.6, sd = 1.1) 


###################################################
### chunk number 9: 
###################################################
par(mfrow=c(1,2))
boxplot(var1, var2, col=c("light blue", "forest green"), names=c("Var 1", "Var 2"), main="Boxplots")
plot(density(var2), lwd=2, ylim=c(0,0.7), lty=2, main="Densidades de vars 1 y 2", col="forest green")
lines(density(var1), lwd=2, col="light blue")


###################################################
### chunk number 10: 
###################################################
par(mfrow=c(1,1))
stripchart(list(var3=c(0, 0, 0, 2, 4, 5, 14, 14, 14,13, 17, 17, 15), var4=c(0, 6, 7, 9, 11, 13, 16, 16, 16, 17, 18, 20, 21)), method="stack", pch=16, offset=1/2, cex=3)


###################################################
### chunk number 11: 
###################################################
par(mfrow=c(1,1))
qqplot(var1, var2)
qqline(var1)


###################################################
### chunk number 12: 
###################################################
plot(homedata$y1970, homedata$y2000)


###################################################
### chunk number 13: 
###################################################
plot(maydow$max.temp[-1], diff(maydow$DJA), main="Max. temp vs cambio diario en DJA")


###################################################
### chunk number 14: 
###################################################
plot(kid.weights$height, kid.weights$weight, pch=1, col=c("blue", "red")[kid.weights$gender])
legend(x=20, y=120, c("M","F"), pch=1, col=c("blue", "red"))


###################################################
### chunk number 15: 
###################################################
cor(homedata$y1970, homedata$y2000); cor(maydow$max.temp[-1], diff(maydow$DJA)); cor(kid.weights$height, kid.weights$weight)  


###################################################
### chunk number 16: 
###################################################
cor(rank(homedata$y1970), rank(homedata$y2000))
cor(maydow$max.temp[-1], diff(maydow$DJA), method="spearman")
cor(kid.weights$height, kid.weights$weight, method="s") # otra vez usamos spearman


###################################################
### chunk number 17: 
###################################################
lm(homedata$y2000 ~ homedata$y1970) -> res
res


###################################################
### chunk number 18: 
###################################################
plot(homedata$y1970, homedata$y2000)
abline(res, col="red", lwd=2)


###################################################
### chunk number 19: 
###################################################
height.sq <- kid.weights$height^2
plot(kid.weights$weight ~ height.sq)
res2 <- lm(kid.weights$weight ~ height.sq)
abline(res2, col="blue", lwd=2)


###################################################
### chunk number 20: 
###################################################
attach(student.expenses)
table(cell.phone, car, cable.modem)


###################################################
### chunk number 21: 
###################################################
ftable(table(cell.phone, car, cable.modem), col.vars=c("cable.modem", "car"))
detach(student.expenses)


###################################################
### chunk number 22:  eval=FALSE
###################################################
## attach(ewr)
## boxplot(AA, CO, DL, HP, NW, TW, US, US)


###################################################
### chunk number 23: 
###################################################
attach(ewr)
boxplot(AA, CO, DL, HP, NW, TW, US, US)


###################################################
### chunk number 24: 
###################################################
par(mfrow=c(1,2))
boxplot(ewr[inorout == "in", 3:10], main="Llegar a terminal", cex.axis=0.3)
boxplot(ewr[inorout == "out", 3:10], main="Para despegar", cex.axis=0.3)


###################################################
### chunk number 25: 
###################################################
par(mfrow=c(1,1))
detach(ewr)


###################################################
### chunk number 26: 
###################################################
attach(babies)
#table(smoke) # para ver los valores de smoke, por eso luego cambiamos el 9 a 4
smoke[smoke == 9] <- 4
plot(gestation, wt, col=rainbow(5)[smoke+1], pch=smoke, xlim=c(150, 400), main="Peso vs t gestación vs mamás fumadoras", ylab="Peso", xlab="Tiempo de Gestación")
legend(x=150, y=178, c("nunca", "si", "hasta embarazarse", "hace mucho", "desconocido"), col=rainbow(5)[smoke+1], pch=c(0:4), cex=0.7)
detach(babies)


###################################################
### chunk number 27:  eval=FALSE
###################################################
## class(iris)
## head(iris)
## tail(iris)
## colnames(iris)
## iris$Petal.Length


###################################################
### chunk number 28:  eval=FALSE
###################################################
## plot(iris$Petal.Length, iris$Petal.Width, main="Datos Iris de Edgar Anderson")


###################################################
### chunk number 29: 
###################################################
plot(iris$Petal.Length, iris$Petal.Width, main="Datos Iris de Edgar Anderson")


###################################################
### chunk number 30: 
###################################################
unclass(iris$Species)[c(1:3, 75:77, 112:114)]


###################################################
### chunk number 31:  eval=FALSE
###################################################
## plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Datos Iris de Edgar Anderson")


###################################################
### chunk number 32: 
###################################################
plot(iris$Petal.Length, iris$Petal.Width, pch=21, bg=c("red","green3","blue")[unclass(iris$Species)], main="Datos Iris de Edgar Anderson")


###################################################
### chunk number 33:  eval=FALSE
###################################################
## pairs(iris[1:4], pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)], main = "Datos Iris de Edgar Anderson")


###################################################
### chunk number 34: 
###################################################
pairs(iris[1:4], pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)], main = "Datos Iris de Edgar Anderson")


###################################################
### chunk number 35: 
###################################################
panel.pearson <- function(x, y, ...) {
horizontal <- (par("usr")[1] + par("usr")[2]) / 2;
vertical <- (par("usr")[3] + par("usr")[4]) / 2;
text(horizontal, vertical, format(abs(cor(x,y)), digits=2))
}


###################################################
### chunk number 36:  eval=FALSE
###################################################
## pairs(iris[1:4], pch = 21, bg = c("red","green3","blue")[unclass(iris$Species)], upper.panel=panel.pearson, main = "Datos Iris de Edgar Anderson")


###################################################
### chunk number 37: 
###################################################
pairs(iris[1:4], pch = 21, bg = c("red","green3","blue")[unclass(iris$Species)], upper.panel=panel.pearson, main = "Datos Iris de Edgar Anderson")


###################################################
### chunk number 38:  eval=FALSE
###################################################
## pairs(iris[1:4], pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)], lower.panel=NULL, labels=c("SL","SW","PL","PW"), font.labels=2, cex.labels=4.5, main = "Datos Iris de Anderson -- 3 especies")


###################################################
### chunk number 39: 
###################################################
pairs(iris[1:4], pch = 21, bg = c("red", "green3", "blue")[unclass(iris$Species)], lower.panel=NULL, labels=c("SL","SW","PL","PW"), font.labels=2, cex.labels=4.5, main = "Datos Iris de Anderson -- 3 especies")


###################################################
### chunk number 40:  eval=FALSE
###################################################
## library(lattice)
## ?Lattice


###################################################
### chunk number 41: 
###################################################
library(lattice)


###################################################
### chunk number 42: 
###################################################
data(Chem97, package = "mlmRev")


###################################################
### chunk number 43:  eval=FALSE
###################################################
## head(Chem97)


###################################################
### chunk number 44:  eval=FALSE
###################################################
## histogram(~ gcsescore, data = Chem97)
## histogram(~ gcsescore | factor(score), data = Chem97)


###################################################
### chunk number 45: 
###################################################
pdf(file="lattice1.pdf", height=5.7)
histogram(~ gcsescore, data = Chem97)
dev.off() -> xx


###################################################
### chunk number 46: 
###################################################
pdf(file="lattice2.pdf", height=5.7)
histogram(~ gcsescore | factor(score), data = Chem97)
dev.off() -> xx


###################################################
### chunk number 47:  eval=FALSE
###################################################
## densityplot(~ gcsescore | factor(score), Chem97, groups = gender,
## plot.points = FALSE, auto.key = TRUE)


###################################################
### chunk number 48: 
###################################################
pdf(file="lattice2b.pdf", height=5.7)
densityplot(~ gcsescore | factor(score), Chem97, groups = gender,
plot.points = FALSE, auto.key = TRUE)
dev.off()-> xx


###################################################
### chunk number 49:  eval=FALSE
###################################################
## qqmath(~ gcsescore | factor(score), Chem97, groups = gender,
## f.value = ppoints(100), auto.key = TRUE,
## type = c("p", "g"), aspect = "xy")


###################################################
### chunk number 50: 
###################################################
pdf(file="lattice3.pdf", height=5.7)
qqmath(~ gcsescore | factor(score), Chem97, groups = gender,
f.value = ppoints(100), auto.key = TRUE,
type = c("p", "g"), aspect = "xy")
dev.off()-> xx


###################################################
### chunk number 51:  eval=FALSE
###################################################
## bwplot(factor(score) ~ gcsescore | gender, Chem97)


###################################################
### chunk number 52: 
###################################################
pdf(file="lattice4.pdf", height=5.7)
bwplot(factor(score) ~ gcsescore | gender, Chem97)
dev.off()-> xx


###################################################
### chunk number 53:  eval=FALSE
###################################################
## bwplot(gcsescore ~ gender | factor(score), Chem97, layout = c(6, 1))


###################################################
### chunk number 54: 
###################################################
pdf(file="lattice5.pdf", height=5.7)
bwplot(gcsescore ~ gender | factor(score), Chem97, layout = c(6, 1))
dev.off()-> xx


###################################################
### chunk number 55:  eval=FALSE
###################################################
## stripplot(depth ~ factor(mag), data = quakes,
## jitter.data = TRUE, alpha = 0.6,
## main = "Profundidad de los epicentros por magnitud",
## xlab = "Magnitud (Richter)",
## ylab = "Profundidad (km)")


###################################################
### chunk number 56: 
###################################################
pdf(file="lattice6.pdf", height=5.7)
stripplot(depth ~ factor(mag), data = quakes,
jitter.data = TRUE, alpha = 0.6,
main = "Profundidad de los epicentros por magnitud",
xlab = "Magnitud (Richter)",
ylab = "Profundidad (km)")
dev.off()-> xx


###################################################
### chunk number 57: 
###################################################
VADeathsDF <- as.data.frame.table(VADeaths, responseName = "Rate")


###################################################
### chunk number 58:  eval=FALSE
###################################################
## barchart(Var1 ~ Rate | Var2, VADeathsDF, layout = c(4, 1))
## barchart(Var1 ~ Rate | Var2, VADeathsDF, layout = c(4, 1), origin = 0)


###################################################
### chunk number 59: 
###################################################
pdf(file="lattice7.pdf", height=5.7)
barchart(Var1 ~ Rate | Var2, VADeathsDF, layout = c(4, 1))
dev.off()-> xx


###################################################
### chunk number 60: 
###################################################
pdf(file="lattice8.pdf", height=5.7)
barchart(Var1 ~ Rate | Var2, VADeathsDF, layout = c(4, 1), origin = 0)
dev.off()-> xx


###################################################
### chunk number 61:  eval=FALSE
###################################################
## dotplot(Var1 ~ Rate | Var2, VADeathsDF, layout = c(4, 1))
## dotplot(Var1 ~ Rate, data = VADeathsDF, groups = Var2, type = "o", auto.key = list(space = "right", points = TRUE, lines = TRUE))


###################################################
### chunk number 62: 
###################################################
pdf(file="lattice9.pdf", height=5.7)
dotplot(Var1 ~ Rate | Var2, VADeathsDF, layout = c(4, 1))
dev.off()-> xx


###################################################
### chunk number 63: 
###################################################
pdf(file="lattice10.pdf", height=5.7)
dotplot(Var1 ~ Rate, data = VADeathsDF, groups = Var2, type = "o", auto.key = list(space = "right", points = TRUE, lines = TRUE))
dev.off()-> xx


###################################################
### chunk number 64:  eval=FALSE
###################################################
## methods(generic.function = "dotplot")


###################################################
### chunk number 65: 
###################################################
pdf(file="lattice11.pdf", height=5.7)
print(splom(~iris[1:3]|Species, data = iris,
      layout=c(2,2), pscales = 0,
      varnames = c("Sepal\nLength", "Sepal\nWidth", "Petal\nLength"),
      page = function(...) {
          ltext(x = seq(.6, .8, len = 4),
                y = seq(.9, .6, len = 4),
                lab = c("Tres", "Variedades", "de", "Iris"),
                cex = 2)
      }))
dev.off()-> xx


###################################################
### chunk number 66: 
###################################################
pdf(file="lattice12.pdf", height=5.7)
super.sym <- trellis.par.get("superpose.symbol")

print(splom(~iris[1:4], groups = Species, data = iris,
                        panel = panel.superpose,
                        key = list(title = "Tres Variedades de Iris",
                                   columns = 3,
                                   points = list(pch = super.sym$pch[1:3],
                                   col = super.sym$col[1:3]),
                                   text = list(c("Setosa", "Versicolor", "Virginica"))))) 


dev.off()-> xx


###################################################
### chunk number 67: 
###################################################
pdf(file="lattice13.pdf", height=5.7)
print(cloud(Sepal.Length ~ Petal.Length * Petal.Width, data = iris,
	  groups = Species, screen = list(z = 20, x = -70),
	  perspective = FALSE,
	  key = list(title = "Datos Iris", x = .15, y=.85, corner = c(0,1),
	  border = TRUE, 
	  points = Rows(trellis.par.get("superpose.symbol"), 1:3),
	  text = list(levels(iris$Species)))))
dev.off()-> xx


###################################################
### chunk number 68:  eval=FALSE
###################################################
## data(Earthquake, package = "nlme")
## xyplot(accel ~ distance, data = Earthquake)
## xyplot(accel ~ distance, data = Earthquake, scales = list(log = TRUE),
## type = c("p", "g", "smooth"), xlab = "Distancia al Epicentro (km)",
## ylab = "Máxima Aceleración Horizontal (g)")


###################################################
### chunk number 69: 
###################################################
data(Earthquake, package = "nlme")


###################################################
### chunk number 70: 
###################################################
pdf(file="lattice14.pdf", height=5.7)
xyplot(accel ~ distance, data = Earthquake)
dev.off()-> xx


###################################################
### chunk number 71: 
###################################################
pdf(file="lattice15.pdf", height=5.7)
xyplot(accel ~ distance, data = Earthquake, scales = list(log = TRUE),
type = c("p", "g", "smooth"), xlab = "Distancia al Epicentro (km)",
ylab = "Máxima Aceleración Horizontal (g)")
dev.off()-> xx


###################################################
### chunk number 72:  eval=FALSE
###################################################
## Depth <- equal.count(quakes$depth, number=8, overlap=.1)
## xyplot(lat ~ long | Depth, data = quakes)


###################################################
### chunk number 73: 
###################################################
Depth <- equal.count(quakes$depth, number=8, overlap=.1)


###################################################
### chunk number 74: 
###################################################
pdf(file="lattice16.pdf", height=5.7)
xyplot(lat ~ long | Depth, data = quakes)
dev.off()-> xx


###################################################
### chunk number 75:  eval=FALSE
###################################################
## cloud(depth ~ lat * long, data = quakes,
## zlim = rev(range(quakes$depth)),
## screen = list(z = 105, x = -70), panel.aspect = 0.75,
## xlab = "Longitud", ylab = "Latitud", zlab = "Profundidad")


###################################################
### chunk number 76: 
###################################################
pdf(file="lattice17.pdf", height=5.7)
cloud(depth ~ lat * long, data = quakes,
zlim = rev(range(quakes$depth)),
screen = list(z = 105, x = -70), panel.aspect = 0.75,
xlab = "Longitud", ylab = "Latitud", zlab = "Profundidad")
dev.off()-> xx


###################################################
### chunk number 77: 
###################################################
pdf(file="lattice18.pdf", height=5.7)
cloud(depth ~ lat * long, data = quakes,
zlim = rev(range(quakes$depth)),
screen = list(z = 25, x = -70), panel.aspect = 0.75,
xlab = "Longitud", ylab = "Latitud", zlab = "Profundidad")
dev.off()-> xx


