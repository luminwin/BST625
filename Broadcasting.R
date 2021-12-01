###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

###################################################################	
### 
### Go to blackboard and download app.R from R7 R Shinny APP
###
###################################################################

###################################################################	
### 
### BST 625 Contributors' work
###
###################################################################
checkuse <-function(x){
  if(x %in% rownames(installed.packages()) == FALSE) {
    install.packages(x)
  }
  # library(x, character.only = TRUE)
}

checkuse("maps")
checkuse("tidyverse")
checkuse("skimr")
checkuse("data.table")
checkuse("cowsay")
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
Pain_long <- dat$pain


##########################################################################
# contributor: Carson Coudriet {base}
###########################################################################
attach(dat)
summary(pain)
detach(dat)

##########################################################################
# contributor: Alvin Mathew {base}
###########################################################################
quantile(Pain_long, na.rm = TRUE, probs = c(0.33,0.66))
## ----|The purpose of this command is to remove the missing values and obtain 
## the tertiles of pain intensity within the object *Pain_long*.                                            

# contributor: Min Lu {base}
# try some continuous variable with more values
quantile(dat$age, na.rm = TRUE, probs = c(0.33,0.66))
##########################################################################
# contributor: Dingtian Cai {base}
###########################################################################

## ----| I learned it from internet, R is an opening community. 
## It can consist most statistics solutions by import the package to it. 
## There are lots of people sharing their R package. We can use them directly instead of 
## writing them by ourselves. 

##########################################################################
# contributor: Corinne Ferrari {base}
###########################################################################
plot(Pain_long)
## ----|Plotting the values of Pain_long.

##########################################################################
# contributor: Haiyong Shu {base}
###########################################################################
unique(Pain_long)

##########################################################################
# contributor: Jessica Rivera; Valeria Aguilar; Diane Choi; Romita Rajasekaran {base}
#              Ibidolapo Okedara; Ifedioranma Anikpo; Amrit Baral; Jayro Toledo
#              Yuchen Wang; Peiyu Zhu
###########################################################################
hist(Pain_long)
barplot(Pain_long)
## write down the purpose of the above command
## ----| To create a histogram and barplot of the Pain_long vector

## ----|I found Google and the help section to be super helpful in finding  solutions

##########################################################################
# contributor: Frank Gutierrez {base}
###########################################################################
counts <- table(dat$pain)
barplot(counts, main="Pain Intensity",
        xlab="Pain Intensity Level", ylab="The Total Amount of the Same Pain Intensity",
        col=c("green"))

## write down the purpose of the above command
## ----|This creates a box plot of the pain data with the color green. 

## ----|The R help file has been extremely helpful.

##########################################################################
# contributor: Jingwei Gu {base}
###########################################################################
Pain_long[3]
## [1] 0
## write down the purpose of the above command
## ----| Selecting the third element of pain_long and I run it, the third element is 0.

##########################################################################
# contributor: Xinyi Liao {base}
###########################################################################
typeof(Pain_long) 
## write down the purpose of the above command
## ----|Knowing what type of variable is for Pain_long([1] "integer")

##########################################################################
# contributor: Hannah Cranford {base}
###########################################################################
x<- c("Firefox", "Chrome", "Edge", "Safari", "Internet Explorer", "Opera")
startsWith(x, "E")
x[which((startsWith(x, "E")==TRUE))]

## write down the purpose of the above command
## ----|Line 75 assigns a set of character variables to the vector x. 
## Line 76 is a logic function that returns true if the element in the vector starts 
## with "E" and returns false if all other. Line 77 takes line 76 and uses it inside 
## another function to return the name of the element(s) that return true for startsWith(). 
## ----| I found the startsWith function online and after reviewing the use in R Help, 
## I then used it in combination with some of the code learned in 2-data-struc.R to return 
## the name of the element of interest. 

# contributor: Min Lu {base}
# Now we know we can also use
subset(x, startsWith(x, "E"))

##########################################################################
# contributor: Ahmed Alnajar {base}
###########################################################################
library("skimr")
skimr::skim(dat)
detach("package:skimr", unload=TRUE)
scale0_1 <- function(x) {
  return((x - min(x,na.rm = T)) / (max(x,na.rm = T) - min(x,na.rm = T))) 
}

hist(scale0_1(Pain_long))
hist(scale(Pain_long))
## write down the purpose of the above command
## ----| this will present the data after transformation so I can tell how it 
## affected my data distribution using 0-1 scale and Z-socre scale
## ----|I find stackoverflow.com a very good resource to test others code and adopt it in my work
# furthermore, base R functions are really easy to use, but our own functions can be more 
## constomizable

##########################################################################
# contributor: Kyle Grealis {base}
###########################################################################

r1 <- c('I', 'am', 'happy')
r2 <- c('what', 'a', 'day')
r3 <- c(1,2,3)
C <- rbind(r1, r2, r3)

## ----| The above lines of code create 3 rows (2 character, 1 integer vectors), 
# then binds the rows in the order listed, creating matrix 'C'.

# contributor: Min Lu {base}
# We used this to demonstrate that rbind coerses r3 from numeric to character in C
##########################################################################
# contributor: Eva Agasse; Victor Ortiz  {base}
###########################################################################

boxplot(Pain_long)

## write down the purpose of the above command
## ----|The purpose of the command above was to create a boxplot to analyze the 
## distribution of vector Pain_long. 
## I definitely want to learn how to make it prettier for next time. 

# contributor: Min Lu {base} 
datw <- reshape(dat, v.names = "pain", idvar = "id",
                timevar = "time", direction = "wide")
datw$Avg_Pain <- rowMeans(datw[,paste("pain", 1:6, sep = ".")], na.rm = TRUE)
datw$trt <- ifelse(datw$trt == 1, "control", "treatment")
datw$sex <- ifelse(datw$sex == 1, "male", "femail")
boxplot(Avg_Pain~trt + sex, datw, col = c("chocolate1", "chartreuse4"))

##########################################################################
# contributor: Hatoun Alkamli {base}
###########################################################################
colMeans(dat)

## write down the purpose of the above command
## ----| The function colMeans() computes the mean of each column of a numeric 
## data frame, matrix or array.

# contributor: Min Lu {base} 
# In R4, we saw
ncol(dat)
colnames(dat)
colSums(dat)
colMeans(dat)
# cbind(dat1,dat2)

nrow(dat)
rownames(dat)
rowSums(dat)
rowMeans(dat)
# rbind(dat1,dat2)


##########################################################################
# contributor: Rachelle Brick {base}
###########################################################################

dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")

t.test(Pain_long ~ sex, data = dat)

mean(Pain_long[which(dat$sex==1)])

pie(table(Pain_long))

barplot(table(Pain_long))

##########################################################################
# contributor: Alvin Mathew {tidyverse}
###########################################################################
library(tidyverse)
slice(dat,1:5) 
## ----| Select rows by position. 

#Group wise operation ----------------------------------------
df <- tibble(
  group = rep(c("a", "b", "c"), c(1, 2, 4)),
  x = runif(7)
)
# All slice helpers operate per group, silently truncating to the group
# size, so the following code works without error

df %>% group_by(group) %>% slice_head
# When specifying the proportion of rows to include non-integer sizes
# are rounded down, so group a gets 0 rows

filter(mtcars, row_number() == 1L)
filter(mtcars, row_number() == n())
# Filter equivalents --------------------------------------------
# slice() expressions can often be written to use `filter()` and
# `row_number()`, which can also be translated to SQL. For many databases,
# you'll need to supply an explicit variable to use to compute the row number


##########################################################################
# contributor: Jessica Rivera {tidyverse}
###########################################################################
flights <- read_csv("https://luminwin.github.io/BST625/flights.csv")
flights %>%
  mutate(date = as.Date(paste0(as.character(year), "-", as.character(month), "-", as.character(day)))) %>% 
  group_by(date, origin) %>%
  count() %>% 
  collect() %>% 
  ggplot(aes(x = date, y = n, color = origin)) +
  geom_point() + 
  geom_smooth() +
  theme_minimal() +
  labs(title = "Number of flights",
       x = "Origin", 
       y = "Number of flights") +
  scale_y_continuous(limits = c(0, 450))

## write down the purpose of the above command
## ----|I was attepting to create a new plot with the flights data 
## but the data points are all clustered.Is there a better way of writing the above code?

## Min's response: we don't need scale_y_continuous(limits = c(0, 450)) to enlarge the range of y
flights %>%
  mutate(date = as.Date(paste0(as.character(year), "-", as.character(month), "-", as.character(day)))) %>% 
  group_by(date, origin) %>%
  count() %>% 
  collect() %>% 
  ggplot(aes(x = date, y = n, color = origin)) +
  geom_point() + 
  geom_smooth() +
  theme_minimal() +
  labs(title = "Number of flights",
       x = "Origin", 
       y = "Number of flights") 

##########################################################################
# contributor: Hatoun Alkamli {tidyverse}
###########################################################################
flights %>%
  mutate(short_flight = air_time < 270) %>% 
  count(short_flight)
## write down the purpose of the above command
## ----|Count() lets you quickly count the unique values of one or more variables. 
## Equivalent to as.data.frame(table(x)), but does not include combinations with zero counts.

##########################################################################
# contributor: Diane Choi {tidyverse}
###########################################################################
dat %>%
  slice(1:10)

## write down the purpose of the above command
## ----|to get the first x rows

##########################################################################
# contributor: Rachelle Brick {tidyverse}
###########################################################################
score <- read_csv("https://luminwin.github.io/BST625/score_data999.csv")
score %>% gather("Score", "Attempt", 2:4)
## write down the purpose of the above command
## ----| We use "gather()" to collect observations found in column names 
## that need to be gathered under a variable with a new column name. 
## It moves all of the individual score columns into one main column. 
## The previous headings are now turned into a categorical variable. 
## It appears to work in a similar transformation of changing a dataset from wide to long form. 

# contributor: Min Lu {tidyverse} 
# from ?gather, we can see that the lifecycle of gather is superseded
# R studio decided to use pivot_longer() that we learnt in R3

##########################################################################
# contributor: Ifedioranma Anikpo {base}
###########################################################################
new.function <- function(a) {
  for(i in 1:a) {
    b <- i^2
    print(b)
  }
}
# Call the function new.function supplying 7 as an argument.
new.function(7)
## ----|This command helps me create a new (customized) function that squares 
## a series of numbers in sequence. Here, I have used the function to compute 
## the squares of the numbers 1 to 7.

##########################################################################
# contributor: Amrit Baral {tidyverse}
###########################################################################
flights %>%
  slice_sample(n=10)

## write down the purpose of the above command
## ----|The function of the command is to sample and randomly shuffle data.Here, 
## in this case I specified 10 rows to be randomly sampled. 

##########################################################################
# contributor: Dingtian Cai
###########################################################################
## write down the purpose of the above command
## ----|We can use "Ctrl+L" to clean the R console which is equivalent to  
## “Clear console” command under “Edit” menu.

##########################################################################
# contributor: Valeria Aguilar
###########################################################################

## ----|I learned that when using R it is important to check the available 
## packages already developed that might be usefull for my work before even 
## starting any programming
##########################################################################
# contributor: Jayro Toledo {base}
###########################################################################
## dat <- read.csv("C:/Users/r0816/Downloads/genotyped.allWhites.clinical_c_I50.chr1.csv.gz", sep="")

##########################################################################
# contributor: Jingwei Gu {base}
###########################################################################
## Tell R your command in the next line
fit <- lm( pain~trt + sex + time, data=dat )
summary( fit )
## write down the purpose of the above command
## ----| It is use to do the simple liner regression.

##########################################################################
# contributor: Victor Ortiz {base}
###########################################################################
flights %>%
  lm(flights,arr_time,dep_time)

# contributor: Min Lu {tidyverse} 
flights %>%
  lm(arr_time ~ dep_time, .) %>%
  summary()

##########################################################################
# contributor: Ibidolapo Okedara {base}
###########################################################################
x <- 10^-(1+2*1:9)
cbind(x, log(1+x), log1p(x), exp(x)-1, expm1(x))
## ----|The log function computes logarithms and the exp function computes 
# the exponential function. The command can be used when solving problems with 
# large numbers.

##########################################################################
# contributor: Ahmed Alnajar {tidyverse}
###########################################################################

## ----|In "ggplot" you could use geom_point()+geom_smooth() to customize the shape 
## and  the formate of the figure

flights <- read.csv("https://luminwin.github.io/BST625/flights.csv")

start_time_df <- Sys.time()
x <- subset(flights, carrier == "FL", select = c(dest, air_time))
end_time_df <- Sys.time()
end_time_df - start_time_df

library(tidyverse)
flightst <- as_tibble(flights)
start_time_tidy <- Sys.time()
x <- flightst %>%
  filter(carrier == "FL") %>%
  select(dest, air_time) 
end_time_tidy <- Sys.time()
end_time_tidy - start_time_tidy
#detach("package:tidyverse", unload=TRUE)

library(data.table)
DT <- as.data.table(flights)
start_time_DT <- Sys.time()
x <- DT[carrier == "FL",.(dest, air_time)]
end_time_DT <- Sys.time()
end_time_DT - start_time_DT
#detach("package:data.table", unload=TRUE)

## write down the purpose of the above command
## ----| data.table was faster by almost third the time needed for dataframes

# contributor: Min Lu {base} 
start_time_dfb <- Sys.time()
x <- flights[flights$carrier == "FL", c("dest", "air_time")]
end_time_dfb <- Sys.time()
end_time_dfb - start_time_dfb
## In {base} R, square bracket is faster than subset()
## But I am surprised that tidyverse tibble is the slowest

##########################################################################
# contributor: Kyle Grealis {base}
###########################################################################
fast_car<-function(power){
  cars<-subset(mtcars, hp>power, select=c(disp, hp, qsec))
  print("LET'S GO!")
  cars
}
fast_car(200)
## write down the purpose of the above command
## ----|This creates a function that searches the 'mtcars' dataset for cars 
## with horsepower greater than the value entered into the function. 
## Then it prints "LET'S GO!" followed by the results: car type, displacement, 
## horsepower, and quarter-mile time in seconds. (Example: 200hp)


##########################################################################
# contributor: Peiyu Zhu {maps}
###########################################################################
library(maps)
map("state", fill = TRUE, col = rainbow(209),
    mar = c(0, 0, 2, 0))
title("American map")
detach("package:maps", unload=TRUE)
## write down the purpose of the above command
## ----|I learned how to make a American map by R.

##########################################################################
# contributor: Eva Agasse {base}
##########################################################################
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
chisq.test(dat$trt, dat$sex , correct = TRUE,
           p = rep(1/length(x), length(x)), rescale.p = FALSE,
           simulate.p.value = FALSE, B = 2000)
## write down the purpose of the above command
## ----|The purpose of the above command is calculate the Chi-square value of two variables 
# (treatment and sex) within the att dataset. 

##########################################################################
# contributor: Xinyi Liao {base}
###########################################################################

#Learning some simple statistic funciton:
student.pr <- princomp(dat, cor = T)
## write down the purpose of the above command
## ----| means principal component analysis with related factors

# contributor: Min Lu {base} 
datw <- reshape(dat, v.names = "pain", idvar = "id",
                timevar = "time", direction = "wide")
student.pr <- princomp(datw[,paste("pain", 1:6, sep = ".")], cor = T)
summary(student.pr)
plot(student.pr)
##########################################################################
# contributor: Hannah Cranford {tidyverse}
###########################################################################
favorite_desserts <- list(Sophia = "banana bread", Eliott = "pancakes", Karina = "chocolate
cake")
favorite_desserts %>% map_chr(~ paste(.x, "rocks!"))


mtcars %>% map_dbl(sum)


## write down the purpose of the above command
## ----|I have been exploring map functions. There are many different types (under purrr
# package). Two basic ones are above: The first shows map_chr() which returns a character
#vector after applying a function to each element of a list. The second shows map_dbl() which
# returns a double atomic vector after applying a function to each element of a vector.

##########################################################################
# contributor: Hannah Cranford {tidyverse::ggplot2}
###########################################################################
ggplot(mpg, aes(cyl, hwy)) +
  geom_jitter() +
  labs(x = "Number of cylinders", y="Highway miles per gallon")

## write down the purpose of the above command
## ----| Geom_jitter() is an aesthetic function that can be used in place of
# geom_point(position = "jitter"), which shows a small amount of random variation at the
# location of each point that can be used with overplotting

##########################################################################
# contributor: Kyle Grealis {base}
###########################################################################
## Tell R your command in the next line
check_use <-function(x){
  library(cowsay)
  if(substring(x,1) %in% rownames(installed.packages()) == FALSE) {
    install.packages(substring(x,1))
  }
  library(x, character.only=TRUE)
  say('Kyle accepts Bitcoin, Ethereum, and Algorand payments', by='frog', what_color='green',
      by_color='green')
}
check_use('sandwich')

detach("package:cowsay", unload=TRUE)

## write down the purpose of the above command
## ----|Adding some more fun to the previously-created function. Draws a frog with a quote
## when you use the function to check for/install a package or library

