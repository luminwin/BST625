###################################################################	
### <October 4 2020> Min Lu
###
###  
###
###################################################################	
### 
### Topic 1 
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

x <- 83
########## R1_Intro.ppt Slides 1 to 6 ## familiar with R studio
age <- c(10, 12, 25, 50, 55, 80)       # initialize a vector
systolic <- c(120, 118, 122, 160, 149, 140)


plot(age, systolic) # make a plot


pdf("example.pdf", width = 5, height = 5)
plot(age, systolic)
dev.off()

########## R1_Intro.ppt Slides 7 to 12 ## environment

plot(mtcars$mpg, mtcars$cyl)

x <- 1
ls()    # print objects in your Global Environment
e <- new.env()  # create new environment e
e$a <- FALSE
e$b <- "a"
e$c <- 2.3
e$d <- 1:3
rm(e)  # remove environment e  
rm(x)  # remove object x from global environment

search() # display all enviornments in your RAM

ls("package:stats")  # print objects in package "stats"

install.packages("xfun")  # install a package
library("xfun")           # load a package
require("xfun")           # load a package


########## R1_Intro.ppt Slides 13 to 22 ## function usage                             

age <- c(10, 12, 25, 50, 55, 80)
mean(age) # calculate the average/mean
mean(x = age, trim = 0.2, na.rm = TRUE) # trimmed mean

mean(c(12, 25, 50, 55))

mean(age, 0.2, TRUE)  # the same as mean(x = age, trim = 0.2, na.rm = TRUE)
mean(age, 0.2)        # the same as mean(x = age, trim = 0.2, na.rm = FALSE)

########## R1_Intro.ppt Slides 23 to 25 ## initialize a vector 

lgl_var <- c(TRUE, FALSE) # logical
int_var <- c(1L, 6L, 10L) # integer
dbl_var <- c(1, 2.5, 4.5) # double
chr_var <- c("these are", "some strings") # "character"

typeof(lgl_var) 

typeof(int_var) 

typeof(dbl_var) 

typeof(chr_var) 

########## R1_Intro.ppt Slides 26 to 28 ##  a vector
names <- c("Raymond", "Lori", "Mary", "Andrew")
heightInInches <- c(67, 62, 60.01, 68)
isFemale <- c(FALSE, TRUE, TRUE, FALSE) 

baliseList <- list(names, heightInInches, isFemale) ## initialize a list
baliseList

## initialize a named list
baliseNamedList <- list(names = names, height = heightInInches, isFemale = isFemale)

print(baliseNamedList)

baliseNamedList$names

########## R1_Intro.ppt Slides 28 to 32 ## Looking at Big/Complicated Lists
balises <- baliseList
balises
print(balises)
(balises <- baliseList)
str(balises)
########## R1_Intro.ppt Slide 32 ## Looking at An Object
age <- c(10, 12, 25, 50, 55, 80)
systolic <- c(120, 118, 122, 160, 149, 140)
theModel <- lm(systolic~age)
str(theModel)

summary(theModel)



################## R1_RMarkdown.ppt slides 9
################## R style guide

## comments are retained; a comment block will be
## reflowed if it contains long comments;
#' roxygen comments will not be wrapped in any case
1 + 1

if (TRUE) {
  x = 1  # inline comments
} else {
  x = 2
  print("Oh no... ask the right bracket to go away!")
}
1 * 3  # one space before this comment will become two!
2 + 2 + 2  # only 'single quotes' are allowed in comments

lm(y ~ x1 + x2, data = data.frame(y = rnorm(100), x1 = rnorm(100), 
                                  x2 = rnorm(100)))  ### a linear model
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 
  1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1  # comment after a long line
## here is a long long long long long long long long
## long long long long long comment that may be
## wrapped

library(formatR)
tidy_source(width.cutoff = 50) # can set arbitrary width here

################## R1_RMarkdown.ppt slides 10
################################
# bring objects from loaded package to global environment .GlobalEnV
mtcars <- mtcars
x <- mean( unlist( mtcars[1:5,c(5,7,9)] )) 
# calculate the conditional mean of carb, conditioned on mpg>5
x <- mean( mtcars[which(mtcars$mpg>5), ]$carb ) 
age <- c(10, 12, 25, 50, 55, 80) # initialize a vector 
systolic <- c(120, 118, 122, 160, 149, 140) 
# calculate the conditional mean of age, conditioned on systolic > 130
avg_age_sy_g130 <- mean( age[which(systolic > 130)]) 
apply(mtcars, 2, typeof)
