###################################################################	
### <October 4 2020> Min Lu
###
###  
###
###################################################################	
### 
### Topic 3 
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


###  -------------------------------------------------------------
###  
###  
###  SAS project 2
###
###  -------------------------------------------------------------
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
######################
# One way to do it 
######################
dat$Total_Score <- rowSums(dat[,c("score1", "score2", "score3")], na.rm = TRUE)
dat$Avg_Score <- rowMeans(dat[,c("score1", "score2", "score3")], na.rm = TRUE) 
temp <- dat$Avg_Score
dat$grade <- "A"
dat$grade[(temp >= 80) & (temp < 90)] <- "B"
dat$grade[(temp >= 70) & (temp < 80)] <- "C"
dat$grade[(temp >= 60) & (temp < 70)] <- "D"
dat$grade[(temp <60)] <- "F"

## bonus: create ordered factor
dat$grade <- factor(dat$grade, levels = c("F", LETTERS[4:1]), 
                    ordered = TRUE)
dat$pass <- ifelse(dat$grade == "F", "Fail", "Pass")

# you can also create variables seperately and add variables to you dataset like this
# dat <- cbind(dat, Total_Score, Avg_Score, grade) 
table(dat$grade)

temp <- c("name", "gender", "Total_Score", "Avg_Score", "grade", "pass")
x <- dat[which(dat$gender == "m"), ]
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
attach(dat)
# run the above code without dat$ for dat$Avg_Score
detach(dat)

#################################
# missing value imputation
#################################
for(i in 1:ncol(dat)){
  if (is.numeric(dat[,i])){
  dat[is.na(dat[,i]), i] <- mean(dat[,i], na.rm = TRUE)
  } else {dat[is.na(dat[,i]), i] <- names(which.max(table(dat[, i])))}
}
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

# dat %>% mutate_all(~ifelse(is.na(.x), mean(.x, na.rm = TRUE), .x))  
### another way to do this
dat %>% 
  mutate(
    grade = 
      case_when(
        Avg_Score < 60 ~ "F", 
        (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
        (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
        (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
        TRUE ~ "A"    #################!!!!!!! this will be problemetic if you have missing values
      )
  )

dat %>% 
  mutate(
    grade = 
      case_when(
        Avg_Score < 60 ~ "F", 
        (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
        (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
        (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
        Avg_Score >= 90 ~ "A"    ################# This is better
      )
  )
### another way to do this
dat %>%  rowwise() %>%  #rowwise will make sure the sum operation will occur on each row
  mutate(Total_Score = sum(c(score1, score2, score3), na.rm= TRUE ),
         Avg_Score = mean(c(score1, score2, score3), na.rm= TRUE ),
         grade = cut(Avg_Score, breaks = 10*5:10,
                    labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
                    right = FALSE,
                    ordered_result = TRUE),
         pass = ifelse(grade == "F", "Fail", "Pass")
  )
### !!!!!!!!!!!!!! however, you can run the following with no error or warning but the result is wrong
dat %>% rowwise() %>% 
  #then a simple sum(..., na.rm=TRUE) is enough to result in what you need
  mutate(Total_Score = sum(score1, score2, score3, na.rm= TRUE ),
         Avg_Score = Total_Score/3,
         grade = cut(Avg_Score, breaks = 10*5:10,
                     labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
                     right = FALSE,
                     ordered_result = TRUE),
         pass = ifelse(grade == "F", "Fail", "Pass")
  )
### !!!!!!!!!!!!!! over

dat %>% 
  select(name, gender, Total_Score, Avg_Score, grade, pass) %>% 
  filter(gender == "m") %>% 
  arrange(Avg_Score) %>% 
  write_csv("Q1.Score_m.csv")
dat %>% 
  select(-(score1:score3)) %>% 
  filter(gender == "f") %>% 
  arrange(desc(Avg_Score)) %>% 
  write_csv("Q1.Score_f.csv")
###  -------------------------------------------------------------
###  
###  
###  SAS project 3
###
###  -------------------------------------------------------------


##### find the best automatic car and manual car in terms of mpg

data(mtcars)
# Transmission (0 = automatic, 1 = manual)
rownames(mtcars)[(mtcars$am == 0) & (mtcars$mpg == max(mtcars[mtcars$am == 0, "mpg"]))]
rownames(mtcars)[(mtcars$am == 1) & (mtcars$mpg == max(mtcars[mtcars$am == 1, "mpg"]))]

######################
# Another way to do it dplyr
######################
mtcars$model <- rownames(mtcars)
mtcars %>% group_by(am) %>% filter(mpg == max(mpg))
### similarly you can do 
filter(group_by(mtcars,am), mpg == max(mpg))

############# some other command in dplyr
by_cyl <- mtcars %>% group_by(cyl)
by_cyl %>% filter(disp == max(disp))
by_cyl %>% summarise(
  disp = mean(disp),
  hp = mean(hp)
)