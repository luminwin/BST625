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