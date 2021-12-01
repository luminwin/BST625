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
