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
