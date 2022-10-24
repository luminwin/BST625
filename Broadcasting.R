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

mdat <- matrix(c(1,2,3, 11,12,13), nrow = 3, ncol = 2, 
               dimnames = list(c("Geometry","Algebra", "Reading"),
                               c("Elementary", "Graduate")
               )) 
mdat

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

Satisfaction
attributes(Satisfaction)

Satisfaction[ , , 1] ## only display female

Satisfaction[ 4, 3:4, 1]

############
# list
############

myNamedList <- list(Names = c("Min", "Robert", "Mary", "Hemant"), 
                    Height = c(165, 185, 170, 180), 
                    IsMale = c(FALSE, TRUE, FALSE, TRUE))

myNamedList
attributes(myNamedList)
str(myNamedList)
############
# data.frame
############

as.data.frame(myNamedList)
mtcars
is.data.frame(mtcars)
head(mtcars)
attributes(mtcars)
tail(mtcars)
contributors()

mean(mtcars$cyl)

## input each element one by one
age <- c(10, 12, 25, 50, 55, 80) # real or decimal 
sum(age)
summary(age)


x <- age[1:4]

## operators: R conduct one to one calculation by default
y <- 1:4
x + y
x - y
x/y
x*y
######## for single value, it repeats that value for you as a vector with the same length
y <- c(1,5)
x
y
yfake <- c(1, 5, 1, 5)
x + yfake
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

## input each element one by one
names <- c("Min", "Robert", "Mary", "Hemant")

## use as. function
id <- as.character(1:4)
## use paste function
id2 <- paste(5:9)
id <- c(id, id2)
label1 <- paste("Scenario", LETTERS[1:4])
label2 <- paste("Scenario", 1:4, sep = "_")
label3 <- paste("Scenario", 1:4, collapse = "/") # we call this string
## use R Built-in Constants
Zone <- LETTERS[1:14]
zone <- letters[1:14]
Month.abb <- month.abb[1:4]
Month <- month.name[1:4]

## get information
zone # just type in the name to get information
head(zone) ## quick check for the first 6 elements/rows from data
length(zone) ## length of a vector
is.numeric(zone) # is it numeric or not? is.character(), is.na(), is.logical()...
is.character(zone)
is.vector(zone) # Is it a vector or not?
typeof(zone)

summary(zone) # not useful since summary() is for numeric values


##111111111  the following functions only applies to a character vector
toupper(zone) # to upper case
tolower(Zone) # to lower case
##111111111  end



dosage <- c("0-9g/day", "10-19", "20-29", "30+", "0-9g/day", "10-19", "20-29", "30+", "0-9g/day")
summary(dosage)  # not useful since summary() is for numeric values
table(dosage)   # table() is useful for character values


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

age <- c(10, 12, 25, 50, 55, 80)
height <- c(120, 118, 162, 160, 169, 170)
height[which(age>20)] 
height[age>20] ## the same as above

############# logic vectors are useful for manipulating data
age <- c(6, 3, 8, 10, NA, NA, NA)
is.na(age)  # ask if each element is missing
age[!is.na(age)] # delete missing elements

age[is.na(age)] <- 999 ## missing value imputation
age <- c(6, 3, 8, 10, NA, NA, NA)
age[is.na(age)] <- mean(age, na.rm = TRUE) # mean imputation


############## factors 
esoph <- esoph  ## bring the data from the "datasets" package to your environment

head(esoph) ## show the first 6 rows of your data
esoph$agegp
is.factor(esoph$agegp) ## is it a factor?

agegp.cat <- paste(esoph$agegp) ## create character vector
is.factor(agegp.cat) ## is it a factor?
agegp.fac <- as.factor(agegp.cat) ## convert a character vector to a factor

levels <- c("25-34", "35-44", "45-54", "55-64", "65-74", "75+")
levels[c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2)]

table(esoph$agegp) 
table(agegp.cat)  ## you can use table() for both 

age <- c(10, 12, 25, 50, 55, 80)
height <- c(120, 118, 162, 160, 179, 190)
################################################################
plot(age, height)
plot(height)

obj <- lm(height~age)
plot(obj)
methods(plot)
attributes(obj)
