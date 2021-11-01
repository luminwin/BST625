###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

head(mtcars)
summary(mtcars$drat, digits = 5)
table(mtcars$cyl)
table(mtcars$drat)
table(mtcars$cyl, mtcars$am)

attach(mtcars)
table(cyl,am)
detach(mtcars)

unique(mtcars$cyl)

############################################
# {base}
# data summary aggregate() 
############################################
######################## slide 9

summary(lm(mpg ~ cyl + vs, data = mtcars))

aggregate(mpg ~ cyl, data = mtcars, mean)
aggregate(mpg ~ cyl, data = mtcars, sd)
aggregate(mpg ~ cyl, data = mtcars, max)

aggregate(cbind(mpg, disp) ~ cyl, data = mtcars, mean)

aggregate(mpg ~ cyl + vs, data = mtcars, mean)
table(mtcars$cyl, mtcars$vs)

aggregate(cbind(mpg, disp) ~ cyl + vs, data = mtcars, var)

dat <- read.csv("https://luminwin.github.io/BST625/score_data999.csv")
dat[dat == 999] <- NA



dat_long <- reshape(dat,  idvar = "name", 
                    varying = c("score1", "score2", "score3"), 
                    # or you can specify varying = list(2:4) to refer the 2nd to the 4th columns
                    v.names = "score", direction = "long")

colnames(dat)[c(2:4)] <- c("scoreHW", "scoreRF", "scor123")


reshape(dat,  idvar = "name", 
        varying = c("scoreHW", "scoreRF", "scor123"), 
        # or you can specify varying = list(2:4) to refer the 2nd to the 4th columns
        v.names = "score", direction = "long")


paste("score", 1:3, sep = "_")
dat_wide <- reshape(dat_long, idvar = "name",
                    v.names = "score", 
                    sep = "_",  # you can use this to customerize your names
                    # instead of score.1, you have score_1
                    # you can write sep = "",
                    timevar = "time", direction = "wide")


a <- data.frame(X1 = LETTERS[1:3],
                X2 = 1:3)
b <- data.frame(X1 = c("A", "B", "D"),
                X3 = c("T", "F", "T"))

# left_join
merge(a, b, by = "X1", all.x = TRUE)

# right_join
merge(a,b,by = "X1", all.y = TRUE)

# inner_join
merge(a,b,by = "X1")   # the same as  merge(a,b,by = "X1", all.x = FALSE, all.y = FALSE)

# full_join
merge(a,b,by = "X1", all = TRUE)


if("tidyverse" %in% rownames(installed.packages()) == FALSE) {install.packages("tidyverse")}
library(tidyverse)

######################## slide 17
dat <- read_csv("https://luminwin.github.io/BST625/HEART.csv")

dat %>% distinct(Status)

dat %>% select(Status) %>% distinct

dat %>% distinct(AgeCHDdiag)

dat %>%
  count(Status)

dat %>%
  count(Status, Sex)


dat %>%
  filter(!is.na(Height)) %>%
  select(Height) %>%
  summarise

dat %>%
  filter(!is.na(Height)) %>%
  summarize(min(Height),
            mean(Height),
            max(Height),
            sd(Height),
            n())

dat %>%
  filter(!is.na(Height)) %>%
  summarise(Heightwhatever = min(Height),
            theMeanHeight = mean(Height),
            theMaxHeight = max(Height),
            n = n())


dat %>%
  filter(!is.na(Height)) %>%
  group_by(Sex) %>%
  summarise(theMinHeight = min(Height),
            theMeanHeight = mean(Height),
            theMaxHeight = max(Height),
            n = n())

mytable <- dat %>%
  filter(!is.na(Height)) %>%
  group_by(Sex) %>%
  summarise(theMinHeight = min(Height),
            theMeanHeight = mean(Height),
            theMaxHeight = max(Height),
            n = n())
mytable

mytable %>%
  ungroup() %>%
  summarise(N = sum(n))



mytable %>%
  ungroup() %>%
  summarise(
    Mean = weighted.mean(theMeanHeight,n),
    Max = max(theMinHeight),
    Min = min(theMinHeight),
    N = sum(n))

relig_income %>%
  pivot_longer(-religion, 
               names_to = "income", 
               values_to = "count")

fish_encounters %>%
  pivot_wider(names_from = station, 
              values_from = seen)

score <- read_csv("https://luminwin.github.io/BST625/score_data999.csv")

data_long <-  score %>%
  pivot_longer(-c(name,gender), 
               names_to = "time", 
               values_to = "score")

data_long <-  score %>%
  pivot_longer(score1:score3, 
               names_to = "time", 
               values_to = "score")


data_wide <-  data_long %>%
  pivot_wider( names_from = time, 
               values_from = score)

billboard %>%
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    names_prefix = "wk",
    values_to = "rank",
    values_drop_na = TRUE
  )
