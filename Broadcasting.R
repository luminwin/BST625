###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################
############################################
# {base}
# Row manipulation order() ---sort records
############################################

######################## slide 11

age <- c(11, 22, 15, 50, 30, 71) 
height <- c(140, 160, 156, 170, 180, 175) 
height[order(age)]              #  display body height after sorting age in an increasing order 


dat <- read.csv("https://luminwin.github.io/BST625/HEART.csv")
head(dat)

dat$Height ## extract column/vector/variable from a data.frame


## sort the data with increasing order of height
dat.sortH <- dat[order(dat$Height), ] 
head(dat.sortH)

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

colnames(education)  <-  c("ID",
                           "State",
                           "Region",
                           "Urban.Population",
                           "Per.Capita.Income",
                           "Minor.Population",
                           "Education.Expenditures")

head(education)

###################################################
# {base}
# column manipulation transform()--- transform values
####################################################


######################## slide 14
########## transform values
hist(dat$Systolic)

## create a new column/variable called logSystolic
dat <- transform(dat, logSystolic = log(Systolic))

hist(dat$logSystolic)

### we could keep the name as the same
#### use dat.sortH as an example
hist(dat.sortH$systolic)
dat.sortH <- transform(dat.sortH, systolic = log(systolic))
hist(dat.sortH$systolic)

######################## slide 15
########## transform values
dat <- transform(dat, isMale = ifelse(Sex == "Male", 1, 0))

dat <- transform(dat, isMale = ifelse(Sex == "Male", "Y", "N"))
head(dat)
## we also learnt factor in data structure
dat <- transform(dat, isMale = factor(Sex, 
                                      levels = c("Female", "Male"),
                                      labels = c(0,1)) )
dat$isMale

x <- cut(dat$Height, breaks = 4)
table(x)
barplot(table(x))
## cut can also create a factor
dat <- transform(dat, Heightgrp = cut(Height, 
                                      breaks = 4)) ## automatically create 4 groups

dat$Heightgrp
table(dat$Heightgrp)


dat$Heightgrp <- cut(dat$Height, breaks = c(0, 60, 65, 70, 80),
                     labels = c("59-","60-65","66-69","70+"))

table(dat$Heightgrp)

## Now let's use the transform function
dat <- transform(dat, Heightgrp = cut(Height, 
                                      breaks = c(0, 60, 70, 80),
                                      labels = c("59-","60-69","70+"))) 

table(dat$Heightgrp)

##########################################################
# {base}
# Row and column manipulation subset() --- extract records
##########################################################
######################## slide 16
head(dat)
### create a dataset redcording (Cat_Weight_Status,  Cat_Smoking_Status, logSystolic) 
###       for patients whose Height > 70
dat70 <- subset(dat, Height > 70, select = c(Cat_Weight_Status,  Cat_Smoking_Status, logSystolic))
head(dat70)

## the same as above since these three conlumns are consecutive
dat70 <- subset(dat, Height > 70, select = c(Cat_Weight_Status:logSystolic)) 
head(dat70)

## the same as above
dat70 <- subset(dat, Height > 70, select = Cat_Weight_Status:logSystolic)
head(dat70)

### create a dataset redcording (Weight_Status,  Smoking_Status) for all patients 
dat0 <- subset(dat, select = c(Cat_Weight_Status, Cat_Smoking_Status))
head(dat0)

### create a dataset for all female patients 
datF <- subset(dat, Sex == "Female")
head(datF)

### create a dataset removing columns Height and Weight ---- minus sign
datnew <- subset(dat, select = - c(Height, Weight))
head(datnew)
