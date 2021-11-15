###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

############ go to Blackboard and download score_data.RData from R6

load("score_data.RData")
#load("/Users/min/Dropbox/R book/GitR/BST625/data/score_data.RData")

?mpg # check the data

ggplot(mpg) +
  aes(x = hwy) +
  geom_histogram(bins = 20)

ggplot(mpg) +
  geom_histogram(aes(x = displ))

ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point()