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
mdat <- matrix(c(1,2,3, 11,12,13), ncol = 2, nrow = 3) 

mdat <- matrix(c(1,2,3, 11,12,13), 2, 3) 

mdat[2, 1]

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 3, ncol = 2, 
               dimnames = list(Subject = c("Geometry","Algebra", "Reading"),
                               Edu = c("Elementary", "Graduate")
               )) 

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 3, ncol = 2, 
               dimnames = list(c("Geometry","Algebra", "Reading"),
                               c("Elementary", "Graduate")
               )) 

mdat
## attributes() tells you the names and other information within an object
attributes(mdat) 
## str() compactly displays the structure of an arbitrary R object
str(mdat)

mdat[, 1]

############
# array -- not required in this class
############

my.array <- array(1:24, dim=c(3,4,2))
my.array
attributes(my.array)

Satisfaction <- array(c(1, 2, 0, 0, 3, 3, 1, 2,
                        11, 17, 8, 4, 2, 3, 5, 2,
                        1, 0, 0, 0, 1, 3, 0, 1,
                        2, 5, 7, 9, 1, 1, 3, 6),
                      dim = c(4, 4, 2),
                      dimnames =
                        list(Income =
                               c("<5000", "5000-15000",
                                 "15000-25000", ">25000"),
                             JobSatisfaction =
                               c("V_D", "L_S", "M_S", "V_S"),
                             Gender = c("Female", "Male")))
