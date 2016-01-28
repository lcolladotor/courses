 res2<-pbinom(549, size=1000, prob=1/2, lower.tail=FALSE) # Lo ignoro, pues no es con norm.
 resultao<-pnorm(q=549, mean=500, sd=vari, lower.tail=FALSE) # De donde sale el objeto var?

  m  <-  500
  res.10  <-  c()
  res.25  <-  c()
  res.50  <-  c()
  res.75  <-  c()
  res.100  <-  c()
  res.200  <-  c()
  res.300  <-  c()
  res.400  <-  c()
  f  <-  function(n)  mean(rexp(n))
  for  (i  in  1:m)  res.10[i]  <-  f(10)
  for  (i  in  1:m)  res.25[i]  <-  f(25)
  for  (i  in  1:m)  res.50[i]  <-  f(50)
  for  (i  in  1:m)  res.75[i]  <-  f(75)  
  for  (i  in  1:m)  res.100[i]  <-  f(100)
  for  (i  in  1:m)  res.200[i]  <-  f(200)
  for  (i  in  1:m)  res.300[i]  <-  f(300)
  for  (i  in  1:m)  res.400[i]  <-  f(400)
  plot(density(res.400),  xlim  =  range(res.25), type  =  "l",  main  =  "",  xlab  =  "Medias")
  lines(density(res.300), col="red")
  lines(density(res.200), col="violet")
  lines(density(res.100), col="darkblue")
  lines(density(res.75), col="blue")
  lines(density(res.50), col="green")
  lines(density(res.25), col="yellow")
  lines(density(res.10), col="gray")
 
 # Los colores no e dicen nada. Cual es la legenda? Cual es tu n? 25?
res = c();for(i in 1:500) res[i] = mean(rexp(25,1));qqnorm(res)
 
attach(cabinet) 
x <- c(est.tax.savings)
n <- length(x)
j <- qbinom(.05, n, .5)
#El intervalo es:
sort(x)[c(j,n+1-j)]
detach(cabinet)

# ok

attach(babies)
mom <- babies$age
dad <- babies$dage
plot(density(age), col="red")
lines(density(dage), col="darkblue")
# Si estan sesgados, mejor usamos una wilcox
wilcox.test(age,dage, alt="less")
#El pvalue muy pequeño rechazamos la hipótesis nula Ho=(centros iguales) en favor de la alternativa Ha=(padres son mas viejos)
detach(babies)

#ok :)

y <- table(pi2000)
p <- c()
for (i in 1:10) p[i]=.1 # Usa rep
chisq.test(y, p=p)
#EL pvalue no significativo, Ho=digitos tienen misma probabilidad de aparecer, Ho no rechazada

# ok



