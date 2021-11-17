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