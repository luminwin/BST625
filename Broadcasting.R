###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

age <- c(10, 80, 12, 
         25, 50, 55)

mean(x = age, trim = 0.2) 

height <- c(120, 118, 162, 160, 169, 170)
mean(height[which(age>20)])   # conditional mean: average body height for participants older                                                      #  than 20 years old
height[order(age)]  

############
# matrix
############

cbind(age, height) # create a matrix by binding the columns
rbind(age, height) # create a matrix by binding the rows
# create a matrix by specifying each element
mdat <- matrix(c(1,2,3, 11,12,13), nrow = 3, ncol = 2) 
mdat <- matrix(c(1,2,3, 11,12,13), 3, 2) 
mdat <- matrix(c(1,2,3, 11,12,13), ncol = 2, nrow = 3) 

mdat[2 , 2]
mdat[1:3 , 2]
mdat[c(1,3) , 2]
mdat[ , 2]
mdat[1 , ]

mdat[3 , 2] <- 5

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 3, ncol = 2, 
               dimnames = list(Subject = c("Geometry","Algebra", "Reading"),
                               Edu = c("Elementary", "Graduate")
               )) 
mdat
## attributes() tells you the names and other information within an object
attributes(mdat) 
## str() compactly displays the structure of an arbitrary R object
str(mdat)