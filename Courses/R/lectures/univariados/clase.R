###################################################
### chunk number 1: 
###################################################
options(width=40)


###################################################
### chunk number 2: 
###################################################
lista <- list(nombre="Leo", hermano="Alex", edad=21, calif.alumnos=c(6,9,10,8,7))
lista$nombre == lista[[1]]
lista$calif.alumnos[1] == lista[[4]][1]
var <- "hermano"
lista[["hermano"]] == lista[[var]]


###################################################
### chunk number 3:  eval=FALSE
###################################################
## lista <- list(nom.1=ele.1, ..., nom.n=ele.n)


###################################################
### chunk number 4:  eval=FALSE
###################################################
## lista[n+1] <- list(nom.m=ele.m)


###################################################
### chunk number 5:  eval=FALSE
###################################################
## lista.ABC <- c(lista.A, lista.B, lista.C)


###################################################
### chunk number 6: 
###################################################
fiesta <- factor(sample(c("muerto", "happy", "pedo", "sobrio"), 100, replace=TRUE, prob=c(0.1, 0.4, 0.3, 0.2)))
fiesta[1:4]
table(fiesta)


###################################################
### chunk number 7: 
###################################################
fiesta2 <- sub('o$', 'os', as.character(fiesta), perl=TRUE) 
fiesta2[1:10]  


###################################################
### chunk number 8: 
###################################################
arch <- "http://kabah.lcg.unam.mx/~lcollado/R/data/fagos_grandes_codon.txt"
topfagos <- read.table(file=arch, header = T)
res <- NULL
for (i in 1:length(topfagos[1,])) {
  temp <- sum(topfagos[,i])
  res <- c(res, temp)
}
res <- res/sum(topfagos)
names(res) <- colnames(topfagos)
res[res>0.03]  


###################################################
### chunk number 9: 
###################################################
sapply(topfagos, sum) / sum(topfagos) -> res2; res2[res2>0.03]


###################################################
### chunk number 10: 
###################################################
xx <- require(xtable)
xtable(t(table(fiesta)), caption="Estado de la fiesta")


###################################################
### chunk number 11: 
###################################################
pub <- c(15, 14, 16)
names(pub) <- c("Juan", "Pedro", "María")
barplot(pub, main="Publicaciones", ylab="Número", ylim=c(12,16), xpd=FALSE)


###################################################
### chunk number 12: 
###################################################
barplot(pub, main="Publicaciones", ylab="Número")


###################################################
### chunk number 13: 
###################################################
pie(pub, main="Publicaciones", col=heat.colors(3))


###################################################
### chunk number 14: 
###################################################
dotchart(pub, main="Publicaciones", col=rainbow(3), pch=16)


###################################################
### chunk number 15: 
###################################################
stem(islands)


###################################################
### chunk number 16: 
###################################################
library(UsingR)
kid.weights -> strip
strip <- strip$height[48 <= strip$age & strip$age <60]
stripchart(strip, method="stack", xlab="x", pch=1, offset=1, cex=2)


###################################################
### chunk number 17: 
###################################################
DOTplot(strip)


###################################################
### chunk number 18: 
###################################################
hist(faithful$waiting, col="light blue", main="Histograma de faithful$waiting", xlab="Tiempo de espera entre erupciones", ylab="Frecuencia")


###################################################
### chunk number 19: 
###################################################
hist(OBP, breaks="Scott", prob=TRUE, col="light blue", main="Histograma de OBP", ylab="Densidad", xlab="OBP: on base percentage")


###################################################
### chunk number 20: 
###################################################
bins <- seq(42, 109, by=10)
freqs <- table(cut(faithful$waiting, bins))
y.pts <- c(0, freqs, 0)
x.pts <- seq(37, 107, by=10)
plot(x.pts, y.pts, type="l", main="Polígono de faithful$waiting", col="blue")
rug(faithful$waiting, col="red") 


###################################################
### chunk number 21: 
###################################################
hist(faithful$waiting, breaks="scott", prob=TRUE, main="", ylab="", col="light blue")
lines(density(faithful$waiting), col="red")


###################################################
### chunk number 22: 
###################################################
hist(OBP, breaks="scott", prob=TRUE, main="", ylab="", col="light blue")
lines(density(OBP), col="red")


###################################################
### chunk number 23: 
###################################################
library(MASS)
hist(galaxies,prob=TRUE, main="", ylab="", col="light blue", ylim=c(0,0.00015))
lines(density(galaxies), col="red")


###################################################
### chunk number 24: 
###################################################
hist(last.tie, prob=TRUE, main="", ylab="", col="light blue")
lines(density(last.tie), col="red")


###################################################
### chunk number 25: 
###################################################
hist(cfb$VEHIC, prob=TRUE, breaks="Scott", main="", ylab="", col="light blue")
lines(density(cfb$VEHIC), col="red")


###################################################
### chunk number 26: 
###################################################
boxplot(alltime.movies$Gross, ylab="Ventas de por vida", main="Usando alltime.movies$Gross", col=gray(0.9))
f = fivenum(alltime.movies$Gross)
text(rep(1.3, 5), f, labels=c("mín", "1er cuartil", "mediana", "3er cuartil", "máx"))


###################################################
### chunk number 27: 
###################################################
boxplot(brightness, ylab="Brillantez de las estrellas", main="Usando brightness", col=gray(0.9))
f = fivenum(brightness)
text(rep(1.3, 5), f, labels=c("mín", "1er cuartil", "mediana", "3er cuartil", "máx"))


###################################################
### chunk number 28:  eval=FALSE
###################################################
## top5 <- apply(topfagos[1:5,], 2, sum)
## plot(top5)


###################################################
### chunk number 29: 
###################################################
top5 <- apply(topfagos[1:5,], 2, sum)
plot(top5)


###################################################
### chunk number 30:  eval=FALSE
###################################################
## plot(top5, type="o", col="blue")
## title(main="Top5 fagos y sus codones", col.main="red", font.main=4)


###################################################
### chunk number 31: 
###################################################
plot(top5, type="o", col="blue")
title(main="Top5 fagos y sus codones", col.main="red", font.main=4)


###################################################
### chunk number 32:  eval=FALSE
###################################################
## top10 <- apply(topfagos[6:10,], 2, sum)
## plot(top5, type="o", col="blue", ylim=c(1000,10000))
## lines(top10, typ="o", pch=22, lty=2, col="red")
## title(main="Top5 y 10 fagos", col.main="red", font.main=4)


###################################################
### chunk number 33: 
###################################################
top10 <- apply(topfagos[6:10,], 2, sum)
plot(top5, type="o", col="blue", ylim=c(1000,10000))
lines(top10, typ="o", pch=22, lty=2, col="red")
title(main="Top5 y 10 fagos", col.main="red", font.main=4)


###################################################
### chunk number 34:  eval=FALSE
###################################################
## rango <- range(0, top5, top10)
## plot(top5, type="o", col="blue", ylim=rango, axes=FALSE, ann=FALSE)
## axis(1, at=c(1, 5, 11, 13, 15, 17, 19, 21, 25, 27, 30, 36, 38, 39, 41, 45, 51, 55, 56, 58), lab=c("A", "R", "N", "D", "C", "Q", "E", "G", "H", "I", "L", "K", "M", "F", "P", "S", "T", "W", "Y", "V"), font = 1, cex.axis=0.5)
## axis(2, las=1, at=3000*0:rango[2])
## box()
## lines(top10, type="o", pch=22, lty=2, col="red")
## title(main="Top5 y 10 fagos", col.main="red", font.main=4)
## title(xlab="Codones", col.lab=rgb(0, 0.5, 0))
## title(ylab="Frecuencia Absoluta", col.lab=rgb(0, 0.5, 0))
## legend(40, rango[2], c("top5", "top10"), cex=0.8, col=c("blue", "red"), pch=21:22, lty=1:2)


###################################################
### chunk number 35: 
###################################################
rango <- range(0, top5, top10)
plot(top5, type="o", col="blue", ylim=rango, axes=FALSE, ann=FALSE)
axis(1, at=c(1, 5, 11, 13, 15, 17, 19, 21, 25, 27, 30, 36, 38, 39, 41, 45, 51, 55, 56, 58), lab=c("A", "R", "N", "D", "C", "Q", "E", "G", "H", "I", "L", "K", "M", "F", "P", "S", "T", "W", "Y", "V"), font = 1, cex.axis=0.5)
axis(2, las=1, at=3000*0:rango[2])
box()
lines(top10, type="o", pch=22, lty=2, col="red")
title(main="Top5 y 10 fagos", col.main="red", font.main=4)
title(xlab="Codones", col.lab=rgb(0, 0.5, 0))
title(ylab="Frecuencia Absoluta", col.lab=rgb(0, 0.5, 0))
legend(40, rango[2], c("top5", "top10"), cex=0.8, col=c("blue", "red"), pch=21:22, lty=1:2)


###################################################
### chunk number 36:  eval=FALSE
###################################################
## max_y <- max(topfagos)
## plot_colors <- c("blue", "red", "forestgreen")
## png(filename="figure.png", height=500, width=600, bg="white")
## plot(topfagos$"I_ATA", type="o", col=plot_colors[1], ylim=c(0, max_y), axes=FALSE, ann=FALSE)
## axis(1, at=1:10, lab=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"))
## axis(2, las=1, at=1000*0:max_y)
## box()
## lines(topfagos$"I_ATT", type="o", pch=22, lty=2, col=plot_colors[2])
## lines(topfagos$"I_ATC", type="o", pch=23, lty=3, col=plot_colors[3])
## title(main="Codones de I en top10 fagos", col.main="red", font.main=4)
## title(xlab="Fagos", col.lab=rgb(0,0.5,0))
## title(ylab="Frecuencia", col.lab=rgb(0,0.5,0))
## legend(4, max_y, names(topfagos)[grep("^I", names(topfagos))], cex=0.8, col=plot_colors, pch=21:23, lty=1:3)
## dev.off()


###################################################
### chunk number 37: 
###################################################
max_y <- max(topfagos)
plot_colors <- c("blue", "red", "forestgreen")
#png(filename="figure.png", height=500, width=600, bg="white")
plot(topfagos$"I_ATA", type="o", col=plot_colors[1], ylim=c(0, max_y), axes=FALSE, ann=FALSE)
axis(1, at=1:10, lab=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"))
axis(2, las=1, at=1000*0:max_y)
box()
lines(topfagos$"I_ATT", type="o", pch=22, lty=2, col=plot_colors[2])
lines(topfagos$"I_ATC", type="o", pch=23, lty=3, col=plot_colors[3])
title(main="Codones de I en top10 fagos", col.main="red", font.main=4)
title(xlab="Fagos", col.lab=rgb(0,0.5,0))
title(ylab="Frecuencia", col.lab=rgb(0,0.5,0))
legend(4, max_y, names(topfagos)[grep("^I", names(topfagos))], cex=0.8, col=plot_colors, pch=21:23, lty=1:3)
#dev.off()


###################################################
### chunk number 38:  eval=FALSE
###################################################
## plot_colors <- c(rgb(r=0.0,g=0.0,b=0.9), "red", "forestgreen")
## pdf(filename="figure.pdf", height=3.5, width=5)
## par(mar=c(4.2,3.8,0.2,0.2))
## plot(topfagos$"I_ATA", type="l", col=plot_colors[1], ylim=c(0, max_y), axes=F, ann=F, xlab="Fagos", ylab="Frecuencia", cex.lab=0.8, lwd=2)
## axis(1, lab=F)
## text(x=c(1:10),par("usr")[3] -200, srt=45, adj=1, labels=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), xpd=T, cex=0.8)
## axis(2, las=1, cex.axis=0.8)
## box()
## lines(topfagos$"I_ATT", type="l", lty=2, col=plot_colors[2])
## lines(topfagos$"I_ATC", type="l", lty=3, col=plot_colors[3])
## legend("topleft", names(topfagos)[grep("^I", names(topfagos))], cex=0.8, col=plot_colors, lty=1:3, lwd=2, bty="n")
## dev.off()
## par(mar=c(5,4,4,2) + 0.1) #regresa los margenes al valor default


###################################################
### chunk number 39: 
###################################################
plot_colors <- c(rgb(r=0.0,g=0.0,b=0.9), "red", "forestgreen")
#pdf(filename="figure.pdf", height=3.5, width=5)
par(mar=c(4.2,3.8,0.2,0.2))
plot(topfagos$"I_ATA", type="l", col=plot_colors[1], ylim=c(0, max_y), axes=F, ann=F, xlab="Fagos", ylab="Frecuencia", cex.lab=0.8, lwd=2)
axis(1, lab=F)
text(x=c(1:10),par("usr")[3] -200, srt=45, adj=1, labels=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), xpd=T, cex=0.8)
axis(2, las=1, cex.axis=0.8)
box()
lines(topfagos$"I_ATT", type="l", lty=2, col=plot_colors[2])
lines(topfagos$"I_ATC", type="l", lty=3, col=plot_colors[3])
legend("topleft", names(topfagos)[grep("^I", names(topfagos))], cex=0.8, col=plot_colors, lty=1:3, lwd=2, bty="n")
#dev.off()
par(mar=c(5,4,4,2) + 0.1)


###################################################
### chunk number 40:  eval=FALSE
###################################################
## barplot(topfagos$"I_ATA")


###################################################
### chunk number 41: 
###################################################
barplot(topfagos$"I_ATA")


###################################################
### chunk number 42:  eval=FALSE
###################################################
## barplot(topfagos$"I_ATA", main="Codon I_ATA", xlab="Fagos", ylab="Frecuencia", names.arg=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), border="blue", density=seq(10, 100, by=10))


###################################################
### chunk number 43: 
###################################################
barplot(topfagos$"I_ATA", main="Codon I_ATA", xlab="Fagos", ylab="Frecuencia", names.arg=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), border="blue", density=seq(10, 100, by=10))


###################################################
### chunk number 44:  eval=FALSE
###################################################
## codonesI <- matrix(c(topfagos$"I_ATA", topfagos$"I_ATT", topfagos$"I_ATC"), 3, 10)
## rownames(codonesI) <- c("I_ATA", "I_ATT", "I_ATC")
## barplot(t(codonesI), main="Codones de I", xlab="Fagos", ylab="Frecuencia", beside=TRUE, col=rainbow(10))
## legend(x=9, y=3500, c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), cex=0.8, bty="n", fill=rainbow(10))


###################################################
### chunk number 45: 
###################################################
codonesI <- matrix(c(topfagos$"I_ATA", topfagos$"I_ATT", topfagos$"I_ATC"), 3, 10)
rownames(codonesI) <- c("I_ATA", "I_ATT", "I_ATC")
barplot(t(codonesI), main="Codones de I", xlab="Fagos", ylab="Frecuencia", beside=TRUE, col=rainbow(10))
legend(x=9, y=3500, c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), cex=0.8, bty="n", fill=rainbow(10))


###################################################
### chunk number 46:  eval=FALSE
###################################################
## par(xpd=T, mar=par()$mar+c(0,0,0,4))
## barplot(codonesI, main="Codones de I", ylab="Frecuencia", col=heat.colors(3), space=0.1, cex.axis=0.8, las=1, names.arg=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), cex=0.8) 
## legend(0.5, 5500, rownames(codonesI), cex=0.8, fill=heat.colors(3))
## par(mar=c(5, 4, 4, 2) + 0.1) # para regresar a los parametros normales


###################################################
### chunk number 47: 
###################################################
par(xpd=T, mar=par()$mar+c(0,0,0,4))
barplot(codonesI, main="Codones de I", ylab="Frecuencia", col=heat.colors(3), space=0.1, cex.axis=0.8, las=1, names.arg=c("F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"), cex=0.8) 
legend(0.5, 5500, rownames(codonesI), cex=0.8, fill=heat.colors(3))
par(mar=c(5, 4, 4, 2) + 0.1) # para regresar a los parametros normales


###################################################
### chunk number 48:  eval=FALSE
###################################################
## hist(diff(babyboom$running.time))


###################################################
### chunk number 49: 
###################################################
hist(diff(babyboom$running.time))


###################################################
### chunk number 50:  eval=FALSE
###################################################
## hist(nym.2002$time, col="light blue",ylim=c(0,500))


###################################################
### chunk number 51: 
###################################################
hist(nym.2002$time, col="light blue",ylim=c(0,500))


###################################################
### chunk number 52:  eval=FALSE
###################################################
## max_num <- max(faithful$waiting)
## hist(faithful$waiting, col=heat.colors(max_num), breaks=max_num/2, xlim=c(0,max_num), right=F, main="Tiempos entre erupciones de Faithful", las=1)


###################################################
### chunk number 53: 
###################################################
max_num <- max(faithful$waiting)
hist(faithful$waiting, col=heat.colors(max_num), breaks=max_num/2, xlim=c(0,max_num), right=F, main="Tiempos entre erupciones de Faithful", las=1)


###################################################
### chunk number 54:  eval=FALSE
###################################################
## brk <- c(0, 46, 55, 64, 69, 82, 90, 100)
## hist(faithful$waiting, col=heat.colors(length(brk)), breaks=brk, xlim=c(0,max_num), right=F, main="Densidad de Probabilidad de las erupciones de Faithful", cex.axis=0.8, freq=F)


###################################################
### chunk number 55: 
###################################################
brk <- c(0, 46, 55, 64, 69, 82, 90, 100)
hist(faithful$waiting, col=heat.colors(length(brk)), breaks=brk, xlim=c(0,max_num), right=F, main="Densidad de Probabilidad de las erupciones de Faithful", cex.axis=0.8, freq=F)


###################################################
### chunk number 56:  eval=FALSE
###################################################
## r <- rlnorm(1000)
## hist(r)
## # versus
## library(mcmc)
## h <- function(x) if (all(x >= 0) && sum(x) <= 1) return(1) else return(-Inf)
## out <- metrop(h, rep(0, 5), 1000)
## out <- metrop(out, scale = 0.1)
## out <- metrop(out, nbatch = 1e4)
## hist(out$batch[ , 1])


###################################################
### chunk number 57: 
###################################################
r <- rlnorm(1000)
hist(r)


###################################################
### chunk number 58: 
###################################################
library(mcmc)
h <- function(x) if (all(x >= 0) && sum(x) <= 1) return(1) else return(-Inf)
out <- metrop(h, rep(0, 5), 1000)
out <- metrop(out, scale = 0.1)
out <- metrop(out, nbatch = 1e4)
hist(out$batch[ , 1])


###################################################
### chunk number 59:  eval=FALSE
###################################################
## h1 <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1)))
## plot(h1$counts, log="xy", pch=20, col="blue",main="Distribución Log-normal",xlab="Valor", ylab="Frecuencia")
## # Versus
## h2 <- hist(out$batch[,1])
## plot(h2$counts, log="xy", pch=20, col="blue",main="Distribución con MCMC",xlab="Valor", ylab="Frecuencia")


###################################################
### chunk number 60: 
###################################################
h1 <- hist(r, plot=F, breaks=c(seq(0,max(r)+1, .1)))
plot(h1$counts, log="xy", pch=20, col="blue", main="Distribución Log-normal", xlab="Valor", ylab="Frecuencia")


###################################################
### chunk number 61: 
###################################################
h2 <- hist(out$batch[,1], plot=F)
plot(h2$counts, log="xy", pch=20, col="blue", main="Distribución con MCMC", xlab="Valor", ylab="Frecuencia")


###################################################
### chunk number 62:  eval=FALSE
###################################################
## dotchart(t(codonesI))
## # y luego
## dotchart(t(codonesI), col=rainbow(10), pch=16, cex=0.8)


###################################################
### chunk number 63: 
###################################################
dotchart(t(codonesI))


###################################################
### chunk number 64: 
###################################################
dotchart(t(codonesI), col=rainbow(10), pch=16, cex=0.8)


###################################################
### chunk number 65: 
###################################################
# Make an empty chart
plot(1, 1, xlim=c(1,5.5), ylim=c(0,7), type="n", ann=FALSE)

# Plot digits 0-4 with increasing size and color
text(1:5, rep(6,5), labels=c(0:4), cex=1:5, col=1:5)

# Plot symbols 0-4 with increasing size and color
points(1:5, rep(5,5), cex=1:5, col=1:5, pch=0:4)
text((1:5)+0.4, rep(5,5), cex=0.6, (0:4))

# Plot symbols 5-9 with labels
points(1:5, rep(4,5), cex=2, pch=(5:9))
text((1:5)+0.4, rep(4,5), cex=0.6, (5:9))

# Plot symbols 10-14 with labels
points(1:5, rep(3,5), cex=2, pch=(10:14))
text((1:5)+0.4, rep(3,5), cex=0.6, (10:14))

# Plot symbols 15-19 with labels
points(1:5, rep(2,5), cex=2, pch=(15:19))
text((1:5)+0.4, rep(2,5), cex=0.6, (15:19))

# Plot symbols 20-25 with labels
points((1:6)*0.8+0.2, rep(1,6), cex=2, pch=(20:25))
text((1:6)*0.8+0.5, rep(1,6), cex=0.6, (20:25))


