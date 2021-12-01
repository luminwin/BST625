###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

###################################################################	
### 
### Go to blackboard and download app.R from R7 R Shinny APP
###
###################################################################

###################################################################	
### 
### BST 625 Contributors' work
###
###################################################################
checkuse <-function(x){
  if(x %in% rownames(installed.packages()) == FALSE) {
    install.packages(x)
  }
  # library(x, character.only = TRUE)
}

checkuse("maps")
checkuse("tidyverse")
checkuse("skimr")
checkuse("data.table")
checkuse("cowsay")
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
Pain_long <- dat$pain


##########################################################################
# contributor: Carson Coudriet {base}
###########################################################################
attach(dat)
summary(pain)
detach(dat)

##########################################################################
# contributor: Alvin Mathew {base}
###########################################################################
quantile(Pain_long, na.rm = TRUE, probs = c(0.33,0.66))
## ----|The purpose of this command is to remove the missing values and obtain 
## the tertiles of pain intensity within the object *Pain_long*.                                            

# contributor: Min Lu {base}
# try some continuous variable with more values
quantile(dat$age, na.rm = TRUE, probs = c(0.33,0.66))
##########################################################################
# contributor: Dingtian Cai {base}
###########################################################################

## ----| I learned it from internet, R is an opening community. 
## It can consist most statistics solutions by import the package to it. 
## There are lots of people sharing their R package. We can use them directly instead of 
## writing them by ourselves. 

##########################################################################
# contributor: Corinne Ferrari {base}
###########################################################################
plot(Pain_long)
## ----|Plotting the values of Pain_long.

##########################################################################
# contributor: Haiyong Shu {base}
###########################################################################
unique(Pain_long)

##########################################################################
# contributor: Jessica Rivera; Valeria Aguilar; Diane Choi; Romita Rajasekaran {base}
#              Ibidolapo Okedara; Ifedioranma Anikpo; Amrit Baral; Jayro Toledo
#              Yuchen Wang; Peiyu Zhu
###########################################################################
hist(Pain_long)
barplot(Pain_long)
## write down the purpose of the above command
## ----| To create a histogram and barplot of the Pain_long vector

## ----|I found Google and the help section to be super helpful in finding  solutions

##########################################################################
# contributor: Frank Gutierrez {base}
###########################################################################
counts <- table(dat$pain)
barplot(counts, main="Pain Intensity",
        xlab="Pain Intensity Level", ylab="The Total Amount of the Same Pain Intensity",
        col=c("green"))

## write down the purpose of the above command
## ----|This creates a box plot of the pain data with the color green. 

## ----|The R help file has been extremely helpful.

##########################################################################
# contributor: Jingwei Gu {base}
###########################################################################
Pain_long[3]
## [1] 0
## write down the purpose of the above command
## ----| Selecting the third element of pain_long and I run it, the third element is 0.

##########################################################################
# contributor: Xinyi Liao {base}
###########################################################################
typeof(Pain_long) 
## write down the purpose of the above command
## ----|Knowing what type of variable is for Pain_long([1] "integer")

##########################################################################
# contributor: Hannah Cranford {base}
###########################################################################
x<- c("Firefox", "Chrome", "Edge", "Safari", "Internet Explorer", "Opera")
startsWith(x, "E")
x[which((startsWith(x, "E")==TRUE))]

## write down the purpose of the above command
## ----|Line 75 assigns a set of character variables to the vector x. 
## Line 76 is a logic function that returns true if the element in the vector starts 
## with "E" and returns false if all other. Line 77 takes line 76 and uses it inside 
## another function to return the name of the element(s) that return true for startsWith(). 
## ----| I found the startsWith function online and after reviewing the use in R Help, 
## I then used it in combination with some of the code learned in 2-data-struc.R to return 
## the name of the element of interest. 

# contributor: Min Lu {base}
# Now we know we can also use
subset(x, startsWith(x, "E"))

##########################################################################
# contributor: Ahmed Alnajar {base}
###########################################################################
library("skimr")
skimr::skim(dat)
detach("package:skimr", unload=TRUE)
scale0_1 <- function(x) {
  return((x - min(x,na.rm = T)) / (max(x,na.rm = T) - min(x,na.rm = T))) 
}

hist(scale0_1(Pain_long))
hist(scale(Pain_long))
## write down the purpose of the above command
## ----| this will present the data after transformation so I can tell how it 
## affected my data distribution using 0-1 scale and Z-socre scale
## ----|I find stackoverflow.com a very good resource to test others code and adopt it in my work
# furthermore, base R functions are really easy to use, but our own functions can be more 
## constomizable

