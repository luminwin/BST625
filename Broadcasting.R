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

aggregate(cbind(mpg, disp) ~ cyl + vs, data = mtcars, mean)

