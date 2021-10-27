###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

names <- c("Min", "Robert", "Mary", "Hemant")
heightInCM <- c(165, 185, 170, 180)
isMale <- c(FALSE, TRUE, FALSE, TRUE)
mydata.frame <- data.frame(Name = names, Height = heightInCM, IsMale = isMale)


if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)

myTibble <- as_tibble(mydata.frame)


head(mtcars)
head(mtcars, 3)

as_tibble(mtcars) %>% head(., )

mtcars %>% head()  ## the same as above using %>% with . for the first argument

mtcars %>% head ## the same as above where . is not needed since it is the first argument

mtcars %>% head(., 3)  ## only display the first three rows

mtcars %>% head(3) ## the same as above where . is not needed since it is the first argument

## the pipe operator brings what in its left to what in its right as the first argument/input



mtcars %>% lm(mpg~cyl, data = .,)

lm(mpg~cyl, data = mtcars)

mtcars %>% head(20) %>% tail(3)

library(tidyverse)
dat <- read_csv("https://luminwin.github.io/BST625/HEART.csv") ## tibble   (read.csv gives data.frame)



filter(dat, Status == "Dead") 

dat %>%
  filter(Status == "Dead")  # the people who died

dat %>%
  filter(is.na(AgeCHDdiag)) # people missing AgeCHDdiag --- coronary heart disease (CHD)
dat %>%
  filter(!is.na(AgeCHDdiag)) # people not missing AgeCHDdiag

datcomplete <- dat %>%
  filter(complete.cases(.)) # complete cases only


dat %>%
  arrange(Height)  # sort by increasing order of Height

dat %>%
  arrange(desc(Height))  # sort by decreasing order of Height

dat %>%
  arrange(AgeAtStart, desc(Height))  # sort by ascending AgeAtStart then descending Height 




subset(dat, Status == "Dead", 
            select = c(AgeCHDdiag, Sex))  ## base R

dat %>%
  filter(Status == "Dead") %>%  ## tidyverse
  select(AgeCHDdiag, Sex) 

dat %>% select(AgeCHDdiag, Sex)    ## the same as above where . is not needed since it is the first argument
dat %>% select(Sex, AgeCHDdiag)

dat %>%
  select(AgeCHDdiag, everything()) 


colnames(dat)
dat %>%
  select(ends_with("_Status"))

dat %>%
  select(contains("tolic"))

dat %>%
  select(starts_with("Age"))

withoutweightVars <- dat %>%   
  select(-c(Weight, Weight_Status))

withoutweightVars <- dat %>%   
  select(-Weight, -Weight_Status)

dat$AgeCHDdiag # age at CHD diagnosis  ## base R
dat$Sex #  sex of patient      ## base R

sex <- 1

# the column name is upper case Sex, but you make a mistake
# R uses the sex object outside of the tibble, so... keep your environment clean
dat %>% select(sex) ## this won't give you error

dat$sex ## this gives you error, so dollar sign $ from Base R is safer
dat[, "sex"]

dat %>%
  select(ends_with("_Status"), 
         starts_with("Age"), 
         everything()) ## rearrange the column

######################## slide 38
dat %>%
  rename(Gender = Sex)  # from sex to gender

dat %>%
  rename(Gender = Sex,
         Mortality = Status)  # from sex to gender


dat %>%  
  mutate(logHeight = log(Height) ) %>% # add a new variable
  select(logHeight, everything())


dat %>%  
  select(Sex, Height) %>%
  mutate(logHeight = log(Height) )  # add a new variable


dat %>%
  select(Sex, Height)  %>%
  mutate(logHeight = log(Height) ,
         sqrtHeight = sqrt(Height) )

dat %>%
  select(Sex, Height)  %>%
  mutate(logHeight = log(Height)) %>% 
  mutate(sqrtHeight = sqrt(Height) )

dat %>%
  select(Height)  %>%
  mutate(Heightgrp = case_when( Height < 60 ~ "59-", 
                                (60 <= Height)&(Height < 70) ~ "60-69",
                                TRUE ~ "70+"))




dat %>%
  select(Height)  %>%
  transmute(Heightgrp = case_when( Height < 60 ~ "59-", 
                                   (60 <= Height)&(Height < 70) ~ "60-69",
                                   TRUE ~ "70+"))
dat %>%
  transmute(Gender = Sex)


dat %>%
  select(Sex)  %>%
  mutate(isMale = (Sex == "Male") ) %>%
  mutate(isMale = as.numeric(isMale)) %>%  
  mutate(isMale = as.character(isMale))   # convert the number to text 

dat %>%
  select(Sex)  %>%
  mutate(isMale = factor(Sex, 
                         levels = c("Female", "Male"),
                         labels = c(0,1)) )   # convert the text to factor

dat %>%
  select(Sex)  %>%
  mutate(isMale = if_else(Sex == "Male", 1, 0)) 

dat %>%
  select(Sex)  %>%
  mutate(isMale = case_when(Sex == "Male" ~ 1, 
                            Sex == "Female" ~ 0)) 

##########################################
#
#    In-class Exercise
#
##########################################

##### select variables Cholesterol and Chol_Status for subjects whose Status is
## Alive and create a new variable to recode "High" Chol_Status as "off-the-chart"
## for subjects whose Cholesterol is greater than 290

select() 
filter()
mutate(case_when())

as.factor(dat$Chol_Status)

dat %>%
  filter(Status == "Alive") %>%
  select(Cholesterol, Chol_Status) %>%
  mutate(NewChol = case_when( 
    Chol_Status == ""
    Cholesterol > 290 ~ "off-the-chart",
    ))

