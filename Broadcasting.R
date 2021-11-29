###############################################################################################################
# This file broadcasts the R code for BST 625 from 9:00 am ~ 10:30 am From Oct 11th to Dec 1st.
# After the class, this file will be empty. You can find all the R code files for BST 625  in its Blackboard.
################################################################################################################

checkuse <-function(x){
  
  if(x %in% rownames(installed.packages()) == FALSE) {
    
    install.packages(x)
    
  }
  
  library(x, character.only = TRUE)
  
}

############################################
# {sqldf}
# Basic manipulation 
############################################
checkuse("sqldf")

sqldf("SELECT mpg, cyl FROM mtcars")

sqldf("SELECT mpg cyl FROM mtcars") # this gives you wrong answer; use ,

sqldf("SELECT * FROM mtcars")
sqldf("select * from mtcars")
sqldf('select * from mtcars')

sqldf("SELECT MPG, CYL FROM mtcars") # not case-sensitive except the name of the dataset
# sqldf("select * from MTCARS") # this does not work

sqldf("SELECT 'MPG', 'CYL' FROM mtcars") # this does not work
sqldf('SELECT "MPG", "CYL" FROM mtcars') # this works

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

sqldf("select cyl, am, count(*) from mtcars group by am")

sqldf("select am, count(*) as frequency from mtcars group by am")

sqldf('select distinct mpg    
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

sqldf("SELECT age, circumference FROM Orange 
      WHERE tree = 1
      ORDER BY circumference ASC")


sqldf("select *, case
                  when vs == 1 then 'straight'
                  when vs == 0 then 'V-shaped'
              end as vschar
       from mtcars limit 5")

library(tidyverse)
mtcars %>% 
  mutate(vschar = case_when(
    vs == 1 ~ 'straight',
    vs == 0 ~ 'V-shaped'
  ))

## it looks strange if you don't give it a new name
sqldf("select *, case
                  when vs == 1 then 'straight'
                  when vs == 0 then 'V-shaped'
              end 
       from mtcars limit 5")

sqldf('select vs, avg(mpg) as Avg_mpg
        from mtcars 
        group by vs')

sqldf('select avg(mpg) 
        from mtcars 
        group by vs')

sqldf('select *, avg(mpg) over (partition by "vs") as Avg_mpg
        from mtcars')

sqldf('select cyl,avg(mpg) 
        from mtcars 
        group by cyl having vs = 0')

############################################
# {sqldf}
# Subquery  from (select from) 
############################################

tmp <- sqldf('select *,
              mpg - avg(mpg) over (partition by "vs") as centermpg
              from mtcars')

sqldf('select gear, avg(centermpg) 
        from tmp 
        where centermpg > 0 
        group by gear')


sqldf('select gear, avg(centermpg) 
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
        from (select 
       "Species", 
       "Sepal.Length", 
       "Sepal.Length" - avg("Sepal.Length") over (partition by "Species") as "above.mean" 
       from iris) 
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

sqldf("select d.*, a.esophagectomy 
                 from demo as d 
                    left join treatA as a
                        on d.ID = a.ID")

sqldf("select d.*, a.esophagectomy, a.ID as treatAID 
                 from demo as d 
                    inner join treatA as a
                        on d.ID = a.ID")

### RIGHT and FULL OUTER JOINs are not currently supported
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

sqldf("select d.*, a.esophagectomy 
                 from demo as d 
                    left join treatA as a
                        on d.ID = a.ID
          where esophagectomy is not NULL")

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

sqldf("select d.ID, d.age, a.Esoph, b.neoadjuvant
                 from demo as d 
                      left join (
                      select *, esophagectomy as Esoph from treatA
                      ) as a
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
