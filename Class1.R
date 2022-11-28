age <- c(5, 6, 7, 8, 9, 10)          # initialize a vector
height <- c(103, 108, 112, 122, 129, 140)



plot(age, height) # make a plot


pdf("example.pdf", width = 5, height = 5)
plot(age, height)
dev.off()

########## R1_Intro.ppt Slides 7 to 12 ## environment

plot(mtcars$mpg, mtcars$cyl)

search() # display all environments in your RAM/memory

ls()  # print all the objects created by you

## Windows users should install Rtools at
## https://cran.rstudio.com/bin/windows/Rtools/

#install.packages("metavcov")  # install a package
#library("metavcov")           # load a package
#require("metavcov")           # load a package



age <- c(5:10, NA)

mean(age) # calculate the average/mean


mean(x = age, trim = 0.2, 
     na.rm = TRUE) # trimmed mean


x <- c(0:10, 50)
xm <- mean(x)
c(xm, mean(x, trim = 0.10))

mean(c(22, 15, 90, 55))

mean(age, 0.2, TRUE)  # the same as mean(x = age, trim = 0.2, na.rm = TRUE)
mean(age, 0.2)        # the same as mean(x = age, trim = 0.2, na.rm = FALSE)


########## R1_Intro.ppt Slides 23 to 25 ## initialize a vector 

lgl_var <- c(TRUE, FALSE) # logical
int_var <- c(1L, 6L, 10L) # integer
dbl_var <- c(1, 2.5, 4.50121345421) # double
chr_var <- c("Everyone can be", "contributer for R 22458  sxdaweqawq") # "character"

typeof(lgl_var) 

typeof(int_var) 

typeof(dbl_var) 

typeof(chr_var) 

########## R1_Intro.ppt Slides 26 to 28 ##  a vector
names <- c("Min", "Robert", "Mary", "Hemant")
heightInCM <- c(165, 185, 170, 180)
isMale <- c(FALSE, TRUE, FALSE, TRUE) 

mylist <- list(names, heightInCM, isMale) ## initialize a list
mylist
mylist[[1]][2]

## initialize a named list
myNamedList <- list(Names = names, Height = heightInCM, IsMale = isMale)

myNamedList <- list(Names = c("Min", "Robert", "Mary", "Hemant"), 
                    Height = c(165, 185, 170, 180), 
                    IsMale = c(FALSE, TRUE, FALSE, TRUE))
myNamedList
as.data.frame(myNamedList)

print(myNamedList)
str(myNamedList)

myNamedList$Names
myNamedList$names  ## case sensitive


########## R1_Intro.ppt Slides 28 to 32 ## Looking at Complicated Lists
str(mtcars)
########## R1_Intro.ppt Slide 32 ## Looking at An Object
age <- c(5, 6, 7, 8, 9, 10)      
height <- c(103, 108, 112, 122, 129, 140)
obj <- lm(height~age)
str(obj)

summary(obj)

summary(age)

summary(mtcars)



############# input a numeric vector

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
which.max(age) ## which element is the maximum
age[which.max(age)] ## choose the maximum value
max(age)            ## the same as above
age[-which.max(age)] ## remove the maximum value
mean(age[-which.max(age)]) ## similar to IfedisMean() 


which(age>8) ## which elements are greater than 8?
age[which(age>8)] ## select elements that are greater than 8
mean(age[which(age>8)]) ## calculate the mean for elements that are greater than 8


x <- age[7:10]
##111111111  the following functions only apply to a numeric vector
range(x) #range
min(x)   # minimum value/smallest value
max(x)   # maximum value/largest value


sort(x)  # sort the value
order(x) # Ordering Permutation
x[order(x)] # the same as sort()

x[c(1,3)]


abs(x)   # absolute value
log(x)   # logarithm transform
sqrt(x)  # square root
age^2      # squared
age^3      # to the third power

round(sqrt(x)) # round the result, () for function implementation ordered from inside to outside
round(sqrt(x), digits = 3) # set digits for round()
round(sqrt(x), 2) # the same as above
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
######## for single value, it repeat that value for you as a vector with the same length
y <- 5
x
y
x + y
x - y
x/y
x*y
######## you can do something like
(x/log(y))^2 


age <- c(11, 22, 15, 50, 30, 71, 90, 20, 26, 47) 
head(age) ## quick check for the first 6 elements/rows from data
## you can select elements that haven't exist yet! How awesome!
age[20]
age
age[20] <- 8
age
## you can input a single value to multiple elements 
## and R will repeat for you! How awesome!
age[10:20] <- 8
age
