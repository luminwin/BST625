###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################


age <- c(11, 22, 15, 50, 30, 71)
#debugonce(mean) 
#mean(age)

IfedisMean <- function(x) {
  x0 <- x[-c(which.min(x), which.max(x))]
  mean(x0)
}
IfedisMean(age)
mean(age)