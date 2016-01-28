
m<- 0.5*1000
v<- 0.5*0.5*1000
desv<-sqrt(v)
prob<-pnorm(550, mean=m, sd=desv, lower.tail=TRUE)
prob2<-dnorm(550, mean=m, sd=desv)
proba<- (1-prob)+ prob2 # HUH? Porque juntas pnorm y dnorm???
proba
#[1] 0.0009527085

# Una solución:
muestra <- NULL
for (i in 1:10000) muestra[i] <- sum(sample(c(0,1),1000, replace=TRUE, prob=c(0.5,0.5)))
1-pnorm(550, mean(muestra), sd(muestra)) # Nota que mean(muestra) =~ 500 y sd(muestra) =~ sqrt(250)



m <- 500
res.50 <- c()
res.200 <- c()
res.500 <- c()
f <- function(n) mean(rexp(n))
for (i in 1:m) res.50[i] <- f(50)
for (i in 1:m) res.200[i] <- f(200)
for (i in 1:m) res.500[i] <- f(500)
plot(density(res.500), xlim = range(res.50), type = "l", main = "", xlab = "Medias", col="red")
lines(density(res.200), col="blue")
lines(density(res.50), col="green")

# Y cual es la n?

x<-cabinet$est.tax.savings
p<-0.5
P<-0.9
n<-length(x)
q.CI<-function(x, p, P){
n<-length(x) 
s<- min(which(pbinom((0:n),n,p) >= 1-(1-P)/2))  
r <- max(which(pbinom((0:n),n,p) <= (1-P)/2))

# No funciona tu código de arriba

wilcox.test(cabinet$est.tax.savings, conf.int=TRUE, conf.level=0.9) # Bien
# 90 percent confidence interval:
# 3915 54918 

t.test(babies$dage, babies$age, alt="greater")  # Bien :)
# t = 11.0671, df = 2301.524, p-value < 2.2e-16
# alternative hypothesis: true


c<-c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0) # Usa rep
for(i in 1:2000){
for(j in 1:10){
if(pi2000[i] == (j-1)) {
c[j] <- c[j]+1}
}
}
for(i in 1:10)
{
c[i]=c[i]/2000
}
sig <- chisq.test(c, p= rep(1/length(c), length(c)))

# No corre tu código y no tienes conclusión.
# Solución:
chisq.test(table(pi2000),p=rep(0.1,10))