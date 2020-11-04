################### slide 12
age <- c(10, 12, 25, 50, 55, 80)
attributes(age)
attributes(age) <- list(collectDate = "20200101", Collectedby = "Tom Hanks")
attributes(age) 
class(age)

x <- data.frame(a = 1:3, pi = pi) # data frame with dimnames
attributes(x)

rownames(x) <- paste("row", 1:3, sep = ".")
attributes(x)
x$pi

x <- list(a = 1:3, pi = pi)
x$pi
################### slide 13
res <- binom.test(x = 2, n = 25, conf.level = .95)
res
## Exact Confidence Intervals
res$conf.int
names(res)

cat( "From", res$parameter, "tosses, we estimated that the probability of tossing heads is",
     res$estimate,"(95% CI",round(res$conf.int[1], 3),"-", round(res$conf.int[2], 3),").",  
     "The confidence interval gives information on a range for the probability of tossing 
heads that may be useful in hypothesis testing situations. For example, a test of 
H0: pi = 0.5 vs. Ha : pi!= 0.5 would reject H0 because 0.5 is not within this range.
If the test was instead H0 : pi = 0.1 vs. Ha : pi != 0.1, there is no evidence to reject
the null hypothesis. Other ways to perform these tests with a test statistic and a p-value will be discussed in your other classes. (Bilder and Loughin, Analysis of Categorical Data with R, page 11)"
)
p <- res$estimate
y <- c()
for (i in 1:200){
  x <- mean(rbinom(n = 25, size = 1, prob = p))
  y <- c(y,x)
  Sys.sleep(0.1)
  plot(table(y), type = "h", xlim = c(0,1), ylim = c(0,60))
  cat("\r","finish experiment",i)
}
abline(v = res$conf.int[1], col= "blue3")
abline(v = res$conf.int[2], col= "blue3")
text(mean(res$conf.int),55,"95% CI", col= "blue3")

################### slide 14
# install.packages("mlbench")
library(mlbench)
data(BostonHousing) ## bring dataset BostonHousing into Global Environment ".GlobalEnv"
help(BostonHousing)
summary(BostonHousing)
head(BostonHousing)

obj <- lm(medv ~ rm + crim + zn + tax, data = BostonHousing)
summary(obj)

mytable <- summary(obj)$coefficients
rownames(mytable) <- c("Intercept","Room number","Crime rate","Residential land","Property tax")
mytable[,1:3] <- round(mytable[,1:3],2)
mytable[,4] <- round(mytable[,4],3)
mytable

write.csv(mytable,"BostonHousingResult_medv.csv")
#plot(obj)

##################### train and test dataset
trn.id <- 1:400
tst.id <- 401:nrow(BostonHousing)
train.dat <- BostonHousing[trn.id, ]
test.dat <- BostonHousing[tst.id, ]
##################### fit your model using training data
obj <- lm(medv ~ rm + crim + zn + tax, data = train.dat)

##################### predict your outcome using test data
y <- test.dat$medv
yhat <- predict(obj, newdata = test.dat)

mean((y-yhat)^2)
