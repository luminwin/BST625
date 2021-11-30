###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

# download team.jpeg from blackboard R6 and save it in your working directory

###################################################
#
#         Homework 6
#
###################################################

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
        names = c("XXXXA", "XXXXB", "XXXXA", "XXXXB"),
        xaxs = FALSE,
        xlab = "XXXXC",
        ylab = "XXXXD")
legend("topleft", fill = cols ,
       legend = c("XXXX1", "XXXX2") , horiz = T, bty = "n")

## Note that I have to put extra spaces to "Female" and "Male" to make them in the center
par(mfrow = c(1, 2)) 
boxplot(Avg_Pain ~ trt + sex, data = dat, col = cols)
boxplot(Avg_Pain ~ trt + sex, data = dat,
        at = c(1:2 , 4:5) , col = cols ,
        names = c("                   Male", "", 
                  "                   Female", ""),
        xaxs = FALSE,
        xlab = "Gender",
        ylab = "Average pain level")
legend("topleft", fill = cols ,
       legend = c("Control", "Treatment") , horiz = T, bty = "n")

############### Question B.1 and T.1
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
dat <- reshape(dat, v.names = "pain", idvar = "id",
               timevar = "time", direction = "wide")


######### !!!! pay attention to upper case or lower case: Avg_Pain or Avg_pain
dat$Avg_Pain <- rowMeans(dat[,paste("pain", 1:6, sep = ".")])

library(tidyverse)
dat <- dat %>% mutate(Avg_Pain = rowMeans(select(.,pain1:pain6)))

################## side 11
################## R style guide


####### the following code has bad style

# comments are retained ; a comment block will be reflowed if it contains long comments;' roxygen comments will not be wrapped in any case
1+1
if( TRUE ) {
  x =1 # inline comments
} else {
  x =2; print ('Oh no ... ask the right bracket to go away !') }
1*3 # one space before this comment will become two!
2+2+2 # only "single quotes are allowed in comments
lm(y~x1+x2,data=data.frame(y=rnorm(100),x1=rnorm(100),x2=rnorm(100))) ### a linear model

1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1+1 
# comment after a long line here is a long long long long long long long long long comment that may be wrapped


########### !!!! copy the above commend and run below
if("formatR" %in% rownames(installed.packages()) == FALSE) {install.packages("formatR")}
library(formatR)
tidy_source(width.cutoff = 50) # can set arbitrary width here

# https://yihui.shinyapps.io/formatR/

# download team.jpeg from blackboard R6 and save it in your working directory

#########################################################################
#
#     !!! The following code is not for .R file, they are for .rmd file!!!
#         Click Flie => New File => R Markdown to create .rmd file
#         Download team.jpeg from Blackboard in R6
#         Delete the contents and paste the following in the .rmd file
#
#########################################################################

---
title: "A Tiny Project for BST 625"
author: "First Name Last name (XXXX@umiami.edu)"
date: "11/17/2020"
output: html_document
---
  
```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)
options(digits = 2)  ## set digits for statistics
```
[comment]: <> (This is a comment, it will not be included)
[comment]: <> (You have to download team.jpeg from blackboard and save it in the same folder where this .rmd file is located)
![](team.jpeg){width=60%}

## Project Development Pipeline Process Steps

- **Phase 1**
  - Site Selections & Acquisition
- Pre-feasibility Studies
- **Phase II**
  - Design & Development
- Construction
- **Phase III**
  - Operation 
- Maintenance


## Data description
The dataset we used contains a subset of the fuel economy data that the EPA makes available on http://fueleconomy.gov. It contains only models which had a new release every year between 1999 and 2008 - this was used as a proxy for the popularity of the car.

The variables are

#### Table 1
|Variable | Content |
  |:-----|:-----|
  |displ| Engine displacement in litres|
  |cyl | Number of cylinders|
  |trans| Type of transmission|
  |drv | Type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = four wheel drive|
  |cty | City miles per gallon|
  |hwy | Highway miles per gallon|
  |class | Type of car|
  
```{r}
# dat <- read.csv("score_data.csv")
# head(dat)
```

A snapshot of the data:
```{r}
library(ggplot2) 
data(mpg)
knitr::kable(mpg[1:10, ])
```

## Data visulization


```{r}
data(mpg)
mpg$drv <- factor(mpg$drv, levels = c("f", "r", "4"),
                  labels = c("Front-wheel drive",
                             "Rear wheel drive",
                             "Four wheel drive"))
```


```{r}
#mfrow(c(1,2))
ggplot(data = mpg) +
  aes(x = displ, y = cty, colour = class) + 
  geom_point() +
  facet_grid(drv ~ cyl) +
  ggtitle("Relationship between engine displacement and city miles per gallon") +
  ylab("Type of drive train") + xlab("Number of cylinders") +
  theme(axis.text = element_text(size = 9),
        axis.title = element_text(size = 14, face = "bold"),
        plot.title = element_text(size = rel(1.3)),
        legend.title = element_text(face = "bold"),
        panel.background = element_rect(fill = "white", colour = "grey50"))  

```


```{r cars,fig.width = 6,fig.height = 4}
ggplot(data = mpg) +
  aes(x = displ, y = hwy) + 
  geom_point(aes(colour = cyl)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red") +
  xlab("Engine displacement in litres") + ylab("Highway miles per gallon") +
  theme(axis.text = element_text(size = 9),
        axis.title = element_text(size = 14, face = "bold"),
        plot.title = element_text(size = rel(2)),
        legend.title = element_text(face = "bold"))  
```


## Statistical Result



The dataset contains `r nrow(mpg)` observations with `r ncol(mpg)` variables (see details in [Table 1] and the [EPA website](http://fueleconomy.gov)). The average value of highway miles per gallon is `r mean(mpg$hwy)` (SD = `r sd(mpg$hwy)`) and the average value of city miles per gallon is `r mean(mpg$cty)` (SD = `r sd(mpg$cty)`). 
```{r}
obj <- lm(hwy ~ class, data = mpg)
#summary(obj)
# x <- summary(obj)$coefficient
# x
results <- anova(obj)
#results
#names(results)
#results$"F value"

```
Highway miles per gallon and type of car are significantly associated (*F*-statistic = `r results$"F value"[1]`, *df* = `r results$Df[1]`, *P* < 0.0`r round(results$"Pr(>F)"[1], 3)`1). 
```{r}
obj2 <- chisq.test(mpg$drv,mpg$trans)
#obj2
#names(obj2)
#obj2$statistic
```
Type of drive train and type of transmission are significantly associated ($\chi^2$ = `r round(obj2$statistic,2)`, *df* = `r obj2$parameter`, *P* = `r round(obj2$"p.value", 3)`).

