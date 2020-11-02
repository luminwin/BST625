###################################################################	
### <October 4 2020> Min Lu
###
###  
###
###################################################################	
### 
### Topic 4 
### R section for BST 625
### Statistical Computing
### Fall 2020
### ------------------------------------------------------------
###  Min Lu, PhD                     m.lu6@umiami.edu
###                                  phone: 305-243-5473
###  Research Assistant Professor, Division of Biostatistics           
###  Clinical Research Building
###  1120 NW 14th Street, Room 1059
###  University of Miami, Miami FL 33136
###
###  -------------------------------------------------------------
###  THIS PROGRAM SHOULD NOT BE COPIED, USED, MODIFIED, OR 
###  DISSEMINATED IN ANY WAY WITHOUT SPECIFIC WRITTEN PERMISSION 
###  FROM THE AUTHOR.
###
###################################################################

##############################################################
###    An example for extending R with add‐on packages    ####
##############################################################

#################### slide 7
# install.packages("reshape")
library(reshape)

mydata <- data.frame( id = c(1, 1, 2, 2),
                      time = c(1, 2, 1, 2),
                      x1 = c(5, 3, 6, 2),
                      x2 = c(6, 5, 1, 4) )

mdata <- melt(mydata, id=c("id","time"))
mdata
cast(mdata, id~variable, mean)
cast(mdata, time~variable, mean)

##############################################################
###    Objects have names in r through attributes         ####
##############################################################
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
##############################################################
###           Test and Confidence Intervals               ####
##############################################################
################### slide 13
res <- binom.test(x = 2, n = 25, conf.level = .95)
res
## Exact Confidence Intervals
res$conf.int

####################################################################
###    Understand test statistics and functions ‘lm’ and ‘glm’  ####
####################################################################

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

################### slide 15
################################# R is consistent in terms of model usage
################################# Now I only change my outcome from continuous outcome medv 
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
##############################################################
###                   prediction                          ####
##############################################################

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
mean((y-yhat)^2)
plot(y, yhat)
abline(0,1)
##################### an advanced model does not mean fancy lines of code in terms of function usage
# install.packages("randomForestSRC")
library("randomForestSRC")
obj.rf <- rfsrc(medv ~ rm + crim + zn + tax, data = train.dat, importance = TRUE)
yhat.rf <- predict(obj.rf, newdata = test.dat)$predicted

mean((y-yhat.rf)^2)
plot(y, yhat.rf)
abline(0,1)
plot(obj.rf)
