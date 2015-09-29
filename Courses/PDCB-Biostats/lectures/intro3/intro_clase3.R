###################################################
### chunk number 1: 
###################################################
#line 9 "intro_clase3.Rnw"
options(width=45)


###################################################
### chunk number 2: 
###################################################
#line 34 "intro_clase3.Rnw"
if (1==0) {print(1)} else {print(2)}
x <- 1:10 
ifelse(x<5 | x>8, x, 0)


###################################################
### chunk number 3: 
###################################################
#line 51 "intro_clase3.Rnw"
y<-12345
x<-y/2
while(abs(x*x-y)  >  1e-10  )  x  <-  (x   +  y/x) /2
x
x^2


###################################################
### chunk number 4: 
###################################################
#line 61 "intro_clase3.Rnw"
repeat{
x <-  (x+ y/x ) / 2
if (abs(x*x-y)  < 1e-10 ) break
 }
x


###################################################
### chunk number 5:  eval=FALSE
###################################################
## #line 71 "intro_clase3.Rnw"
## x<-seq(0,1,.05)
## plot(x,x, ylab="y", type= "l" )
## for(j in 2:8) {       lines ( x, x^j) }


###################################################
### chunk number 6: 
###################################################
#line 80 "intro_clase3.Rnw"
x<-seq(0,1,.05)
plot(x,x, ylab="y", type= "l")
for(j in 2:8) {lines ( x, x^j)}


###################################################
### chunk number 7:  eval=FALSE
###################################################
## #line 100 "intro_clase3.Rnw"
## lapply(thuesen,mean, na.rm=T)
## sapply(thuesen,mean, na.rm=T)


###################################################
### chunk number 8:  eval=FALSE
###################################################
## #line 113 "intro_clase3.Rnw"
## m <- matrix(rnmorm(12),4)
## m
## apply (m,2,min)


###################################################
### chunk number 9:  eval=FALSE
###################################################
## #line 134 "intro_clase3.Rnw"
## mifun <- function(arg1, arg2, ...) { lo_que_sea }
## mifun(arg1=..., arg2=...)


###################################################
### chunk number 10: 
###################################################
#line 145 "intro_clase3.Rnw"
fact <- function(x=1) {
ret <- 1
for(i in 1:x) {ret = ret *i}
return(c(x,ret))}
fact()
fact(x=5)
fact(6)


###################################################
### chunk number 11: 
###################################################
#line 171 "intro_clase3.Rnw"
mifun3 <- function(x1) {
if (x1>0) {print(x1)}
else if (x1==0) { warning("El valor debe ser > 0") }
else {print("Hay un error porque x1 < 0")}
}


###################################################
### chunk number 12:  eval=FALSE
###################################################
## #line 178 "intro_clase3.Rnw"
## mifun3 <- function(x1) {
## if (x1>0) {print(x1)}
## else if (x1==0) { warning("Value must be > 0") }
## else {stop("Hay un error porque x1 < 0")}
## }


###################################################
### chunk number 13: 
###################################################
#line 185 "intro_clase3.Rnw"
mifun3(x1=0)
mifun3(x1=-2)


###################################################
### chunk number 14: 
###################################################
#line 199 "intro_clase3.Rnw"
grep("a+", c("abc", "def", "cba a", "aa"), value=FALSE)
grep("a+", c("abc", "def", "cba a", "aa"), value=TRUE)


###################################################
### chunk number 15: 
###################################################
#line 204 "intro_clase3.Rnw"
regexpr("a+", c("abc", "def", "cba a", "aa"))


###################################################
### chunk number 16: 
###################################################
#line 208 "intro_clase3.Rnw"
gregexpr("a+", c("abc", "def", "cba a", "aa"))


###################################################
### chunk number 17: 
###################################################
#line 212 "intro_clase3.Rnw"
sub("(a+)", "z\\1z", c("abc", "def", "cba a", "aa"))


###################################################
### chunk number 18: 
###################################################
#line 216 "intro_clase3.Rnw"
sub("(a+)", "z\\1z", c("abc", "def", "cba a", "aa"))


###################################################
### chunk number 19: 
###################################################
#line 220 "intro_clase3.Rnw"
gsub("(a+)", "z\\1z", c("abc", "def", "cba a", "aa"))


###################################################
### chunk number 20:  eval=FALSE
###################################################
## #line 236 "intro_clase3.Rnw"
## data(airquality)
## aq <- edit(airquality)


###################################################
### chunk number 21:  eval=FALSE
###################################################
## #line 244 "intro_clase3.Rnw"
## dd<-data.frame
## fix(dd)


###################################################
### chunk number 22:  eval=FALSE
###################################################
## #line 257 "intro_clase3.Rnw"
## Cylinder<-c(rep("V4",5),"V6","V4",rep("V6",3))
## Weight<-c(2170,2655,2345,2560,2330,3325,2745,3735,3450,3265)
## Mileage<-c(33,26,33,33,26,23,25,18,22,20)
## Type<-c("Sporty","Compact",rep("Small",3),"Large","Compact","Van",rep("Medium",2))


