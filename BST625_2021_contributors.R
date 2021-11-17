

###################################################################	
### 
### BST 625 Contributors' work
###
###################################################################

##########################################################################
# contributor: Rachelle Brick {base}
###########################################################################

dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")

t.test(Pain_long ~ sex, data = dat)

mean(Pain_long[which(dat$sex==1)])

pie(table(Pain_long))

barplot(table(Pain_long))

##########################################################################
# contributor: Rachelle Brick {base}
###########################################################################

x<- c("Firefox", "Chrome", "Edge", "Safari", "Internet Explorer", "Opera")
startsWith(x, "E")

x[which((startsWith(x, "E")==TRUE))]

#Learning some simple statistic funciton:
#student.pr <- princomp(data, cor = T)
## write down the purpose of the above command
## ----| means principal component analysis with related factors


favorite_desserts <- list(Sophia = "banana bread", Eliott = "pancakes", Karina = "chocolate
cake")
favorite_desserts %>% map_chr(~ paste(.x, "rocks!"))
##
Sophia
Eliott
Karina
## "banana bread rocks!"
"pancakes rocks!" "chocolate cake rocks!"
mtcars %>% map_dbl(sum)
## mpg
cyl
disp
hp
drat
wt
qsec
vs
## 642.900 198.000 7383.100 4694.000 115.090 102.952 571.160 14.000
##
am
gear
carb
## 13.000 118.000 90.000
## write down the purpose of the above command
## ----|I have been exploring map functions. There are many different types (under purrr
package). Two basic ones are above: The first shows map_chr() which returns a character
vector after applying a function to each element of a list. The second shows map_dbl() which
returns a double atomic vector after applying a function to each element of a vector.