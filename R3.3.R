dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
Pain_long <- dat$pain
nrow(dat)
rownames(dat) ## checking

rownames(dat) <- paste("row", 1:246)

rownames(dat) <- 1:246

head(dat)

colnames(dat) <- toupper(c("id",   "trt",  "sex",  "age",  "pain", "time"))

Pain_long
as.matrix(Pain_long)

mean(Pain_long[dat$sex==1])

mean(Pain_long[which(dat$sex==1)]) 
############################################################
setwd("~/Dropbox/R book/GitR/BST625")
dat <- read.csv("~/Dropbox/R book/GitR/BST625/score_data.csv")
head(dat)
##  (Total_Score) Total score as the sum of score 1 to 3
##  (Avg_Score) Average score as the mean of the score 1 to 3
##  (grade)         grade A: Avg_Score >= 90
##                        B: Avg_Score [80, 90)
##                        C: Avg_Score [70, 80)
##                        D: Avg_Score [60, 70)
##                        F: Avg_Score [0, 60)
##  (pass) grade A to D: "Pass", grade F: "Fail"

##  create a .csv file in your local machine that contains (name, gender and the above 4 new variables)
##  Data Q1.Score_m contains male students and the students have an average score sorted from low to high.
##  Data Q1.Score_f contains female students and the students have an average score sorted score from high to low.
dat$Total_Score <- rowSums(dat[,c("score1", "score2", "score3")], na.rm = TRUE)
dat$Avg_Score <- rowMeans(dat[,c("score1", "score2", "score3")], na.rm = TRUE) 

# dat[,c("score1", "score2", "score3")]
# dat[,2:4]

temp <- dat$Avg_Score
dat$grade <- "A"
dat$grade[(temp >= 80) & (temp < 90)] <- "B"   ### & and; | or
dat$grade[(temp >= 70) & (temp < 80)] <- "C"
dat$grade[(temp >= 60) & (temp < 70)] <- "D"
dat$grade[(temp < 60)] <- "F"

## bonus: create ordered factor
dat$grade <- factor(dat$grade, levels = c("F", LETTERS[4:1]),  
                    ordered = TRUE)

# factor(c(1,2,2,1,2), levels = c(1, 2), labels = c("treat", "control"))

dat$pass <- ifelse(dat$grade == "F", "Fail", "Pass")

temp <- c("name", "gender", "Total_Score", "Avg_Score", "grade", "pass")
#  Pain_long[which(dat$gender == "m")]
x <- dat[which(dat$gender == "m"), ]
# sort(x$Avg_Score)
x <- x[order(x$Avg_Score), ]
write.csv(x[ ,temp], file = "Q1.Score_m.csv")

x <- dat[which(dat$gender == "f"), ]
x <- x[order(x$Avg_Score, decreasing = TRUE), ]
write.csv(x[ ,temp], file = "Q1.Score_f.csv")

rm(temp, x)
######################
# Another way to do it
######################
dat <- read.csv("~/Dropbox/R book/GitR/BST625/score_data.csv")
dat$Total_Score <- rowSums(dat[,c("score1", "score2", "score3")], na.rm = TRUE)
dat$Avg_Score <- rowMeans(dat[,c("score1", "score2", "score3")], na.rm = TRUE) 
## be careful about the edge!
dat$grade <- cut(dat$Avg_Score, breaks = 10*5:10,
                 labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
                 right = FALSE,
                 ordered_result = TRUE)
table(dat$grade)

#################################
# Another way to repeat the above
#################################
dat$Avg_Score
Avg_Score
attach(dat)
dat$grade <- cut(Avg_Score, breaks = 10*5:10,
                 labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
                 right = FALSE,
                 ordered_result = TRUE)
table(grade)
detach(dat)
search()
#################################
######################
# Another way to do it dplyr
######################
library(tidyverse)
dat <- read_csv("~/Dropbox/R book/GitR/BST625/score_data.csv")
### this will have missing values
dat <- dat %>%
  mutate(
    Total_Score = score1 + score2 + score3,
    Avg_Score = Total_Score/3,
    grade = cut(Avg_Score, breaks = 10*5:10,
                labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
                right = FALSE,
                ordered_result = TRUE),
    pass = ifelse(grade == "F", "Fail", "Pass")
  )
### to remove NA
dat %>% 
  mutate(Total_Score = rowSums(select(., score1, score2, score3), na.rm = TRUE), #sum(score1, score2, score3, na.rm= TRUE ),
         Avg_Score = rowMeans(select(.,score1, score2, score3), na.rm = TRUE),
         grade = cut(Avg_Score, breaks = 10*5:10,
                     labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
                     right = FALSE,
                     ordered_result = TRUE),
         pass = ifelse(grade == "F", "Fail", "Pass")
  )
