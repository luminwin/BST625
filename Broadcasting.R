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

BostonHousing$rm <- BostonHousing$rm - mean(BostonHousing$rm)

BostonHousingC <- scale(BostonHousing[, c("rm", "crim", "zn","tax")], center = TRUE, scale = FALSE)

colMeans(BostonHousingC)
round(colMeans(BostonHousingC), 3)

BostonHousingC <- scale(BostonHousing[, c("rm", "crim", "zn","tax")], center = TRUE, scale = TRUE)
round(mean(BostonHousingC[, 1]), 3)
sd(BostonHousingC[, 1])



dat <- read.csv("https://luminwin.github.io/BST625/score_data.csv")


dat$score1_norm <- (dat$score1 
                    - min(dat$score1, na.rm = TRUE))/(max(dat$score1, na.rm = TRUE)
                                                      - min(dat$score1, na.rm = TRUE))


x <- dat$score1 

# step 1: create the nominator 
nominator <- x-min(x , na.rm = TRUE) 
# step 2: create the denominator 
denominator <- max(x , na.rm = TRUE)-min(x , na.rm = TRUE) 
# step 3: divide nominator by denominator 
normalize <- nominator/denominator 

normalize <- function(x) {
# step 1: create the nominator 
nominator <- x-min(x , na.rm = TRUE) 
# step 2: create the denominator 
denominator <- max(x , na.rm = TRUE)-min(x , na.rm = TRUE) 
# step 3: divide nominator by denominator 
normalize <- nominator/denominator 
# return the value  
normalize
}

normalize(dat$score1) 

######################
# {base}
######################
apply(dat[, 2:4], 2, normalize)  ## 2 for columns

apply(dat[, 2:4], 1, normalize)   ## 1 for rows

lapply(dat[, 2:4], normalize)

as.data.frame(lapply(dat[, 2:4], normalize))


######################
# {tidyverse}
######################
############################# slide 19
library(tidyverse)
dat %>%
  select(score1:score3) %>%
  map(normalize)%>%
  as_tibble %>%
  rename(score1_norm = score1,
         score2_norm = score2,
         score3_norm = score3)

