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
# contributor: Frank Gutierrez {base}
###########################################################################
mean(dat$age, trim = 0.10)
## write down the purpose of the above command
## ----|The purpose of the above command is to have the lowest and highest 
## value trimmed. So the trim will use the middle 80% of the data for both age and treatment. 

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

df %>% group_by(group) %>% slice_head(prop = 0.8)
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
## genotyped.allWhites.clinical_c_I50.chr1.csv <- read.csv("C:/Users/r0816/Downloads/genotyped.allWhites.clinical_c_I50.chr1.csv.gz", sep="")

##########################################################################
# contributor: Jingwei Gu {base}
###########################################################################
## Tell R your command in the next line
fit=lm( pain~trt + sex + time, data=dat )
summary ( fit )
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

##########################################################################
# contributor: Corinne Ferrari {tidyverse::ggplot2}
###########################################################################
library(tidyverse)

dat <-
  read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
dat <- pivot_wider(dat, names_from = time,
                   values_from = pain,
                   names_prefix = "pain"
)
dat <- dat %>%
  mutate(
    Avg_Pain = rowMeans(select(.,"pain1":"pain6")),
    age_grp =
      case_when(
        age < 25 ~ "24-",
        (25 <= age)&(age < 35) ~ "25-34",
        (35 <= age)&(age < 45) ~ "35-44",
        (45 <= age)&(age < 55) ~ "45-54",
        (55 <= age)&(age < 65) ~ "55-64",
        (65 <= age)&(age < 75) ~ "65-74",
        TRUE ~ "75+",
      ),
    ct_grp =
      case_when(
        trt == 1 ~ "control",
        TRUE ~ "treatment"
      )
  )

ggplot(dat, aes(x=sex, y=Avg_Pain)) +
  geom_area()


# contributor: Min Lu {tidyverse} 
## For each x value, geom_area() displays a y interval defined by ymin and ymax.
## so you want to choose continuous variable, intead of sex
ggplot(dat, aes(x=pain1, y=Avg_Pain)) +
  geom_area()


##########################################################################
# contributor:  Hatoun Alkamli  {base}
###########################################################################

list.dirs(R.home("doc"))
list.dirs(R.home("doc"), full.names = FALSE)

## write down the purpose of the above command
## ----| To produce a character vector of the names of files or directories in the named
##      directory.

# contributor: Min Lu {base} 
list.dirs()
##########################################################################
# contributor:  Frank Gutierrez {base}
###########################################################################

cone <- function(x,y){
  sqrt(x^2 + y^2)
}
x <- y <- seq(-1, 1, length = 40)
z <- outer(x, y, cone)
persp(x, y, z)

persp(x, y, z,
      main = "Perspective Plot of a 3D Cone",
      zlab = "Height",
      theta = 20, phi = 10,
      col = "Aquamarine", shade = 0.5)

## write down the purpose of the above command
## ----| The purpose of the above command is to create a 3D plot of a cone and also to create
##      a 3D surface in perspective view of a cone

##########################################################################
# contributor:  Rachelle Brick {base}
###########################################################################

boxplot(dat$Avg_Pain,
        notch = TRUE)

## write down the purpose of the above command
## ----| A different form of a boxplot is a "notched box plot". This allows you to assess
## whether the medians are different across groups. If the notches do not overlap, there is
## strong evidence (95% confidence) their medians differ. You add notches to a box plot by
## setting the notch argument to TRUE.

##########################################################################
# contributor:  Ifedioranma Anikpo {base}
###########################################################################
fahrenheit_to_celsius <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}
fahrenheit_to_celsius(120)

## write down the purpose of the above command
## ----|Created a function to convert temperature from Fahrenheit to Celsius, then converted
## 120F to C.

##########################################################################
# contributor:  Jessica Rivera {tidyverse}
###########################################################################

## Tell R your command in the next line

df <- tibble(x = c("a", "b"), n = c(1, 2))
uncount(df, n)
uncount(df, n, .id = "id")

# You can also use constants
uncount(df, 2)


## write down the purpose of the above command
## ----| Performs the opposite operation to dplyr::count(), duplicating rows according to a
## weighting variable (or expression).

##########################################################################
# contributor:  Xinyi Liao {base}
###########################################################################

x <- array(1:12, c(2, 3, 3))
colSums(x, dims = 1)

colSums(x, dims = 2)
## [1] 21 57 21
rv<- c("-0.1", " 2.7 ", "3")
as.numeric(rv)

## write down the purpose of the above command
## ----| # I learned how to use colSums function which can always be used in
## data.frame and table question.And how to change data type from character to
## numeric.

##########################################################################
# contributor:  Jingwei Gu {tidyverse}
###########################################################################

df <- data.frame(x = c(NA, "x.y", "x.z", "y.z"))
df %>% separate(x, c("A", "B"))

##########################################################################
# contributor:  Romita Sherlina Rajasekaran {tidyverse}
###########################################################################
## Tell R your command in the next line
library(ggplot2)
# Create data frame for a n-level christmas tree
# - specify 2*n bars (but have only n unique values)
# - set divergence values (values at the same level should differ only in the sign)
# - set labels for different parts of the tree
df <- data.frame("wish" = c("YS", "YS", "IDA", "IDA", "HOL", "HOL",
                            "PY", "PY", "HAP", "HAP"),
                 "pos" = c(0.75, -0.75, 3.5, -3.5, 2.5, -2.5,
                           1.5, -1.5, 0.3, -0.3),
                 "part" = c(rep("bottom", 2), rep("tree", 6), rep("star", 2)))
# Convert wish to factor, specify levels to have the right order
df$wish <- factor(df$wish, levels = c("YS", "IDA", "HOL", "PY", "HAP"))
ggplot(df, aes(x = wish, y = pos, fill = part)) + geom_bar(stat="identity") +
  coord_flip() +
  theme_minimal() +
  ylim(-5, 5) +
  theme(legend.position = "none",
        axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank()) +
  scale_fill_manual(values = c("#643413", "#FDBA1C", "#1A8017")) +
  geom_point(aes(x=3.7, y=0.5), colour="#CF140D", size=12) +
  geom_point(aes(x=2.5, y=-1), colour="#393762", size=12) +
  geom_point(aes(x=1.7, y=1.5), colour="#CF140D", size=12) +
  geom_point(aes(x=2.8, y=2.5), colour="#393762", size=12) +
  geom_point(aes(x=1.8, y=-2.8), colour="#CF140D", size=12)

## write down the purpose of the above command
## ----| I looked up cool things on things to do with R and you can create a Christmas tree. At
## first I copied and pasted it here but it did not work. Then i installed the ggplot to the library
## and then it worked. yay!! I made a Christmas tree.


##########################################################################
# contributor:  Haiyong Shu {tidyverse}
###########################################################################
dat %>%
  mutate(
    age_grp =
      case_when(
        age < 25 ~ "24-",
        (25 <= age)&(age < 35) ~ "25-34",
        (35 <= age)&(age < 45) ~ "35-44",
        (45 <= age)&(age <55) ~ "45-54",
        (55 <= age)&(age <65) ~ "55-64",
        (65 <= age)&(age <75) ~ "65-74",
        TRUE ~ "75+",
      ),
    ct_grp =
      case_when(
        trt == 1 ~ "control",
        TRUE ~ "treatment"
      )
  )
ggplot(dat) + geom_bar(mapping = aes(x = age_grp)) + labs(x = "Age Group", y="Count
Number") + ylim(0.0, 12.5)

## control the range of y by ylim(0, 12.5)
##########################################################################
# contributor:  Amrit Baral {tidyverse}
###########################################################################
numbers_1<-tibble(number_col=c("Number5", "$6", "7"))
numbers_1%>% mutate(number_col=parse_number(number_col))   

## write down the purpose of the above command
## ----|parse_number function extarcts the numerical component from the colum

##########################################################################
# contributor:  Eva Agasse  {base}
###########################################################################

## Tell R your command in the next line
#define x-values
x <- seq(0, 2, by=0.01)
#calculate gamma density for each x-value
y <- dgamma(x, shape=5)
#create density plot
plot(y)

## write down the purpose of the above command
## ----|The purpose of the above command is to create a probability density plot of a gamma
## distribution.Gamma distribution is used to model continuous variables that are always
## positive and have skewed distributions.

##########################################################################
# contributor:  Valeria Aguilar  {tidyverse}
###########################################################################
ggplot(dat) +
  geom_bar(mapping = aes(x = age_grp)) +
  labs(title= "Age Group Hystogram", x = "Age Group", y="Count Number") #adds a title to the
graph

##########################################################################
# contributor:  Peiyu Zhu  {base}
###########################################################################
cols <- terrain.colors(10)
head(cols)
## [1] "#00A600" "#2DB600" "#63C600" "#A0D600" "#E6E600" "#E8C32E"
## [1] "#00A600FF" "#2DB600FF" "#63C600FF" "#A0D600FF" "#E6E600FF"
"#E8C32EFF"
image(1:10,1,as.matrix(1:10),col=cols,
      xlab="terrain.colors(10)",
      ylab="",xaxt="n",yaxt="n",bty="n")


##########################################################################
# contributor:  Dingtian Cai   {base}
###########################################################################
## Tell R your command in the next line
dat_add_NA <- rbind(c(NA),dat)
## write down the purpose of the above command
## ----| Adding the NA at the first line of the data.


###########################################
# 2020 contributor: Antonela Peña {tidyverse}
###########################################

ggplot(flights[1:20,], aes(x=origin, y=dest)) +
  geom_line(aes(group=1), colour="#000099") +
  geom_point(size=3, colour="#CC0000")

#########################################################################
#
#         other courses for website building
#         Web Development : Web Lab CIM 103
#         https://cognates.miami.edu/ST_0032/archive/Spring/2022
#         arcgis website (google arcgis website to see their style)
#         https://www.coursicle.com/miami/courses/GEG/310/
#
#########################################################################