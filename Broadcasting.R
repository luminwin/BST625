
###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

age <- c(5, 6, 7, 8, 9, 10)          # initialize a vector
height <- c(103, 108, 112, 122, 129, 140)

plot(age, height) # make a plot


pdf("example.pdf", width = 5, height = 5)
plot(age, height)
dev.off()

plot(mtcars$mpg, mtcars$cyl)

search() # display all enviornments in your RAM

ls()  # print all the objects created by you

## windows users should install Rtools at
## https://cran.rstudio.com/bin/windows/Rtools/

install.packages("metavcov")  # install a package
library("metavcov")           # load a package
require("metavcov")           # load a package

age <- c(5:10, NA)

mean(age) # calculate the average/mean
mean(x = age, trim = 0.2, na.rm = TRUE) # trimmed mean

help(mean)
?mean

mean(c(22, 15, 90, 55)) 

mean(age, 0.2, TRUE)  # the same as mean(x = age, trim = 0.2, na.rm = TRUE)
mean(age, 0.2)        # the same as mean(x = age, trim = 0.2, na.rm = FALSE)

lgl_var <- c(TRUE, FALSE) # logical
int_var <- c(1L, 6L, 10L) # integer
dbl_var <- c(1, 2.5, 4.5) # double
chr_var <- c("Everyone can be", "contributer for R") # "character"

typeof(lgl_var) 

typeof(int_var) 

typeof(dbl_var) 

typeof(chr_var) 

