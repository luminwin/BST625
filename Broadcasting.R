###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

install.packages("sqldf") ## after installation, add # in front to put it in comment 
# install.packages("RSQLite") 
library("sqldf")

sqldf("SELECT mpg, cyl FROM mtcars")

sqldf("SELECT mpg cyl FROM mtcars") # this gives you wrong answer; use ,

sqldf("SELECT * FROM mtcars")
sqldf("select * from mtcars")
sqldf('select * from mtcars')

sqldf("SELECT MPG, CYL FROM mtcars") # not case-sensitive except the name of the dataset
# sqldf("select * from MTCARS") # this does not work

sqldf("SELECT 'MPG', 'CYL' FROM mtcars") # this does not work
sqldf('SELECT "MPG", "CYL" FROM mtcars') # this works

sqldf("SELECT mpg as miles_gallon, cyl as N_cylinders FROM mtcars") ## too long so I did the following for seperate lines

sqldf("SELECT mpg as miles_gallon,  
              cyl as N_cylinders
      FROM mtcars")

## don't have to have   as
sqldf("SELECT mpg miles_gallon,     
              cyl N_cylinders
      FROM mtcars")



sqldf('SELECT * FROM mtcars LIMIT 5')

sqldf("SELECT * FROM mtcars ORDER BY mpg LIMIT 5")

sqldf("SELECT * FROM mtcars ORDER BY mpg ASC LIMIT 5")

sqldf("SELECT * FROM mtcars ORDER BY mpg ASC, cyl DESC LIMIT 5")


sqldf('SELECT * FROM mtcars WHERE cyl = 8')

sqldf("select cyl, count(*) from mtcars group by am")

sqldf("select cyl, am, count(*) from mtcars group by am")

sqldf("select cyl, am, count(*) as frequency from mtcars group by am")

sqldf('select distinct am    
       from mtcars')

sqldf('select distinct *    
       from mtcars')

##  int, real, char,
sqldf('select 
          cast(drat as int) dratint,    
          mpg 
      from mtcars LIMIT 5')


############################
# {sqldf}
# In class exercise
############################

head(Orange)

### please list age and circumference for Tree type 1 and sort circumference in an ascending order

sqldf('SELECT age, circumference FROM Orange WHERE Tree = 1
      ORDER BY circumference ASC')

sqldf("select case
                  when vs == 1 then 'straight'
                  when vs == 0 then 'V-shaped'
              end as vschar
       from mtcars limit 5")

## it looks strange if you don't give it a new name
sqldf("select case
                  when vs == 1 then 'straight'
                  when vs == 0 then 'V-shaped'
              end 
       from mtcars limit 5")

library(tidyverse)
mtcars %>% 
  mutate(vschar = case_when(
    vs == 1 ~ 'straight',
    vs == 0 ~ 'V-shaped'
  ))


sqldf('select avg(mpg), vs 
        from mtcars 
        group by vs')

sqldf('select avg(mpg) 
        from mtcars 
        group by vs')

sqldf('select avg(mpg) over (partition by "vs")
        from mtcars')

sqldf('select avg(mpg) 
        from mtcars 
        group by cyl having vs = 0')

############################################
# {sqldf}
# Subquery  from (select from) 
############################################

tmp <- sqldf('select *,
              mpg - avg(mpg) over (partition by "vs") as centermpg
              from mtcars')

sqldf('select avg(centermpg) 
        from tmp 
        where centermpg > 0 
        group by gear')

### merge above, we have a subquery

sqldf('select avg(centermpg) 
        from (
        select *,
              mpg - avg(mpg) over (partition by "vs") as centermpg
              from mtcars
        ) 
        where centermpg > 0 
        group by gear')

############################
# {sqldf}
# In class exercise
############################

######## can you merge the following two command into a subquery

tmp <- sqldf('select 
       "Species", 
       "Sepal.Length", 
       "Sepal.Length" - avg("Sepal.Length") over (partition by "Species") as "above.mean" 
       from iris')

sqldf('select "Species", avg("Sepal.Length") 
        from tmp 
        where "above.mean" > 0 
        group by "Species"')



sqldf('select "Species", avg("Sepal.Length") 
        from (
        select 
       "Species", 
       "Sepal.Length", 
       "Sepal.Length" - avg("Sepal.Length") over (partition by "Species") as "above.mean" 
       from iris
        ) 
        where "above.mean" > 0 
        group by "Species"')


demo <- read.csv("https://luminwin.github.io/BST625/demo.csv")
treatA <- read.csv( "https://luminwin.github.io/BST625/treatA.csv")
treatB <- read.csv( "https://luminwin.github.io/BST625/treatB.csv")


sqldf("select ID, age from demo as d")
sqldf("select d.ID, d.age from demo as d")

demotreatA <- 
  sqldf("select * 
         from demo as d 
            left join treatA as a
               on d.ID = a.ID")

demotreatA <- 
  sqldf("select d.ID, d.age, a.esophagectomy 
                 from demo as d 
                    left join treatA as a
                        on d.ID = a.ID")

sqldf("select d.*, a.esophagectomy 
                 from demo as d 
                    left join treatA as a
                        on d.ID = a.ID")

sqldf("select d.ID, d.age, a.esophagectomy 
                 from demo as d right join treatA as a
                        on d.ID = a.ID")

### we can switch order for right join  
sqldf("select d.ID, d.age, a.esophagectomy 
                 from treatA as a 
                    left join demo as d 
                        on d.ID = a.ID")

### left join (if null)
sqldf("select d.*, a.esophagectomy 
                 from demo as d 
                    left join treatA as a
                        on d.ID = a.ID
          where esophagectomy is NULL")

sqldf("select d.ID, d.age, a.esophagectomy 
                 from treatA as a 
                    inner join demo as d 
                        on d.ID = a.ID")

## we can rename the columns as before 
sqldf("select d.ID, d.age, 
                a.esophagectomy as Esoph
                 from treatA as a 
                    inner join demo as d 
                        on d.ID = a.ID")

sqldf("select d.ID, d.age, a.esophagectomy, b.neoadjuvant
                 from demo as d 
                      left join treatA as a
                        on d.ID = a.ID
                      left join treatB as b
                        on d.ID = b.ID")

### I want to manipulate treatA before left join like this

sqldf("select *, esophagectomy as Esoph from treatA")

### Let's do subquery again!

sqldf("select d.ID, d.age, a.esophagectomy, b.neoadjuvant
                 from demo as d 
                      left join (select *, esophagectomy as Esoph from treatA) as a
                        on d.ID = a.ID
                      left join treatB as b
                        on d.ID = b.ID")

### coalesce for NAs

sqldf("select d.ID, *,
              coalesce(a.esophagectomy, b.neoadjuvant, 'unknown') as treat
                 from demo as d 
                      left join treatA as a
                        on d.ID = a.ID
                      left join treatB as b
                        on d.ID = b.ID")

### I want to recode these "yes" and "no"

sqldf("select *, case
                  when esophagectomy == 'Yes' then 'Esoph'
                  when esophagectomy == 'No' then 'No-Esoph'
              end as Esoph  
      from treatA")

sqldf("select *, case
                  when neoadjuvant == 'Yes' then 'Neo'
                  when neoadjuvant == 'No' then 'No-Neo'
              end as Neo  
      from treatB")

### Let's do subquery again!

sqldf("select d.ID, *,
              coalesce(a.Esoph, b.Neo, 'unknown') as treat
                 from demo as d 
                      left join (
                      select *, case
                  when esophagectomy == 'Yes' then 'Esoph'
                  when esophagectomy == 'No' then 'No-Esoph'
                    end as Esoph  
                  from treatA
                      ) as a
                        on d.ID = a.ID
                      left join (
                      select *, case
                  when neoadjuvant == 'Yes' then 'Neo'
                  when neoadjuvant == 'No' then 'No-Neo'
                    end as Neo  
                        from treatB
                      ) as b
                        on d.ID = b.ID")

sqldf("select d.ID, *,
              coalesce(a.Esoph, b.Neo, 'unknown') as treat
                 from demo as d 
                      left join 
                      (select *, case
                  when esophagectomy == 'Yes' then 'Esoph'
                  when esophagectomy == 'No' then 'No-Esoph'
                  end as Esoph  
                       from treatA)
                       as a
                        on d.ID = a.ID
                      left join 
                      (select *, case
                  when neoadjuvant == 'Yes' then 'Neo'
                  when neoadjuvant == 'No' then 'No-Neo'
                  end as Neo  
                      from treatB)
                        as b
                        on d.ID = b.ID")

### some fancy coalesce
sqldf("select d.ID, *,
              coalesce(a.Esoph, '-') || coalesce(b.Neo, '-') as treat
                 from demo as d 
                      left join 
                      (select *, case
                  when esophagectomy == 'Yes' then 'Esoph'
                  when esophagectomy == 'No' then 'No-Esoph'
                  end as Esoph  
                       from treatA)
                       as a
                        on d.ID = a.ID
                      left join 
                      (select *, case
                  when neoadjuvant == 'Yes' then 'Neo'
                  when neoadjuvant == 'No' then 'No-Neo'
                  end as Neo  
                      from treatB)
                        as b
                        on d.ID = b.ID")

############################################
# {tidyquery} from R studio
# Translate SQL to tidyverse
# Combine SQL with tidyverse
############################################
install.packages("tidyquery") ## after installation, add # in front to put it in comment 
library("tidyquery")

query("SELECT Species, COUNT(*) AS a FROM iris GROUP BY Species")

iris %>%
  filter(Species != "setosa") %>%
  query("SELECT Species, COUNT(*) AS n GROUP BY Species") %>%
  arrange(desc(Species))

show_dplyr("SELECT Species, COUNT(*) AS n FROM iris GROUP BY Species")

library("tidyverse")
install.packages("dbplyr") ## after installation, add # in front to put it in comment 
library("dbplyr")

iris_db <- dbplyr::tbl_memdb(iris, name = "iris_db") # Create a database table in temporary in-memory database
iris_db %>%
  group_by(Species) %>%
  summarise(n = n())

iris_db %>%
  group_by(Species) %>%
  summarise(n = n()) %>%
  show_query()



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
dat <- as.data.frame(read.spss(file=sav) )
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