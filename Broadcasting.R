###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

if("mlbench" %in% rownames(installed.packages()) == FALSE) {install.packages("mlbench")}
library(mlbench)
data(BostonHousing) ## bring dataset BostonHousing into Global Environment ".GlobalEnv"
summary(BostonHousing)

obj <- lm(medv ~ rm + crim + zn + tax, data = BostonHousing)
summary(obj)

attributes(obj)

y <- BostonHousing$medv
yhat <- predict(obj, newdata = BostonHousing)
yhat <- obj$fitted.values ## the same as above
##################### check your prediction result
mean((y-yhat)^2) ### we want this number as small as possible


Y <- BostonHousing[, "medv"]
X <- cbind(1,BostonHousing[, c("rm", "crim", "zn","tax")])
Y <- as.matrix(Y)
X <- as.matrix(X)

solve(t(X)%*%X)%*%t(X)%*%Y