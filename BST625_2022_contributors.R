###################################################################	
### 
### BST 625 Contributors' work
###
###################################################################

#  Alexandra McMahon

## Tell R your command in the next line
help(hist) 
## write down the purpose of the above command
## ----|help with histogram command

# Alireza Abdshah
## Tell R your command in the next line
#old.packages()
#update.packages(ask=FALSE)
## write down the purpose of the above command
## to see which packages are out of date, and update all of them at the same time ----|

##  Alex Stewart
#I have learned that packages inside of R can be used to add tons to the 
#functionality to the system overall. Including packages to make better graphs
#like ggplot and graphics!

### Yina Wang
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
t.test(pain~sex, data=dat)


### Rebe Silvey

#Simple scatterplot of pain intensity by age
Age <- dat$age
Pain <- dat$pain
plot(Age, Pain, main="Pain Intensity by Age Scatterplot")


## Min Lu
# a small change: 
plot(Age, Pain, main="Pain Intensity by Age Scatterplot", cex = Pain)
# a bigger change
dat <- reshape(dat, v.names = "pain", idvar = "id",
               timevar = "time", direction = "wide")
dat$Avg_Pain <- rowMeans(dat[,paste("pain", 1:6, sep = ".")], na.rm = TRUE)
dat$age_grp <- cut(dat$age, c(10*2:9))
barplot(table(round(dat$Avg_Pain), dat$age_grp),beside = TRUE)


## Omar qadi

f_to_c <- function(temp_F) {
  temp_C <- (temp_F - 32) * 5 / 9
  return(temp_C)
}
f_to_c(72)
## [1] 22.22222
## write down the purpose of the above command
## ----| Converts Fahrenheit to Celsius

## Aaron Ruby, MS Biostatistics 
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
table(dat$pain, useNA = 'always')
## Count the number of times of occurrences of each value (including NA values) in the ‘pain’ column of the dat table.


## Sophie Cen
library(foreign)
sav <- system.file("files", "electric.sav", package = "foreign")
dat <- read.spss(file=sav) 
## If you want to share something in English, write down your answer after "## ---|" in the next line.
## ---- Now I can read SPSS in R. Awesome!

## Min Lu: download shoulder.sav from our Blackboard
datsav <- read.spss("shoulder.sav") 

#  Omar Qadi; Bader Alsuliman
head(dat)
## write down the purpose of the above command

## ----|Provides a list of the first few rows of the data set for all the 
## variables in it
## Bethly Aubourg
head(dat,3)

## Chen Ye
## Tell R your command in the next line
dat<- data.frame(t=seq(0, 2*pi, by=0.1) )
xhrt <- function(t) 16*sin(t)^3
yhrt <- function(t) 13*cos(t)-5*cos(2*t)-2*cos(3*t)-cos(4*t)
dat$y=yhrt(dat$t)
dat$x=xhrt(dat$t)
with(dat, plot(x,y, type="l"))
## write down the purpose of the above command
## ----|draw a heart by R



### Nawaf Alhazmi
## Tell R your command in the next line
# R Program to find the multiplicationtable (from 1 to 10)
# take input from the user
num = as.integer(readline(prompt = "Enter a number: "))
## Enter a number:
# use for loop to iterate 10 times
for(i in 1:10) {
  print(paste(num,'x', i, '=', num*i))
}

## write down the purpose of the above command
## ----| To design Multiplication Table

# Min Lu
## slide 14 on R4_statistical_model.ppt
res <- binom.test(x = 2, n = 25, conf.level = .95)
p <- res$estimate
y <- c()
for (i in 1:200){
  x <- mean(rbinom(n = 25, size = 1, prob = p))
  y <- c(y,x)
  Sys.sleep(0.1)
  plot(table(y), type = "h", xlim = c(0,1), ylim = c(0,60))
  cat("\r","finish experiment", i)
}


### about duplicated rows:
## Vaughn Edelson
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
duplicated(dat)

## Kayla Taylor, Master of Public Health (MPH)
unique(dat)

## Min Lu: unique() is the same as Vaughn's
dat[!duplicated(dat),]

## Min Lu: for "nodupkey" (SAS) --- no duplicated id:  Slide 17 on R7_review_additional.ppt

dat[which(!duplicated(dat$id)), ]

## Daniel Martinez
even <- seq(1, nrow(dat), 2)
odd_dat<-dat[ even ,]
## write down the purpose of the above command
## ----| Removed all even ID rows.

## Meghal Samir Desai
# Create a numeric vector
air_time <- c(156, 153, 149, 223)
mean(air_time)
## [1] 170.25
max(air_time) 
## [1] 223
min(air_time) 
## [1] 149
## write down the purpose of the above command
## ----| The purpose of the above command is to find out the average, minimum
# and maximum air time of flights. ---

## Arielle Bell
Pain_long <- dat$pain
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(table(match(v, uniqv)))]
}
result <- getmode(Pain_long)
print(result)
## [1] 0
mode(Pain_long)
## [1] "numeric"
## write down the purpose of the above command
## ----| To find the mode for both numeric or character variables
## If you want to share something in English, write down your answer after  "## ---|" in the next line.
## ----| Since Pain_long had 246 observations with a range between 0 and 4, I
# wanted to find which integer between 0 and 4 occured the most often. I 
# from Google. Hint: a function is in the format of functionname(). 
# assumed that the code would be mode(Pain_long). However, the output was 
# "numeric", which is not correct. Lines 57-60, create the mode function. Line 
# 62-63 give the mode for Pain_long.

## Bader alsuliman
summary(Pain_long)
table(Pain_long)

##  Nawaf Alhazmi
flights <- read.csv("https://luminwin.github.io/BST625/flights.csv")
summary(flights)
#summary is a generic function used to produce result summaries of the
#results of various model fitting functions


## Min Lu
############################# slide 21 from R5_Explor_data_analy_Own_func.ppt
mySummary <- function(x){
  
  if (is.character(x)){
    
    table(x) %>% 
      sort(decreasing = TRUE) %>%
      head()
    
  } else {
    summary(x)
  }
  
}
############################# use the above function just like HW6
lapply(dat, mySummary) 
lapply(esoph, mySummary) 


### Mary Gorora
sex <- dat$sex
sex <- factor (sex)
levels (sex) <- c("Male", "Female")
my_table <- table (sex, Pain_long)
barplot(my_table,
        
        main = "Total Pain Intensity Ratings by Sex",
        
        xlab = "Pain Intensity Rating",
        
        ylab = "Number of Reports",
        
        col = c("blue", "pink"),
        
        legend.text = rownames (my_table),
        
        beside = TRUE)

## write down the purpose of the above command
## ----|First, I changed the "sex" variable to a two-level factor (male, 
#female). Then, I created a new table for the new factor "sex" and the 
#previously created "Pain_long". This was done to narrow down the items I 
#would need to create a clustered barplot. Next, I created a barplot based 
#upon the table and labeled the axes. Next, I changed the colors to blue 
#(representing male) and pink (female). I used the line "beside=TRUE" because 
#I wanted the graph to read easier when comparing the quantity of reports for 
#each pain intensity rating.
## If you want to share something in English, write down your answer after 
#"## ---|" in the next line.
## ----|I found that creating the graph on R is much easier than SAS. The 
#only thing I will have to get used to in this program is not capitalizing all
#my words in the syntax


## Ye Chen 
library(tidyverse)
flights <- read_csv("https://luminwin.github.io/BST625/flights.csv")
install.packages("gganimate")
library(gganimate)
p<-ggplot(flights) +
  geom_point(mapping = aes(x = carrier, y = distance))
plot(p)

# Joann Seunarine

# In trying to attempt to learn a new code that might have helped with
# me the homework but did not work, i learned about the EXCEPT function. 
# tryExcept(expr, except = { }, error = function(e) { }) is used for errors; 
# evaluates an expression, and if the expression raises an error it then 
# evaluates a second expression. I also learned that ! the Logical NOT operator
# this operator takes each element of the vector and gives the opposite logical
# value. I also learned that %>% is a combination of two operators. %% gives 
# the remainder of the first vector with the second, > checks if each element 
# of the first vector is greater than the corresponding element of the second 
# vector

## Min Lu: tryExcept is from package {infix}. I recommend tryCatch from {base} R
## how to give error in r
## mimic an error: after an error, the rest of the code won't be implemented
for (i in 1:10) {
  print(i)
  if (i==7) stop("Urgh, the iphone is in the blender !")
}

## after an error, the rest of the code will still be implemented
for (i in 1:10) {
  tryCatch({
    print(i)
    if (i==7) stop("Urgh, the iphone is in the blender !")
  }, error=function(e){cat("ERROR :",conditionMessage(e), "\n")})
}

## Min Lu: %>% alone is a operater that passing its left as the first argument to its right function


library(tidyverse)
## Victoria Rico
#I learned how to group together codes with the pipe operator. it is 
# easier to go step by step to avoid mistakes, however; it is nice to see the 
# code together to make sure I did it correct

flightsb <- read_csv("https://luminwin.github.io/BST625/flights.csv")
## Mary Gorora
flightsb %>%
  filter(origin != "LGA") %>%
  filter(day == 1) %>%
  select(dest, distance, air_time, everything()) %>%
  arrange(desc(distance))

## ----|I learned that the "!" means that it will output the opposite of 
## sew all the steps together.
## whatever follows it. For example, when we typed (origin ! = EWK), the output 
## would be all answers except EWK. Also, when you are filtering things, you use
## one "=" for variables that are characters, but you use two "==" when the 
## variable is a number. In addition to this, using the pipe operator helps to 

# Teja Henry
flights %>%
  group_by(hour) %>%
  summarise(arr_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(arr_delay)

##  Leah Dodds
## Tell R your command in the next line

## trt == 1 ~ "control"

## write down the purpose of the above command
## ----| I was initially confused about using the "==" which I now know helps
## us to denote whether or not the condition is TRUE/FALSE. This syntax I wrote 
## check to see if trt variable equals to 1 then select and rename as "control".


## Alessandra Maggioni
remotes::install_cran("tidyverse",force=TRUE)
## write down the purpose of the above command
## Because I continuously had error messages in installing tidyverse, 
## specifically lubridate, I found a way to force the install, and install the 
## packages independently which can be seen in lines 34-37.

install.packages("apaTables")
# Michaela Larson
library(apaTables)
apa.cor.table(
  data=mtcars,
  filename = "correlations_hw4.doc",
  table.number = 1,
  show.conf.interval = TRUE,
  show.sig.stars = TRUE,
  landscape = TRUE
)
## write down the purpose of the above command
## ----|Creates a word document with a table of correlations in APA style!


##  Ruth De Mesa

dat <- read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
head(dat %>%
       rename(gender = sex))

## Min Lu: if you use read_csv() then you don't need to use head() for tibble
##         head() is more useful for read.csv() that will give you a data.frame
dat %>%
  rename(gender = sex)

## Yina Wang
a <- tibble(X1 = LETTERS[1:3],
            
            X2 = 1:3)
b <- tibble(X1 = c("A", "B", "D"),
            
            X3 = c("T", "F", "T"))

left_join(a, b, by = "X1")

a %>% left_join(b, by = "X1")

right_join(a, b, by = "X1")

inner_join(a, b, by = "X1")

full_join(a, b, by = "X1")

## ----|The purpose is to merge two tables.

## Catherine Campos
## ----|R studio is easier to use when compared to SAS.

## Sophie Ying Cen

# need Internet connection
## for phrase searching you may use (escaped) double quotes or brackets
RSiteSearch("{logistic regression} \"glm object\"")
## A search query has been submitted to https://search.r-project.org
## The results page should open in your browser shortly
RSiteSearch('"logistic regression"')
## A search query has been submitted to https://search.r-project.org
## The results page should open in your browser shortly
## write down the purpose of the above command
## ----| RSiteSearch(“keyword”) will open a browser window and return a 
# search for “keyword” in various documentation, such as R manuals, help pages 
# of base and CRAN packages, vignettes, task views and others.THIS IS SO 
#AWESOME!!! Love this one!!!


## Vaughn Edelson   Carly Davis
library(ggplot2)
# Create data frame for a n-level christmas tree
# - specify 2*n bars (but have only n unique values)
# - set divergence values (values at the same level should differ only in the sign)
# - set labels for different parts of the tree
df <- data.frame("wish" = c("YS", "YS", "IDA", "IDA", "HOL", "HOL",
                            
                            "PY", "PY", "HAP", "HAP"),
                 
                 "pos" = c(0.75, -0.75, 3.5, -3.5, 2.5, -2.5,
                           
                           1.5, -1.5, 0.3, -0.3),
                 
                 "part" = c(rep("bottom", 2), rep("tree", 6), rep("star", 
                                                                  2)))
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



## Aaron Ruby
## Tell R your command in the next line
qf(0.05, 6, 24, lower.tail=FALSE)
## [1] 2.508189
## write down the purpose of the above command
## ----|I used this command to calculate the F value for a study with 6 
## independent variables and n=31, where alpha shoud be 0.05. This was useful 
## for a homework problem in BST703

## Dora Marcelin 
# sample.mean <- mean(variable)
# sample.n <- length(variable)
# sample.sd <- sd(variable)
# sample.se <- sample.sd/sqrt(sample.n)
# alpha = 0.05
# degrees.freedom = sample.n - 1
# t.score = qt(p=alpha/2, df=degrees.freedom,lower.tail=F)
# margin.error <- t.score * sample.se
# lower.bound <- sample.mean - margin.error
# upper.bound <- sample.mean + margin.error
# print(c(lower.bound,upper.bound))
## write down the purpose of the above command
## I learned about Confidence Intervals by myself. Confidence intervals are 
#one method to express how good an estimate is; the broader the 95% confidence
#interval for a certain estimate, the more caution is necessary when adopting 
#the estimate. Confidence intervals serve as a crucial reminder of the 
#estimates' limitations.


## Bethly Aubourg
print (flights%>%drop_na())

## Min Lu: we can but we don't prefer putting space after a function: instead of
##         print (), we use print()

## Diana Hernandez Payano

## Tell R your command in the next line
a = c(1, 2, 3, 4 ,5, 6, 7)
b = c("(blue", "yellow", "green", "orange", "black", "white", "pink")
c = c("monday", "tuesday", "wednesday", "thursday", "friday", "saturday", 
      "sunday")

#The list() function in R is used to create a list of elements of 
#different types. A list can contain numeric, string, or vector elements.

## Min Lu
list(a, b, c) ## unnamed list
list(a = a, b = b, c = c) # named list



## Anastasiya Drandarov
counts <- table(flights$carrier)
barplot(counts, main="Carrier Distribution", 
        xlab="Number of Carriers")

## write down the purpose of the above command
#this command sorts and counts the carriers of each type

## Belen Hervera
ggplot (data = flights) + geom_bar (aes(x=carrier), stat = "count")
## write down the purpose of the above command
## ----| Used a the ggplot command to create a barplot for the categorical 
# variable "carrier

## Chen Ye

library(lattice)
dat <- read.csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
dat <- reshape(dat, v.names = "pain", idvar = "id",
               timevar = "time", direction = "wide")
#dat$Avg_Pain <- rowMeans(dat[,paste("pain", 1:6, sep = ".")], na.rm = TRUE)
dat$age_grp <- cut(dat$age, c(10*2:9))
xyplot(pain.1 ~ pain.2,
       data = dat,
       group = age_grp,
       auto.key = TRUE)

## write down the purpose of the above command
## ----| I use the pain1,pain2 and age as a group with another package which 
# has a scatter plot

# Rebe Silvey?
library(devtools)
install_github("Gibbsdavidl/CatterPlots")
library(CatterPlots)
x <- -10:10
y <- -x^2 + 10
rainbowCats(x, y, yspread=0.05, xspread=0.05, ptsize=2, catshiftx=0.5, 
            catshifty=-0.2, canvas=c(-0.5,1.5,-1,1.5))

## Leah Dodds
dat <- read_csv("http://courses.washington.edu/b517/Datasets/shoulder.csv")
dat <- dat %>%
  pivot_wider(names_from = time, 
              
              values_from = pain, 
              
              names_prefix = "pain")
dat%>%
  ggplot(aes(x = factor(1), fill = factor(sex))) +
  geom_bar(stat = "count") + #### now the magic happens
  coord_polar(theta = 'y') +
  labs(fill = "Sex") +
  xlab(" ") +
  theme(legend.title = element_text(size=18),
        
        axis.text = element_text(size = 12),
        
        axis.title = element_text(size = 14, face = "bold"))

## Sophie Ying Cen


summary(women$height) # refers to variable 'height' in the data frame
attach(women)

summary(height) 
# The same variable now available by name
#height <- height*2.54 # Don't do this. It creates a new variable

# in the user's workspace
## write down the purpose of the above command
## ----| The database is attached to the R search path. This means that the 
# database is searched by R when evaluating a variable, so objects in the 
# database can be accessed by simply giving their names

## Min Lu: use detach() after the task to make your environment clean

#### Alireza Abdshah
newdat<-dat%>%mutate(Avg_Pain=rowMeans(select(.,pain1:pain6)))

ggplot(newdat, aes(x=age_group, y=Avg_Pain, color=treatment_group, 
                   fill=treatment_group)) +
  geom_point() +
  geom_smooth(method="lm") +
  facet_wrap(~sex) +
  theme_classic()
## write down the purpose of the above command
## facet_wrap helps us create separate graphs next to each other, based on a 
#variable we define (here I used sex, and the theme offers us a range of 
#                    graphical rendering to our graphs.----


##### Yina Wang
library(mapchina)
head(china)
library(sf)
library(tidyverse)
library(sf)
df <- china %>%
  filter(Code_Province %in% c("11","12","13"))

ggplot(data = df) +
  
  geom_sf(aes(fill = rank(Density))) +
  
  scale_fill_distiller(palette = "BuPu", direction = 1) +
  
  theme_bw() +
  
  theme(legend.position = "none")

df$Var <- runif(nrow(df))
ggplot(data = df) +
  
  geom_sf(aes(fill = Var)) +
  
  scale_fill_distiller(palette = "YlOrRd") +
  
  theme_bw() +
  
  theme(legend.position = "none")
## write down the purpose of the above command
## ----| Plotting the population density rank of Beijing, Tianjin, and Hebei.

#################  Bethly Aubourg; Darlene Louis Charles (have to use the following inside of R Markdown)

#install.packages("tm")
#install.packages("SnowballC") # for text stemming
#install.packages("wordcloud") # word-cloud generator 
#install.packages("RColorBrewer") # color palettes
#install.packages("tidyverse")
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)
library (tidyverse)
#Read the text file from internet
filePath <- "http://www.sthda.com/sthda/RDoc/example-files/martin-luther-
king-i-have-a-dream-speech.txt"
#Assign the file as a text object
text <- readLines(filePath)
docs <- Corpus(VectorSource(text))
inspect(docs)

toSpace <- content_transformer(function (x , pattern ) gsub(pattern, " ", x))
docs <- tm_map(docs, toSpace, "/")
docs <- tm_map(docs, toSpace, "@")
docs <- tm_map(docs, toSpace, "\\|")
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove your own stop word
# specify your stopwords as a character vector
docs <- tm_map(docs, removeWords, c("blabla1", "blabla2")) 
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming
#docs <- tm_map(docs, stemDocument)
dtm <- TermDocumentMatrix(docs) #Create a term document matrix summary.
m <- as.matrix(dtm) #Unpack the summary into a matrix.
v <- sort(rowSums(m),decreasing=TRUE) #Count the words.
d <- data.frame(word = names(v),freq=v) #convert the count into a data frame.
head(d, 10) #Display top 10 words in terms of frequency
set.seed(1234) #For replicability
wordcloud(words = d$word, freq = d$freq, min.freq = 1,
          
          max.words=200, random.order=FALSE, rot.per=0.35, 
          
          colors=brewer.pal(8, "Dark2"))
## write down the purpose of the above command
## ----| I learn the above command to generate a word cloud in R based on 
#term frequency. I used Dr Martin Luther King 's speech "I have a dream" to do
# this word cloud

# Vaughn Edelson

## write down the purpose of the above command
## ----| I will not have a career in statistics, so throughout this course I 
# have been trying to find applications of SAS and R that will be useful for my
# work as a project manager at Sylvester. I organize courses and events and we 
# always collect evaluations from participants. Both SAS and R can be used to 
# make it easier to analyze the survey results. For example, we use a lot of 
# Likert scale questions, so I can create numeric variables to replace 
# "Excellent, Good, Average, Poor" responses (or "strongly agree, somewhat 
# agree," etc.) and then create average scores for each item we asked about. 
# Once I write the code, I can just read in the spreadsheets and do my data 
# analysis in R. I was also reading about all the different real-world uses of 
# R: for example, Google uses R to improve efficiency of online advertising; 
# the New York Times uses R to analyze data and prepare graphics for print and 
# online. Overall it seems like R is used in a lot of fields/companies that use
# recommendations; R is used to conduct the analytics to segment customers for 
# advertising, e-commerce, etc.

# Anastasiya Drandarov
cor.test(dat$age,dat$Avg_Pain,use="complete.obs",method="pearson")

## write down the purpose of the above command
## this coefficient determines the degree to which a relationship between two
# variables is linear,
## in this case since r= -0.286 the relationship are far from linear and the 
#slope is negative

# Meghal Samir Desai
## Tell R your command in the next line
#install.packages("plotrix")
library(plotrix)
plot(1:10,type="n")
draw.circle(2,8,1)

# Nawaf Alhazmi; Omar Qadi; Bader Alsuliman; Said Abdelrhman; Kayla Taylor; Leopoldine Colom
dat <- dat %>%
  mutate(
    age_grp = cut(age, breaks=c(-Inf, seq(24,75,10), Inf),
                  labels=c("24-","25-34","35-44","45-54","55-64","65-74","75+")),
    ct_grp = ifelse(trt == 1, "control", "treatment")
  ) 
ggplot(dat,mapping = aes(x = age_grp)) +
  geom_bar(aes(fill = ct_grp), position = position_stack(reverse = TRUE)) +
  theme(legend.position = "right") +
  labs(x = "Age Group", y= "Count Number", fill = "Control/Treatment")
## write down the purpose of the above command
## ----| The command plots and the bar plot for every age group to compare 
# the size of individuals per group treatment.


# Teja Henry
## write down the purpose of the above command
## ----| I learned you can add color commands to distinguish between 
#different groups within the same graph or chart. I also learned you can bind 
#columns with cbind and look at normal distributions with rnorm.

