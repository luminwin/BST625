# !!!!!!!!!!!!! load this data, this data is different from your .csv !!!!!
load("~/Dropbox/R book/R6/score_data.RData")

library(tidyverse)
?mpg # check the data
ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = cyl)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") +
  ggsave(height = 4, width = 4*1.9,
         file = "scatterexample.jpg")


########################################### slide # 4
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