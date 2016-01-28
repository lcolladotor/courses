 library(MASS)
 boxplot(DDT)
 hist(DDT, main="DDT B olacea", col="blue", col.main="brown", ylab="Frequency", xlab="DDT")
 boxplot(DDT, main="DDT B olacea", col="blue", col.main="brown", ylab="DDT")
 print(c("Mean=", mean(DDT), "Var=", var(DDT)))


 library(UsingR) 
 pdf(file="ovelaqzqu_lawgraph.pdf")
 par(mfrow=c(1,2))
 hist(log(lawsuits, base=exp(1)), main="ovelazqu lawsuits ln", col.main="brown", col="blue", xlab="lawsuits", ylab="frequency")                               
 hist(lawsuits, main="ovelazqu lawsuits", col.main="orange", col="green", xlab="lawsuits", ylab="frequency")
 # Te faltó el dev.off()

		  
		  Distribucion binomial de las frecuencias de nucleotidos de una grafica del libro de J.Van Helder
http://rsat.scmbb.ulb.ac.be/~jvanheld/regulatory_sequence_analysis/
L <- 100000 
k <- 8 
x <- 6 
n <- L-k+1 
p <- 0.25^k 
m <- n*p 
P.val <- pbinom(x-1,n,p,lower.tail=F)
print(P.val)
T <- 4^k 
E.val <- T*P.val
print(E.val)
P.noFP.one.test <- (1-P.val)
P.noFP.all.tests <- (1-P.val)^T
print(P.noFP.all.tests)
FWER = 1 - (1-P.val)^T
print(FWER)

# ajá, y la gráfica????