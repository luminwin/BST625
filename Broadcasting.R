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

##########################################
#
#    Tidyverse
#
##########################################

dat %>%
  filter(Status == "Alive") %>%
  select(Cholesterol, Chol_Status)  %>%
  mutate(NewChol = if_else(Cholesterol > 290, "off-the-chart", Chol_Status)) 

##########################################
#
#    base
#
##########################################
dat_Chol <- subset(dat, filter = Status == "Alive", 
                   select = c(Cholesterol, Cat_Chol_Status))
dat_Chol <- transform(dat_Chol, NewChol = ifelse(Cholesterol > 290, "off-the-chart", Cat_Chol_Status))

##########################################
#
#    other ways from Tidyverse
#
##########################################

dat %>%
  filter(Status == "Alive") %>%
  select(Cholesterol, Chol_Status) %>%
  mutate(NewChol = case_when( 
    Cholesterol > 290 ~ "off-the-chart",
    TRUE ~ Chol_Status
  ))

## another way to do that
dat %>%
  filter(Status == "Alive") %>%
  select(Cholesterol, Chol_Status) %>%
  mutate(NewChol = case_when( 
    Chol_Status == "Borderline" ~ "Borderline",
    Chol_Status == "Desirable" ~ "Desirable",
    Cholesterol > 290 ~ "off-the-chart",
    TRUE ~ "High"
  ))

dat %>%
  select(DeathCause)

dat %>%
  mutate( DeathCauseC = case_when(  DeathCause == "Cerebral Vascular Disease" ~ "C1",
                                    DeathCause == "Coronary Heart Disease" ~ "C2",
                                    DeathCause == "Cancer" ~ "C3",
                                    DeathCause == "Other" ~ "C4",
                                    DeathCause == "Unknown" ~ "C5"
  )) %>%
  select(DeathCause, DeathCauseC)

dat %>%
  mutate( DeathCauseC = fct_recode( DeathCause,
                                    "C1" = "Cerebral Vascular Disease",
                                    "C2" = "Coronary Heart Disease",
                                    "C3" = "Cancer",
                                    "C4" = "Other",
                                    "C5" = "Unknown"
  )) %>%
  select(DeathCause, DeathCauseC)

head(mtcars)
summary(mtcars$drat, digits = 2)
table(mtcars$cyl)
table(mtcars$cyl, mtcars$am)

unique(mtcars$cyl)

############################################
# {base}
# data summary aggregate() 
############################################
######################## slide 9

aggregate(mpg ~ cyl, data = mtcars, mean)
aggregate(mpg ~ cyl, data = mtcars, sd)
aggregate(mpg ~ cyl, data = mtcars, max)

lm(mpg ~ cyl, data = mtcars)
summary(lm(mpg ~ cyl, data = mtcars))

aggregate(cbind(mpg, disp) ~ cyl, data = mtcars, mean)

aggregate(mpg ~ cyl + vs, data = mtcars, mean)

aggregate(cbind(mpg, disp) ~ cyl + vs, data = mtcars, mean)


############################################
# {base}
# Transform wide <---> longe format
############################################
######################## slide 10

dat <- read.csv("https://luminwin.github.io/BST625/score_data999.csv")
dat[dat == 999] <- NA

dat_long <- reshape(dat, idvar = "name", 
                    varying = c("score1","score2","score3"), 
                    # or you can specify varying = list(2:4) to refer the 2nd to the 4th columns
                    v.names = "score", direction = "long")
## same as above

dat_long <- reshape(dat, idvar = "name", 
                    varying = paste("score", 1:3, sep = ""), 
                    # or you can specify varying = list(2:4) to refer the 2nd to the 4th columns
                    v.names = "score", direction = "long")

paste("score", 1:3, sep = "_")

dat_wide <- reshape(dat_long, v.names = "score", idvar = "name",
                     sep = "_",  # you can use this to customerize your names
                    # instead of score.1, you have score_1
                    # you can write sep = "",
                    timevar = "time", direction = "wide")


######################## slide 11
# {base}
## merge in rows
############ I fake two data sets to merge
dat_top <- head(dat)
dat_bot <- tail(dat)
rbind(dat_top, dat_bot)
## r is very smart, even the names ordered differently
dat_bot <- dat_bot[, 5:1]
rbind(dat_top, dat_bot)

############################################
# {base}
# merge two datasets
############################################
######################## slide 12

a <- data.frame(X1 = LETTERS[1:3],
                X2 = 1:3)
b <- data.frame(X1 = c("A", "B", "D"),
                X3 = c("T", "F", "T"))

# left_join
merge(x = a, y = b, by = "X1", all.x = TRUE)

merge(a, b, by = "X1", all.x = TRUE)

# right_join
merge(a,b,by = "X1", all.y = TRUE)

# the same as above
merge(b,a,by = "X1", all.x = TRUE)

# inner_join
merge(a,b,by = "X1")   # the same as  merge(a,b,by = "X1", all.x = FALSE, all.y = FALSE)

# full_join
merge(a,b,by = "X1", all = TRUE)

######################## slide 13

## merge in columns
## input two datasets
authors <- data.frame(
  name = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  retired = c("yes", rep("no", 4)))
books <- data.frame(
  name = c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA))

merge(authors, books, by = "name")

######################## slide 14
########### suppose "name" is named as "surname" in authors
authors <- data.frame(
  surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  retired = c("yes", rep("no", 4)))
books <- data.frame(
  name = c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA))


merge(x = authors, y = books, by.x="surname", by.y="name")
merge(books, authors, by.x="name", by.y="surname")


############################################
# {tidyverse}
# data summary
############################################

if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)

######################## slide 17
dat <- read_csv("https://luminwin.github.io/BST625/HEART.csv")

dat %>% distinct(Status)

dat %>% distinct(DeathCause)
