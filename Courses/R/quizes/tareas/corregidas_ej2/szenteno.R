library(MASS)
hist(DDT,prob=TRUE, main="Grafica de DDT", xlab="Mediciones de DDT", ylab="Frecuencia de las mediciones", col=heat.colors(5))
boxplot(DDT, ylab="Mediciones de DDT", main="Boxplot de DDT", col="light blue")
f = fivenum(DDT)
text(rep(1.3, 5), f, labels=c("min", "1er cuartil", "mediana", "3er cuartil", "máx"))
mean(DDT)
sd(DDT)
media =mean(DDT)
print(media)
desviacion=sd(DDT)
print(desviacion)

# Muy bien! pusiste usaste fivenum y text para poner la info en el boxplot :)

library(UsingR)
logaritmo <- log(lawsuits)
pdf(file = "graficas.pdf", height = 6, width = 15, bg = "blue")
par(mfrow = c(1,2))
hist(lawsuits, main = "szenteno - Lawsuits", ylab = "Lawsuits", xlab = "Frecuencia", col = heat.colors(12))
hist(logaritmo, main = "szenteno - Logaritmos", ylab = "Lawsuits",  xlab = "Frecuencia", col = heat.colors (10))
dev.off()

# http://sourceforge.net/project/stats/detail.php?group_id=24939&ugn=mpterm&mode=week&type=sfweb

arch <- "http://xibalba.lcg.unam.mx/~szenteno/tabla.txt"                     
tabla <- read.table(file = arch, header = TRUE)      
pdf(file = "graficas.pdf", height = 6, width = 15, bg = "blue")               
barplot(tabla$SourceForge.netPages, main="SourceForge.net Web Traffic Statistics For A Multi-Page Terminal for GNOME", ylab="Pages/day", col=heat.colors(7), space=0.5, cex.axis=0.8, las=1, names.arg=c("2008-10-30", "2008-10-31", "2008-11-01", "2008-11-02", "2008-11-03", "2008-11-04", "2008-11-05"), cex=0.8)
dev.off()


# Se ve bien la gráfica aunque ya no puedo verificar la información, pues ahora muestra otra. 