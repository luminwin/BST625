###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

age <- c(11, 22, 15, 50, 30, 71)  
height <- c(140, 160, 156, 170, 180, 175)
mean(height[which(age>20)])   # conditional mean: average body height for participants older                                                       #  than 20 years old
height[order(age)]                    #  display body height after sorting age in an increasing order


############
# vector
############

age <- c(10, 12, 25, 50, 55, 80)
height <- c(120, 118, 162, 160, 169, 170)

############
# matrix
############

cbind(age, height) # create a matrix by binding the columns
rbind(age, height) # create a matrix by binding the rows
# create a matrix by specifying each element
mdat <- matrix(c(1,2,3, 11,12,13), nrow = 3, ncol = 2) 
mdat