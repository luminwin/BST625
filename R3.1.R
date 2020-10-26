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
  filter(age == 54)  

laryng.ag54 <- laryngectomy %>%
  filter(age == 54) 

filter(laryngectomy, age == 54)


laryngectomy %>%
  filter(death == 1)  # the people who died
colnames(laryngectomy)
laryngectomy$death

laryngectomy %>%
  filter(is.na(pathology))  # people missing pathology

laryngectomy %>%
  filter(!is.na(pathology))  # people not missing pathology

laryngectomy %>%
  filter(complete.cases(.))


laryngectomy %>%
  arrange(age) 

laryngectomy %>%
  arrange(desc(age)) 

#########################################################
# Column manipulation select() --- select column/variable
#########################################################
######################## slide 15
laryngectomy$age # age at cancer
laryngectomy$gender #  sex of patient

select(laryngectomy, age, gender)

laryngectomy %>% select(age, gender)
laryngectomy %>% select(., age, gender)


laryngectomy %>% select(age, gender) 
laryngectomy %>% select(., age, gender)

rm(tib, x, y, z) # remove objects in case they are in your environment
tib <- tibble(x = 1:3, y = 3:1)
select(tib, x)
select(tib, 1)
tib[, 1]
select(tib, y)
tib[, "y"]
select(tib, 2)
select(tib, x, y)
select(tib, 1, 2)

select(tib, x, y, z)  # chokes because no z anywhere

z <- 2
select(tib, z ,x)  # if z is not in your tibble, R uses the z object outside of the tibble
select(tib, 2 ,x) 

tib[, "z"] # {base} R subsetting matrix/data.frame/tibble
(tib[, "x"])[2,] 
tib[2, "x"]

tib[, c("y","x")] 
tib[, which(colnames(tib) == "y")]
######################## slide 21
complications <- laryngectomy %>% 
  select(complications:comp_2plus)

First4 <- laryngectomy %>% select(age:trt_mod)
laryngectomy[, 1:4]

withoutComplicationVars <- laryngectomy %>%   
  select(-(complications:comp_2plus))
laryngectomy[, -c(1:4)]

colnames(laryngectomy)
colnames(withoutComplicationVars)

######################## slide 22
laryngectomy %>%
  select(ends_with("_fu"))

######################################################10/26/2020
laryngectomy <- read_excel("laryngectomy.xls")

library(tidyverse)   
install.packages("tidyverse")
laryngectomy %>%
    select(ends_with("_fu"))
