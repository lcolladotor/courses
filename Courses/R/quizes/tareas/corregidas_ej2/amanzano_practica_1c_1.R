library(MASS)
boxplot(DDT)
hist(DDT, main="DDT B olacea", col="blue", col.main="green", ylab="Frequency", xlab="DDT")
boxplot(DDT, main="DDT B olacea", col="blue", col.main="green", ylab="DDT")
print(c("Mean=", mean(DDT), "Var=", var(DDT)))

library(UsingR)
pdf(file="amanzano_law_graph.pdf")
par(mfrow=c(1,2))
hist(log(lawsuits, base=exp(1)), main="amanzano lawsuits ln", col.main="blue", col="green", xlab="lawsuits", ylab="frequency")
hist(lawsuits, main="amanzano lawsuits", col.main="blue", col="green", xlab="lawsuits", ylab="frequency")
dev.off()



x<- c(590, 180, 50)
n<-c("N95E109 (SE)","N94E109 (NE)", "N95E109 (SE)")
barplot(x,names.arg=n, col="yellow", ylim=c(0,600), ylab="Shell count", space=2)
axis(1, labels=FALSE, lwd.ticks=0, lwd=1)
axis(2, lwd.ticks=1, lwd=1, at=yaux, labels=FALSE)
#Nature 449, 906 fig.1a(18 october 2007)

# Huh? Que es yaux? Supongo que es un objeto que no definiste.
# PFF no pusiste un link al artículo.
# Bueno, si se parece la gráfica... claro, te fallaron unas cosas en el eje X.