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

dat <- read_csv("https://luminwin.github.io/BST625/score_data.csv")


dat %>%
  select(score1:score3) %>%
  map(normalize)%>%
  as_tibble %>%
  rename(score1_norm = score1,
         score2_norm = score2,
         score3_norm = score3)


dat %>%
  select(score1:score3) %>%
  map(normalize) %>%
  as_tibble %>%
  rename_with(~gsub("score","score_norm", . ))

gsub("score","score_norm", colnames(dat))

summary(dat)

x <- dat$name

mySummary <- function(x){
  
  if (is.character(x)){
    
    table(x) %>% 
      sort(decreasing = TRUE) %>%
      head
    
  } else {
    summary(x)
  }
  
}  

map(dat, mySummary) 

lapply(dat, mySummary) 


library(tidyverse)
dat <- read_csv("https://luminwin.github.io/BST625/score_data999.csv") 
dat[dat == 999] <- NA

dat %>%
  mutate(score1 = replace(score1, is.na(score1),
                          mean(score1, na.rm = TRUE)),
         score2 = replace(score2, is.na(score2),
                          mean(score1, na.rm = TRUE)),
         score3 = replace(score3, is.na(score3),
                          mean(score1, na.rm = TRUE))) %>% 
  rowwise() %>%
  mutate(Total_Score = sum(c(score1, score2, score3)),
         Avg_Score = mean(c(score1, score2, score3)),
         grade = case_when( Avg_Score < 60 ~ "F", 
                            (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
                            (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
                            (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
                            Avg_Score >= 90 ~ "A" ),
         pass = ifelse(grade == "F", "Fail", "Pass") ) %>% 
  map(mySummary) 
