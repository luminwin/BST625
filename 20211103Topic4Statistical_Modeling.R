###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

dat <- read.csv("https://luminwin.github.io/BST625/score_data.csv")
nrow(dat)
rownames(dat)
rowSums(dat[,2:4], na.rm = TRUE)
rowMeans(dat[,2:4])
dat1 <- head(dat)
dat2 <- tail(dat)
rbind(dat1,dat2)

ncol(dat)
colnames(dat)
colSums(dat[,2:4], na.rm = TRUE)
colMeans(dat[,2:4])
dat1 <- dat[,1:3]
dat2 <- dat[,4:5]
cbind(dat1,dat2)


#################### slide 10
# not important: this is just to show an example of add-on package usage

if("reshape" %in% rownames(installed.packages()) == FALSE) {install.packages("reshape")}
library(reshape)

mydata <- data.frame( id = c(1, 1, 2, 2),
                      time = c(1, 2, 1, 2),
                      x1 = c(5, 3, 6, 2),
                      x2 = c(6, 5, 1, 4) )

mdata <- melt(mydata, id=c("id","time"))
mdata
cast(mdata, id~variable, mean)
cast(mdata, time~variable, mean)

# https://rdatatable.gitlab.io/data.table/

if("randomForestSRC" %in% rownames(installed.packages()) == FALSE) {install.packages("randomForestSRC")}

if("glmnet" %in% rownames(installed.packages()) == FALSE) {install.packages("glmnet")}

#install.packages("glmnet")

example(lm)


##############################################################
###           Test and Confidence Intervals               ####
##############################################################
################### slide 14
res <- binom.test(x = 2, n = 25, conf.level = .95)
res
attributes(res)
## Exact Confidence Intervals
res$conf.int

################### slide 15

obj <- lm(mpg ~ cyl + disp + hp + drat, data = mtcars)

obj <- lm(mpg ~ ., data = mtcars[, 1:5]) # the same as above

str(obj)
attributes(obj)

summary(obj)

methods(summary)
summary(mtcars)

results <- anova(obj)
results
attributes(results)

results$"Pr(>F)"

results$`Pr(>F)`[2]


################### slide 17
# install.packages("mlbench")
if("mlbench" %in% rownames(installed.packages()) == FALSE) {install.packages("mlbench")}
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

################################# to binary outcome chas and change "lm" to "glm"
obj2 <- glm(chas ~ rm + crim + zn + tax, data = BostonHousing, family = binomial())
summary(obj2)

mytable2 <- summary(obj2)$coefficients
rownames(mytable2) <- c("Intercept","Room number","Crime rate","Residential land","Property tax")
mytable2[,1:3] <- round(mytable2[,1:3],2)
mytable2[,4] <- round(mytable2[,4],3)
mytable2

write.csv(mytable2,"BostonHousingResult_chas.csv")
#plot(obj2)

################################# Your client/boss wants you to fit a fancy model...

# install.packages("glmnet")
if("glmnet" %in% rownames(installed.packages()) == FALSE) {install.packages("glmnet")}
## https://glmnet.stanford.edu/articles/glmnet.html

library(glmnet)
x_vars <- BostonHousing[, c("rm", "crim", "zn", "tax")]
x_vars <- as.matrix(x_vars)

y_var <- BostonHousing$medv
lambda_seq <- 10^seq(2, -2, by = -.1)

cv_output <- cv.glmnet(x_vars, y_var,
                       alpha = 1, lambda = lambda_seq, 
                       nfolds = 5)
# identifying best lamda
best_lam <- cv_output$lambda.min

lasso_best <- glmnet(x_vars, y_var, alpha = 1, lambda = best_lam)
coef(lasso_best)

plot(cv_output)

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

##################### check your prediction result
sqrt(mean((y-yhat)^2)) ## we want this number as small as possible

##################### an advanced model does not mean fancy lines of code in terms of function usage
# install.packages("randomForestSRC")
if("randomForestSRC" %in% rownames(installed.packages()) == FALSE) {install.packages("randomForestSRC")}
library("randomForestSRC")
## https://luminwin.github.io/randomForestSRC/articles/getstarted.html


mtcars

obj.rf <- rfsrc(gear ~ ., data = mtcars)
yhat.rf <- predict(obj.rf, newdata = mtcars)$predicted

##################### check your prediction result
mean((y-yhat.rf)^2)  ## we want this number as small as possible


