 hist(DDT, main="DDT measurements", col="darkblue", border="pink", col.main="red", xlab="PPM",col.lab=rgb(0,.5,0))
 boxplot(DDT, main="DDT measurements", col="darkblue", border="pink", col.main="red", xlab="PPM",col.lab=rgb(0,.5,0))
 media<-mean(DDT)
 desv<-sd(DDT)
 print(table(media, desv),  justify="right")


 library(UsingR)
 lawsuits
 loglawsuits<-c(log(lawsuits))
 pdf(file="mi.pdf")
 par(mfrow=c(2,1))
 hist(lawsuits, main="LAWSUITS", col.main="red", xlab="Demandas", border="darkblue", density=seq(10, 100, by=10))
 hist(loglawsuits, main="logLAWSUITS", col.main="red", xlab="Demandas", ylab="logfreq", border="darkblue", density=seq(10, 100, by=10))
 legend("jsoto")
 
 # Te faltó el dev.off()
 # No hace nada tu línea de  legend("jsoto"), crea un warning

 arch<-"http://xibalba.lcg.unam.mx/~jsoto/go_table2.txt"
 ont<-read.table(file=arch, header=TRUE)
 tabla <- ont[,1] # Nunca creas tu objeto tabla! Además, ont tiene varias variables. De cual quieres hacer el barplot????
 # Por ahora uso solo la 1era columna para checar el resto de tu código
 barplot(tabla, main="Density of SNPs in regulatory region", xlab="Regulatory Region", ylab="SNP/kb", col=rainbow(5))
 legend(x=9, y=3500, c("UTR5", "Exon", "Intron", "UTR3", "Gene"), bty  =  "n",  fill  =  rainbow(10))


# Tuvieste varios errores pequeños :(