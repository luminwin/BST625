###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################


age <- c(11, 22, 15, 50, 30, 71)
#debugonce(mean) 
#mean(age)

IfedisMean <- function(x) {
  index <- c(which.max(x))
  x0 <- x[-index]
  mean(x0)
}
IfedisMean(age)
mean(age)

## two basic atomic classes
### double or integer, here numeric vector is a general term to refer to both

## input each element one by one
age <- c(11, 22, 15, 50, 30, 71) # real or decimal 

age <- c(age, 6, 7, 3, 10) # add more elements
indices <- 1:10  # integer, colon : generates a sequence in steps of 1 or -1
x <- rep(0, 5) # repeat 0 5 times
typeof(age) ## get the type of the vector
typeof(indices)


## convert classes
age <- as.integer(age)  # as.numeric(), as.character(), as.logical()...
typeof(age)

## get information
age # just type in the name to get information
length(age) ## length of a vector
is.numeric(age) # is it numeric or not? is.character(), is.na(), is.logical()...
is.vector(age) # Is it a vector or not?
summary(age)
