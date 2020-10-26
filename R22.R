######################################################10/26/2020
library(tidyverse)   
#install.packages("tidyverse")

laryngectomy <- read_csv("laryngectomy.csv")

laryngectomy %>%
  select(ends_with("_fu"))

laryngectomy %>% select(contains("_"))

laryngectomy %>%
  select(death, recur)

laryngectomy %>%
  select(recur, death)

laryngectomy %>%
  select(recur, death, everything())

###############################
laryngectomy %>%
  select(length_fu, everything()) %>%
  arrange(length_fu)  # shortest follow-up to shortest

laryngectomy %>%
  select(length_fu, everything()) %>%
  arrange(desc(length_fu))  # longest follow-up to shortest


laryngectomy %>%
  select(recur_site, everything()) %>%
  arrange(desc(recur_site)) 
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

########################################################
library(readr)
dat <- read_csv("score_data999.csv", 
                            col_types = cols(score1 = col_integer(), 
                             score2 = col_integer(), score3 = col_integer(), 
                             gender = col_factor(levels = c("m", "f"))))

dat[dat == 999] <- NA
