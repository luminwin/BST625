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

mtcars %>% head(., )

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
