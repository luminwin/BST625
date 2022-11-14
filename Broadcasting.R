###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################


HEART1 <- read.csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {base}

if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)

HEART2 <- read_csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {tidyverse}


### check how Base R (HEART1) and tidyverse (HEART2) display data differently
HEART1

HEART2

dat <- HEART2

dat %>%
  select(Sex, Height) 

dat %>%
  mutate(logHeight = log(Height) ,
         sqrtHeight = sqrt(Height) )

### combine the two steps

dat %>%
  select(Sex, Height)  %>%
  mutate(logHeight = log(Height) ,
         sqrtHeight = sqrt(Height) )

### in class exercise: connect the following three steps:
############ HW5
library(tidyverse)
## Step 1
datt <- read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
datt <- pivot_wider(datt, names_from = time, 
                    values_from = pain)

## Step 2
datt <- datt %>% 
  mutate(
    age_grp = 
      case_when(
        age < 25 ~ "24-", 
        (25 <= age)&(age < 35) ~ "25-34", 
        (35 <= age)&(age < 45) ~ "35-44", 
        (45 <= age)&(age < 55) ~ "45-54", 
        (55 <= age)&(age < 65) ~ "55-64", 
        (65 <= age)&(age < 75) ~ "65-74", 
        TRUE ~ "75+", 
      ), 
    ct_grp = 
      case_when(
        trt == 1 ~ "control", 
        TRUE ~ "treatment"
      )
  )
## Step 3
datt %>% 
  group_by(age_grp, ct_grp) %>% 
  summarise(n = n(), .groups = "drop") %>% 
  pivot_wider(names_from = ct_grp, values_from = n) 



## key

datt <- read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
pivot_wider(datt, names_from = time, 
                    values_from = pain) %>% 
  mutate(
    age_grp = 
      case_when(
        age < 25 ~ "24-", 
        (25 <= age)&(age < 35) ~ "25-34", 
        (35 <= age)&(age < 45) ~ "35-44", 
        (45 <= age)&(age < 55) ~ "45-54", 
        (55 <= age)&(age < 65) ~ "55-64", 
        (65 <= age)&(age < 75) ~ "65-74", 
        TRUE ~ "75+", 
      ), 
    ct_grp = 
      case_when(
        trt == 1 ~ "control", 
        TRUE ~ "treatment"
      )
  ) %>% 
  group_by(age_grp, ct_grp) %>% 
  summarise(n = n(), .groups = "drop") %>% 
  pivot_wider(names_from = ct_grp, values_from = n) 

### == vs =
x = 5
## the same as x <- 5
x == 5

dat %>%
  mutate(Height == log(Height) ,
         Height == sqrt(Height) )

dat %>%
  select(Height) 


dat %>%
  select(-Height) 

dat[,-1] ## first column excluded

relig_income
relig_income %>%
  pivot_longer(-religion, names_to = "income", values_to = "counts")

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

dat <- transform(dat,
                 Total_Score = rowSums(dat[, paste("score", 1:3, sep = "")], na.rm = TRUE),
                 Avg_Score = rowMeans(dat[, paste("score", 1:3, sep = "")], na.rm = TRUE))
## the same as above
dat <- transform(dat,
                 Total_Score = rowSums(dat[, 2:4], na.rm = TRUE),
                 Avg_Score = rowMeans(dat[, c("score1", "score2", "score3")], na.rm = TRUE))


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

range(dat$Avg_Score)
cut(dat$Avg_Score, breaks = 10*5:10,
    labels = c("F", LETTERS[4:1]), # comment this line to check if you are right
    right = FALSE,
    ordered_result = TRUE)

table(dat$grade)

x <- subset(dat, gender == "m",
            select = c("name", "gender", "Total_Score", "Avg_Score", "grade", "pass"))

write.csv(x[order(x$Avg_Score), ], file = "Q1.Score_m.csv", row.names = FALSE)

## pretend I have duplicates
dat[1:3,] <- dat[1,]

unique(dat$grade)
unique(dat)

table(dat$grade, dat$gender)

table(dat$grade, dat$gender, dat$pass)

ftable(dat$grade, dat$gender, dat$pass)

######################
# {tidyverse}
######################
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

############################# now I want to update my dat

dat <- dat %>%  rowwise() %>%  #rowwise will make sure the sum operation occurs on each row
  mutate(Total_Score = sum(c(score1, score2, score3), na.rm= TRUE ),
         Avg_Score = mean(c(score1, score2, score3), na.rm= TRUE ),
         grade = case_when( Avg_Score < 60 ~ "F", 
                            (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
                            (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
                            (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
                            Avg_Score >= 90 ~ "A" ),
         pass = ifelse(grade == "F", "Fail", "Pass")
  ) 
##### summary 
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

rbind(dat,dat) %>% distinct()


############################# slide 13

dat %>%
  mutate(score1 = replace(score1, is.na(score1),
                          mean(score1, na.rm = TRUE))) ## replace is from {base}

dat$score1 <- replace(dat$score1, is.na(dat$score1),
        mean(dat$score1, na.rm = TRUE))

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
