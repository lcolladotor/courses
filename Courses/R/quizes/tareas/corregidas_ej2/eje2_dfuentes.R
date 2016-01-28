library(MASS)
DDT
hist(DDT, main="DDT en B. oleracea", col="cyan", col.main="blue", xlab="mediciones DDT", ylab="frecuencia")
boxplot(DDT, main="DDT en B. oleracea", col="red", col.main="blue", ylab="DDT")
print(c("media=", mean(DDT), "varianza=", var(DDT)))

library(UsingR)
pdf(file="partedos.pdf")
par(mfrow=c(1,2))
hist(lawsuits, main="dfuentes Lawsuits", col.main="blue", col="cyan", xlab="lawsuits", ylab="frecuencia")
hist(log(lawsuits, base=exp(1)), main="dfuentes Lawsuit_ln's", col.main="blue", col="red", xlab="lawsuits", ylab="frecuencia")
dev.off()

#"http://www.nature.com/nature/journal/v436/n7051/pdf/nature03848.pdf" Figura 4, Grafica C, Dios bendiga a Sohlenkamp...y a Banda por su paciencia
plot_colors <- c("green", "red")
x <- c(1.5, 2, 3, 16.5, 26.5, 3.6)
names(x) <- c("pGL3", "pGL3", "pGL3-SV40", "pGL-SV40", "pGL3-ALDH12", "pGL3-ALDH12")
barplot(x, col=plot_colors, ylim = c(0, 35), main="Chromatin immunoprecipitation of promoter-containing plasmids transfected...", ylab="Ampicilin resistant colonies x100")
legend(1, 32, c("mtRNAP", "RNAP II"), cex=1, pch=19, col=plot_colors)

# Supongo que Banda te ayudó bastante hehe. Si mal no recuerdo, es la misma gráfica que él escogió.
# En fin, te salío :D