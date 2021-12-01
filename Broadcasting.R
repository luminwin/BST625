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
