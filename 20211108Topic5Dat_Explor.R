###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

## Go to Blackboard => R => Code for Exercise
## Download
## File 1-data-read-write.R 
## File score_data.RData 
## File score_data.txt 
## File score_data.xlsx 
## File score_data999.csv 
## File score_data.csv 

res <- binom.test(x = 2, n = 25, conf.level = .95)
attriutes(res)
## Exact Confidence Intervals
res$conf.int

## https://luminwin.github.io/Lu/articles/BST625.html

setwd("C:/Users/mlu6/Dropbox/R book/GitR/BST625")

dat <- read.csv("score_data999.csv")

dat[dat==999] <- NA

write.csv(dat, file = "score_data.csv")

dat <- read.csv("score_data.txt")

dat <- read.csv("https://luminwin.github.io/BST625/HEART.csv")

dat <- read.csv("https://luminwin.github.io/BST625/score_data999.csv")

dat[dat==999] <- NA

write.csv(dat, file = "score_data.csv", row.names = FALSE)

dat <- read.csv("https://luminwin.github.io/BST625/score_data.txt")

load("C:/Users/mlu6/Dropbox/R book/GitR/BST625/score_data.RData")

save(dat, file = "score_data.RData")

save.image("my20211108.RData")

library(tidyverse)
dat <- read_csv("https://luminwin.github.io/BST625/score_data.csv")

write_csv(dat, file = "score_data.csv")

library(readxl)

score_data <- read_excel("data/score_data.xlsx")

url <- "https://luminwin.github.io/BST625/score_data.xlsx"
destfile <- "score_data.xlsx"
curl::curl_download(url, destfile)
dat <- read_excel(destfile)

## dat <- read_excel("https://luminwin.github.io/BST625/score_data.xlsx") ## does not work

search()

rm(score_data, score_data999)

X <- mtcars[1:5, c("mpg", "cyl", "disp")]

t(X)

###################################################################	
###
### R code for your SAS project 2
###
###################################################################	

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
# {base}
######################
########################## slide 6
dat <- read.csv("https://luminwin.github.io/BST625/score_data.csv")

dat[1:3,] <- dat[1,]

unique(dat$gender)
unique(dat)

rowSums(dat[, c("score1", "score2", "score3")], na.rm = TRUE)

rowSums(dat[, 2:4], na.rm = TRUE)


dat <- read.csv("https://luminwin.github.io/BST625/score_data.csv")

dat <- transform(dat,
                 Total_Score = rowSums(dat[, paste("score", 1:3, sep = "")], na.rm = TRUE),
                 Avg_Score = rowMeans(dat[, paste("score", 1:3, sep = "")], na.rm = TRUE))

dat$Total_Score <- rowSums(dat[, paste("score", 1:3, sep = "")], na.rm = TRUE)

##  (grade)         grade A: Avg_Score >= 90
##                        B: Avg_Score [80, 90)
##                        C: Avg_Score [70, 80)
##                        D: Avg_Score [60, 70)
##                        F: Avg_Score [0, 60)
cut(dat$Avg_Score, breaks = c(0, 60, 70, 80, 90, 100) ) ## not correct for the edge
cut(dat$Avg_Score, breaks = c(0, 60, 70, 80, 90, 100) , right = FALSE) ## correct

cut(dat$Avg_Score, breaks = c(0, 60, 70, 80, 90, 100) , right = FALSE,
    labels = c("F", "D", "C", "B", "A"))  

dat <- transform(dat,
                 grade = cut(Avg_Score, breaks = 10*5:10,
                             labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
                             right = FALSE,
                             ordered_result = TRUE))
dat$pass <- ifelse(dat$grade == "F", "Fail", "Pass")

## be careful about the edge!
range(dat$Avg_Score)
cut(dat$Avg_Score, breaks = 10*5:10,
    labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
    right = FALSE,
    ordered_result = TRUE)

table(dat$grade)

x <- subset(dat, gender == "m",
            select = c("name", "gender", "Total_Score", "Avg_Score", "grade", "pass"))

write.csv(x[order(x$Avg_Score), ], file = "Q1.Score_m.csv", row.names = FALSE)

x <- subset(dat, gender == "f",
            select = c("name", "gender", "Total_Score", "Avg_Score", "grade", "pass"))

x <- x[order(x$Avg_Score, decreasing = TRUE), ]
write.csv(x, file = "Q1.Score_f.csv", row.names = FALSE)

#dat[1:3,] <- dat[1,]

#unique(dat)

table(dat$grade, dat$gender)

x <- table(dat$grade, dat$gender, dat$pass)
dim(x)

ftable(dat$grade, dat$gender, dat$pass)

########################## slide 7
library(tidyverse)
dat <- read_csv("https://luminwin.github.io/BST625/score_data999.csv") 
dat[dat == 999] <- NA

dat %>%  rowwise() %>%  #rowwise will make sure the sum operation occurs on each row
  mutate(Total_Score = sum(c(score1, score2, score3), na.rm= TRUE ),
         Avg_Score = mean(c(score1, score2, score3), na.rm= TRUE ),
         grade = case_when( Avg_Score < 60 ~ "F", 
                            (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
                            (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
                            (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
                            Avg_Score >= 90 ~ "A" ),
         pass = if_else(grade == "F", "Fail", "Pass")
  ) %>% 
  select(name, gender, Total_Score, Avg_Score, grade, pass) %>% 
  filter(gender == "m") %>% 
  arrange(Avg_Score) %>% 
  write_csv("Q1.Score_m.csv")

dat <- dat %>%  rowwise() %>%  #rowwise will make sure the sum operation occurs on each row
  mutate(Total_Score = sum(c(score1, score2, score3), na.rm= TRUE ),
         Avg_Score = mean(c(score1, score2, score3), na.rm= TRUE ),
         grade = case_when( Avg_Score < 60 ~ "F", 
                            (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
                            (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
                            (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
                            Avg_Score >= 90 ~ "A" ),
         pass = if_else(grade == "F", "Fail", "Pass")
  ) 

############################# slide 8
dat %>% 
  select(score1:score3) %>%
  summary()

############################# slide 9

dat %>% 
  group_by(gender) %>%
  summarise(n(),
            mean(Avg_Score))

############################# slide 10

dat %>% 
  select(gender) %>% 
  table()

############################# slide 11
dat %>% 
  count(gender)

dat %>% 
  distinct(grade)

############################# slide 12

rbind(dat,dat) %>% distinct

############################# slide 13
library(tidyverse)
dat <- read_csv("https://luminwin.github.io/BST625/score_data999.csv") 
dat[dat == 999] <- NA

dat %>%
  mutate(score1 = replace(score1, is.na(score1),
                          mean(score1, na.rm = TRUE))) ## replace is from {base}

dat$score1 %>%
  replace_na(999) ## replace_na is from {tidyverse}

# dat$score1 %>%
#   replace_na(mean(score1, na.rm = TRUE)) ## not working, have to use replace() from {base}

dat %>% 
  replace_na(list(score1 = 999,
                  score2 = 9999)) ## convenient for


dat %>%
  drop_na()

na.omit(dat) ## na.omit is from {base}
