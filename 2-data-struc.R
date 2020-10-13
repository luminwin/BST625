###################################################################	
### <October 14 2020> Min Lu
###
###  
###
###################################################################	
### 
### Topic 2 
### R section for BST 625
### Statistical Computing
### Fall 2020
### ------------------------------------------------------------
###  Min Lu, PhD                     m.lu6@umiami.edu
###                                  phone: 305-243-5473
###  Research Assistant Professor, Division of Biostatistics           
###  Clinical Research Building
###  1120 NW 14th Street, Room 1059
###  University of Miami, Miami FL 33136
###
###  -------------------------------------------------------------
###  THIS PROGRAM SHOULD NOT BE COPIED, USED, MODIFIED, OR 
###  DISSEMINATED IN ANY WAY WITHOUT SPECIFIC WRITTEN PERMISSION 
###  FROM THE AUTHOR.
###
###################################################################

#######################################################################
#                               slide 4
#######################################################################

## ------------ only for demonstration
# bring objects from loaded package to global environment .GlobalEnV
mtcars <- mtcars
x <- mean( unlist( mtcars[1:5, c(5, 7, 9)] )) 
# calculate the conditional mean of carb, conditioned on mpg>5
x <- mean( mtcars[which(mtcars$mpg>5), ]$carb ) 
age <- c(10, 12, 25, 50, 55, 80) # initialize a vector 
systolic <- c(120, 118, 122, 160, 149, 140) 
# calculate the conditional mean of age, conditioned on systolic > 130
avg_age_sy_g130 <- mean( age[which(systolic > 130)]) 
apply(mtcars, 2, typeof)

#######################################################################
#                               slide 8
#######################################################################

############# input a numeric vector
age <- c(10, 12, 25, 50, 55, 80)
systolic <- c(120, 118, 122, 160, 149, 140)
## two basic atomic classes
### double or integer, here numeric vector is a general term to refer both

## input each element one by one
age <- c(10, 12, 25, 50, 55, 80) # real or decimal 
indices <- c(1L, 2L, 3L, 4L, 5L, 6L) # integer

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
head(age) ## quick check for the first 6 elements/rows from data
length(age) ## length of a vector
is.numeric(age) # is it numeric or not? is.character(), is.na(), is.logical()...
is.vector(age) # Is it a vector or not?
summary(age)

age <- c(10, 12, 25, 50, 55, 80)
## select elements
age[5]    ## the fifth element
age[2:7]  ## select multiple elements from the second to the 7th
age[c(5,2:7)] ## all above
## you can select elements that have not exist yet! How awesome!
age[20]
age
age[20] <- 8
age
## you can input a single value to multiple elements 
## and R will repeat for you! How awesome!
age[17:20] <- 8
age

x <- age[1:4]
##111111111  the following function only applies to a numeric vector
range(x) #range
min(x)   # smallest value
max(x)   # largest value
sort(x)  # sort the value
order(x) # Ordering Permutation
x[order(x)] # the same as sort
abs(x)   # absolute value
log(x)   # logrithm transform
sqrt(x)  # square root
age^2      # squared
age^3      # to the third power
round(sqrt(x)) # round the result, () for calculation order from inside to outside
floor(x) # floor integer
ceiling(x) # ceiling integer
mean(x)    # mean
sd(x)      # standard deviation
var(x)     # variance
median(x)  # median
##111111111  end

## operators: R conduct one to one calculation by default
y <- 1:4
x + y
x - y
x/y
x*y
######## for single value, it repeats that value for you as a vector with the same length
y <- 5
x
y
x + y
x - y
x/y
x*y
######## you can do something like
(x/log(y))^2 

dosageWeek1 <- c(2, 8, 9, 13, 25)
dosageWeek2 <- c(1, 7, 6, 12, 23)
dosage <- dosageWeek1 + dosageWeek2
summary(dosage)
#########################################

#######################################################################
#                               slide 9
#######################################################################
############# input a character vector
## input each element one by one
chr_var <- c("these are", "some strings")
## use as. function
id <- as.character(1:4)
## use paste function
line_label <- paste("Scenario", 1:4)
line_label <- paste("Scenario", 1:4, sep = "_")
line_label <- paste("Scenario", 1:4, collapse = "/") # we call this string
## use R Built-in Constants
Zone <- LETTERS[1:4]
zone <- letters[1:4]
Month.abb <- month.abb[1:4]
Month <- month.name[1:4]

## get information
zone # just type in the name to get information
head(zone) ## quick check for the firt 6 elements/rows from data
length(zone) ## length of a vector
is.numeric(zone) # is it numeric or not? is.character(), is.na(), is.logical()...
is.character(zone)
is.vector(zone) # Is it a vector or not?
typeof(zone)

summary(zone)


##111111111  the following functions only applies to a character vector
toupper(zone) # to upper case
tolower(Zone) # to lower case
##111111111  end

############ convert characters to dates
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92")
typeof(dates)
dates <- as.Date(dates, "%m/%d/%y")
dates
typeof(dates)
dates + 1
dates[1] + 1:10
summary(dates)
summary(zone)

#######################################################################
#                               slide 10
#######################################################################

dosage <- c("0-9g/day", "10-19", "20-29", "30+", "0-9g/day", "10-19", "20-29", "30+", "0-9g/day")
summary(dosage)
table(dosage)

#######################################################################
#                               slide 11
#######################################################################

############# input a logical vector
condition <- c(FALSE, TRUE)
conditionC <- !condition   ## ! for the opposite
x <- c(0, 1:3, 0, -5, 6)
condition <- as.logical(x) ## 0 will be FALSE, otherwise it will be true

x == 1 # check if x equals to 1 through comparing each element
x > 1  # ........... greater than .......... 
x >= 1 # ........... greater than or equal to ..........
x <= 1 # ........... less than or equal to .......... 
x < 1  # ........... less than .......... 

x <- c(6, 3, 8, 10)
y <- 6:9

x == y # check if x equals to y through comparing each element 
x < y # ........... is smaller than y ...............
x <= y # .......... is smaller than or equal to y ...............

(x < y)|(x == y)  # | for "or"
x <= y
(x <= y)&(x == y) # & for "and"
x == y

############# logic vectors are useful for maniputating data
age <- c(6, 3, 8, 10)
age[2:3]
age[c(FALSE,TRUE,TRUE)] # use TRUE or FALSE to determine whether elements are selected
age <- c(6, 3, 8, 10, NA, NA, NA)
is.na(age)  # ask if each element is missing
age[!is.na(age)] # delete missing elements

#######################################################################
#                               slide 12
#######################################################################

############## factors 
esoph <- esoph  ## bring the data from the R Datasets package to your
head(esoph) ## show the first 6 rows of your data
agegp.cat <- paste(esoph$agegp) ## create charactor vector
is.factor(esoph$agegp) ## is it a factor?
is.factor(agegp.cat) ## is it a factor?
agegp.fac <- as.factor(agegp.cat) ## convert a charactor vector to a factor
table(esoph$agegp) 
table(agegp.cat)

############## functions using vectors
age <- c(6, 3, 6, 10, NA, NA, NA)
which(age == 6) # give the TRUE indices of a logical object
length(which(is.na(age) == TRUE))  # how many elements are missing
age <- age[which(is.na(age) == FALSE)]  # delete missing elements


#######################################################################
#                               slide 13
#######################################################################
############## input a Matrix
age <- c(26, 23, 38, 40)

## from elements in a vector
mtrx <- matrix(age, nrow = 2, ncol = 2) # default setting: byrow = FALSE
mtrx <- matrix(1:12, nrow = 3, ncol = 4)
mtrx <- matrix(5, nrow = 3, ncol =2) # matrix with elements = 5
mtrx <- matrix(5, 3, 2)
## use as. function
mtrx <- as.matrix(age)
## use cbind() or rbind()
indices <- 1:4
mtrx <- rbind(age, indices) # row combine 
mtrx <- cbind(age, indices) # column combine 
heightInInches <- c(67, 62, 60.01, 68)
mtrx <- cbind(mtrx, heightInInches)
mtrx <- cbind(age, indices, heightInInches)

## select elements from a matrix
dim(mtrx) # dimension: how mang rows and colmuns in a matrix
mtrx[2,2] # element in the second row, third column
mtrx[2,]  # all element (vector) in the second row
mtrx[,2]  # all element (vector) in the second row

## elements from matrix should be the same type
names <- c("Raymond", "Lori", "Mary", "Andrew")
cbind(mtrx, names) ## this is not good; this coerces numeric to character

#######################################################################
#                               slide 14
#######################################################################
############## list
names <- c("Raymond", "Lori", "Mary", "Andrew")
heightInInches <- c(67, 62, 60.01, 68)
isFemale <- c(FALSE, TRUE, TRUE, FALSE) 
baliseList <- list(names, heightInInches, isFemale) ## initialize a list
baliseList
############## input a data.frame
############## a data.frame is a special list, 
############## where elements are vectors with the same length
############## displayed and used in the format of a matrix.
############## Vectors don't have to be the same type
dtfrm <- as.data.frame(mtrx)
dtfrm <- data.frame(age = age, # the variable names are in front of =
                    indices = indices, 
                    heightInInches = heightInInches) # the variable names 
dtfrm <- data.frame(names = names, mtrx)