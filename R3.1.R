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
# install.packages("tidyverse")
laryngectomy %>%
    select(ends_with("_fu"))

############################################
# Row manipulation arrange() ---sort records
############################################
######################## slide 15
laryngectomy %>%
  select(length_fu, everything()) %>%
  arrange(length_fu)  # shortest follow-up to shortest

laryngectomy %>%
  select(length_fu, everything()) %>%
  arrange(desc(length_fu))  # longest follow-up to shortest

laryngectomy %>%
  select(length_fu, everything()) %>%
  arrange(gender, desc(length_fu))  # sort by ascending sex then descending follow-up 

###########################################################
# Column manipulation mutate() --- add new column/variable(s)
###########################################################
######################## slide 24
laryngectomy %>%  # start with everybody with a laryngectomy then     
  select(nk_dissection)  %>%  # keep only one variable then  
  mutate(hadND = 2 - nk_dissection )  # add a had neck dissection indicator

laryngectomy %>%
  select(nk_dissection, pec_flap)  %>%
  mutate(hadND = 2 - nk_dissection,
         hadPec = 2 - pec_flap)

######################## slide 25
laryngectomy %>%
  select(nk_dissection)  %>%
  mutate(hadND = 2 - nk_dissection ) %>%
  mutate(hadND = as.character(hadND))  # convert the number to text 
# The forcats package has many functions for manipulating categorical variables (factors)  
# install.packages("forcats")
library(forcats)
laryngectomy %>%
  select(nk_dissection) %>%
  mutate(hadND = 2 - nk_dissection ) %>%
  mutate(hadND = as.character(hadND)) %>%
  mutate(hadND = fct_recode(hadND, 
                            "No" = "0", 
                            "Yes" = "1"))

#####################################################################
# Data reduction summarize ( )  --- Make Rows/Records With Statistics
#####################################################################
###################### slide 29
x <- laryngectomy$nk_dissection
## dim() is to tell you how many rows and how many columns in r your data
dim(x)  ## this does not work since x is a vector 
length(x) ## this works

y <- laryngectomy %>% select(nk_dissection)
dim(y)  ## this works since y is a tibble/data.frame
length(y) ## this works, but sometimes it does not work for single row or single column vector

laryngectomy %>% filter(gender == 1 ) %>% select(length_fu) %>% head ## this works since head() function can deal with tibble/data.frame

laryngectomy %>% filter(gender == 1 ) %>% select(length_fu) %>% lm(length_fu~., data = .) ## this works since "data" argument in lm() handles tibble/data.frame

laryngectomy %>% filter(gender == 1 ) %>% select(length_fu) %>% mean(., na.rm = TRUE) ## this does not work since mean() function only handles vector
## I hope in the future, tidyverse can improve this

## so we have to put some functions from {base} inside of summarize()

laryngectomy %>%
  summarize(theMinFU = min(length_fu),
            theMeanFU = mean(length_fu),
            theMaxFU = max(length_fu))

