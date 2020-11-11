# !!!!!!!!!!!!! load this data, this data is different from your .csv !!!!!
load("~/Dropbox/R book/R6/score_data.RData")

library(tidyverse)
?mpg # check the data
ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = cyl)) + 
  geom_smooth(method = "lm", colour = "red")
  geom_smooth(method = "lm", colour = "red") +
  ggsave(height = 4, width = 4*1.9,
         file = "scatterexample.jpg")
