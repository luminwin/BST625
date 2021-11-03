###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

dat <- read.csv("https://luminwin.github.io/BST625/score_data.csv")
nrow(dat)
rownames(dat)
rowSums(dat[,2:4])
rowMeans(dat[,2:4])
dat1 <- head(dat)
dat2 <- tail(dat)
rbind(dat1,dat2)

ncol(dat)
colnames(dat)
colSums(dat[,2:4], na.rm = TRUE)
colMeans(dat[,2:4])
dat1 <- dat[,1:3]
dat2 <- dat[,4:5]
cbind(dat1,dat2)