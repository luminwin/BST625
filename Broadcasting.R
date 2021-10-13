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


## select elements
age[5]    ## the fifth element
age[2:7]  ## select multiple elements from the second to the 7th
age[c(5,2:7)] ## all above

age     ## display the object again
age[-5] ## remove the fifth element
age[-c(5,2:7)] 

which.max(age) ## which element is the maximum

age[which.max(age)] ## choose the maximum value
max(age)            ## the same as above
age[-which.max(age)] ## remove the maximum value
mean(age[-which.max(age)]) ## similar to IfedisMean() 

which(age>8) ## which elements are greater than 8?
age[which(age>8)] ## select elements that are greater than 8
height <- 21:30
mean(height[which(age>8)]) ## calculate the mean for elements that are greater than 8


x <- age[7:10]
##111111111  the following functions only apply to a numeric vector
range(x) #range
min(x)   # minimum value/smallest value
max(x)   # maximum value/largest value


sort(x)  # sort the value
order(x) # Ordering Permutation
x[order(x)] # the same as sort()


abs(x)   # absolute value
log(x)   # logarithm transform
sqrt(x)  # square root
age^2      # squared
age^3      # to the third power

round(sqrt(x)) # round the result, () for function implementation ordered from inside to outside
round(sqrt(x), digits = 2) # set digits for round()
round(sqrt(x), 2) # the same as above
floor(x) # floor integer
ceiling(x) # ceiling integer

mean(x)    # mean
sd(x)      # standard deviation
var(x)     # variance
median(x)  # median
##111111111  end

