###################################################################	
### <October 25 2020> Min Lu
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


#############################################################
#                              {tidyverse} R user
#############################################################
# install.packages("tidyverse") # run this if you don't have dplyr
library(tidyverse)
################################
# wide -- long format exchange
################################
######################## slide 10
dat <- read.csv("C:/Users/mlu6/Dropbox/R book/GitR/BST625/score_data999.csv")
dat[dat == 999] <- NA

data_long <- gather(dat, key = time, value = score, score1:score3, factor_key=TRUE)
data_wide <- spread(data_long, key = time, value = score)

################################
# merge two datasets
################################
######################## slide 12
a <- tibble(X1 = LETTERS[1:3],
            X2 = 1:3)
b <- tibble(X1 = c("A", "B", "D"),
            X3 = c("T", "F", "T"))

left_join(a, b, by = "X1")
a %>% left_join(b, by = "X1")

right_join(a, b, by = "X1")

inner_join(a, b, by = "X1")

full_join(a, b, by = "X1")

#############################################################
#                              {base} R user
#############################################################
## detach packages that you have loaded
detach("package:tidyr","package:forcats") 

## detach all packages except {base}
sapply(paste('package:',names(sessionInfo()$otherPkgs),sep=""), 
       detach,
       character.only=TRUE)


######################## slide 13
dat <- read.csv("C:/Users/mlu6/Dropbox/R book/GitR/BST625/score_data999.csv")
dat[dat == 999] <- NA

dat_long <- reshape(dat, idvar = "name", 
                    varying = paste("score", 1:3, sep = ""), 
                    # or you can specify varying = list(2:4) to refer the 2nd to the 4th columns
                    v.names = "score", direction = "long")
dat_wide <- reshape(dat_long, v.names = "score", idvar = "name",
                    # sep = "_",  # you can use this to customerize your names
                    # instead of score.1, you have score_1
                    # you can write sep = "",
                    timevar = "time", direction = "wide")


######################## slide 14
## merge in rows
############ I fake two data sets to merge
dat_top <- head(dat)
dat_bot <- tail(dat)
rbind(dat_top, dat_bot)
## r is very smart, even the names ordered differently
dat_bot <- dat_bot[, 5:1]
rbind(dat_top, dat_bot)

######################## slide 15
a <- data.frame(X1 = LETTERS[1:3],
                X2 = 1:3)
b <- data.frame(X1 = c("A", "B", "D"),
                X3 = c("T", "F", "T"))

# left_join
merge(a,b,by = "X1", all.x = TRUE)

# right_join
merge(a,b,by = "X1", all.y = TRUE)

# inner_join
merge(a,b,by = "X1")   # the same as  merge(a,b,by = "X1", all.x = FALSE, all.y = FALSE)

# full_join
merge(a,b,by = "X1", all = TRUE)

######################## slide 16

## merge in columns
## input two datasets
authors <- data.frame(
  name = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  retired = c("yes", rep("no", 4)))
books <- data.frame(
  name = c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA))

merge(authors, books, by = "name")

######################## slide 17
########### suppose "name" is named as "surname" in authors
authors <- data.frame(
  surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  retired = c("yes", rep("no", 4)))
books <- data.frame(
  name = c("Tukey", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics ...",
            "LISP-STAT",
            "Spatial Statistics", "Stochastic Simulation",
            "Interactive Data Analysis"),
  other.author = c(NA, "Ripley", NA, NA, NA, NA))


merge(authors, books, by.x="surname", by.y="name")
merge(books, authors, by.x="name", by.y="surname")

