###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

############ go to Blackboard and download score_data.RData from R6

load("score_data.RData")
#load("/Users/min/Dropbox/R book/GitR/BST625/data/score_data.RData")

library(tidyverse) # if you have error you have to run the following first
# install.packages("tidyverse")

?mpg # check the data

ggplot(mpg) +
  aes(x = hwy) +
  geom_histogram(bins = 20)

ggplot(mpg) +
  geom_histogram(aes(x = displ))

ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = cyl)) + 
  # Default smoother is LOESS (Locally Weighted Scatterplot Smoothing)
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

ggsave(height = 4, width = 4*1.9,
       file = "scatterexample.pdf")

# load("score_data.RData")

## make a scatter plot using score1 score2

ggplot(data = dat) +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = score3)) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = drv,
                 size = cyl),
             alpha = 0.5) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

ggplot(data = dat) +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = gender,
                 size = score3)) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") 

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass"))  %>%
  ggplot() +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = Avg_Score)) + 
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  rename(GRE = score1,
         GPA_stats_I = score2,
         GPA_stats_II = score3) %>%
  ggplot() +
  aes(x = GRE, y = GPA_stats_II) + 
  geom_point(aes(colour = GPA_stats_I)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")+
  labs(x = "GRE", y="GPA stats II")

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot() +
  geom_bar(mapping = aes(x = grade)) +
  labs(x = "Grade", y="Count Number")
