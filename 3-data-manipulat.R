###################################################################	
### <October 4 2020> Min Lu
###
###  
###
###################################################################	
### 
### Topic 3 
### R section for BST 625
### Statistical Computing
### Fall 2020
### ------------------------------------------------------------
###  Min Lu, PhD                     m.lu6@umiami.edu
###                                  phone: 305-243-5473
###  Research Assistant Professor, Division of Biostatistics           
###  Clinical Research Building
###  1120 NW 14th Street, Room 1059
###  University of Miami, Miami FL 33136
###
###  -------------------------------------------------------------
###  THIS PROGRAM SHOULD NOT BE COPIED, USED, MODIFIED, OR 
###  DISSEMINATED IN ANY WAY WITHOUT SPECIFIC WRITTEN PERMISSION 
###  FROM THE AUTHOR.
###
###################################################################
head(mtcars)
# install.packages("tidyverse") # run this if you don't have dplyr
library(dplyr)
################################
# A %>% B serves as B(A,...)
################################
######################## slide 2
mtcars %>% head

mtcars %>% head(., )
mtcars %>% lm(mpg~cyl, data = .,)
mtcars %>% lm(mpg~., data = .,)

mtcars %>% head %>% rbind(., tail(mtcars))

##################################
# tibble is similar to data.frame
##################################
######################## slide 5

baliseTbl <- tibble(names = c("Raymond", "Lori", "Mary", "Andrew"),  
                    heightInInches = c(67, 62, 60.01, 68),  
                    isFemale = c(FALSE, TRUE, TRUE, FALSE))

names <- c("Raymond", "Lori", "Mary", "Andrew")
heightInInches <- c(67, 62, 60.01, 68)
isFemale <- c(FALSE, TRUE, TRUE, FALSE)
baliseNamedList2 <- list(Names = names, "Height in Inches" = heightInInches, "Is Female" = isFemale)

balises <- as_tibble(baliseNamedList2)
######################## slide 6
glimpse(baliseTbl ) 
############################################
# Row manipulation filter() ---pick records
############################################
source("DataInput_laryngectomy.R")
# laryngectomy <- read.csv("laryngectomy.csv")
# laryngectomy <- read_csv("laryngectomy.csv")
# laryngectomy <- read_excel("laryngectomy.xlsx") 
# laryngectomy <- read_excel("laryngectomy.xlsx")
# write.csv(laryngectomy, file = "laryngectomy.csv", row.names = FALSE)
# write_csv(x = laryngectomy, path = "laryngectomy.csv")
# write_excel_csv(x = laryngectomy, path = "laryngectomy.xlsx")
#is_tibble(laryngectomy)
######################## slide 9
laryngectomy %>%
  filter(death == 1)  # the people who died
laryngectomy %>%
  filter(is.na(pathology))  # people missing pathology
laryngectomy %>%
  filter(!is.na(pathology))  # people not missing pathology

laryngectomy %>%
  filter(complete.cases(.))
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
#########################################################
# Column manipulation select() --- select column/variable
#########################################################
######################## slide 15 head(laryngectomy)
laryngectomy$age # age at cancer
laryngectomy$gender #  sex of patient

select(laryngectomy, age, gender)

laryngectomy %>% select(age, gender)
laryngectomy %>% select(., age, gender)


laryngectomy %>% select(age, gender)
laryngectomy %>% select(., age, gender)

######################## slide 20
rm(tib, x, y, z) # remove objects in case they are in your environment
tib <- tibble(x = 1:3, y = 3:1)
select(tib, x)
select(tib, 1)
select(tib, y)
select(tib, 2)
select(tib, x, y)
select(tib, 1, 2)

select(tib, x, y, z)  # chokes because no z anywhere

z <- "y"
select(tib, z)  # Ok to give charater as variable name, so... keep your environment clean

z <-2
select(tib, z ,x)  # uses the z object outside of the tibble, so... keep your environment clean
######################## slide 21
complications <- laryngectomy %>% 
  select(complications:comp_2plus)

withoutComplicationVars <- laryngectomy %>%   
  select(-(complications:comp_2plus))
######################## slide 22
laryngectomy %>%
  select(ends_with("_fu"))
######################## slide 23
laryngectomy %>%
  select(death, recur)

laryngectomy %>%
  select(recur, death)

laryngectomy %>%
  select(recur, death, everything()) ## rearrange the column
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
###########################################################
# Column manipulation transmute() --- only keeps the mutation
###########################################################
######################## slide 26
laryngectomy %>%
  select(nk_dissection)  %>%
  mutate(hadND = 2 - nk_dissection)

laryngectomy %>%
  transmute(hadND = 2 - nk_dissection ) 
###########################################################
# Column manipulation rename() --- easily tweak a variable’s name 
###########################################################
######################## slide 27
laryngectomy %>%
  rename(sex = gender)  # from gender to sex

#####################################################################
# Data reduction summarize ( )  --- Make Rows/Records With Statistics
#####################################################################
###################### slide 29
laryngectomy %>%
  summarize(theMinFU = min(length_fu),
            theMeanFU = mean(length_fu),
            theMaxFU = max(length_fu))

#####################################################################
# Data reduction count ( )  
#####################################################################
###################### slide 30
library(forcats)
laryngectomy %>%
  select(nk_dissection) %>%
  mutate(hadND = 2 - nk_dissection ) %>%
  mutate(hadND = as.character(hadND)) %>%
  mutate(hadND = fct_recode(hadND, 
                            "No" = "0", 
                            "Yes" = "1")) %>%
  count(hadND) # count how many people had a neck dissection
#####################################################################
# Data reduction distinct() to See Unique Values  
#####################################################################
###################### slide 31
laryngectomy %>% distinct(gender)

laryngectomy %>% distinct(int_stg)

laryngectomy %>%
  mutate(isMale = 2 - gender ) %>%
  mutate(sex = as.character(isMale)) %>%
  mutate(sex = fct_recode(sex, 
                          "Female" = "0", 
                          "Male" = "1")) %>% 
  mutate(stage = fct_recode(as.character(int_stg), 
                            "T1" = "1", 
                            "T2" = "2",
                            "T3" = "3",
                            "T4" = "4",
                            "Unknown" = "5")) %>% 
  distinct(sex, stage) %>% 
  arrange(sex, stage)
#####################################################################
# Data reduction tally() to adds up the values
#####################################################################
###################### slide 32
laryngectomy %>%
  mutate(isMale = 2 - gender ) %>%
  mutate(sex = as.character(isMale)) %>%
  mutate(sex = fct_recode(sex, 
                          "Female" = "0", 
                          "Male" = "1")) -> sexVars 

sexVars %>% tally(gender)  # adds up 1s and 2s
sexVars %>% tally(isMale)  # adds up 0s and 1s
sexVars %>% tally(sex)  # can't sum up "Male" and "Female"
#####################################################################
# group_by() to adds up the values
#####################################################################
###################### slide 33
laryngectomy %>%
  group_by(gender)  # marks the grouping variable

laryngectomy %>%
  group_by(gender) %>%
  summarize(theMinFU = min(length_fu),
            theMeanFU = mean(length_fu),
            theMaxFU = max(length_fu))


#############################################################
#                              {base} R user
#############################################################
###################### slide 35
education <- read.csv("https://vincentarelbundock.github.io/Rdatasets/csv/robustbase/education.csv")
head(education)
colnames(education)  <-  c("X",
                           "State",
                           "Region",
                           "Urban.Population",
                           "Per.Capita.Income",
                           "Minor.Population",
                           "Education.Expenditures")
head(education)
###################### slide 36
region <- education$Region
ed_exp0 <- education[, c("State","Region","Urban.Population")]
ed_exp1 <- education[c(10:21),c(2,6:7)]
ed_exp2 <- education[-c(1:9,22:50),-c(1,3:5)]

###################### slide 37
ed_exp3 <- education[which(education$Region == 2), 
                     names(education) %in% c("State","Minor.Population","Education.Expenditures")]

ed_exp3 <- education[which(education$Region == 2), 
                     match(c("State","Minor.Population","Education.Expenditures"), 
                           names(education))]



ed_exp4 <- subset(education, Region == 2, 
                  select = c("State","Minor.Population","Education.Expenditures"))

## you can also do

education[education$Region == 2, 
          c("State","Minor.Population","Education.Expenditures")]



education[(education$Region == 2)&(education$Minor.Population>320), 
          c("State","Minor.Population","Education.Expenditures")]


