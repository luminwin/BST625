###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

# If you submit your HW6 by this Friday with the bonus part (Nov 25th, 11:59pm), 
# I will grade your homework early so that you can resubmit to claim all your lost points. 

# Please download "team.jpg" and "score_data.RData" from our blackboard to join class

setwd("C:/Users/m.lu/Downloads/BST625/R6")
load("score_data.RData")
save.image("scoresave.RData") ## save all the object in your environment
save(dat, file = "score_data.RData") ## save a specific object dat


library(tidyverse) # if you have error you have to run the following first
# install.packages("tidyverse")

?mpg # check the data

ggplot(mpg) +
  aes(x = hwy) +
  geom_histogram()

ggplot(mpg) +
  geom_histogram(aes(x = hwy))

ggplot(mpg) +
  geom_histogram(aes(x = hwy), binwidth = 5)

ggplot(mpg) +
  geom_histogram(aes(x = hwy), bins = 20)


ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point()


ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point() +
  geom_smooth(method = "lm", colour = "red") 


ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = trans,
                 size = displ),   ## bubble plot
             alpha = 0.5) + 
  # Default smoother is LOESS (Locally Weighted Scatterplot Smoothing)
  geom_smooth(colour = "green") +
  geom_smooth(method = "lm", colour = "red") 
ggsave(height = 4, width = 4*1.9,
       file = "scatterexample.jpg") #.png  .jpg   or   .pdf

