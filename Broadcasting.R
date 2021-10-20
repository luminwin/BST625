###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

r1 <- c('I', 'am', 'happy')
r2 <- c('what', 'a', 'day')
r3 <- c(1,2,3)
C <- cbind(r1, r2, r3) ## r3 is coerced into character shown with quotation marks

typeof(C[ 1, 2])
diag(C)

contributors()

typeof(r3)

Cf <- data.frame(r1, r2, r3)
typeof(Cf$r3)   ## only data.frame can use $

diag(Cf) ## error

as.matrix(Cf)
as.data.frame(C)

############ convert characters to dates
dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92")
typeof(dates)
dates <- as.Date(dates, "%m/%d/%y")
dates
typeof(dates)
dates + 1
dates[1] + 1:10
summary(dates)

age <- c(5, 6, 7, 8, 9, 10)      
height <- c(103, 108, 112, 122, 129, 140)
obj <- lm(height~age)
attributes(obj)
obj$coefficients
obj$model
summary(obj)

################### R plot from R {base} packages
age <- c(10, 12, 25, 50, 55, 80)
height <- c(120, 118, 162, 160, 179, 190)

plot(age, height)
plot(height)

obj <- lm(height~age)
plot(obj)
methods(plot)
attributes(obj)


plot(mtcars$mpg ~ mtcars$wt,         # y ~ x
  #   xlim = c(0, 6),       # set x axis limits from 0 to 30
  #   ylim = c(10, 40),     # set y axis limits from 10 to 40
     main = "Miles per Gallon and Weight", # title for this plot
     xlab = "Weight (1000 lbs)",           # label for x axis
     ylab = "Miles/ gallon",               # label for y axis
     col = "red",          # color for the symbols
     pch = 19)    

### Please manipulate these inputs and see the changes in the output figure
## find colors in the following link
## https://www.datanovia.com/en/blog/awesome-list-of-657-r-color-names/

plot(mtcars$mpg ~ mtcars$cyl,
  #  xlim = c(0, 6),
  #  ylim = c(10, 40),
     main = "Miles per Gallon and \n Cylinders",
     xlab = "Cylinders",
     ylab = "Miles/ gallon",
     col = 4,
     pch = 17)


# pie chart
data(esoph) ## bring esoph data from environment "package:datasets" to environment ".GlobalEnv"
## esoph <- esoph # the same as above

pie(table(esoph$agegp), main = "Age groups of esophageal Cancer")


par(mfrow = c(2, 1)) # display figures as 1 row 2 columns

## \n to start a new line for long titles
pie(table(esoph$agegp), main = "Age groups from Smoking, \n Alcohol and esophageal Cancer")

pie(table(esoph$agegp), 
    col = c("purple", "violetred1", "green3",
            "cornsilk", "orange", "white"),
    main = "Age groups of esophageal Cancer")

dev.off() 


counts <- table(mtcars$gear)
barplot(counts, main="Car Distribution by Gears",
        xlab="Number of Gears", 
        col=c("darkblue"))
# Stacked Bar Plot with Colors and Legend
counts <- table(mtcars$vs, mtcars$gear)
barplot(counts, main="Car Distribution by Gears and Engine Type",
        xlab="Number of Gears", 
        col=c("darkblue","red"),
        legend = c("V-shaped Engine", "Straight Engine"))


mtcars <- mtcars ## bring data from environment "package:datasets" to environment ".GlobalEnv"
attach(mtcars) ## elevate the data to the top environment to save your typing of $
head(mtcars)
pdf("Scatter.pdf", width = 6, height = 5)
plot(wt, mpg, main = "Scatterplot Example",
     xlab = "Car Weight ", 
     ylab = "Miles Per Gallon ", 
     pch = 19,
     col = gear)
abline(lm(mpg ~ wt), col = "red") # regression line (y~x)
lines(lowess(wt, mpg), col = "blue") # lowess line (x,y)
legend("topright", legend = paste("gear =", unique(gear)), 
       col = unique(gear), pch = 19, bty = "n")

legend("right", legend = c("Linear regression", "Lowess"), 
       col = c("red","blue"), lty = 1, bty = "n")
dev.off()

detach(mtcars)



if("ggplot2" %in% rownames(installed.packages()) == FALSE) {install.packages("ggplot2")}

library(ggplot2) # Remember that we have to run the following first
# install.packages("ggplot2") # or
# install.packages("tidyverse") 
?mpg # check the data
mpg <- ggplot2::mpg
ggplot(data = mpg) +    
  aes(x = displ, y = hwy) +  
  geom_point(aes(colour = cyl)) + 
  # Default smoother is LOESS
  geom_smooth() +
  geom_smooth(method = "lm", colour = "red")


