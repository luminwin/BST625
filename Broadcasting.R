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
summary(obj)

