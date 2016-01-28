#Ejercicio 2
#Akram Sahrim Mendez Rangel
#Incluimos la libreria MASS y los datos de DDT
#
#amendez
 library(MASS)
 DDT
#                 >>>[1]<<<
#->Histograma
#
 hist(DDT, col.main="blue",col=rgb(0.3,0.7,0.9),
  main="Mediciones Pesticida", font.main=4,
 ylab="Observaciones",xlab="Cant. DDT")
#
#->Hacemos el boxplot
#
 boxplot(DDT, col="red",pch=20,col.main="blue",main="Pesticida",font.main=4,
 xlab="Mediciones",ylab="[DDT]")
#
#Estimar media y desviacion estandar de las graficas e imprimirlas
#
 mean(DDT)        
 sd(DDT)          
 print (mean(DDT))
 print(sd(DDT))
#
# 		>>>[2]<<<
#
 library(UsingR)
 pdf(file="grafica.pdf")
 par(mfrow=c(1,2))
 hist(log(lawsuits, base=exp(1)), main="amendez log", col.main="blue", col="light blue",ylab="frec",     
 xlab="lawsuits")
 hist(lawsuits, main="amendez", col.main="blue", col="light blue",ylab="frec",xlab="lawsuits")
 dev.off()
#
# 		>>>[3]<<<
#
# http://earthobservatory.nasa.gov/Laboratory/ICE/Images/histogram.gif  
 data<-c(0.005,0.005,0.005,0.005,0.005,0.005,0.015,0.015,0.015,0.015,0.025,0.025,0.025,0.025,
 0.035,0.035,0.045,0.045,0.045,0.055,0.055,0.061,0.065,0.065)
 hist(data,col="blue",xlab="R2(10-9 m2)",ylab="Frequency",xlim=c(0,0.08))
#gracias 

# Tu link no sirve, me manda automáticamente a otra dirección. Veo que tu código corre, pero no puedo verificar si lograste reproducir la gráfica original.
