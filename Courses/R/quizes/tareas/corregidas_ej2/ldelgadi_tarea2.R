
########## Parte 1 ############
####Para el histograma del DDT

max_num <- max(DDT) # No encuentra el objeto DDT! Te faltó cargar la librería MASS
png(filename="HistDDT.png", height=500,width=600,bg="white")
hist(DDT, col = heat.colors(max_num),
xlim = c(0,(max_num+2)), right = F, main = "Histograma de Frecuencia de DDT", # Donde definiste el objeto max_num???? # Ya lo encontré más abajo :P
col.main="red",font.main="4",
xlab="Cantidad de DDT",col.lab="green", ylab="Frecuencias",col.lab="green", las = 1)
box()
dev.off()

###Para el boxplot del DDT
max_num <- max(DDT)
png(filename="BoxPlotDDT.png", height=500,width=600,bg="white")
boxplot(DDT,col="yellow",
        main = "Boxplot de DDT :p",col.main="forestgreen",
        xlab = ":)", col.lab="forestgreen",
        ylab = "Insecticida",col.lab="forestgreen",
        xlim = c(0.5,3), ylim = c(2,5), yaxs="i" )
legend(2,4, c("DDT"), fill = c("yellow"))
dev.off()

###Para la media y la desviacion estandar
print("Esta es la media del DDT")
print(mean(DDT))
print("Esta es la desviacion estandar")
print(sd(DDT))

########## Parte 2 ############
###Para parametro mfrow de la funcion par, datos de lawsuits del paquete UsingR
library(UsingR)
log_suits<-log(lawsuits) ###Para los logaritmos
pdf(file="Suits.pdf",height=3.5,width=5.5)
par(mfrow=c(1,2))
hist(lawsuits, main ="ldelgadi, lawsuits", ylab="Demandas", col=rainbow(5))
hist(logsuits, main ="ldelgadi, logsuits", ylab="Demandas", col=rainbow(5),breaks = 11) # Casi, te faltó un _ en logsuits
dev.off()

########## Parte 3 ############
###Para la replica
achu<-c(1:34)
achu<-seq(18,51,by=1)
barplot(NumPaci$Numero,ylim=c(0,20), # Donde defines a NumPaci???
        main ="Histograma de las edades de los pacientes", col.main="red",font.main="4",
     xlab = "Edad", ylab="Frecuencia",names.arg =  achu  
    ,col="forestgreen")

###Los datos originales estan en http://www.fisterra.com/mbe/investiga/graficos/graficos.asp



