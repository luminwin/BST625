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
colnames(education) <- c("ID",
  "State",
  "Region",
  "Urban.Population",
  "Per.Capita.Income",
  "Minor.Population",
  "Education.Expenditures")

head(education)

######################## slide 14
########## transform values
hist(dat$Systolic)

## create a new column/variable called logSystolic
dat <- transform(dat, 
                 logSystolic = log(Systolic),
                 sqrtSystolic = sqrt(Systolic))

hist(dat$logSystolic)

### we could keep the name as the same
#### use dat.sortH as an example
hist(dat.sortH$systolic)
dat.sortH <- transform(dat.sortH, systolic = log(systolic))
hist(dat.sortH$systolic)

######################## slide 15
########## transform values
dat$Sex
ifelse(dat$Sex == "Male", 1, 0)
dat <- transform(dat, isMale = ifelse(Sex == "Male", 1, 0))

dat <- transform(dat, isMale = ifelse(Sex == "Male", "Y", "N"))
head(dat)
## we also learnt factor in data structure
dat <- transform(dat, isMale = factor(Sex, 
                                      levels = c("Female", "Male"),
                                      labels = c(0,1)) )



x <- cut(dat$Height, breaks = 4)

pie(table(x))
table(x)
## cut can also create a factor
dat <- transform(dat, Heightgrp = cut(Height, 
                                      breaks = 4)) ## automatically create 4 groups

dat$Heightgrp
table(dat$Heightgrp)

dat$Heightgrp <- cut(dat$Height, breaks = c(0, 60, 65, 70, 80),
                     labels = c("59-","60-64", "65-79","70+"))

table(dat$Heightgrp)


######################## slide 16
head(dat)
### create a dataset redcording (Cat_Weight_Status,  Cat_Smoking_Status, logSystolic) 
###       for patients whose Height > 70
dat70 <- subset(dat, Height > 70, 
                select = c(Cat_Weight_Status,  
                           Cat_Smoking_Status, 
                           logSystolic))
head(dat70)

## the same as above since these three conlumns are consecutive
dat70 <- subset(dat, Height > 70, select = c(Height, 
                                             Cat_Chol_Status:Cat_Smoking_Status)) 
head(dat70)

## the same as above
dat70 <- subset(dat, Sex == "Female", select = Cat_Weight_Status:logSystolic)
head(dat70)

datnew <- subset(dat, select = - c(Height, Weight))
head(datnew)


startsWith(colnames(dat), "Cat_")

datCat <- subset(dat, select = startsWith(colnames(dat), "Cat_"))
head(datCat)

### create a dataset containing columns whose names end with "_Status"

datStat <- subset(dat, select = endsWith(colnames(dat), "_Status"))
head(datStat)


grepl("Weight", colnames(dat)) ## Pattern Matching for a character vector containing "Weight"

### create a dataset containing columns whose names contain "Weight"

datWeight <- subset(dat, select = grepl("Weight", colnames(dat)))
head(datWeight)

if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)
HEART1 <- read.csv("C:/Users/mlu6/Dropbox/R book/GitR/BST625/data/HEART.csv")
HEART2 <- read_csv("C:/Users/mlu6/Dropbox/R book/GitR/BST625/data/HEART.csv")


myTibble <- tibble(Names = c("Min", "Robert", "Mary", "Hemant"), 
                   Height = c(165, 185, 170, 180), 
                   IsMale = c(FALSE, TRUE, FALSE, TRUE))
myTibble

names <- c("Min", "Robert", "Mary", "Hemant")
heightInCM <- c(165, 185, 170, 180)
isMale <- c(FALSE, TRUE, FALSE, TRUE)
mylist <- list(Name = names, Height = heightInCM, IsMale = isMale)

myTibble <- as_tibble(mylist)
myTibble

myTibble <- tribble(
  ~name,    ~gender,   ~runs,
  "Max",    "male",       10,
  "Sandra", "female",      1,
  "Susan",  "female",      4
)
myTibble
######################## slide 21
glimpse(myTibble) 