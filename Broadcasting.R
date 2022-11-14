###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################


HEART1 <- read.csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {base}

if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)

HEART2 <- read_csv("C:/Users/m.lu/Downloads/BST625/R3/HEART.csv") ## {tidyverse}


### check how Base R (HEART1) and tidyverse (HEART2) display data differently
HEART1

HEART2

dat <- HEART2

dat %>%
  select(Sex, Height) 

dat %>%
  mutate(logHeight = log(Height) ,
         sqrtHeight = sqrt(Height) )

### combine the two steps

dat %>%
  select(Sex, Height)  %>%
  mutate(logHeight = log(Height) ,
         sqrtHeight = sqrt(Height) )
