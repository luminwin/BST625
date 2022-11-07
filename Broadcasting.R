###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################
if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)

HEART1 <- read.csv("C:/Users/mlu6/Dropbox/R book/HEART.csv") ## {base}

HEART2 <- read_csv("C:/Users/mlu6/Dropbox/R book/HEART.csv") ## {tidyverse}


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

mtcars %>% head %>% rbind(., tail(mtcars))


############################################
# {tidyverse}
# Row manipulation filter() ---pick records
############################################
dat <- read_csv("https://luminwin.github.io/BST625/HEART.csv")

dat %>%
  select(ends_with("_Status"), starts_with("Age"), everything()) ## rearrange the column

