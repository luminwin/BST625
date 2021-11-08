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
