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