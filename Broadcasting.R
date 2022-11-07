###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################
if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
# install.packages("tidyverse")
library(tidyverse)

HEART1 <- read.csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {base}

HEART2 <- read_csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {tidyverse}


### check how Base R (HEART1) and tidyverse (HEART2) display data differently
head(HEART1)

head(HEART2)

head(mtcars)

mtcars %>% head(., )  ## the same as above using %>% with . for the first argument

mtcars %>% head ## the same as above where . is not needed since it is the first argument

mtcars %>% head(., 3)  ## only display the first three rows

mtcars %>% head(3) ## the same as above where . is not needed since it is the first argument
## the pipe operator %>% brings what in its left to what in its right as the first argument/input


mtcars %>% lm(mpg~cyl, data = .,)

lm(mpg~cyl, data = mtcars)

mtcars %>% head() %>% rbind(., tail(mtcars))


############################################
# {tidyverse}
# Row manipulation filter() ---pick records
############################################
dat <- read_csv("https://luminwin.github.io/BST625/HEART.csv")

dat %>%
  select(ends_with("_Status"))

dat %>%
  select(ends_with("_Status"), 
         starts_with("Age"), 
         everything()) ## rearrange the column

###########################################################
# {tidyverse}
# Column manipulation rename() --- change a variable's name 
###########################################################

######################## slide 38
dat %>%
  rename(Gender = Sex)  # from sex to gender

dat %>%
  rename(Gender = Sex,
         Mortality = Status)

###########################################################
# {tidyverse}
# Column manipulation mutate() --- add new column/variable(s)
###########################################################
######################## slide 39
dat %>%  # start with everybody then     
  select(Sex, Height)  %>%  # keep only one variable then  
  mutate(logHeight = log(Height) )  # add a new variable

dat %>%
  select(Sex, Height)  %>%
  mutate(logHeight = log(Height) ,
         sqrtHeight = sqrt(Height) )

######################## slide 40
dat %>%
  select(Sex)  %>%
  mutate(isMale = (Sex == "Male") ) %>%
  mutate(isMale = as.numeric(isMale)) %>%  
  mutate(isMale = as.character(isMale))   # convert the number to text 

dat %>%
  select(Sex)  %>%
  mutate(isMale = factor(Sex, 
                         levels = c("Female", "Male"),
                         labels = c("female","male")) )   # convert the text to factor


######################## slide 41
dat %>%
  select(Sex)  %>%
  mutate(isMale = if_else(Sex == "Male", 1, 0))   # the same as as.numeric((Sex == "Male"))

dat %>%
  select(Sex)  %>%
  mutate(isMale = case_when(Sex == "Male" ~ 1, 
                            Sex == "Female" ~ 0)) # the same as above

dat %>%
  select(Height)  %>%
  mutate(Heightgrp = case_when( Height < 60 ~ "59-", 
                                (60 <= Height)&(Height < 70) ~ "60-69",
                                TRUE ~ "70+"))

range(dat$Height, na.rm = TRUE)

###########################################################
# {tidyverse}
# Column manipulation transmute() --- only keeps the mutation
###########################################################
######################## slide 42
dat %>%
  select(Sex)  %>%
  mutate(isMale = (Sex == "Male") )  %>%
  select(isMale)

dat %>%
  transmute(isMale = (Sex == "Male"))  ## the same as above

##########################################
#
#    In-class Exercise
#
##########################################

##### select variables Cholesterol and Chol_Status for subjects whose Status is
## Alive and create a new variable NewChol to recode "High" Chol_Status as "off-the-chart"
## for subjects whose Cholesterol is greater than 290

filter()
select()
mutate()

dat %>%
  filter(Status == "Dead")