# install.packages("tidyverse")
library(dplyr) 
head(mtcars)
mtcars %>% head
mtcars %>% head(., )

##################################
# tibble is similar to data.frame
##################################
######################## slide 5
balisedf<- data.frame(names = c("Raymond", "Lori", "Mary", "Andrew"),  
                    heightInInches = c(67, 62, 60.01, 68),  
                    isFemale = c(FALSE, TRUE, TRUE, FALSE))

baliseTbl <- tibble(names = c("Raymond", "Lori", "Mary", "Andrew"),  
                    heightInInches = c(67, 62, 60.01, 68),  
                    isFemale = c(FALSE, TRUE, TRUE, FALSE))

names <- c("Raymond", "Lori", "Mary", "Andrew")
heightInInches <- c(67, 62, 60.01, 68)
isFemale <- c(FALSE, TRUE, TRUE, FALSE)
baliseNamedList2 <- list(Names = names, "Height in Inches" = heightInInches, "Is Female" = isFemale)
as.data.frame(baliseNamedList2)
balises <- as_tibble(baliseNamedList2)
######################## slide 6
glimpse(baliseTbl ) 

source("~/Dropbox/R book/GitR/BST625/DataInput_laryngectomy.R")
laryngectomy <- read.csv("~/Dropbox/R book/GitR/BST625/laryngectomy.csv")
head(laryngectomy)
laryngectomy <- read_csv("laryngectomy.csv")

############################################
# Row manipulation filter() ---pick records
############################################
######################## slide 9
laryngectomy %>%
  filter(age == 1)  # the people who died
laryngectomy %>%
  filter(is.na(pathology))  # people missing pathology
laryngectomy %>%
  filter(!is.na(pathology))  # people not missing pathology

