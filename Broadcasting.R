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

########## R1_Intro.ppt Slides 7 to 12 ## environment

plot(mtcars$mpg, mtcars$cyl)

search() # display all environments in your RAM/memory

ls()  # print all the objects created by you

## Windows users should install Rtools at
## https://cran.rstudio.com/bin/windows/Rtools/

#install.packages("metavcov")  # install a package
#library("metavcov")           # load a package
#require("metavcov")           # load a package
