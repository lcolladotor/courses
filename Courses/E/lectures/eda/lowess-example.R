N <- 1000
x <- 1 - runif(N, 0, 2)
y <- 1.5*x^2 - 3*x^3 + rnorm(N)

plot(x, y)
lines(lowess(x, y), col = "red")
abline(lm(y ~ x), col = "blue")
abline(h = mean(y), col = "darkred")
abline(h = median(y), col = "green")
