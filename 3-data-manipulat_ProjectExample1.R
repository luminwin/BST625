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

library(tidyverse) ## you can check the warning sign to foresee
                   ## the potential risk in your environment
df <- read_csv("http://bit.ly/data_esoph", col_names = FALSE)

colnames(df) <- (c("age", "alc", "tob", "cc"))
df <- df %>% 
  mutate(
    age_grp = 
      case_when(
        age == 1 ~ "25-34", 
        age == 2 ~ "35-44", 
        age == 3 ~ "45-54", 
        age == 4 ~ "55-64", 
        age == 5 ~ "65-74", 
        TRUE ~ "75+", 
      )
  )

df <- df %>% 
  mutate(
    alc_grp = 
      case_when(
        alc == 1 ~  "0-39", 
        alc == 2 ~ "40-79",  
        alc == 3 ~ "80-119",  
        TRUE ~ "120+" 
      )
  )
df <- df %>% 
  mutate(
    tob_grp = 
      case_when(
        tob == 1 ~  "0- 9", 
        tob == 2 ~ "10-19", 
        tob == 3 ~ "20-29", 
        TRUE ~ "30+" 
      )
  )

df <- df %>% 
  mutate(
    cc_grp = 
      case_when(
        cc == 0 ~ "control", 
        TRUE ~ "case"
      )
  )
df <- df %>% 
  select(age_grp:cc_grp)

df %>% 
  mutate(age_grp = factor(age_grp, levels = c("25-34",
                                              "35-44"   ,
                                              "45-54"   ,
                                              "55-64"   ,
                                              "65-74"   ,
                                              "75"
  )))

df %>% 
  mutate(alc_grp = factor(alc_grp, levels = c("0-39",
                                              "40-79",
                                              "80-119",
                                              "120"
  )))

df %>% 
  mutate(tob_grp = factor(tob_grp, levels = c("0- 9",
                                              "10-19",
                                              "20-29",
                                              "30+"
  )))
####################################################################
################# tidyr for reshaping, which we will learn next week
####################################################################
df %>% 
  group_by(age_grp, cc_grp) %>% 
  summarise(n = n()) %>% 
  spread(cc_grp, n)

options(digits = 3)
df %>%
  count(age_grp, cc_grp) %>%
  group_by(cc_grp) %>%
  mutate(prop = n / sum(n)) %>%
  select(-n) %>%
  spread(cc_grp, prop, fill = 0) # fill is for missing value

################## some {base} function
table(df$age_grp, df$cc_grp)
addmargins(table(df$age_grp, df$cc_grp))

options(digits = 2) # limit the digits to two decimals
prop.table(table(df$age_grp, df$cc_grp))*100



