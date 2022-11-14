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


############ HW5
## Step 1
datt <- read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
datt <- pivot_wider(datt, names_from = time, 
                    values_from = pain)

## Step 2
datt <- datt %>% 
  mutate(
    age_grp = 
      case_when(
        age < 25 ~ "24-", 
        (25 <= age)&(age < 35) ~ "25-34", 
        (35 <= age)&(age < 45) ~ "35-44", 
        (45 <= age)&(age < 55) ~ "45-54", 
        (55 <= age)&(age < 65) ~ "55-64", 
        (65 <= age)&(age < 75) ~ "65-74", 
        TRUE ~ "75+", 
      ), 
    ct_grp = 
      case_when(
        trt == 1 ~ "control", 
        TRUE ~ "treatment"
      )
  )
## Step 3
datt %>% 
  group_by(age_grp, ct_grp) %>% 
  summarise(n = n(), .groups = "drop") %>% 
  pivot_wider(names_from = ct_grp, values_from = n) 

