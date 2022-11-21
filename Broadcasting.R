###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

# If you submit your HW6 by this Friday with the bonus part (Nov 25th, 11:59pm), 
# I will grade your homework early so that you can resubmit to claim all your lost points. 

# Please download "team.jpg" and "score_data.RData" from our blackboard to join class

setwd("C:/Users/m.lu/Downloads/BST625/R6")
load("score_data.RData")
save.image("scoresave.RData") ## save all the object in your environment
save(dat, file = "score_data.RData") ## save a specific object dat


library(tidyverse) # if you have error you have to run the following first
# install.packages("tidyverse")

?mpg # check the data

ggplot(mpg) +
  aes(x = hwy) +
  geom_histogram()

ggplot(mpg) +
  geom_histogram(aes(x = hwy))

ggplot(mpg) +
  geom_histogram(aes(x = hwy), binwidth = 5)

ggplot(mpg) +
  geom_histogram(aes(x = hwy), bins = 20)


ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point()


ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point() +
  geom_smooth(method = "lm", colour = "red") 


ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = trans,
                 size = displ),   ## bubble plot
             alpha = 0.5) + 
  # Default smoother is LOESS (Locally Weighted Scatterplot Smoothing)
  geom_smooth(colour = "green") +
  geom_smooth(method = "lm", colour = "red") 
ggsave(height = 4, width = 4*1.9,
       file = "scatterexample.jpg") #.png  .jpg   or   .pdf


setwd("C:/Users/m.lu/Downloads/BST625") ## the folder you save "score_data.RData" that you downloaded from BB
load("score_data.RData")

dat2 <- dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) 
#############################
# In-class Exercise
#############################
# make a scatterplot using above dat2  with score1 score2 with Avg_Score as colour

ggplot(dat2) +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = Avg_Score)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")

## connect the above two steps with %>%

dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
ggplot() +
  aes(x = score1, y = score2) + 
  geom_point(aes(colour = Avg_Score)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")


dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  rename(GRE = score1,
         GPA_stats_I = score2,
         GPA_stats_II = score3) %>%
  ggplot() +
  aes(x = GRE, y = GPA_stats_II) + 
  geom_point(aes(colour = GPA_stats_I)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")


dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot() +
  geom_bar(mapping = aes(x = grade)) +
  labs(x = "Grade", y="Count Number")


dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot() +
  geom_count(mapping = aes(x = grade, y = gender)) +
  labs(x = "Grade", y="Female/Male")


########################################### slide # 6
dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  count(grade, gender) %>%  
  ggplot(mapping = aes(x = grade, y = gender)) +
  geom_tile(mapping = aes(fill = n))+
  labs(x = "Grade", y="Female/Male")



########################################### slide # 7
dat %>% mutate(
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot(aes(gender, Avg_Score, fill = factor(major))) +
  geom_boxplot() +
  theme_classic()

ggplot(data = mpg) +
  aes(x = displ, y = cty, colour = class) + 
  geom_point() +
  facet_grid(drv ~ cyl) +
  ggtitle("Plot of mpg data \n using ggplot2") +
  xlab("Engine displacement, in litres") + ylab("City miles per gallon") +
  theme(axis.text = element_text(size = 9),
        axis.title = element_text(size = 14, face = "bold"),
        plot.title = element_text(size = rel(2)),
        legend.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "white", colour = "grey50"))



dat %>% mutate(   
  Total_Score = rowSums(select(., score1:score3), na.rm = TRUE), 
  Avg_Score = rowMeans(select(.,score1:score3), na.rm = TRUE), 
  grade = case_when( 
    Avg_Score < 60 ~ "F", 
    (60 <= Avg_Score)&(Avg_Score < 70) ~ "D", 
    (70 <= Avg_Score)&(Avg_Score < 80) ~ "C", 
    (80 <= Avg_Score)&(Avg_Score < 90) ~ "B", 
    Avg_Score >= 90 ~ "A"),
  pass = case_when(
    grade == "F"~"Fail", 
    TRUE ~"Pass")) %>%
  ggplot(aes(x = factor(1), fill = factor(grade))) +
  geom_bar(stat = "count") +  #### now the magic happens
  coord_polar(theta = 'y') +
  labs(fill = "Grade") +
  xlab(" ") +
  theme(legend.title = element_text(size=18),
        axis.text = element_text(size = 12),
        axis.title = element_text(size = 14, face = "bold"))

############################################################## 
#  {base} -- most plots in {base} are already covered in Topic 2
##############################################################
# GENERATE THE DATA  

Age <- c(50, 55, 60, 65, 70)                                     # Age groups  
Male <- c(15.4, 24.3, 37.0, 54.6, 71.1)                          # Death rates for males  
Female <- c(8.4, 13.6, 19.3, 35.1, 50.0)                         # Death rates for females  
Deathrate <- matrix(c(Male,Female), nrow = length(Age), ncol = 2, 
                    dimnames = list(Age, c("Male","Female")))         
# Create a matrix Deathrate with the data  
Deathrate2 = t(Deathrate)                                       # Transpose the Deathrate matrix  

# SIMPLE BARPLOT                                        # Open a new window for the plot  

barplot(Deathrate2,                             # Data (bar heights) to plot  
        beside = TRUE,                            # Plot the bars beside one another; default is to plot stacked bars  
        space = c(0.2,0.8),                       # Amount of space between i) bars within a group, ii) bars between groups  
        names.arg = c("65-69", "60-64", "55-59", "50-54", "70-74"),    #Names for the bars  
        col = c("blue", "red"),                   # Color of the bars  
        border = "yellow",                         # Color of the bar borders  
        main = c("Death rates in Virginia"),      # Main title for the plot  
        xlab = "Age group",                       # X-axis label  
        ylab = "Death rate",                      # Y-axis label  
        font.lab = 2)                             # Font to use for the axis labels: 1=plain text, 2=bold, 3=italic, 4=bold italic  

legend("topleft",                               # Add a legend to the plot  
       legend=c("Male", "Female"),             # Text for the legend  
       fill=c("blue", "red"))                  # Fill for boxes of the legend  


####################
# {base}
####################
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
dat <- reshape(dat, v.names = "pain", idvar = "id",
               timevar = "time", direction = "wide")
dat$Avg_Pain <- rowMeans(dat[,paste("pain", 1:6, sep = ".")])

par(mfrow = c(1, 2)) 
boxplot(Avg_Pain ~ trt + sex, data = dat)

## remember that trt == 1 for "Control" and trt == 2 for "Post-operative suction"?
cols <- c("chocolate1", "chartreuse4")
dat$sex <- factor(dat$sex, levels = 1:2, labels = c("male", "female"))
dat$trt <- ifelse(dat$trt == 1, "control", "treat") 
boxplot(Avg_Pain ~ trt + sex, data = dat, col = cols)

par(mfrow = c(1, 2)) 
boxplot(Avg_Pain ~ trt + sex, data = dat, col = cols)
boxplot(Avg_Pain ~ trt + sex, data = dat,
        at = c(1:2 , 4:5) , col = cols ,
        names = c("                   Male", "", 
                  "                   Female", ""),
        xaxs = FALSE,
        xlab = "XXXXC",
        ylab = "XXXXD")
legend("topleft", fill = cols ,
       legend = c("Control", "Treatment") , horiz = T, bty = "n")

#######################################################
# !!!! paste the following code to your .rmd file NOT .r file
############################################################

---
title: "A Tiny Project for BST 625"
author: "First Name Last name (XXXX@umiami.edu)"
date: "11/21/2022"
output: html_document
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)
options(digits = 2)  ## set digits for statistics
```

![](team.jpeg){width=60%}