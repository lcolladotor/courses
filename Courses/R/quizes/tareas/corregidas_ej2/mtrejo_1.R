# Ejercicio 1
 library(MASS)
 DDT
 hist(DDT)
 boxplot(DDT)
 # Te faltó usar colores en el hist y boxplot
 mean(DDT)

 sd(DDT)


# Ejercicio 2
 library(UsingR)
 pdf("Ejercicio2.pdf")
 par(mfrow=c(1,2))
 hist(lawsuits, main= "Lawsuits mtrejo", col=rainbow(10), col.main="pink")
 logs <- log(lawsuits)
 hist(logs, main= "LogLawsuits mtrejo", col=rainbow(10), col.main="red")
 dev.off()

# Ejercicio 3
# http://www.ciex.info/html/inv0401.html
 libros <- list("Dinamarca"=857, "Hungría" =751, "República Checa"= 546, "Bélgica"= 486, "Reino Unido"= 464, "Suiza"=424, "Alemania"=421, "Finlandia"=414, "Noruega"=405, "Portugal"=265, "Italia"=227, "Canadá"=225, "Grecia"=225, "Francia"=201, "España"=144, "Australia"=123, "Polonia"=70, "Japón"=57, "Corea"=53, "México"=5)
 tabla <- table(libros)
 hist(tabla)
 
 # Tu código no hace la gráfica que me mandaste. Creo que lo que querías hacer era mas bien algo así:
barplot(unlist(libros), cex.names=0.6, las=2)