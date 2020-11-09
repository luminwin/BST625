
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


########################## slide 7
library(tidyverse)
dat <- read_csv("~/Dropbox/R book/GitR/BST625/score_data999.csv") 
dat[dat == 999] <- NA

dat %>%  rowwise() %>%  #rowwise will make sure the sum operation occurs on each row
  mutate(Total_Score = sum(c(score1, score2, score3), na.rm= TRUE ),
         Avg_Score = mean(c(score1, score2, score3), na.rm= TRUE ),
         grade = case_when( Avg_Score < 60 ~ "F", 
                            (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
                            (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
                            (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
                            Avg_Score >= 90 ~ "A" ),
         pass = ifelse(grade == "F", "Fail", "Pass")
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

############################# slide 8
dat %>% 
  select(score1:score3) %>%
  summary

############################# slide 9

dat %>% 
  group_by(gender) %>%
  summarise(n(),
            mean(Avg_Score))

############################# slide 10

dat %>% 
  select(gender) %>% 
  table

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
                          mean(score1, na.rm = TRUE)))


dat %>%
  drop_na()

############################# slide 14

dat %>% 
  group_by(gender, grade) %>%
  summarise(n = n())

dat %>% 
  group_by(gender, grade) %>%
  summarise(n = n()) %>%
  spread(grade, n)

############################# slide 15
dat %>% 
  count(gender, grade)

dat %>% 
  count(gender, grade) %>%
  spread(grade, n)

dat %>% 
  count(gender, grade, pass) %>%
  spread(grade, n)

############################# slide 18
normalize <- function(x){ 
  # step 1: create the nominator 
  nominator <- x-min(x , na.rm = TRUE) 
  # step 2: create the denominator 
  denominator <- max(x , na.rm = TRUE)-min(x , na.rm = TRUE) 
  # step 3: divide nominator by denominator 
  normalize <- nominator/denominator 
  # return the value 
  return(normalize)
} 


