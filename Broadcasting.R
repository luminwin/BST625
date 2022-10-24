###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

age <- c(10, 12, 25, 50, 55, 80)
mean(x = age, trim = 0.2) 

height <- c(120, 118, 162, 160, 169, 170)
mean(height[which(age>20)])   # conditional mean: average body height for participants older                                                      #  than 20 years old
height[order(age)]  