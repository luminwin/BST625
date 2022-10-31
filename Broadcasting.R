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
dat70 <- subset(dat, subset = Height > 70, 
                     select = c(Cat_Weight_Status,  Cat_Smoking_Status, logSystolic))

dat70 <- subset(dat, Height > 70, 
                     c(Cat_Weight_Status,  Cat_Smoking_Status, logSystolic))


head(dat70)
1:7
c(1:7)

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

##########################################
#
#    In-class Exercise
#
##########################################

#  can you choose "State","Minor.Population","Education.Expenditures" 
#  for Region 2 states from the education dataset and save the result in the
#  ed_exp4 dataset


ed_exp4 <- subset(education, Region == 2, 
                           select = c("State","Minor.Population","Education.Expenditures"))


# The subset() function takes 3 arguments: the data frame you want subsetted, the rows 
# corresponding to the condition by which you want it subsetted, and the columns 
# you want returned. In our case, we take a subset of education where "Region" is 
# equal to 2 and then we select the "State," "Minor.Population," and "Education.Expenditure" columns.


##########################################
#
#    In-class Exercise
#
##########################################

##### select variables Cholesterol and Cat_Chol_Status from the dat dataset for subjects whose Status is
## Alive and create a new variable  to recode "High" Cat_Chol_Status as "off-the-chart"
## for subjects whose Cholesterol is greater than 290
## save the result in the dat_Chol dataset

dat_Chol <- subset(dat, Cat_Status == "Alive", 
                  select = c(Cholesterol, Cat_Chol_Status))

## another way to do it
dat_Chol <- subset(dat, Cat_Status == "Alive")
dat_Chol <- subset(dat_Chol, select = c(Cholesterol, Cat_Chol_Status))

################ 
dat_Chol <- subset(dat, Cat_Status == "Alive", 
                   select = c(Cholesterol, Cat_Chol_Status))

dat_Chol <- transform(dat_Chol, newChol = ifelse(Cholesterol > 290, "off-the-chart", Cat_Chol_Status))


## another crazy way to do it
dat_Chol <- transform(subset(dat, Cat_Status == "Alive", 
                             select = c(Cholesterol, Cat_Chol_Status)), 
                      newChol = ifelse(Cholesterol > 290, "off-the-chart", Cat_Chol_Status))

######################## slide 17

### create a dataset containing columns whose names start with "Cat_"

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

##############################################
#
# reading in .csv file to R by point and click
#
##############################################

HEART1 <- read.csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {base}

if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)

HEART2 <- read_csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {tidyverse}


### check how Base R (HEART1) and tidyverse (HEART2) display data differently
head(HEART1)

HEART2

library(dplyr)  

######################## slide 20

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


################################
# {tidyverse}
# A %>% B serves as B(A,...)
################################
######################## slide 22


head(mtcars)

mtcars %>% head(., )  ## the same as above using %>% with . for the first argument

mtcars %>% head ## the same as above where . is not needed since it is the first argument

mtcars %>% head(., 3)  ## only display the first three rows

mtcars %>% head(3) ## the same as above where . is not needed since it is the first argument
## the pipe operator %>% brings what in its left to what in its right as the first argument/input


mtcars %>% lm(mpg~cyl, data = .,)

mtcars %>% head %>% rbind(., tail(mtcars))

dat <- read_csv("https://luminwin.github.io/BST625/HEART.csv")
######################## slide 26
dat %>%
  filter(Status == "Dead")  # the people who died
dat %>%
  filter(is.na(AgeCHDdiag)) # people missing AgeCHDdiag --- coronary heart disease (CHD)
dat %>%
  filter(!is.na(AgeCHDdiag)) # people not missing AgeCHDdiag

dat %>%
  filter(complete.cases(.)) # complete cases only
