###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

age <- c(11, 22, 15, 50, 30, 71) 
order(age)
age[order(age)]

height <- c(140, 160, 156, 170, 180, 175) 
height[order(age)]              #  display body height after sorting age in an increasing order 

dat <- read.csv("https://luminwin.github.io/BST625/HEART.csv")

head(dat)

dat$Height ## extract column/vector/variable from a data.frame


## sort the data with increasing order of height
dat.sortH <- dat[order(dat$Height), ] 
head(dat.sortH)

tail(dat.sortH)

###################################################
# {base}
# column/row name manipulation colnames()/rowname()
####################################################
######################## slide 13
colnames(dat) ## display the column names like attributes()

colnames(dat)[1]

## rename the first column
colnames(dat)[1] <- "Cat_Status" 
colnames(dat)[1]

## rename all the other categorical variables (character vectors)
str(dat)
colnames(dat)[c(2,14:17)]  <- paste("Cat",c("DeathCause",
                                            "Chol_Status",
                                            "BP_Status",
                                            "Weight_Status",
                                            "Smoking_Status"), 
                                    sep = "_")

## rename the column names to lower case
colnames(dat.sortH) <- tolower(colnames(dat.sortH))
colnames(dat.sortH)

##########################################
#
#    In-class Exercise
#
##########################################

education <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/robustbase/education.csv")
head(education)

##########################################
# Can you rename the columns of education as 
c("ID",
  "State",
  "Region",
  "Urban.Population",
  "Per.Capita.Income",
  "Minor.Population",
  "Education.Expenditures")